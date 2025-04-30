page 50551 "Dashboard documentos"
{
    // IBdos Argentina - USS - 020403 - Adición Arbumasa

    DelayedInsert = false;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = ListPart;
    RefreshOnActivate = true;
    ShowFilter = false;
    SourceTable = Mensajeria;
    SourceTableTemporary = true;
    SourceTableView = SORTING(Ciudad, "Destinatario/Grupo", "Tipo Documento");

    layout
    {
        area(content)
        {
            field(StatusText; StatusText)
            {
                Caption = 'Status Text';
                ShowCaption = false;
            }
            repeater(Arbumasa)
            {
                Caption = 'Arbumasa';
                IndentationColumn = Indentar;
                ShowAsTree = true;
                field(Ciudad; Ciudad)
                {
                    Caption = 'Ciudad';
                }
                field("Destinatario/Grupo"; "Destinatario/Grupo")
                {
                    Caption = 'Grupo';
                }
                field("Tipo Documento"; "Tipo Documento")
                {
                    Caption = 'Documento';
                }
                field(Estado; Estado)
                {
                }
                field("No. documento"; "No. documento")
                {
                    Caption = 'Ficha';
                    StyleExpr = l_strStyle;

                    trigger OnDrillDown()
                    var
                        PunTipoDoc: Record "Tipos documento";
                        PunCompras: Record "Purchase Header";
                        PunVentas: Record "Sales Header";
                        PunHRemV: Record "Sales Shipment Header";
                        PunHFacV: Record "Sales Invoice Header";
                        PunHNCV: Record "Sales Cr.Memo Header";
                        PunHRemC: Record "Purch. Rcpt. Header";
                        PunHFacC: Record "Purch. Inv. Header";
                        PunHNCC: Record "Purch. Cr. Memo Hdr.";
                        PunSol: Record Solicitud;
                        PunHSol: Record Solicitud;
                        PunConsumo: Record "Cab. Vale consumo";
                        frmCuadroEntradas: Page "Cuadro producción";
                        rstConfUsu: Record "User Setup";
                        cduMensajeria: Codeunit "Mensajería";
                        rstMensajeria: Record Mensajeria;
                        intPosicion: Integer;
                        codOldEstado: Text;
                        codOldDestino: Text;
                        codOldTDoc: Text;
                    begin
                        PunTipoDoc.Reset;
                        PunTipoDoc.SetRange("Tipos documento", "Tipo Documento");
                        if PunTipoDoc.Find('-') then;

                        if "Tipo Documento" in ['Cotización (compras)', 'Factura interna (compras)', 'Factura (compras)', 'Pedido (compras)', 'Nota débito (compras)', 'Nota crédito (compras)', 'Nota crédito interna (compras)'] then begin

                            PunCompras.Reset;
                            PunCompras.SetRange("No.", "No. documento");
                            if PunCompras.Find('-') then
                                PAGE.RunModal(PunTipoDoc."No. form", PunCompras)

                            else begin
                                PunHRemC.Reset;
                                PunHRemC.SetRange(PunHRemC."No.", "No. documento");
                                if PunHRemC.Find('-') then begin

                                    PAGE.RunModal(PAGE::"Posted Purchase Receipt", PunHRemC);

                                end;

                                PunHFacC.Reset;
                                PunHFacC.SetRange(PunHFacC."Pre-Assigned No.", "No. documento");
                                if PunHFacC.Find('-') then begin

                                    PAGE.RunModal(PAGE::"Posted Purchase Invoice", PunHFacC);

                                end;

                                PunHNCC.Reset;
                                PunHNCC.SetRange("No.", "No. documento");
                                if PunHNCC.Find('-') then begin

                                    PAGE.RunModal(PAGE::"Posted Purchase Credit Memo", PunHNCC);

                                end;
                            end;
                        end;

                        if "Tipo Documento" in ['Factura (ventas)', 'Reparto (ventas)', 'Pedido (ventas)'] then begin

                            PunVentas.Reset;
                            PunVentas.SetRange("No.", "No. documento");
                            if PunVentas.Find('-') then begin

                                PAGE.RunModal(PunTipoDoc."No. form", PunVentas);

                            end
                            else begin

                                PunHRemV.Reset;
                                PunHRemV.SetRange("No.", "No. documento");
                                if PunHRemV.Find('-') then begin

                                    PAGE.RunModal(PAGE::"Posted Sales Shipment", PunHRemV);

                                end;

                                PunHFacV.Reset;
                                PunHFacV.SetRange("Pre-Assigned No.", "No. documento");
                                if PunHFacV.Find('-') then begin

                                    PAGE.RunModal(PAGE::"Posted Sales Invoice", PunHFacV);

                                end;

                                PunHNCV.Reset;
                                PunHNCV.SetRange("No.", "No. documento");
                                if PunHNCV.Find('-') then begin

                                    PAGE.RunModal(PAGE::"Posted Sales Credit Memo", PunHNCV);

                                end;
                            end;
                        end;

                        if "Tipo Documento" in ['Vale de consumo', 'Vale de consumo en tránsito'] then begin

                            PunConsumo.Reset;
                            PunConsumo.SetRange(PunConsumo."No. documento", "No. documento");
                            if PunConsumo.Find('-') then begin

                                PAGE.RunModal(PunTipoDoc."No. form", PunConsumo);

                            end;
                        end;

                        if "Tipo Documento" = 'Cuadro de Entradas (producción)' then begin

                            Clear(frmCuadroEntradas);
                            if rstConfUsu.Get(UserId) then
                                cduMensajeria.RegistrarAlerta('Cuadro de Entradas sin modificaciones', UserId, "No. documento", 'Cuadro de Entradas (producción)',
                                'Completada', WorkDate, rstMensajeria."Tipo movimiento"::Alerta, '', '', '', '', '', '', '', '');
                            Commit;
                            frmCuadroEntradas.Run;

                        end;

                        case "Tipo Documento" of

                            'Solicitud (compras)', 'Solicitud abierta (compras)':
                                begin

                                    PunSol.Reset;
                                    PunSol.SetRange("No. documento", "No. documento");
                                    if PunSol.Find('-') then begin

                                        PAGE.RunModal(PunTipoDoc."No. form", PunSol);

                                    end
                                    else begin

                                        PunHSol.Reset;
                                        PunHSol.SetRange("No. documento", "No. documento");
                                        if PunHSol.Find('-') then begin

                                            PAGE.RunModal(PAGE::Solicitud, PunHSol);

                                        end;
                                    end;
                                end;
                        end;

                        intPosicion := "No. Linea";
                        Clear(rstMensajeria);
                        rstMensajeria.SetCurrentKey(rstMensajeria."No. Mensaje");
                        if "No. Mensaje" <> '' then
                            rstMensajeria.SetRange("No. Mensaje", "No. Mensaje")
                        else
                            rstMensajeria.SetRange("No. documento", "No. documento");
                        if rstMensajeria.FindFirst then begin

                            if rstMensajeria.Estado <> Estado then begin

                                codOldEstado := Estado;
                                codOldDestino := "Destinatario/Grupo";
                                codOldTDoc := "Tipo Documento";
                                if Delete then;
                                if Count > 0 then begin

                                    Clear(rstMensajeriaTemp);

                                    if rstMensajeriaTemp.FindSet then
                                        repeat

                                            rstMensajeriaTemp.Delete;

                                        until rstMensajeriaTemp.Next = 0;

                                    if FindSet then
                                        repeat

                                            rstMensajeriaTemp.TransferFields(Rec);
                                            rstMensajeriaTemp.Insert;

                                        until Next = 0;

                                    rstMensajeriaTemp.SetRange("Destinatario/Grupo", codOldDestino);
                                    rstMensajeriaTemp.SetRange("Tipo Documento", codOldTDoc);
                                    rstMensajeriaTemp.SetRange(Estado, codOldEstado);
                                    if not rstMensajeriaTemp.FindFirst then begin

                                        if Get(1) then;

                                    end
                                    else begin

                                        if Get(rstMensajeriaTemp."No. Linea") then;

                                    end;

                                end;

                                CurrPage.Update(false);

                            end;

                        end;
                    end;
                }
                field(Vinculados; "Documentos vinculados")
                {
                    BlankZero = true;

                    trigger OnAssistEdit()
                    var
                        rstDocVin: Record "Vinculación documentos";
                        rstHRCompra: Record "Purch. Rcpt. Header";
                        rstDocDigit: Record "Documentos digitalizados";
                    begin
                    end;
                }
                field(strFacturaLin; strFacturaLin)
                {
                    Caption = 'No. documento proveedor';
                    ColumnSpan = 10;
                    Editable = false;

                    trigger OnDrillDown()
                    begin
                        Clear(rstInfoEmpresa);
                        rstInfoEmpresa.Get();
                        //HYPERLINK(rstInfoEmpresa."Ruta Intranet"+(CONVERTSTR(COPYSTR(Hipervinculo,STRLEN(rstInfoEmpresa."Ruta de digitalizacion"),250),'\','/')));
                        HyperLink(html);
                    end;
                }
                field(strExpress; strExpress)
                {
                    Caption = 'Detalle';
                }
                field(Importe; "Importe pendiente")
                {
                    BlankZero = true;
                }
                field(Cantidad; Cantidad)
                {
                    BlankZero = true;
                }
                field("­ltima modificación"; datFecha)
                {
                    StyleExpr = l_strStyle;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Actua&lizar")
            {
                Caption = '&Update';
                trigger OnAction()
                begin
                    FunDocEst(UserId, false);
                end;
            }
            action("&Ver digitalización")
            {
                Caption = '&View scanned document';
                Enabled = blnVer;
                Image = ViewDocumentLine;

                trigger OnAction()
                var
                    pgePDF: Page "PDFViewer Page";
                    rstInfoEmpresa: Record "Company Information";
                    cduEscaneado: Codeunit Escaneado;
                begin
                    Clear(pgePDF);
                    Clear(cduEscaneado);
                    //cduEscaneado.TraerHTMLIntranet(html,Hipervinculo);
                    pgePDF.SetURL(html);
                    pgePDF.Run;
                end;
            }
            action("&Cambiar estado")
            {
                Caption = '&Cambiar estado';
                Enabled = blnCambiar;

                trigger OnAction()
                var
                    l_rstMens: Record Mensajeria;
                    l_pagCE: Page "Cambiar estado documento";
                begin
                    Clear(l_rstMens);
                    l_rstMens.SetRange("Destinatario/Grupo", "Destinatario/Grupo");
                    l_rstMens.SetRange("Tipo Documento", "Tipo Documento");
                    l_rstMens.SetRange(Estado, Estado);
                    l_rstMens.SetRange(Ciudad, Ciudad);
                    Clear(l_pagCE);
                    l_pagCE.SetTableView(l_rstMens);
                    l_pagCE.fntEstadoOrigen("Tipo Documento", Estado);
                    l_pagCE.RunModal;
                    //l_pagCE.RUN;
                    ClearAll;
                    FunDocEst(UserId, false);
                    CurrPage.Update(false);

                    //CurrPage.ACTIVATE(true);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        l_cduSIC: Codeunit "Single Instance CU";
    begin
    end;

    trigger OnAfterGetRecord()
    var
        PunCompras: Record "Purchase Header";
        PunVentas: Record "Sales Header";
        PunSol: Record Solicitud;
        PunHSol: Record Solicitud;
        PunConsumo: Record "Cab. Vale consumo";
        PunHRemV: Record "Sales Shipment Header";
        PunHFacV: Record "Sales Invoice Header";
        PunHNCV: Record "Sales Cr.Memo Header";
        PunHRemC: Record "Purch. Rcpt. Header";
        PunHFacC: Record "Purch. Inv. Header";
        PunHNCC: Record "Purch. Cr. Memo Hdr.";
        rstProveedor: Record Vendor;
        cduEscaneado: Codeunit Escaneado;
    begin
        case Indentar of
            0:
                InCol := 0;
            1:
                InCol := 1;
            2:
                InCol := 2;
        end;


        strNombreProveedor := '';
        strFacturaLin := '';

        if "Tipo Documento" in ['Factura interna (compras)', 'Factura (compras)', 'Nota débito (compras)', 'Nota crédito (compras)'] then begin

            Clear(rstProveedor);
            if rstProveedor.Get("Codigo vinculante") then begin

                strNombreProveedor := rstProveedor.Name;

            end;

        end;

        case "Tipo Documento" of
            'Factura (compras)', 'Nota débito (compras)', 'Nota crédito (compras)', 'Factura interna (compras)':
                begin

                    Clear(PunCompras);
                    PunCompras.SetRange(PunCompras."No.", "No. documento");
                    if PunCompras.FindFirst then begin

                        strFacturaLin := PunCompras."Vendor Invoice No." + PunCompras."Vendor Cr. Memo No.";
                        PunCompras.CalcFields(Amount);
                        if PunCompras."Currency Factor" <> 0 then
                            decImporte := PunCompras.Amount / PunCompras."Currency Factor"
                        else
                            decImporte := PunCompras.Amount;

                    end
                    else begin

                        case "Tipo Documento" of
                            'Factura (compras)', 'Nota débito (compras)':
                                begin

                                    if "No. documento" <> '' then begin

                                        Clear(PunHFacC);
                                        PunHFacC.SetCurrentKey(PunHFacC."Pre-Assigned No.");
                                        PunHFacC.SetRange(PunHFacC."Pre-Assigned No.", "No. documento");
                                        if PunHFacC.FindFirst then
                                            strFacturaLin := PunHFacC."Vendor Invoice No.";
                                        if PunHFacC."Currency Factor" <> 0 then
                                            decImporte := PunHFacC.Amount / PunHFacC."Currency Factor"
                                        else
                                            decImporte := PunHFacC.Amount;

                                    end;

                                end;
                            'Nota crédito (compras)':
                                begin

                                    if "No. documento" <> '' then begin

                                        Clear(PunHNCC);
                                        PunHNCC.SetCurrentKey(PunHNCC."Pre-Assigned No.");
                                        PunHNCC.SetRange(PunHNCC."Pre-Assigned No.", "No. documento");
                                        if PunHNCC.FindFirst then
                                            strFacturaLin := PunHNCC."Vendor Cr. Memo No.";

                                        if PunHNCC."Currency Factor" <> 0 then
                                            decImporte := PunHNCC.Amount / PunHNCC."Currency Factor"
                                        else
                                            decImporte := PunHNCC.Amount;

                                    end;
                                end;
                        end;
                    end;
                end;
        end;

        if strNombreProveedor <> '' then
            strExpress := strNombreProveedor + ' - ' + strFacturaLin
        else
            strExpress := '';

        blnVer := Hipervinculo <> '';
        blnCambiar := Estado <> '';

        Clear(rstInfoEmpresa);
        rstInfoEmpresa.Get();
        cduEscaneado.TraerHTMLInternet(html, Hipervinculo);
        //DocumentPath := rstInfoEmpresa."Ruta Intranet"+(CONVERTSTR(COPYSTR(Html,STRLEN(rstInfoEmpresa."Ruta de digitalizacion"),250),'\','/'));

        if "Fecha ultima modificacion" <> 0D then
            datFecha := "Fecha ultima modificacion"
        else
            datFecha := Fecha;

        l_strStyle := '';
        if datFecha <> 0D then begin

            if (Today) > datFecha + 7 then
                l_strStyle := 'Favorable';
            if (Today) > datFecha + 14 then
                l_strStyle := 'Unfavorable';

        end;
    end;

    trigger OnInit()
    begin
        FunDocEst(UserId, false);
    end;

    trigger OnOpenPage()
    begin
        SetupTimer();
    end;

    var
        [WithEvents]
        MyTimer: DotNet MyTimer;

    procedure SetupTimer()
    begin
        MyTimer.Interval(60000);
        MyTimer.AutoReset := true;
        MyTimer.Enabled := true;
        MyTimer.Start();
    end;

    trigger MyTimer::Elapsed(sender: Variant; e: DotNet MyElapsedEventArgs)
    var
        intLin: Integer;
    begin
        // Print a message when this event is published 
        if Rec."No. Linea" <> 0 then
            intLin := Rec."No. Linea";
        FunDocEst(UserId, false);

        StatusText := 'Actualizado por última vez: ' + Format(CurrentDateTime);

        MyTimer.Interval(60000);
        MyTimer.Start();

        if intLin <> 0 then
            if Rec.Get(intLin) then;
        CurrPage.Update(false);

        StatusText := 'Actualizado por última vez: ' + Format(CurrentDateTime);
        FunDocEst(UserId, false);

        MyTimer.Stop();
    end;

    var
        rstRelacionDocumentos: Record "Seguimiento por grupo";
        rstEstadoDocumento: Record Estados;
        rstRelacion: Record "Relación seguridad";
        rstMensajeria: Record Mensajeria;
        InCol: Integer;
        strCiudad: Text[100];
        intCantidad: Integer;
        i: Integer;
        rstMensajeriaTemp: Record Mensajeria temporary;
        j: Integer;
        h: Integer;
        rstMensajeriaTempBIS: Record Mensajeria temporary;
        html: Text[1024];
        strNombreProveedor: Text[50];
        strFacturaLin: Text;
        strExpress: Text[1024];
        StatusText: Text[1024];
        rstInfoEmpresa: Record "Company Information";
        strFacturaLinVisible: Boolean;
        started: Boolean;
        p: Integer;
        blnVer: Boolean;
        blnCambiar: Boolean;
        datFecha: Date;

        l_strStyle: Text[20];
        decImporte: Decimal;

    [Scope('OnPrem')]
    procedure FunDocEst(codUsuario: Code[50]; blnEnviarCorreo: Boolean)
    var
        ConfUsu: Record "User Setup";
        rstSeguixGrupo: Record "Seguimiento por grupo";
        PunSeguimiento: Record Mensajeria;
        Filtro: Text[1024];
        SeparadorFiltro: Label '|';
        "rstRelaciónGrupos": Record "Relación seguridad";
        rstSeguridadUsuario: Record "Seguridad por usuario";
        rstMens: Record Mensajeria;
        codCiudad: Code[10];
        rstMens2: Record Mensajeria;
        rstMensajeria2: Record Mensajeria;
    begin
        ClearAll;
        DeleteAll;
        rstMensajeriaTemp.DeleteAll;
        rstMensajeriaTempBIS.DeleteAll;

        for h := 1 to 6 do begin

            ConfUsu.Reset;
            intCantidad := 0;
            if ConfUsu.Get(codUsuario) then;
            Clear(rstSeguridadUsuario);
            rstSeguridadUsuario.SetRange(rstSeguridadUsuario.Usuario, UserId);
            rstSeguridadUsuario.SetRange("Mostrar documentación", true);
            if rstSeguridadUsuario.FindSet then
                repeat

                    Clear(rstRelacion);
                    Filtro := '';
                    rstRelacion.SetRange(rstRelacion."Grupo Destino", rstSeguridadUsuario.Grupo);
                    if rstRelacion.Find('-') then
                        repeat

                            if Filtro <> '' then
                                Filtro := Filtro + rstRelacion."Grupo Origen" + SeparadorFiltro
                            else
                                Filtro := rstRelacion."Grupo Origen" + SeparadorFiltro;

                        until rstRelacion.Next = 0;

                    if Filtro <> '' then
                        Filtro := CopyStr(Filtro, 1, StrLen(Filtro) - 1);

                    Clear(rstSeguixGrupo);
                    rstSeguixGrupo.SetRange(rstSeguixGrupo.Grupo, rstSeguridadUsuario.Grupo);
                    if rstSeguixGrupo.FindSet then
                        repeat


                            j := 0;

                            Clear(rstMens);
                            rstMens.SetCurrentKey("Tipo movimiento", "Destinatario/Grupo", "Tipo Documento", Estado, "Importe pendiente", Remitente);
                            rstMens.SetFilter("Tipo movimiento", '%1|%2', rstMens."Tipo movimiento"::"Flujo documentos", rstMens."Tipo movimiento"::"Mensaje con Seguimiento");
                            rstMens.SetRange("Destinatario/Grupo", rstSeguridadUsuario.Grupo);
                            rstMens.SetRange("Tipo Documento", rstSeguixGrupo."Tipo documento");
                            rstMens.SetRange(Estado, rstSeguixGrupo."Estado documento");
                            rstMens.SetFilter(Remitente, Filtro);
                            rstMens.CalcFields("Importe pendiente");
                            rstMens.SetAscending("Importe pendiente", false);
                            case h of
                                1: /*Buenos Aires*/
                                    rstMens.SetRange(Ciudad, 'BUE');
                                2: /*Puerto Deseado*/
                                    rstMens.SetRange(Ciudad, 'PD');
                                3: /*Comodoro Rivadavia*/
                                    rstMens.SetRange(Ciudad, 'CRV');
                                4: /*Arbumasa*/
                                    rstMens.SetRange(Ciudad, '   ');
                                5: /*Mar del Plata*/
                                    rstMens.SetRange(Ciudad, 'MDQ');
                                6: /*Puerto Madryn*/
                                    rstMens.SetRange(Ciudad, 'PM');

                            end;

                            if rstMens.FindSet then
                                repeat

                                    if rstMens.Ciudad <> codCiudad then begin

                                        i += 1;

                                        Clear(rstMensajeriaTemp);
                                        rstMensajeriaTemp."No. Linea" := i;
                                        case h of
                                            1:
                                                rstMensajeriaTemp.Ciudad := 'BUE';
                                            2:
                                                rstMensajeriaTemp.Ciudad := 'PD';
                                            3:
                                                rstMensajeriaTemp.Ciudad := 'CRV';
                                            4:
                                                rstMensajeriaTemp.Ciudad := '';
                                            5: /*Mar del Plata*/
                                                rstMensajeriaTemp.Ciudad := 'MDQ';
                                            6: /*Puerto Madryn*/
                                                rstMensajeriaTemp.Ciudad := 'PM';
                                        end;

                                        codCiudad := rstMens.Ciudad;
                                        rstMensajeriaTemp.Indentar := 0;

                                        if not rstMensajeriaTemp.Insert then;

                                    end;

                                    if j = 0 then begin

                                        i += 1;
                                        j += 1;
                                        Clear(rstMensajeriaTemp);
                                        rstMensajeriaTemp."No. Linea" := i;
                                        case h of
                                            1:
                                                rstMensajeriaTemp.Ciudad := 'BUE';
                                            2:
                                                rstMensajeriaTemp.Ciudad := 'PD';
                                            3:
                                                rstMensajeriaTemp.Ciudad := 'CRV';
                                            4:
                                                rstMensajeriaTemp.Ciudad := '';
                                            5: /*Mar del Plata*/
                                                rstMensajeriaTemp.Ciudad := 'MDQ';
                                            6: /*Puerto Madryn*/
                                                rstMensajeriaTemp.Ciudad := 'PM';
                                        end;

                                        rstMensajeriaTemp."Destinatario/Grupo" := rstMens."Destinatario/Grupo";
                                        rstMensajeriaTemp."Tipo Documento" := rstMens."Tipo Documento";
                                        rstMensajeriaTemp.Estado := rstMens.Estado;
                                        rstMensajeriaTemp.Indentar := 1;
                                        rstMensajeriaTemp."Importe pendiente" := 0;
                                        rstMensajeriaTemp.Cantidad := rstMens.Count;
                                        if not rstMensajeriaTemp.Insert then;

                                    end;

                                    i += 1;

                                    Clear(rstMensajeriaTemp);
                                    rstMensajeriaTemp.TransferFields(rstMens);
                                    case h of
                                        1:
                                            rstMensajeriaTemp.Ciudad := 'BUE';
                                        2:
                                            rstMensajeriaTemp.Ciudad := 'PD';
                                        3:
                                            rstMensajeriaTemp.Ciudad := 'CRV';
                                        4:
                                            rstMensajeriaTemp.Ciudad := '';
                                        5: /*Mar del Plata*/
                                            rstMensajeriaTemp.Ciudad := 'MDQ';
                                        6: /*Puerto Madryn*/
                                            rstMensajeriaTemp.Ciudad := 'PM';
                                    end;

                                    rstMensajeriaTemp.Indentar := 2;
                                    rstMensajeriaTemp."No. Linea" := i;
                                    Clear(rstMensajeria2);
                                    rstMensajeria2.SetCurrentKey("No. documento");
                                    rstMensajeria2.SetRange("No. documento", rstMens."No. documento");
                                    if not rstMensajeriaTemp.Insert then;

                                until rstMens.Next = 0;

                        until rstSeguixGrupo.Next = 0;

                until rstSeguridadUsuario.Next = 0;

        end;

        if rstMensajeriaTemp.FindSet then
            repeat

                TransferFields(rstMensajeriaTemp);
                rstMensajeriaTempBIS.TransferFields(rstMensajeriaTemp);
                if not Insert then;

            until rstMensajeriaTemp.Next = 0;

        if FindFirst then;

        CurrPage.Update(false);

    end;
}

