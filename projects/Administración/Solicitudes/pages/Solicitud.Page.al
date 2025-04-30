page 50512 Solicitud
{
    // IBdos Argentina - USS - 040403 - Modificación Arbumasa
    //  a) Botón para imprimir
    // 
    // IBdos Argentina - USS - 200503 - Modificación Arbumasa
    //  a) No se puede ingresar una descripción con cantidad

    AutoSplitKey = false;
    Caption = 'Solicitud';
    PageType = Document;
    PromotedActionCategories = 'Nuevo,Proceso,Reporte,Acciones,Category5_caption,Category6_caption,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    RefreshOnActivate = true;
    SaveValues = true;
    SourceTable = Solicitud;
    SourceTableView = SORTING("Nombre Libro Solicitud", "No. documento");
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(Solicitud)
            {
                Caption = 'Solicitud';
                Editable = blnHabilitarRegistro;
                field("Nombre Libro Solicitud"; Rec."Nombre Libro Solicitud")
                {
                    Importance = Promoted;

                    trigger OnValidate()
                    var
                        l_rstLHD: Record "Req. Wksh. Template";
                    begin
                        Clear(l_rstLHD);
                        l_rstLHD.SetRange(Name, Rec."Nombre Libro Solicitud");
                        if l_rstLHD.FindFirst then
                            Rec."Tipo documento" := l_rstLHD."Tipo documento";
                    end;
                }
                field("Tipo documento"; Rec."Tipo documento")
                {
                }
                field("No. documento"; Rec."No. documento")
                {
                }
                field(Aprobado; Rec.Aprobado)
                {
                }
                field(Estado; Estado)
                {
                    Editable = false;
                }
                field("Global Dimension 1"; Rec."Global Dimension 1")
                {
                }
                field("Global Dimension 2"; Rec."Global Dimension 2")
                {
                }
                field("Global Dimension 3"; Rec."Global Dimension 3")
                {
                }
                field("Global Dimension 4"; Rec."Global Dimension 4")
                {
                    Caption = 'Sector';
                }
                label(Control1000000001)
                {
                    ShowCaption = false;
                }
                field("Fecha registro"; Rec."Fecha registro")
                {
                    Caption = 'Fecha Registro';
                }
                field("Fecha Entrega"; Rec."Fecha Entrega")
                {
                }
                field(Importancia; Rec.Importancia)
                {
                }
                field(Procedencia; Rec.Procedencia)
                {
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    Importance = Promoted;

                    trigger OnAssistEdit()
                    begin
                        Clear(ChangeExchangeRate);
                        if Rec."Fecha pedido" <> 0D then
                            ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", Rec."Fecha pedido")
                        else
                            ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", WorkDate);
                        if ChangeExchangeRate.RunModal = ACTION::OK then begin
                            Rec.Validate("Currency Factor", ChangeExchangeRate.GetParameter);
                            CurrPage.Update;
                        end;
                        Clear(ChangeExchangeRate);
                    end;
                }
                field(Observaciones; Rec.Observaciones)
                {
                    Caption = 'Referencia';
                }
                field("Descripción"; Rec.Descripción)
                {
                }
                field("Importe Solicitud"; Rec."Importe Solicitud")
                {
                }
                field("Importe OC"; Rec."Importe OC")
                {
                }
                field("Importe facturado"; decImpoFC)
                {

                    trigger OnAssistEdit()
                    begin
                        fntNavegar;
                    end;
                }
                field(Faltante; decDif)
                {
                    Editable = false;
                }
            }
            part(Lineas; "Subform solicitud")
            {
                Editable = blnHabilitarRegistro;
                SubPageLink = "No. Documento" = FIELD("No. documento"),
                              "Nombre libro Solicitud" = FIELD("Nombre Libro Solicitud");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("&Navegar")
            {
                Caption = '&Navegar';
                Image = Navigate;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                //The property 'PromotedOnly' can only be set if the property 'Promoted' is set to 'true'
                //PromotedOnly = true;

                trigger OnAction()
                begin
                    //IBdos Argentina - USS - 191202 - Inicio Modificación Arbumasa
                    //Adición de navegación

                    Navegar;

                    //IBdos Argentina - USS - 191202 - Fin Modificación Arbumasa
                end;
            }
            group("A&cciones")
            {
                Caption = 'A&cciones';
                action("Cambiar estado &Solicitud")
                {
                    Caption = 'Cambiar estado &Solicitud';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        if not Aprobado then begin

                            Clear(ConfUsu);
                            Clear(rstCambioEstado);

                            PunLins.Reset;
                            PunLins.SetRange(PunLins."Nombre libro Solicitud", "Nombre Libro Solicitud");
                            PunLins.SetRange("No. Documento", "No. documento");
                            if PunLins.Find('-') then
                                repeat

                                    if (PunLins."No." = '') and (PunLins.Cantidad > 0) then begin

                                        Error('Debe ingresar un código de producto en la línea %1', PunLins."No. linea");
                                        Aprobado := false;

                                    end;
                                    if (PunLins.Tipo <> 0) and (PunLins."No." = '') then begin

                                        Error('Debe ingresar un código de producto en la línea %1', PunLins."No. linea");
                                        Aprobado := false;

                                    end;

                                until PunLins.Next = 0;

                            Clear(rstMensajeria);
                            rstMensajeria.SetCurrentKey("No. documento");
                            rstMensajeria.SetRange(rstMensajeria."No. documento", "No. documento");
                            rstMensajeria.FindFirst;

                            PAGE.Run(50064, rstMensajeria);

                        end;

                        //CurrPage.UPDATE(TRUE);
                        CurrPage.Close;
                    end;
                }
                action(Registrar)
                {
                    Caption = 'Registrar';
                    Enabled = blnHabilitarRegistro;
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F11';

                    trigger OnAction()
                    begin
                        fntRegistrar(Rec);
                    end;
                }
                action(Reopen)
                {
                    Caption = 'Abrir nuevamente';
                    Image = OpenWorksheet;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        l_rstConfUsuario: Record "User Setup";
                        cduMensajeria: Codeunit "Mensajería";
                    begin
                        if Confirm('Desea reabrir esta solicitud?') then begin

                            PunLins.Reset;
                            PunLins.SetRange(PunLins."Nombre libro Solicitud", "Nombre Libro Solicitud");
                            PunLins.SetRange("No. Documento", "No. documento");
                            if PunLins.Find('-') then
                                repeat

                                    if (PunLins."No." = '') and (PunLins.Cantidad > 0) then begin

                                        Error('Debe ingresar un código de producto en la línea %1', PunLins."No. linea");
                                        Aprobado := false;

                                    end;

                                until PunLins.Next = 0;

                            Clear(rstMensajeria);
                            rstMensajeria.SetCurrentKey("No. documento");
                            rstMensajeria.SetRange(rstMensajeria."No. documento", "No. documento");
                            rstMensajeria.Find('-');

                            frmCambioEst.fntBuscarMensajeria(rstMensajeria);
                            frmCambioEst.funCambiarAEstado('Abierto', '');
                            if not frmCambioEst.funRecomendarCambioEstado then begin

                                frmCambioEst.fntDisableRegister(true);
                                frmCambioEst.SetTableView(rstMensajeria);
                                frmCambioEst.Run;

                            end;

                            frmCambioEst.fntRegistrarCambioEstado;
                            /*
                            IF l_rstConfUsuario.GET(USERID) THEN
                              cduMensajeria.RegistrarMensaje('Alta de Solicitud','',"No. documento","Tipo documento",'Abierto',WORKDATE,
                              rstMensajeria."Tipo movimiento"::Seguimiento,l_rstConfUsuario.Grupo,'','','','','','','');
                            */

                        end;

                    end;
                }
                action("Estadísticas")
                {
                    Caption = 'Estadísticas';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Matriz cotización proveedores";
                    RunPageLink = "No. Documento" = FIELD("No. documento");
                    ShortCutKey = 'F7';
                }
            }
            group("Re&gistrar")
            {
                Caption = 'Re&gistrar';
                action("&Imprimir")
                {
                    Caption = '&Imprimir';
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunPageOnRec = true;

                    trigger OnAction()
                    begin
                        //IBdos Argentina - USS - 040403 - Inicio Modificación Arbumasa
                        //Botón para imprimir

                        CurrPage.SetSelectionFilter(Rec);
                        REPORT.Run(REPORT::"Solicitud Provisoria", true, false, Rec);
                        Reset;

                        //IBdos Argentina - USS - 040403 - Fin Modificación Arbumasa
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        rstSegUsu: Record "Seguridad cambio estados";
        rstEstado: Record Estados;
    begin
        blnHabilitarRegistro := false;
        CurrPage.Lineas.PAGE.fntCabecera("Nombre Libro Solicitud", "No. documento");
        Clear(rstSegUsu);
        rstSegUsu.SetRange(Usuario, UserId);
        rstSegUsu.SetRange("Tipo documento", 'Solicitud (compras)');
        rstSegUsu.SetRange("Estado original", Estado);
        rstSegUsu.SetRange("Estado destino", 'Aprobado');
        if rstSegUsu.FindFirst then begin

            Clear(rstSegUsu);
            rstSegUsu.SetRange(Usuario, UserId);
            rstSegUsu.SetRange("Tipo documento", 'Solicitud (compras)');
            rstSegUsu.SetRange("Estado original", 'Aprobado');
            rstSegUsu.SetRange("Estado destino", 'Aprobado y registrado');
            if rstSegUsu.FindFirst then
                blnHabilitarRegistro := true
            else
                blnHabilitarRegistro := false;

        end;

        CalcFields(Estado);
        Clear(rstEstado);
        if Estado <> '' then begin

            rstEstado.Get(Estado);
            blnHabilitarRegistro := not rstEstado."No editable";

        end;

        decDif := "Importe Solicitud" - "Importe OC";
        decImpoFC := fntImporteFacturaTotal;
    end;

    trigger OnInit()
    begin
        blnHabilitarRegistro := true;
    end;

    var
        linhoja: Record "Lín. solicitud";
        LinDem: Record "Lín. solicitud";
        Mensaje: Text[250];
        ConfUsu: Record "User Setup";
        Tipo: Option " ","Solicitud (compras)","Cotización (compras)","Pedido (compras)","Factura (compras)","Reparto (ventas)","Factura (ventas)","Vale de consumo","Vale de consumo en tránsito";
        Estado: Option " ","A aprobar","A confirmar",Abierta,Abierto,Aprobada,"Aprobada y registrada","Aprobado y registrado",Completada,Eliminada,Eliminado,"En factura","En proceso",Promovida,"Promovido a tránsito",Rechazada,Recibida,Recirculado,Registrada,"Registrado a proyecto";
        PunMensajeria: Record Mensajeria;
        PunTipoDocumento: Record "Tipos documento";
        ImprSol: Report "Solicitud Provisoria";
        CodeMens: Codeunit "Mensajería";
        PunLins: Record "Lín. solicitud";
        CodeSerie: Codeunit "No. series";
        Infoempresa: Record "Company Information";
        PunSeguimiento: Record Mensajeria;
        rstCambioEstado: Record "Seguridad cambio estados";
        rstMensajeria: Record Mensajeria;
        frmCambioEst: Page "Cambiar estado documento";
        blnHabilitarRegistro: Boolean;
        ChangeExchangeRate: Page "Change Exchange Rate";
        blnEditable: Boolean;
        frmMatrizCotizProv: Page "Matriz cotización proveedores";
        decDif: Decimal;
        decImpoFC: Decimal;

    [Scope('OnPrem')]
    procedure fntRegistrar(rstSolicitud: Record Solicitud)
    var
        cduRegistro: Codeunit GestionSolicitudes;
    begin
        if Confirm('Desea aprobar y registrar esta solicitud?') then begin

            PunLins.Reset;
            PunLins.SetRange(PunLins."Nombre libro Solicitud", "Nombre Libro Solicitud");
            PunLins.SetRange("No. Documento", "No. documento");
            if PunLins.Find('-') then
                repeat

                    if (PunLins."No." = '') and (PunLins.Cantidad > 0) then begin

                        Error('Debe ingresar un código de producto en la línea %1', PunLins."No. linea");
                        Aprobado := false;

                    end;

                until PunLins.Next = 0;

            Clear(rstMensajeria);
            rstMensajeria.SetCurrentKey("No. documento");
            rstMensajeria.SetRange(rstMensajeria."No. documento", "No. documento");
            rstMensajeria.Find('-');

            frmCambioEst.fntBuscarMensajeria(rstMensajeria);
            frmCambioEst.funCambiarAEstado('Aprobado', '');
            if not frmCambioEst.funRecomendarCambioEstado then begin

                frmCambioEst.fntDisableRegister(true);
                frmCambioEst.SetTableView(rstMensajeria);
                frmCambioEst.Run;

            end;

            frmCambioEst.fntRegistrarCambioEstado;

            Clear(rstMensajeria);
            rstMensajeria.SetCurrentKey("No. documento");
            rstMensajeria.SetRange(rstMensajeria."No. documento", "No. documento");
            rstMensajeria.Find('-');

            frmCambioEst.fntBuscarMensajeria(rstMensajeria);
            frmCambioEst.funCambiarAEstado('Aprobado y registrado', '');
            if not frmCambioEst.funRecomendarCambioEstado then begin

                frmCambioEst.fntDisableRegister(true);
                frmCambioEst.SetTableView(rstMensajeria);
                frmCambioEst.Run;

            end;

            frmCambioEst.fntRegistrarCambioEstado;

            Clear(rstSolicitud);
            rstSolicitud.SetRange("No. documento", "No. documento");
            rstSolicitud.FindFirst;

            Clear(cduRegistro);
            cduRegistro.fntRegistroSolicitud(rstSolicitud, false);
            /*
            LinDem."Cantidad pendiente recibir" := linhoja.Cantidad;
            LinDem."Cantidad pendiente facturar" := linhoja.Cantidad;
            LinDem.Aprobado := TRUE;
            LinDem.Registrado := TRUE;
            LinDem.MODIFY;

            HistCabDem.RESET;
            HistCabDem.TRANSFERFIELDS(Rec);
            HistCabDem.INSERT;
            linhoja.RESET;
            linhoja.SETRANGE("Nombre libro Solicitud","Nombre Libro Solicitud");
            linhoja.SETRANGE("No. Documento","No. Documento");
            IF linhoja.FIND('-') THEN
            REPEAT

              IF linhoja.Tipo <> linhoja.Tipo::" " THEN
                linhoja.TESTFIELD("No.");
              HistLinDem.RESET;
              HistLinDem.TRANSFERFIELDS(linhoja);
              HistLinDem."Cantidad pendiente recibir" := linhoja.Cantidad;
              HistLinDem."Cantidad pendiente facturar" := linhoja.Cantidad;
              HistLinDem.Aprobado := TRUE;
              HistLinDem.INSERT;
              linhoja.DELETE;

            UNTIL linhoja.NEXT = 0;
            */
            if ConfUsu.Get(UserId) then begin
                //Actualizar fecha aprobación

                PunSeguimiento.Reset;
                PunSeguimiento.SetCurrentKey("Tipo movimiento", "Tipo Documento", Estado);
                PunSeguimiento.SetRange(PunSeguimiento."Tipo movimiento", PunSeguimiento."Tipo movimiento"::
                "Mensaje con Seguimiento");
                PunSeguimiento.SetRange("Tipo Documento", "Tipo documento");
                PunSeguimiento.SetRange(Estado, 'Aprobado y registrado');
                PunSeguimiento.SetRange("No. documento", "No. documento");
                if PunSeguimiento.Find('-') then begin

                    PunSeguimiento.Validate("Fecha aprobacion", "Fecha aprobacion");
                    PunSeguimiento.Modify;

                end;

            end;

            /*
              Rec.DELETE;

            */
            Message('Solicitud registrada');

        end
        else
            Message('El proceso ha sido abortado');

    end;

    [Scope('OnPrem')]
    procedure fntRechazar(rstSolicitud: Record Solicitud)
    begin
        if Confirm('Desea rechazar esta solicitud?') then begin

            Clear(rstMensajeria);
            rstMensajeria.SetCurrentKey("No. documento");
            rstMensajeria.SetRange(rstMensajeria."No. documento", "No. documento");
            rstMensajeria.Find('-');

            frmCambioEst.fntBuscarMensajeria(rstMensajeria);
            frmCambioEst.funCambiarAEstado('Rechazado', rstMensajeria.Remitente);
            frmCambioEst.fntRegistrarCambioEstado;

            LinDem."Cantidad pendiente recibir" := linhoja.Cantidad;
            LinDem."Cantidad pendiente facturar" := linhoja.Cantidad;
            LinDem.Aprobado := false;
            LinDem.Registrado := true;
            LinDem.Modify;

            /*
            HistCabDem.RESET;
            HistCabDem.TRANSFERFIELDS(Rec);
            HistCabDem.INSERT;
            linhoja.RESET;
            linhoja.SETRANGE("Nombre libro Solicitud","Nombre Libro Solicitud");
            linhoja.SETRANGE("No. Documento","No. Documento");
            IF linhoja.FIND('-') THEN
            REPEAT

              IF linhoja.Tipo <> linhoja.Tipo::" " THEN
                linhoja.TESTFIELD("No.");
              HistLinDem.RESET;
              HistLinDem.TRANSFERFIELDS(linhoja);
              HistLinDem."Cantidad pendiente recibir" := linhoja.Cantidad;
              HistLinDem."Cantidad pendiente facturar" := linhoja.Cantidad;
              HistLinDem.Aprobado := FALSE;
              HistLinDem.INSERT;
              linhoja.DELETE;

            UNTIL linhoja.NEXT = 0;

            Rec.DELETE;
            */
            Message('Solicitud rechazada');

        end
        else
            Message('El proceso ha sido abortado');

    end;
}

