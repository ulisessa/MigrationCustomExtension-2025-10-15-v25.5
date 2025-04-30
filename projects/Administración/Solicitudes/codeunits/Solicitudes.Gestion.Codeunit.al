codeunit 50508 GestionSolicitudes
{

    trigger OnRun()
    begin
    end;

    var
        blnSalir: Boolean;
        AsciiStr: Text[250];
        AnsiStr: Text[250];
        CharVar: array[32] of Char;

    [Scope('OnPrem')]
    procedure fntRegistroSolicitud(rstCabProd: Record Solicitud; blnRevertir: Boolean): Boolean
    var
        i: Integer;
        RegistroVisible: Boolean;
        rstConfUsu: Record "User Setup";
        cduMensajeria: Codeunit "Mensajería";
        rstMensajeria: Record Mensajeria;
        rstLinSol: Record "Lín. solicitud";
        rstLinSolNew: Record "Lín. solicitud";
    begin
        with rstCabProd do begin

            Clear(rstLinSol);
            rstLinSol.SetRange("Nombre libro Solicitud", "Nombre Libro Solicitud");
            //rstLinSol.SETRANGE("Tipo documento","Tipo documento");
            rstLinSol.SetRange("No. Documento", "No. documento");
            rstLinSol.SetFilter(Tipo, '<>%1', rstLinSol.Tipo::" ");
            if rstLinSol.Find('-') then
                repeat

                    rstLinSol.TestField(rstLinSol."No.");
                    rstLinSol.TestField(rstLinSol.Descripcion);
                    rstLinSol.TestField(rstLinSol."Cod. unidad medida");
                    rstLinSol.TestField(rstLinSol.Cantidad);

                    rstLinSol.Registrado := true;
                    rstLinSol.Aprobado := true;
                    rstLinSol.Modify;

                until rstLinSol.Next = 0;

            Clear(rstLinSol);
            rstLinSol.SetRange("Nombre libro Solicitud", "Nombre Libro Solicitud");
            //rstLinSol.SETRANGE("Tipo documento","Tipo documento");
            rstLinSol.SetRange("No. Documento", "No. documento");
            rstLinSol.SetFilter(Tipo, '=%1', rstLinSol.Tipo::" ");
            if rstLinSol.Find('-') then
                repeat

                    rstLinSol.TestField(rstLinSol.Descripcion);

                    rstLinSol.Registrado := true;
                    rstLinSol.Aprobado := true;
                    rstLinSol.Modify;

                until rstLinSol.Next = 0;

            exit(true);

        end;
    end;

    [Scope('OnPrem')]
    procedure fntAnularSolicitud(var Lin: Record "Lín. solicitud")
    var
        "Almacén": Record Location;
        Lin2: Record "Lín. solicitud";
        rstConfUsu: Record "User Setup";
        rstMensajeria: Record Mensajeria;
        cduMensajeria: Codeunit "Mensajería";
        i: Integer;
        dlgDialogo: Dialog;
        j: Integer;
        rst50103: RecordRef;
        cduValidaciones: Codeunit Validaciones;
        strFiltro: array[250, 3] of Text[30];
        strDoc: Code[20];
        rstCVC: Record Solicitud;
    begin
        i := 0;
        dlgDialogo.Open('Revirtiendo #1############# de #2#############\' +
                        '                       @3@@@@@@@@@@@@@@@@@@@@@');

        j := Lin.Count;
        dlgDialogo.Update(2, j);

        strDoc := Lin."No. Documento";
        Lin.SetRange(Revertido, false);
        if Lin.FindSet then
            repeat

                Clear(rstCVC);
                rstCVC.SetRange(rstCVC."No. documento", Lin."No. Documento");
                if rstCVC.FindFirst then begin

                    if Lin.Revertido then
                        Error('La línea no. %1 ya fue revertida previamente.', Lin."No. linea");
                    if Lin.Cantidad < 0 then
                        Error('No puede revertir la línea no. %1 ya que es una línea de reversión.', Lin."No. linea");

                    i += 1;
                    dlgDialogo.Update(1, i);
                    dlgDialogo.Update(3, Round(i / j, 1));

                    rst50103.GetTable(Lin);
                    cduValidaciones.ValidarxTabla(rst50103, rst50103.GetPosition(), strFiltro);

                    Lin.CalcFields("Solicitud pendiente cotizacion",
                                   "Solicitud pendiente en Factura",
                                   "Solicitud pendiente en OC");
                    /*
                    Lin.TESTFIELD("Solicitud pendiente cotizacion",0);
                    Lin.TESTFIELD("Solicitud pendiente en Factura",0);
                    Lin.TESTFIELD("Solicitud pendiente en OC",0);
                    Lin.TESTFIELD("Cantidad pendiente facturar",0);
                    */
                    if Lin."Cant. Facturada" <> 0 then
                        Error('La línea número ' + Format(Lin."No. linea") + ' ya fue facturada.');
                    if Lin."Cant. Recibida" <> 0 then
                        Error('La línea número ' + Format(Lin."No. linea") + ' ya fue recibida.');
                    Lin.TestField(Registrado, true);

                    Clear(Lin2);
                    Lin2 := Lin;
                    Lin2."No. linea" += 5000;
                    Lin2.Cantidad := -Lin.Cantidad;
                    Lin2.Insert;

                    Lin.Revertido := true;
                    Lin2.Revertido := true;
                    Lin.Aprobado := false;
                    Lin2.Aprobado := false;
                    Lin.Modify;
                    Lin2.Modify;

                end;

            until Lin.Next = 0;

        Clear(Lin);
        Lin.SetRange("No. Documento", strDoc);
        Lin.SetFilter(Cantidad, '>0');
        Lin.SetRange(Revertido, false);
        if Lin.FindFirst then begin

            Clear(Lin);
            Lin.SetRange("No. Documento", strDoc);
            Lin.SetFilter(Cantidad, '<0');
            Lin.SetRange(Revertido, false);
            if Lin.FindFirst then begin

                rstConfUsu.Reset;
                if rstConfUsu.Get(UserId) then
                    cduMensajeria.RegistrarMensaje('Registro ' + rstCVC."Tipo documento", '', strDoc, rstCVC."Tipo documento", 'Parcialmente revertido', Today,
                    rstMensajeria."Tipo movimiento"::Seguimiento, rstConfUsu.Grupo, '', '', '', '', '', '', '');

            end

        end
        else begin

            rstConfUsu.Reset;
            if i <> 0 then
                if rstConfUsu.Get(UserId) then
                    cduMensajeria.RegistrarMensaje('Registro ' + rstCVC."Tipo documento", '', strDoc, rstCVC."Tipo documento", 'Completamente revertido', Today,
                    rstMensajeria."Tipo movimiento"::Seguimiento, rstConfUsu.Grupo, '', '', '', '', '', '', '');

        end;

        dlgDialogo.Close;

    end;

    [Scope('OnPrem')]
    procedure fntSolicitud(strDocumento: Text[30]; strCantidad: Text[30]; strImporte: Text[30]; strNivel4: Text[30]; strNivel5: Text[30]; strNivel6: Text[30]; strNivel7: Text[30]): Boolean
    var
        rstCSolicitud: Record Solicitud;
        rstLSolicitud: Record "Lín. solicitud";
        rstHCSolicitud: Record Solicitud;
        rstHLSolicitud: Record "Lín. solicitud";
        cduGestNoSerie: Codeunit "No. Series";
        rstLibroCompra: Record "Req. Wksh. Template";
        cduMensajeria: Codeunit "Mensajería";
        blnNueva: Boolean;
    begin
        Clear(rstCSolicitud);
        Clear(rstLSolicitud);
        Clear(rstHCSolicitud);
        Clear(rstHLSolicitud);

        rstHCSolicitud.SetCurrentKey(rstHCSolicitud."No. documento");
        rstHCSolicitud.SetRange("No. documento", strDocumento);
        if rstHCSolicitud.Find('-') then begin

            rstHLSolicitud.SetRange(rstHLSolicitud."Nombre libro Solicitud", rstHCSolicitud."Nombre Libro Solicitud");
            rstHLSolicitud.SetRange("No. Documento", rstHCSolicitud."No. documento");
            if rstHLSolicitud.Find('-') then
                repeat

                    if rstHLSolicitud.Registrado then begin

                        Message('La solicitud ya ha sido utilizada. Imposible anular');
                        exit(false);

                    end;

                until rstHLSolicitud.Next = 0;

        end;

        Clear(rstHCSolicitud);
        Clear(rstHLSolicitud);
        Clear(rstLibroCompra);

        rstHCSolicitud.SetCurrentKey(rstHCSolicitud."No. documento");
        rstHCSolicitud.SetRange("No. documento", strDocumento);
        if rstHCSolicitud.Find('-') then begin

            if Confirm('Desea crear una solicitud en base a la actual?') then
                blnNueva := true;

            if blnNueva then begin

                rstLibroCompra.Get(rstHCSolicitud."Nombre Libro Solicitud");
                rstCSolicitud.TransferFields(rstHCSolicitud);
                rstCSolicitud."No. documento" := '';
                rstCSolicitud."No. documento" := cduGestNoSerie.GetNextNo(rstLibroCompra."No. Serie");
                rstCSolicitud.Insert;

            end;

            rstHLSolicitud.SetRange(rstHLSolicitud."Nombre libro Solicitud", rstHCSolicitud."Nombre Libro Solicitud");
            rstHLSolicitud.SetRange("No. Documento", rstHCSolicitud."No. documento");
            if rstHLSolicitud.Find('-') then
                repeat

                    if blnNueva then begin

                        rstLSolicitud.TransferFields(rstHLSolicitud);
                        rstLSolicitud."No. Documento" := rstCSolicitud."No. documento";
                        rstLSolicitud."Fecha aprobacion" := 0D;
                        rstLSolicitud.Insert;

                    end;

                    rstHLSolicitud.Cantidad := 0;
                    rstHLSolicitud."Cantidad pendiente recibir" := 0;
                    rstHLSolicitud."Cantidad pendiente facturar" := 0;
                    rstHLSolicitud."Cancelado por motivo" := 'ANULADA';
                    rstHLSolicitud."Fecha reversion" := Today;
                    rstHLSolicitud."Usuario reversion" := UserId;
                    rstHLSolicitud.Revertido := true;
                    rstHLSolicitud.Modify;

                until rstHLSolicitud.Next = 0;

        end;

        //US.ARBU - 20040524 - Inicio Modificación Arbumasa para el seguimiento de documentos

        if blnNueva then begin

            rstConfUsu.Reset;
            if rstConfUsu.Get(UserId) then
                cduMensajeria.RegistrarMensaje('Alta de Solicitud', '', rstCSolicitud."No. documento", 'Solicitud (compras)', 'Abierto', Today,
                rstMensajeria."Tipo movimiento"::"Mensaje con Seguimiento", rstConfUsu.Grupo, '', '', '', '', '', '', '');

        end;

        if rstConfUsu.Get(UserId) then
            cduMensajeria.RegistrarMensaje('Solicitud anulada', '', strDocumento, 'Solicitud (compras)', 'Anulado', Today,
            rstMensajeria."Tipo movimiento"::Seguimiento, rstConfUsu.Grupo, '', '', '', '', '', '', '');

        //US.ARBU - 20040531 - Fin Modificación Arbumasa para el seguimiento de documentos

        exit(true);
    end;

    procedure FunSol(PurchHeader: Record "Purchase Header")
    var
        PunLinCompra: Record "Purchase Line";
        PunLinSol: Record "Lín. solicitud";
        PunCabSol: Record Solicitud;
        PunMensajeria: Record Mensajeria;
        PunLinCompras: Record "Purchase Line";
        ConfUsu: Record "User Setup";
        CodeMens: Codeunit "Mensajería";
        optEstado: Option "'Completamente facturado'","'Completamente recibido y parcialmente facturado'","'Completamente recibido'","'Parcialmente recibido y parcialmente facturado'","'Parcialmente recibido'","'Abierto'";
        decPedido: Decimal;
        decRecibido: Decimal;
        decFacturado: Decimal;
        rstLR: Record "Purch. Rcpt. Line";
        rst38: Record "Purchase Header";
        rstLFC: Record "Purch. Inv. Line";
        rstPIH: Record "Purch. Inv. Header";
    begin
        //IBdos Argentina - USS - 020403 - Inicio Modificación Arbumasa
        //Seguimiento estado de documentos

        decPedido := 0;
        decFacturado := 0;
        decRecibido := 0;

        case PurchHeader."Document Type" of
            PurchHeader."Document Type"::Order:
                FunSol38(PurchHeader);
            PurchHeader."Document Type"::Invoice:
                begin

                    Clear(rstLFC);
                    rstLFC.SetRange(rstLFC."Document No.", PurchHeader."No.");
                    if rstLFC.Find('-') then
                        repeat

                            Clear(rstLR);
                            Clear(rst38);
                            if rstLR.Get(rstLFC."Receipt No.", rstLFC."Receipt Line No.") then begin

                                if rst38.Get(rst38."Document Type"::Order, rstLR."Order No.") then
                                    FunSol38(rst38);

                            end;

                        until rstLFC.Next = 0;

                end;

        end;
    end;

    procedure FunSol38(rstPH: Record "Purchase Header")
    var
        PunLinCompra: Record "Purchase Line";
        PunLinSol: Record "Lín. solicitud";
        PunCabSol: Record Solicitud;
        PunMensajeria: Record Mensajeria;
        PunLinCompras: Record "Purchase Line";
        ConfUsu: Record "User Setup";
        CodeMens: Codeunit "Mensajería";
        optEstado: Option "'Completamente facturado'","'Completamente recibido y parcialmente facturado'","'Completamente recibido'","'Parcialmente recibido y parcialmente facturado'","'Parcialmente recibido'","'Abierto'";
        decPedido: Decimal;
        decRecibido: Decimal;
        decFacturado: Decimal;
        decPendienteRecibir: Decimal;
        decPendienteFacturar: Decimal;
    begin
        //IBdos Argentina - USS - 020403 - Inicio Modificación Arbumasa
        //Seguimiento estado de documentos

        decPedido := 0;
        decFacturado := 0;
        decRecibido := 0;
        decPendienteRecibir := 0;
        decPendienteFacturar := 0;

        Clear(PunLinCompra);
        PunLinCompra.SetRange(PunLinCompra."Document Type", rstPH."Document Type");
        PunLinCompra.SetRange(PunLinCompra."Document No.", rstPH."No.");
        if PunLinCompra.Find('-') then
            repeat

                if PunLinCompra."No. Cab. Solicitud" <> '' then begin

                    PunLinSol.Reset;
                    PunLinSol.SetCurrentKey("No. Documento", "No. linea");
                    PunLinSol.SetRange(PunLinSol."No. Documento", PunLinCompra."No. Cab. Solicitud");
                    PunLinSol.SetRange("No. linea", PunLinCompra."No. Linea Solicitud");
                    if PunLinSol.Find('-') then begin

                        PunLinSol.CalcFields("Cant. Facturada", "Cant. Recibida");
                        decPendienteRecibir := PunLinSol.Cantidad - PunLinSol."Cant. Recibida";
                        decPendienteFacturar := PunLinSol.Cantidad - PunLinSol."Cant. Facturada";
                        if PunLinSol.Tipo in [PunLinSol.Tipo::Producto, PunLinSol.Tipo::Recurso] then begin

                            PunLinSol.Validate(Aplicado, true);
                            if (decPendienteRecibir = PunLinSol.Cantidad) and (decPendienteFacturar = PunLinSol.Cantidad) then begin

                                case rstPH."Document Type" of
                                    rstPH."Document Type"::Order:
                                        PunLinSol.Validate(Estado, 'En pedido');
                                    rstPH."Document Type"::Quote:
                                        PunLinSol.Validate(Estado, 'En cotización');
                                    rstPH."Document Type"::Invoice:
                                        PunLinSol.Validate(Estado, 'En factura');
                                    else
                                        PunLinSol.Validate(Estado, '');
                                end;
                            end
                            else
                                if (decPendienteRecibir = 0) and (decPendienteFacturar = PunLinSol.Cantidad) then
                                    PunLinSol.Validate(Estado, 'Recibido')
                                else
                                    if (decPendienteRecibir <> 0) and (decPendienteFacturar = PunLinSol.Cantidad) then
                                        PunLinSol.Validate(Estado, 'Parcialmente recibido')
                                    else
                                        if (decPendienteRecibir <> 0) and (decPendienteFacturar < PunLinSol.Cantidad)
                                        and (decPendienteFacturar <> 0) then
                                            PunLinSol.Validate(Estado, 'Parcialmente recibido y Parcialmente facturado')
                                        else
                                            if (decPendienteRecibir = 0) and (decPendienteFacturar = 0) then
                                                PunLinSol.Validate(Estado, 'Completada')
                                            else
                                                if (decPendienteRecibir = 0) and (decPendienteFacturar > 0) then
                                                    PunLinSol.Validate(Estado, 'Recibido y Parcialmente facturado');

                        end;
                        PunLinSol.Modify;

                    end;

                    PunCabSol.Reset;
                    PunCabSol.SetRange(PunCabSol."Nombre Libro Solicitud", PunLinSol."Nombre libro Solicitud");
                    PunCabSol.SetRange(PunCabSol."No. documento", PunLinSol."No. Documento");
                    PunMensajeria.SetCurrentKey("Tipo movimiento", "Tipo Documento", Estado, "No. documento");
                    PunMensajeria.SetRange("Tipo movimiento", PunMensajeria."Tipo movimiento"::"Mensaje con Seguimiento");
                    PunMensajeria.SetRange("Tipo Documento", 'Solicitud (compras)');
                    PunMensajeria.SetRange(Estado, 'Completada');
                    PunMensajeria.SetRange("No. documento", PunLinCompra."Document No.");
                    if not PunMensajeria.Find('-') then begin

                        PunLinSol.Reset;
                        PunLinSol.SetCurrentKey("No. Documento", Estado);
                        PunLinSol.SetRange(PunLinSol."No. Documento", PunLinCompra."No. Cab. Solicitud");
                        PunLinSol.SetFilter(Estado, '<>%1|<>%2', 'Recibido', 'Completada');
                        if not PunLinSol.Find('-') then begin

                            ConfUsu.Reset;
                            ConfUsu.Get(UserId);
                            if ConfUsu.Find('-') then
                                CodeMens.RegistrarMensaje('Solicitud Completa', '', PunLinCompra."No. Cab. Solicitud", 'Solicitud (compras)',
                                'Completada', Today, PunMensajeria."Tipo movimiento"::Seguimiento, ConfUsu.Grupo, '', '', '', '', '', '', '');

                        end;

                    end;

                end;

                decPedido += PunLinCompra.Quantity;
                decFacturado += PunLinCompra."Quantity Invoiced";
                decRecibido += PunLinCompra."Quantity Received";

            until PunLinCompra.Next = 0;

        //'Completamente facturado','Completamente recibido y parcialmente facturado','Completamente recibido','Parcialmente recibido y parcialmente facturado','Parcialmente recibido','Abierto'
        if decPedido <> 0 then begin

            if (decPedido = decFacturado) then begin

                ConfUsu.Reset;
                ConfUsu.Get(UserId);
                if ConfUsu.Find('-') then
                    CodeMens.RegistrarMensaje('Orden de Compra', '', PunLinCompra."Document No.", 'Pedido (compras)',
                    'Completamente facturado', Today, PunMensajeria."Tipo movimiento"::Seguimiento, ConfUsu.Grupo, '', '', '', '', '', '', '');

            end;

            if (decPedido > decFacturado) and (decRecibido > decFacturado) and (decRecibido = decPedido) and (decFacturado <> 0) and (decRecibido <> 0) then begin

                ConfUsu.Reset;
                ConfUsu.Get(UserId);
                if ConfUsu.Find('-') then
                    CodeMens.RegistrarMensaje('Orden de Compra', '', PunLinCompra."Document No.", 'Pedido (compras)',
                    'Completamente recibido y parcialmente facturado', Today, PunMensajeria."Tipo movimiento"::Seguimiento, ConfUsu.Grupo, '', '', '', '', '', '', '');

            end;

            if (decFacturado = 0) and (decRecibido = decPedido) then begin

                ConfUsu.Reset;
                ConfUsu.Get(UserId);
                if ConfUsu.Find('-') then
                    CodeMens.RegistrarMensaje('Orden de Compra', '', PunLinCompra."Document No.", 'Pedido (compras)',
                    'Completamente recibido', Today, PunMensajeria."Tipo movimiento"::Seguimiento, ConfUsu.Grupo, '', '', '', '', '', '', '');

            end;

            if (decFacturado < decPedido) and (decRecibido < decPedido) and (decFacturado <> 0) and (decRecibido <> 0) then begin

                ConfUsu.Reset;
                ConfUsu.Get(UserId);
                if ConfUsu.Find('-') then
                    CodeMens.RegistrarMensaje('Orden de Compra', '', PunLinCompra."Document No.", 'Pedido (compras)',
                    'Parcialmente recibido y parcialmente facturado', Today, PunMensajeria."Tipo movimiento"::Seguimiento, ConfUsu.Grupo, '', '', '', '', '', '', '');

            end;

            if (decFacturado = 0) and (decRecibido < decPedido) and (decRecibido <> 0) then begin

                ConfUsu.Reset;
                ConfUsu.Get(UserId);
                if ConfUsu.Find('-') then
                    CodeMens.RegistrarMensaje('Orden de Compra', '', PunLinCompra."Document No.", 'Pedido (compras)',
                    'Parcialmente recibido', Today, PunMensajeria."Tipo movimiento"::Seguimiento, ConfUsu.Grupo, '', '', '', '', '', '', '');

            end;

            if (decFacturado = 0) and (decRecibido = 0) then begin

                ConfUsu.Reset;
                ConfUsu.Get(UserId);
                if ConfUsu.Find('-') then
                    CodeMens.RegistrarMensaje('Orden de Compra', '', PunLinCompra."Document No.", 'Pedido (compras)',
                    'Abierto', Today, PunMensajeria."Tipo movimiento"::Seguimiento, ConfUsu.Grupo, '', '', '', '', '', '', '');

            end;

        end
        else begin

            rstPH.CalcFields(Estado);
            if rstPH.Estado <> 'Abierto' then begin

                ConfUsu.Reset;
                ConfUsu.Get(UserId);
                if ConfUsu.Find('-') then
                    CodeMens.RegistrarMensaje('Orden de Compra', '', PunLinCompra."Document No.", 'Pedido (compras)',
                    'Abierto', Today, PunMensajeria."Tipo movimiento"::Seguimiento, ConfUsu.Grupo, '', '', '', '', '', '', '');

            end;

        end;

        Clear(PunLinCompra);
        PunLinCompra.SetRange("Document No.", rstPH."No.");
        PunLinCompra.SetFilter("No. Cab. Solicitud", '<>%1', '');
        if PunLinCompra.FindSet then
            repeat
                decPedido := 0;
                decFacturado := 0;
                decRecibido := 0;
                Clear(PunLinSol);
                PunLinSol.SetRange("No. Documento", PunLinCompra."No. Cab. Solicitud");
                PunLinSol.SetFilter(Cantidad, '<>%1', 0);
                if PunLinSol.FindSet then
                    repeat
                        PunLinSol.CalcFields("Cant. Facturada", "Cant. Recibida");
                        decPedido += PunLinSol.Cantidad;
                        decFacturado += PunLinSol."Cant. Facturada";
                        decRecibido += PunLinSol."Cant. Recibida";
                    until PunLinSol.Next = 0;
                Clear(PunMensajeria);
                PunMensajeria.SetCurrentKey("Tipo movimiento", "Tipo Documento", Estado, "No. documento");
                PunMensajeria.SetRange("Tipo movimiento", PunMensajeria."Tipo movimiento"::"Mensaje con Seguimiento");
                PunMensajeria.SetRange("Tipo Documento", 'Solicitud (compras)');
                PunMensajeria.SetFilter(Estado, '<>%1', 'Completamente facturado');
                PunMensajeria.SetRange("No. documento", PunLinCompra."No. Cab. Solicitud");
                if PunMensajeria.FindSet then begin
                    if (decPedido = decFacturado) and (decPedido = decRecibido) then
                        CodeMens.RegistrarMensaje('Solicitud Completa', '', PunLinCompra."No. Cab. Solicitud", 'Solicitud (compras)',
                        'Completamente facturado', Today, PunMensajeria."Tipo movimiento"::Seguimiento, ConfUsu.Grupo, '', '', '', '', '', '', '')
                    else begin
                        Clear(PunMensajeria);
                        PunMensajeria.SetCurrentKey("Tipo movimiento", "Tipo Documento", Estado, "No. documento");
                        PunMensajeria.SetRange("Tipo movimiento", PunMensajeria."Tipo movimiento"::"Mensaje con Seguimiento");
                        PunMensajeria.SetRange("Tipo Documento", 'Solicitud (compras)');
                        PunMensajeria.SetFilter(Estado, '<>%1', 'Completamente recibido y parcialmente facturado');
                        PunMensajeria.SetRange("No. documento", PunLinCompra."No. Cab. Solicitud");
                        if PunMensajeria.FindSet then begin
                            if (decPedido <> decFacturado) and (decPedido = decRecibido) and (decFacturado <> 0) then
                                CodeMens.RegistrarMensaje('Solicitud recibida y parcialmente facturada', '', PunLinCompra."No. Cab. Solicitud", 'Solicitud (compras)',
                                'Completamente recibido y parcialmente facturado', Today, PunMensajeria."Tipo movimiento"::Seguimiento, ConfUsu.Grupo, '', '', '', '', '', '', '')
                            else begin
                                Clear(PunMensajeria);
                                PunMensajeria.SetCurrentKey("Tipo movimiento", "Tipo Documento", Estado, "No. documento");
                                PunMensajeria.SetRange("Tipo movimiento", PunMensajeria."Tipo movimiento"::"Mensaje con Seguimiento");
                                PunMensajeria.SetRange("Tipo Documento", 'Solicitud (compras)');
                                PunMensajeria.SetFilter(Estado, '<>%1', 'Completamente recibido');
                                PunMensajeria.SetRange("No. documento", PunLinCompra."No. Cab. Solicitud");
                                if PunMensajeria.FindSet then begin
                                    if (0 = decFacturado) and (decPedido = decRecibido) then
                                        CodeMens.RegistrarMensaje('Solicitud recibida', '', PunLinCompra."No. Cab. Solicitud", 'Solicitud (compras)',
                                        'Completamente recibido', Today, PunMensajeria."Tipo movimiento"::Seguimiento, ConfUsu.Grupo, '', '', '', '', '', '', '')
                                    else begin
                                        Clear(PunMensajeria);
                                        PunMensajeria.SetCurrentKey("Tipo movimiento", "Tipo Documento", Estado, "No. documento");
                                        PunMensajeria.SetRange("Tipo movimiento", PunMensajeria."Tipo movimiento"::"Mensaje con Seguimiento");
                                        PunMensajeria.SetRange("Tipo Documento", 'Solicitud (compras)');
                                        PunMensajeria.SetFilter(Estado, '<>%1', 'Parcialmente recibido y parcialmente facturado');
                                        PunMensajeria.SetRange("No. documento", PunLinCompra."No. Cab. Solicitud");
                                        if PunMensajeria.FindSet then begin
                                            if (decPedido <> decFacturado) and (decPedido <> decRecibido) and (decFacturado <> 0) and (decRecibido <> 0) then
                                                CodeMens.RegistrarMensaje('Solicitud parcialmente recibida y facturada', '', PunLinCompra."No. Cab. Solicitud", 'Solicitud (compras)',
                                                'Parcialmente recibido y parcialmente facturado', Today, PunMensajeria."Tipo movimiento"::Seguimiento, ConfUsu.Grupo, '', '', '', '', '', '', '')
                                            else begin
                                                Clear(PunMensajeria);
                                                PunMensajeria.SetCurrentKey("Tipo movimiento", "Tipo Documento", Estado, "No. documento");
                                                PunMensajeria.SetRange("Tipo movimiento", PunMensajeria."Tipo movimiento"::"Mensaje con Seguimiento");
                                                PunMensajeria.SetRange("Tipo Documento", 'Solicitud (compras)');
                                                PunMensajeria.SetFilter(Estado, '<>%1', 'Parcialmente recibido');
                                                PunMensajeria.SetRange("No. documento", PunLinCompra."No. Cab. Solicitud");
                                                if PunMensajeria.FindSet then begin
                                                    if (0 = decFacturado) and (decPedido <> decRecibido) and (decRecibido <> 0) then
                                                        CodeMens.RegistrarMensaje('Solicitud parcialmente recibida', '', PunLinCompra."No. Cab. Solicitud", 'Solicitud (compras)',
                                                        'Parcialmente recibido', Today, PunMensajeria."Tipo movimiento"::Seguimiento, ConfUsu.Grupo, '', '', '', '', '', '', '');
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
                //'Completamente facturado','Completamente recibido y parcialmente facturado','Completamente recibido','Parcialmente recibido y parcialmente facturado','Parcialmente recibido','Abierto'
            until PunLinCompra.Next = 0;
    end;

    procedure FunSol120(rstPRH: Record "Purch. Rcpt. Header")
    var
        PunLinCompra: Record "Purch. Rcpt. Line";
        PunLinSol: Record "Lín. solicitud";
        PunCabSol: Record Solicitud;
        PunMensajeria: Record Mensajeria;
        PunLinCompras: Record "Purchase Line";
        ConfUsu: Record "User Setup";
        CodeMens: Codeunit "Mensajería";
        optEstado: Option "'Completamente facturado'","'Completamente recibido y parcialmente facturado'","'Completamente recibido'","'Parcialmente recibido y parcialmente facturado'","'Parcialmente recibido'","'Abierto'";
        decPedido: Decimal;
        decFacturado: Decimal;
    begin
        //IBdos Argentina - USS - 020403 - Inicio Modificación Arbumasa
        //Seguimiento estado de documentos

        decPedido := 0;
        decFacturado := 0;

        Clear(PunLinCompra);
        PunLinCompra.SetRange(PunLinCompra."Document No.", rstPRH."No.");
        if PunLinCompra.Find('-') then
            repeat

                if PunLinCompra."No. Cab. Solicitud" <> '' then begin

                    PunLinSol.Reset;
                    PunLinSol.SetCurrentKey("No. Documento", "No. linea");
                    PunLinSol.SetRange(PunLinSol."No. Documento", PunLinCompra."No. Cab. Solicitud");
                    PunLinSol.SetRange("No. linea", PunLinCompra."No. Linea Solicitud");
                    if PunLinSol.Find('-') then begin

                        PunLinSol.Validate(Aplicado, true);
                        PunLinSol.Modify;

                    end;

                    PunCabSol.Reset;
                    PunCabSol.SetRange(PunCabSol."Nombre Libro Solicitud", PunLinSol."Nombre libro Solicitud");
                    PunCabSol.SetRange(PunCabSol."No. documento", PunLinSol."No. Documento");
                    PunMensajeria.SetCurrentKey("Tipo movimiento", "Tipo Documento", Estado, "No. documento");
                    PunMensajeria.SetRange("Tipo movimiento", PunMensajeria."Tipo movimiento"::"Mensaje con Seguimiento");
                    PunMensajeria.SetRange("Tipo Documento", 'Solicitud (compras)');
                    PunMensajeria.SetRange(Estado, 'Completada');
                    PunMensajeria.SetRange("No. documento", PunLinCompra."Document No.");
                    if not PunMensajeria.Find('-') then begin

                        PunLinSol.Reset;
                        PunLinSol.SetCurrentKey("No. Documento", Estado);
                        PunLinSol.SetRange(PunLinSol."No. Documento", PunLinCompra."No. Cab. Solicitud");
                        PunLinSol.SetFilter(Estado, '<>%1|<>%2', 'Recibido', 'Completada');
                        if not PunLinSol.Find('-') then begin

                            ConfUsu.Reset;
                            ConfUsu.Get(UserId);
                            if ConfUsu.Find('-') then
                                CodeMens.RegistrarMensaje('Solicitud Completa', '', PunLinCompra."No. Cab. Solicitud", 'Solicitud (compras)',
                                'Completada', Today, PunMensajeria."Tipo movimiento"::Seguimiento, ConfUsu.Grupo, '', '', '', '', '', '', '');

                        end;

                    end;

                end;

                decPedido += PunLinCompra.Quantity;
                decFacturado += PunLinCompra."Quantity Invoiced";

            until PunLinCompra.Next = 0;

        //'Completamente facturado','Completamente recibido y parcialmente facturado','Completamente recibido','Parcialmente recibido y parcialmente facturado','Parcialmente recibido','Abierto'
        if decPedido <> 0 then begin

            if (decPedido = decFacturado) then begin

                ConfUsu.Reset;
                ConfUsu.Get(UserId);
                if ConfUsu.Find('-') then
                    CodeMens.RegistrarMensaje('Remito de compra', '', PunLinCompra."Document No.", 'Remito (compras)',
                    'Completamente facturado', Today, PunMensajeria."Tipo movimiento"::Seguimiento, ConfUsu.Grupo, '', '', '', '', '', '', '');

            end;

            if (decPedido > decFacturado) and (decFacturado <> 0) then begin

                ConfUsu.Reset;
                ConfUsu.Get(UserId);
                if ConfUsu.Find('-') then
                    CodeMens.RegistrarMensaje('Remito de compra', '', PunLinCompra."Document No.", 'Remito (compras)',
                    'Parcialmente facturado', Today, PunMensajeria."Tipo movimiento"::Seguimiento, ConfUsu.Grupo, '', '', '', '', '', '', '');

            end;

            if (decFacturado = 0) then begin

                ConfUsu.Reset;
                ConfUsu.Get(UserId);
                if ConfUsu.Find('-') then
                    CodeMens.RegistrarMensaje('Orden de Compra', '', PunLinCompra."Document No.", 'Pedido (compras)',
                    'Completamente recibido', Today, PunMensajeria."Tipo movimiento"::Seguimiento, ConfUsu.Grupo, '', '', '', '', '', '', '');

            end;

        end
        else begin

            rstPRH.CalcFields(Estado);
            if rstPRH.Estado <> 'Revertido' then begin

                ConfUsu.Reset;
                ConfUsu.Get(UserId);
                if ConfUsu.Find('-') then
                    CodeMens.RegistrarMensaje('Orden de Compra', '', PunLinCompra."Document No.", 'Pedido (compras)',
                    'Revertido', Today, PunMensajeria."Tipo movimiento"::Seguimiento, ConfUsu.Grupo, '', '', '', '', '', '', '');

            end;

        end;
        //IBdos Argentina - USS - 020403 - Fin Modificación Arbumasa
    end;

    procedure FunSol122(rstPRH: Record "Purch. Inv. Header")
    var
        PunLinCompra: Record "Purch. Inv. Line";
        PunLinSol: Record "Lín. solicitud";
        PunCabSol: Record Solicitud;
        PunMensajeria: Record Mensajeria;
        PunLinCompras: Record "Purchase Line";
        ConfUsu: Record "User Setup";
        CodeMens: Codeunit "Mensajería";
        optEstado: Option "'Completamente facturado'","'Completamente recibido y parcialmente facturado'","'Completamente recibido'","'Parcialmente recibido y parcialmente facturado'","'Parcialmente recibido'","'Abierto'";
        decPedido: Decimal;
        decFacturado: Decimal;
        rstMovProv: Record "Vendor Ledger Entry";
    begin
        //IBdos Argentina - USS - 020403 - Inicio Modificación Arbumasa
        //Seguimiento estado de documentos

        decPedido := 0;
        decFacturado := 0;

        Clear(PunLinCompra);
        PunLinCompra.SetRange(PunLinCompra."Document No.", rstPRH."No.");
        if PunLinCompra.Find('-') then
            repeat

                if PunLinCompra."No. Cab. Solicitud" <> '' then begin

                    PunLinSol.Reset;
                    PunLinSol.SetCurrentKey("No. Documento", "No. linea");
                    PunLinSol.SetRange(PunLinSol."No. Documento", PunLinCompra."No. Cab. Solicitud");
                    PunLinSol.SetRange("No. linea", PunLinCompra."No. Linea Solicitud");
                    if PunLinSol.Find('-') then begin

                        PunLinSol.Validate(Aplicado, true);
                        PunLinSol.Modify;

                    end;

                    PunCabSol.Reset;
                    PunCabSol.SetRange(PunCabSol."Nombre Libro Solicitud", PunLinSol."Nombre libro Solicitud");
                    PunCabSol.SetRange(PunCabSol."No. documento", PunLinSol."No. Documento");
                    PunMensajeria.SetCurrentKey("Tipo movimiento", "Tipo Documento", Estado, "No. documento");
                    PunMensajeria.SetRange("Tipo movimiento", PunMensajeria."Tipo movimiento"::"Mensaje con Seguimiento");
                    PunMensajeria.SetRange("Tipo Documento", 'Solicitud (compras)');
                    PunMensajeria.SetRange(Estado, 'Completada');
                    PunMensajeria.SetRange("No. documento", PunLinCompra."Document No.");
                    if not PunMensajeria.Find('-') then begin

                        PunLinSol.Reset;
                        PunLinSol.SetCurrentKey("No. Documento", Estado);
                        PunLinSol.SetRange(PunLinSol."No. Documento", PunLinCompra."No. Cab. Solicitud");
                        PunLinSol.SetFilter(Estado, '<>%1|<>%2', 'Recibido', 'Completada');
                        if not PunLinSol.Find('-') then begin

                            ConfUsu.Reset;
                            ConfUsu.Get(UserId);
                            if ConfUsu.Find('-') then
                                CodeMens.RegistrarMensaje('Solicitud Completa', '', PunLinCompra."No. Cab. Solicitud", 'Solicitud (compras)',
                                'Completada', Today, PunMensajeria."Tipo movimiento"::Seguimiento, ConfUsu.Grupo, '', '', '', '', '', '', '');

                        end;

                    end;

                end;

            until PunLinCompra.Next = 0;

        //'Completamente facturado','Completamente recibido y parcialmente facturado','Completamente recibido','Parcialmente recibido y parcialmente facturado','Parcialmente recibido','Abierto'
        Clear(rstMovProv);
        if rstMovProv.Get(rstPRH."Vendor Ledger Entry No.") then begin

            rstMovProv.CalcFields(Amount, rstMovProv."Remaining Amount");
            if rstMovProv.Amount <> 0 then begin

                rstPRH.CalcFields("Tipo documento mensajeria");
                if rstMovProv."Remaining Amount" = 0 then begin

                    ConfUsu.Reset;
                    ConfUsu.Get(UserId);
                    if ConfUsu.Find('-') then
                        CodeMens.RegistrarMensaje(rstPRH."Tipo documento mensajeria", '', PunLinCompra."Document No.", rstPRH."Tipo documento mensajeria",
                        'Factura liquidada', Today, PunMensajeria."Tipo movimiento"::Seguimiento, ConfUsu.Grupo, '', '', '', '', '', '', '');

                end;


                if (rstMovProv."Remaining Amount" <> 0) and
                  (rstMovProv."Remaining Amount" <> rstMovProv.Amount) then begin

                    ConfUsu.Reset;
                    ConfUsu.Get(UserId);
                    if ConfUsu.Find('-') then
                        CodeMens.RegistrarMensaje(rstPRH."Tipo documento mensajeria", '', PunLinCompra."Document No.", rstPRH."Tipo documento mensajeria",
                        'Factura parcialmente liquidada', Today, PunMensajeria."Tipo movimiento"::Seguimiento, ConfUsu.Grupo, '', '', '', '', '', '', '');

                end;

                if (rstMovProv."Remaining Amount" <> 0) and
                  (rstMovProv."Remaining Amount" = rstMovProv.Amount) and
                  (rstPRH.Estado <> 'Abierto')
                  then begin

                    ConfUsu.Reset;
                    ConfUsu.Get(UserId);
                    if ConfUsu.Find('-') then
                        CodeMens.RegistrarMensaje(rstPRH."Tipo documento mensajeria", '', PunLinCompra."Document No.", rstPRH."Tipo documento mensajeria",
                        'Abierto', Today, PunMensajeria."Tipo movimiento"::Seguimiento, ConfUsu.Grupo, '', '', '', '', '', '', '');

                end;

            end;

        end;
        //IBdos Argentina - USS - 020403 - Fin Modificación Arbumasa
    end;

    procedure FunSolRec(PurchHeader: Record "Purchase Header";PurchLine: Record "Purchase Line")
    var
        PunLinCompra: Record "Purchase Line";
        PunLinSol: Record "Lín. solicitud";
        PunCabSol: Record Solicitud;
    begin
        //IBdos Argentina - USS - 020403 - Inicio Modificación Arbumasa
        //Seguimiento estado de documentos

        PunLinCompra.Reset;
        PunLinCompra.SetCurrentKey("Document Type", "Document No.");
        PunLinCompra.SetRange(PunLinCompra."Document Type", PurchLine."Document Type");
        //PunLinCompra.SETRANGE(Type,PunLinCompra.Type::Item);
        PunLinCompra.SetRange(PunLinCompra."Document No.", PurchHeader."No.");
        PunLinCompra.SetFilter(PunLinCompra."No. Cab. Solicitud", '<>%1', '');
        PunLinCompra.SetFilter(PunLinCompra."Qty. to Receive", '<>0');
        //PunLinCompra.SETRANGE(PunLinCompra."Receipt No.",'');
        if PunLinCompra.Find('-') then
            repeat

                PunLinSol.Reset;
                PunLinSol.SetCurrentKey("No. Documento", "No. linea");
                PunLinSol.SetRange("No. Documento", PunLinCompra."No. Cab. Solicitud");
                PunLinSol.SetRange("No. linea", PunLinCompra."No. Linea Solicitud");
                if PunLinSol.Find('-') then begin

                    if PunLinSol.Tipo in [PunLinSol.Tipo::Producto, PunLinSol.Tipo::Recurso] then begin

                        PunLinSol.Validate(Aplicado, true);
                        PunLinSol.Validate(PunLinSol."Cantidad pendiente recibir", PunLinSol."Cantidad pendiente recibir" - PunLinCompra.
                        "Qty. to Receive");
                        if (PunLinSol."Cantidad pendiente recibir" = 0) and (PunLinSol."Cantidad pendiente facturar" = PunLinSol.Cantidad) then
                            PunLinSol.Validate(Estado, 'Recibido')
                        else
                            if (PunLinSol."Cantidad pendiente recibir" <> 0) and (PunLinSol."Cantidad pendiente facturar" = PunLinSol.Cantidad) then
                                PunLinSol.Validate(Estado, 'Parcialmente recibido')
                            else
                                if (PunLinSol."Cantidad pendiente recibir" <> 0) and (PunLinSol."Cantidad pendiente facturar" < PunLinSol.Cantidad)
                                and (PunLinSol."Cantidad pendiente facturar" <> 0) then
                                    PunLinSol.Validate(Estado, 'Parcialmente recibido y Parcialmente facturado')
                                else
                                    if (PunLinSol."Cantidad pendiente recibir" = 0) and (PunLinSol."Cantidad pendiente facturar" = 0) then
                                        PunLinSol.Validate(Estado, 'Completada')
                                    else
                                        if (PunLinSol."Cantidad pendiente recibir" = 0) and (PunLinSol."Cantidad pendiente facturar" > 0) then
                                            PunLinSol.Validate(Estado, 'Recibido y Parcialmente facturado');

                    end;

                    if (PunLinSol."Cantidad pendiente recibir" < 0) then begin

                        Message('Ya se han recibido %1 en la solicitud %2 del producto %3', PunLinSol."Cant. Recibida", PunLinSol."No. Documento",
                                  PunLinSol."No.");
                        Error('No se puede recibir más de lo requerido en la Solicitud');

                    end;

                    PunLinSol.Modify;

                end;

            until PunLinCompra.Next = 0;

        //IBdos Argentina - USS - 020403 - Fin Modificación Arbumasa
    end;

    procedure FunSolFac(PurchHeader2: Record "Purchase Header")
    var
        PunLinCompra: Record "Purchase Line";
        PunLinSol: Record "Lín. solicitud";
        PunCabSol: Record Solicitud;
        rstSeguridadUsuario: Record "Seguridad por usuario";
        rstSeguridad: Record Seguridad;
    begin
        //IBdos Argentina - USS - 020403 - Inicio Modificación Arbumasa
        //Seguimiento estado de documentos

        if (rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Imputar a Proyectos Cerrados"))) then
            exit;

        PunLinCompra.Reset;
        PunLinCompra.SetRange(PunLinCompra."Document Type", PurchHeader2."Document Type");
        PunLinCompra.SetRange(PunLinCompra."Document No.", PurchHeader2."No.");
        PunLinCompra.SetRange(Type, PunLinCompra.Type::Item);
        PunLinCompra.SetFilter(PunLinCompra."No. Cab. Solicitud", '<>%1', '');
        PunLinCompra.SetFilter(PunLinCompra."Qty. to Invoice", '<>0');
        if PunLinCompra.Find('-') then
            repeat

                PunLinSol.Reset;
                PunLinSol.SetCurrentKey("No. Documento", "No. linea");
                PunLinSol.SetRange(PunLinSol."No. Documento", PunLinCompra."No. Cab. Solicitud");
                PunLinSol.SetRange("No. linea", PunLinCompra."No. Linea Solicitud");
                if PunLinSol.Find('-') then begin

                    PunLinSol.Validate(Aplicado, true);
                    PunLinSol.Validate(PunLinSol."Cantidad pendiente facturar", PunLinSol."Cantidad pendiente facturar" - PunLinCompra.
                    "Qty. to Invoice");
                    if (PunLinSol."Cantidad pendiente recibir" = 0) and (PunLinSol."Cantidad pendiente facturar" = PunLinSol.Cantidad) then
                        PunLinSol.Validate(Estado, 'Recibido')
                    else
                        if (PunLinSol."Cantidad pendiente recibir" <> 0) and (PunLinSol."Cantidad pendiente facturar" < PunLinSol.Cantidad) and
                          (PunLinSol."Cantidad pendiente facturar" <> 0) then
                            PunLinSol.Validate(Estado, 'Parcialmente recibido y Parcialmente facturado')
                        else
                            if (PunLinSol."Cantidad pendiente recibir" = 0) and (PunLinSol."Cantidad pendiente facturar" = 0) then
                                PunLinSol.Validate(Estado, 'Completada')
                            else
                                if (PunLinSol."Cantidad pendiente recibir" = 0) and (PunLinSol."Cantidad pendiente facturar" > 0) then
                                    PunLinSol.Validate(Estado, 'Recibido y Parcialmente facturado');

                    if (PunLinSol."Cantidad pendiente facturar" < 0) then begin

                        Message('Ya se han facturado %1 en la solicitud %2 del producto %3', PunLinSol."Cant. Facturada", PunLinSol."No. Documento",
                                  PunLinSol."No.");
                        Error('No se puede facturar más de lo requerido en la Solicitud');

                    end;

                    PunLinSol.Modify;

                end;

            until PunLinCompra.Next = 0;

        //IBdos Argentina - USS - 020403 - Fin Modificación Arbumasa
    end;

    procedure FunSol124(rstPRH: Record "Purch. Cr. Memo Hdr.")
    var
        PunLinCompra: Record "Purch. Cr. Memo Line";
        PunLinSol: Record "Lín. solicitud";
        PunCabSol: Record Solicitud;
        PunMensajeria: Record Mensajeria;
        PunLinCompras: Record "Purchase Line";
        ConfUsu: Record "User Setup";
        CodeMens: Codeunit "Mensajería";
        optEstado: Option "'Completamente facturado'","'Completamente recibido y parcialmente facturado'","'Completamente recibido'","'Parcialmente recibido y parcialmente facturado'","'Parcialmente recibido'","'Abierto'";
        decPedido: Decimal;
        decFacturado: Decimal;
        rstMovProv: Record "Vendor Ledger Entry";
    begin
        //IBdos Argentina - USS - 020403 - Inicio Modificación Arbumasa
        //Seguimiento estado de documentos

        decPedido := 0;
        decFacturado := 0;

        Clear(PunLinCompra);
        PunLinCompra.SetRange(PunLinCompra."Document No.", rstPRH."No.");
        if PunLinCompra.Find('-') then
            repeat

                if PunLinCompra."No. Cab. Solicitud" <> '' then begin

                    PunLinSol.Reset;
                    PunLinSol.SetCurrentKey("No. Documento", "No. linea");
                    PunLinSol.SetRange(PunLinSol."No. Documento", PunLinCompra."No. Cab. Solicitud");
                    PunLinSol.SetRange("No. linea", PunLinCompra."No. Linea Solicitud");
                    if PunLinSol.Find('-') then begin

                        PunLinSol.Validate(Aplicado, true);
                        PunLinSol.Modify;

                    end;

                    PunCabSol.Reset;
                    PunCabSol.SetRange(PunCabSol."Nombre Libro Solicitud", PunLinSol."Nombre libro Solicitud");
                    PunCabSol.SetRange(PunCabSol."No. documento", PunLinSol."No. Documento");
                    PunMensajeria.SetCurrentKey("Tipo movimiento", "Tipo Documento", Estado, "No. documento");
                    PunMensajeria.SetRange("Tipo movimiento", PunMensajeria."Tipo movimiento"::"Mensaje con Seguimiento");
                    PunMensajeria.SetRange("Tipo Documento", 'Solicitud (compras)');
                    PunMensajeria.SetRange(Estado, 'Completada');
                    PunMensajeria.SetRange("No. documento", PunLinCompra."Document No.");
                    if not PunMensajeria.Find('-') then begin

                        PunLinSol.Reset;
                        PunLinSol.SetCurrentKey("No. Documento", Estado);
                        PunLinSol.SetRange(PunLinSol."No. Documento", PunLinCompra."No. Cab. Solicitud");
                        PunLinSol.SetFilter(Estado, '<>%1|<>%2', 'Recibido', 'Completada');
                        if not PunLinSol.Find('-') then begin

                            ConfUsu.Reset;
                            ConfUsu.Get(UserId);
                            if ConfUsu.Find('-') then
                                CodeMens.RegistrarMensaje('Solicitud Completa', '', PunLinCompra."No. Cab. Solicitud", 'Solicitud (compras)',
                                'Completada', Today, PunMensajeria."Tipo movimiento"::Seguimiento, ConfUsu.Grupo, '', '', '', '', '', '', '');

                        end;

                    end;

                end;

            until PunLinCompra.Next = 0;

        //'Completamente facturado','Completamente recibido y parcialmente facturado','Completamente recibido','Parcialmente recibido y parcialmente facturado','Parcialmente recibido','Abierto'
        Clear(rstMovProv);
        if rstMovProv.Get(rstPRH."Vendor Ledger Entry No.") then begin

            rstMovProv.CalcFields(Amount, rstMovProv."Remaining Amount");
            if rstMovProv.Amount <> 0 then begin

                rstPRH.CalcFields("Tipo documento mensajeria");
                if rstMovProv."Remaining Amount" = 0 then begin

                    ConfUsu.Reset;
                    ConfUsu.Get(UserId);
                    if ConfUsu.Find('-') then
                        CodeMens.RegistrarMensaje(rstPRH."Tipo documento mensajeria", '', PunLinCompra."Document No.", rstPRH."Tipo documento mensajeria",
                        'Factura liquidada', Today, PunMensajeria."Tipo movimiento"::Seguimiento, ConfUsu.Grupo, '', '', '', '', '', '', '');

                end;


                if (rstMovProv."Remaining Amount" <> 0) and
                  (rstMovProv."Remaining Amount" <> rstMovProv.Amount) then begin

                    ConfUsu.Reset;
                    ConfUsu.Get(UserId);
                    if ConfUsu.Find('-') then
                        CodeMens.RegistrarMensaje(rstPRH."Tipo documento mensajeria", '', PunLinCompra."Document No.", rstPRH."Tipo documento mensajeria",
                        'Factura parcialmente liquidada', Today, PunMensajeria."Tipo movimiento"::Seguimiento, ConfUsu.Grupo, '', '', '', '', '', '', '');

                end;

                if (rstMovProv."Remaining Amount" <> 0) and
                  (rstMovProv."Remaining Amount" = rstMovProv.Amount) and
                  (rstPRH.Estado <> 'Abierto')
                  then begin

                    ConfUsu.Reset;
                    ConfUsu.Get(UserId);
                    if ConfUsu.Find('-') then
                        CodeMens.RegistrarMensaje(rstPRH."Tipo documento mensajeria", '', PunLinCompra."Document No.", rstPRH."Tipo documento mensajeria",
                        'Abierto', Today, PunMensajeria."Tipo movimiento"::Seguimiento, ConfUsu.Grupo, '', '', '', '', '', '', '');

                end;

            end;

        end;
        //IBdos Argentina - USS - 020403 - Fin Modificación Arbumasa
    end;


    [Scope('OnPrem')]
    procedure Ascii2Ansi(_Text: Text[250]): Text[250]
    begin
        MakeVars;
        exit(ConvertStr(_Text, AnsiStr, AsciiStr));
    end;

    [Scope('OnPrem')]
    procedure MakeVars()
    begin
        AsciiStr := '€‚©„…†‡ˆ‰ŠŽÇŽüŽéŽâŽäŽàŽêŽëŽèŽïŽîŽìŽÄŽòŽÖŽÜŽøŽ£ŽƒŽ‚Ž¥ ¡¢ôŽÅ¥ŽØŽÁŽ†©ª«¬Ž€®Ž«Ž¡Ž¡Ž¡Ž¡Ž¡ŽªŽ…Ž‡ŽÀŽ¡Ž¡++½Ž„++--+-+ÔÇÖÔé¼++--Ž¡-+';
        AsciiStr := AsciiStr + 'ŽÿŽæÑŽúŽáŽóiÔäó¥Ø++Ž¡_Ž¡Ž¿ÆÔÇªáãÆŽåÔÇ×ÔÇáÔÇÿÔÇíáé”åÔÇ€ìíÆÔÇ†ŽÉn=óÔÇ£ŽñÔÇØŽÂÔÇ‡ÔÇöúÔÇôüŽ¼Ž¡”£';
        CharVar[1] := 196;
        CharVar[2] := 197;
        CharVar[3] := 201;
        CharVar[4] := 242;
        CharVar[5] := 220;
        CharVar[6] := 186;
        CharVar[7] := 191;
        CharVar[8] := 188;
        CharVar[9] := 187;
        CharVar[10] := 193;
        CharVar[11] := 194;
        CharVar[12] := 192;
        CharVar[13] := 195;
        CharVar[14] := 202;
        CharVar[15] := 203;
        CharVar[16] := 200;
        CharVar[17] := 205;
        CharVar[18] := 206;
        CharVar[19] := 204;
        CharVar[20] := 175;
        CharVar[21] := 223;
        CharVar[22] := 213;
        CharVar[23] := 254;
        CharVar[24] := 218;
        CharVar[25] := 219;
        CharVar[26] := 217;
        CharVar[27] := 180;
        CharVar[28] := 177;
        CharVar[29] := 176;
        CharVar[30] := 185;
        CharVar[31] := 179;
        CharVar[32] := 178;
        AnsiStr := 'Ôé¼üéãÆÔÇ×ÔÇªÔÇáÔÇí”åÔÇ€áÔÇ†Æì' + Format(CharVar[1]) + Format(CharVar[2]) + Format(CharVar[3]) + 'ÔÇÿÔÇÖÔÇ£ÔÇØ' + Format(CharVar[4]);
        AnsiStr := AnsiStr + 'ÔÇôÔÇö”£Ôäó' + Format(CharVar[5]) + 'ÔÇ‡ôØ¥©áíóúnÑª' + Format(CharVar[6]) + Format(CharVar[7]);
        AnsiStr := AnsiStr + '®¬½' + Format(CharVar[8]) + '¡«' + Format(CharVar[9]) + '___ŽØŽØ' + Format(CharVar[10]) + Format(CharVar[11]);
        AnsiStr := AnsiStr + Format(CharVar[12]) + '©ŽØŽØ++¢¥++--+-+Žå' + Format(CharVar[13]) + '++--ŽØ-+ŽÅŽÉŽæ';
        AnsiStr := AnsiStr + Format(CharVar[14]) + Format(CharVar[15]) + Format(CharVar[16]) + 'i' + Format(CharVar[17]) + Format(CharVar[18]);
        AnsiStr := AnsiStr + 'Žÿ++__ŽØ' + Format(CharVar[19]) + Format(CharVar[20]) + 'Žá' + Format(CharVar[21]) + 'ŽóŽúŽñ';
        AnsiStr := AnsiStr + Format(CharVar[22]) + 'Žª' + Format(CharVar[23]) + 'Ž¿' + Format(CharVar[24]) + Format(CharVar[25]);
        AnsiStr := AnsiStr + Format(CharVar[26]) + 'Ž¼Ž¡Ž«' + Format(CharVar[27]) + 'Ž€' + Format(CharVar[28]) + '=Ž„Ž…ŽÁŽÂŽÀ' +
        Format(CharVar[29]);
        AnsiStr := AnsiStr + 'Ž†Ž‡' + Format(CharVar[30]) + Format(CharVar[31]) + Format(CharVar[32]) + '_ ';
    end;

    [Scope('OnPrem')]
    procedure Ansi2Ascii(_Text: Text[30]): Text[30]
    begin
        MakeVars;
        exit(ConvertStr(_Text, AnsiStr, AsciiStr));
    end;

    [Scope('OnPrem')]
    procedure fntAnularAcentosyEnes(strTexto: Text[100]): Text[100]
    var
        txtCharsToKeep: Text;
    begin
        txtCharsToKeep := '0123456789,.';
        exit(DelChr(strTexto, '=', DelChr(strTexto, '=', txtCharsToKeep)));
    end;

    var
        rstConfUsu: Record "User Setup";
        rstMensajeria: Record Mensajeria;
}

