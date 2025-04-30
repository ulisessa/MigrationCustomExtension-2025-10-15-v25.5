codeunit 50004 ExtensiónVentas
{
    trigger OnRun()
    begin
        
    end;


    var
        rstCabReparto: Record "Cab. Reparto";
        rstLinReparto: Record "Lín. reparto";
        rstCliente: Record Customer;
        rstConfVentas: Record "Sales & Receivables Setup";
        dlgReparto: Dialog;
        rstCabVenta: Record "Sales Header";
        strDocumento: Code[20];
        frmPedidosVenta: Page "Sales Order";

    [Scope('OnPrem')]
    procedure fntRegistroReparto(rstCabReparto: Record "Cab. Reparto"; rstLinReparto: Record "Lín. reparto"; blnRevertir: Boolean): Boolean
    var
        i: Integer;
        RegistroVisible: Boolean;
        "strCapitán": Text[30];
        rstConfUsu: Record "User Setup";
        cduMensajeria: Codeunit "Mensajería";
        rstMensajeria: Record Mensajeria;
        l_rstLinReparto: Record "Lín. reparto";
        rstConfEx: Record "Inventory Setup";
        rstProyecto: Record Job;
        blnImprimir: Boolean;
        rstPuerto: Record "Entry/Exit Point";
        rstCabPedido: Record "Sales Header";
        rstLinPedido: Record "Sales Line";
        Error1: Label 'No es posible revertir el reparto, porque el pedido de venta n° %1 ya tiene envíos. Antes de revertir el reparto, revierta el o los remitos relacionados.';
        rstCabRemito: Record "Cab. remito ventas";
        ReleaseSalesDoc: Codeunit "Release Sales Document";
        l_rstDCLAppl: Record "DCL Application Lines";
        Message1: Label 'Está revirtiendo un reparto relacionado a un CCC. ¿Desea revertir el CCC junto al reparto?';
    begin
        //Verificar los datos del reparto

        if not blnRevertir then begin

            Clear(rstConfVentas);
            rstConfVentas.Get();
            Clear(rstCliente);
            rstCliente.Get(rstCabReparto.Cliente);
            if (rstCliente."Customer Posting Group" = rstConfVentas."Grupo contable Exportaciones") then begin

                rstCabReparto.TestField(Cliente);
                rstCabReparto.TestField("Container type");
                rstCabReparto.TestField("Destination port");
                rstCabReparto.TestField("Sales conditions");
                //rstCabReparto.TESTFIELD(Transportista);

            end;

            GenerarPedido(rstCabReparto);

            Clear(rstConfVentas);
            rstConfVentas.Get();

            Clear(rstPuerto);
            rstPuerto.SetRange(rstPuerto.Code, rstCabReparto."Loading port");
            rstPuerto.FindFirst;

            Clear(cduMensajeria);
            Clear(rstConfUsu);
            Clear(rstMensajeria);

            Clear(rstCabVenta);
            rstCabVenta.SetRange(rstCabVenta."Document Type", rstCabVenta."Document Type"::Order);
            rstCabVenta.SetRange("No.", strDocumento);
            rstCabVenta.SetRecFilter;
            Clear(frmPedidosVenta);
            frmPedidosVenta.SetTableView(rstCabVenta);

            rstConfUsu.Reset;
            if rstConfUsu.Get(UserId) then
                cduMensajeria.RegistrarMensaje('Alta de Pedido', '', strDocumento, 'Pedido (ventas)', 'Abierto', Today,
                rstMensajeria."Tipo movimiento"::"Mensaje con Seguimiento", rstPuerto.Grupo, '', '', '', '', '', '', '');

            Clear(cduMensajeria);
            Clear(rstConfUsu);
            Clear(rstMensajeria);

            rstConfUsu.Reset;
            if rstConfUsu.Get(UserId) then
                cduMensajeria.RegistrarMensaje('Reparto Comercial registrado', '', rstCabReparto."No. Documento",
                'Reparto (ventas)', 'Registrado', Today,
                rstMensajeria."Tipo movimiento"::Seguimiento, rstConfUsu.Grupo, '', '', '', '', '', '', '');

            exit(true);

        end
        else begin

            Clear(rstLinPedido);
            rstLinPedido.SetRange("Document No.", rstCabReparto."No. Pedido");
            rstLinPedido.SetFilter("Qty. Shipped (Base)", '<>%1', 0);
            if rstLinPedido.FindSet then
                Error(Error1, rstCabReparto."No. Pedido");

            Clear(rstCabPedido);
            if rstCabPedido.Get(rstCabPedido."Document Type"::Order, rstCabReparto."No. Pedido") then begin

                ReleaseSalesDoc.PerformManualReopen(rstCabPedido);

                rstCabPedido.Delete(true);

                Clear(rstLinPedido);
                rstLinPedido.SetRange("Document Type", rstLinPedido."Document Type"::Order);
                rstLinPedido.SetRange("Document No.", rstCabPedido."No.");
                rstLinPedido.DeleteAll(true);

            end;

            Clear(rstCabRemito);
            rstCabRemito.SetRange("Documento venta", rstCabReparto."No. Pedido");
            if rstCabRemito.FindFirst then
                rstCabRemito.Delete(true);

            if rstCabPedido.Delete(true) then;

            rstCabReparto."No. Pedido" := '';
            rstCabReparto.Modify;

            Clear(rstLinReparto);
            rstLinReparto.ModifyAll(Registrado, false);

            Clear(rstLinReparto);
            rstLinReparto.SetRange("No. Documento", rstCabReparto."No. Documento");
            rstLinReparto.SetRange("Seguimiento para trazabilidad", rstLinReparto."Seguimiento para trazabilidad"::"Pre-Expo - Controlar contra DCL");
            if rstLinReparto.FindSet then
                if Confirm(Message1, false) then begin

                    Clear(l_rstDCLAppl);
                    l_rstDCLAppl.SetRange("Applied document no.", rstCabReparto."No. Documento");
                    l_rstDCLAppl.DeleteAll;

                end;

            Clear(cduMensajeria);
            Clear(rstConfUsu);
            Clear(rstMensajeria);

            rstConfUsu.Reset;
            if rstConfUsu.Get(UserId) then
                cduMensajeria.RegistrarMensaje('Reparto Comercial registrado', '', rstCabReparto."No. Documento",
                'Reparto (ventas)', 'Abierto', Today,
                rstMensajeria."Tipo movimiento"::Seguimiento, rstConfUsu.Grupo, '', '', '', '', '', '', '');

            exit(true);

        end;
    end;

    [Scope('OnPrem')]
    procedure GenerarPedido(rstCabReparto: Record "Cab. Reparto")
    var
        rstCabPedido: Record "Sales Header";
        rstLinPedido: Record "Sales Line";
        rstProductoLote: Record "Productos por lote";
        intLinea: Integer;
        GestNoSerie: Codeunit "No. Series";
        rstConfVentas: Record "Sales & Receivables Setup";
        rstProducto: Record Item;
        rstPuerto: Record "Entry/Exit Point";
        rstLinReparto: Record "Lín. reparto";
        rstMovProducto: Record "Item Ledger Entry";
        decCantidadPendiente: Decimal;
        codNroLote: Code[20];
        codDeposito: Code[20];
        codCaja: Code[20];
        decCantidadLote: Decimal;
        cdu22: Codeunit "DCL Management";
        rstDV: Record "Dimension Value";
        rstGLS: Record "General Ledger Setup";
        l_rstDCLAppl: Record "DCL Application Lines";
        l_rstSS: Record "Sales & Receivables Setup";
        l_rstD: Record Dimension;
        l_rstGLS: Record "General Ledger Setup";
        i: Integer;
        l_rstDV: Record "Dimension Value";
    begin
        Clear(rstCabPedido);
        Clear(rstLinPedido);
        Clear(rstConfVentas);
        rstConfVentas.Get();

        rstCabPedido.Usuario := UserId;
        rstCabPedido."Document Type" := rstCabPedido."Document Type"::Order;
        rstCabPedido."No." := GestNoSerie.GetNextNo(rstConfVentas."Order Nos.");
        rstCabPedido.Insert;
        rstCabPedido.Validate("Posting Date", Today);
        rstCabPedido.Validate("Order Date", Today);
        rstCabPedido.Validate("Document Date", Today);
        rstCabPedido.Validate("Sell-to Customer No.", rstCabReparto.Cliente);
        rstCabPedido.SetHideValidationDialog(true);
        rstCabPedido.Validate("Bill-to Customer No.", rstCabReparto."Cliente factura");
        rstCabPedido."Tipo de Contenedor" := rstCabReparto."Container type";
        rstCabPedido."Shipping No. Series" := rstConfVentas."Posted Shipment Nos.";
        rstCabPedido."Quote No." := rstCabReparto."No. Documento";
        rstCabPedido.Validate("Permiso de embarque", rstCabReparto."Permiso de Embarque");

        Clear(l_rstSS);
        l_rstSS.Get();
        Clear(l_rstGLS);
        l_rstGLS.Get();

        if l_rstSS."Dimension for sales" <> '' then begin

            Clear(l_rstD);
            l_rstD.Get(l_rstSS."Dimension for sales");

            case l_rstD.Code of
                l_rstGLS."Global Dimension 1 Code":
                    rstCabPedido.Validate("Shortcut Dimension 1 Code", rstCabReparto."No. Documento");
                l_rstGLS."Global Dimension 2 Code":
                    rstCabPedido.Validate("Shortcut Dimension 2 Code", rstCabReparto."No. Documento");
                l_rstGLS."Global Dimension 3 Code":
                    rstCabPedido.Validate("Shortcut Dimension 3 Code", rstCabReparto."No. Documento");
                l_rstGLS."Global Dimension 4 Code":
                    rstCabPedido.Validate("Shortcut Dimension 4 Code", rstCabReparto."No. Documento");
                l_rstGLS."Global Dimension 5 Code":
                    rstCabPedido.Validate("Shortcut Dimension 5 Code", rstCabReparto."No. Documento");
                l_rstGLS."Global Dimension 6 Code":
                    rstCabPedido.Validate("Shortcut Dimension 6 Code", rstCabReparto."No. Documento");
                l_rstGLS."Global Dimension 7 Code":
                    rstCabPedido.Validate("Shortcut Dimension 7 Code", rstCabReparto."No. Documento");
            end;

        end;


        Clear(rstPuerto);
        rstPuerto.SetRange(rstPuerto.Code, rstCabReparto."Loading port");
        if rstPuerto.FindFirst then
            rstCabPedido."Puerto carga" := rstPuerto.Code;

        Clear(rstPuerto);
        rstPuerto.SetRange(rstPuerto.Code, rstCabReparto."Exit port");
        if rstPuerto.FindFirst then
            rstCabPedido."Exit Point" := rstPuerto.Code;

        Clear(rstPuerto);
        rstPuerto.SetRange(rstPuerto.Code, rstCabReparto."Destination port");
        if rstPuerto.FindFirst then
            rstCabPedido."Puerto destino" := rstPuerto.Code;

        rstCabPedido."Shipping Agent Code" := rstCabReparto.Transportista;
        rstCabPedido."Shipment Method Code" := rstCabReparto."Sales conditions";
        rstCabPedido.Aprobar := true;
        rstCabPedido.Modify;

        dlgReparto.Open('Generando Pedido N° #1##################\' +
                        'Producto            #2##################\' +
                        'Lote                #3##################');

        dlgReparto.Update(1, rstCabPedido."No.");

        Clear(rstGLS);
        rstGLS.Get();

        Clear(l_rstDCLAppl);
        l_rstDCLAppl.SetRange("Applied document no.", rstCabReparto."No. Documento");
        if not l_rstDCLAppl.FindSet then begin

            Clear(rstLinReparto);
            rstLinReparto.SetRange(rstLinReparto."No. Documento", rstCabReparto."No. Documento");
            rstLinReparto.SetFilter("Reservar - UMB", '<>%1', 0);
            if rstLinReparto.FindFirst then
                repeat

                    dlgReparto.Update(2, rstLinReparto.Descripcion);
                    dlgReparto.Update(3, rstLinReparto.Proyecto);

                    if rstLinReparto."Seguimiento para trazabilidad" = rstLinReparto."Seguimiento para trazabilidad"::"Pre-Expo - Controlar contra DCL" then begin
                        Clear(cdu22);
                        cdu22.fntAplicarDCLparaCCC(rstLinReparto);
                    end;

                until rstLinReparto.Next = 0;

        end;

        if rstConfVentas."Generar líneas pedido reparto" then begin

            Clear(rstLinReparto);
            rstLinReparto.SetRange(rstLinReparto."No. Documento", rstCabReparto."No. Documento");
            rstLinReparto.SetFilter("Reservar - UMB", '<>%1', 0);
            if rstLinReparto.FindFirst then
                repeat

                    dlgReparto.Update(2, rstLinReparto.Descripcion);
                    dlgReparto.Update(3, rstLinReparto.Proyecto);

                    decCantidadPendiente := 0;
                    codNroLote := '';
                    codDeposito := '';
                    codCaja := '';
                    decCantidadPendiente := rstLinReparto."Reservar - UMB" / rstLinReparto."Cantidad x Unidad Medida";
                    repeat

                        Clear(rstMovProducto);

                        rstMovProducto.SetCurrentKey("Global Dimension 1 Code", "Global dimension 3 Code", "Item No.", "Global Dimension 2 Code",
                                            "Lot No.", "Entry/Exit Point", "Posting Date");

                        rstMovProducto.SetRange("Item No.", rstLinReparto."No. Producto");
                        rstMovProducto.SetRange("Global Dimension 2 Code", rstLinReparto.Actividad);
                        rstMovProducto.SetRange("Global Dimension 1 Code", rstLinReparto.Buque);
                        rstMovProducto.SetRange("Global dimension 3 Code", rstLinReparto.Marea);
                        rstMovProducto.SetRange(Open, true);
                        rstMovProducto.SetRange("Entry/Exit Point", rstLinReparto.Puerto);
                        rstMovProducto.SetRange("Location Code", rstLinReparto."Cod. deposito");
                        if rstMovProducto.FindFirst then
                            repeat

                                if ((codNroLote <> rstMovProducto."Lot No.") or (codDeposito <> rstMovProducto."Location Code")) then begin

                                    if codNroLote = '' then begin

                                        codNroLote := rstMovProducto."Lot No.";
                                        codDeposito := rstMovProducto."Location Code";
                                        decCantidadLote := 0;
                                        decCantidadLote := rstMovProducto."Remaining Quantity";
                                        if Round(decCantidadLote / rstLinReparto."Cantidad x Unidad Medida", 1, '<') >= decCantidadPendiente then begin

                                            Clear(rstProducto);
                                            rstProducto.Get(rstLinReparto."No. Producto");
                                            intLinea += 10000;
                                            Clear(rstLinPedido);
                                            rstLinPedido."Document Type" := rstLinPedido."Document Type"::Order;
                                            rstLinPedido."Document No." := rstCabPedido."No.";
                                            rstLinPedido."Line No." := intLinea;
                                            rstLinPedido."Sell-to Customer No." := rstCabPedido."Sell-to Customer No.";
                                            rstLinPedido."Bill-to Customer No." := rstCabPedido."Bill-to Customer No.";
                                            rstLinPedido.Type := rstLinPedido.Type::Item;
                                            rstLinPedido.Validate("No.", rstLinReparto."No. Producto");
                                            rstLinPedido.Validate("Exit Point", rstLinReparto.Puerto);
                                            rstLinPedido.Validate("Seguimiento para trazabilidad", rstLinReparto."Seguimiento para trazabilidad");
                                            rstLinPedido.Validate("DCL application date formula", rstLinReparto."DCL application date formula");
                                            rstLinPedido."Item Category Code" := rstProducto."Item Category Code";
                                            GenerarTracking(rstLinPedido);
                                            rstLinPedido.Validate("Location Code", codDeposito);
                                            rstLinPedido.Validate("Bin Code", codCaja);
                                            rstLinPedido."Lote origen" := rstMovProducto."Lote origen";
                                            rstLinPedido.Validate(Quantity, decCantidadPendiente);
                                            decCantidadPendiente := 0;
                                            decCantidadLote := 0;
                                            if rstLinPedido.Quantity <> 0 then
                                                rstLinPedido.Insert;

                                            codNroLote := rstMovProducto."Lot No.";
                                            codDeposito := rstMovProducto."Location Code";

                                        end;

                                    end
                                    else begin

                                        Clear(rstProducto);
                                        rstProducto.Get(rstLinReparto."No. Producto");
                                        intLinea += 10000;
                                        Clear(rstLinPedido);
                                        rstLinPedido."Document Type" := rstLinPedido."Document Type"::Order;
                                        rstLinPedido."Document No." := rstCabPedido."No.";
                                        rstLinPedido."Line No." := intLinea;
                                        rstLinPedido."Sell-to Customer No." := rstCabPedido."Sell-to Customer No.";
                                        rstLinPedido."Bill-to Customer No." := rstCabPedido."Bill-to Customer No.";
                                        rstLinPedido.Type := rstLinPedido.Type::Item;
                                        rstLinPedido.Validate("No.", rstLinReparto."No. Producto");
                                        rstLinPedido.Validate("Exit Point", rstLinReparto.Puerto);
                                        rstLinPedido.Validate("Seguimiento para trazabilidad", rstLinReparto."Seguimiento para trazabilidad");
                                        rstLinPedido.Validate("DCL application date formula", rstLinReparto."DCL application date formula");
                                        /*rstLinPedido.VALIDATE("lot no.",codNroLote);*/
                                        GenerarTracking(rstLinPedido);
                                        rstLinPedido.Validate("Location Code", codDeposito);
                                        rstLinPedido.Validate("Bin Code", codCaja);
                                        rstLinPedido."Lote origen" := rstMovProducto."Lote origen";
                                        rstLinPedido."Item Category Code" := rstProducto."Item Category Code";

                                        if Round(decCantidadLote / rstLinReparto."Cantidad x Unidad Medida", 1, '<') <= decCantidadPendiente then begin

                                            rstLinPedido.Validate(Quantity, Round(decCantidadLote / rstLinReparto."Cantidad x Unidad Medida", 1, '<'));
                                            decCantidadPendiente -= Round(decCantidadLote / rstLinReparto."Cantidad x Unidad Medida", 1, '<');
                                            decCantidadLote := 0;
                                            decCantidadLote := rstMovProducto."Remaining Quantity";

                                        end
                                        else begin

                                            rstLinPedido.Validate(Quantity, decCantidadPendiente);
                                            decCantidadPendiente := 0;

                                        end;

                                        if rstLinPedido.Quantity <> 0 then
                                            rstLinPedido.Insert;

                                        codNroLote := rstMovProducto."Lot No.";
                                        codDeposito := rstMovProducto."Location Code";

                                    end;

                                end
                                else begin

                                    decCantidadLote += rstMovProducto."Remaining Quantity";
                                    if Round(decCantidadLote / rstLinReparto."Cantidad x Unidad Medida", 1, '<') >= decCantidadPendiente then begin

                                        Clear(rstProducto);
                                        rstProducto.Get(rstLinReparto."No. Producto");
                                        intLinea += 10000;
                                        Clear(rstLinPedido);
                                        rstLinPedido."Document Type" := rstLinPedido."Document Type"::Order;
                                        rstLinPedido."Document No." := rstCabPedido."No.";
                                        rstLinPedido."Line No." := intLinea;
                                        rstLinPedido."Sell-to Customer No." := rstCabPedido."Sell-to Customer No.";
                                        rstLinPedido."Bill-to Customer No." := rstCabPedido."Bill-to Customer No.";
                                        rstLinPedido.Type := rstLinPedido.Type::Item;
                                        rstLinPedido.Validate("No.", rstLinReparto."No. Producto");
                                        rstLinPedido.Validate("Exit Point", rstLinReparto.Puerto);
                                        rstLinPedido.Validate("Seguimiento para trazabilidad", rstLinReparto."Seguimiento para trazabilidad");
                                        rstLinPedido.Validate("DCL application date formula", rstLinReparto."DCL application date formula");
                                        /*rstLinPedido.VALIDATE("Nº lote",codNroLote);*/
                                        GenerarTracking(rstLinPedido);
                                        rstLinPedido.Validate("Location Code", codDeposito);
                                        rstLinPedido.Validate("Bin Code", codCaja);
                                        rstLinPedido."Item Category Code" := rstProducto."Item Category Code";
                                        rstLinPedido."Lote origen" := rstMovProducto."Lote origen";
                                        rstLinPedido.Validate(Quantity, decCantidadPendiente);
                                        decCantidadPendiente := 0;
                                        decCantidadLote := 0;
                                        if rstLinPedido.Quantity <> 0 then
                                            rstLinPedido.Insert;

                                        codNroLote := rstMovProducto."Lot No.";
                                        codDeposito := rstMovProducto."Location Code";
                                        /*codCaja := rstMovProducto."Cód. caja";*/

                                    end;

                                end;

                            until (rstMovProducto.Next = 0) or (decCantidadPendiente = 0);

                    until decCantidadPendiente = 0;

                    rstLinReparto.Registrado := true;
                    rstLinReparto.Modify;

                until rstLinReparto.Next = 0;

        end;

        rstCabReparto."No. Pedido" := rstCabPedido."No.";
        rstCabReparto.Modify;
        strDocumento := rstCabPedido."No.";

        dlgReparto.Close;

    end;

    [Scope('OnPrem')]
    procedure TestRegistroReparto(): Boolean
    var
        rstTestLinReparto: Record "Lín. reparto";
    begin
        exit(true);
    end;

    [Scope('OnPrem')]
    procedure CrearLineasExistencias(rstCabLotes: Record "Cab. Reparto")
    var
        rstLotesporProducto: Record "Productos por lote";
        rstLotesporProducto2: Record "Productos por lote";
        rstMovProducto: Record "Item Ledger Entry";
        dlgGenerarBaseReparto: Dialog;
        rstConfExistencias: Record "Inventory Setup";
        i: Integer;
        rstProducto: Record Item;
        rstProductosExportacion: Record Item;
        rstMovProd2: Record "Item Ledger Entry";
        rstUnidadMedidadProducto: Record "Item Unit of Measure";
        rstLotesTemp: Record "Productos por lote";
        rstLotes: Record "Lín. reparto";
    begin
        //Para seleccionar los productos a vender
        Clear(rstLotesporProducto);
        Clear(rstLinReparto);
        Clear(rstLotes);

        rstLotes.SetRange(rstLotes."No. Documento", rstCabReparto."No. Documento");

        dlgGenerarBaseReparto.Open('Generando reparto en base a #1##################', rstLotes."No. Producto");
        dlgGenerarBaseReparto.Update(1, rstLotes."No. Producto");
        rstLotesporProducto."No. documento" := rstLotes."No. Documento";
        rstLotesporProducto."No. Producto" := rstLotes."No. Producto";

        Clear(rstMovProducto);
        //rstMovProducto.SETCURRENTKEY("Nº producto",Pendiente,"Nº lote");
        /*rstMovProducto.SETCURRENTKEY("Nº producto",Actividad,"Buque/Departamento","Marea/Mes/Ciudad",
                                     "Cód. depósito","Cód. caja","Nº lote","Puerto/Aeropuerto","Fecha registro",
                                     "Nº orden producción");*/
        rstMovProducto.SetCurrentKey("Global Dimension 1 Code", "Global dimension 3 Code", "Item No.", "Global Dimension 2 Code",
                                  "Location Code",/*"Cód. caja",*/"Lot No.", "Entry/Exit Point", "Posting Date");

        rstMovProducto.SetRange("Item No.", rstLotes."No. Producto");
        rstMovProducto.SetRange("Global Dimension 2 Code", rstLotes.Actividad);
        rstMovProducto.SetRange("Global Dimension 1 Code", rstLotes.Buque);
        rstMovProducto.SetRange("Global dimension 3 Code", rstLotes.Marea);
        rstMovProducto.SetRange(Open, true);
        rstMovProducto.SetRange("Entry/Exit Point", rstLotes.Puerto);
        rstMovProducto.SetRange("Location Code", rstLotes."Cod. deposito");
        rstMovProducto.SetRange(Open, true);
        Clear(rstProducto);
        rstProducto.Get(rstLotes."No. Producto");
        if rstProducto."Sales Unit of Measure" <> '' then begin

            Clear(rstUnidadMedidadProducto);
            if rstUnidadMedidadProducto.Get(rstProducto."No.", rstProducto."Sales Unit of Measure") then;
            Clear(rstLotesTemp);
            rstLotesTemp."No. documento" := rstLotes."No. Documento";
            //rstLotesTemp."N° Lote" := rstLotesTemp."N° Lote";
            rstLotesTemp."No. Producto" := rstLotes."No. Producto";
            rstLotesTemp.Puerto := rstLotes.Puerto;
            rstLotesTemp."Cod. deposito" := rstLotes."Cod. deposito";
            rstLotesTemp."Cod. unidad medida" := rstProducto."Sales Unit of Measure";
            rstLotesTemp."Cantidad x Unidad Medida" := rstUnidadMedidadProducto."Qty. per Unit of Measure";
            rstLotesTemp.Insert;
            rstLotesTemp.CalcFields("Existencias UMB x Lote");

        end
        else begin

            Clear(rstUnidadMedidadProducto);
            if rstUnidadMedidadProducto.Get(rstProducto."No.", rstProducto."Sales Unit of Measure") then;
            Clear(rstLotesTemp);
            rstLotesTemp."No. documento" := rstLotes."No. Documento";
            //rstLotesTemp."N° Lote" := rstLotesTemp."N° Lote";
            rstLotesTemp."No. Producto" := rstLotes."No. Producto";
            rstLotesTemp.Puerto := rstLotes.Puerto;
            rstLotesTemp."Cod. deposito" := rstLotes."Cod. deposito";
            rstLotesTemp."Cod. unidad medida" := rstProducto."Sales Unit of Measure";
            rstLotesTemp."Cantidad x Unidad Medida" := rstUnidadMedidadProducto."Qty. per Unit of Measure";
            rstLotesTemp.Insert;
            rstLotesTemp.CalcFields("Existencias UMB x Lote");

        end;

        if Round(rstLotesTemp."Existencias UMB x Lote" / rstLotesTemp."Cantidad x Unidad Medida", 1, '<') >= 1 then begin

            if rstMovProducto.FindFirst then
                repeat

                    Clear(rstLotesporProducto2);
                    rstLotesporProducto2.SetRange("No. documento", rstLotes."No. Documento");
                    //rstLotesporProducto2.SETRANGE("N° Lote",rstLotes."N° Lote");
                    rstLotesporProducto2.SetRange("Global Dimension 1", rstLotes.Buque);
                    rstLotesporProducto2.SetRange("Global Dimension 3", rstLotes.Marea);

                    if not rstLotesporProducto2.FindFirst then begin

                        rstLotesporProducto2."No. documento" := rstLotes."No. Documento";
                        //rstLotesporProducto2."N° Lote" := rstLotes."N° Lote";
                        rstLotesporProducto2."Global Dimension 1" := rstLotes.Buque;
                        rstLotesporProducto2."Global Dimension 3" := rstLotes.Marea;
                        rstLotesporProducto2.Insert;

                    end;

                    rstLotesporProducto."No. documento" := rstLotes."No. Documento";
                    rstLotesporProducto."No. Producto" := rstLotes."No. Producto";
                    rstLotesporProducto."Global Dimension 1" := rstMovProducto."Global Dimension 1 Code";
                    rstLotesporProducto."Global Dimension 3" := rstMovProducto."Global dimension 3 Code";

                    //rstLotesporProducto."N° Lote" := rstMovProducto."Nº lote";
                    if not rstLotesporProducto.Insert then
                        rstLotesporProducto.Modify;

                until rstMovProducto.Next = 0;

        end;

        /*CLEAR(rstLotesporProducto);
        CLEAR(rstLinReparto);
        CLEAR(rstConfExistencias);
        rstConfExistencias.GET();
        CLEAR(rstProductosExportacion);
        rstProductosExportacion.SETRANGE(rstProductosExportacion.Exportación,TRUE);
        rstProductosExportacion.SETFILTER(Actividad,rstCabLotes.Actividad);
        IF rstProductosExportacion.FINDFIRST THEN
        REPEAT
        
          CLEAR(rstLotes);
          CLEAR(rstProducto);
          CLEAR(rstUnidadMedidadProducto);
          rstLotes."N° Documento" := rstCabLotes."N° Documento";
          rstLotes."N° Producto" := rstProductosExportacion."No.";
          i += 10000;
          rstLotes."No. línea" := i;
          rstProducto.GET(rstLotes."N° Producto");
          rstLotes.Descripción := rstProducto.Descripción;
          IF rstProducto."Unidad medida venta" <> '' THEN
          BEGIN
        
            rstLotes."Cód. unidad medida" := rstProducto."Unidad medida venta";
            rstUnidadMedidadProducto.GET(rstProducto."No.",rstProducto."Unidad medida venta");
            rstLotes.VALIDATE("Cantidad x Unidad Medida",rstUnidadMedidadProducto."Cdad. por unidad medida");
        
          END
          ELSE
          BEGIN
        
            rstLotes."Cód. unidad medida" := rstProducto."Unidad medida base";
            rstLotes.VALIDATE("Cantidad x Unidad Medida",1);
        
          END;
        
          IF rstLotes."No. línea" <> 0 THEN
            rstLotes.INSERT;
        
          rstLotes.CALCFIELDS("Existencias UMB");
          IF rstLotes."Existencias UMB" = 0 THEN
            rstLotes.DELETE;
        
        UNTIL rstProductosExportacion.NEXT = 0;
         */
        dlgGenerarBaseReparto.Close;

        ActualizarLineasExistencias(rstCabLotes);

    end;

    [Scope('OnPrem')]
    procedure ActualizarLineasExistencias(rstCabLotes: Record "Cab. Reparto")
    var
        rstLotes: Record "Lín. reparto";
        rstLotesporProducto: Record "Productos por lote";
        rstLotesporProducto2: Record "Productos por lote" temporary;
        rstMovProducto: Record "Item Ledger Entry";
        dlgGenerarBaseReparto: Dialog;
        rstConfExistencias: Record "Inventory Setup";
        i: Integer;
        rstProducto: Record Item;
        rstUnidadMedidadProducto: Record "Item Unit of Measure";
    begin
        dlgGenerarBaseReparto.Open('Generando reparto en base a: \' +
                                   'Reparto:  #1##################\' +
                                   'Producto: #2##################\' +
                                   'Lote:     #3##################');

        Clear(rstLotes);
        rstLotes.SetRange(rstLotes."No. Documento", rstCabLotes."No. Documento");
        rstLotes.SetFilter("No. Producto", '<>%1', '');
        if rstLotes.FindFirst then
            repeat

                dlgGenerarBaseReparto.Update(1, rstLotes."No. Documento");
                dlgGenerarBaseReparto.Update(2, rstLotes."No. Producto");
                rstLotesporProducto."No. documento" := rstLotes."No. Documento";
                //rstLotesporProducto."N° Producto" := rstLotes."N° Producto";

                Clear(rstMovProducto);
                rstMovProducto.SetCurrentKey("Item No.", Open, "Variant Code", "Location Code", "Item Tracking", "Lot No.", "Serial No.");
                /*  rstMovProducto.SETCURRENTKEY("Nº producto",Actividad,"Buque/Departamento","Marea/Mes/Ciudad",
                                               "Cód. depósito","Cód. caja","Nº lote","Puerto/Aeropuerto","Fecha registro",
                                               "Nº orden producción");*/
                /*  rstMovProducto.SETCURRENTKEY("Buque/Departamento","Marea/Mes/Ciudad","Nº producto",Actividad,"Cód. depósito",
                                          "Cód. caja","Nº lote","Puerto/Aeropuerto","Fecha registro","Nº orden producción");
                 */
                if rstLotes."No. Producto" <> '' then
                    rstMovProducto.SetRange("Item No.", rstLotes."No. Producto")
                else
                    rstMovProducto.SetFilter("Item No.", '<>%1', '');
                if rstLotes.Actividad <> '' then
                    rstMovProducto.SetRange("Global Dimension 2 Code", rstLotes.Actividad);
                /*rstMovProducto.SETRANGE("Buque/Departamento",rstLotes.Buque);
                rstMovProducto.SETRANGE("Marea/Mes/Ciudad",rstLotes.Marea);*/
                rstMovProducto.SetRange(Open, true);
                if rstLotes.Puerto <> '' then
                    rstMovProducto.SetRange("Entry/Exit Point", rstLotes.Puerto);
                if rstLotes."Cod. deposito" <> '' then
                    rstMovProducto.SetRange("Location Code", rstLotes."Cod. deposito");
                rstMovProducto.SetRange(Open, true);

                //rstMovProducto.SETRANGE("Nº producto",rstLotes."N° Producto");
                //rstMovProducto.SETRANGE(Pendiente,TRUE);
                //rstMovProducto.SETFILTER("Cantidad pendiente",'<>0');

                if rstMovProducto.FindFirst then
                    repeat

                        Clear(rstProducto);
                        Clear(rstLotesporProducto);
                        rstProducto.Get(rstLotes."No. Producto");
                        Clear(rstUnidadMedidadProducto);
                        if rstProducto."Sales Unit of Measure" <> '' then
                            rstUnidadMedidadProducto.Get(rstProducto."No.", rstProducto."Sales Unit of Measure")
                        else
                            rstUnidadMedidadProducto.Get(rstProducto."No.", rstProducto."Base Unit of Measure");

                        Clear(rstLotesporProducto2);
                        rstLotesporProducto2."No. documento" := rstLotes."No. Documento";
                        //rstLotesporProducto2."N° Lote" := rstMovProducto."Lote origen";
                        rstLotesporProducto2."No. Lote" := rstMovProducto."Global Dimension 1 Code" + rstMovProducto."Global dimension 3 Code";
                        rstLotesporProducto2."Global Dimension 1" := rstMovProducto."Global Dimension 1 Code";
                        rstLotesporProducto2."Global Dimension 3" := rstMovProducto."Global dimension 3 Code";
                        rstLotesporProducto2.Descripcion := rstMovProducto.Description;
                        rstLotesporProducto2."Fecha descarga" := rstMovProducto."Posting Date";
                        rstLotesporProducto2.Puerto := rstMovProducto."Entry/Exit Point";
                        rstLotesporProducto2."Cod. deposito" := rstMovProducto."Location Code";
                        rstLotesporProducto2.SetFilter("Filtro deposito", rstMovProducto."Location Code");
                        rstLotesporProducto2.SetFilter("Filtro Producto", rstMovProducto."Item No.");
                        //rstLotesporProducto2.SETFILTER("Filtro Nº lote",rstMovProducto."Lote origen");
                        rstLotesporProducto2.SetFilter("Global dimension 1 filter", rstMovProducto."Global Dimension 1 Code");
                        rstLotesporProducto2.SetFilter("Global dimension 3 filter", rstMovProducto."Global dimension 3 Code");
                        rstLotesporProducto2.CalcFields("Existencias UMB x Lote");
                        if rstLotesporProducto2."Existencias UMB x Lote" <> 0 then begin

                            if Round(rstLotesporProducto2."Existencias UMB x Lote" / rstUnidadMedidadProducto."Qty. per Unit of Measure", 1, '<') >= 1 then begin

                                dlgGenerarBaseReparto.Update(3, rstMovProducto."Lote origen");
                                rstLotesporProducto."No. documento" := rstLotes."No. Documento";
                                //rstLotesporProducto."N° Lote" := rstMovProducto."Lote origen";
                                rstLotesporProducto."Global Dimension 1" := rstMovProducto."Global Dimension 1 Code";
                                rstLotesporProducto."Global Dimension 3" := rstMovProducto."Global dimension 3 Code";
                                rstLotesporProducto."No. Lote" := rstMovProducto."Global Dimension 1 Code" + rstMovProducto."Global dimension 3 Code";
                                rstLotesporProducto.Descripcion := rstMovProducto.Description;
                                rstLotesporProducto."Fecha descarga" := rstMovProducto."Posting Date";
                                rstLotesporProducto.Puerto := rstMovProducto."Entry/Exit Point";
                                rstLotesporProducto."Cod. deposito" := rstMovProducto."Location Code";
                                if not rstLotesporProducto.Insert then
                                    rstLotesporProducto.Modify;

                            end;

                        end;

                    /*
                   END;
                     */
                    until rstMovProducto.Next = 0;

            until rstLotes.Next = 0;

        dlgGenerarBaseReparto.Close;

    end;

    [Scope('OnPrem')]
    procedure GenerarTracking(l_rstLinPedido: Record "Sales Line")
    var
        rstTrackSpec: Record "Tracking Specification";
        ReserveSalesLine: Codeunit "Sales Line-Reserve";
    begin

        ReserveSalesLine.CallItemTracking(l_rstLinPedido);
    end;

    [Scope('OnPrem')]
    procedure fntRegistroRRR(rstCabReparto: Record "Cab. Reparto"; rstLinReparto: Record "Lín. reparto"; blnRevertir: Boolean): Boolean
    var
        i: Integer;

        RegistroVisible: Boolean;
        "strCapitán": Text[30];
        rstConfUsu: Record "User Setup";
        cduMensajeria: Codeunit "Mensajería";
        rstMensajeria: Record Mensajeria;
        l_rstLinReparto: Record "Lín. reparto";
        rstConfEx: Record "Inventory Setup";
        rstProyecto: Record Job;
        blnImprimir: Boolean;
        rstPuerto: Record "Entry/Exit Point";
        rstCabPedido: Record "Sales Header";
        rstLinPedido: Record "Sales Line";
        Error1: Label 'No es posible revertir el reparto, porque el pedido de venta n° %1 ya tiene envíos. Antes de revertir el reparto, revierta el o los remitos relacionados.';
        rstCabRemito: Record "Cab. remito ventas";
        ReleaseSalesDoc: Codeunit "Release Sales Document";
        l_rstDCLAppl: Record "DCL Application Lines";
        Message1: Label 'Está revirtiendo un reparto relacionado a un CCC. ¿Desea revertir el CCC junto al reparto?';
    begin
        //Verificar los datos del reparto

        if not blnRevertir then begin

            Clear(rstConfVentas);
            rstConfVentas.Get();
            Clear(rstCliente);
            rstCliente.Get(rstCabReparto.Cliente);
            if (rstCliente."Customer Posting Group" = rstConfVentas."Grupo contable Exportaciones") then begin

                rstCabReparto.TestField(Cliente);
                rstCabReparto.TestField("Container type");
                rstCabReparto.TestField("Destination port");
                //rstCabReparto.TESTFIELD(Transportista);

            end;

            GenerarPedido(rstCabReparto);

            Clear(rstConfVentas);
            rstConfVentas.Get();

            Clear(rstPuerto);
            rstPuerto.SetRange(rstPuerto.Code, rstCabReparto."Loading port");
            rstPuerto.FindFirst;

            Clear(cduMensajeria);
            Clear(rstConfUsu);
            Clear(rstMensajeria);

            Clear(rstCabVenta);
            rstCabVenta.SetRange(rstCabVenta."Document Type", rstCabVenta."Document Type"::Order);
            rstCabVenta.SetRange("No.", strDocumento);
            rstCabVenta.SetRecFilter;
            Clear(frmPedidosVenta);
            frmPedidosVenta.SetTableView(rstCabVenta);

            rstConfUsu.Reset;
            if rstConfUsu.Get(UserId) then
                cduMensajeria.RegistrarMensaje('Alta de Pedido', '', strDocumento, 'Pedido (ventas)', 'Abierto', Today,
                rstMensajeria."Tipo movimiento"::"Mensaje con Seguimiento", rstPuerto.Grupo, '', '', '', '', '', '', '');

            Clear(cduMensajeria);
            Clear(rstConfUsu);
            Clear(rstMensajeria);

            rstConfUsu.Reset;
            if rstConfUsu.Get(UserId) then
                cduMensajeria.RegistrarMensaje('Reparto Comercial registrado', '', rstCabReparto."No. Documento",
                'Reparto (ventas)', 'Registrado', Today,
                rstMensajeria."Tipo movimiento"::Seguimiento, rstConfUsu.Grupo, '', '', '', '', '', '', '');

            exit(true);

        end
        else begin

            Clear(rstLinPedido);
            rstLinPedido.SetRange("Document No.", rstCabReparto."No. Pedido");
            rstLinPedido.SetFilter("Qty. Shipped (Base)", '<>%1', 0);
            if rstLinPedido.FindSet then
                Error(Error1, rstCabReparto."No. Pedido");

            Clear(rstCabPedido);
            if rstCabPedido.Get(rstCabPedido."Document Type"::Order, rstCabReparto."No. Pedido") then begin

                ReleaseSalesDoc.PerformManualReopen(rstCabPedido);

                rstCabPedido.Delete(true);

                Clear(rstLinPedido);
                rstLinPedido.SetRange("Document Type", rstLinPedido."Document Type"::Order);
                rstLinPedido.SetRange("Document No.", rstCabPedido."No.");
                rstLinPedido.DeleteAll(true);

            end;

            Clear(rstCabRemito);
            rstCabRemito.SetRange("Documento venta", rstCabReparto."No. Pedido");
            if rstCabRemito.FindFirst then
                rstCabRemito.Delete(true);

            if rstCabPedido.Delete(true) then;

            rstCabReparto."No. Pedido" := '';
            rstCabReparto.Modify;

            Clear(rstLinReparto);
            rstLinReparto.ModifyAll(Registrado, false);

            Clear(rstLinReparto);
            rstLinReparto.SetRange("No. Documento", rstCabReparto."No. Documento");
            rstLinReparto.SetRange("Seguimiento para trazabilidad", rstLinReparto."Seguimiento para trazabilidad"::"Pre-Expo - Controlar contra DCL");
            if rstLinReparto.FindSet then
                if Confirm(Message1, false) then begin

                    Clear(l_rstDCLAppl);
                    l_rstDCLAppl.SetRange("Applied document no.", rstCabReparto."No. Documento");
                    l_rstDCLAppl.DeleteAll;

                end;

            Clear(cduMensajeria);
            Clear(rstConfUsu);
            Clear(rstMensajeria);

            rstConfUsu.Reset;
            if rstConfUsu.Get(UserId) then
                cduMensajeria.RegistrarMensaje('Reparto Comercial registrado', '', rstCabReparto."No. Documento",
                'Reparto (ventas)', 'Abierto', Today,
                rstMensajeria."Tipo movimiento"::Seguimiento, rstConfUsu.Grupo, '', '', '', '', '', '', '');

            exit(true);

        end;
    end;


}