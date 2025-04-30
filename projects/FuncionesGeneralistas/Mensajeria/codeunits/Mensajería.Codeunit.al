codeunit 50031 "Mensajería"
{

    trigger OnRun()
    begin
    end;

    var
        PunSegGrupo: Record "Seguimiento por grupo";
        rstSeguridad: Record Seguridad;
        rstSeguridadUsuario: Record "Seguridad por usuario";
        rstRelGrupo: Record "Relación seguridad";
        rstConfUsu: Record "User Setup";
        PunSeguimientoLin: Record "Seguimiento Documentos";
        CodeCorreo: Codeunit Mail;
        PunMensajeria: Record Mensajeria;
        chat_tmp: Record Mensajeria;
        chat_tmp2: Record Mensajeria;
        MensajeComp: Text[255];
        TipoMenu: Integer;
        TipoMenuAnt: Integer;
        VarSolici: Text[100];
        PunMEns: Record Mensajeria;
        VarSolicienCot: Text[100];
        VarMensaje: array[50] of Text[100];
        i: Integer;
        PunSeg: Record Mensajeria;
        VarPos: Integer;
        VarDocEstado: array[100, 100] of Text[100];
        PunRel: Record "Relación seguridad";
        rstCambioEstadoDesde: Record "Seguridad cambio estados";

    [Scope('OnPrem')]
    procedure RegistrarMensaje(Mensaje: Text[250]; Destinatario: Code[200]; Doc: Code[30]; Tipo: Text[40]; Estado: Text[50]; Fecha: Date; TipoMov: Option Mensaje,Seguimiento,"Mensaje con Seguimiento",Alerta,"Flujo documentos","Seguimiento flujo documentos"; Grupo: Code[200]; "1N": Code[20]; "2N": Code[20]; "3N": Code[20]; "4N": Code[20]; "5N": Code[20]; "6N": Code[1024]; "7N": Code[1024])
    var
        PunSeguridad: Record Seguridad;
        PunUsuario: Record User;
        PunRelacion: Record "Relación seguridad";
    begin
        //PunSeguimientoLin.LOCKTABLE;
        /*
        PunMensajeria.LOCKTABLE;
        chat_tmp.LOCKTABLE;
        chat_tmp2.LOCKTABLE;
        PunMEns.LOCKTABLE;
        PunSeg.LOCKTABLE;
        */

        case TipoMov of

            TipoMov::Mensaje:
                begin

                    EnviarMensaje(Mensaje, Destinatario, Doc, Tipo, Estado, Fecha, TipoMov, '',
                                  "1N", "2N", "3N", "4N", "5N", "6N", "7N");
                    EnviarCorreo(Mensaje, Destinatario, Doc, Tipo, Estado, Fecha, TipoMov, '',
                                 "1N", "2N", "3N", "4N", "5N", "6N", "7N");

                end;

            TipoMov::"Mensaje con Seguimiento":
                begin

                    EnviarMensaje(Mensaje, Grupo, Doc, Tipo, Estado, Fecha, TipoMov, '',
                    "1N", "2N", "3N", "4N", "5N", "6N", "7N");
                    InsertarSeguimiento(Mensaje, Destinatario, Doc, Tipo, Estado, Fecha, TipoMov, '', "1N", "2N", "3N", "4N", "5N", "6N", "7N");
                    EnviarCorreo(Mensaje, Destinatario, Doc, Tipo, Estado, Fecha, TipoMov, '',
                                 "1N", "2N", "3N", "4N", "5N", "6N", "7N");

                end;

            TipoMov::Seguimiento:
                begin

                    InsertarSeguimiento(Mensaje, Destinatario, Doc, Tipo, Estado, Fecha, TipoMov, '',
                    "1N", "2N", "3N", "4N", "5N", "6N", "7N");
                    EnviarCorreo(Mensaje, Destinatario, Doc, Tipo, Estado, Fecha, TipoMov, Grupo,
                                 "1N", "2N", "3N", "4N", "5N", "6N", "7N");

                end;

            TipoMov::Alerta:
                begin

                    RegistrarAlerta(Mensaje, Destinatario, Doc, Tipo, Estado, Fecha, TipoMov, '',
                    "1N", "2N", "3N", "4N", "5N", "6N", "7N");
                    EnviarCorreo(Mensaje, Destinatario, Doc, Tipo, Estado, Fecha, TipoMov, Grupo,
                                 "1N", "2N", "3N", "4N", "5N", "6N", "7N");

                end;

            TipoMov::"Flujo documentos":
                begin

                    EnviarMensaje(Mensaje, Grupo, Doc, Tipo, Estado, Fecha, TipoMov, '',
                    "1N", "2N", "3N", "4N", "5N", "6N", "7N");
                    InsertarSeguimientoFlujoDocs(Mensaje, Destinatario, Doc, Tipo, Estado, Fecha, TipoMov, Grupo, "1N", "2N", "3N", "4N", "5N", "6N", "7N");
                    EnviarCorreo(Mensaje, Destinatario, Doc, Tipo, Estado, Fecha, TipoMov, Grupo,
                                 "1N", "2N", "3N", "4N", "5N", "6N", "7N");

                end;

            TipoMov::"Seguimiento flujo documentos":
                begin

                    InsertarSeguimientoFlujoDocs(Mensaje, Destinatario, Doc, Tipo, Estado, Fecha, TipoMov, Grupo, "1N", "2N", "3N", "4N", "5N", "6N", "7N");
                    EnviarCorreo(Mensaje, Destinatario, Doc, Tipo, Estado, Fecha, TipoMov, Grupo,
                                 "1N", "2N", "3N", "4N", "5N", "6N", "7N");

                end;


        end;

    end;

    [Scope('OnPrem')]
    procedure EnviarMensaje(Mensaje: Text[250]; Destinatario: Code[200]; Doc: Code[30]; Tipo: Text[40]; Estado: Text[50]; Fecha: Date; TipoMov: Option Mensaje,Seguimiento,"Mensaje con Seguimiento",Alerta; Grupo: Code[20]; "1N": Code[20]; "2N": Code[20]; "3N": Code[20]; "4N": Code[20]; "5N": Code[20]; "6N": Code[1024]; "7N": Code[1024])
    var
        PunMens: Record Mensajeria;
        ConfUsu: Record "User Setup";
        frmNavegar: Page Navigate;
    begin
        Clear(rstConfUsu);
        rstConfUsu.Get(UserId);
        if chat_tmp2.Find('+') then;
        chat_tmp."No. Linea" := chat_tmp2."No. Linea" + 1;
        chat_tmp."Destinatario/Grupo" := Destinatario;
        chat_tmp.Asunto := Mensaje;
        chat_tmp."Tipo movimiento" := TipoMov;
        if chat_tmp."Tipo movimiento" in [chat_tmp."Tipo movimiento"::Mensaje, chat_tmp."Tipo movimiento"::Seguimiento] then begin

            chat_tmp.Remitente := UserId;
            PunMens.Reset;
            PunMens.SetCurrentKey(PunMens."Tipo movimiento", "Tipo Documento", "No. documento");
            PunMens.SetRange(PunMens."Tipo movimiento", PunMens."Tipo movimiento"::"Mensaje con Seguimiento");
            PunMens.SetRange("Tipo Documento", Tipo);
            PunMens.SetRange("No. documento", Doc);
            if PunMens.Find('+') then begin

                ConfUsu.Reset;
                ConfUsu.Get(UserId);
                PunMens."Destinatario/Grupo" := ConfUsu.Grupo;
                PunMens.Modify;

            end;

        end
        else begin

            if chat_tmp."Tipo movimiento" in [chat_tmp."Tipo movimiento"::"Flujo documentos",
                                             chat_tmp."Tipo movimiento"::"Mensaje con Seguimiento"] then
                chat_tmp.Remitente := rstConfUsu.Grupo;

        end;

        chat_tmp.Fecha := Fecha;
        chat_tmp.Hora := Time;
        chat_tmp."Tipo Documento" := Tipo;
        chat_tmp."No. documento" := Doc;
        chat_tmp.Estado := Estado;
        chat_tmp."1er Nivel" := "1N";
        chat_tmp."2er Nivel" := "2N";
        chat_tmp."No. Mensaje" := "3N";
        chat_tmp.Subdepartamento := "4N";
        chat_tmp."5to Nivel" := "5N";
        chat_tmp."6to Nivel" := "6N";
        if "7N" <> '' then begin

            chat_tmp.Hipervinculo := "7N";
            chat_tmp."Tipo documento digital" := frmNavegar.funTextoCampo(chat_tmp.Hipervinculo, '_N1_');
            Evaluate(chat_tmp."Fecha digitalizacion", frmNavegar.funTextoCampo(chat_tmp.Hipervinculo, '_N2_'));
            chat_tmp.Departamento := frmNavegar.funTextoCampo(chat_tmp.Hipervinculo, '_N3_');
            chat_tmp."Codigo vinculante" := frmNavegar.funTextoCampo(chat_tmp.Hipervinculo, '_N4_');
            chat_tmp.Validate(Usuario, DelChr(frmNavegar.funTextoCampo(chat_tmp.Hipervinculo, '_N5_'), '=', '!'));

        end;

        if chat_tmp.Usuario = '' then
            chat_tmp.Validate(Usuario, UserId);

        chat_tmp.Insert;
    end;

    [Scope('OnPrem')]
    procedure InsertarSeguimiento(Mensaje: Text[250]; Destinatario: Code[200]; Doc: Code[30]; Tipo: Text[40]; Estado: Text[50]; Fecha: Date; TipoMov: Option Mensaje,Seguimiento,"Mensaje con Seguimiento",Alerta; Grupo: Code[20]; "1N": Code[20]; "2N": Code[20]; "3N": Code[20]; "4N": Code[20]; "5N": Code[20]; "6N": Code[1024]; "7N": Code[1024])
    var
        PunSeguimiento: Record "Seguimiento Documentos";
        rstGruDocEst: Record "Seguimiento por grupo";
    begin
        rstRelGrupo.Reset;
        rstRelGrupo.SetRange("Grupo Origen", Grupo);
        if rstRelGrupo.Find('-') then
            repeat

                rstConfUsu.Reset;
                rstConfUsu.SetRange(rstConfUsu.Grupo, rstRelGrupo."Grupo Destino");

                if rstConfUsu.Find('-') then
                    repeat

                        Mensaje := 'El estado del documento No. ' + Format(Doc) + ' ha cambiado a ' + Estado;
                        EnviarMensaje(Mensaje, rstConfUsu."User ID", Doc, Tipo, Estado, Fecha, TipoMov::Seguimiento, '',
                                      "1N", "2N", "3N", "4N", "5N", "6N", "7N");

                    until rstConfUsu.Next = 0;

            until rstRelGrupo.Next = 0;

        chat_tmp.Reset;
        chat_tmp.SetCurrentKey(chat_tmp."Tipo Documento", chat_tmp."No. documento");
        chat_tmp.SetRange(chat_tmp."Tipo Documento", Tipo);
        chat_tmp.SetFilter("No. documento", '%1&<>%2', Doc, '');
        if Estado <> '' then
            chat_tmp.ModifyAll(Estado, Estado);
        rstConfUsu.Get(UserId);
        if rstConfUsu.Grupo <> '' then
            chat_tmp.ModifyAll(chat_tmp."Destinatario/Grupo", rstConfUsu.Grupo);

        PunSeguimiento.Reset;
        PunSeguimientoLin.Reset;
        PunSeguimientoLin.SetCurrentKey("Line No.");
        if PunSeguimientoLin.Find('+') then
            PunSeguimiento."Line No." := PunSeguimientoLin."Line No." + 1
        else
            PunSeguimiento."Line No." := 1;

        PunSeguimiento."No. documento" := Doc;
        PunSeguimiento."Tipo Documento" := Tipo;
        PunSeguimiento.Fecha := Today;
        PunSeguimiento.Hora := Time;
        PunSeguimiento.Estado := Estado;
        if Destinatario <> '' then
            PunSeguimiento.Usuario := Destinatario
        else
            PunSeguimiento.Usuario := UserId;
        PunSeguimiento.Mensaje := 'El estado del documento No. ' + Format(Doc) + ' ha cambiado a ' + Estado;
        PunSeguimiento."Global Dimension 1" := "1N";
        PunSeguimiento."Global Dimension 2" := Grupo;
        PunSeguimiento."Global Dimension 3" := "3N";
        PunSeguimiento."Global Dimension 4" := "4N";
        PunSeguimiento."Global Dimension 5" := "5N";
        PunSeguimiento."Global Dimension 6" := "6N";
        PunSeguimiento."Global Dimension 7" := "7N";
        PunSeguimiento.Insert;

        /*CLEAR(rstGruDocEst);
        IF rstGruDocEst.GET(PunSeguimiento."2º Nivel",PunSeguimiento."Tipo Documento",PunSeguimiento.Estado) THEN
        BEGIN
        
          IF rstGruDocEst."Enviar correo" THEN
            EnviarCorreo(Mensaje,PunSeguimiento.Usuario,Doc,Tipo,Estado,Fecha,TipoMov,'',
                         "1N","2N","3N","4N","5N","6N","7N");
        
        END;
         */

    end;

    [Scope('OnPrem')]
    procedure ComponerMensaje(Mensaje: Code[30]) MensajeCompleto: Text[255]
    var
        PunDetalle: Record "Detalle mensajería";
    begin
        MensajeCompleto := '';
        PunDetalle.SetRange("No. mensaje", Mensaje);
        if PunDetalle.Find('-') then begin

            MensajeComp := PunDetalle.Mensaje;
            if PunDetalle.Next > 0 then
                repeat

                    MensajeComp := MensajeComp + '\' + PunDetalle.Mensaje;

                until PunDetalle.Next = 0;

        end;

        exit(MensajeComp);
    end;

    [Scope('OnPrem')]
    procedure FunVencidas()
    var
        PunHisCabComp: Record "Vendor Ledger Entry";
        CodeMens: Codeunit "Mensajería";
        PunHisCabComp2: Record "Purch. Inv. Header";
    begin
        //IBdos Argentina - USS - 150503 - Inicio Modificación Arbumasa
        //Actualización del estado para facturas de compra vencidas
        rstConfUsu.Reset;
        rstConfUsu.Get(UserId);
        Clear(rstSeguridad);
        Clear(rstSeguridadUsuario);

        if rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Facturas vencidas")) then begin

            PunHisCabComp.Reset;
            PunHisCabComp.SetCurrentKey(Open, "Due Date");
            PunHisCabComp.SetRange(Open, true);
            PunHisCabComp.SetRange(PunHisCabComp."Due Date", 0D, CalcDate('+1D', Today));
            PunHisCabComp.SetRange("Document Type", PunHisCabComp."Document Type"::Invoice);
            if PunHisCabComp.Find('-') then
                repeat

                    PunHisCabComp2.Reset;
                    PunHisCabComp2.SetCurrentKey("Pre-Assigned No.");
                    PunHisCabComp2.SetRange(PunHisCabComp2."No.", PunHisCabComp."Document No.");
                    if PunHisCabComp2.Find('-') then;

                    PunSeg.Reset;
                    PunSeg.SetCurrentKey("Tipo movimiento", "Tipo Documento", Estado);
                    PunSeg.SetRange("Tipo movimiento", PunSeg."Tipo movimiento"::"Mensaje con Seguimiento");
                    PunSeg.SetRange("No. documento", PunHisCabComp2."Pre-Assigned No.");
                    PunSeg.SetRange(PunSeg."Tipo Documento", 'Factura (compras)');
                    PunSeg.SetRange(PunSeg.Estado, '<>%1', 'Vencida');
                    if PunSeg.Find('-') then
                        CodeMens.RegistrarMensaje('', '', PunHisCabComp2."Pre-Assigned No.", 'Factura (compras)', 'Vencida', Today,
                        PunSeg."Tipo movimiento"::Seguimiento, rstConfUsu.Grupo, '', '', '', '', '', '', '');

                until PunHisCabComp.Next = 0;

        end;

        //IBdos Argentina - USS - 150503 - Fin Modificación Arbumasa
    end;

    [Scope('OnPrem')]
    procedure RegistrarAlerta(Mensaje: Text[250]; Destinatario: Code[200]; Doc: Code[30]; Tipo: Text[40]; Estado: Text[50]; Fecha: Date; TipoMov: Option Mensaje,Seguimiento,"Mensaje con Seguimiento",Alerta; Grupo: Code[20]; "1N": Code[20]; "2N": Code[20]; "3N": Code[20]; "4N": Code[20]; "5N": Code[20]; "6N": Code[1024]; "7N": Code[1024])
    var
        PunSeguimiento: Record "Seguimiento Documentos";
        frmNavegar: Page Navigate;
    begin
        Clear(chat_tmp2);
        if chat_tmp2.Find('+') then;
        chat_tmp.SetCurrentKey("Tipo Documento", "No. documento", "Tipo movimiento");
        chat_tmp.SetRange("Tipo Documento", Tipo);
        chat_tmp.SetRange("No. documento", Doc);
        chat_tmp.SetRange("Tipo movimiento", chat_tmp."Tipo movimiento"::Alerta);
        chat_tmp.SetRange(chat_tmp."Destinatario/Grupo", Destinatario);
        if chat_tmp.Find('-') then begin

            if chat_tmp.Recibido then
                chat_tmp.Recibido := false
            else
                chat_tmp.Recibido := true;
            chat_tmp.Modify;

        end
        else begin

            chat_tmp."No. Linea" := chat_tmp2."No. Linea" + 1;
            chat_tmp.Fecha := Fecha;
            chat_tmp.Hora := Time;
            chat_tmp."Destinatario/Grupo" := Destinatario;
            chat_tmp."Tipo movimiento" := TipoMov;
            chat_tmp."Tipo Documento" := Tipo;
            chat_tmp."No. documento" := Doc;
            chat_tmp.Estado := Estado;
            chat_tmp."1er Nivel" := "1N";
            chat_tmp."2er Nivel" := "2N";
            chat_tmp."No. Mensaje" := "3N";
            chat_tmp.Subdepartamento := "4N";
            chat_tmp."5to Nivel" := "5N";
            chat_tmp."6to Nivel" := "6N";
            if "7N" <> '' then begin

                chat_tmp.Hipervinculo := "7N";
                chat_tmp."Tipo documento digital" := frmNavegar.funTextoCampo(chat_tmp.Hipervinculo, '_N1_');
                Evaluate(chat_tmp."Fecha digitalizacion", frmNavegar.funTextoCampo(chat_tmp.Hipervinculo, '_N2_'));
                chat_tmp.Departamento := frmNavegar.funTextoCampo(chat_tmp.Hipervinculo, '_N3_');
                chat_tmp."Codigo vinculante" := frmNavegar.funTextoCampo(chat_tmp.Hipervinculo, '_N4_');
                chat_tmp.Validate(Usuario, frmNavegar.funTextoCampo(chat_tmp.Hipervinculo, '_N5_'));

            end;

            chat_tmp.Insert;

        end;
    end;

    [Scope('OnPrem')]
    procedure EnviarCorreo(Mensaje: Text[250]; Destinatario: Code[200]; Doc: Code[30]; Tipo: Text[40]; Estado: Text[50]; Fecha: Date; TipoMov: Option Mensaje,Seguimiento,"Mensaje con Seguimiento",Alerta; Grupo: Code[20]; "1N": Code[20]; "2N": Code[20]; "3N": Code[20]; "4N": Code[20]; "5N": Code[20]; "6N": Code[1024]; "7N": Code[1024])
    var
        rstSeguridadCambiosEstado: Record "Seguridad cambio estados";
        cduCorreo: Codeunit "Email Message";
        rstMensajeria: Record Mensajeria;
        rstConfUsu: Record "User Setup";
        l_varMensaje: array[50] of Text[100];
        l_varDocEstado: array[100, 100] of Text[100];
        strMensaje: Text[1024];
        strTema: Text[1024];
        rstInfoEmpresa: Record "Company Information";
        rstRutas: Record "Ruta digitalizacion depto/espe";
        rstNivelesxDoc: Record "Específicos por ruta";
        rstDetalleMensajeria: Record "Detalle mensajería";
        i: Integer;
        punCompras: Record "Purchase Header";
        frmCompras: Page "Purchase Invoice";
        frmHFCompras: Page "Posted Purchase Invoice";
        frmHNCompras: Page "Posted Purchase Credit Memo";
        cduOutlook: Codeunit Mail;
        strHipervinculoNavision: Text;
        strHipervinculoPDF: Text;
        cr: Char;
        lf: Char;
        rstSolicitud: Record Solicitud;
        frmSolicitud: Page Solicitud;
        rptSolicitud: Report "Solicitud Provisoria";
        dlgDialogo: Dialog;
        k: Integer;
        rstSegPorUsuario: Record "Seguridad por usuario";
        rstVendor: Record Vendor;
        cduFM: Codeunit "File Management";
        strPathAdjunto: Text;
        rstMailServ: Record "Service Email Queue";
        s: Integer;
        punHFCompras: Record "Purch. Inv. Header";
        punHNCompras: Record "Purch. Cr. Memo Hdr.";
        lt_SendTo: text;
        is_Attachment: InStream;
        os_OutStream: OutStream;
        cduTempBlob: Codeunit "Temp Blob";
        strArchivo: Text;
        Base64: codeunit "Base64 Convert";
    begin
        Clear(rstInfoEmpresa);
        rstInfoEmpresa.Get();

        Clear(rstMensajeria);
        rstMensajeria.SetCurrentKey(rstMensajeria."Tipo Documento", rstMensajeria."No. documento");
        rstMensajeria.SetRange("Tipo Documento", Tipo);
        rstMensajeria.SetRange("No. documento", Doc);
        if rstMensajeria.Find('-') then begin

            if rstCambioEstadoDesde."Estado destino" = '' then begin

                Clear(rstSeguridadCambiosEstado);
                rstSeguridadCambiosEstado.SetCurrentKey(rstSeguridadCambiosEstado.Usuario, rstSeguridadCambiosEstado."Tipo documento",
                                                        rstSeguridadCambiosEstado."Estado destino", rstSeguridadCambiosEstado."Grupo destino");
                rstSeguridadCambiosEstado.SetRange(rstSeguridadCambiosEstado.Usuario, UserId);
                rstSeguridadCambiosEstado.SetRange("Tipo documento", rstMensajeria."Tipo Documento");
                rstSeguridadCambiosEstado.SetRange("Estado destino", Estado);
                rstSeguridadCambiosEstado.SetRange("Enviar correo", true);
                //rstSeguridadCambiosEstado.SETFILTER("Grupo destino",'%1|%2',Grupo,'');

            end
            else begin

                Clear(rstSeguridadCambiosEstado);
                rstSeguridadCambiosEstado.SetCurrentKey(rstSeguridadCambiosEstado.Usuario, rstSeguridadCambiosEstado."Tipo documento",
                                                        rstSeguridadCambiosEstado."Estado destino", rstSeguridadCambiosEstado."Grupo destino");
                rstSeguridadCambiosEstado.SetRange(rstSeguridadCambiosEstado.Usuario, UserId);
                rstSeguridadCambiosEstado.SetRange("Tipo documento", rstMensajeria."Tipo Documento");
                rstSeguridadCambiosEstado.SetRange("Estado original", rstCambioEstadoDesde."Estado original");
                rstSeguridadCambiosEstado.SetRange("Estado destino", rstCambioEstadoDesde."Estado destino");
                rstSeguridadCambiosEstado.SetRange("Enviar correo", true);
                //rstSeguridadCambiosEstado.SETFILTER("Grupo destino",'%1|%2',Grupo,'');
                rstSeguridadCambiosEstado.SetRange("Grupo destino", rstCambioEstadoDesde."Grupo destino");

            end;

            if rstSeguridadCambiosEstado.Find('-') then
                repeat

                    if (rstSeguridadCambiosEstado."Enviar correo") then begin

                        Clear(rstSegPorUsuario);
                        rstSegPorUsuario.SetRange(Grupo, rstSeguridadCambiosEstado."Grupo destino");
                        rstSegPorUsuario.SetRange("Mostrar documentación", true);
                        k := rstSegPorUsuario.Count;

                        if k <> 0 then begin

                            Clear(dlgDialogo);
                            dlgDialogo.Open('Enviando #1# notificaciones');
                            dlgDialogo.Update(1, k);
                            lt_SendTo := '';
                            cduCorreo.Create(lt_SendTo, 'Navision', 'Nuevo documento ' + Doc);

                            strMensaje := '';
                            strTema := '';
                            strTema := 'El usuario ' + UserId + ' ha ' + Estado + ' el documento ' + Doc + ' tipo ' + Tipo;
                            cr := 13;
                            lf := 10;

                            if Tipo in ['Factura (compras)', 'Fact. pronto venc. (compras)', 'Factura interna (compras)', 'Nota crédito (compras)', 'Nota crédito interna (compras)',
                            'Nota débito (compras)'] then begin

                                Clear(punCompras);
                                punCompras.SetRange("No.", Doc);
                                if punCompras.Find('-') then begin

                                    Clear(frmCompras);
                                    frmCompras.GetRecord(punCompras);

                                    Clear(rstVendor);
                                    if rstVendor.Get(rstMensajeria."Codigo vinculante") then;

                                    Clear(rstInfoEmpresa);
                                    rstInfoEmpresa.Get();

                                    strHipervinculoNavision := GetUrl(CurrentClientType, CompanyName, OBJECTTYPE::Page, 51, punCompras);
                                    strHipervinculoPDF := rstInfoEmpresa."Ruta Intranet" + '\' + (ConvertStr(CopyStr(rstMensajeria.Hipervinculo, 41, 250), '\', '/'));

                                    if rstMensajeria."Tipo documento digital" <> '' then begin

                                        cduCorreo.AppendToBody('Datos del documento:');
                                        cduCorreo.AppendToBody(Format(lf) + Format(cr));
                                        cduCorreo.AppendToBody('   -' + rstMensajeria.FieldCaption(rstMensajeria."Tipo documento digital") + ': ' + rstMensajeria."Tipo documento digital");
                                        cduCorreo.AppendToBody(Format(lf) + Format(cr));
                                        cduCorreo.AppendToBody('   -' + rstMensajeria.FieldCaption(rstMensajeria."Fecha digitalizacion") + ': ' + Format(rstMensajeria."Fecha digitalizacion"));
                                        cduCorreo.AppendToBody(Format(lf) + Format(cr));
                                        cduCorreo.AppendToBody('   -' + rstMensajeria.FieldCaption(rstMensajeria.Departamento) + ': ' + rstMensajeria.Departamento);
                                        cduCorreo.AppendToBody(Format(lf) + Format(cr));
                                        cduCorreo.AppendToBody('   -' + rstMensajeria.FieldCaption(rstMensajeria."Codigo vinculante") + ': ' + rstMensajeria."Codigo vinculante" + ' - ' + rstVendor.Name);
                                        cduCorreo.AppendToBody(Format(lf) + Format(cr));
                                        cduCorreo.AppendToBody('   -' + rstMensajeria.FieldCaption(rstMensajeria."No. documento") + ': ' + rstMensajeria."No. documento");
                                        cduCorreo.AppendToBody(Format(lf) + Format(cr));
                                        cduCorreo.AppendToBody('   -' + rstMensajeria.FieldCaption(rstMensajeria.Detalle) + ': ' + rstMensajeria.Detalle);
                                        cduCorreo.AppendToBody(Format(lf) + Format(cr));

                                        Clear(cduFM);
                                        cleaR(is_Attachment);
                                        cleaR(cduTempBlob);

                                        cduTempBlob.CreateInStream(is_Attachment);
                                        fntAddAttachment(is_Attachment, cduFM.GetFileName(rstMensajeria.Hipervinculo));
                                        is_Attachment.ReadText(strArchivo);
                                        cduCorreo.AddAttachment(strArchivo, 'application/pdf', Base64.ToBase64(strArchivo));

                                    end;

                                end;

                            end;

                            Clear(punHFCompras);
                            punHFCompras.SetRange("No.", Doc);
                            if punHFCompras.Find('-') then begin

                                Clear(frmHFCompras);
                                frmHFCompras.GetRecord(punHFCompras);

                                Clear(rstVendor);
                                if rstVendor.Get(rstMensajeria."Codigo vinculante") then;

                                Clear(rstInfoEmpresa);
                                rstInfoEmpresa.Get();

                                strHipervinculoNavision := GetUrl(CurrentClientType, CompanyName, OBJECTTYPE::Page, 138, punHFCompras);
                                strHipervinculoPDF := rstInfoEmpresa."Ruta Intranet" + '\' + (ConvertStr(CopyStr(rstMensajeria.Hipervinculo, 41, 250), '\', '/'));

                                if rstMensajeria."Tipo documento digital" <> '' then begin

                                    cduCorreo.AppendToBody('Datos del documento:');
                                    cduCorreo.AppendToBody(Format(lf) + Format(cr));
                                    cduCorreo.AppendToBody('   -' + rstMensajeria.FieldCaption(rstMensajeria."Tipo documento digital") + ': ' + rstMensajeria."Tipo documento digital");
                                    cduCorreo.AppendToBody(Format(lf) + Format(cr));
                                    cduCorreo.AppendToBody('   -' + rstMensajeria.FieldCaption(rstMensajeria."Fecha digitalizacion") + ': ' + Format(rstMensajeria."Fecha digitalizacion"));
                                    cduCorreo.AppendToBody(Format(lf) + Format(cr));
                                    cduCorreo.AppendToBody('   -' + rstMensajeria.FieldCaption(rstMensajeria.Departamento) + ': ' + rstMensajeria.Departamento);
                                    cduCorreo.AppendToBody(Format(lf) + Format(cr));
                                    cduCorreo.AppendToBody('   -' + rstMensajeria.FieldCaption(rstMensajeria."Codigo vinculante") + ': ' + rstMensajeria."Codigo vinculante" + ' - ' + rstVendor.Name);
                                    cduCorreo.AppendToBody(Format(lf) + Format(cr));
                                    cduCorreo.AppendToBody('   -' + rstMensajeria.FieldCaption(rstMensajeria."No. documento") + ': ' + rstMensajeria."No. documento");
                                    cduCorreo.AppendToBody(Format(lf) + Format(cr));
                                    cduCorreo.AppendToBody('   -' + rstMensajeria.FieldCaption(rstMensajeria.Detalle) + ': ' + rstMensajeria.Detalle);
                                    cduCorreo.AppendToBody(Format(lf) + Format(cr));

                                    Clear(cduFM);
                                    if cduFM.IsValidFileName(rstMensajeria.Hipervinculo) then begin
                                        Clear(cduFM);
                                        cleaR(is_Attachment);
                                        cleaR(cduTempBlob);

                                        cduTempBlob.CreateInStream(is_Attachment);
                                        fntAddAttachment(is_Attachment, cduFM.GetFileName(rstMensajeria.Hipervinculo));
                                        is_Attachment.ReadText(strArchivo);
                                        cduCorreo.AddAttachment(strArchivo, 'application/pdf', Base64.ToBase64(strArchivo));
                                    end;

                                end;

                            end;

                            Clear(punHNCompras);
                            punHNCompras.SetRange("No.", Doc);
                            if punHNCompras.Find('-') then begin

                                Clear(frmHNCompras);
                                frmHNCompras.GetRecord(punHNCompras);

                                Clear(rstVendor);
                                if rstVendor.Get(rstMensajeria."Codigo vinculante") then;

                                Clear(rstInfoEmpresa);
                                rstInfoEmpresa.Get();

                                strHipervinculoNavision := GetUrl(CurrentClientType, CompanyName, OBJECTTYPE::Page, 140, punHNCompras);
                                strHipervinculoPDF := rstInfoEmpresa."Ruta Intranet" + '\' + (ConvertStr(CopyStr(rstMensajeria.Hipervinculo, 41, 250), '\', '/'));

                                if rstMensajeria."Tipo documento digital" <> '' then begin

                                    cduCorreo.AppendToBody('Datos del documento:');
                                    cduCorreo.AppendToBody(Format(lf) + Format(cr));
                                    cduCorreo.AppendToBody('   -' + rstMensajeria.FieldCaption(rstMensajeria."Tipo documento digital") + ': ' + rstMensajeria."Tipo documento digital");
                                    cduCorreo.AppendToBody(Format(lf) + Format(cr));
                                    cduCorreo.AppendToBody('   -' + rstMensajeria.FieldCaption(rstMensajeria."Fecha digitalizacion") + ': ' + Format(rstMensajeria."Fecha digitalizacion"));
                                    cduCorreo.AppendToBody(Format(lf) + Format(cr));
                                    cduCorreo.AppendToBody('   -' + rstMensajeria.FieldCaption(rstMensajeria.Departamento) + ': ' + rstMensajeria.Departamento);
                                    cduCorreo.AppendToBody(Format(lf) + Format(cr));
                                    cduCorreo.AppendToBody('   -' + rstMensajeria.FieldCaption(rstMensajeria."Codigo vinculante") + ': ' + rstMensajeria."Codigo vinculante" + ' - ' + rstVendor.Name);
                                    cduCorreo.AppendToBody(Format(lf) + Format(cr));
                                    cduCorreo.AppendToBody('   -' + rstMensajeria.FieldCaption(rstMensajeria."No. documento") + ': ' + rstMensajeria."No. documento");
                                    cduCorreo.AppendToBody(Format(lf) + Format(cr));
                                    cduCorreo.AppendToBody('   -' + rstMensajeria.FieldCaption(rstMensajeria.Detalle) + ': ' + rstMensajeria.Detalle);
                                    cduCorreo.AppendToBody(Format(lf) + Format(cr));

                                    Clear(cduFM);
                                    if cduFM.IsValidFileName(rstMensajeria.Hipervinculo) then begin

                                        Clear(cduFM);
                                        cleaR(is_Attachment);
                                        cleaR(cduTempBlob);

                                        cduTempBlob.CreateInStream(is_Attachment);
                                        fntAddAttachment(is_Attachment, cduFM.GetFileName(rstMensajeria.Hipervinculo));
                                        is_Attachment.ReadText(strArchivo);
                                        cduCorreo.AddAttachment(strArchivo, 'application/pdf', Base64.ToBase64(strArchivo));

                                    end;

                                end;

                            end;

                            cduCorreo.AppendToBody('Para acceder al archivo digital: ' + strHipervinculoPDF);
                            cduCorreo.AppendToBody(Format(lf) + Format(cr));
                            cduCorreo.AppendToBody('Para acceder al documento: ' + strHipervinculoNavision);


                        end;

                        if Tipo in ['Solicitud (compras)', 'Solicitud abierta (compras)'] then begin

                            Clear(rstSolicitud);
                            rstSolicitud.SetRange(rstSolicitud."No. documento", rstMensajeria."No. documento");
                            if rstSolicitud.Find('-') then begin

                                Clear(rstInfoEmpresa);
                                rstInfoEmpresa.Get();

                                cduCorreo.AppendToBody('Datos del documento:');
                                cduCorreo.AppendToBody(Format(lf) + Format(cr));
                                cduCorreo.AppendToBody('   -' + rstSolicitud.FieldCaption(rstSolicitud."No. documento") + ': ' + rstSolicitud."No. documento");
                                cduCorreo.AppendToBody(Format(lf) + Format(cr));
                                cduCorreo.AppendToBody('   -' + rstSolicitud.FieldCaption(rstSolicitud.Descripción) + ': ' + rstSolicitud.Descripción);
                                cduCorreo.AppendToBody(Format(lf) + Format(cr));
                                cduCorreo.AppendToBody('   -' + rstSolicitud.FieldCaption(rstSolicitud."Fecha registro") + ': ' + Format(rstSolicitud."Fecha registro"));
                                cduCorreo.AppendToBody(Format(lf) + Format(cr));
                                cduCorreo.AppendToBody('   -' + rstSolicitud.FieldCaption(rstSolicitud."Global Dimension 1") + ': ' + rstSolicitud."Global Dimension 1");
                                cduCorreo.AppendToBody(Format(lf) + Format(cr));
                                cduCorreo.AppendToBody('   -' + rstSolicitud.FieldCaption(rstSolicitud."Global Dimension 3") + ': ' + rstSolicitud."Global Dimension 3");
                                cduCorreo.AppendToBody(Format(lf) + Format(cr));

                                strHipervinculoNavision := GetUrl(CurrentClientType, CompanyName, OBJECTTYPE::Page, 50512, rstSolicitud);
                                if rstMensajeria.Hipervinculo <> '' then
                                    strHipervinculoPDF := rstInfoEmpresa."Ruta Intranet" + '\' + (ConvertStr(CopyStr(rstMensajeria.Hipervinculo, 41, 250), '\', '/'));

                                Clear(rptSolicitud);
                                rptSolicitud.SetTableView(rstSolicitud);
                                rptSolicitud.SaveAsPdf(TemporaryPath + rstSolicitud."No. documento" + '.pdf');

                                clear(cduFM);
                                cleaR(is_Attachment);
                                cleaR(cduTempBlob);

                                cduTempBlob.CreateInStream(is_Attachment);
                                fntAddAttachment(is_Attachment, TemporaryPath + rstSolicitud."No. documento" + '.pdf');
                                is_Attachment.ReadText(strArchivo);
                                cduCorreo.AddAttachment(strArchivo, 'application/pdf', Base64.ToBase64(strArchivo));

                            end;

                            cduCorreo.AppendToBody(Format(lf) + Format(cr));
                            cduCorreo.AppendToBody('Para acceder al archivo digital: ' + strHipervinculoPDF);
                            cduCorreo.AppendToBody(Format(lf) + Format(cr));

                        end;

                        dlgDialogo.Close;

                    end;

                until rstSeguridadCambiosEstado.Next = 0;

        end;
    end;

    [Scope('OnPrem')]
    procedure InsertarSeguimientoFlujoDocs(Mensaje: Text[250]; Destinatario: Code[200]; Doc: Code[30]; Tipo: Text[40]; Estado: Text[50]; Fecha: Date; TipoMov: Option Mensaje,Seguimiento,"Mensaje con Seguimiento",Alerta; Grupo: Code[20]; "1N": Code[20]; "2N": Code[20]; "3N": Code[20]; "4N": Code[20]; "5N": Code[20]; "6N": Code[1024]; "7N": Code[1024])
    var
        PunSeguimiento: Record "Seguimiento Documentos";
        rstGruDocEst: Record "Seguimiento por grupo";
    begin
        rstConfUsu.Get(UserId);

        chat_tmp.Reset;
        chat_tmp.SetCurrentKey(chat_tmp."Tipo Documento", chat_tmp."No. documento");
        chat_tmp.SetRange(chat_tmp."Tipo Documento", Tipo);
        chat_tmp.SetFilter("No. documento", '%1&<>%2', Doc, '');
        if Estado <> '' then
            chat_tmp.ModifyAll(Estado, Estado);

        if Grupo <> '' then begin

            chat_tmp.ModifyAll(chat_tmp."Destinatario/Grupo", Grupo);
            chat_tmp.ModifyAll(chat_tmp.Remitente, rstConfUsu.Grupo);

        end
        else begin

            if rstConfUsu.Grupo <> '' then
                chat_tmp.ModifyAll(chat_tmp."Destinatario/Grupo", rstConfUsu.Grupo);

        end;

        PunSeguimiento.Reset;
        PunSeguimientoLin.Reset;
        PunSeguimientoLin.SetCurrentKey("Line No.");
        if PunSeguimientoLin.Find('+') then
            PunSeguimiento."Line No." := PunSeguimientoLin."Line No." + 1
        else
            PunSeguimiento."Line No." := 1;

        PunSeguimiento."No. documento" := Doc;
        PunSeguimiento."Tipo Documento" := Tipo;
        PunSeguimiento.Fecha := Today;
        PunSeguimiento.Hora := Time;
        PunSeguimiento.Estado := Estado;
        if Destinatario <> '' then
            PunSeguimiento.Usuario := Destinatario
        else
            PunSeguimiento.Usuario := UserId;
        PunSeguimiento.Mensaje := 'El estado del documento No. ' + Format(Doc) + ' ha cambiado a ' + Estado;
        PunSeguimiento."Global Dimension 2" := Grupo;
        PunSeguimiento.Insert;
        /*
      CLEAR(rstGruDocEst);
      IF rstGruDocEst.GET(PunSeguimiento."2º Nivel",PunSeguimiento."Tipo Documento",PunSeguimiento.Estado) THEN
      BEGIN

        IF rstGruDocEst."Enviar correo" THEN
          EnviarCorreo(Mensaje,PunSeguimiento.Usuario,Doc,Tipo,Estado,Fecha,TipoMov,'',
                       "1N","2N","3N","4N","5N","6N","7N");

      END;
             */

    end;

    [Scope('OnPrem')]
    procedure fntParametrizarCambioEstado(l_rstCambioEstadoDesde: Record "Seguridad cambio estados")
    begin
        rstCambioEstadoDesde := l_rstCambioEstadoDesde;
    end;

    procedure fntAddAttachment(var AttachmentStream: InStream; AttachmentName: Text)
    var
        TempBlob: Codeunit "Temp Blob";
        osOutStream: OutStream;
    begin
        if AttachmentStream.EOS() then
            exit;
        TempBlob.CreateOutStream(osOutStream);
        CopyStream(osOutStream, AttachmentStream);
    end;

}

