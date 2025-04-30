pageextension 50344 "Navigate Extension" extends "Navigate" //OriginalId
{
    var
        rstWithholdingRecords: Record "Invoice Withholding Buffer";
        CabSolicitud: Record Solicitud;
        LinSolicitud: Record "Lín. solicitud";
        CabHistFac: Record "Purch. Inv. Header";
        LinHistFac: Record "Purch. Inv. Line";
        LinHistNC: Record "Purch. Cr. Memo Line";
        CabAlb: Record "Purch. Rcpt. Header";
        LinAlb: Record "Purch. Rcpt. Line";
        CabCompra: Record "Purchase Header";
        LinCompra: Record "Purchase Line";
        CabSol: Record Solicitud;
        CabVenta: Record "Sales Header";
        CabHistFacCompras: Record "Purch. Inv. Header";
        rstSeguimiento: Record "Seguimiento Documentos";
        rstProduccion: Record "Produccion Planta";
        rstReparto: Record "Cab. Reparto";
        rstRepartoRegistrado: Record "Recupero IVA";
        filArchivoTxt: File;
        filArchivoBat: File;
        strPrueba: Integer;
        i: Integer;
        strEnv: Text[250];
        rstInfoEmpresa: Record "Company Information";
        rstFile: Record "Documentos digitalizados";
        strLinea: Text[250];
        strNombreArchivo: Text[250];
        blnNoEstaGenerado: Boolean;
        rstRutaDigitalizacion: Record "Ruta digitalizacion depto/espe";
        rstFileSystem: Record File;
        strRutaCompletaSinArchivo: Text[250];
        strRutaCompletaConArchivo: Text[250];
        strFiltroArchivo: Text[250];
        rstNiveles: Record "Específicos por ruta";
        rstMensajeria: Record Mensajeria;
        rstConfUsu: Record "User Setup";
        rstDigitalizados: Record "Documentos digitalizados";
        blnBuscarDigitalizados: Boolean;
        MovtoProducto2: Record "Item Ledger Entry";
        rstValesConsumo: Record "Cab. Vale consumo";
        rstSerguimiento: Record "Seguimiento Documentos";
        rstLinPlanta: Record "Lin. produccion planta";
        rstDCLDetail: Record "DCL Application Lines";
        codNoSolicitud: Code[20];
        intNroLineaSolicitud: Integer;

    procedure funTextoCampo(strNombreArchivo: Text[250]; strNivel: Text[4]): Code[250]
    var
        strNombreCampo: Code[250];
        i: Integer;
        blnEncontrado: Boolean;
        strNombreNivel2: Code[250];
        h: Integer;
        j: Integer;
        strNombreNivel3: Code[250];
    begin
        strNombreCampo := '';
        strNombreNivel2 := '';
        i := 0;
        if StrPos(strNombreArchivo, strNivel) <> 0 then
            repeat

                i += 1;

                if StrPos(CopyStr(strNombreArchivo, StrPos(strNombreArchivo, strNivel) + 4, 250), '_') <> 0 then begin

                    strNombreNivel2 := CopyStr(strNombreArchivo, StrPos(strNombreArchivo, strNivel) + 4, 250);
                    strNombreCampo := CopyStr(strNombreNivel2, 1, StrPos(strNombreNivel2, '_') - 1);

                end
                else begin

                    if StrPos(CopyStr(strNombreArchivo, StrPos(strNombreArchivo, strNivel) + 4, 250), '.') <> 0 then begin

                        strNombreNivel2 := CopyStr(strNombreArchivo, StrPos(strNombreArchivo, strNivel) + 4, 250);
                        if (StrLen(strNombreNivel2) - StrLen(DelChr(strNombreNivel2, '=', '.'))) > 1 then begin

                            strNombreNivel3 := strNombreNivel2;
                            h := (StrLen(strNombreNivel3) - StrLen(DelChr(strNombreNivel3, '=', '.')));
                            for j := 1 to h - 1 do begin

                                strNombreNivel3 := CopyStr(strNombreNivel3, 1, StrPos(strNombreNivel3, '.') - 1) + '|' +
                                                   CopyStr(strNombreNivel3, StrPos(strNombreNivel3, '.') + 1, 1024);

                            end;

                            strNombreCampo := ConvertStr(CopyStr(strNombreNivel3, 1, StrPos(strNombreNivel3, '.') - 1), '|', '.');

                        end;

                    end
                    else
                        strNombreCampo := CopyStr(strNombreNivel2, 1, StrPos(strNombreNivel2, '.') - 1);

                end;

            until strNombreCampo <> '';

        exit(strNombreCampo);
    end;

    [Scope('OnPrem')]
    procedure fntSolicitud(l_codNoSolicitud: Code[20]; l_intNroLineaSolicitud: Integer)
    begin
        codNoSolicitud := l_codNoSolicitud;
        intNroLineaSolicitud := l_intNroLineaSolicitud;
    end;

    local procedure fntFindSolicitud()
    begin
        //Solicitudes por línea
        if (codNoSolicitud <> '') and (intNroLineaSolicitud <> 0) then begin

            if LinHistFac.ReadPermission then begin
                LinHistFac.Reset;
                LinHistFac.SetCurrentKey("No. Cab. Solicitud");
                LinHistFac.SetFilter(LinHistFac."No. Cab. Solicitud", codNoSolicitud);
                LinHistFac.SetRange("No. Linea Solicitud", intNroLineaSolicitud);
                InsertIntoDocEntry(DATABASE::"Purch. Inv. Line", 'Histórico lín. factura compra', LinHistFac.Count);
            end;
            if LinHistNC.ReadPermission then begin
                LinHistNC.Reset;
                LinHistNC.SetCurrentKey("No. Cab. Solicitud");
                LinHistNC.SetFilter(LinHistNC."No. Cab. Solicitud", codNoSolicitud);
                LinHistNC.SetRange("No. Linea Solicitud", intNroLineaSolicitud);
                InsertIntoDocEntry(DATABASE::"Purch. Cr. Memo Line", 'Histórico nota crédito compra', LinHistNC.Count);
            end;
        end;
        //--Solicitudes por línea
    end;



}