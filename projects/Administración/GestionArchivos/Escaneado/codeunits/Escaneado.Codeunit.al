codeunit 50503 Escaneado
{

    trigger OnRun()
    begin
    end;

    var
        strArchivoGenerado: Code[250];
        dlgEscaneando: Dialog;
        rstDocumentosDigitalizados: Record "Documentos digitalizados";
        l_strNivel1: Code[30];
        l_strNivel2: Code[30];
        l_strNivel3: Code[30];
        l_strNivel4: Code[30];
        l_strNivel5: Code[30];
        l_strNivel6: Code[30];
        l_strNivel7: Code[30];
        l_strNivel8: Code[30];
        l_strNivel9: Code[30];
        l_strNivel10: Code[30];
        l_strNivel11: Code[30];
        codDocumento: Code[30];
        strArchivo_pre: Text[1024];
        blnFB: Boolean;
        l_rstGLS: Record "General Ledger Setup";
        cduFileManagement: Codeunit "File Management";

    [Scope('OnPrem')]
    procedure "**DIGITALIZACION**"()
    begin
    end;

    [Scope('OnPrem')]
    procedure ImportarDocumento(strTipoDocumento: Code[30]; strFechaDigitalizacion: Code[30]; strDepartamento: Code[30]; strCodigoVinculante: Code[30]; strUsuario: Code[30]; strNivel6: Code[30]; strNivel7: Code[30]; strNivel8: Code[30]; strNivel9: Code[30]; strNivel10: Code[30]; strNivel11: Code[30]; rstRutaDigitalizado: Record "Ruta digitalizacion depto/espe"; blnEscanear: Boolean; blnImportar: Boolean; "blnPedirInteracción": Boolean; strArchivoExistente: Text[250]; blnRenombrarArchivo: Boolean; l_blnFB: Boolean) strRetorno: Text[254]
    var
        rstRutaDigitalizacion: Record File;
        rstInfoEmpresa: Record "Company Information";
        rstConfComprasyPagos: Record "Purchases & Payables Setup";
        cduCommonControl: Codeunit "Mail Management";
        optFiletype: Option " ",Text,Excel,Word,Custom;
        filArchivoAImportar: File;
        strRutaCompletaSinArchivo: Text[250];
        strRutaCompletaConArchivo: Text[250];
        strNombreArchivo: Text;
        rstArchivo: Record "Específicos por ruta";
        intEscanearoImportaroRenombrar: Integer;
        strNroDoc: Code[20];
        datFechaVto: Date;
        rstCabCompra: Record "Purchase Header";
        cduMensajeria: Codeunit "Mensajería";
        rstMensajeria: Record Mensajeria;
        rstConfUsuario: Record "User Setup";
        rstRutaDigitEspecifica: Record "Específicos por ruta";
        cduGestionNoSerie: Codeunit "No. Series";
        rstConfCompras: Record "Purchases & Payables Setup";
        rstProveedor: Record Vendor;
        rstMovProveedor: Record "Vendor Ledger Entry";
        intLinea: Integer;
        blnSolicitarNiveles: Boolean;
        cduCodeSerie: Codeunit "No. Series";
        NVInStream: InStream;
        cduWS: Codeunit "WS - AFIP";
        codPV: Code[5];
        codComp: Code[10];
        strDia: Code[2];
        strMes: Code[2];
        strAno: Code[4];
        strFechEm: Code[8];
    begin
        Clear(rstRutaDigitalizacion);
        Clear(rstInfoEmpresa);
        Clear(strNombreArchivo);
        Clear(rstConfComprasyPagos);
        Clear(cduCommonControl);
        Clear(filArchivoAImportar);
        strArchivoGenerado := '';
        strRutaCompletaSinArchivo := '';
        strRutaCompletaConArchivo := '';

        if strTipoDocumento <> '' then
            Evaluate(l_strNivel1, strTipoDocumento);

        if strFechaDigitalizacion <> '' then
            Evaluate(l_strNivel2, strFechaDigitalizacion);

        if strDepartamento <> '' then
            Evaluate(l_strNivel3, strDepartamento);

        if strCodigoVinculante <> '' then
            Evaluate(l_strNivel4, strCodigoVinculante);

        if strUsuario <> '' then
            Evaluate(l_strNivel5, strUsuario);

        if strNivel6 <> '' then
            Evaluate(l_strNivel6, strNivel6);

        if strNivel7 <> '' then
            Evaluate(l_strNivel7, strNivel7);

        if strNivel8 <> '' then
            Evaluate(l_strNivel8, strNivel8);

        if strNivel9 <> '' then
            Evaluate(l_strNivel9, strNivel9);

        if strNivel10 <> '' then
            Evaluate(l_strNivel10, strNivel10);

        if strNivel11 <> '' then
            Evaluate(l_strNivel11, strNivel11);

        blnSolicitarNiveles := false;

        Clear(rstArchivo);
        rstArchivo.SetRange("No.", rstRutaDigitalizado."No.");
        if rstArchivo.Find('-') then
            repeat

                case rstArchivo.Nivel of

                    'N1':
                        begin

                            if (l_strNivel1 <> '') or rstArchivo.Automático then
                                strArchivoGenerado := strArchivoGenerado + '_' + rstArchivo.Nivel + '_' + l_strNivel1
                            else begin

                                blnSolicitarNiveles := true;

                            end;

                        end;

                    'N2':
                        begin

                            if (l_strNivel2 <> '') or rstArchivo.Automático then
                                strArchivoGenerado := strArchivoGenerado + '_' + rstArchivo.Nivel + '_' + l_strNivel2
                            else begin

                                blnSolicitarNiveles := true;

                            end;

                        end;

                    'N3':
                        begin

                            if (l_strNivel3 <> '') or rstArchivo.Automático then
                                strArchivoGenerado := strArchivoGenerado + '_' + rstArchivo.Nivel + '_' + l_strNivel3
                            else begin

                                blnSolicitarNiveles := true;

                            end;

                        end;

                    'N4':
                        begin

                            if (l_strNivel4 <> '') or rstArchivo.Automático then
                                strArchivoGenerado := strArchivoGenerado + '_' + rstArchivo.Nivel + '_' + l_strNivel4
                            else begin

                                blnSolicitarNiveles := true;

                            end;

                        end;

                    'N5':
                        begin

                            if (l_strNivel5 <> '') or rstArchivo.Automático then
                                strArchivoGenerado := strArchivoGenerado + '_' + rstArchivo.Nivel + '_' + l_strNivel5
                            else begin

                                blnSolicitarNiveles := true;

                            end;

                        end;

                    'N6':
                        begin

                            if (l_strNivel6 <> '') or rstArchivo.Automático then
                                strArchivoGenerado := strArchivoGenerado + '_' + rstArchivo.Nivel + '_' + l_strNivel6
                            else begin

                                blnSolicitarNiveles := true;

                            end;

                        end;

                    'N7':
                        begin

                            if (l_strNivel7 <> '') or rstArchivo.Automático then
                                strArchivoGenerado := strArchivoGenerado + '_' + rstArchivo.Nivel + '_' + l_strNivel7
                            else begin

                                blnSolicitarNiveles := true;

                            end;

                        end;

                    'N8':
                        begin

                            if (l_strNivel8 <> '') or rstArchivo.Automático then
                                strArchivoGenerado := strArchivoGenerado + '_' + rstArchivo.Nivel + '_' + l_strNivel8
                            else begin

                                blnSolicitarNiveles := true;

                            end;

                        end;

                    'N9':
                        begin

                            if (l_strNivel9 <> '') or rstArchivo.Automático then
                                strArchivoGenerado := strArchivoGenerado + '_' + rstArchivo.Nivel + '_' + l_strNivel9
                            else begin

                                blnSolicitarNiveles := true;

                            end;

                        end;

                    'N10':
                        begin

                            if (l_strNivel10 <> '') or rstArchivo.Automático then
                                strArchivoGenerado := strArchivoGenerado + '_' + rstArchivo.Nivel + '_' + l_strNivel10
                            else begin

                                blnSolicitarNiveles := true;

                            end;

                        end;

                    'N11':
                        begin

                            if (l_strNivel11 <> '') or rstArchivo.Automático then
                                strArchivoGenerado := strArchivoGenerado + '_' + rstArchivo.Nivel + '_' + l_strNivel11
                            else begin

                                blnSolicitarNiveles := true;

                            end;

                        end;

                end;

            until (rstArchivo.Next = 0) or blnSolicitarNiveles;

        if blnSolicitarNiveles then
            if not CompletarNiveles(rstArchivo, l_strNivel1, l_strNivel2, l_strNivel3, l_strNivel4, l_strNivel5, l_strNivel6,
            l_strNivel7, l_strNivel8, l_strNivel9, l_strNivel10, l_strNivel11) then
                exit;

        if strArchivoExistente = '' then begin

            case rstRutaDigitalizado."Tipo documento" of

                rstRutaDigitalizado."Tipo documento"::Remito:
                    begin

                        VerificarRelacion;
                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange(Nivel, 'N4');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel1);

                                    end;

                                'N2':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel2);

                                    end;

                                'N3':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel3);

                                    end;

                                'N4':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel4);

                                    end;

                                'N5':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel5);

                                    end;

                                'N6':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel6);

                                    end;

                                'N7':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel7);

                                    end;

                                'N8':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel8);

                                    end;

                                'N9':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel9);

                                    end;

                                'N10':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel10);

                                    end;

                                'N11':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel11);

                                    end;

                            end;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'No. documento');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    begin

                                        l_strNivel1 := VerificarFacturaProveedor(rstProveedor."No.", l_strNivel1);

                                    end;

                                'N2':
                                    begin

                                        l_strNivel2 := VerificarFacturaProveedor(rstProveedor."No.", l_strNivel2);

                                    end;
                                'N3':
                                    begin

                                        l_strNivel3 := VerificarFacturaProveedor(rstProveedor."No.", l_strNivel3);

                                    end;

                                'N4':
                                    begin

                                        l_strNivel4 := VerificarFacturaProveedor(rstProveedor."No.", l_strNivel4);

                                    end;
                                'N5':
                                    begin

                                        l_strNivel5 := VerificarFacturaProveedor(rstProveedor."No.", l_strNivel5);

                                    end;
                                'N6':
                                    begin

                                        l_strNivel6 := VerificarFacturaProveedor(rstProveedor."No.", l_strNivel6);

                                    end;
                                'N7':
                                    begin

                                        l_strNivel7 := VerificarFacturaProveedor(rstProveedor."No.", l_strNivel7);

                                    end;

                                'N8':
                                    begin

                                        l_strNivel8 := VerificarFacturaProveedor(rstProveedor."No.", l_strNivel8);

                                    end;

                                'N9':
                                    begin

                                        l_strNivel9 := VerificarFacturaProveedor(rstProveedor."No.", l_strNivel9);

                                    end;

                                'N10':
                                    begin

                                        l_strNivel10 := VerificarFacturaProveedor(rstProveedor."No.", l_strNivel10);

                                    end;

                                'N11':
                                    begin

                                        l_strNivel11 := VerificarFacturaProveedor(rstProveedor."No.", l_strNivel11);

                                    end;

                            end;

                    end;

                rstRutaDigitalizado."Tipo documento"::Factura:
                    begin

                        VerificarRelacion;
                        Clear(rstCabCompra);
                        Clear(rstConfCompras);
                        Clear(cduGestionNoSerie);
                        rstConfCompras.Get();
                        rstCabCompra.LockTable(true);
                        rstCabCompra."Document Type" := rstCabCompra."Document Type"::Invoice;
                        cduGestionNoSerie.GetNextNo(rstConfCompras."Invoice Nos.");
                        rstCabCompra."Posting No. Series" := rstConfCompras."Invoice Nos.";
                        rstCabCompra.Validate("Posting Date", WorkDate);
                        rstCabCompra.Validate(rstCabCompra."Order Date", WorkDate);
                        rstCabCompra.Validate(rstCabCompra."Expected Receipt Date", WorkDate);
                        rstCabCompra.Validate(rstCabCompra."Document Date", WorkDate);
                        rstCabCompra.fntVendDoc(rstRutaDigitalizado."Tipo documento");
                        rstCabCompra.Usuario := UserId;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange(Nivel, 'N4');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel1);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel1);

                                    end;

                                'N2':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel2);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel2);

                                    end;

                                'N3':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel3);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel3);

                                    end;

                                'N4':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel4);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel4);

                                    end;

                                'N5':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel5);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel5);

                                    end;

                                'N6':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel6);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel6);

                                    end;

                                'N7':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel7);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel7);

                                    end;

                                'N8':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel8);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel8);

                                    end;

                                'N9':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel9);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel9);

                                    end;

                                'N10':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel10);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel10);

                                    end;

                                'N11':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel11);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel11);

                                    end;


                            end;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'No. documento');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    begin

                                        l_strNivel1 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel1);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel1);

                                    end;

                                'N2':
                                    begin

                                        l_strNivel2 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel2);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel2);

                                    end;
                                'N3':
                                    begin

                                        l_strNivel3 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel3);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel3);

                                    end;

                                'N4':
                                    begin

                                        l_strNivel4 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel4);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel4);

                                    end;
                                'N5':
                                    begin

                                        l_strNivel5 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel5);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel5);

                                    end;
                                'N6':
                                    begin

                                        l_strNivel6 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel6);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel6);

                                    end;
                                'N7':
                                    begin

                                        l_strNivel7 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel7);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel7);

                                    end;

                                'N8':
                                    begin

                                        l_strNivel8 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel8);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel8);

                                    end;

                                'N9':
                                    begin

                                        l_strNivel9 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel9);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel9);

                                    end;

                                'N10':
                                    begin

                                        l_strNivel10 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel10);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel10);

                                    end;

                                'N11':
                                    begin

                                        l_strNivel11 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel11);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel11);

                                    end;


                            end;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'CAI-CAE');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel1);
                                'N2':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel2);
                                'N3':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel3);
                                'N4':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel4);
                                'N5':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel5);
                                'N6':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel6);
                                'N7':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel7);
                                'N8':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel8);
                                'N9':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel9);
                                'N10':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel10);
                                'N11':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel11);

                            end;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'Tipo documento AFIP');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel1);
                                'N2':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel2);
                                'N3':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel3);
                                'N4':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel4);
                                'N5':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel5);
                                'N6':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel6);
                                'N7':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel7);
                                'N8':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel8);
                                'N9':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel9);
                                'N10':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel10);
                                'N11':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel11);

                            end;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'Fecha vencimiento');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel1);
                                'N2':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel2);
                                'N3':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel3);
                                'N4':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel4);
                                'N5':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel5);
                                'N6':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel6);
                                'N7':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel7);
                                'N8':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel8);
                                'N9':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel9);
                                'N10':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel10);
                                'N11':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel11);

                            end;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'Fecha factura');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel1);
                                'N2':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel2);
                                'N3':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel3);
                                'N4':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel4);
                                'N5':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel5);
                                'N6':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel6);
                                'N7':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel7);
                                'N8':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel8);
                                'N9':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel9);
                                'N10':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel10);
                                'N11':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel11);

                            end;

                        rstCabCompra.Validate(rstCabCompra."Document Date");
                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'No. documento interno');
                        if rstRutaDigitEspecifica.Find('-') then begin
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    l_strNivel1 := rstCabCompra."No.";
                                'N2':
                                    l_strNivel2 := rstCabCompra."No.";
                                'N3':
                                    l_strNivel3 := rstCabCompra."No.";
                                'N4':
                                    l_strNivel4 := rstCabCompra."No.";
                                'N5':
                                    l_strNivel5 := rstCabCompra."No.";
                                'N6':
                                    l_strNivel6 := rstCabCompra."No.";
                                'N7':
                                    l_strNivel7 := rstCabCompra."No.";
                                'N8':
                                    l_strNivel8 := rstCabCompra."No.";
                                'N9':
                                    l_strNivel9 := rstCabCompra."No.";
                                'N10':
                                    l_strNivel10 := rstCabCompra."No.";
                                'N11':
                                    l_strNivel11 := rstCabCompra."No.";
                            end;
                            strNroDoc := rstCabCompra."No.";
                        end;
                        Clear(l_rstGLS);
                        l_rstGLS.Get();

                        if l_rstGLS."WS - Verif. Comprobante" <> '' then begin

                            codPV := '';
                            if StrPos(rstCabCompra."Vendor Invoice No.", '-') <> 0 then
                                codPV := CopyStr(DelChr(rstCabCompra."Vendor Invoice No.", '=', DelChr(rstCabCompra."Vendor Invoice No.", '=', '0123456789-')), 1,
                                         StrPos(DelChr(rstCabCompra."Vendor Invoice No.", '=', DelChr(rstCabCompra."Vendor Invoice No.", '=', '0123456789-')), '-') - 1);

                            codComp := '';
                            if StrPos(rstCabCompra."Vendor Invoice No.", '-') <> 0 then
                                codComp := CopyStr(DelChr(rstCabCompra."Vendor Invoice No.", '=', DelChr(rstCabCompra."Vendor Invoice No.", '=', '0123456789-')),
                                         StrPos(DelChr(rstCabCompra."Vendor Invoice No.", '=', DelChr(rstCabCompra."Vendor Invoice No.", '=', '0123456789-')), '-') + 1, 100);

                            strDia := Format(Date2DMY(rstCabCompra."Document Date", 1));
                            if StrLen(strDia) = 1 then
                                strDia := '0' + strDia;
                            strMes := Format(Date2DMY(rstCabCompra."Document Date", 2));
                            if StrLen(strMes) = 1 then
                                strMes := '0' + strMes;
                            strAno := Format(Date2DMY(rstCabCompra."Document Date", 3));

                            strFechEm := strAno + strMes + strDia;
                            /*
                            CLEAR(cduWS);
                            cduWS.fntConstatacionComprobante(l_rstGLS."WS - Verif. Comprobante",DELCHR(rstProveedor."VAT Registration No.",'=','-'),FORMAT(rstProveedor."Tipo autorizacion"),
                                                             codPV,rstCabCompra."Tipo documento AFIP",codComp,strFechEm,strNivel10,
                                                             rstCabCompra."CAI-CAE",COPYSTR(DELCHR(rstInfoEmpresa."VAT Registration No.",'=','-'),1,10));
                            */
                        end;

                        strArchivoGenerado := GenerarNombreArchivo(l_strNivel1, l_strNivel2, l_strNivel3, l_strNivel4, l_strNivel5, l_strNivel6,
                                                l_strNivel7, l_strNivel8, l_strNivel9, l_strNivel10, l_strNivel11);


                        strRutaCompletaConArchivo := //UPPERCASE(rstRutaDigitalizado.+{'\'+}strArchivoGenerado+'.pdf');
                                                     UpperCase(GenerarRutaCompleta(rstRutaDigitalizado, strArchivoGenerado + '.pdf', true));
                        rstCabCompra."Archivo vinculado" := strRutaCompletaConArchivo;
                        rstInfoEmpresa.Reset;
                        rstInfoEmpresa.Get();
                        rstCabCompra.Validate("CAI-CAE");
                        rstCabCompra.Insert;
                        rstConfUsuario.Get(UserId);
                        cduMensajeria.RegistrarMensaje('Factura digitalizada', '', rstCabCompra."No.", 'Factura (compras)', 'Digitalizado', Today,
                        rstMensajeria."Tipo movimiento"::"Flujo documentos", l_strNivel3,
                        '', '', cduCodeSerie.GetNextNo(rstInfoEmpresa."No. serie mensajería", Today, true), '', '', '', strRutaCompletaConArchivo);

                    end;

                rstRutaDigitalizado."Tipo documento"::"Factura pronto vencimiento":
                    begin

                        VerificarRelacion;
                        Clear(rstCabCompra);
                        Clear(rstConfCompras);
                        Clear(cduGestionNoSerie);
                        rstConfCompras.Get();
                        rstCabCompra.LockTable(true);
                        rstCabCompra."Document Type" := rstCabCompra."Document Type"::Invoice;
                        cduGestionNoSerie.GetNextNo(rstConfCompras."Invoice Nos.");
                        rstCabCompra."Posting No. Series" := rstConfCompras."Invoice Nos.";
                        rstCabCompra.Validate("Posting Date", WorkDate);
                        rstCabCompra.Validate(rstCabCompra."Order Date", WorkDate);
                        rstCabCompra.Validate(rstCabCompra."Expected Receipt Date", WorkDate);
                        rstCabCompra.Validate(rstCabCompra."Document Date", WorkDate);
                        rstCabCompra.fntVendDoc(rstRutaDigitalizado."Tipo documento");
                        rstCabCompra.Usuario := UserId;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange(Nivel, 'N4');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel1);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel1);

                                    end;

                                'N2':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel2);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel2);

                                    end;

                                'N3':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel3);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel3);

                                    end;

                                'N4':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel4);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel4);

                                    end;

                                'N5':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel5);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel5);

                                    end;

                                'N6':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel6);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel6);

                                    end;

                                'N7':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel7);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel7);

                                    end;

                                'N8':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel8);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel8);

                                    end;

                                'N9':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel9);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel9);

                                    end;

                                'N10':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel10);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel10);

                                    end;

                                'N11':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel11);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel11);

                                    end;

                            end;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'No. documento');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    begin

                                        l_strNivel1 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel1);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel1);

                                    end;

                                'N2':
                                    begin

                                        l_strNivel2 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel2);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel2);

                                    end;
                                'N3':
                                    begin

                                        l_strNivel3 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel3);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel3);

                                    end;

                                'N4':
                                    begin

                                        l_strNivel4 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel4);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel4);

                                    end;
                                'N5':
                                    begin

                                        l_strNivel5 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel5);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel5);

                                    end;
                                'N6':
                                    begin

                                        l_strNivel6 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel6);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel6);

                                    end;
                                'N7':
                                    begin

                                        l_strNivel7 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel7);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel7);

                                    end;

                                'N8':
                                    begin

                                        l_strNivel8 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel8);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel8);

                                    end;

                                'N9':
                                    begin

                                        l_strNivel9 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel9);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel9);

                                    end;

                                'N10':
                                    begin

                                        l_strNivel10 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel10);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel10);

                                    end;

                                'N11':
                                    begin

                                        l_strNivel11 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel11);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel11);
                                    end;


                            end;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'CAI-CAE');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel1);
                                'N2':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel2);
                                'N3':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel3);
                                'N4':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel4);
                                'N5':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel5);
                                'N6':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel6);
                                'N7':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel7);
                                'N8':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel8);
                                'N9':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel9);
                                'N10':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel10);
                                'N11':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel11);

                            end;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'Tipo documento AFIP');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel1);
                                'N2':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel2);
                                'N3':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel3);
                                'N4':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel4);
                                'N5':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel5);
                                'N6':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel6);
                                'N7':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel7);
                                'N8':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel8);
                                'N9':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel9);
                                'N10':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel10);
                                'N11':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel11);


                            end;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'Fecha factura');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel1);
                                'N2':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel2);
                                'N3':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel3);
                                'N4':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel4);
                                'N5':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel5);
                                'N6':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel6);
                                'N7':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel7);
                                'N8':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel8);
                                'N9':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel9);
                                'N10':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel10);
                                'N11':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel11);

                            end;

                        rstCabCompra.Validate(rstCabCompra."Document Date");
                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'No. documento interno');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    begin

                                        l_strNivel1 := rstCabCompra."No.";

                                    end;

                                'N2':
                                    begin

                                        l_strNivel2 := rstCabCompra."No.";

                                    end;
                                'N3':
                                    begin

                                        l_strNivel3 := rstCabCompra."No.";

                                    end;

                                'N4':
                                    begin

                                        l_strNivel4 := rstCabCompra."No.";

                                    end;
                                'N5':
                                    begin

                                        l_strNivel5 := rstCabCompra."No.";

                                    end;
                                'N6':
                                    begin

                                        l_strNivel6 := rstCabCompra."No.";

                                    end;
                                'N7':
                                    begin

                                        l_strNivel7 := rstCabCompra."No.";

                                    end;

                                'N8':
                                    begin

                                        l_strNivel8 := rstCabCompra."No.";

                                    end;

                                'N9':
                                    begin

                                        l_strNivel9 := rstCabCompra."No.";

                                    end;

                                'N10':
                                    begin

                                        l_strNivel10 := rstCabCompra."No.";

                                    end;

                                'N11':
                                    begin

                                        l_strNivel11 := rstCabCompra."No.";

                                    end;

                            end;

                        strArchivoGenerado := GenerarNombreArchivo(l_strNivel1, l_strNivel2, l_strNivel3, l_strNivel4, l_strNivel5, l_strNivel6,
                                                  l_strNivel7, l_strNivel8, l_strNivel9, l_strNivel10, l_strNivel11);

                        strRutaCompletaConArchivo := UpperCase(GenerarRutaCompleta(rstRutaDigitalizado, strArchivoGenerado + '.pdf', true));
                        rstCabCompra."Archivo vinculado" := strRutaCompletaConArchivo;
                        rstInfoEmpresa.Reset;
                        rstInfoEmpresa.Get();
                        rstCabCompra.Validate("CAI-CAE");
                        rstCabCompra.Insert;
                        rstConfUsuario.Get(UserId);
                        cduMensajeria.RegistrarMensaje('Factura digitalizada', '', rstCabCompra."No.", 'Fact. pronto venc. (compras)',
                        'Digitalizado', Today, rstMensajeria."Tipo movimiento"::"Flujo documentos", l_strNivel3,
                        '', '', cduCodeSerie.GetNextNo(rstInfoEmpresa."No. serie mensajería", Today, true), '', '', '', strRutaCompletaConArchivo);

                    end;

                rstRutaDigitalizado."Tipo documento"::"Débito":
                    begin

                        VerificarRelacion;
                        Clear(rstCabCompra);
                        Clear(rstConfCompras);
                        Clear(cduGestionNoSerie);
                        rstConfCompras.Get();
                        rstCabCompra.LockTable(true);
                        rstCabCompra."Document Type" := rstCabCompra."Document Type"::Invoice;
                        cduGestionNoSerie.GetNextNo(rstConfCompras."Invoice Nos.");
                        rstCabCompra."Posting No. Series" := rstConfCompras."Invoice Nos.";
                        rstCabCompra.Validate("Posting Date", WorkDate);
                        rstCabCompra.Validate(rstCabCompra."Order Date", WorkDate);
                        rstCabCompra.Validate(rstCabCompra."Expected Receipt Date", WorkDate);
                        rstCabCompra.Validate(rstCabCompra."Document Date", WorkDate);
                        rstCabCompra.fntVendDoc(rstRutaDigitalizado."Tipo documento");
                        rstCabCompra.Usuario := UserId;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange(Nivel, 'N4');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel1);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel1);

                                    end;

                                'N2':

                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel2);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel2);

                                    end;

                                'N3':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel3);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel3);

                                    end;

                                'N4':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel4);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel4);

                                    end;

                                'N5':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel5);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel5);

                                    end;

                                'N6':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel6);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel6);

                                    end;

                                'N7':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel7);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel7);

                                    end;

                                'N8':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel8);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel8);

                                    end;

                                'N9':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel9);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel9);

                                    end;

                                'N10':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel10);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel10);

                                    end;

                                'N11':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel11);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel11);

                                    end;

                            end;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'No. documento');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    begin

                                        l_strNivel1 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel1);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel1);

                                    end;

                                'N2':
                                    begin

                                        l_strNivel2 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel2);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel2);

                                    end;
                                'N3':
                                    begin

                                        l_strNivel3 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel3);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel3);

                                    end;

                                'N4':
                                    begin

                                        l_strNivel4 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel4);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel4);

                                    end;
                                'N5':
                                    begin

                                        l_strNivel5 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel5);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel5);

                                    end;
                                'N6':
                                    begin

                                        l_strNivel6 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel6);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel6);

                                    end;
                                'N7':
                                    begin

                                        l_strNivel7 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel7);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel7);

                                    end;

                                'N8':
                                    begin

                                        l_strNivel8 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel8);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel8);

                                    end;

                                'N9':
                                    begin

                                        l_strNivel9 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel9);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel9);

                                    end;

                                'N10':
                                    begin

                                        l_strNivel10 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel10);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel10);

                                    end;

                                'N11':
                                    begin

                                        l_strNivel11 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel11);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel11);

                                    end;

                            end;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'Fecha vto. documento');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel1);
                                'N2':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel2);
                                'N3':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel3);
                                'N4':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel4);
                                'N5':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel5);
                                'N6':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel6);
                                'N7':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel7);
                                'N8':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel8);
                                'N9':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel9);
                                'N10':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel10);
                                'N11':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel11);


                            end;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'CAI-CAE');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel1);
                                'N2':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel2);
                                'N3':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel3);
                                'N4':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel4);
                                'N5':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel5);
                                'N6':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel6);
                                'N7':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel7);
                                'N8':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel8);
                                'N9':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel9);
                                'N10':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel10);
                                'N11':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel11);

                            end;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'Tipo documento AFIP');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel1);
                                'N2':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel2);
                                'N3':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel3);
                                'N4':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel4);
                                'N5':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel5);
                                'N6':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel6);
                                'N7':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel7);
                                'N8':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel8);
                                'N9':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel9);
                                'N10':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel10);
                                'N11':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel11);

                            end;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'Fecha vencimiento');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel1);
                                'N2':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel2);
                                'N3':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel3);
                                'N4':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel4);
                                'N5':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel5);
                                'N6':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel6);
                                'N7':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel7);
                                'N8':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel8);
                                'N9':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel9);
                                'N10':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel10);
                                'N11':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel11);

                            end;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'Fecha débito');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel1);
                                'N2':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel2);
                                'N3':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel3);
                                'N4':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel4);
                                'N5':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel5);
                                'N6':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel6);
                                'N7':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel7);
                                'N8':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel8);
                                'N9':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel9);
                                'N10':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel10);
                                'N11':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel11);

                            end;

                        rstCabCompra.Validate("Document Date");
                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'No. documento interno');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    begin

                                        l_strNivel1 := rstCabCompra."No.";

                                    end;

                                'N2':
                                    begin

                                        l_strNivel2 := rstCabCompra."No.";

                                    end;
                                'N3':
                                    begin

                                        l_strNivel3 := rstCabCompra."No.";

                                    end;

                                'N4':
                                    begin

                                        l_strNivel4 := rstCabCompra."No.";

                                    end;
                                'N5':
                                    begin

                                        l_strNivel5 := rstCabCompra."No.";

                                    end;
                                'N6':
                                    begin

                                        l_strNivel6 := rstCabCompra."No.";

                                    end;
                                'N7':
                                    begin

                                        l_strNivel7 := rstCabCompra."No.";

                                    end;

                                'N8':
                                    begin

                                        l_strNivel8 := rstCabCompra."No.";

                                    end;

                                'N9':
                                    begin

                                        l_strNivel9 := rstCabCompra."No.";

                                    end;

                                'N10':
                                    begin

                                        l_strNivel10 := rstCabCompra."No.";

                                    end;

                                'N11':
                                    begin

                                        l_strNivel11 := rstCabCompra."No.";

                                    end;

                            end;
                        rstCabCompra.Validate("CAI-CAE");
                        rstCabCompra.Insert;

                        rstConfUsuario.Get(UserId);

                        strArchivoGenerado := GenerarNombreArchivo(l_strNivel1, l_strNivel2, l_strNivel3, l_strNivel4, l_strNivel5, l_strNivel6,
                                                  l_strNivel7, l_strNivel8, l_strNivel9, l_strNivel10, l_strNivel11);


                        strRutaCompletaConArchivo := UpperCase(GenerarRutaCompleta(rstRutaDigitalizado, strArchivoGenerado + '.pdf', true));
                        rstCabCompra."Archivo vinculado" := strRutaCompletaConArchivo;
                        rstCabCompra.Modify;
                        Clear(rstInfoEmpresa);
                        rstInfoEmpresa.Get();
                        cduMensajeria.RegistrarMensaje('Nota de débito digitalizada', '', rstCabCompra."No.", 'Nota débito (compras)', 'Digitalizado',
                        Today, rstMensajeria."Tipo movimiento"::"Flujo documentos", l_strNivel3,
                        '', '', cduCodeSerie.GetNextNo(rstInfoEmpresa."No. serie mensajería", Today, true), '', '', '', strRutaCompletaConArchivo);

                    end;

                rstRutaDigitalizado."Tipo documento"::"Déb.Vto.":
                    begin

                        VerificarRelacion;
                        Clear(rstCabCompra);
                        Clear(rstConfCompras);
                        Clear(cduGestionNoSerie);
                        rstConfCompras.Get();
                        rstCabCompra.LockTable(true);
                        rstCabCompra."Document Type" := rstCabCompra."Document Type"::Invoice;
                        cduGestionNoSerie.GetNextNo(rstConfCompras."Invoice Nos.");
                        rstCabCompra."Posting No. Series" := rstConfCompras."Invoice Nos.";
                        rstCabCompra.Validate("Posting Date", WorkDate);
                        rstCabCompra.Validate(rstCabCompra."Order Date", WorkDate);
                        rstCabCompra.Validate(rstCabCompra."Expected Receipt Date", WorkDate);
                        rstCabCompra.Validate(rstCabCompra."Document Date", WorkDate);
                        rstCabCompra.fntVendDoc(rstRutaDigitalizado."Tipo documento");
                        rstCabCompra.Usuario := UserId;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange(Nivel, 'N4');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel1);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel1);

                                    end;

                                'N2':

                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel2);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel2);

                                    end;

                                'N3':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel3);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel3);

                                    end;

                                'N4':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel4);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel4);

                                    end;

                                'N5':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel5);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel5);

                                    end;

                                'N6':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel6);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel6);

                                    end;

                                'N7':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel7);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel7);

                                    end;

                                'N8':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel8);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel8);

                                    end;

                                'N9':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel9);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel9);

                                    end;

                                'N10':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel10);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel10);

                                    end;

                                'N11':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel11);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel11);

                                    end;


                            end;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'No. documento');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    begin

                                        l_strNivel1 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel1);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel1);

                                    end;

                                'N2':
                                    begin

                                        l_strNivel2 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel2);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel2);

                                    end;
                                'N3':
                                    begin

                                        l_strNivel3 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel3);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel3);

                                    end;

                                'N4':
                                    begin

                                        l_strNivel4 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel4);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel4);

                                    end;
                                'N5':
                                    begin

                                        l_strNivel5 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel5);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel5);

                                    end;
                                'N6':
                                    begin

                                        l_strNivel6 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel6);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel6);

                                    end;
                                'N7':
                                    begin

                                        l_strNivel7 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel7);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel7);

                                    end;

                                'N8':
                                    begin

                                        l_strNivel8 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel8);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel8);

                                    end;

                                'N9':
                                    begin

                                        l_strNivel9 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel9);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel9);

                                    end;

                                'N10':
                                    begin

                                        l_strNivel10 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel10);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel10);

                                    end;

                                'N11':
                                    begin

                                        l_strNivel11 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel11);
                                        rstCabCompra.Validate("Vendor Invoice No.", l_strNivel11);

                                    end;

                            end;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'Fecha vto. documento');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel1);
                                'N2':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel2);
                                'N3':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel3);
                                'N4':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel4);
                                'N5':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel5);
                                'N6':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel6);
                                'N7':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel7);
                                'N8':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel8);
                                'N9':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel9);
                                'N10':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel10);
                                'N11':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel11);

                            end;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'Fecha débito');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel1);
                                'N2':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel2);
                                'N3':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel3);
                                'N4':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel4);
                                'N5':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel5);
                                'N6':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel6);
                                'N7':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel7);
                                'N8':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel8);
                                'N9':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel9);
                                'N10':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel10);
                                'N11':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel11);

                            end;

                        rstCabCompra.Validate("Document Date");
                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'No. documento interno');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    begin

                                        l_strNivel1 := rstCabCompra."No.";

                                    end;

                                'N2':
                                    begin

                                        l_strNivel2 := rstCabCompra."No.";

                                    end;
                                'N3':
                                    begin

                                        l_strNivel3 := rstCabCompra."No.";

                                    end;

                                'N4':
                                    begin

                                        l_strNivel4 := rstCabCompra."No.";

                                    end;
                                'N5':
                                    begin

                                        l_strNivel5 := rstCabCompra."No.";

                                    end;
                                'N6':
                                    begin

                                        l_strNivel6 := rstCabCompra."No.";

                                    end;
                                'N7':
                                    begin

                                        l_strNivel7 := rstCabCompra."No.";

                                    end;

                                'N8':
                                    begin

                                        l_strNivel8 := rstCabCompra."No.";

                                    end;

                                'N9':
                                    begin

                                        l_strNivel9 := rstCabCompra."No.";

                                    end;

                                'N10':
                                    begin

                                        l_strNivel10 := rstCabCompra."No.";

                                    end;

                                'N11':
                                    begin

                                        l_strNivel11 := rstCabCompra."No.";

                                    end;

                            end;
                        rstCabCompra.Validate("CAI-CAE");
                        rstCabCompra.Insert;

                        rstConfUsuario.Get(UserId);

                        strArchivoGenerado := GenerarNombreArchivo(l_strNivel1, l_strNivel2, l_strNivel3, l_strNivel4, l_strNivel5, l_strNivel6,
                                                l_strNivel7, l_strNivel8, l_strNivel9, l_strNivel10, l_strNivel11);

                        strRutaCompletaConArchivo := UpperCase(GenerarRutaCompleta(rstRutaDigitalizado, strArchivoGenerado + '.pdf', true));
                        rstCabCompra."Archivo vinculado" := strRutaCompletaConArchivo;
                        rstCabCompra.Modify;
                        Clear(rstInfoEmpresa);
                        rstInfoEmpresa.Get();
                        cduMensajeria.RegistrarMensaje('Nota de débito digitalizada', '', rstCabCompra."No.", 'Déb. pronto venc. (compras)',
                        'Digitalizado', Today, rstMensajeria."Tipo movimiento"::"Flujo documentos", l_strNivel3,
                        '', '', cduCodeSerie.GetNextNo(rstInfoEmpresa."No. serie mensajería", Today, true), '', '', '', strRutaCompletaConArchivo);

                    end;

                rstRutaDigitalizado."Tipo documento"::"Crédito":
                    begin

                        VerificarRelacion;
                        Clear(rstCabCompra);
                        Clear(rstConfCompras);
                        Clear(cduGestionNoSerie);
                        rstConfCompras.Get();
                        rstCabCompra.LockTable(true);
                        rstCabCompra."Document Type" := rstCabCompra."Document Type"::"Credit Memo";
                        cduGestionNoSerie.GetNextNo(rstConfCompras."Credit Memo Nos.");
                        rstCabCompra."Posting No. Series" := rstConfCompras."Credit Memo Nos.";
                        rstCabCompra.Validate("Posting Date", WorkDate);
                        rstCabCompra.Validate(rstCabCompra."Order Date", WorkDate);
                        rstCabCompra.Validate(rstCabCompra."Expected Receipt Date", WorkDate);
                        rstCabCompra.Validate(rstCabCompra."Document Date", WorkDate);
                        rstCabCompra.Usuario := UserId;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange(Nivel, 'N4');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel1);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel1);

                                    end;

                                'N2':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel2);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel2);

                                    end;

                                'N3':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel3);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel3);

                                    end;

                                'N4':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel4);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel4);

                                    end;

                                'N5':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel5);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel5);

                                    end;

                                'N6':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel6);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel6);

                                    end;

                                'N7':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel7);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel7);

                                    end;

                                'N8':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel8);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel8);

                                    end;

                                'N9':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel9);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel9);

                                    end;

                                'N10':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel10);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel10);

                                    end;

                                'N11':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel11);
                                        rstCabCompra.Validate("Buy-from Vendor No.", l_strNivel11);

                                    end;

                            end;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'No. documento');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    begin

                                        l_strNivel1 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel1);
                                        rstCabCompra.Validate(rstCabCompra."Vendor Cr. Memo No.", l_strNivel1);

                                    end;

                                'N2':
                                    begin

                                        l_strNivel2 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel2);
                                        rstCabCompra.Validate(rstCabCompra."Vendor Cr. Memo No.", l_strNivel2);

                                    end;

                                'N3':
                                    begin

                                        l_strNivel3 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel3);
                                        rstCabCompra.Validate(rstCabCompra."Vendor Cr. Memo No.", l_strNivel3);

                                    end;

                                'N4':
                                    begin

                                        l_strNivel4 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel4);
                                        rstCabCompra.Validate(rstCabCompra."Vendor Cr. Memo No.", l_strNivel4);

                                    end;

                                'N5':
                                    begin

                                        l_strNivel5 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel5);
                                        rstCabCompra.Validate(rstCabCompra."Vendor Cr. Memo No.", l_strNivel5);

                                    end;

                                'N6':
                                    begin

                                        l_strNivel6 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel6);
                                        rstCabCompra.Validate(rstCabCompra."Vendor Cr. Memo No.", l_strNivel6);

                                    end;

                                'N7':
                                    begin

                                        l_strNivel7 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel7);
                                        rstCabCompra.Validate(rstCabCompra."Vendor Cr. Memo No.", l_strNivel7);

                                    end;

                                'N8':
                                    begin

                                        l_strNivel8 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel8);
                                        rstCabCompra.Validate(rstCabCompra."Vendor Cr. Memo No.", l_strNivel8);

                                    end;

                                'N9':
                                    begin

                                        l_strNivel9 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel9);
                                        rstCabCompra.Validate(rstCabCompra."Vendor Cr. Memo No.", l_strNivel9);

                                    end;

                                'N10':
                                    begin

                                        l_strNivel10 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel10);
                                        rstCabCompra.Validate(rstCabCompra."Vendor Cr. Memo No.", l_strNivel10);

                                    end;

                                'N11':
                                    begin

                                        l_strNivel11 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel11);
                                        rstCabCompra.Validate(rstCabCompra."Vendor Cr. Memo No.", l_strNivel11);

                                    end;

                            end;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'Fecha vto. documento');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel1);
                                'N2':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel2);
                                'N3':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel3);
                                'N4':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel4);
                                'N5':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel5);
                                'N6':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel6);
                                'N7':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel7);
                                'N8':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel8);
                                'N9':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel9);
                                'N10':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel10);
                                'N11':
                                    Evaluate(rstCabCompra."Due Date", l_strNivel11);

                            end;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'Fecha crédito');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel1);
                                'N2':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel2);
                                'N3':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel3);
                                'N4':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel4);
                                'N5':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel5);
                                'N6':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel6);
                                'N7':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel7);
                                'N8':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel8);
                                'N9':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel9);
                                'N10':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel10);
                                'N11':
                                    Evaluate(rstCabCompra."Document Date", l_strNivel11);

                            end;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'CAI-CAE');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel1);
                                'N2':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel2);
                                'N3':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel3);
                                'N4':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel4);
                                'N5':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel5);
                                'N6':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel6);
                                'N7':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel7);
                                'N8':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel8);
                                'N9':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel9);
                                'N10':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel10);
                                'N11':
                                    Evaluate(rstCabCompra."CAI-CAE", l_strNivel11);

                            end;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'Tipo documento AFIP');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel1);
                                'N2':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel2);
                                'N3':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel3);
                                'N4':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel4);
                                'N5':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel5);
                                'N6':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel6);
                                'N7':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel7);
                                'N8':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel8);
                                'N9':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel9);
                                'N10':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel10);
                                'N11':
                                    Evaluate(rstCabCompra."Tipo documento AFIP", l_strNivel11);

                            end;

                        rstCabCompra.Validate("Document Date");
                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'No. documento interno');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    l_strNivel1 := rstCabCompra."No.";
                                'N2':
                                    l_strNivel2 := rstCabCompra."No.";
                                'N3':
                                    l_strNivel3 := rstCabCompra."No.";
                                'N4':
                                    l_strNivel4 := rstCabCompra."No.";
                                'N5':
                                    l_strNivel5 := rstCabCompra."No.";
                                'N6':
                                    l_strNivel6 := rstCabCompra."No.";
                                'N7':
                                    l_strNivel7 := rstCabCompra."No.";
                                'N8':
                                    l_strNivel8 := rstCabCompra."No.";
                                'N9':
                                    l_strNivel9 := rstCabCompra."No.";
                                'N10':
                                    l_strNivel10 := rstCabCompra."No.";
                                'N11':
                                    l_strNivel11 := rstCabCompra."No.";
                            end;
                        rstCabCompra.Validate("CAI-CAE");
                        rstCabCompra.Insert;

                        rstConfUsuario.Get(UserId);

                        strArchivoGenerado := GenerarNombreArchivo(l_strNivel1, l_strNivel2, l_strNivel3, l_strNivel4, l_strNivel5, l_strNivel6,
                                                l_strNivel7, l_strNivel8, l_strNivel9, l_strNivel10, l_strNivel11);

                        strRutaCompletaConArchivo := UpperCase(GenerarRutaCompleta(rstRutaDigitalizado, strArchivoGenerado + '.pdf', true));
                        rstCabCompra."Archivo vinculado" := strRutaCompletaConArchivo;
                        rstCabCompra.Modify;
                        Clear(rstInfoEmpresa);
                        rstInfoEmpresa.Get();
                        cduMensajeria.RegistrarMensaje('Nota de crédito digitalizada', '', rstCabCompra."No.", 'Nota crédito (compras)', 'Digitalizado',
                        Today, rstMensajeria."Tipo movimiento"::"Flujo documentos",
                        l_strNivel3, '', '', cduCodeSerie.GetNextNo(rstInfoEmpresa."No. serie mensajería", Today, true), '', '', '', strRutaCompletaConArchivo);

                    end;

                rstRutaDigitalizado."Tipo documento"::Recibo:
                    begin

                        VerificarRelacion;
                        Clear(rstMovProveedor);
                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange(Nivel, 'N4');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel1);

                                    end;

                                'N2':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel2);

                                    end;

                                'N3':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel3);

                                    end;

                                'N4':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel4);

                                    end;

                                'N5':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel5);

                                    end;

                                'N6':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel6);

                                    end;

                                'N7':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel7);

                                    end;

                                'N8':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel8);

                                    end;

                                'N9':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel9);

                                    end;

                                'N10':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel10);

                                    end;

                                'N11':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel11);

                                    end;

                            end;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'No. documento');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    begin

                                        l_strNivel1 := VerificarFacturaProveedor(l_strNivel4, l_strNivel1);

                                    end;

                                'N2':
                                    begin

                                        l_strNivel2 := VerificarFacturaProveedor(l_strNivel4, l_strNivel2);

                                    end;

                                'N3':
                                    begin

                                        l_strNivel3 := VerificarFacturaProveedor(l_strNivel4, l_strNivel3);

                                    end;

                                'N4':
                                    begin

                                        l_strNivel4 := VerificarFacturaProveedor(l_strNivel4, l_strNivel4);

                                    end;

                                'N5':
                                    begin

                                        l_strNivel5 := VerificarFacturaProveedor(l_strNivel4, l_strNivel5);

                                    end;

                                'N6':
                                    begin

                                        l_strNivel6 := VerificarFacturaProveedor(l_strNivel4, l_strNivel6);

                                    end;

                                'N7':
                                    begin

                                        l_strNivel7 := VerificarFacturaProveedor(l_strNivel4, l_strNivel7);

                                    end;

                                'N8':
                                    begin

                                        l_strNivel8 := VerificarFacturaProveedor(l_strNivel4, l_strNivel8);

                                    end;

                                'N9':
                                    begin

                                        l_strNivel9 := VerificarFacturaProveedor(l_strNivel4, l_strNivel9);

                                    end;

                                'N10':
                                    begin

                                        l_strNivel10 := VerificarFacturaProveedor(l_strNivel4, l_strNivel10);

                                    end;

                                'N11':
                                    begin

                                        l_strNivel11 := VerificarFacturaProveedor(l_strNivel4, l_strNivel11);

                                    end;

                            end;

                        rstMovProveedor.SetCurrentKey("Document No.");
                        rstMovProveedor.SetRange("Document No.", l_strNivel6);

                        strArchivoGenerado := GenerarNombreArchivo(l_strNivel1, l_strNivel2, l_strNivel3, l_strNivel4, l_strNivel5, l_strNivel6,
                                                l_strNivel7, l_strNivel8, l_strNivel9, l_strNivel10, l_strNivel11);

                        Clear(rstMensajeria);
                        rstMensajeria.SetCurrentKey("No. documento");
                        rstMensajeria.SetRange("No. documento", l_strNivel6);
                        if rstMensajeria.Find('-') then begin

                            rstMensajeria.Hipervinculo := UpperCase(GenerarRutaCompleta(rstRutaDigitalizado, strArchivoGenerado + '.pdf', true));

                            rstMensajeria.Modify;

                        end;

                        cduMensajeria.RegistrarMensaje('Recibo digitalizado', '', l_strNivel7, 'Recibo de pago (compras)', 'Digitalizado',
                        Today, rstMensajeria."Tipo movimiento"::"Flujo documentos", l_strNivel3,
                        '', '', '', '', '', '', strRutaCompletaConArchivo);

                    end;

            end;

        end
        else begin

            case rstRutaDigitalizado."Tipo documento" of

                rstRutaDigitalizado."Tipo documento"::Remito:
                    begin

                        VerificarRelacion;
                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange(Nivel, 'N4');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel1);

                                    end;

                                'N2':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel2);

                                    end;

                                'N3':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel3);

                                    end;

                                'N4':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel4);

                                    end;

                                'N5':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel5);

                                    end;

                                'N6':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel6);

                                    end;

                                'N7':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel7);

                                    end;

                                'N8':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel8);

                                    end;

                                'N9':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel9);

                                    end;

                                'N10':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel10);

                                    end;

                                'N11':
                                    begin

                                        Clear(rstProveedor);
                                        rstProveedor.Get(l_strNivel11);

                                    end;

                            end;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'No. documento');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    begin

                                        l_strNivel1 := VerificarFacturaProveedor(rstProveedor."No.", l_strNivel1);

                                    end;

                                'N2':
                                    begin

                                        l_strNivel2 := VerificarFacturaProveedor(rstProveedor."No.", l_strNivel2);

                                    end;
                                'N3':
                                    begin

                                        l_strNivel3 := VerificarFacturaProveedor(rstProveedor."No.", l_strNivel3);

                                    end;

                                'N4':
                                    begin

                                        l_strNivel4 := VerificarFacturaProveedor(rstProveedor."No.", l_strNivel4);

                                    end;
                                'N5':
                                    begin

                                        l_strNivel5 := VerificarFacturaProveedor(rstProveedor."No.", l_strNivel5);

                                    end;
                                'N6':
                                    begin

                                        l_strNivel6 := VerificarFacturaProveedor(rstProveedor."No.", l_strNivel6);

                                    end;
                                'N7':
                                    begin

                                        l_strNivel7 := VerificarFacturaProveedor(rstProveedor."No.", l_strNivel7);

                                    end;

                                'N8':
                                    begin

                                        l_strNivel8 := VerificarFacturaProveedor(rstProveedor."No.", l_strNivel8);

                                    end;

                                'N9':
                                    begin

                                        l_strNivel9 := VerificarFacturaProveedor(rstProveedor."No.", l_strNivel9);

                                    end;

                                'N10':
                                    begin

                                        l_strNivel10 := VerificarFacturaProveedor(rstProveedor."No.", l_strNivel10);

                                    end;

                                'N11':
                                    begin

                                        l_strNivel11 := VerificarFacturaProveedor(rstProveedor."No.", l_strNivel11);

                                    end;

                            end;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'No. documento');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    begin

                                        l_strNivel1 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel1);

                                    end;

                                'N2':
                                    begin

                                        l_strNivel2 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel2);

                                    end;
                                'N3':
                                    begin

                                        l_strNivel3 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel3);

                                    end;

                                'N4':
                                    begin

                                        l_strNivel4 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel4);

                                    end;
                                'N5':
                                    begin

                                        l_strNivel5 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel5);

                                    end;
                                'N6':
                                    begin

                                        l_strNivel6 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel6);

                                    end;
                                'N7':
                                    begin

                                        l_strNivel7 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel7);

                                    end;

                                'N8':
                                    begin

                                        l_strNivel8 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel8);

                                    end;

                                'N9':
                                    begin

                                        l_strNivel9 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel9);

                                    end;

                                'N10':
                                    begin

                                        l_strNivel10 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel10);

                                    end;

                                'N11':
                                    begin

                                        l_strNivel11 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel11);

                                    end;

                            end;

                        rstCabCompra.Validate(rstCabCompra."Document Date");
                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'No. documento interno');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    l_strNivel1 := rstCabCompra."No.";
                                'N2':
                                    l_strNivel2 := rstCabCompra."No.";
                                'N3':
                                    l_strNivel3 := rstCabCompra."No.";
                                'N4':
                                    l_strNivel4 := rstCabCompra."No.";
                                'N5':
                                    l_strNivel5 := rstCabCompra."No.";
                                'N6':
                                    l_strNivel6 := rstCabCompra."No.";
                                'N7':
                                    l_strNivel7 := rstCabCompra."No.";
                                'N8':
                                    l_strNivel8 := rstCabCompra."No.";
                                'N9':
                                    l_strNivel9 := rstCabCompra."No.";
                                'N10':
                                    l_strNivel10 := rstCabCompra."No.";
                                'N11':
                                    l_strNivel11 := rstCabCompra."No.";

                            end;

                        strArchivoGenerado := GenerarNombreArchivo(l_strNivel1, l_strNivel2, l_strNivel3, l_strNivel4, l_strNivel5, l_strNivel6,
                                              l_strNivel7, l_strNivel8, l_strNivel9, l_strNivel10, l_strNivel11);


                        strRutaCompletaConArchivo := UpperCase(GenerarRutaCompleta(rstRutaDigitalizado, strArchivoGenerado + '.pdf', true));
                        rstInfoEmpresa.Reset;
                        rstInfoEmpresa.Get();
                        rstConfUsuario.Get(UserId);

                    end;

                rstRutaDigitalizado."Tipo documento"::"Factura pronto vencimiento":
                    begin

                        VerificarRelacion;
                        Clear(rstCabCompra);
                        rstCabCompra.SetRange("No.", strNivel8);
                        if rstCabCompra.FindFirst then;
                        Clear(rstConfCompras);
                        rstConfCompras.Get();

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'No. documento');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    begin

                                        l_strNivel1 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel1);

                                    end;

                                'N2':
                                    begin

                                        l_strNivel2 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel2);

                                    end;
                                'N3':
                                    begin

                                        l_strNivel3 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel3);

                                    end;

                                'N4':
                                    begin

                                        l_strNivel4 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel4);

                                    end;
                                'N5':
                                    begin

                                        l_strNivel5 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel5);

                                    end;
                                'N6':
                                    begin

                                        l_strNivel6 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel6);

                                    end;
                                'N7':
                                    begin

                                        l_strNivel7 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel7);

                                    end;

                                'N8':
                                    begin

                                        l_strNivel8 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel8);

                                    end;

                                'N9':
                                    begin

                                        l_strNivel9 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel9);

                                    end;

                                'N10':
                                    begin

                                        l_strNivel10 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel10);

                                    end;

                                'N11':
                                    begin

                                        l_strNivel11 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel11);

                                    end;


                            end;

                        rstCabCompra.Validate(rstCabCompra."Document Date");
                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'No. documento interno');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    begin

                                        l_strNivel1 := rstCabCompra."No.";

                                    end;

                                'N2':
                                    begin

                                        l_strNivel2 := rstCabCompra."No.";

                                    end;
                                'N3':
                                    begin

                                        l_strNivel3 := rstCabCompra."No.";

                                    end;

                                'N4':
                                    begin

                                        l_strNivel4 := rstCabCompra."No.";

                                    end;
                                'N5':
                                    begin

                                        l_strNivel5 := rstCabCompra."No.";

                                    end;
                                'N6':
                                    begin

                                        l_strNivel6 := rstCabCompra."No.";

                                    end;
                                'N7':
                                    begin

                                        l_strNivel7 := rstCabCompra."No.";

                                    end;

                                'N8':
                                    begin

                                        l_strNivel8 := rstCabCompra."No.";

                                    end;

                                'N9':
                                    begin

                                        l_strNivel9 := rstCabCompra."No.";

                                    end;

                                'N10':
                                    begin

                                        l_strNivel10 := rstCabCompra."No.";

                                    end;

                                'N11':
                                    begin

                                        l_strNivel11 := rstCabCompra."No.";

                                    end;

                            end;

                        strArchivoGenerado := GenerarNombreArchivo(l_strNivel1, l_strNivel2, l_strNivel3, l_strNivel4, l_strNivel5, l_strNivel6,
                                              l_strNivel7, l_strNivel8, l_strNivel9, l_strNivel10, l_strNivel11);

                        strRutaCompletaConArchivo := UpperCase(GenerarRutaCompleta(rstRutaDigitalizado, strArchivoGenerado + '.pdf', true));
                        rstConfUsuario.Get(UserId);

                    end;

                rstRutaDigitalizado."Tipo documento"::"Débito":
                    begin

                        VerificarRelacion;
                        Clear(rstCabCompra);
                        rstCabCompra.SetRange("No.", strNivel8);
                        if rstCabCompra.FindFirst then;
                        Clear(rstConfCompras);
                        rstConfCompras.Get();

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'No. documento');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    begin

                                        l_strNivel1 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel1);

                                    end;

                                'N2':
                                    begin

                                        l_strNivel2 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel2);

                                    end;
                                'N3':
                                    begin

                                        l_strNivel3 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel3);

                                    end;

                                'N4':
                                    begin

                                        l_strNivel4 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel4);

                                    end;
                                'N5':
                                    begin

                                        l_strNivel5 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel5);

                                    end;
                                'N6':
                                    begin

                                        l_strNivel6 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel6);

                                    end;
                                'N7':
                                    begin

                                        l_strNivel7 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel7);

                                    end;

                                'N8':
                                    begin

                                        l_strNivel8 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel8);

                                    end;

                                'N9':
                                    begin

                                        l_strNivel9 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel9);

                                    end;

                                'N10':
                                    begin

                                        l_strNivel10 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel10);

                                    end;

                                'N11':
                                    begin

                                        l_strNivel11 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel11);

                                    end;

                            end;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'No. documento interno');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    begin

                                        l_strNivel1 := rstCabCompra."No.";

                                    end;

                                'N2':
                                    begin

                                        l_strNivel2 := rstCabCompra."No.";

                                    end;
                                'N3':
                                    begin

                                        l_strNivel3 := rstCabCompra."No.";

                                    end;

                                'N4':
                                    begin

                                        l_strNivel4 := rstCabCompra."No.";

                                    end;
                                'N5':
                                    begin

                                        l_strNivel5 := rstCabCompra."No.";

                                    end;
                                'N6':
                                    begin

                                        l_strNivel6 := rstCabCompra."No.";

                                    end;
                                'N7':
                                    begin

                                        l_strNivel7 := rstCabCompra."No.";

                                    end;

                                'N8':
                                    begin

                                        l_strNivel8 := rstCabCompra."No.";

                                    end;

                                'N9':
                                    begin

                                        l_strNivel9 := rstCabCompra."No.";

                                    end;

                                'N10':
                                    begin

                                        l_strNivel10 := rstCabCompra."No.";

                                    end;

                                'N11':
                                    begin

                                        l_strNivel11 := rstCabCompra."No.";

                                    end;

                            end;

                        rstConfUsuario.Get(UserId);

                        strArchivoGenerado := GenerarNombreArchivo(l_strNivel1, l_strNivel2, l_strNivel3, l_strNivel4, l_strNivel5, l_strNivel6,
                                              l_strNivel7, l_strNivel8, l_strNivel9, l_strNivel10, l_strNivel11);

                        strRutaCompletaConArchivo := UpperCase(GenerarRutaCompleta(rstRutaDigitalizado, strArchivoGenerado + '.pdf', true));
                        Clear(rstInfoEmpresa);
                        rstInfoEmpresa.Get();

                    end;

                rstRutaDigitalizado."Tipo documento"::"Déb.Vto.":
                    begin

                        VerificarRelacion;
                        Clear(rstCabCompra);
                        rstCabCompra.SetRange("No.", strNivel8);
                        if rstCabCompra.FindFirst then;
                        Clear(rstConfCompras);

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'No. documento');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    begin

                                        l_strNivel1 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel1);

                                    end;

                                'N2':
                                    begin

                                        l_strNivel2 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel2);

                                    end;
                                'N3':
                                    begin

                                        l_strNivel3 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel3);

                                    end;

                                'N4':
                                    begin

                                        l_strNivel4 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel4);

                                    end;
                                'N5':
                                    begin

                                        l_strNivel5 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel5);

                                    end;
                                'N6':
                                    begin

                                        l_strNivel6 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel6);

                                    end;
                                'N7':
                                    begin

                                        l_strNivel7 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel7);

                                    end;

                                'N8':
                                    begin

                                        l_strNivel8 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel8);

                                    end;

                                'N9':
                                    begin

                                        l_strNivel9 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel9);

                                    end;

                                'N10':
                                    begin

                                        l_strNivel10 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel10);

                                    end;

                                'N11':
                                    begin

                                        l_strNivel11 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel11);

                                    end;

                            end;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'No. documento interno');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    begin

                                        l_strNivel1 := rstCabCompra."No.";

                                    end;

                                'N2':
                                    begin

                                        l_strNivel2 := rstCabCompra."No.";

                                    end;
                                'N3':
                                    begin

                                        l_strNivel3 := rstCabCompra."No.";

                                    end;

                                'N4':
                                    begin

                                        l_strNivel4 := rstCabCompra."No.";

                                    end;
                                'N5':
                                    begin

                                        l_strNivel5 := rstCabCompra."No.";

                                    end;
                                'N6':
                                    begin

                                        l_strNivel6 := rstCabCompra."No.";

                                    end;
                                'N7':
                                    begin

                                        l_strNivel7 := rstCabCompra."No.";

                                    end;

                                'N8':
                                    begin

                                        l_strNivel8 := rstCabCompra."No.";

                                    end;

                                'N9':
                                    begin

                                        l_strNivel9 := rstCabCompra."No.";

                                    end;

                                'N10':
                                    begin

                                        l_strNivel10 := rstCabCompra."No.";

                                    end;

                                'N11':
                                    begin

                                        l_strNivel11 := rstCabCompra."No.";

                                    end;

                            end;

                        rstConfUsuario.Get(UserId);

                        strArchivoGenerado := GenerarNombreArchivo(l_strNivel1, l_strNivel2, l_strNivel3, l_strNivel4, l_strNivel5, l_strNivel6,
                                                l_strNivel7, l_strNivel8, l_strNivel9, l_strNivel10, l_strNivel11);

                        strRutaCompletaConArchivo := UpperCase(GenerarRutaCompleta(rstRutaDigitalizado, strArchivoGenerado + '.pdf', true));
                        Clear(rstInfoEmpresa);
                        rstInfoEmpresa.Get();

                    end;

                rstRutaDigitalizado."Tipo documento"::"Crédito":
                    begin

                        VerificarRelacion;
                        Clear(rstCabCompra);
                        rstCabCompra.SetRange("No.", strNivel8);
                        Clear(rstConfCompras);
                        rstConfCompras.Get();

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'No. documento');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    begin

                                        l_strNivel1 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel1);

                                    end;

                                'N2':
                                    begin

                                        l_strNivel2 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel2);

                                    end;

                                'N3':
                                    begin

                                        l_strNivel3 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel3);

                                    end;

                                'N4':
                                    begin

                                        l_strNivel4 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel4);

                                    end;

                                'N5':
                                    begin

                                        l_strNivel5 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel5);

                                    end;

                                'N6':
                                    begin

                                        l_strNivel6 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel6);

                                    end;

                                'N7':
                                    begin

                                        l_strNivel7 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel7);

                                    end;

                                'N8':
                                    begin

                                        l_strNivel8 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel8);

                                    end;

                                'N9':
                                    begin

                                        l_strNivel9 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel9);

                                    end;

                                'N10':
                                    begin

                                        l_strNivel10 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel10);

                                    end;

                                'N11':
                                    begin

                                        l_strNivel11 := VerificarFacturaProveedor(rstCabCompra."Buy-from Vendor No.", l_strNivel11);

                                    end;

                            end;

                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'No. documento interno');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    begin

                                        l_strNivel1 := rstCabCompra."No.";

                                    end;

                                'N2':
                                    begin

                                        l_strNivel2 := rstCabCompra."No.";

                                    end;
                                'N3':
                                    begin

                                        l_strNivel3 := rstCabCompra."No.";

                                    end;

                                'N4':
                                    begin

                                        l_strNivel4 := rstCabCompra."No.";

                                    end;
                                'N5':
                                    begin

                                        l_strNivel5 := rstCabCompra."No.";

                                    end;
                                'N6':
                                    begin

                                        l_strNivel6 := rstCabCompra."No.";

                                    end;
                                'N7':
                                    begin

                                        l_strNivel7 := rstCabCompra."No.";

                                    end;

                                'N8':
                                    begin

                                        l_strNivel8 := rstCabCompra."No.";

                                    end;

                                'N9':
                                    begin

                                        l_strNivel9 := rstCabCompra."No.";

                                    end;

                                'N10':
                                    begin

                                        l_strNivel10 := rstCabCompra."No.";

                                    end;

                                'N11':
                                    begin

                                        l_strNivel11 := rstCabCompra."No.";

                                    end;

                            end;

                        rstConfUsuario.Get(UserId);
                        strArchivoGenerado := GenerarNombreArchivo(l_strNivel1, l_strNivel2, l_strNivel3, l_strNivel4, l_strNivel5, l_strNivel6,
                                              l_strNivel7, l_strNivel8, l_strNivel9, l_strNivel10, l_strNivel11);

                        strRutaCompletaConArchivo := UpperCase(GenerarRutaCompleta(rstRutaDigitalizado, strArchivoGenerado + '.pdf', true));
                        Clear(rstInfoEmpresa);
                        rstInfoEmpresa.Get();

                    end;

                rstRutaDigitalizado."Tipo documento"::Recibo:
                    begin

                        VerificarRelacion;
                        Clear(rstMovProveedor);
                        Clear(rstRutaDigitEspecifica);
                        rstRutaDigitEspecifica.SetRange("No.", rstRutaDigitalizado."No.");
                        rstRutaDigitEspecifica.SetRange("Descripción nivel", 'No. documento');
                        if rstRutaDigitEspecifica.Find('-') then
                            case rstRutaDigitEspecifica.Nivel of

                                'N1':
                                    begin

                                        l_strNivel1 := VerificarFacturaProveedor(l_strNivel4, l_strNivel1);

                                    end;

                                'N2':
                                    begin

                                        l_strNivel2 := VerificarFacturaProveedor(l_strNivel4, l_strNivel2);

                                    end;

                                'N3':
                                    begin

                                        l_strNivel3 := VerificarFacturaProveedor(l_strNivel4, l_strNivel3);

                                    end;

                                'N4':
                                    begin

                                        l_strNivel4 := VerificarFacturaProveedor(l_strNivel4, l_strNivel4);

                                    end;

                                'N5':
                                    begin

                                        l_strNivel5 := VerificarFacturaProveedor(l_strNivel4, l_strNivel5);

                                    end;

                                'N6':
                                    begin

                                        l_strNivel6 := VerificarFacturaProveedor(l_strNivel4, l_strNivel6);

                                    end;

                                'N7':
                                    begin

                                        l_strNivel7 := VerificarFacturaProveedor(l_strNivel4, l_strNivel7);

                                    end;

                                'N8':
                                    begin

                                        l_strNivel8 := VerificarFacturaProveedor(l_strNivel4, l_strNivel8);

                                    end;

                                'N9':
                                    begin

                                        l_strNivel9 := VerificarFacturaProveedor(l_strNivel4, l_strNivel9);

                                    end;

                                'N10':
                                    begin

                                        l_strNivel10 := VerificarFacturaProveedor(l_strNivel4, l_strNivel10);

                                    end;

                                'N11':
                                    begin

                                        l_strNivel11 := VerificarFacturaProveedor(l_strNivel4, l_strNivel11);

                                    end;

                            end;

                        strArchivoGenerado := GenerarNombreArchivo(l_strNivel1, l_strNivel2, l_strNivel3, l_strNivel4, l_strNivel5, l_strNivel6,
                                              l_strNivel7, l_strNivel8, l_strNivel9, l_strNivel10, l_strNivel11);

                    end;

            end;

        end;

        rstInfoEmpresa.Get();
        rstConfComprasyPagos.Get();

        strArchivoGenerado := GenerarNombreArchivo(l_strNivel1, l_strNivel2, l_strNivel3, l_strNivel4, l_strNivel5, l_strNivel6,
                              l_strNivel7, l_strNivel8, l_strNivel9, l_strNivel10, l_strNivel11);
        strRutaCompletaSinArchivo := UpperCase(GenerarRutaCompleta(rstRutaDigitalizado, '', false));
        strRutaCompletaConArchivo := UpperCase(GenerarRutaCompleta(rstRutaDigitalizado, strArchivoGenerado + '.pdf', true));

        if Exists(strRutaCompletaConArchivo) then begin

            if Confirm('Se ha encontrado un archivo con las características seleccionadas. ¿Desea abrir el archivo?\' +
                       'Si responde "No" y selecciona un nuevo archivo, éste se adjuntará al final del existente.', true) then begin
                /*
                Upgrade BC365
                Create(autShell, true, true);
                autShell.Open(strRutaCompletaConArchivo);
                Clear(autShell);
                */
                Hyperlink(strRutaCompletaConArchivo);
                exit;

            end
            else begin

                if blnPedirInteracción then begin


                    Clear(rstConfUsuario);
                    rstConfUsuario.Get(UserId);
                    intEscanearoImportaroRenombrar := StrMenu('Escanear y previsualizar,Escanear,Importar desde archivo,Renombrar archivo,Incorporar posteriormente',
                                                                rstConfUsuario."Acción estándar al digitalizar" + 1);
                    if intEscanearoImportaroRenombrar = 1 then begin

                        Escanear(rstRutaDigitalizado, true);

                    end;

                    if intEscanearoImportaroRenombrar = 2 then begin

                        Escanear(rstRutaDigitalizado, false);

                    end;

                    if intEscanearoImportaroRenombrar = 3 then begin

                        /*
                        strNombreArchivo := cduCommonControl.OpenFile('Importar '+rstRutaDigitalizado.Documento,
                                            '*.*',optFiletype::Custom,'',0);
                        */

                        Clear(cduFileManagement);
                        strNombreArchivo := cduFileManagement.UploadFile('Importar archivo', strNombreArchivo);

                        if strNombreArchivo <> '' then begin

                            CopiarArchivo(strRutaCompletaConArchivo, strNombreArchivo);

                        end;

                    end;

                end;

                if blnEscanear then begin

                    Escanear(rstRutaDigitalizado, false);

                end;

                if blnImportar then begin

                    if strArchivoExistente <> '' then
                        CopiarArchivo(strRutaCompletaConArchivo, strNombreArchivo);

                end;

            end;

        end
        else begin

            if blnPedirInteracción then begin

                Clear(rstConfUsuario);
                rstConfUsuario.Get(UserId);
                intEscanearoImportaroRenombrar := StrMenu('Escanear y previsualizar,Escanear,Importar desde archivo,Renombrar archivo,Incorporar posteriormente',
                                                            rstConfUsuario."Acción estándar al digitalizar" + 1);
                if intEscanearoImportaroRenombrar = 1 then begin

                    Escanear(rstRutaDigitalizado, true);

                end;

                if intEscanearoImportaroRenombrar = 2 then begin

                    Escanear(rstRutaDigitalizado, false);

                end;

                if intEscanearoImportaroRenombrar = 3 then begin


                    Clear(cduFileManagement);
                    strNombreArchivo := cduFileManagement.UploadFile('Importar archivo', strNombreArchivo);

                    if strNombreArchivo <> '*.*' then begin

                        CopiarArchivo(strRutaCompletaConArchivo, strNombreArchivo);

                    end
                    else
                        Error('Se ha cancelado el proceso');

                end;

                if intEscanearoImportaroRenombrar = 4 then begin

                    Clear(cduFileManagement);
                    strNombreArchivo := cduFileManagement.UploadFile('Importar archivo', strNombreArchivo);

                    strRutaCompletaConArchivo := PadStr(strRutaCompletaConArchivo, StrLen(strRutaCompletaConArchivo) - 4) +
                                                 CopyStr(strNombreArchivo, StrLen(strNombreArchivo) - 3, 4);
                    if strNombreArchivo <> '' then
                        RenombrarArchivo(strRutaCompletaConArchivo, strNombreArchivo);

                end;

            end;

            if blnEscanear then begin

                Escanear(rstRutaDigitalizado, false);

            end;

            if blnImportar then begin

                if strArchivoExistente <> '' then
                    CopiarArchivo(strRutaCompletaConArchivo, strNombreArchivo);

            end;

            if blnRenombrarArchivo then begin

                Clear(cduFileManagement);
                strNombreArchivo := cduFileManagement.UploadFile('Importar archivo', strNombreArchivo);

                if strNombreArchivo <> '' then
                    RenombrarArchivo(strRutaCompletaConArchivo, strNombreArchivo);

            end;

        end;

        if strNombreArchivo <> '' then
            Message('Se ha importado el archivo correctamente');


        Clear(rstDocumentosDigitalizados);
        if rstDocumentosDigitalizados.Find('+') then
            intLinea := rstDocumentosDigitalizados.Linea
        else
            intLinea := 1;

        if strRutaCompletaConArchivo <> '' then begin

            Clear(rstDocumentosDigitalizados);
            rstDocumentosDigitalizados.Linea := intLinea + 1;
            rstDocumentosDigitalizados.Archivo := strRutaCompletaConArchivo;
            rstDocumentosDigitalizados."Nivel 1" := l_strNivel1;
            rstDocumentosDigitalizados."Nivel 2" := l_strNivel2;
            rstDocumentosDigitalizados."Nivel 3" := l_strNivel3;
            rstDocumentosDigitalizados."Nivel 4" := l_strNivel4;
            rstDocumentosDigitalizados."Nivel 5" := l_strNivel5;
            rstDocumentosDigitalizados."Nivel 6" := l_strNivel6;
            rstDocumentosDigitalizados."Nivel 7" := l_strNivel7;
            rstDocumentosDigitalizados."Nivel 8" := l_strNivel8;
            rstDocumentosDigitalizados."Nivel 9" := l_strNivel9;
            rstDocumentosDigitalizados."Nivel 10" := l_strNivel10;
            rstDocumentosDigitalizados."Nivel 11" := l_strNivel11;
            rstDocumentosDigitalizados."Ruta específica" := Format(rstRutaDigitalizado."No.");
            rstDocumentosDigitalizados.Insert;

        end;

        exit(strRutaCompletaConArchivo);

    end;

    [Scope('OnPrem')]
    procedure Escanear(rstRutaDigitalizado: Record "Ruta digitalizacion depto/espe"; blnPrevisualizar: Boolean)
    var
        rstInfoempresa: Record "Company Information";
        strArchivo: Text[250];
        filArchivoEj: File;
        filArchivoEjDig: File;
        strProgreso: Label 'Oprima cancelar si desea detener el proceso..@1@@@@@@@@@@@@@@@';
        intValorMinimo: Integer;
        intValorMaximo: Integer;
        strTexto: Text[250];
        i: Integer;
        strNombreArchivo: Text[250];
        autShell2: Codeunit ExecuteShellCommand;
        l_rstUS: Record "User Setup";
        strRutaCompletaConArchivo: Text;
    begin
        /*
        if IsServiceTier then
#pragma warning disable AL0118 // TODO: - Migración
            Create(autWsh, true, true)
#pragma warning restore AL0118 // TODO: - Migración
        else
            Create(autWsh, true);
        */
        if Confirm('¿Desea usar un escáner?', true) then begin
            Clear(rstInfoempresa);
            rstInfoempresa.Get();
            if strArchivo_pre <> '' then
                strArchivo := strArchivo_pre
            else begin
                strArchivo := '';
                strArchivo := UpperCase(GenerarRutaCompleta(rstRutaDigitalizado, strArchivoGenerado + '.pdf', true));
                ;
            end;
            Clear(rstInfoempresa);
            rstInfoempresa.Get();
            if strArchivo_pre <> '' then
                strArchivo := strArchivo_pre
            else begin

                strArchivo := '';
                strArchivo := UpperCase(GenerarRutaCompleta(rstRutaDigitalizado, strArchivoGenerado + '.pdf', true));
                ;

            end;

            //strNombreArchivo := Format(autWsh.ExpandEnvironmentStrings('%TEMP%')) + '\temp' + '.bat';
            strNombreArchivo := Format(autShell2.ExecuteShellCommand('%TEMP%', '')) + '\temp' + '.bat';

            Clear(filArchivoEjDig);
            filArchivoEjDig.CreateTempFile;
            strNombreArchivo := filArchivoEjDig.Name + '.bat';
            filArchivoEjDig.Close;
            Clear(filArchivoEj);
            filArchivoEj.Create(strNombreArchivo);
            filArchivoEj.TextMode(true);
            //filArchivoEj.WRITEMODE(TRUE);
            //filArchivoEj.OPEN(strNombreArchivo);

            if l_strNivel8 = '' then
                l_strNivel8 := l_strNivel6;

            if l_strNivel8 = '' then
                l_strNivel8 := 'BLANK';

            Clear(l_rstUS);
            l_rstUS.Get(UserId);
            blnFB := l_rstUS."Usar flatbed";
            for i := 1 to 1 do begin

                //filArchivoEj.OPEN(strNombreArchivo);
                filArchivoEj.Seek(filArchivoEj.Len);
                if i = 1 then begin

                    if blnFB then begin

                        if blnPrevisualizar then
                            filArchivoEj.Write(rstInfoempresa."Ruta ejecutable digitalizacion" + rstInfoempresa."Ruta cabecera digitalizacion" + '\' + 'digitalizaryrevisarfb.bat ' + '"' + strArchivo + '"' + ' ' +
                                                '"' + l_strNivel8 + '"')
                        else
                            filArchivoEj.Write(rstInfoempresa."Ruta ejecutable digitalizacion" + rstInfoempresa."Ruta cabecera digitalizacion" + '\' + 'digitalizarfb.bat ' + '"' + strArchivo + '"' + ' ' +
                                                '"' + l_strNivel8 + '"')

                    end
                    else begin

                        if blnPrevisualizar then
                            filArchivoEj.Write(rstInfoempresa."Ruta ejecutable digitalizacion" + rstInfoempresa."Ruta cabecera digitalizacion" + '\' + 'digitalizaryrevisar.bat ' + '"' + strArchivo + '"' + ' ' +
                                                '"' + l_strNivel8 + '"')
                        else
                            filArchivoEj.Write(rstInfoempresa."Ruta ejecutable digitalizacion" + rstInfoempresa."Ruta cabecera digitalizacion" + '\' + 'digitalizar.bat ' + '"' + strArchivo + '"' + ' ' +
                                                '"' + l_strNivel8 + '"')

                    end;

                end;

                filArchivoEj.Close;

            end;

            Clear(cduFileManagement);
            strNombreArchivo := cduFileManagement.DownloadTempFile(strNombreArchivo);

#pragma warning disable AL0118 // TODO: - Migración
            /*
            Create(autShell, true, true);
#pragma warning restore AL0118 // TODO: - Migración
            autShell.Open(strNombreArchivo);
            Clear(autShell);
            */
            if StrPos(strArchivo, rstInfoempresa."Ruta ejecutable digitalizacion" + rstInfoempresa."Ruta cabecera digitalizacion" + '\') <> 0 then begin

                strArchivo := CopyStr(strArchivo, 1, StrLen(rstInfoempresa."Ruta ejecutable digitalizacion" + rstInfoempresa."Ruta cabecera digitalizacion")) +
                                CopyStr(strArchivo, StrLen(rstInfoempresa."Ruta ejecutable digitalizacion" + rstInfoempresa."Ruta cabecera digitalizacion") + 2, 250);

            end;
        end
        else begin
            if Exists(strArchivo_pre) then begin
                //IF CONFIRM('Desea agregar un PDF al PDF existente?',TRUE) THEN
                //BEGIN
                Clear(cduFileManagement);
                if cduFileManagement.ServerFileExists(strNombreArchivo) then
                    cduFileManagement.DeleteServerFile(strNombreArchivo);
                strNombreArchivo := cduFileManagement.UploadFile('Importar archivo', strNombreArchivo);
                if strNombreArchivo <> '' then begin
                    //CopiarArchivo(strRutaCompletaConArchivo,strNombreArchivo);
                    fntAddPDF(strArchivo_pre, strNombreArchivo);
                end;
                Message('Se ha importado el archivo correctamente');
                exit;
            end;
        end;
        if StrLen(strNombreArchivo) <> 0 then
            if CopyStr(strNombreArchivo, StrLen(strNombreArchivo) - 2, 3) <> 'bat' then
                CrearLink(strNombreArchivo)
            else
                CrearLink(strArchivo);
    end;

    [Scope('OnPrem')]
    procedure SolicitarNivel(codNivel: Code[3]; rstRutaDigitalizado: Record "Ruta digitalizacion depto/espe"; rstArchivo: Record "Específicos por ruta"; strArchivoGenerado: Text[255]): Text[255]
    var
        dlgIngreseDocumento: Page "Input Nivel";
        strNivel: Code[250];
    begin
        dlgIngreseDocumento.SetNivel(rstArchivo."Descripción nivel");
        If dlgIngreseDocumento.RunModal() = Action::OK then
            strNivel := dlgIngreseDocumento.GetNivel();
        dlgIngreseDocumento.Close;
        exit(strNivel);
    end;

    [Scope('OnPrem')]
    procedure GenerarDocumento()
    begin
    end;

    [Scope('OnPrem')]
    procedure VerificarFacturaProveedor(codProveedor: Code[20]; codFactura: Code[20]): Code[20]
    var
        rstConfCompras: Record "Purchases & Payables Setup";
        rstProveedor: Record Vendor;
        primeraparte: Code[50];
        segundaparte: Code[50];
        terceraparte: Code[50];
        posicion: Integer;
        resto: Code[50];
        parte2: Integer;
        parte3: Integer;
        Departamento: Record "Country/Region Translation";
        Proyecto: Record Job;
        pasa: Boolean;
        rstCompany: Record "Company Information";
        i: Integer;
    begin
        //US.ARBU - 20050407 - Inicio - Si el proveedor es nacional, que verifique el formato del No. de factura

        Clear(rstConfCompras);
        Clear(rstProveedor);

        rstConfCompras.Get();
        rstProveedor.Get(codProveedor);

        if (rstProveedor."Vendor Posting Group" <> rstConfCompras."Grupo Contable Importaciones") and
           (rstProveedor."No." <> rstConfCompras."Proveedor Aduana Exterior") and rstProveedor."Comprobar No.factura proveedor" then begin

            pasa := false;
            posicion := StrPos(codFactura, '-');
            if posicion = 0 then
                if Confirm('Factura no corresponde al formato LNNNNN-NNNNNNNN.\ Desea continuar?') then
                    pasa := true
                else
                    Error('Operación cancelada');

            if not pasa then begin

                primeraparte := CopyStr(codFactura, 1, 1);
                resto := CopyStr(codFactura, 2, StrLen(codFactura));
                segundaparte := CopyStr(resto, 1, (posicion - 2));
                resto := CopyStr(resto, (posicion), (StrLen(resto)));
                terceraparte := resto;

            end;

            // Comprobamos que el primer caracter es una letra
            if (primeraparte < 'A') or (primeraparte > 'Z') then begin
                if not pasa then
                    if Confirm('Factura no corresponde al formato LNNNNN-NNNNNNNN.\ Desea continuar?') then
                        pasa := true
                    else
                        Error('Operación cancelada');
            end;

            // Comprobamos que los cuatro siguiente caracteres son numéricos y rellenamos con 0 hasta el cuarto
            if not (Evaluate(parte2, segundaparte)) then begin
                if not pasa then
                    if Confirm('Factura no corresponde al formato LNNNNN-NNNNNNNN.\ Desea continuar?') then
                        pasa := true
                    else
                        Error('Operación cancelada');
            end
            else begin
                if not pasa then
                    case StrLen(segundaparte) of
                        1:
                            segundaparte := '0000' + segundaparte;
                        2:
                            segundaparte := '000' + segundaparte;
                        3:
                            segundaparte := '00' + segundaparte;
                        4:
                            segundaparte := '0' + segundaparte;
                    end;
            end;

            // Comprobamos que los 8 siguientes caracteres al - son numéricos y rellenamos con 0 hasta el octavo
            if not (Evaluate(parte3, terceraparte)) then begin
                if not pasa then
                    if Confirm('Factura no corresponde al formato LNNNNN-NNNNNNNN.\ Desea continuar?') then
                        pasa := true
                    else
                        Error('Operación cancelada');
            end
            else begin
                if StrLen(terceraparte) = 1 then
                    terceraparte := '0000000' + terceraparte
                else
                    if StrLen(terceraparte) = 2 then
                        terceraparte := '000000' + terceraparte
                    else
                        if StrLen(terceraparte) = 3 then
                            terceraparte := '00000' + terceraparte
                        else
                            if StrLen(terceraparte) = 4 then
                                terceraparte := '0000' + terceraparte
                            else
                                if StrLen(terceraparte) = 5 then
                                    terceraparte := '000' + terceraparte
                                else
                                    if StrLen(terceraparte) = 6 then
                                        terceraparte := '00' + terceraparte
                                    else
                                        if StrLen(terceraparte) = 7 then
                                            terceraparte := '0' + terceraparte
                                        else
                                            if StrLen(terceraparte) > 8 then
                                                if Confirm('Factura no corresponde al formato LNNNNN-NNNNNNNN.\ Desea continuar?') then
                                                    pasa := true
                                                else
                                                    Error('Operación cancelada');
            end;
            // formamos el campo con todas las partes

            if not pasa then
                codFactura := primeraparte + segundaparte + '-' + terceraparte;

        end;

        codDocumento := '';
        codDocumento := codFactura;

        exit(codFactura);

        //US.ARBU - 20050407 - Inicio - Si el proveedor es nacional, que verifique el formato del No. de factura
    end;

    [Scope('OnPrem')]
    procedure GenerarNombreArchivo(l_strNivel1: Code[20]; l_strNivel2: Code[20]; l_strNivel3: Code[30]; l_strNivel4: Code[20]; l_strNivel5: Code[30]; l_strNivel6: Code[30]; l_strNivel7: Code[30]; l_strNivel8: Code[30]; l_strNivel9: Code[30]; l_strNivel10: Code[30]; l_strNivel11: Code[30]): Code[250]
    var
        rstInfoEmpresa: Record "Company Information";
    begin

        strArchivoGenerado := '';

        if l_strNivel1 <> '' then
            strArchivoGenerado := strArchivoGenerado + '_' + 'N1' + '_' + l_strNivel1;
        if l_strNivel2 <> '' then
            strArchivoGenerado := strArchivoGenerado + '_' + 'N2' + '_' + l_strNivel2;
        if l_strNivel3 <> '' then
            strArchivoGenerado := strArchivoGenerado + '_' + 'N3' + '_' + l_strNivel3;
        if l_strNivel4 <> '' then
            strArchivoGenerado := strArchivoGenerado + '_' + 'N4' + '_' + l_strNivel4;
        if l_strNivel5 <> '' then
            strArchivoGenerado := strArchivoGenerado + '_' + 'N5' + '_' + l_strNivel5;
        if l_strNivel6 <> '' then
            strArchivoGenerado := strArchivoGenerado + '_' + 'N6' + '_' + l_strNivel6;
        if l_strNivel7 <> '' then
            strArchivoGenerado := strArchivoGenerado + '_' + 'N7' + '_' + l_strNivel7;
        if l_strNivel8 <> '' then
            strArchivoGenerado := strArchivoGenerado + '_' + 'N8' + '_' + l_strNivel8;
        if l_strNivel9 <> '' then
            strArchivoGenerado := strArchivoGenerado + '_' + 'N9' + '_' + l_strNivel9;
        if l_strNivel10 <> '' then
            strArchivoGenerado := strArchivoGenerado + '_' + 'N10' + '_' + l_strNivel10;
        if l_strNivel11 <> '' then
            strArchivoGenerado := strArchivoGenerado + '_' + 'N11' + '_' + l_strNivel11;

        strArchivoGenerado := DelChr(strArchivoGenerado, '=', '/,');

        Clear(rstInfoEmpresa);
        rstInfoEmpresa.Get();
        if rstInfoEmpresa.Paralelo then
            strArchivoGenerado := strArchivoGenerado + '!'
        else
            strArchivoGenerado := strArchivoGenerado;
        exit(strArchivoGenerado);
    end;

    [Scope('OnPrem')]
    procedure CompletarNiveles("rstNivelesEspecíficos": Record "Específicos por ruta"; var l_strNivel1: Code[20]; var l_strNivel2: Code[20]; var l_strNivel3: Code[30]; var l_strNivel4: Code[20]; var l_strNivel5: Code[20]; var l_strNivel6: Code[30]; var l_strNivel7: Code[30]; var l_strNivel8: Code[30]; var l_strNivel9: Code[30]; var l_strNivel10: Code[30]; var l_strNivel11: Code[30]): Boolean
    var
        strNiveles: array[11] of Text[50];
        strTitulos: array[11] of Text[50];
        frmCompletarNiveles: Page "Nomenclatura archivos";
        i: Integer;
        rstNiveles: Record "Específicos por ruta";
    begin
        for i := 1 to 11 do begin

            strNiveles[i] := '';
            strTitulos[i] := '';

        end;

        strNiveles[1] := l_strNivel1;
        strNiveles[2] := l_strNivel2;
        strNiveles[3] := l_strNivel3;
        strNiveles[4] := l_strNivel4;
        strNiveles[5] := l_strNivel5;
        strNiveles[6] := l_strNivel6;
        strNiveles[7] := l_strNivel7;
        strNiveles[8] := l_strNivel8;
        strNiveles[9] := l_strNivel9;
        strNiveles[10] := l_strNivel10;
        strNiveles[11] := l_strNivel11;

        i := 0;

        Clear(rstNiveles);
        rstNiveles.SetRange(rstNiveles."No.", rstNivelesEspecíficos."No.");
        if rstNiveles.Find('-') then
            repeat

                i += 1;
                strTitulos[i] := rstNiveles."Descripción nivel";

            until rstNiveles.Next = 0;

        Clear(frmCompletarNiveles);
        frmCompletarNiveles.fntAbrirConNiveles(strTitulos, strNiveles, rstNivelesEspecíficos);
        frmCompletarNiveles.Editable(true);
        frmCompletarNiveles.LookupMode := true;
        if frmCompletarNiveles.RunModal = ACTION::LookupOK then begin

            frmCompletarNiveles.fntDevolverNombre(strNiveles, blnFB);

            l_strNivel1 := strNiveles[1];
            l_strNivel2 := strNiveles[2];
            l_strNivel3 := strNiveles[3];
            l_strNivel4 := strNiveles[4];
            l_strNivel5 := strNiveles[5];
            l_strNivel6 := strNiveles[6];
            l_strNivel7 := strNiveles[7];
            l_strNivel8 := strNiveles[8];
            l_strNivel9 := strNiveles[9];
            l_strNivel10 := strNiveles[10];
            l_strNivel11 := strNiveles[11];
            exit(true);

        end
        else
            exit(false);
    end;

    [Scope('OnPrem')]
    procedure VerificarRemitoCliente(codRemito: Code[20]): Code[20]
    var
        rstConfCompras: Record "Purchases & Payables Setup";
        rstProveedor: Record Vendor;
        primeraparte: Code[50];
        segundaparte: Code[50];
        terceraparte: Code[50];
        posicion: Integer;
        resto: Code[50];
        parte2: Integer;
        parte3: Integer;
        Departamento: Record "Country/Region Translation";
        Proyecto: Record Job;
        pasa: Boolean;
    begin
        pasa := false;
        posicion := StrPos(codRemito, '-');
        if posicion = 0 then
            if Confirm('Factura no corresponde al formato LNNNNN-NNNNNNNN.\ Desea continuar?') then
                pasa := true
            else
                Error('Operación cancelada');

        if not pasa then begin

            primeraparte := CopyStr(codRemito, 1, 1);
            resto := CopyStr(codRemito, 2, StrLen(codRemito));
            segundaparte := CopyStr(resto, 1, (posicion - 2));
            resto := CopyStr(resto, (posicion), (StrLen(resto)));
            terceraparte := resto;

        end;

        // Comprobamos que el primer caracter es una letra
        if (primeraparte < 'A') or (primeraparte > 'Z') then begin
            if not pasa then
                if Confirm('Factura no corresponde al formato LNNNNN-NNNNNNNN.\ Desea continuar?') then
                    pasa := true
                else
                    Error('Operación cancelada');
        end;

        // Comprobamos que los cuatro siguiente caracteres son numéricos y rellenamos con 0 hasta el cuarto
        if not (Evaluate(parte2, segundaparte)) then begin
            if not pasa then
                if Confirm('Factura no corresponde al formato LNNNNN-NNNNNNNN.\ Desea continuar?') then
                    pasa := true
                else
                    Error('Operación cancelada');
        end
        else begin
            if not pasa then begin
                if StrLen(segundaparte) = 1 then
                    segundaparte := '0000' + segundaparte
                else
                    if StrLen(segundaparte) = 2 then
                        segundaparte := '000' + segundaparte
                    else
                        if StrLen(segundaparte) = 3 then
                            segundaparte := '00' + segundaparte
                        else
                            if StrLen(segundaparte) = 4 then
                                segundaparte := '0' + segundaparte;
            end;
        end;

        // Comprobamos que los 8 siguientes caracteres al - son numéricos y rellenamos con 0 hasta el octavo
        if not (Evaluate(parte3, terceraparte)) then begin
            if not pasa then
                if Confirm('Factura no corresponde al formato LNNNNN-NNNNNNNN.\ Desea continuar?') then
                    pasa := true
                else
                    Error('Operación cancelada');
        end
        else begin
            if StrLen(terceraparte) = 1 then
                terceraparte := '0000000' + terceraparte
            else
                if StrLen(terceraparte) = 2 then
                    terceraparte := '000000' + terceraparte
                else
                    if StrLen(terceraparte) = 3 then
                        terceraparte := '00000' + terceraparte
                    else
                        if StrLen(terceraparte) = 4 then
                            terceraparte := '0000' + terceraparte
                        else
                            if StrLen(terceraparte) = 5 then
                                terceraparte := '000' + terceraparte
                            else
                                if StrLen(terceraparte) = 6 then
                                    terceraparte := '00' + terceraparte
                                else
                                    if StrLen(terceraparte) = 7 then
                                        terceraparte := '0' + terceraparte
                                    else
                                        if StrLen(terceraparte) > 8 then
                                            if Confirm('Factura no corresponde al formato LNNNNN-NNNNNNNN.\ Desea continuar?') then
                                                pasa := true
                                            else
                                                Error('Operación cancelada');
        end;
        // formamos el campo con todas las partes

        if not pasa then
            codRemito := primeraparte + segundaparte + '-' + terceraparte;

        exit(codRemito);
    end;

    [Scope('OnPrem')]
    procedure VerificarRelacion()
    var
        rstRelacionSeguridad: Record "Relación seguridad";
        rstConfUsu: Record "User Setup";
    begin
        Clear(rstConfUsu);
        rstConfUsu.Get(UserId);
        Clear(rstRelacionSeguridad);
        rstRelacionSeguridad.SetRange(rstRelacionSeguridad."Grupo Origen", rstConfUsu.Grupo);
        rstRelacionSeguridad.SetRange("Grupo Destino", l_strNivel3);
        if rstConfUsu.Grupo <> l_strNivel3 then begin

            if not rstRelacionSeguridad.Find('-') then
                Error('No existe una relación de serguridad habilitada entre %1 y %2', rstConfUsu.Grupo, l_strNivel3);

        end;
    end;

    [Scope('OnPrem')]
    procedure PreCompletarNiveles(l_strNivel1_pre: Code[20]; l_strNivel2_pre: Code[20]; l_strNivel3_pre: Code[30]; l_strNivel4_pre: Code[20]; l_strNivel5_pre: Code[20]; l_strNivel6_pre: Code[30]; l_strNivel7_pre: Code[30]; l_strNivel8_pre: Code[30]; l_strNivel9_pre: Code[30]; l_strNivel10_pre: Code[30]; l_strNivel11_pre: Code[30]; l_strArchivo_pre: Text[1024])
    begin
        l_strNivel1 := l_strNivel1_pre;
        l_strNivel2 := l_strNivel2_pre;
        l_strNivel3 := l_strNivel3_pre;
        l_strNivel4 := l_strNivel4_pre;
        l_strNivel5 := l_strNivel5_pre;
        l_strNivel6 := l_strNivel6_pre;
        l_strNivel7 := l_strNivel7_pre;
        l_strNivel8 := l_strNivel8_pre;
        l_strNivel9 := l_strNivel9_pre;
        l_strNivel10 := l_strNivel10_pre;
        l_strNivel11 := l_strNivel11_pre;
        strArchivo_pre := l_strArchivo_pre;
    end;

    [Scope('OnPrem')]
    procedure RetornarRutaLocal(strArchivo: Text[1024]) strArchivoLocal: Text
    var
        rstInfoEmpresa: Record "Company Information";
    begin
        Clear(rstInfoEmpresa);
        rstInfoEmpresa.Get();
        strArchivoLocal := 'about:blank';
        if strArchivo <> '' then
            strArchivoLocal := rstInfoEmpresa."Ruta Intranet" + (ConvertStr(CopyStr(strArchivo,
                                                                       StrLen(rstInfoEmpresa."Ruta de digitalizacion"), 1024), '\', '/'))
        else
            strArchivoLocal := 'about:blank';
    end;

    [Scope('OnPrem')]
    procedure CrearLink(strArchivo: Text[250])
    var
        rstPH: Record "Purchase Header";
        rstSH: Record "Sales Header";
        rstV: Record Vendor;
        rstC: Record Customer;
        rstJ: Record Job;
        rstP: Record "Produccion Planta";
        rstCI: Record "Company Information";
        rstVC: Record "Cab. Vale consumo";
        rstDCL: Record "Cab. DCL";
        rstCD: Record "Cab. descarga";
        rstAF: Record "Fixed Asset";
    begin
        Clear(rstCI);
        rstCI.Get;
        if CopyStr(strArchivo, 1, 2) = '\\' then
            TraerHTMLInternet(strArchivo, strArchivo);

        l_strNivel1 := UpperCase(l_strNivel1);
        case l_strNivel1 of

            'RECIBO':
                begin

                    Clear(rstV);
                    if rstV.Get(l_strNivel4) then begin

                        rstV.AddLink(strArchivo, 'Recibo ' + l_strNivel4 + ' - ' + l_strNivel7);

                    end;

                end;
            'FACTURAS', 'FACTURA':
                begin

                    Clear(rstV);
                    if rstV.Get(l_strNivel4) then begin

                        rstV.AddLink(strArchivo, 'Factura ' + l_strNivel6 + ' - ' + l_strNivel7);

                    end;

                    Clear(rstPH);
                    if rstPH.Get(rstPH."Document Type"::Invoice, l_strNivel8) then begin

                        rstPH.AddLink(strArchivo, 'Factura ' + l_strNivel6 + ' - ' + l_strNivel8);

                    end;

                    Clear(rstPH);
                    if rstPH.Get(rstPH."Document Type"::Invoice, l_strNivel6) then begin

                        Clear(rstV);
                        if rstV.Get(l_strNivel4) then begin

                            rstPH.AddLink(strArchivo, 'Factura ' + rstPH."Vendor Invoice No.");
                            rstV.AddLink(strArchivo, 'Factura ' + l_strNivel6 + ' - ' + l_strNivel4);

                        end;

                    end;

                end;
            'REMITOS.V':
                begin

                    Clear(rstSH);
                    if rstSH.Get(l_strNivel8) then begin

                        rstSH.AddLink(strArchivo, 'Remito ' + l_strNivel6 + ' - Pedido ' + l_strNivel8);

                    end;
                end;
            'REMITOS', 'REMITO.I':
                begin

                    Clear(rstV);
                    if rstV.Get(l_strNivel4) then begin

                        rstV.AddLink(strArchivo, 'Remito ' + l_strNivel6 + ' - ' + l_strNivel8);

                    end;
                    Clear(rstPH);
                    if rstPH.Get(rstPH."Document Type"::Order, l_strNivel8) then begin

                        rstPH.AddLink(strArchivo, 'Remito ' + l_strNivel6 + ' - ' + l_strNivel8);

                    end;
                    Clear(rstCD);
                    if rstCD.Get(l_strNivel4) then begin

                        rstCD.AddLink(strArchivo, 'Remito ' + l_strNivel4 + ' - ' + l_strNivel8);

                    end;

                end;
            'CONSUMO':
                begin

                    Clear(rstVC);
                    rstVC.SetRange("No. documento", l_strNivel4);
                    if rstVC.FindLast then
                        rstVC.AddLink(strArchivo, 'Consumo ' + l_strNivel4);

                end;
            'EGRESOS':
                begin

                    Clear(rstC);
                    if rstC.Get(l_strNivel4) then begin

                        rstC.AddLink(strArchivo, 'Egresos ' + l_strNivel6 + ' - ' + l_strNivel8);

                    end;

                end;
            'CREDITO':
                begin

                    Clear(rstPH);
                    if rstPH.Get(rstPH."Document Type"::"Credit Memo", l_strNivel8) then begin

                        Clear(rstV);
                        if rstV.Get(l_strNivel4) then begin

                            rstPH.AddLink(rstPH."Archivo vinculado", 'Nota crédito ' + rstPH."Vendor Cr. Memo No.");
                            rstV.AddLink(strArchivo, 'Nota crédito ' + l_strNivel6 + ' - ' + l_strNivel8);

                        end;

                    end;

                end;
            'DEBITO':
                begin

                    Clear(rstPH);
                    if rstPH.Get(rstPH."Document Type"::Invoice, l_strNivel8) then begin

                        Clear(rstV);
                        if rstV.Get(l_strNivel4) then begin

                            rstPH.AddLink(rstPH."Archivo vinculado", 'Nota débito ' + rstPH."Vendor Invoice No.");
                            rstV.AddLink(strArchivo, 'Nota débito ' + l_strNivel6 + ' - ' + l_strNivel8);

                        end;

                    end;

                end;
            'DESPACHO':
                begin

                    Clear(rstPH);
                    if rstPH.Get(rstPH."Document Type"::Invoice, l_strNivel8) then begin

                        Clear(rstV);
                        if rstV.Get(l_strNivel4) then begin

                            rstPH.AddLink(rstPH."Archivo vinculado", 'Despacho ' + rstPH."Vendor Invoice No.");
                            rstV.AddLink(strArchivo, 'Despacho ' + l_strNivel6 + ' - ' + l_strNivel8);

                        end;

                    end;

                end;
            'PRODUCCION':
                begin

                    Clear(rstP);
                    rstP.SetRange("No. documento", l_strNivel8);
                    if rstP.FindFirst then begin

                        rstP.AddLink(strArchivo, 'Orden de Produccion ' + l_strNivel8);

                    end;

                end;
            'PLANILLA.TUNEL':
                begin

                    Clear(rstP);
                    rstP.SetRange("No. documento", l_strNivel8);
                    if rstP.FindFirst then begin

                        rstP.AddLink(strArchivo, 'Orden de Produccion ' + l_strNivel8);

                    end;

                end;
            'BL':
                begin

                    Clear(rstPH);
                    if rstPH.Get(rstPH."Document Type"::Order, l_strNivel8) then begin

                        Clear(rstV);
                        if rstV.Get(l_strNivel4) then begin

                            rstPH.AddLink(rstPH."Archivo vinculado", 'BL ' + rstPH."Transaction Type");
                            rstV.AddLink(strArchivo, 'BL ' + l_strNivel6 + ' - ' + l_strNivel8);

                        end;

                    end;

                end;

            'LIQ.BCO', 'LIQ. BANCO':
                begin

                    Clear(rstV);
                    if rstV.Get(l_strNivel4) then begin

                        rstV.AddLink(strArchivo, 'Liq. banco ' + l_strNivel6);

                    end;

                end;
            'COMPR.PESAJE':
                begin

                    Clear(rstJ);
                    if rstJ.Get(l_strNivel4) then begin

                        rstJ.AddLink(strArchivo, 'Comprobante de pesaje ' + l_strNivel6);

                    end;

                end;
            'CAPITAN':
                begin

                    Clear(rstJ);
                    if rstJ.Get(l_strNivel4) then begin

                        rstJ.AddLink(strArchivo, 'Capitán ' + l_strNivel6);

                    end;

                end;
            'CONSTANCIA':
                begin

                    Clear(rstV);
                    if rstV.Get(l_strNivel4) then begin

                        rstV.AddLink(strArchivo, 'Constancia ' + l_strNivel6);

                    end;

                end;
            'RECIBOS':
                begin

                    Clear(rstV);
                    if rstV.Get(l_strNivel4) then begin

                        rstV.AddLink(strArchivo, 'Recibo ' + l_strNivel6);

                    end;

                end;


            'IIBB':
                begin

                    Clear(rstV);
                    if rstV.Get(l_strNivel4) then begin

                        rstV.AddLink(strArchivo, 'Comprobante para IIBB ' + l_strNivel6);

                    end;

                end;

            'PARTE.MARITIMO':
                begin

                    Clear(rstJ);
                    if rstJ.Get(l_strNivel4) then begin

                        rstJ.AddLink(strArchivo, 'Parte Marítimo ' + l_strNivel6);

                    end;
                    Clear(rstCD);
                    if rstCD.Get(l_strNivel4) then begin

                        rstCD.AddLink(strArchivo, 'Parte marítimo ' + l_strNivel6);

                    end;
                end;


            'INFO.DESCARGA':
                begin

                    Clear(rstJ);
                    if rstJ.Get(l_strNivel4) then begin

                        rstJ.AddLink(strArchivo, 'Info descarga ' + l_strNivel6);

                    end;

                    Clear(rstCD);
                    if rstCD.Get(l_strNivel4) then begin

                        rstCD.AddLink(strArchivo, 'Info descarga ' + l_strNivel6);

                    end;
                end;

            'DCL':
                begin

                    Clear(rstJ);
                    if rstJ.Get(l_strNivel4) then begin

                        rstJ.AddLink(strArchivo, 'Parte Marítimo ' + l_strNivel6);

                    end;

                    Clear(rstDCL);
                    if rstDCL.Get(l_strNivel4) then begin

                        rstDCL.AddLink(strArchivo, 'DCL ' + l_strNivel4);

                    end;
                end;

            'PARTE.PESCA.FINAL':
                begin

                    Clear(rstJ);
                    if rstJ.Get(l_strNivel4) then begin

                        rstJ.AddLink(strArchivo, 'Parte de pesca final ' + l_strNivel6);

                    end;

                    Clear(rstCD);
                    if rstCD.Get(l_strNivel4) then begin

                        rstCD.AddLink(strArchivo, 'Parte de pesca final ' + l_strNivel6);

                    end;
                end;

            'CONTROL.PESAJE':
                begin

                    Clear(rstJ);
                    if rstJ.Get(l_strNivel4) then begin

                        rstJ.AddLink(strArchivo, 'Control de pesaje ' + l_strNivel6);

                    end;

                    Clear(rstCD);
                    if rstCD.Get(l_strNivel4) then begin

                        rstCD.AddLink(strArchivo, 'Control de pesaje ' + l_strNivel6);

                    end;
                end;

            'ACTA.DESCARGA', 'DESCARGA':
                begin

                    Clear(rstJ);
                    if rstJ.Get(l_strNivel4) then begin
                        rstJ.AddLink(strArchivo, 'Acta de descarga ' + l_strNivel6);
                    end;
                    Clear(rstCD);
                    if rstCD.Get(l_strNivel4) then begin
                        rstCD.AddLink(strArchivo, 'Acta de descarga ' + l_strNivel6);
                    end;

                end;

            'GUIA.TRANSPORTE':
                begin

                    Clear(rstJ);
                    if rstJ.Get(l_strNivel4) then begin

                        rstJ.AddLink(strArchivo, 'Guía de transporte ' + l_strNivel6);

                    end;
                    Clear(rstCD);
                    if rstCD.Get(l_strNivel4) then begin

                        rstCD.AddLink(strArchivo, 'Guía de transporte ' + l_strNivel6);

                    end;

                end;

            'CONTRATO':
                begin

                    Clear(rstJ);
                    if rstJ.Get(l_strNivel4) then begin

                        rstJ.AddLink(strArchivo, 'Contrato ' + l_strNivel6);

                    end;

                end;
            'ACTIVOSFIJOS':
                begin

                    Clear(rstAF);
                    if rstAF.Get(l_strNivel4) then begin

                        rstAF.AddLink(strArchivo, 'Activos fijos ' + l_strNivel6);

                    end;

                end;
            'ING.BRUTOS':
                begin

                    Clear(rstJ);
                    if rstJ.Get(l_strNivel4) then begin

                        rstJ.AddLink(strArchivo, 'Ingresos Brutos ' + l_strNivel6);

                    end;

                end;
            'INGRESOS':
                begin

                    Clear(rstJ);
                    if rstJ.Get(l_strNivel4) then begin

                        rstJ.AddLink(strArchivo, 'Ingresos ' + l_strNivel6);

                    end;

                end;
            else begin

                Clear(rstV);
                if rstV.Get(l_strNivel4) then begin

                    Message('No existe el tipo de documento %1 como archivo vinculado. Por favor, notifique al departamento de Sistemas.', l_strNivel1);
                    rstV.AddLink(strArchivo, l_strNivel4 + ' - ' + l_strNivel6);

                end;

            end;

        end;
    end;

    [Scope('OnPrem')]
    procedure TraerHTMLIntranet(var html: Text[1024]; strHiperLink: Text)
    var
        rstInfoEmpresa: Record "Company Information";
    begin
        html := 'about:blank';
        Clear(rstInfoEmpresa);
        rstInfoEmpresa.Get();
        if strHiperLink <> '' then
            html := strHiperLink
        else
            html := 'about:blank';
    end;

    [Scope('OnPrem')]

    procedure TraerHTMLInternet(var html: Text[1024]; strHiperLink: Text)
    var
        rstInfoEmpresa: Record "Company Information";
        ClassString: DotNet String;
    begin
        html := 'about:blank';
        Clear(rstInfoEmpresa);
        rstInfoEmpresa.Get();
        if UpperCase(CopyStr(strHiperLink, 1, 4)) <> 'HTTP' then begin

            if strHiperLink <> '' then
                html := UpperCase(rstInfoEmpresa."Ruta Intranet") + (ConvertStr(CopyStr(UpperCase(strHiperLink), StrPos(UpperCase(strHiperLink), '\' + UpperCase(rstInfoEmpresa."Ruta cabecera digitalizacion")) + 1, 1024), '\', '/'))
            else
                html := 'about:blank';

        end
        else
            html := strHiperLink;

        if (StrLen(html) > 0) and (CopyStr(html, 1, 8) = 'HTTPS://') then begin
            ClassString := CopyStr(html, 9, 1024);
            if StrPos(CopyStr(ClassString, 9, 1024), '//') <> 0 then
                html := 'HTTPS://' + ClassString.Replace('//', '/');
        end;

    end;

    local procedure CopiarArchivo(strRutaCompletaConArchivo: Text[250]; strNombreArchivo: Code[250])
    var
        rstRutaDigitalizacion: Record File;
        rstInfoEmpresa: Record "Company Information";
        rstConfComprasyPagos: Record "Purchases & Payables Setup";
        cduCommonControl: Codeunit "Mail Management";
        optFiletype: Option " ",Text,Excel,Word,Custom;
        filArchivoAImportar: File;
        strRutaCompletaSinArchivo: Text[250];
        rstArchivo: Record "Específicos por ruta";
        intEscanearoImportaroRenombrar: Integer;
        strNroDoc: Code[20];
        datFechaVto: Date;
        rstCabCompra: Record "Purchase Header";
        cduMensajeria: Codeunit "Mensajería";
        rstMensajeria: Record Mensajeria;
        rstConfUsuario: Record "User Setup";
        rstRutaDigitEspecifica: Record "Específicos por ruta";
        cduGestionNoSerie: Codeunit "No. Series";
        rstConfCompras: Record "Purchases & Payables Setup";
        rstProveedor: Record Vendor;
        rstMovProveedor: Record "Vendor Ledger Entry";
        intLinea: Integer;
        blnSolicitarNiveles: Boolean;
        cduCodeSerie: Codeunit "No. Series";
    begin
        strRutaCompletaConArchivo := PadStr(strRutaCompletaConArchivo, StrLen(strRutaCompletaConArchivo) - 4) +
                                     CopyStr(strNombreArchivo, StrLen(strNombreArchivo) - 3, 4);
        //FILE.COPY(strNombreArchivo,strRutaCompletaConArchivo);
        cduFileManagement.CopyServerFile(strNombreArchivo, strRutaCompletaConArchivo, true);
        Clear(rstInfoEmpresa);
        rstInfoEmpresa.Get();
        //cduMensajeria.RegistrarMensaje('Archivo ingresado en repositorio','','',l_strNivel1,
        cduMensajeria.RegistrarMensaje('Archivo ingresado en repositorio', '', strNroDoc, l_strNivel1,
        'Digitalizado', Today, rstMensajeria."Tipo movimiento"::"Flujo documentos",
        l_strNivel3,
        '', '', cduCodeSerie.GetNextNo(rstInfoEmpresa."No. serie mensajería", Today, true), '', '', '', strRutaCompletaConArchivo);


        if StrPos(strRutaCompletaConArchivo, rstInfoEmpresa."Ruta ejecutable digitalizacion" + rstInfoEmpresa."Ruta cabecera digitalizacion" + '\') <> 0 then begin

            strRutaCompletaConArchivo := CopyStr(strRutaCompletaConArchivo, 1, StrLen(rstInfoEmpresa."Ruta ejecutable digitalizacion" + rstInfoEmpresa."Ruta cabecera digitalizacion")) +
                           CopyStr(strRutaCompletaConArchivo, StrLen(rstInfoEmpresa."Ruta ejecutable digitalizacion" + rstInfoEmpresa."Ruta cabecera digitalizacion") + 2, 250);

        end;

        CrearLink(strRutaCompletaConArchivo);
    end;

    local procedure RenombrarArchivo(strRutaCompletaConArchivo: Text[250]; strNombreArchivo: Code[250])
    var
        rstRutaDigitalizacion: Record File;
        rstInfoEmpresa: Record "Company Information";
        rstConfComprasyPagos: Record "Purchases & Payables Setup";
        cduCommonControl: Codeunit "Mail Management";
        optFiletype: Option " ",Text,Excel,Word,Custom;
        filArchivoAImportar: File;
        strRutaCompletaSinArchivo: Text[250];
        rstArchivo: Record "Específicos por ruta";
        intEscanearoImportaroRenombrar: Integer;
        strNroDoc: Code[20];
        datFechaVto: Date;
        rstCabCompra: Record "Purchase Header";
        cduMensajeria: Codeunit "Mensajería";
        rstMensajeria: Record Mensajeria;
        rstConfUsuario: Record "User Setup";
        rstRutaDigitEspecifica: Record "Específicos por ruta";
        cduGestionNoSerie: Codeunit "No. Series";
        rstConfCompras: Record "Purchases & Payables Setup";
        rstProveedor: Record Vendor;
        rstMovProveedor: Record "Vendor Ledger Entry";
        intLinea: Integer;
        blnSolicitarNiveles: Boolean;
        cduCodeSerie: Codeunit "No. Series";
    begin
        strRutaCompletaConArchivo := PadStr(strRutaCompletaConArchivo, StrLen(strRutaCompletaConArchivo) - 4) +
                                     CopyStr(strNombreArchivo, StrLen(strNombreArchivo) - 3, 4);
        FILE.Rename(strNombreArchivo, strRutaCompletaConArchivo);
        Clear(rstInfoEmpresa);
        rstInfoEmpresa.Get();
        //cduMensajeria.RegistrarMensaje('Archivo ingresado en repositorio','','',l_strNivel1,
        cduMensajeria.RegistrarMensaje('Archivo ingresado en repositorio', '', strNroDoc, l_strNivel1,
        'Digitalizado', Today, rstMensajeria."Tipo movimiento"::"Flujo documentos",
        l_strNivel3,
        '', '', cduCodeSerie.GetNextNo(rstInfoEmpresa."No. serie mensajería", Today, true), '', '', '', strRutaCompletaConArchivo);

        if StrPos(strRutaCompletaConArchivo, rstInfoEmpresa."Ruta ejecutable digitalizacion" + rstInfoEmpresa."Ruta cabecera digitalizacion" + '\') <> 0 then begin

            strRutaCompletaConArchivo := CopyStr(strRutaCompletaConArchivo, 1, StrLen(rstInfoEmpresa."Ruta ejecutable digitalizacion" + rstInfoEmpresa."Ruta cabecera digitalizacion")) +
                           CopyStr(strRutaCompletaConArchivo, StrLen(rstInfoEmpresa."Ruta ejecutable digitalizacion" + rstInfoEmpresa."Ruta cabecera digitalizacion") + 2, 250);

        end;

        CrearLink(strRutaCompletaConArchivo);
    end;

    [Scope('OnPrem')]
    procedure VerPDF(Html: Text)
    var
        pgePDF: Page "PDFViewer Page";
        cduEscaneado: Codeunit Escaneado;
    begin
        Clear(pgePDF);
        TraerHTMLInternet(Html, Html);
        pgePDF.SetURL(Html);
        pgePDF.Run;
    end;

    [Scope('OnPrem')]
    procedure GenerarRutaCompleta(rstRutaDigitalizado: Record "Ruta digitalizacion depto/espe"; strNombreArchivo: Text; blnConArchivo: Boolean): Text
    var
        rstCI: Record "Company Information";
    begin
        Clear(rstCI);
        rstCI.Get();

        if blnConArchivo then
            exit(rstCI."Ruta de digitalizacion" + rstCI."Ruta cabecera digitalizacion" + '\' + rstRutaDigitalizado.Especifico + strNombreArchivo)
        else
            exit(rstCI."Ruta de digitalizacion" + rstCI."Ruta cabecera digitalizacion" + '\' + rstRutaDigitalizado.Especifico);
    end;

    local procedure fntGetRaiz(): Text
    begin
    end;

    local procedure fntAddPDF(strPDFOrigin: Text; strPDFtoAppend: Text)
    var
        dnProcessStartInfo: DotNet dnProcessStartInfo;
        dnProcess: DotNet dnProcess;
        l_rstCI: Record "Company Information";
        l_strRutaEjecucion: Text;
        l_strArgumentosSalida: Text;
        l_strPDFOut: Text;
        dnFileManagement: DotNet File;
        l_File: File;
    begin
        Clear(l_rstCI);
        l_rstCI.Get;
        //Elimina el archivo temporal si ya existe
        Clear(cduFileManagement);
        if dnFileManagement.Exists('c:\temp\' + UserId + '.pdf') then
            dnFileManagement.Delete('c:\temp\' + UserId + '.pdf');
        //Creo los argumentos de ejecución del pdfkit para generar el nuevo PDF
        l_strRutaEjecucion := '"' + l_rstCI."Ruta de digitalizacion" + l_rstCI."Ruta cabecera digitalizacion" + 'PDFtk Server\bin\pdftk.exe' + '"';
        l_strPDFOut := Format('"c:\temp\' + UserId + '.pdf"');
        l_strArgumentosSalida := ' cat output ' + l_strPDFOut;
        //Ejecuto el pdfkit para crear el nuevo archivo
        Clear(dnProcess);
        Clear(dnProcessStartInfo);
        dnProcessStartInfo := dnProcessStartInfo.ProcessStartInfo(l_strRutaEjecucion);
        strPDFOrigin := '"' + strPDFOrigin + '"';
        strPDFtoAppend := '"' + strPDFtoAppend + '"';
        dnProcessStartInfo.Arguments := strPDFOrigin + ' ' + strPDFtoAppend + ' ' + l_strArgumentosSalida;

        dnProcessStartInfo.UseShellExecute := false;
        dnProcessStartInfo.CreateNoWindow := true;
        dnProcessStartInfo.RedirectStandardOutput := true;
        dnProcess := dnProcess.Process;
        dnProcess.StartInfo(dnProcessStartInfo);
        dnProcess.Start;
        //Me aseguro de tener un archivo que copiar
        Sleep(2000);
        while not dnFileManagement.Exists('c:\temp\' + UserId + '.pdf') do begin
        end;
        //Elimino el archivo original
        dnFileManagement.Delete(DelChr(strPDFOrigin, '=', '"'));
        //Copio el nuevo archivo en la ruta original
        FILE.Copy(DelChr(l_strPDFOut, '=', '"'), DelChr(strPDFOrigin, '=', '"'));
    end;
}

