page 50548 "Seguimiento Documentos"
{
    // IBdos Argentina - USS - 020403 - Adición Arbumasa

    DataCaptionExpression = strExpress;
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = true;
    MultipleNewLines = true;
    PageType = Worksheet;
    ShowFilter = true;
    SourceTable = Mensajeria;

    layout
    {
        area(content)
        {
            repeater(Documentos)
            {
                Editable = false;
                field(Fecha; Fecha)
                {
                }
                field(Hora; Hora)
                {
                }
                field("No. documento"; "No. documento")
                {
                    Lookup = true;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        PunTipoDoc.Reset;
                        PunTipoDoc.SetRange("Tipos documento", "Tipo Documento");
                        if PunTipoDoc.Find('-') then;

                        if "Tipo Documento" in ['Reparto (ventas)'] then begin

                            Clear(rstReparto);
                            rstReparto.SetRange(rstReparto."No. Documento", "No. documento");
                            if rstReparto.FindFirst then
                                PAGE.Run(PunTipoDoc."No. form", rstReparto);

                        end;

                        if "Tipo Documento" in ['Cotización (compras)', 'Factura (compras)', 'Pedido (compras)', 'Fact. pronto venc. (compras)', 'Nota débito (compras)', 'Déb. pronto venc. (compras)'] then begin

                            PunCompras.Reset;
                            PunCompras.SetRange(PunCompras."No.", "No. documento");
                            if PunCompras.Find('-') then begin

                                case "Tipo Documento" of
                                    'Cotización (compras)':
                                        begin

                                            Clear(PunCompras);
                                            if PunCompras.Get(PunCompras."Document Type"::Quote, "No. documento") then
                                                PAGE.Run(PunTipoDoc."No. form", PunCompras)

                                        end;

                                    'Factura (compras)', 'Nota débito (compras)', 'Déb. pronto venc. (compras)':
                                        begin

                                            Clear(PunCompras);
                                            if PunCompras.Get(PunCompras."Document Type"::Invoice, "No. documento") then
                                                PAGE.Run(PunTipoDoc."No. form", PunCompras)

                                        end;

                                    'Fact. pronto venc. (compras)':
                                        begin

                                            Clear(PunCompras);
                                            if PunCompras.Get(PunCompras."Document Type"::Invoice, "No. documento") then
                                                PAGE.Run(PunTipoDoc."No. form", PunCompras)

                                        end;

                                    'Pedido (compras)':
                                        begin

                                            Clear(PunCompras);
                                            if PunCompras.Get(PunCompras."Document Type"::Order, "No. documento") then
                                                PAGE.Run(PunTipoDoc."No. form", PunCompras)

                                        end;
                                end;

                            end
                            else begin

                                PunHRemC.Reset;
                                PunHRemC.SetRange(PunHRemC."No.", "No. documento");
                                if PunHRemC.Find('-') then begin

                                    PAGE.Run(PAGE::"Posted Purchase Receipt", PunHRemC);

                                end;

                                PunHFacC.Reset;
                                PunHFacC.SetCurrentKey(PunHFacC."Pre-Assigned No.");
                                PunHFacC.SetRange(PunHFacC."Pre-Assigned No.", "No. documento");
                                if PunHFacC.Find('-') then begin

                                    PAGE.Run(PAGE::"Posted Purchase Invoice", PunHFacC);

                                end;

                                PunHNCC.Reset;
                                PunHNCC.SetRange("No.", "No. documento");
                                if PunHNCC.Find('-') then begin

                                    PAGE.Run(PAGE::"Posted Purchase Credit Memo", PunHNCC);

                                end;
                            end;
                        end;

                        if "Tipo Documento" = 'Nota crédito (compras)' then begin

                            Clear(rstCabNota);
                            Clear(frmNotaCrédito);
                            rstCabNota.Get(rstCabNota."Document Type"::"Credit Memo", "No. documento");
                            PAGE.Run(PAGE::"Purchase Credit Memo", rstCabNota);

                        end;

                        if "Tipo Documento" in ['Factura (ventas)', 'Pedido (ventas)'] then begin

                            Clear(PunVentas);
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

                        if "Tipo Documento" = 'Remito (ventas)' then begin

                            Clear(rstHCRemito);
                            rstHCRemito.SetRange("No.", "No. documento");
                            if rstHCRemito.Find('-') then begin

                                PAGE.Run(PAGE::"Posted Sales Shipment", rstHCRemito);

                            end;

                        end;

                        if "Tipo Documento" = 'Liquidación pagos' then begin

                            Clear(rstLiqPago);
                            rstLiqPago.SetRange(rstLiqPago."No. Liquidacion", "No. documento");
                            if rstLiqPago.Find('-') then
                                PAGE.Run(50671, rstLiqPago);

                        end;
                    end;
                }
                field(Detalle; Detalle)
                {
                }
                field(strFacturaLin; strFacturaLin)
                {
                    Caption = 'No. documento proveedor';
                    Description = 'Doble click para activar la digitalización';
                    ToolTip = 'Doble click para activar la digitalización';

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Html := 'about:blank';
                        Clear(rstInfoEmpresa);
                        rstInfoEmpresa.Get();
                        if Exists(rstInfoEmpresa."Ruta Intranet" + (ConvertStr(CopyStr(Hipervinculo, 4, 250), '\', '/'))) then
                            Html := rstInfoEmpresa."Ruta Intranet" + (ConvertStr(CopyStr(Hipervinculo, 4, 250), '\', '/'))
                        else begin

                            if Exists(rstInfoEmpresa."Ruta NavXtender" + (ConvertStr(CopyStr(Hipervinculo, 4, 250), '\', '/'))) then
                                Html := rstInfoEmpresa."Ruta NavXtender" + (ConvertStr(CopyStr(Hipervinculo, 4, 250), '\', '/'))
                            else
                                Html := rstInfoEmpresa."Ruta Intranet" + (ConvertStr(CopyStr(Hipervinculo, 4, 250), '\', '/'));
                        end;
                    end;
                }
                field("Tipo Documento"; "Tipo Documento")
                {
                }
                field("Destinatario/Grupo"; "Destinatario/Grupo")
                {
                }
                field(Remitente; Remitente)
                {
                }
                field(Departamento; Departamento)
                {
                }
                field("Codigo vinculante"; "Codigo vinculante")
                {
                }
                field(strNombreProv; strNombreProveedor)
                {
                    Caption = 'Vendor name';
                }
                field(Estado; Estado)
                {
                }
                field(Hipervinculo; Hipervinculo)
                {
                    AssistEdit = true;
                    Editable = false;
                    Lookup = true;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Clear(rstInfoEmpresa);
                        rstInfoEmpresa.Get();
                        Clear(rstDocVin);
                        rstDocVin.SetRange("No. linea mensajeria", "No. Linea");
                        rstDocVin.SetFilter(Hipervinculo, '<>%1', '');
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
                field("Documentos vinculados"; "Documentos vinculados")
                {
                    Lookup = true;
                    LookupPageID = "Lista vinculación documentos";

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
                field("Fecha digitalizacion"; "Fecha digitalizacion")
                {
                }
                field(Usuario; Usuario)
                {
                }
            }
            fixed(ViewPDF)
            {
                usercontrol(Viewer; WebPageViewer)
                {
                    ApplicationArea = Basic, Suite;

                    trigger ControlAddInReady(callbackUrl: Text)
                    begin
                        if DocumentPath = '' then
                            Error(NoDocErr);
                        CurrPage.Viewer.Navigate(DocumentPath);
                    end;

                    trigger DocumentReady()
                    begin
                    end;

                    trigger Callback(data: Text)
                    begin
                    end;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000005; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Cambiar estado")
            {
                Caption = '&Change status';
                Image = Refresh;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Clear(rstSeguridad);
                    Clear(rstSeguridadUsuario);
                    Clear(frmCambiarEstado);
                    Clear(rstSeguridadCambioEstado);

                    rstSeguridadCambioEstado.SetRange(rstSeguridadCambioEstado.Usuario, UserId);
                    rstSeguridadCambioEstado.SetRange("Tipo documento", "Tipo Documento");
                    rstSeguridadCambioEstado.SetRange("Estado original", Estado);
                    if rstSeguridadCambioEstado.Find('-') then;

                    //Rec.MARKEDONLY(TRUE);
                    //PAGE.RUNMODAL(PAGE::"Cambiar estado documento",Rec);
                    PAGE.Run(PAGE::"Cambiar estado documento", Rec);
                end;
            }
            action("Agregar vínculo documento")
            {
                Caption = 'Agregar vínculo documento';
                RunObject = Page "Lista vinculación documentos";
                RunPageLink = "No. linea mensajeria" = FIELD("No. Linea");
            }
            action("Ver digitalización online")
            {
                Caption = 'Ver digitalización online';

                trigger OnAction()
                begin
                    rstInfoEmpresa.Get;
                    HyperLink(rstInfoEmpresa."Ruta Intranet" + (ConvertStr(CopyStr(Hipervinculo, StrLen(rstInfoEmpresa."Ruta de digitalizacion"), 250), '\', '/')));
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        Clear(rstInfoEmpresa);
        rstInfoEmpresa.Get();
        DocumentPath := rstInfoEmpresa."Ruta Intranet" + (ConvertStr(CopyStr(Hipervinculo, StrLen(rstInfoEmpresa."Ruta de digitalizacion"), 250), '\', '/'));
        CurrPage.Viewer.Navigate(DocumentPath);
    end;

    trigger OnAfterGetRecord()
    begin
        strNombreProveedor := '';
        strFacturaLin := '';

        if "Tipo Documento" in ['Factura (compras)', 'Fact. pronto venc. (compras)',
        'Nota débito (compras)', 'Nota crédito (compras)', 'Déb. pronto venc. (compras)'] then begin

            Clear(rstProveedor);
            if rstProveedor.Get("Codigo vinculante") then begin

                strNombreProveedor := rstProveedor.Name;

            end;

        end;

        if "Tipo Documento" in ['Pedido (compras)'] then begin

            Clear(PunCompras);
            if PunCompras.Get(PunCompras."Document Type"::Order, "No. documento") then
                strNombreProveedor := PunCompras."Buy-from Vendor Name";

        end;

        if "Tipo Documento" in [''] then begin

            Clear(rstProveedor);
            if rstProveedor.Get("Codigo vinculante") then begin

                strNombreProveedor := rstProveedor.Name;

            end;

        end;

        Clear(PunCompras);
        PunCompras.SetRange(PunCompras."No.", "No. documento");
        if PunCompras.FindFirst then begin

            strFacturaLin := PunCompras."Vendor Cr. Memo No." + PunCompras."Vendor Invoice No.";

        end
        else begin

            Clear(PunHFacC);
            PunHFacC.SetCurrentKey(PunHFacC."Pre-Assigned No.");
            PunHFacC.SetRange(PunHFacC."Pre-Assigned No.", "No. documento");
            if PunHFacC.Find('-') then
                strFacturaLin := PunHFacC."Vendor Invoice No.";

        end;

        DetalleOnFormat;
        TipoDocumentoOnFormat;

        if "No. Linea" <> xRec."No. Linea" then
            Html := 'about:blank';

        strExpress := "Tipo Documento" + ' - ' + "No. documento" + ' - ' + strNombreProveedor + ' - ' + strFacturaLin;

        //++Migración Arbumasa 2009
        Html := 'about:blank';
        Clear(rstInfoEmpresa);
        rstInfoEmpresa.Get();
        if Hipervinculo <> '' then
            Html := rstInfoEmpresa."Ruta Intranet" + (ConvertStr(CopyStr(Hipervinculo, StrLen(rstInfoEmpresa."Ruta de digitalizacion"), 1024), '\', '/'))
        else
            Html := 'about:blank';
        //CurrPage.ViewPDFControl.PAGE.SetURL(Html);

        //--Migración Arbumasa 2009
    end;

    trigger OnClosePage()
    begin
        Reset;
    end;

    trigger OnInit()
    begin
        strFacturaLinVisible := true;
        strFacturaCabVisible := true;
        strNombreProveedorVisible := true;
        strNombreProvVisible := true;
    end;

    trigger OnOpenPage()
    begin
        OnActivateForm;
        if FindFirst then;
    end;

    var
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
        rstConfUsu: Record "User Setup";
        cduMensajeria: Codeunit "Mensajería";
        rstMensajeria: Record Mensajeria;
        rstSeguridad: Record Seguridad;
        rstSeguridadUsuario: Record "Seguridad por usuario";
        rstSeguridadCambioEstado: Record "Seguridad cambio estados";
        strNombreProveedor: Text[50];
        rstProveedor: Record Vendor;
        strFacturaLin: Text[30];
        rstCabNota: Record "Purchase Header";
        rstHCRemito: Record "Sales Shipment Header";
        rstTipoDoc: Record "Tipos documento";
        rstDigitalizar: Record "Ruta digitalizacion depto/espe";
        cduDigitalizarOAbrir: Codeunit Escaneado;
        rstDocDigit: Record "Documentos digitalizados";
        rstDocVin: Record "Vinculación documentos";
        rstInfoEmpresa: Record "Company Information";
        rstHRCompra: Record "Purch. Rcpt. Header";
        rstLiqPago: Record "Cab. Liquidacion Pagos";

        strNombreProveedorVisible: Boolean;

        strNombreProvVisible: Boolean;

        strFacturaCabVisible: Boolean;

        strFacturaLinVisible: Boolean;

        DetalleEmphasize: Boolean;

        "Tipo DocumentoEmphasize": Boolean;
        Html: Text[1024];
        strExpress: Text[1024];
        rstReparto: Record "Cab. Reparto";
        frmCambiarEstado: Page "Cambiar estado documento";
        "frmNotaCrédito": Page "Purchase Credit Memo";
        frmCuadroEntradas: Page "Cuadro Entradas Resumido";
        DocumentPath: Text[250];
        NoDocErr: Label 'No document has been specified.';

    local procedure OnActivateForm()
    begin
        SetFilter("Tipo movimiento", '%1|%2|%3', "Tipo movimiento"::"Mensaje con Seguimiento", "Tipo movimiento"::Alerta,
                  "Tipo movimiento"::"Flujo documentos");
        CurrPage.Update(false);
    end;

    local procedure DetalleOnFormat()
    begin
        if Detalle <> '' then begin
            DetalleEmphasize := true;

        end;
    end;

    local procedure TipoDocumentoOnFormat()
    begin
        if "Tipo Documento" in ['Fact. pronto venc. (compras)', 'Déb. pronto venc. (compras)'] then begin
            "Tipo DocumentoEmphasize" := true;
            //CurrPage."Tipo Documento".UPDATESELECTED(TRUE);

        end;
    end;
}

