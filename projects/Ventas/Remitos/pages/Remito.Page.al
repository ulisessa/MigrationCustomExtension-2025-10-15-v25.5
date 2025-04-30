page 50632 Remito
{
    PageType = Card;
    PromotedActionCategories = 'Nuevo,Proceso,Reporte Remito,Reporte Pesada';
    RefreshOnActivate = true;
    SourceTable = "Cab. remito ventas";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No. documento"; "No. documento")
                {
                    Editable = false;
                }
                field("Venta a-No. cliente"; "Venta a-No. cliente")
                {
                }
                field("Nombre cliente"; "Nombre cliente")
                {
                }
                field("Global Dimension 6"; "Global Dimension 6")
                {
                }
                field("Carpeta de Exportación"; "Carpeta de Exportación")
                {
                }
                field("Permiso de embarque"; "Permiso de embarque")
                {
                }
                field("Puerto embarque"; "Puerto embarque")
                {
                }
                field("Puerto destino"; "Puerto destino")
                {
                }
                field(Destino; Destino)
                {
                }
                field("Fecha de remito"; "Fecha de remito")
                {
                }
                field("Fecha oficializacion"; "Fecha oficializacion")
                {
                }
                field("No. remito"; "No. remito")
                {
                }
                field("No. reparto"; "No. reparto")
                {
                }
                field("Currency Code"; "Currency Code")
                {

                    trigger OnAssistEdit()
                    begin
                        Clear(ChangeExchangeRate);
                        if "Fecha oficializacion" <> 0D then
                            ChangeExchangeRate.SetParameter("Currency Code", "Currency Factor", "Fecha oficializacion")
                        else
                            ChangeExchangeRate.SetParameter("Currency Code", "Currency Factor", WorkDate);
                        if ChangeExchangeRate.RunModal = ACTION::OK then begin
                            Validate("Currency Factor", ChangeExchangeRate.GetParameter);
                            CurrPage.Update;
                        end;
                        Clear(ChangeExchangeRate);
                    end;
                }
                field("Tipo cambio oficialización"; decCF)
                {
                    Editable = false;
                }
                field(Ticket; "Weighing Ticket No.")
                {
                }
                field("Container tare"; "Container tare")
                {
                }
                field("Location code"; "Location code")
                {
                }
                field("Scale code"; "Scale code")
                {
                }
                field("Customs code"; "Customs code")
                {
                }
            }
            group(Transporte)
            {
                Caption = 'Transporte';
                field("Cód. Contenedor"; "Cód. Contenedor")
                {
                    Caption = 'No. Contenedor';
                }
                field("Tipo de Contenedor"; "Tipo de Contenedor")
                {
                }
                field("Precinto DGA"; "Precinto DGA")
                {
                }
                field(Precinto; Precinto)
                {
                }
                field("Modo transporte"; "Modo transporte")
                {
                }
                field("Cód. transportista"; "Cód. transportista")
                {
                }
                field("Transport registration-chassis"; "Transport registration-chassis")
                {
                }
                field("Transport registration - semi"; "Transport registration - semi")
                {
                }
                field("Driver ID"; "Driver ID")
                {
                }
                field(Conductor; Conductor)
                {
                }
                field("Shipping agent"; "Shipping agent")
                {
                }
                field("Entry date"; "Entry date")
                {
                }
                field("Exit date"; "Exit date")
                {
                }
                field(Temperatura; Temperatura)
                {
                }
                field(Hora; Hora)
                {
                }
                field("Tipo de amparo sanitario"; "Tipo de amparo sanitario")
                {
                }
                field("No. amparo sanitario"; "No. amparo sanitario")
                {
                }
            }
            group(Control1000000026)
            {
                ShowCaption = false;
            }
            part(SubPageReparto; "Subform lín. remito")
            {
                SubPageLink = "No. documento" = FIELD("No. documento"),
                              "Tipo documento" = FIELD("Tipo documento"),
                              "Documento venta" = FIELD("Documento venta"),
                              "No. reparto" = FIELD("No. reparto");
                SubPageView = SORTING("No. documento", "No. producto", "Lote origen");
            }
            part(SubPageWeighing; "Weighing records subform")
            {
                SubPageLink = "Shipment No." = FIELD("No. documento");
                Visible = blnPesada;
            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Provider = SubPageReparto;
                SubPageLink = "Table ID" = CONST(50556),
                              "No." = FIELD("No. documento");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Insertar")
            {
                Caption = 'Insertar linea';
                Visible = true;
                action("Insertar Linea")
                {
                    Caption = 'Insertar Linea';
                    Image = Insert;
                    ShortCutKey = 'F3';

                    trigger OnAction()
                    begin
                        codDocumento := "No. documento";
                        codProducto := '';
                        codBuque := '';
                        codMarea := '';
                        codDeposito := '';
                        codPuerto := '';
                        decCant := 0;
                        decKN := 0;
                        decKB := 0;

                        Clear(frmInsertar);
                        if frmInsertar.RunModal <> ACTION::LookupOK then
                            exit;
                        frmInsertar.fntCrearLinea(codDocumento, codProducto, codBuque, codMarea, codDeposito, codPuerto, decCant, decKN, decKB);

                        Clear(rstAjuste);
                        rstAjuste.SetRange("No. documento", "No. documento");
                        rstAjuste.SetRange("No. producto", codProducto);
                        rstAjuste.SetRange("Lote origen", codBuque + codMarea);
                        if rstAjuste.Find('-') then begin

                            rstAjuste."Cantidad a reservar" += decCant;
                            rstAjuste.Modify;

                        end
                        else begin

                            rstAjuste."No. documento" := "No. documento";
                            rstAjuste."Lote origen" := codBuque + codMarea;
                            rstAjuste."Tipo documento" := rstAjuste."Tipo documento"::Pedido;
                            rstAjuste."Documento venta" := "Documento venta";
                            rstAjuste.Validate("No. producto", codProducto);
                            rstAjuste."Cantidad a reservar" := decCant;
                            rstAjuste.Buque := codBuque;
                            rstAjuste.Marea := codMarea;
                            rstAjuste."Kilos brutos a reservar" := 0;
                            rstAjuste."Kilos netos a reservar" := 0;
                            rstAjuste.Insert;

                        end;
                    end;
                }
            }
            group("A&cciones")
            {
                Caption = 'A&cciones';
                action("&Imprimir")
                {
                    Caption = '&Imprimir';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        rstCabVenta: Record "Sales Header";
                    begin
                        Clear(rstCabAj);
                        rstCabAj.Get("No. documento");
                        rstCabAj.SetRecFilter();
                        Clear(rstCabVenta);
                        rstCabVenta.SetRange("Document Type", rstCabVenta."Document Type"::Order);
                        rstCabVenta.SetRange(rstCabVenta."No.", "Documento venta");
                        if rstCabVenta.Find('-') then begin

                            Clear(rstPuerto);
                            rstPuerto.SetRange(rstPuerto.Code, rstCabVenta."Exit Point");
                            rstPuerto.Find('-');
                            REPORT.Run(rstPuerto."Informe remito", true, true, rstCabAj);

                        end;
                    end;
                }
                action("&Mover a Remito Oficial")
                {
                    Caption = '&Mover a Remito Oficial';

                    trigger OnAction()
                    begin
                        fntMoverNroRemito;
                    end;
                }
            }
            group("&Registro Remito")
            {
                Caption = '&Registro Remito';
                action("Registrar e imprimir")
                {
                    Caption = 'Registrar e imprimir';
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+F9';

                    trigger OnAction()
                    begin
                        fntActualizarCabVenta;
                        fntGenerarLinsReparto;
                        if Confirm('Desea imprimir el remito oficial?') then
                            REPORT.Run(50662, false, true, Rec);
                        CurrPage.Close;
                    end;
                }
                action(Registrar)
                {
                    Caption = 'Registrar';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';

                    trigger OnAction()
                    begin
                        fntActualizarCabVenta;
                        fntGenerarLinsReparto;
                        CurrPage.Close;
                    end;
                }
            }
            group("&Registro Pesada")
            {
                Caption = '&Registro Pesada';
                Visible = blnPesada;
                action(Imprimir)
                {
                    Caption = 'Imprimir';
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+F9';
                    Visible = blnPesada;

                    trigger OnAction()
                    begin
                        //IF CONFIRM('Desea imprimir el ticket de pesada?') THEN
                        REPORT.Run(50039, true, false, Rec);
                    end;
                }
                action("Numerar ticket")
                {
                    Caption = 'Numerar ticket';
                    Image = NumberSetup;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';
                    Visible = blnPesada;

                    trigger OnAction()
                    var
                        l_rstIS: Record "Inventory Setup";
                        l_cduNS: Codeunit "No. Series";
                        l_rstScale: Record "Weighing Scale Parameters";
                    begin
                        Clear(l_rstIS);
                        l_rstIS.Get();
                        Clear(l_cduNS);
                        if (Confirm('¿Desea registrar el ticket y asignarle numeración?') and ("Weighing posted" = false)) then begin
                            Clear(l_rstScale);
                            l_rstScale.Get("Scale code");
                            "Weighing Ticket No." := l_cduNS.GetNextNo(l_rstScale."Serial no.", "Fecha de remito", true);
                            "Weighing posted" := true;
                            Modify;
                            /*
                            COMMIT;
                            REPORT.RUN(50039,TRUE,FALSE,Rec);
                            */
                        end;

                    end;
                }
            }
        }
    }


    trigger OnAfterGetCurrRecord()
    begin
        xRec := Rec;
        Clear(rstCabRemito);
        rstCabRemito.SetRange("External Document No.", "No. documento");
        CurrPage.Editable(not rstCabRemito.Find('-'));
    end;

    trigger OnModifyRecord(): Boolean
    begin
        fntActualizarCabVenta;
        fntTC;
    end;

    trigger OnOpenPage()
    var
        l_rstIS: Record "Inventory Setup";
    begin
        Clear(l_rstIS);
        l_rstIS.Get();
        if l_rstIS."Ticket Pesaje" then
            blnPesada := true
        else
            blnPesada := false;
    end;

    var
        cduDigitalizarOAbrir: Codeunit Escaneado;
        rstDigitalizar: Record "Ruta digitalizacion depto/espe";
        rstLinAjuste: Record "Lín. ajuste ventas";
        rstLinVenta: Record "Sales Line";
        rstAjuste: Record "Lín. ajuste ventas";
        intLinea: Integer;
        rstMovRemitos: Record "Mov. remitos";
        ErrorEnviado: Label 'El remito que está intentando regenerar ya fue registrado previamente. Para regenerarlo, deberá antes anular el remito registrado.';
        codDocumento: Code[20];
        codProducto: Code[30];
        codBuque: Code[3];
        codMarea: Code[6];
        codDeposito: Code[20];
        codPuerto: Code[20];
        decCant: Decimal;
        decKN: Decimal;
        decKB: Decimal;
        rstCabRemito: Record "Sales Shipment Header";
        rstCabAj: Record "Cab. remito ventas";
        rstPuerto: Record "Entry/Exit Point";
        cduFishing: Codeunit Descargas;
        frmInsertar: Page "Insertar línea reparto";
        frmDigitalizar: Page "Ruta digitalización";
        ErrorProyecto: Label 'El proyecto con buque %1 y marea %2 tiene más de un registro.';
        ChangeExchangeRate: Page "Change Exchange Rate";
        decCF: Decimal;
        ErrorProyectoNoExiste: Label 'No existe proyecto con buque %1 y marea %2.';
        blnPesada: Boolean;

    [Scope('OnPrem')]
    procedure fntActualizarCabVenta()
    var
        rstCabVenta: Record "Sales Header";
        ReleaseSalesDoc: Codeunit "Release Sales Document";
    begin
        Clear(rstCabVenta);
        rstCabVenta.SetRange("Document Type", rstCabVenta."Document Type"::Order);
        rstCabVenta.SetRange(rstCabVenta."No.", "Documento venta");
        if rstCabVenta.Find('-') then begin

            rstCabVenta."External Document No." := "No. documento";
            rstCabVenta."Posting Date" := "Fecha de remito";
            rstCabVenta."Shortcut Dimension 6 Code" := "Global Dimension 6";
            rstCabVenta."Carpeta de Exportación" := "Carpeta de Exportación";
            rstCabVenta."Permiso de embarque" := "Permiso de embarque";
            rstCabVenta."Puerto carga" := "Puerto embarque";
            rstCabVenta."Puerto destino" := "Puerto destino";
            rstCabVenta."Container code" := "Cód. Contenedor";
            rstCabVenta."Tipo de Contenedor" := "Tipo de Contenedor";
            rstCabVenta."Precinto DGA" := "Precinto DGA";
            rstCabVenta.Precinto := Precinto;
            rstCabVenta."Transport Method" := "Modo transporte";
            rstCabVenta."Shipping Agent Code" := "Cód. transportista";
            rstCabVenta."Transport registration no." := "Transport registration-chassis";
            rstCabVenta.Temperatura := Temperatura;
            rstCabVenta.Hora := Hora;
            rstCabVenta."Tipo de amparo sanitario" := "Tipo de amparo sanitario";
            rstCabVenta."Safety protection no." := "No. amparo sanitario";
            rstCabVenta.Destino := Destino;
            rstCabVenta.Conductor := Conductor;
            rstCabVenta.Modify;

        end;

        ReleaseSalesDoc.PerformManualReopen(rstCabVenta);
    end;

    [Scope('OnPrem')]
    procedure fntAjustarReparto(): Boolean
    var
        rstLinVenta2: Record "Sales Line";
        intLinea: Integer;
        dlgVentana: Dialog;
        rstAju: Record "Lín. ajuste ventas";
        intCantidadLineas: Integer;
        decCantidadAEnviar: Decimal;
        decKilosNAenviar: Decimal;
        decKilosBAenviar: Decimal;
        intRepeticiones: Integer;
    begin
        fntEliminarAjustes();
        intLinea := 1;
        Clear(rstLinVenta);
        dlgVentana.Open('Reparto:  #1#################\' +
                        'Familia:  #2#################\' +
                        'Línea:    #3#################');

        Clear(rstLinAjuste);
        rstLinAjuste.SetRange("No. documento", "No. documento");
        rstLinAjuste.SetFilter("No. producto", '<>%1', '');

        intLinea := 0;

        Clear(rstLinVenta);
        rstLinVenta.SetRange("Document Type", rstLinVenta."Document Type"::Order);
        rstLinVenta.SetRange("Document No.", "Documento venta");
        rstLinVenta.SetRange(Type, rstLinVenta.Type::Item);
        if rstLinVenta.Find('-') then
            repeat

                rstLinVenta.Confirmada := false;
                rstLinVenta.Validate("Qty. to Ship", 0);
                rstLinVenta.Validate("Net kilos to Ship", 0);
                rstLinVenta.Validate("Gross Kilos to Ship (Base)", 0);
                rstLinVenta.Modify;

                rstLinVenta.Confirmada := true;
                rstLinVenta.Modify;

            until rstLinVenta.Next = 0;

        if rstLinAjuste.Find('-') then
            repeat

                decCantidadAEnviar := rstLinAjuste."Cantidad a enviar";
                decKilosNAenviar := rstLinAjuste."Kilos Netos a enviar";
                decKilosBAenviar := rstLinAjuste."Kilos Brutos a enviar";

                intLinea := 0;
                Clear(rstLinVenta);
                rstLinVenta.SetRange("Document Type", rstLinVenta."Document Type"::Order);
                rstLinVenta.SetRange("Document No.", rstLinAjuste."Documento venta");
                rstLinVenta.SetRange(Type, rstLinVenta.Type::Item);
                rstLinVenta.SetRange("No.", rstLinAjuste."No. producto");
                rstLinVenta.SetRange("Lote origen", rstLinAjuste."Lote origen");
                if rstLinVenta.Find('-') then begin

                    intCantidadLineas := 0;
                    intCantidadLineas := rstLinVenta.Count;

                    intRepeticiones := 0;

                    repeat

                        dlgVentana.Update(1, rstLinVenta."Document No.");
                        dlgVentana.Update(2, rstLinVenta.Subfamilia);
                        dlgVentana.Update(3, rstLinVenta."Line No.");
                        rstLinVenta.Validate(Confirmada, false);

                        intRepeticiones += 1;

                        rstLinAjuste.CalcFields(rstLinAjuste."Cantidad en remito", rstLinAjuste."Kilos Netos en remito",
                                                rstLinAjuste."Kilos Brutos en remito");

                        if (rstLinVenta."Outstanding Quantity" <> 0) and (rstLinVenta."Outstanding Quantity" < decCantidadAEnviar) then begin

                            if intCantidadLineas = intRepeticiones then
                                Error('No existe suficiente cantidad para emitir este remito')
                            else begin

                                rstLinVenta.Validate("Qty. to Ship", rstLinVenta."Outstanding Quantity");
                                decCantidadAEnviar -= rstLinVenta."Qty. to Ship";

                            end;

                        end
                        else begin

                            if rstLinVenta."Outstanding Quantity" <> 0 then begin

                                rstLinVenta.Validate("Qty. to Ship", decCantidadAEnviar);
                                decCantidadAEnviar := 0;

                            end;

                        end;

                        if (rstLinVenta."Outstanding Net Kilos" <> 0) and (rstLinVenta."Outstanding Net Kilos" < decKilosNAenviar) then begin

                            if intCantidadLineas = intRepeticiones then
                                Error('No existe suficiente cantidad de KN para emitir este remito')
                            else begin

                                rstLinVenta.Validate("Net kilos to Ship", rstLinVenta."Outstanding Net Kilos");
                                decKilosNAenviar -= rstLinVenta."Net kilos to Ship";

                            end;

                        end
                        else begin

                            if rstLinVenta."Outstanding Net Kilos" <> 0 then begin

                                rstLinVenta.Validate("Net kilos to Ship", decKilosNAenviar);
                                decKilosNAenviar := 0;

                            end;

                        end;

                        if (rstLinVenta."Outstanding Gross Kilos" <> 0) and (rstLinVenta."Outstanding Gross Kilos" < decKilosBAenviar) then begin

                            if intCantidadLineas = intRepeticiones then
                                Error('No existe suficiente cantidad de KB para emitir este remito')
                            else begin

                                rstLinVenta.Validate("Gross kilos to Ship", rstLinVenta."Outstanding Gross Kilos");
                                decKilosBAenviar -= rstLinVenta."Gross kilos to Ship";

                            end;

                        end
                        else begin

                            if rstLinVenta."Outstanding Gross Kilos" <> 0 then begin

                                rstLinVenta.Validate("Gross kilos to Ship", decKilosBAenviar);
                                decKilosBAenviar := 0;

                            end;

                        end;

                        rstLinVenta.Validate(Confirmada, true);
                        rstLinVenta.Modify;

                    /*  IF (rstLinVenta."Ajuste KN" <> 0) OR (rstLinVenta."Ajuste KB" <> 0) THEN
                        fntGenerarLinea(rstLinVenta,intLinea);
                     */

                    until (rstLinVenta.Next = 0) or (decCantidadAEnviar + decKilosNAenviar + decKilosBAenviar = 0);

                end;

            until rstLinAjuste.Next = 0;

        dlgVentana.Close;
        Message('Remito Completado');

    end;

    [Scope('OnPrem')]
    procedure fntGenerarLinea(rstLinVenta: Record "Sales Line"; intLinea: Integer)
    var
        rstLinVenta2: Record "Sales Line";
        rstItem: Record Item;
    begin
        Clear(rstLinVenta2);
        rstLinVenta2.TransferFields(rstLinVenta);
        rstItem.Get(rstLinVenta2."No.");
        rstLinVenta2.Validate(Confirmada, false);
        rstLinVenta2."Line No." := intLinea + (rstLinVenta."Line No." / 10000);
        rstLinVenta2.Validate(Quantity, 0);
        rstLinVenta2.Validate("Unit Price", 0);
        rstLinVenta2.Validate("Unit Cost (LCY)", 0);
        rstLinVenta2.Validate("Precio x Kilo", 0);
        rstLinVenta2.Validate("Gross kilos", rstLinVenta."Ajuste KB");
        rstLinVenta2.Validate("Net kilos", rstLinVenta."Ajuste KN");
        rstLinVenta2."Ajuste KN" := 0;
        rstLinVenta2."Ajuste KB" := 0;
        rstLinVenta2.Validate("Cód. concepto ajuste", "Cód. concepto ajuste");
        rstLinVenta2.Validate(Confirmada, true);
        rstLinVenta2.Validate("Shortcut Dimension 7 Code", rstItem."Global Dimension 7 Code");
        rstLinVenta2."Línea ajustada" := rstLinVenta."Line No.";
        rstLinVenta2.Insert;
    end;

    [Scope('OnPrem')]
    procedure fntEliminarAjustes()
    begin
        //Limpio los ajustes previos


        Clear(rstLinVenta);
        rstLinVenta.SetRange("Document Type", "Tipo documento");
        rstLinVenta.SetRange("Document No.", "Documento venta");
        rstLinVenta.ModifyAll(Confirmada, false);

        Clear(rstLinVenta);
        rstLinVenta.SetRange("Document Type", "Tipo documento");
        rstLinVenta.SetRange("Document No.", "Documento venta");
        rstLinVenta.SetRange(Type, rstLinVenta.Type::Item);
        if rstLinVenta.Find('-') then
            repeat

                if rstLinVenta."KN Originales" <> 0 then;

                if (rstLinVenta."Ajuste KN" <> 0) then begin

                    rstLinVenta.Validate(rstLinVenta."Net kilos to Ship", rstLinVenta."Net kilos to Ship" - rstLinVenta."Ajuste KN");
                    rstLinVenta."Ajuste KN" := 0;

                end;

                if (rstLinVenta."Ajuste KB" <> 0) then begin

                    rstLinVenta.Validate(rstLinVenta."Gross kilos to Ship", rstLinVenta."Gross kilos to Ship" - rstLinVenta."Ajuste KB"
                );
                    rstLinVenta."Ajuste KB" := 0;

                end;

                rstLinVenta.Confirmada := false;
                rstLinVenta."KN sin ajuste" := 0;
                rstLinVenta."KB sin ajuste" := 0;
                rstLinVenta."Ajuste KN" := 0;
                rstLinVenta."Ajuste KB" := 0;
                rstLinVenta.Confirmada := true;
                rstLinVenta.Modify;

            until rstLinVenta.Next = 0;

        Clear(rstLinVenta);
        rstLinVenta.SetRange("Document Type", "Tipo documento");
        rstLinVenta.SetRange("Document No.", "Documento venta");
        rstLinVenta.DeleteAll(true);
    end;

    [Scope('OnPrem')]
    procedure fntGenerarLinsReparto()
    var
        rstMovReserva: Record "Reservation Entry";
        rstItem: Record Item;
        rstJob: Record Job;
        l_rstLinVenta: Record "Sales Line";
        ReserveSalesLine: Codeunit "Sales Line-Reserve";
        rstLReparto: Record "Lín. reparto";
    begin
        if not Confirm('¿Desea cerrar este remito?') then
            exit;

        Clear(rstLinVenta);
        rstLinVenta.SetRange("Document Type", "Tipo documento");
        rstLinVenta.SetRange("Document No.", "Documento venta");
        rstLinVenta.SetRange(rstLinVenta."No. remito oficial", "No. documento");
        if rstLinVenta.Find('-') then
            repeat

                if rstLinVenta."Quantity Shipped" = 0 then begin
                    /*
                    CLEAR(rstMovReserva);
                    rstMovReserva.SETRANGE("Source ID","Documento venta");
                    rstMovReserva.SETRANGE("Source Ref. No.",rstLinVenta."Line No.");
                    rstMovReserva.FINDFIRST;
                    rstMovReserva.DELETE(TRUE);
                    */
                    Clear(l_rstLinVenta);
                    l_rstLinVenta.Get(rstLinVenta."Document Type", rstLinVenta."Document No.", rstLinVenta."Line No.");
                    //l_rstLinVenta.DELETE(TRUE);
                    if (l_rstLinVenta.Quantity <> 0) and l_rstLinVenta.ItemExists(l_rstLinVenta."No.") then begin
                        Commit;
                        if ReserveSalesLine.DeleteLineConfirm(l_rstLinVenta) then
                            ReserveSalesLine.DeleteLine(l_rstLinVenta);
                        l_rstLinVenta.Delete(true);
                    end;
                end
                else
                    Error(ErrorEnviado);

            until rstLinVenta.Next = 0;

        Clear(rstLinVenta);
        rstLinVenta.SetRange("Document Type", "Tipo documento");
        rstLinVenta.SetRange("Document No.", "Documento venta");
        if rstLinVenta.Find('+') then
            intLinea := rstLinVenta."Line No."
        else
            intLinea := 0;

        Clear(rstLinAjuste);
        rstLinAjuste.SetRange("No. documento", "No. documento");
        if rstLinAjuste.Find('-') then
            repeat

                Clear(rstLReparto);
                if rstLReparto.Get(rstLinAjuste."No. reparto", rstLinAjuste."Linea reparto") then;
                rstLinAjuste.CalcFields("Cantidad en remito");
                if rstLinAjuste."Cantidad en remito" > rstLinAjuste."Cantidad a reservar" then
                    if not Confirm('Está seleccionando una cantidad superior a la habilitada en el Reparto para el producto ' + rstLinAjuste."No. producto") then
                        Error('Se ha cancelado el proceso');

                Clear(rstLinVenta);
                Clear(rstMovRemitos);
                rstMovRemitos.SetCurrentKey("No. documento", "Cód. depósito", "Cód. caja");
                rstMovRemitos.SetAscending("Cód. caja", false);
                rstMovRemitos.SetRange(rstMovRemitos."No. documento", "No. documento");
                rstMovRemitos.SetRange("No. producto", rstLinAjuste."No. producto");
                rstMovRemitos.SetRange("Seguimiento para trazabilidad", rstLinAjuste."Seguimiento para trazabilidad");
                if rstLinAjuste."No. reparto" <> '' then begin
                    rstMovRemitos.SetRange("No. reparto", rstLinAjuste."No. reparto");
                    rstMovRemitos.SetRange("Linea reparto", rstLinAjuste."Linea reparto");
                end;
                if rstLinAjuste."Lote origen" <> '' then
                    rstMovRemitos.SetRange("Lote origen", rstLinAjuste."Lote origen");

                if rstMovRemitos.FindSet then
                    repeat

                        intLinea += 10000;
                        Clear(rstItem);
                        rstItem.Get(rstMovRemitos."No. producto");
                        rstItem.TestField("Sales Unit of Measure");
                        rstLinVenta."Document Type" := rstLinVenta."Document Type"::Order;
                        rstLinVenta."Document No." := "Documento venta";
                        rstLinVenta."Line No." := intLinea;
                        rstLinVenta.Validate("Sell-to Customer No.", "Venta a-No. cliente");
                        rstLinVenta.Validate(Type, rstLinVenta.Type::Item);
                        rstLinVenta.Validate("No.", rstMovRemitos."No. producto");
                        rstLinVenta."Item Category Code" := rstItem."Item Category Code";
                        rstLinVenta.Validate("Location Code", rstMovRemitos."Cód. depósito");
                        if rstMovRemitos."Cód. caja" <> '' then
                            rstLinVenta.Validate("Bin Code", rstMovRemitos."Cód. caja");
                        rstLinVenta.Validate("Exit Point", rstMovRemitos."Puerto/Aeropuerto");
                        rstLinVenta.Validate("Seguimiento para trazabilidad", rstMovRemitos."Seguimiento para trazabilidad");
                        rstLinVenta.Validate("DCL application date formula", rstMovRemitos."DCL application date formula");
                        rstLinVenta.Validate("Puerto destino", "Puerto destino");
                        Clear(cduFishing);

                        cduFishing.fntLinkLote(rstMovRemitos."No. producto", 37, 1, rstMovRemitos.Cantidad, rstMovRemitos."Kilos netos",
                                            rstMovRemitos."Kilos brutos", rstLinVenta."Document No.", '', rstLinVenta."Line No.",
                                            rstMovRemitos.Lote, rstMovRemitos."Cód. depósito",
                                            0D);

                        //rstLinVenta.VALIDATE("No. lote",rstMovRemitos.Lote);
                        rstLinVenta."No. remito oficial" := "No. documento";
                        rstLinVenta."Lote origen" := rstMovRemitos."Lote origen";
                        rstLinVenta."No. Pallet" := rstMovRemitos."No. pallet";
                        rstLinVenta."Permiso de embarque" := "Permiso de embarque";
                        rstLinVenta."Cód. transportista" := "Cód. transportista";
                        rstLinVenta."Cód. contenedor" := "Cód. Contenedor";
                        rstLinVenta.Validate(Quantity, rstMovRemitos.Cantidad);
                        rstLinVenta.Validate("Gross kilos", rstMovRemitos."Kilos brutos");
                        rstLinVenta.Validate("Net kilos", rstMovRemitos."Kilos netos");
                        rstLinVenta."No. reparto" := rstLinAjuste."No. reparto";
                        rstLinVenta."Linea reparto" := rstLinAjuste."Linea reparto";
                        Clear(rstJob);
                        rstJob.SetRange(Tipo, rstJob.Tipo::Productivo);
                        rstJob.SetRange("Global Dimension 1 Code", rstMovRemitos.Buque);
                        rstJob.SetRange("Global Dimension 3 Code", rstMovRemitos.Marea);
                        if rstJob.Count > 1 then
                            Error(ErrorProyecto, rstMovRemitos.Buque, rstMovRemitos.Marea)
                        else begin
                            if rstJob.FindFirst then
                                rstLinVenta.Validate("Job No.", rstJob."No.")
                            else begin
                                if rstJob.Get('PP-' + rstMovRemitos.Buque + '-' + rstMovRemitos.Marea) then
                                    rstLinVenta.Validate("Job No.", 'PP-' + rstMovRemitos.Buque + '-' + rstMovRemitos.Marea)
                                else
                                    Error(ErrorProyectoNoExiste, rstMovRemitos.Buque, rstMovRemitos.Marea);
                            end;

                        end;

                        //rstLinVenta.Confirmada := TRUE;
                        rstLinVenta.Insert;
                        rstLinVenta.Validate("Shortcut Dimension 1 Code", rstMovRemitos.Buque);
                        rstLinVenta.Validate("Shortcut Dimension 3 Code", rstMovRemitos.Marea);
                        rstLinVenta.Validate("Shortcut Dimension 6 Code", "Global Dimension 6");
                        if rstItem."Global Dimension 7 Code" <> '' then
                            rstLinVenta.Validate("Shortcut Dimension 7 Code", rstItem."Global Dimension 7 Code");
                        rstLinVenta."Lote origen" := rstMovRemitos."Lote origen";
                        rstLinVenta.Modify;

                    until rstMovRemitos.Next = 0;

            until rstLinAjuste.Next = 0;

    end;

    [Scope('OnPrem')]
    procedure fntMoverNroRemito()
    var
        dlgRemito: Page MoveToShipment;
        codRemito: Code[20];
        rstAjuste2: Record "Lín. ajuste ventas";
        rstMovRemitos2: Record "Mov. remitos";
    begin
        Clear(dlgRemito);
        codRemito := '';

        clear(dlgRemito);
        dlgRemito.SetShipmentNo(rstAjuste."No. documento");
        If dlgRemito.RunModal() = Action::LookupOK then
            codRemito := dlgRemito.GetShipmentNo();
        dlgRemito.Close;

        if codRemito = '' then
            Error('Debe ingresar un nuevo No. de remito');

        If codRemito = rstAjuste."No. documento" then
            Error('El nuevo número de remito no puede ser igual al anterior');

        Clear(cduDigitalizarOAbrir);
        codRemito := cduDigitalizarOAbrir.VerificarRemitoCliente(codRemito);

        Clear(rstAjuste);
        rstAjuste.SetRange(rstAjuste."No. documento", "No. documento");
        if rstAjuste.Find('-') then
            repeat

                Clear(rstAjuste2);
                rstAjuste2.Get(rstAjuste."No. documento", rstAjuste."No. producto", rstAjuste."Lote origen");
                rstAjuste2.Rename(codRemito, rstAjuste2."No. producto", rstAjuste2."Lote origen");

            until rstAjuste.Next = 0;

        Clear(rstMovRemitos);
        rstMovRemitos.SetRange("No. documento", "No. documento");
        if rstMovRemitos.Find('-') then
            repeat

                Clear(rstMovRemitos2);
                rstMovRemitos2.Get(rstMovRemitos."No. documento", rstMovRemitos."No. línea");
                rstMovRemitos2.Rename(codRemito, rstMovRemitos2."No. línea");

            until rstMovRemitos.Next = 0;

        Rename(codRemito);
        "No. remito" := codRemito;

        Message('Proceso finalizado');
    end;

    local procedure fntTC()
    begin
        decCF := 0;
        if "Currency Factor" <> 0 then
            decCF := 1 / "Currency Factor";
    end;
}

