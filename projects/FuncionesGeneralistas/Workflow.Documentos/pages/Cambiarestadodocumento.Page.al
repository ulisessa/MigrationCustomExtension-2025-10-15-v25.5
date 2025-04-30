page 50064 "Cambiar estado documento"
{
    // IBdos Argentina - USS - 020403 - Adición Arbumasa

    DataCaptionExpression = strExpress;
    DataCaptionFields = "Tipo Documento", "No. documento", Estado;
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = ListPlus;
    PromotedActionCategories = ',Process,,Lines';
    SourceTable = Mensajeria;
    SourceTableView = ORDER(Descending);

    layout
    {
        area(content)
        {
            field(txtUsuario; txtUsuario)
            {
                Caption = 'Usuario destino';
                Editable = true;
                TableRelation = "User Setup"."User ID" WHERE("E-Mail" = FILTER(<> ''),
                                                              Grupo = FILTER(<> ''));

                trigger OnValidate()
                begin
                    codGrupoDestino := '';

                    Clear(rstEstadosDocumentos);
                    Clear(pgeEstadosDocumentos);
                    Clear(rstCambiarEstado);
                    Clear(rstConfUsu);

                    if rstConfUsu.Get(txtUsuario) then;
                    if codGrupoDestino = '' then
                        codGrupoDestino := rstConfUsu.Grupo;

                    rstEstadosDocumentos.SetRange(Usuario, UserId);
                    rstEstadosDocumentos.SetRange("Tipo documento", "Tipo Documento");
                    rstEstadosDocumentos.SetRange("Estado original", Estado);
                    if codGrupoDestino <> '' then
                        rstEstadosDocumentos.SetRange("Grupo destino", codGrupoDestino);

                    pgeEstadosDocumentos.SetTableView(rstEstadosDocumentos);

                    if rstEstadosDocumentos.Count > 1 then begin

                        //pgeEstadosDocumentos.EDITABLE(true);
                        pgeEstadosDocumentos.LookupMode(true);
                        if pgeEstadosDocumentos.RunModal = ACTION::LookupOK then begin

                            pgeEstadosDocumentos.GetRecord(rstEstadosDocumentos);
                            txtEstado := rstEstadosDocumentos."Estado destino";
                            codGrupoDestino := rstEstadosDocumentos."Grupo destino";

                        end;

                    end
                    else begin

                        if not rstEstadosDocumentos.FindFirst then
                            Error('No existe relación entre departamentos');
                        txtEstado := rstEstadosDocumentos."Estado destino";
                        codGrupoDestino := rstEstadosDocumentos."Grupo destino";

                    end;

                    if codGrupoDestino <> '' then
                        rstCambiarEstado.SetRange("Grupo destino", codGrupoDestino);
                    if txtEstado <> '' then
                        rstCambiarEstado.SetRange("Estado destino", txtEstado);

                    CurrPage.Update(false);
                end;
            }
            field(txtEstado; txtEstado)
            {
                Caption = 'Cambiar a estado';
                Editable = true;
                Lookup = true;

                trigger OnLookup(var Text: Text): Boolean
                begin
                    Clear(rstEstadosDocumentos);
                    Clear(pgeEstadosDocumentos);
                    Clear(rstCambiarEstado);

                    rstEstadosDocumentos.SetRange(Usuario, UserId);
                    rstEstadosDocumentos.SetRange("Tipo documento", "Tipo Documento");
                    rstEstadosDocumentos.SetRange("Estado original", Estado);
                    /*
                    IF codGrupoDestino <> '' THEN
                      rstEstadosDocumentos.SETRANGE("Grupo destino",codGrupoDestino);
                    
                    IF txtEstado <> '' THEN
                      rstCambiarEstado.SETRANGE("Estado destino",txtEstado);
                    */

                    pgeEstadosDocumentos.SetTableView(rstEstadosDocumentos);

                    //pgeEstadosDocumentos.EDITABLE(true);
                    pgeEstadosDocumentos.LookupMode(true);
                    if (pgeEstadosDocumentos.RunModal = ACTION::LookupOK) and (rstEstadosDocumentos.Count >= 1) then begin

                        pgeEstadosDocumentos.GetRecord(rstEstadosDocumentos);
                        txtEstado := rstEstadosDocumentos."Estado destino";
                        codGrupoDestino := rstEstadosDocumentos."Grupo destino";
                        if rstEstadosDocumentos."Filtro por monto" <> '' then
                            SetFilter("Importe pendiente", rstEstadosDocumentos."Filtro por monto");

                    end;
                    /*
                    IF txtUsuario = '' THEN
                    BEGIN
                    */
                    Clear(rstConfUsu);
                    rstConfUsu.SetRange(rstConfUsu.Grupo, rstEstadosDocumentos."Grupo destino");
                    if rstConfUsu.FindFirst then
                        txtUsuario := rstConfUsu."User ID";
                    /*
                END;
                */
                    CurrPage.Update(false);

                end;
            }
            field(codGrupoDestino; codGrupoDestino)
            {
                Caption = 'Grupo destino';
                Editable = false;
            }
            repeater(Control1)
            {
                Editable = false;
                ShowCaption = false;
                field(Fecha; Fecha)
                {
                    StyleExpr = l_Style;
                }
                field(Hora; Hora)
                {
                    StyleExpr = l_Style;
                }
                field("Tipo Documento"; "Tipo Documento")
                {
                    StyleExpr = l_Style;
                }
                field(Estado; Estado)
                {
                    StyleExpr = l_Style;
                }
                field(Asunto; Asunto)
                {
                }
                field("No. documento"; "No. documento")
                {
                    AssistEdit = true;
                    DrillDown = true;
                    StyleExpr = l_Style;

                    trigger OnAssistEdit()
                    begin
                        PunSeguimiento.Reset;
                        PunSeguimiento.SetRange("No. documento", "No. documento");
                        PunSeguimiento.SetRange("Tipo Documento", "Tipo Documento");
                        Clear(FormLista);
                        FormLista.SetTableView(PunSeguimiento);
                        FormLista.Run;
                    end;

                    trigger OnDrillDown()
                    begin
                        Navegar;
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        PunTipoDoc.Reset;
                        PunTipoDoc.SetRange("Tipos documento", "Tipo Documento");
                        if PunTipoDoc.Find('-') then;

                        if "Tipo Documento" in ['Cotización (compras)', 'Factura (compras)', 'Pedido (compras)', 'Nota débito (compras)', 'Nota crédito (compras)', 'Nota crédito interna (compras)', 'Déb. pronto venc. (compras)', 'Fac. pronto venc. (compras)',
                                                'Déb. pronto venc. (compras)', 'Factura interna (compras)'] then begin

                            PunCompras.Reset;
                            PunCompras.SetRange("No.", "No. documento");
                            if PunCompras.Find('-') then
                                PAGE.Run(PunTipoDoc."No. form", PunCompras);
                            PunHRemC.Reset;
                            PunHRemC.SetRange(PunHRemC."No.", "No. documento");
                            if PunHRemC.Find('-') then
                                PAGE.Run(PAGE::"Posted Purchase Receipt", PunHRemC);

                            PunHFacC.Reset;
                            PunHFacC.SetRange(PunHFacC."Pre-Assigned No.", "No. documento");
                            if PunHFacC.Find('-') then
                                PAGE.Run(PAGE::"Posted Purchase Invoice", PunHFacC);

                            PunHNCC.Reset;
                            PunHNCC.SetRange("No.", "No. documento");
                            if PunHNCC.Find('-') then
                                PAGE.Run(PAGE::"Posted Purchase Credit Memo", PunHNCC);

                        end;

                        if "Tipo Documento" in ['Factura (ventas)', 'Reparto (ventas)'] then begin

                            PunVentas.Reset;
                            PunVentas.SetRange("No.", "No. documento");
                            if PunVentas.Find('-') then begin

                                PAGE.Run(PunTipoDoc."No. form", PunVentas);

                            end
                            else begin

                                PunHRemV.Reset;
                                PunHRemV.SetRange("No.", "No. documento");
                                if PunHRemV.Find('-') then begin

                                    PAGE.Run(PAGE::"Posted Sales Shipment", PunHRemV);

                                end;

                                PunHFacV.Reset;
                                PunHFacV.SetRange("Pre-Assigned No.", "No. documento");
                                if PunHFacV.Find('-') then begin

                                    PAGE.Run(PAGE::"Posted Sales Invoice", PunHFacV);

                                end;

                                PunHNCV.Reset;
                                PunHNCV.SetRange("No.", "No. documento");
                                if PunHNCV.Find('-') then begin

                                    PAGE.Run(PAGE::"Posted Sales Credit Memo", PunHNCV);

                                end;
                            end;
                        end;

                        if "Tipo Documento" in ['Vale de consumo', 'Vale de consumo en tránsito'] then begin

                            PunConsumo.Reset;
                            PunConsumo.SetRange(PunConsumo."No. documento", "No. documento");
                            if PunConsumo.Find('-') then begin

                                PAGE.Run(PunTipoDoc."No. form", PunConsumo);

                            end;
                        end;

                        if "Tipo Documento" = 'Cuadro de Entradas (producción)' then begin

                            Clear(frmCuadroEntradas);
                            if rstConfUsu.Get(UserId) then
                                cduMensajeria.RegistrarAlerta('Cuadro de Entradas sin modificaciones', UserId, "No. documento", 'Cuadro de Entradas (producción)',
                                'Completada', WorkDate, rstMensajeria."Tipo movimiento"::Alerta, '', '', '', '', '', '', '', '');
                            Commit;
                            frmCuadroEntradas.RunModal;

                        end;

                        case "Tipo Documento" of

                            'Solicitud (compras)':
                                begin

                                    PunSol.Reset;
                                    PunSol.SetRange("No. documento", "No. documento");
                                    if PunSol.Find('-') then begin

                                        PAGE.Run(PunTipoDoc."No. form", PunSol);

                                    end;
                                end;
                        end;
                    end;
                }
                field(Importe; "Importe pendiente")
                {
                }
                field(Detalle; Detalle)
                {
                    StyleExpr = l_Style;
                }
                field(strFacturaLin; strFacturaLin)
                {
                    Caption = 'No. documento proveedor';
                    Editable = false;
                    StyleExpr = l_Style;
                    Visible = strFacturaLinVisible;

                    trigger OnDrillDown()
                    begin
                        Clear(rstInfoEmpresa);
                        rstInfoEmpresa.Get();
                        //HYPERLINK(rstInfoEmpresa."Ruta Intranet"+(CONVERTSTR(COPYSTR(Hipervinculo,STRLEN(rstInfoEmpresa."Ruta de digitalizacion"),250),'\','/')));
                        //HYPERLINK(cduEscaneado.RetornarRutaLocal(Hipervinculo));
                        cduEscaneado.TraerHTMLInternet(Html, Hipervinculo);
                        HyperLink(Html);
                    end;
                }
                field(Hipervinculo; Hipervinculo)
                {
                    Editable = false;
                    StyleExpr = l_Style;
                }
                field("Documentos vinculados"; "Documentos vinculados")
                {
                    StyleExpr = l_Style;

                    trigger OnDrillDown()
                    begin
                        Clear(rstInfoEmpresa);
                        rstInfoEmpresa.Get();
                        Clear(rstDocVin);
                        rstDocVin.SetRange("No. linea mensajeria", "No. Linea");
                        if rstDocVin.Find('-') then
                            repeat

                                if rstDocVin."Tipo documento vinculado" = rstDocVin."Tipo documento vinculado"::"Parte de entrada" then begin

                                    Clear(rstHRCompra);
                                    rstHRCompra.SetRange("No.", rstDocVin."No. documento vinculado");
                                    if rstHRCompra.Find('-') then begin

                                        Clear(rstDocDigit);
                                        rstDocDigit.SetCurrentKey(rstDocDigit."Nivel 8");
                                        rstDocDigit.SetRange(rstDocDigit."Nivel 8", rstHRCompra."Order No.");
                                        rstDocDigit.SetRange("Nivel 6", rstHRCompra."Vendor Shipment No.");
                                        if rstDocDigit.Find('+') then
                                            Html := rstInfoEmpresa."Ruta Intranet" + (ConvertStr(CopyStr(rstDocDigit.Archivo, 4, 250), '\', '/'));

                                    end;

                                end;

                            until rstDocVin.Next = 0;
                    end;
                }
                field("Fecha emisión"; datFEmision)
                {
                    Caption = 'Fecha emisión';
                    Editable = false;
                    StyleExpr = l_Style;
                    Visible = strFacturaLinVisible;

                    trigger OnDrillDown()
                    begin
                        Clear(rstInfoEmpresa);
                        rstInfoEmpresa.Get();
                        //HYPERLINK(rstInfoEmpresa."Ruta Intranet"+(CONVERTSTR(COPYSTR(Hipervinculo,STRLEN(rstInfoEmpresa."Ruta de digitalizacion"),250),'\','/')));
                        //HYPERLINK(cduEscaneado.RetornarRutaLocal(Hipervinculo));
                        cduEscaneado.TraerHTMLInternet(Html, Hipervinculo);
                        HyperLink(Html);
                    end;
                }
                field("Fecha digitalizacion"; "Fecha digitalizacion")
                {
                    StyleExpr = l_Style;
                }
                field("Codigo vinculante"; "Codigo vinculante")
                {
                    StyleExpr = l_Style;
                }
                field(strNombreProv; strNombreProveedor)
                {
                    Caption = 'Vendor name';
                    StyleExpr = l_Style;
                    Visible = strNombreProvVisible;
                }
                field(Remitente; Remitente)
                {
                }
                field("Destinatario/Grupo"; "Destinatario/Grupo")
                {
                }
                field(Usuario; Usuario)
                {
                    StyleExpr = l_Style;
                }
            }
            group(Control1000000012)
            {
                ShowCaption = false;
                Visible = blnVisible;
                field(DocumentPath; DocumentPath)
                {
                    Visible = false;
                }
                usercontrol(Viewer; WebPageViewer)
                {
                    ApplicationArea = Basic, Suite;
                    Visible = blnVisible;

                    trigger ControlAddInReady(callbackUrl: Text)
                    var
                        FileManagement: Codeunit "File Management";
                    begin
                        /*IF DocumentPath = '' THEN
                          ERROR(NoDocErr);
                        */
                        Clear(cduEscaneado);
                        cduEscaneado.TraerHTMLInternet(Html, Hipervinculo);
                        CurrPage.Viewer.Navigate(Html);
                        //CurrPage.Viewer.SetContent(FileManagement.GetFileContent(DocumentPath));

                    end;

                    trigger DocumentReady()
                    begin
                    end;

                    trigger Callback(data: Text)
                    begin
                    end;

                    trigger Refresh(callbackUrl: Text)
                    var
                        FileManagement: Codeunit "File Management";
                    begin
                        if DocumentPath <> '' then
                            CurrPage.Viewer.SetContent(FileManagement.GetFileContents(DocumentPath));
                        Clear(cduEscaneado);
                        cduEscaneado.TraerHTMLInternet(Html, Hipervinculo);
                        CurrPage.Viewer.Navigate(Html);
                    end;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000009; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("<Action10>")
            {
                Caption = '&Confirm';
                Image = Confirm;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    rstRelacionSeguridad: Record "Relación seguridad";
                    rstRelacionDocumentoEstado: Record "Seguimiento por grupo";
                begin
                    rstConfUsu.Get(UserId);
                    Clear(rstRelacionSeguridad);
                    rstRelacionSeguridad.SetRange(rstRelacionSeguridad."Grupo Origen", rstConfUsu.Grupo);
                    rstRelacionSeguridad.SetRange("Grupo Destino", codGrupoDestino);
                    if not rstRelacionSeguridad.Find('-') then
                        Error('No existe una relación de serguridad habilitada entre %1 y %2', rstConfUsu.Grupo, codGrupoDestino);

                    Clear(rstCambiarEstado);
                    if not rstCambiarEstado.funCambiarEstados(UserId, "Tipo Documento", Estado, txtEstado) then
                        Error('Usted no está habilitado para realizar este cambio');

                    if (txtEstado <> '') and (codGrupoDestino <> '') then begin

                        FindFirst;
                        repeat

                            Mark := true;
                            "Fecha ultima modificacion" := Today;
                            "Hora ultima modificacion" := Time;
                            "Usuario que modifico" := UserId;

                            Modify;

                        until Next = 0;

                        blnConfirmar := true;
                        /*
                        CurrPage.UPDATE(FALSE);
                        CurrPage.Viewer.Navigate(DocumentPath);
                        */
                    end;

                end;
            }
            action("<Action11>")
            {
                Caption = '&Confirm selection';
                Image = Confirm;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ShortCutKey = 'Ctrl+Alt+C';

                trigger OnAction()
                var
                    rstRelacionSeguridad: Record "Relación seguridad";
                    rstRelacionDocumentoEstado: Record "Seguimiento por grupo";
                    rstMensajeriatmp: Record Mensajeria;
                    p: Integer;
                    o: Integer;
                begin
                    CurrPage.SetSelectionFilter(rstMensajeriatmp);
                    rstConfUsu.Get(UserId);
                    Clear(rstRelacionSeguridad);
                    rstRelacionSeguridad.SetRange(rstRelacionSeguridad."Grupo Origen", rstConfUsu.Grupo);
                    rstRelacionSeguridad.SetRange("Grupo Destino", codGrupoDestino);
                    if not rstRelacionSeguridad.Find('-') then
                        Error('No existe una relación de serguridad habilitada entre %1 y %2', rstConfUsu.Grupo, codGrupoDestino);

                    Clear(rstCambiarEstado);
                    if not rstCambiarEstado.funCambiarEstados(UserId, "Tipo Documento", Estado, txtEstado) then
                        Error('Usted no está habilitado para realizar este cambio');

                    if (txtEstado <> '') and (codGrupoDestino <> '') then begin

                        p := rstMensajeriatmp.Count;
                        o := 0;

                        if rstMensajeriatmp.FindFirst then
                            repeat

                                o += 1;
                                if Find('-') then
                                    repeat

                                        if rstMensajeriatmp."No. Linea" = "No. Linea" then begin

                                            if "Usuario que modifico" = UserId then begin

                                                //MARK := FALSE;
                                                "Fecha ultima modificacion" := 0D;
                                                "Hora ultima modificacion" := 0T;
                                                "Usuario que modifico" := '';
                                                Modify;

                                            end
                                            else begin

                                                //MARK := TRUE;
                                                "Fecha ultima modificacion" := Today;
                                                "Hora ultima modificacion" := Time;
                                                "Usuario que modifico" := UserId;
                                                Modify;

                                            end;
                                        end;


                                    until (rstMensajeriatmp."No. Linea" = "No. Linea") or (Next = 0);

                            until (rstMensajeriatmp.Next = 0) or (p = o);
                        //NEXT(-1);
                        if Get(rstMensajeriatmp."No. Linea") then;
                        blnConfirmar := true;
                        /*
                        CurrPage.UPDATE(FALSE);
                        CurrPage.Viewer.Navigate(Hipervinculo);
                      */

                    end;
                    /*
                    CurrPage.SETSELECTIONFILTER(Rec);
                    rstConfUsu.GET(USERID);
                    CLEAR(rstRelacionSeguridad);
                    rstRelacionSeguridad.SETRANGE(rstRelacionSeguridad."Grupo Origen",rstConfUsu.Grupo);
                    rstRelacionSeguridad.SETRANGE("Grupo Destino",codGrupoDestino);
                    IF NOT rstRelacionSeguridad.FIND('-') THEN
                      ERROR('No existe una relación de serguridad habilitada entre %1 y %2',rstConfUsu.Grupo,codGrupoDestino);
                    
                    CLEAR(rstCambiarEstado);
                    IF NOT rstCambiarEstado.funCambiarEstados(USERID,"Tipo Documento",Estado,txtEstado) THEN
                      ERROR('Usted no está habilitado para realizar este cambio');
                    
                    IF (txtEstado <> '') AND (codGrupoDestino <> '') THEN
                    BEGIN
                    
                      FINDFIRST;
                      REPEAT
                    
                        MARK := TRUE;
                        "Fecha última modificación" := TODAY;
                        "Hora última modificación" := TIME;
                        "Usuario que modificó" := USERID;
                    
                        MODIFY;
                    
                      UNTIL NEXT = 0;
                    
                      blnConfirmar := TRUE;
                      CurrPage.UPDATE(FALSE);
                    
                    END;
                    */

                end;
            }
            action("&Ver digitalización")
            {
                Caption = '&View scanned document';
                Image = ViewDocumentLine;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //++Migración Arbumasa 2009
                    /*
                    Html := cduDigitalizarOAbrir.RetornarRutaLocal("Archivo vinculado");
                    
                    CLEAR(pgePDF);
                    pgePDF.SetURL(Html);
                    pgePDF.RUN;
                    */

                    //VerDigitalizacion;
                    cduEscaneado.VerPDF(Hipervinculo);

                    //--Migración Arbumasa 2009

                end;
            }
            separator(Action1000000008)
            {
            }
            action("<Action12>")
            {
                Caption = '&Post';
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ShortCutKey = 'Ctrl+Alt+R';

                trigger OnAction()
                var
                //WSHShell: Automation;
                begin
                    if not blnDisableRegister then
                        fntRegistrarCambioEstado;
                    //CurrPage.UPDATE(FALSE);
                    if FindSet then
                        repeat

                            if "Usuario que modifico" = UserId then begin

                                "Fecha ultima modificacion" := 0D;
                                "Hora ultima modificacion" := 0T;
                                "Usuario que modifico" := '';

                            end;

                        until Next = 0;
                    Commit;
                    if FindFirst then;
                    //RESET;
                    /*CurrPage.CLOSE;
                    EXIT;
                    */

                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        /*
        CLEAR(rstInfoEmpresa);
        rstInfoEmpresa.GET();
        DocumentPath := rstInfoEmpresa."Ruta Intranet"+(CONVERTSTR(COPYSTR(Html,STRLEN(rstInfoEmpresa."Ruta de digitalizacion"),250),'\','/'));
        IF blnVisible THEN
          CurrPage.Viewer.Navigate(DocumentPath);
        CurrPage.UPDATE(FALSE);
        */

    end;

    trigger OnAfterGetRecord()
    begin
        strNombreProveedor := '';
        strFacturaLin := '';

        if "Tipo Documento" in ['Factura (compras)', 'Nota débito (compras)', 'Nota crédito (compras)'] then begin

            Clear(rstProveedor);
            if rstProveedor.Get("Codigo vinculante") then begin

                strNombreProveedor := rstProveedor.Name;

            end;

        end;

        case "Tipo Documento" of
            'Factura (compras)', 'Nota débito (compras)', 'Nota crédito (compras)':
                begin

                    Clear(PunCompras);
                    PunCompras.SetRange(PunCompras."No.", "No. documento");
                    if PunCompras.FindFirst then begin

                        strFacturaLin := PunCompras."Vendor Invoice No." + PunCompras."Vendor Cr. Memo No.";
                        datFEmision := PunCompras."Document Date";

                    end
                    else begin

                        case "Tipo Documento" of
                            'Factura (compras)', 'Nota débito (compras)':
                                begin

                                    Clear(PunHFacC);
                                    PunHFacC.SetCurrentKey(PunHFacC."Pre-Assigned No.");
                                    PunHFacC.SetRange(PunHFacC."Pre-Assigned No.", "No. documento");
                                    if PunHFacC.Find('-') then begin
                                        strFacturaLin := PunHFacC."Vendor Invoice No.";
                                        datFEmision := PunHFacC."Document Date";
                                    end;

                                end;
                            'Nota crédito (compras)':
                                begin

                                    Clear(PunHNCC);
                                    PunHNCC.SetCurrentKey(PunHNCC."Pre-Assigned No.");
                                    PunHNCC.SetRange(PunHNCC."Pre-Assigned No.", "No. documento");
                                    if PunHNCC.Find('-') then begin
                                        strFacturaLin := PunHNCC."Vendor Cr. Memo No.";
                                        datFEmision := PunHNCC."Document Date";
                                    end;

                                end;
                        end;
                    end;
                end;
        end;

        strExpress := "Tipo Documento" + ' - ' + "No. documento" + ' - ' + strNombreProveedor + ' - ' + strFacturaLin;


        //MESSAGE(DocumentPath);

        if "Usuario que modifico" = UserId then
            l_Style := 'Favorable'
        else
            l_Style := '';


        Clear(rstConfUsu);
        rstConfUsu.Get(UserId);
        blnVisible := rstConfUsu."Show PDF previsualization";
        if blnVisible then
            Html := Hipervinculo
        else
            Html := '';

        Clear(rstInfoEmpresa);
        rstInfoEmpresa.Get();
        cduEscaneado.TraerHTMLInternet(Html, Hipervinculo);
        //DocumentPath := rstInfoEmpresa."Ruta Intranet"+(CONVERTSTR(COPYSTR(Html,STRLEN(rstInfoEmpresa."Ruta de digitalizacion"),250),'\','/'));
        DocumentPath := Html;
        if blnVisible then
            CurrPage.Viewer.Navigate(DocumentPath);

        //CurrPage.UPDATE(FALSE);
    end;

    trigger OnClosePage()
    begin
        /*
        SETRANGE("Usuario que modificó",USERID);
        MODIFYALL("Fecha última modificación",0D);
        MODIFYALL("Hora última modificación",0T);
        MODIFYALL("Usuario que modificó",'');
        COMMIT;
        RESET;
        */

    end;

    trigger OnInit()
    begin
        CurrPage.LookupMode := true;
        strFacturaCabVisible := true;
        strFacturaLinVisible := true;
        strNombreProvVisible := true;
    end;

    trigger OnOpenPage()
    begin
        if "Tipo Documento" in ['Factura (compras)', 'Fact. pronto venc. (compras)', 'Pedido (compras)',
        'Nota débito (compras)', 'Nota crédito (compras)', 'Déb. pronto venc. (compras)'] then begin

            strNombreProvVisible := true;
            CurrPage.Editable(true);
            strFacturaLinVisible := true;


        end
        else begin

            /*  strNombreProveedorVisible := FALSE;
              strNombreProvVisible := FALSE;
              strFacturaCabVisible := FALSE;
              strFacturaLinVisible := FALSE;
             */
        end;

        txtEstado := '';
        codGrupoDestino := '';
        txtUsuario := '';

        Clear(rstConfUsu);
        rstConfUsu.Get(UserId);
        blnVisible := rstConfUsu."Show PDF previsualization";
        /*blnVisible := rstConfUsu."Show PDF previsualization";
        IF blnVisible THEN
          Html := Hipervinculo
        ELSE
          Html := '';
          */
        blnConfirmar := false;

        funRecomendarCambioEstado;
        //OnActivateForm;

        CurrPage.Update(false);

        SetCurrentKey("Importe pendiente");
        SetAscending("Importe pendiente", false);
        if FindFirst then;

    end;

    var
        FormLista: Page "Seguimiento por usuario";
        PunSeguimiento: Record "Seguimiento Documentos";
        PunTipoDoc: Record "Tipos documento";
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
        frmCuadroEntradas: Page "Cuadro producción";
        rstConfUsu: Record "User Setup";
        cduMensajeria: Codeunit "Mensajería";
        rstMensajeria: Record Mensajeria;
        txtEstado: Text[30];
        codGrupoDestino: Code[10];
        rstSeguridad: Record Seguridad;
        rstSeguridadUsuario: Record "Seguridad por usuario";
        strNombreProveedor: Text[50];
        strNombreProv: Text[50];
        strFacturaCab: Text[50];
        strFacturaLin: Text[50];
        rstProveedor: Record Vendor;
        blnConfirmar: Boolean;
        Text1: Label 'No ha confirmado ninguna línea. ¿Está seguro que desea continuar?';
        Text2: Label 'Por favor, confirme alguna línea';
        blnDisableRegister: Boolean;
        rstDebito: Record "Purchase Header";

        strNombreProvVisible: Boolean;

        strFacturaLinVisible: Boolean;

        strFacturaCabVisible: Boolean;
        Html: Text[1024];
        rstInfoEmpresa: Record "Company Information";
        txtUsuario: Text[30];
        rstEstadosDocumentos: Record "Seguridad cambio estados";
        rstCambiarEstado: Record "Seguridad cambio estados";
        pgeEstadosDocumentos: Page "Lista seguridad cambio estado";
        strExpress: Text[1024];
        rstDocVin: Record "Vinculación documentos";
        rstHRCompra: Record "Purch. Rcpt. Header";
        rstLiqPago: Record "Cab. Liquidacion Pagos";
        cduDigitalizarOAbrir: Codeunit Escaneado;
        rstDocDigit: Record "Documentos digitalizados";
        blnOcultar: Boolean;
        g_strTipoDoc: Text[50];
        g_strEstado: Text[50];
        blnVisible: Boolean;
        l_Style: Text[20];
        DocumentPath: Text[250];
        NoDocErr: Label 'No document has been specified.';
        cduEscaneado: Codeunit Escaneado;
        pgePDF: Page "PDFViewer Page";
        datFEmision: Date;

    [Scope('OnPrem')]
    procedure funCambiarAEstado(strEstado: Text[100]; codGrupo: Code[20])
    begin
        if strEstado <> '' then begin

            txtEstado := strEstado;
            codGrupoDestino := codGrupo;
            "Usuario que modifico" := UserId;
            Modify;

        end;
    end;

    [Scope('OnPrem')]
    procedure funRecomendarCambioEstado(): Boolean
    begin
        Clear(rstCambiarEstado);
        rstCambiarEstado.SetRange(Usuario, UserId);
        if g_strTipoDoc <> '' then
            rstCambiarEstado.SetRange("Tipo documento", g_strTipoDoc)
        else
            rstCambiarEstado.SetRange("Tipo documento", "Tipo Documento");
        if g_strEstado <> '' then
            rstCambiarEstado.SetRange("Estado original", g_strEstado)
        else
            rstCambiarEstado.SetFilter("Estado original", '%1|%2', Estado, '');

        if codGrupoDestino <> '' then
            rstCambiarEstado.SetRange("Grupo destino", codGrupoDestino);
        if txtEstado <> '' then
            rstCambiarEstado.SetRange("Estado destino", txtEstado);
        rstCambiarEstado.SetRange(Recomendado, true);
        if rstCambiarEstado.FindFirst then
            repeat

                if txtUsuario = '' then begin

                    Clear(rstConfUsu);
                    rstConfUsu.SetRange(rstConfUsu.Grupo, rstCambiarEstado."Grupo destino");
                    if rstConfUsu.FindFirst then
                        txtUsuario := rstConfUsu."User ID";

                end;
                txtEstado := rstCambiarEstado."Estado destino";
                codGrupoDestino := rstCambiarEstado."Grupo destino";
                if "No. Linea" <> 0 then
                    funCambiarAEstado(rstCambiarEstado."Estado destino", rstCambiarEstado."Grupo destino");
                if rstCambiarEstado."Filtro por monto" <> '' then
                    SetFilter("Importe pendiente", rstCambiarEstado."Filtro por monto");
                if FindFirst then
                    exit(true);

            until rstCambiarEstado.Next = 0;

        CurrPage.Update(false);
    end;

    [Scope('OnPrem')]
    procedure fntRegistrarCambioEstado()
    var
        rstConfUsu: Record "User Setup";
        rstRelacionSeguridad: Record "Relación seguridad";
        rstRelacionDocumentoEstado: Record "Seguimiento por grupo";
        codGrupo: Code[20];
        t_rstMensajeria: Record Mensajeria temporary;
    begin
        Clear(rstConfUsu);
        rstConfUsu.Get(UserId);

        blnConfirmar := true;

        if not blnConfirmar then begin

            if not Confirm(Text1) then
                Error(Text2);

        end;

        Clear(rstCambiarEstado);
        if not rstCambiarEstado.funCambiarEstados(UserId, "Tipo Documento", Estado, txtEstado) then
            Error('Usted no está habilitado para realizar este cambio');

        Clear(rstRelacionSeguridad);
        rstRelacionSeguridad.SetRange(rstRelacionSeguridad."Grupo Origen", rstConfUsu.Grupo);
        rstRelacionSeguridad.SetRange("Grupo Destino", codGrupoDestino);
        if not rstRelacionSeguridad.Find('-') then
            Error('No existe una relación de serguridad habilitada entre %1 y %2', rstConfUsu.Grupo, codGrupoDestino);

        Clear(rstRelacionSeguridad);
        rstRelacionSeguridad.SetRange(rstRelacionSeguridad."Grupo Origen", rstConfUsu.Grupo);
        if rstRelacionSeguridad.Find('-') then
            repeat

                Clear(rstRelacionDocumentoEstado);
                rstRelacionDocumentoEstado.SetRange(rstRelacionDocumentoEstado.Grupo, rstRelacionSeguridad."Grupo Destino");
                rstRelacionDocumentoEstado.SetRange("Tipo documento", "Tipo Documento");
                rstRelacionDocumentoEstado.SetRange("Estado documento", txtEstado);

            until (rstRelacionSeguridad.Next = 0) or (rstRelacionDocumentoEstado.Find('-'));

        Clear(t_rstMensajeria);
        if Rec.Find('-') then
            repeat

                t_rstMensajeria.TransferFields(Rec);
                t_rstMensajeria.Insert;

            until Rec.Next = 0
        else
            Error('No se ha encontrado ninguna acción a ejecutar');

        if t_rstMensajeria.Find('-') then
            repeat

                if UpperCase(t_rstMensajeria."Usuario que modifico") = UpperCase(UserId) then begin

                    Clear(rstEstadosDocumentos);
                    rstEstadosDocumentos.SetRange(Usuario, UserId);
                    rstEstadosDocumentos.SetRange("Tipo documento", t_rstMensajeria."Tipo Documento");
                    rstEstadosDocumentos.SetRange("Estado original", t_rstMensajeria.Estado);
                    rstEstadosDocumentos.SetRange("Estado destino", txtEstado);
                    rstEstadosDocumentos.SetRange("Grupo destino", codGrupoDestino);
                    if not rstEstadosDocumentos.Find('-') then begin

                        Clear(rstEstadosDocumentos);
                        rstEstadosDocumentos.SetRange(Usuario, UserId);
                        rstEstadosDocumentos.SetRange("Tipo documento", t_rstMensajeria."Tipo Documento");
                        rstEstadosDocumentos.SetRange("Estado original", '');
                        rstEstadosDocumentos.SetRange("Estado destino", txtEstado);
                        rstEstadosDocumentos.SetRange("Grupo destino", codGrupoDestino);
                        if not rstEstadosDocumentos.Find('-') then
                            Error('No se ha encontrado Permiso de Cambio de Estado');

                    end;

                    cduMensajeria.fntParametrizarCambioEstado(rstEstadosDocumentos);
                    cduMensajeria.RegistrarMensaje('Cambio de Estado', '', t_rstMensajeria."No. documento", t_rstMensajeria."Tipo Documento",
                    txtEstado, Today, t_rstMensajeria."Tipo movimiento"::"Seguimiento flujo documentos", codGrupoDestino, t_rstMensajeria."1er Nivel", t_rstMensajeria."2er Nivel", t_rstMensajeria."No. Mensaje",
                    t_rstMensajeria.Subdepartamento, t_rstMensajeria."5to Nivel", t_rstMensajeria."6to Nivel", '');

                end;

            until t_rstMensajeria.Next = 0
        else
            Error('No se ha encontrado ninguna acción a ejecutar');
    end;

    [Scope('OnPrem')]
    procedure fntBuscarMensajeria(l_rstMensajeria: Record Mensajeria)
    begin
        Clear(Rec);
        SetRange("No. Linea", l_rstMensajeria."No. Linea");
        if FindFirst then;
    end;

    [Scope('OnPrem')]
    procedure fntDisableRegister(blnDisableReg: Boolean)
    begin
        blnDisableRegister := blnDisableReg;
    end;

    local procedure OnActivateForm()
    begin
        SetFilter("Tipo movimiento", '%1|%2|%3', "Tipo movimiento"::"Mensaje con Seguimiento", "Tipo movimiento"::Alerta,
                  "Tipo movimiento"::"Flujo documentos");
        CurrPage.Update(false);
    end;

    [Scope('OnPrem')]
    procedure fntEstadoOrigen(l_strTipoDoc: Text[50]; l_strEstado: Text[50])
    begin
        g_strTipoDoc := l_strTipoDoc;
        g_strEstado := l_strEstado;
    end;
    /*
    [Scope('OnPrem')]
    procedure SetDocument(RecordVariant: Variant; ReportType: Integer; CustNo: Code[20])
    var
        ReportSelections: Record "Report Selections";
    begin
        ReportSelections.GetHtmlReportForCust(DocumentPath, ReportType, RecordVariant, CustNo);
    end;
    */
    local procedure VerDigitalizacion()
    begin
        Clear(pgePDF);
        Clear(cduEscaneado);
        cduEscaneado.TraerHTMLInternet(Html, Hipervinculo);
        pgePDF.SetURL(Html);
        pgePDF.Run;
    end;
}

enum 1 ReportType
{
    Extensible = true;

    value(0; MyValue)
    {
    }
}