codeunit 50513 "WS - AFIP"
{
    Permissions = TableData "AFIP Interface Register" = rimd,
                  TableData "AFIP Interface Register detail" = rimd;

    trigger OnRun()
    begin
    end;

    var
        MiCertificado: Text;
        MiClavePrivada: Text;
        strRutaTemporales: Text;
        AsciiStr: Text[250];
        AnsiStr: Text[250];
        CharVar: array[32] of Char;

    [Scope('OnPrem')]
    procedure fntWSAA(l_strServicio: Text[30]): Boolean
    var
        sb: DotNet dnStringBuilder;
        CrLF: Text;
        strOut: OutStream;
        Archivo: File;
        process: DotNet dnProcess;
        cduXML: Codeunit "XML DOM Management";
        xmlDoc: DotNet XmlDocument;
        xmlNode: DotNet XmlNode;
        strArchivoRespuesta: Text;
        strArchivoError: Text;
        strArchivoCMS: Text;
        strComando: Text;
        strComilla: Text[1];
        strWSAA: Text;
        StartupInfo: DotNet dnProcessStartInfo;
        strToken: Text;
        strSign: Text;
        cduTime: Integer;
        rst50400: Record "AFIP Interface Register";
        rst99008535: Codeunit "Temp Blob";
        i: Integer;
        strSource: Text;
        strDestination: Text;
        strUniqueid: Text;
        strGenerationtime: Text;
        strExpirationtime: Text;
        datGener: Date;
        datExpir: Date;
        timGen: Time;
        timExpir: Time;
        dtGen: DateTime;
        dtExp: DateTime;
        strFile: Text;
    begin
        CrLF[1] := 13;
        CrLF[2] := 10;

        sb := sb.StringBuilder();

        fntAbrirCertyClave;


        strArchivoRespuesta := strRutaTemporales + 'loginTicketResponse.xml';
        strArchivoError := strRutaTemporales + 'loginTicketResponse-ERROR.xml';
        strArchivoCMS := strRutaTemporales + 'LoginTicketRequest.xml.cms';

        sb.Append('[CmdletBinding()]' + CrLF
                  + 'Param(' + CrLF
                  + '   [Parameter(Mandatory=$False)]' + CrLF
                  + '   [string]$Certificado="' + MiCertificado + '",' + CrLF + CrLF
                  + ' [Parameter(Mandatory=$False)]' + CrLF
                  + '   [string]$ClavePrivada="' + MiClavePrivada + '",' + CrLF + CrLF
                  + '   [Parameter(Mandatory=$False)]' + CrLF
                  + '   [string]$ServicioId="' + l_strServicio + '",' + CrLF + CrLF
                  + '   [Parameter(Mandatory=$False)]' + CrLF
                  + '   [string]$OutXml="' + strArchivoRespuesta + '",' + CrLF + CrLF
                  + '   [Parameter(Mandatory=$False)]' + CrLF
                  + '   [string]$ErrorOutXml="' + strArchivoError + '",' + CrLF + CrLF
                  + '   [Parameter(Mandatory=$False)]' + CrLF
                  + '   [string]$OutCms="' + strArchivoCMS + '",' + CrLF + CrLF
                  + '   [Parameter(Mandatory=$False)]' + CrLF
                  + '   [string]$WsaaWsdl = "https://wsaa.afip.gov.ar/ws/services/LoginCms?WSDL"' + CrLF
                  + ')' + CrLF + CrLF
                  + '$ErrorActionPreference = "Stop"' + CrLF + CrLF
                  + '$dtNow = Get-Date ' + CrLF
                  + '$xmlTA = New-Object System.XML.XMLDocument' + CrLF
                  + '$xmlTA.LoadXml(''<loginTicketRequest><header><uniqueId></uniqueId><generationTime></generationTime><expirationTime></expirationTime></header><service></service></loginTicketRequest>'')' + CrLF
                  + '$xmlUniqueId = $xmlTA.SelectSingleNode("//uniqueId")' + CrLF
                  + '$xmlGenTime = $xmlTA.SelectSingleNode("//generationTime")' + CrLF
                  + '$xmlExpTime = $xmlTA.SelectSingleNode("//expirationTime")' + CrLF
                  + '$xmlService = $xmlTA.SelectSingleNode("//service")' + CrLF
                  + '$xmlGenTime.InnerText = $dtNow.AddMinutes(-10).ToString("s")' + CrLF
                  + '$xmlExpTime.InnerText = $dtNow.AddMinutes(+10).ToString("s")' + CrLF
                  + '$xmlUniqueId.InnerText = $dtNow.ToString("yyMMddHHMM")' + CrLF
                  + '$xmlService.InnerText = $ServicioId' + CrLF
                  //+'$seqNr = Get-Date -UFormat "%Y%m%d%H%S"'+CrLF
                  //+'$xmlTA.InnerXml | Out-File '+strRutaTemporales+'$seqNr-$OutXml -Encoding ASCII'+CrLF+CrLF
                  + '$xmlTA.InnerXml | Out-File $OutXml -Encoding ASCII' + CrLF + CrLF
                  //+'openssl cms -sign -in '+strRutaTemporales+'$seqNr-$OutXml -signer $Certificado -inkey $ClavePrivada -nodetach -outform der -out $seqNr-$OutCms-DER'+CrLF+CrLF
                  + 'openssl cms -sign -in $OutXml -signer $Certificado -inkey $ClavePrivada -nodetach -outform der -out $OutCms-DER' + CrLF + CrLF
                  //+'openssl base64 -in $seqNr-$OutCms-DER -e -out $seqNr-$OutCms-DER-b64'+CrLF+CrLF
                  + 'openssl base64 -in $OutCms-DER -e -out $OutCms-DER-b64' + CrLF + CrLF
                  + 'try' + CrLF
                  + '{' + CrLF
                  + '   $cms = Get-Content $OutCms-DER-b64 -Raw' + CrLF
                  //+'   $cms = Get-Content $seqNr-$OutCms-DER-b64 -Raw'+CrLF
                  + '   $wsaa = New-WebServiceProxy -Uri $WsaaWsdl -ErrorAction Stop' + CrLF
                  + '   $wsaaResponse = $wsaa.loginCms($cms) ' + CrLF
        //          +'   $wsaaResponse > '+strRutaTemporales+'$seqNr-loginTicketResponse.xml '+CrLF
                  + '   $wsaaResponse > ' + strArchivoRespuesta + CrLF
                  + '   $wsaaResponse' + CrLF
                  + '}' + CrLF
                  + 'catch' + CrLF
                  + '{' + CrLF
                  + '   $errMsg = $_.Exception.Message' + CrLF
                  + '   $errMsg > ' + strArchivoError + CrLF
                  //+'   $errMsg > '+strRutaTemporales+'$seqNr-loginTicketResponse-ERROR.xml '+CrLF
                  + '   $errMsg' + CrLF
                  + '}'
                  );

        Clear(Archivo);
        Archivo.TextMode(true);
        Archivo.Create(strRutaTemporales + 'wsaa.ps1', TEXTENCODING::UTF8);
        Archivo.CreateOutStream(strOut);
        strOut.WriteText(sb.ToString);
        strWSAA := Archivo.Name;
        Archivo.Close();

        strComando := '';
        strComando := /*'powershell.exe "'+*/'"' + strWSAA + '"'/* > "'+strArchivoRespuesta+'"'*/;
        strComilla := '''';
        strComando := DelChr(strComando, '=', strComilla);

        StartupInfo := StartupInfo.ProcessStartInfo('powershell.exe', strComando);
        process := process.Start(StartupInfo);
        while not process.WaitForExit(10000) do;

        fntRegistroWSAA(l_strServicio, strArchivoRespuesta, strArchivoError);

        FILE.Erase(strWSAA);

        exit(true);

    end;

    local procedure fntOpenFile(l_strFile: Text; sb: DotNet StringBuilder): Text
    var
        Archivo: File;
        strIn: InStream;
        strTxt: Text;
    begin
        Clear(sb);
        sb := sb.StringBuilder;

        Clear(Archivo);
        Archivo.TextMode(true);
        Archivo.Open(l_strFile);
        Archivo.CreateInStream(strIn);
        while not (strIn.EOS) do begin
            strTxt := '';
            strIn.ReadText(strTxt);
            if strTxt = ' Ÿ<' then
                strTxt := '<';
            sb.Append(strTxt);
        end;
        Archivo.Close();

        Sleep(200);

        FILE.Erase(l_strFile);

        strTxt := '';
        strTxt := sb.ToString();
        exit(strTxt);
    end;

    local procedure fntVerificarVigenciaWS(l_strServicio: Text[30]; var l_rst50400: Record "AFIP Interface Register")
    var
        Error0001: Label 'No se ha encontrado una conexión vigente a la AFIP para el servicio %1.';
    begin
        Clear(l_rst50400);
        l_rst50400.SetRange(l_rst50400.Service, l_strServicio);
        l_rst50400.SetFilter(ExpirationTime, '>%1', CurrentDateTime - 30);
        if not l_rst50400.FindLast() then
            fntWSAA(l_strServicio)
        else
            exit;
    end;

    local procedure fntTraerTokenySignWS(l_strServicio: Text[30]; var l_strToken: Text; var l_strSign: Text)
    var
        l_rst50400: Record "AFIP Interface Register";
        Error0001: Label 'No se ha encontrado una conexión vigente a la AFIP para el servicio %1.';
        rst99008535: Codeunit "Temp Blob";
        l_InStream: InStream;
    begin
        Clear(l_rst50400);
        l_rst50400.SetRange(l_rst50400.Service, l_strServicio);
        l_rst50400.SetFilter(ExpirationTime, '>%1', CurrentDateTime - 30);
        if not l_rst50400.FindLast() then
            Error('No se ha encontrado comunicación con la AFIP para el servicio %1', l_strServicio);

        Clear(rst99008535);
        l_rst50400.CalcFields(Token, Sign);

        rst99008535.FromRecord(l_rst50400, l_rst50400.FieldNo("Token"));
        rst99008535.CreateInStream(l_InStream, TextEncoding::UTF8);
        l_InStream.ReadText(l_strToken);

        rst99008535.FromRecord(l_rst50400, l_rst50400.FieldNo("Sign"));
        rst99008535.CreateInStream(l_InStream, TextEncoding::UTF8);
        l_InStream.ReadText(l_strSign);

    end;

    local procedure fntAbrirCertyClave()
    var
        l_rstGLS: Record "General Ledger Setup";
    begin
        Clear(l_rstGLS);
        l_rstGLS.Get();
        l_rstGLS.TestField("AFIP Certificate");
        l_rstGLS.TestField("AFIP Private Key");

        MiCertificado := l_rstGLS."AFIP Certificate";
        MiClavePrivada := l_rstGLS."AFIP Private Key";
        strRutaTemporales := l_rstGLS."AFIP Result Path";
    end;

    local procedure fntRegistroWSAA(l_strServicio: Text[30]; strArchivoRespuesta: Text; strArchivoError: Text)
    var
        strToken: Text;
        strSign: Text;
        cduTime: Integer;
        l_rst50400: Record "AFIP Interface Register";
        rst99008535: Codeunit "Temp Blob";
        i: Integer;
        strSource: Text;
        strDestination: Text;
        strUniqueid: Text;
        strGenerationtime: Text;
        strExpirationtime: Text;
        datGener: Date;
        datExpir: Date;
        timGen: Time;
        timExpir: Time;
        dtGen: DateTime;
        dtExp: DateTime;
        strFile: Text;
        sb: DotNet StringBuilder;
        strArchivoCMS: Text;
        l_ascii: DotNet Encoding;
        l_OutStream: OutStream;
        l_rr50400: RecordRef;
    begin
        strToken := '';
        strSign := '';
        strFile := '';

        strFile := fntOpenFile(strArchivoRespuesta, sb);

        if Exists(strArchivoError) then
            strFile := fntOpenFile(strArchivoError, sb);

        if (StrPos(strFile, '<Err>') <> 0) or (StrPos(strFile, 'Exception') <> 0) then
            Error(strFile);

        strToken := strFile;
        strToken := CopyStr(strToken, StrPos(strToken, '<token>') + StrLen('<token>'), 1000000);
        strToken := CopyStr(strToken, 1, StrPos(strToken, '</token>') - 1);

        strSign := strFile;
        strSign := CopyStr(strSign, StrPos(strSign, '<sign>') + StrLen('<sign>'), 1000000);
        strSign := CopyStr(strSign, 1, StrPos(strSign, '</sign>') - 1);

        strSource := strFile;
        strSource := CopyStr(strSource, StrPos(strSource, '<source>') + StrLen('<source>'), 1000000);
        strSource := CopyStr(strSource, 1, StrPos(strSource, '</source>') - 1);

        strDestination := strFile;
        strDestination := CopyStr(strDestination, StrPos(strDestination, '<destination>') + StrLen('<destination>'), 1000000);
        strDestination := CopyStr(strDestination, 1, StrPos(strDestination, '</destination>') - 1);

        strUniqueid := strFile;
        strUniqueid := CopyStr(strUniqueid, StrPos(strUniqueid, '<uniqueId>') + StrLen('<uniqueId>'), 1000000);
        strUniqueid := CopyStr(strUniqueid, 1, StrPos(strUniqueid, '</uniqueId>') - 1);

        strGenerationtime := strFile;
        strGenerationtime := CopyStr(strGenerationtime, StrPos(strGenerationtime, '<generationTime>') + StrLen('<generationTime>'), 1000000);
        strGenerationtime := CopyStr(strGenerationtime, 1, StrPos(strGenerationtime, '</generationTime>') - 1);

        strExpirationtime := strFile;
        strExpirationtime := CopyStr(strExpirationtime, StrPos(strExpirationtime, '<expirationTime>') + StrLen('<expirationTime>'), 1000000);
        strExpirationtime := CopyStr(strExpirationtime, 1, StrPos(strExpirationtime, '</expirationTime>') - 1);

        Clear(l_rst50400);
        if l_rst50400.FindLast then
            i := l_rst50400."Entry no." + 1
        else
            i := 1;

        Clear(l_rst50400);
        l_rst50400."Entry no." := i;
        l_rst50400.Service := l_strServicio;
        l_rst50400.Source := strSource;
        l_rst50400.Destination := strDestination;
        l_rst50400.UniqueID := strUniqueid;
        Evaluate(datGener, CopyStr(ConvertStr(strGenerationtime, 'T', ' '), 1, StrPos(ConvertStr(strGenerationtime, 'T', ' '), ' ') - 1), 9);
        Evaluate(datExpir, CopyStr(ConvertStr(strExpirationtime, 'T', ' '), 1, StrPos(ConvertStr(strExpirationtime, 'T', ' '), ' ') - 1), 9);

        Evaluate(timGen, CopyStr(ConvertStr(strGenerationtime, 'T', ' '), StrPos(ConvertStr(strGenerationtime, 'T', ' '), ' '), 10000), 9);
        Evaluate(timExpir, CopyStr(ConvertStr(strExpirationtime, 'T', ' '), StrPos(ConvertStr(strExpirationtime, 'T', ' '), ' '), 10000), 9);

        l_rst50400.GenerationTime := CreateDateTime(datGener, timGen);
        l_rst50400.ExpirationTime := CreateDateTime(datExpir, timExpir);
        l_rst50400.insert;

        clear(l_rr50400);
        l_rr50400.Get(l_rst50400.RECORDID);

        CleaR(rst99008535);
        rst99008535.CreateOutStream(l_OutStream, TextEncoding::UTF8);
        l_OutStream.WriteText(strToken);
        rst99008535.ToRecordRef(l_rr50400, l_rst50400.FieldNo("Token"));
        l_rr50400.Modify;

        CleaR(rst99008535);
        rst99008535.CreateOutStream(l_OutStream, TextEncoding::UTF8);
        l_OutStream.WriteText(strSign);
        rst99008535.ToRecordRef(l_rr50400, l_rst50400.FieldNo("Sign"));
        l_rr50400.Modify;

        CleaR(rst99008535);
        rst99008535.CreateOutStream(l_OutStream, TextEncoding::UTF8);
        l_OutStream.WriteText(strFile);
        rst99008535.ToRecordRef(l_rr50400, l_rst50400.FieldNo("File"));
        l_rr50400.Modify;


    end;

    local procedure fntRegistroDetail(l_rst50400: Record "AFIP Interface Register"; l_rst50412: Record "Documentos digitalizados"; l_intTableNo: Integer; l_intFieldNo: Integer; l_strOriginal: Text[250]; l_strNuevo: Text[250]; l_strClave: Text[250])
    var
        l_rst50401: Record "AFIP Interface Register detail";
        i: Integer;
    begin
        Clear(l_rst50401);
        if l_rst50401.FindLast then
            i := l_rst50401."Entry no." + 1
        else
            i := 1;

        Clear(l_rst50401);
        l_rst50401."Entry no." := i;
        l_rst50401."Date and Time" := CurrentDateTime;
        l_rst50401.Time := Time;
        l_rst50401."User ID" := UserId;
        l_rst50401."Table No." := l_intTableNo;
        l_rst50401."Field No." := l_intFieldNo;
        //l_rst50401."Type of Change"
        //Modificación
        if (l_strOriginal <> '') and (l_strNuevo <> '') and (UpperCase(l_strOriginal) <> UpperCase(l_strNuevo)) then
            l_rst50401."Type of Change" := l_rst50401."Type of Change"::Modification;
        //Eliminación
        if (l_strOriginal <> '') and (l_strNuevo = '') then
            l_rst50401."Type of Change" := l_rst50401."Type of Change"::Deletion;
        //Inserción
        if (l_strOriginal = '') and (l_strNuevo <> '') then
            l_rst50401."Type of Change" := l_rst50401."Type of Change"::Insertion;
        //Nada
        if (l_strOriginal = l_strNuevo) OR (UpperCase(l_strOriginal) = UpperCase(l_strNuevo)) then
            l_rst50401."Type of Change" := l_rst50401."Type of Change"::"No change";
        l_rst50401."Old Value" := l_strOriginal;
        l_rst50401."New Value" := l_strNuevo;
        l_rst50401."Register entry no." := l_rst50400."Entry no.";
        l_rst50401."Imported document entry no." := l_rst50412.Linea;
        l_rst50401."Clave registro" := l_strClave;
        l_rst50401.Insert;
    end;

    local procedure fntRegistrarInterfaz(l_rst50400: Record "AFIP Interface Register"; l_rst50401: Record "AFIP Interface Register detail")
    begin
    end;

    local procedure fntActualizarDatoenTabla(l_intTabla: Integer; l_intCampo: Integer; l_rstRegistro: Text; l_strDato: Text)
    var
        l_rrTabla: RecordRef;
        l_frCampo: FieldRef;
        l_cduDataType: Codeunit "Data Type Management";
        l_strTexto: Text;
        l_intNroOption: Option "0","1","2","3","4","5","6","7","8","9","10","11","12","13";
        l_intUbicacion: Integer;
        l_FieldRec: Record "Field";
        l_intDay: Integer;
        l_intMonth: Integer;
        l_intYear: Integer;
        i: Integer;
    begin
        Clear(l_rrTabla);
        l_rrTabla.Open(l_intTabla);
        l_rrTabla.SetPosition(l_rstRegistro);
        l_rrTabla.SetRecFilter;
        if l_rrTabla.FindSet then begin

            l_frCampo := l_rrTabla.Field(l_intCampo);

            if l_frCampo.Active then begin

                if l_frCampo.OptionCaption <> '' then begin

                    l_intUbicacion := StrPos(UpperCase(l_frCampo.OptionCaption), UpperCase(l_strDato));
                    //Ver si encuentro el texto en el Option
                    if l_intUbicacion <> 0 then begin

                        l_strTexto := CopyStr((l_frCampo.OptionCaption), 1, l_intUbicacion + StrLen(l_strDato) - 1);
                        l_intNroOption := 0;

                        if StrPos(l_strTexto, ',') <> 0 then
                            repeat

                                l_intNroOption += 1;
                                l_strTexto := CopyStr(l_strTexto, StrPos(l_strTexto, ',') + 1, 1000);

                            until StrPos(l_strTexto, ',') = 0
                        else
                            l_intNroOption := 0;

                    end
                    else
                        Error('No se ha encontrado el valor %1 en el campo con opciones %2', l_strDato, l_frCampo.OptionCaption);

                    //l_frCampo.VALUE(l_intNroOption);
                    l_frCampo.Validate(l_intNroOption);
                    l_frCampo.Value(l_intNroOption);
                    l_rrTabla.Modify;

                end
                else begin

                    i := 0;
                    Evaluate(l_FieldRec.Type, Format(l_frCampo.Type));
                    if l_FieldRec.Type = l_FieldRec.Type::Date then begin
                        if StrPos(l_strDato, '/') <> 0 then
                            repeat

                                i += 1;
                                case i of
                                    1:
                                        Evaluate(l_intDay, CopyStr(l_strDato, 1, StrPos(l_strDato, '/') - 1));
                                    2:
                                        Evaluate(l_intMonth, CopyStr(l_strDato, 1, StrPos(l_strDato, '/') - 1));
                                end;
                                l_strDato := CopyStr(l_strDato, StrPos(l_strDato, '/') + 1, 200);

                            until StrPos(l_strDato, '/') = 0;
                        Evaluate(l_intYear, l_strDato);
                        if StrLen(Format(l_intYear)) = 2 then
                            l_intYear += 2000;

                        l_frCampo.Validate(DMY2Date(l_intDay, l_intMonth, l_intYear));
                    end
                    else
                        //l_frCampo.VALIDATE(l_strDato);
                        l_frCampo.Validate(CopyStr(l_strDato, 1, l_frCampo.Length));

                    l_rrTabla.Modify;

                end;

            end;

        end;
    end;

    [Scope('OnPrem')]
    procedure Ascii2Ansi(_Text: Text): Text
    begin
        MakeVars;
        exit(ConvertStr(_Text, AnsiStr, AsciiStr));
    end;

    [Scope('OnPrem')]
    procedure MakeVars()
    begin
        AsciiStr := '€‚©„…†‡ˆ‰ŠŽÇŽüŽéŽâŽäŽàŽêŽëŽèŽïŽîŽìŽÄŽòŽÖŽÜŽøŽ£ŽƒŽ‚Ž¥ ¡¢ôŽÅ¥ŽØŽÁŽ†©ª«¬Ž€®Ž«Ž¡Ž¡Ž¡Ž¡Ž¡ŽªŽ…Ž‡ŽÀŽ¡Ž¡++½Ž„++--+-+ÔÇÖÔé¼++--Ž¡-+';
        AsciiStr := AsciiStr + 'ŽÿŽæÑŽúŽáŽóiÔäó¥Ø++Ž¡_Ž¡Ž¿ÆÔÇªáãÆŽåÔÇ×ÔÇáÔÇÿÔÇíáé”åÔÇ€ìíÆÔÇ†ŽÉn=óÔÇ£ŽñÔÇØŽÂÔÇ‡ÔÇöúÔÇôüŽ¼Ž¡”£';
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
        AnsiStr := AnsiStr + 'ÔÇôÔÇö”£Ôäó' + Format(CharVar[5]) + 'ÔÇ‡ôØ¥©áíóúnÑª' + Format(CharVar[6]) + Format(CharVar[7]);
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
    procedure Ansi2Ascii(_Text: Text): Text
    begin
        MakeVars;
        exit(ConvertStr(_Text, AnsiStr, AsciiStr));
    end;

    [Scope('OnPrem')]
    procedure fntAnularAcentosyEnes(strTexto: Text): Text
    var
        strEnie: Label 'Ñ';
        ClassString: DotNet String;
        strO: Label 'Ó';
    begin
        //EXIT(CONVERTSTR(strTexto,'áéíóúñÑ','aeiounN'));
        ClassString := strTexto;
        if StrPos(strTexto, '&amp;#209;') <> 0 then
            repeat
                strTexto := ClassString.Replace('&amp;#209;', strEnie);
            until StrPos(strTexto, '&amp;#209;') = 0;
        if StrPos(strTexto, '&amp;#209;') <> 0 then
            repeat
                strTexto := ClassString.Replace('&amp;#209;', strEnie);
            until StrPos(strTexto, '&amp;#209;') = 0;


        exit(strTexto);
    end;

    local procedure "---Web Services por nombre---"()
    begin
    end;

    [Scope('OnPrem')]
    procedure fntReprowebIndividual(l_strServicio: Text[30]; l_codCUITSolicitante: Code[11]; l_codCUITSolicitado: Code[11]; l_strPeriodo: Code[7])
    var
        l_rst50400: Record "AFIP Interface Register";
        Error0003: Label 'El proveedor %1 tiene el área de impuesto %2, que está configurada para no requerir consulta Reproweb.';
        Error0002: Label 'Se ha detenido la actualización.';
        Error0001: Label 'No se ha encontrado una conexión vigente a la AFIP para el servicio %1.';
        l_xml: Text;
        l_url: Text;
        l_soapActionUrl: Text;
        l_sb: DotNet StringBuilder;
        l_uriObj: DotNet Uri;
        l_lgRequest: DotNet HttpWebRequest;
        l_stream: DotNet StreamWriter;
        l_lgResponse: DotNet HttpWebResponse;
        l_str: DotNet Stream;
        l_OutStream: OutStream;
        l_reader: DotNet XmlTextReader;
        l_document: DotNet XmlDocument;
        l_ascii: DotNet Encoding;
        l_credentials: DotNet CredentialCache;
        l_cduFM: Codeunit "File Management";
        l_FileTest: File;
        l_StreamInTest: OutStream;
        l_CrLf: Text;
        l_FileMgt: Codeunit "File Management";
        l_strArchivo: Text;
        l_strToken: Text;
        l_strSign: Text;
        l_rst99008535: Codeunit "Temp Blob";
        l_strFile: Text;
        l_rstDocumentosDigitalizados: Record "Documentos digitalizados";
        l_strNivel: array[12] of Text;
        l_rstUS: Record "User Setup";
        l_strRespuesta: Text;
        intLinea: Integer;
        l_rst23: Record Vendor;
        l_rstPPS: Record "Purchases & Payables Setup";
        l_Txt: Text;
        strFecha: Text[30];
        codEstado: Code[30];
        rstProveedor: Record Vendor temporary;
        rstAreaImpuesto: Record "Tax Area";
        rstFecha: Record Date;
        l_intCantCUITs: Integer;
        i: Integer;
        strSource: Text;
        strDestination: Text;
        strUniqueid: Text;
        t_rst23c: Record Vendor temporary;
        l_TxtTemp: Text;
        l_rst50401: Record "AFIP Interface Register detail";
        l_pge50507: Page "AFIP Interface Register detail";
        l_dlgDialogo: Dialog;
        l_CodeMens: Codeunit "Mensajería";
        Mensaje: Text;
        Mensaje0001: Label 'Se ha actualizado el proveedor %1 con los Web Services Reproweb.';
        l_ConfUsu: Record "User Setup";
        l_PunMensajeria: Record Mensajeria;
        l_strError: Text;
        l_rst318: Record "Tax Area";
        Mensaje0002: Label 'El proveedor %1 tiene el área de impuesto %2, que está configurada para no requerir consulta Reproweb.';
        l_datFecha: Date;
        l_rrDocsDigitalizados: RecordRef;
    begin
        fntVerificarVigenciaWS(l_strServicio, l_rst50400);
        fntTraerTokenySignWS(l_strServicio, l_strToken, l_strSign);

        Clear(l_dlgDialogo);
        l_dlgDialogo.Open('Ejecutando consulta Reproweb...\' +
                          'Proveedor #1###########, \' +
                          'Estado:   #2###########');
        //Inicializar
        l_Txt := '';
        l_strRespuesta := '';
        for i := 1 to 10 do begin
            l_strNivel[i] := '';
        end;

        Clear(l_rst23);
        l_rst23.SetRange("VAT Registration No.", CopyStr(l_codCUITSolicitado, 1, 2) + '-' + CopyStr(l_codCUITSolicitado, 3, 8) + '-' + CopyStr(l_codCUITSolicitado, 11, 1));
        l_rst23.FindFirst;

        l_dlgDialogo.Update(1, l_rst23.Name);
        l_dlgDialogo.Update(2, l_rst23."Estado de situación fiscal");

        Clear(l_rst318);
        l_rst318.Get(l_rst23."Tax Area Code");
        if not l_rst318."Importar Reproweb" then
            Message(Error0003, l_rst23."No." + ' - ' + l_rst23.Name, l_rst318.Code);

        //Prueba Reproweb Producción
        l_sb := l_sb.StringBuilder();
        l_url := 'https://servicios1.afip.gov.ar/wsagr/wsagr.asmx';
        l_soapActionUrl := 'http://servicios1.afip.gob.ar/wsagr/Consulta';

        l_sb.Append('<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:wsag="http://servicios1.afip.gob.ar/wsagr/">');
        l_sb.Append('   <soap:Header/>');
        l_sb.Append('   <soap:Body>');
        l_sb.Append('      <wsag:Consulta>');
        l_sb.Append('         <wsag:Auth>');
        l_sb.Append('            <wsag:Token>' + l_strToken + '</wsag:Token>');
        l_sb.Append('            <wsag:Sign>' + l_strSign + '</wsag:Sign>');
        l_sb.Append('            <wsag:Cuit>' + l_codCUITSolicitante + '</wsag:Cuit>');
        l_sb.Append('         </wsag:Auth>');
        l_sb.Append('         <wsag:Periodo>' + l_strPeriodo + '</wsag:Periodo>');
        l_sb.Append('         <wsag:Cuit>' + l_codCUITSolicitado + '</wsag:Cuit>');
        l_sb.Append('      </wsag:Consulta>');
        l_sb.Append('   </soap:Body>');
        l_sb.Append('</soap:Envelope>');
        l_sb.Append(l_xml);
        l_uriObj := l_uriObj.Uri(l_url);
        l_lgRequest := l_lgRequest.CreateDefault(l_uriObj);
        l_lgRequest.Method := 'POST';
        l_lgRequest.ContentType := 'text/xml; charset=utf-8';
        if l_soapActionUrl <> '' then
            l_lgRequest.Headers.Add('SOAPAction', l_soapActionUrl);
        l_lgRequest.Timeout := 120000;
        l_stream := l_stream.StreamWriter(l_lgRequest.GetRequestStream(), l_ascii.ASCII);
        l_stream.Write(l_sb.ToString());
        l_xml := l_sb.ToString;
        l_stream.Close();
        l_lgResponse := l_lgRequest.GetResponse();
        l_str := l_lgResponse.GetResponseStream();
        l_reader := l_reader.XmlTextReader(l_str);
        l_document := l_document.XmlDocument();
        l_document.Load(l_reader);

        Clear(l_rstUS);
        l_rstUS.SetRange("User ID", UserId);
        if l_rstUS.FindFirst then;

        l_strError := '';
        l_strRespuesta := l_document.InnerXml();
        if StrPos(l_strRespuesta, '<Err>') <> 0 then
            l_strError := fntControlErrores(l_document, l_rst23."VAT Registration No."/*+l_codCUITSolicitado*/, true);

        //Niveles de digitalización
        l_strNivel[1] := l_strServicio; //Servicio
        l_strNivel[2] := Format(Today); //Fecha consulta
        l_strNivel[3] := l_rstUS.Grupo; //Grupo seguridad
        l_strNivel[4] := l_rst23."No.";
        l_strNivel[5] := UserId; //Usuario solicitud

        //CUIT Solicitado
        l_strNivel[6] := l_strRespuesta;
        l_strNivel[6] := CopyStr(l_strNivel[6], StrPos(l_strNivel[6], '<Cuit>') + StrLen('<Cuit>'), 1000000);
        l_strNivel[6] := CopyStr(l_strNivel[6], 1, StrPos(l_strNivel[6], '</Cuit>') - 1);

        //Periodo solicitado
        l_strNivel[7] := l_strRespuesta;
        l_strNivel[7] := CopyStr(l_strNivel[7], StrPos(l_strNivel[7], '<Pdo>') + StrLen('<Pdo>'), 1000000);
        l_strNivel[7] := CopyStr(l_strNivel[7], 1, StrPos(l_strNivel[7], '</Pdo>') - 1);

        //Respuesta a estado situación fiscal
        l_strNivel[8] := l_strRespuesta;
        l_strNivel[8] := CopyStr(l_strNivel[8], StrPos(l_strNivel[8], '<Rsp>') + StrLen('<Rsp>'), 1000000);
        l_strNivel[8] := CopyStr(l_strNivel[8], 1, StrPos(l_strNivel[8], '</Rsp>') - 1);

        //Código Transacción
        l_strNivel[9] := l_strRespuesta;
        l_strNivel[9] := CopyStr(l_strNivel[9], StrPos(l_strNivel[9], '<RTran>') + StrLen('<RTran>'), 1000000);
        l_strNivel[9] := CopyStr(l_strNivel[9], 1, StrPos(l_strNivel[9], '</RTran>') - 1);

        //Código Transacción
        l_strNivel[10] := l_strRespuesta;
        l_strNivel[10] := CopyStr(l_strNivel[10], StrPos(l_strNivel[10], '<FTran>') + StrLen('<FTran>'), 1000000);
        l_strNivel[10] := CopyStr(l_strNivel[10], 1, StrPos(l_strNivel[10], '</FTran>') - 1);

        Clear(l_rst99008535);
        l_rst99008535.CreateOutStream(l_OutStream, TEXTENCODING::UTF8);
        l_OutStream.WriteText(l_strRespuesta);

        Clear(l_rstDocumentosDigitalizados);
        if l_rstDocumentosDigitalizados.Find('+') then
            intLinea := l_rstDocumentosDigitalizados.Linea
        else
            intLinea := 1;

        Clear(l_rstDocumentosDigitalizados);
        l_rstDocumentosDigitalizados.Linea := intLinea + 1;
        l_rstDocumentosDigitalizados."Nivel 1" := CopyStr(l_strNivel[1], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 1"));
        l_rstDocumentosDigitalizados."Nivel 2" := CopyStr(l_strNivel[2], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 2"));
        l_rstDocumentosDigitalizados."Nivel 3" := CopyStr(l_strNivel[3], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 3"));
        l_rstDocumentosDigitalizados."Nivel 4" := CopyStr(l_strNivel[4], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 4"));
        l_rstDocumentosDigitalizados."Nivel 5" := CopyStr(l_strNivel[5], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 5"));
        l_rstDocumentosDigitalizados."Nivel 6" := CopyStr(l_strNivel[6], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 6"));
        l_rstDocumentosDigitalizados."Nivel 7" := CopyStr(l_strNivel[7], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 7"));
        l_rstDocumentosDigitalizados."Nivel 8" := CopyStr(l_strNivel[8], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 8"));
        l_rstDocumentosDigitalizados."Nivel 9" := CopyStr(l_strNivel[9], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 9"));
        l_rstDocumentosDigitalizados."Nivel 10" := CopyStr(l_strNivel[10], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 10"));
        l_rstDocumentosDigitalizados."Nivel 11" := CopyStr(l_strNivel[11], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 11"));
        l_rstDocumentosDigitalizados.Insert;

        clear(l_rrDocsDigitalizados);
        l_rrDocsDigitalizados.get(l_rstDocumentosDigitalizados.RecordId);
        l_rst99008535.ToRecordRef(l_rrDocsDigitalizados, l_rstDocumentosDigitalizados.FieldNo("BlobFile"));
        l_rrDocsDigitalizados.Modify;


        /*
        if l_strError <> '' then
            l_rst99008535.DeleteAll;
        */

        Clear(t_rst23c);
        t_rst23c.Copy(l_rst23);

        Evaluate(l_datFecha, l_strNivel[10]);

        fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::Vendor, t_rst23c.FieldNo("Fecha consulta Reproweb"), Format(l_rst23."Fecha consulta Reproweb"), Format(CalcDate('<+CM>', l_datFecha)), CopyStr(t_rst23c.GetPosition, 1, 250));
        t_rst23c."Fecha consulta Reproweb" := CalcDate('<+CM>', l_datFecha);

        fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::Vendor, t_rst23c.FieldNo("Estado de situación fiscal"), Format(l_rst23."Estado de situación fiscal"), Format(l_strNivel[8]), CopyStr(t_rst23c.GetPosition, 1, 250));
        Evaluate(t_rst23c."Estado de situación fiscal", l_strNivel[8]);

        l_reader.Close();
        l_str.Close();

        Commit;

        Clear(l_rst50401);
        l_rst50401.SetRange("Imported document entry no.", l_rstDocumentosDigitalizados.Linea);
        l_rst50401.SetRange("Register entry no.", l_rst50400."Entry no.");
        l_rst50401.SetFilter("Clave registro", '<>%1', '');
        Clear(l_pge50507);
        l_pge50507.SetTableView(l_rst50401);
        l_pge50507.LookupMode := true;
        if l_pge50507.RunModal = ACTION::LookupOK then begin

            l_dlgDialogo.Open('Actualizando datos en tabla #1###########');

            l_rst50401.SetRange(Ommit, false);
            if l_rst50401.FindSet then
                repeat

                    l_dlgDialogo.Update(1, l_rst50401."Table Caption");
                    fntActualizarDatoenTabla(l_rst50401."Table No.", l_rst50401."Field No.", l_rst50401."Clave registro", l_rst50401."New Value");

                until l_rst50401.Next = 0;

            //MESSAGE('Commiteado');

        end
        else
            Error(Error0002);

        if l_strError <> '' then
            Mensaje := l_strError
        else
            Mensaje := StrSubstNo(Mensaje0001, l_rst23."No." + ' ' + l_rst23.Name);

        Clear(l_ConfUsu);
        l_ConfUsu.Get(UserId);

        l_CodeMens.RegistrarMensaje(Mensaje, '', l_rst23."No.", 'Proveedor', 'Reproweb', Today,
        l_PunMensajeria."Tipo movimiento"::Mensaje, l_ConfUsu.Grupo, '', '', '', '', '', '', '');

        l_dlgDialogo.Close;

    end;

    [Scope('OnPrem')]
    procedure fntReprowebGrupal(l_strServicio: Text[30]; l_codCUITSolicitante: Code[11]; l_codCUITSolicitado: Code[11]; l_strPeriodo: Code[7])
    var
        l_rst50400: Record "AFIP Interface Register";
        Error0001: Label 'No se ha encontrado una conexión vigente a la AFIP para el servicio %1.';
        l_xml: Text;
        l_url: Text;
        l_soapActionUrl: Text;
        l_sb: DotNet StringBuilder;
        l_uriObj: DotNet Uri;
        l_lgRequest: DotNet HttpWebRequest;
        l_stream: DotNet StreamWriter;
        l_lgResponse: DotNet HttpWebResponse;
        l_str: DotNet Stream;
        l_reader: DotNet XmlTextReader;
        l_document: DotNet XmlDocument;
        l_ascii: DotNet Encoding;
        l_credentials: DotNet CredentialCache;
        l_cduFM: Codeunit "File Management";
        l_FileTest: File;
        l_StreamInTest: OutStream;
        l_CrLf: Text;
        l_FileMgt: Codeunit "File Management";
        l_strArchivo: Text;
        l_strToken: Text;
        l_strSign: Text;
        l_rst99008535: codeunit "Temp Blob";
        l_strFile: Text;
        l_rstDocumentosDigitalizados: Record "Documentos digitalizados";
        l_strNivel: array[12] of Text;
        l_rstUS: Record "User Setup";
        l_strRespuesta: Text;
        intLinea: Integer;
        l_rst23: Record Vendor;
        l_rstPPS: Record "Purchases & Payables Setup";
        l_Txt: Text;
        strFecha: Text[30];
        codEstado: Code[30];
        rstProveedor: Record Vendor;
        rstAreaImpuesto: Record "Tax Area";
        rstFecha: Record Date;
        l_intCantCUITs: Integer;
        i: Integer;
        l_intCantProveedores: Integer;
        l_codPrimerProveedor: Code[20];
        l_codUltimoProveedor: Code[20];
        l_rst23b: Record Vendor;
        l_TxtTemp: Text;
        l_dlgDialogo: Dialog;
        j: Integer;
        k: Integer;
        l_rst23c: Record Vendor temporary;
        l_OutStream: OutStream;
        l_rrDocsDigitalizados: RecordRef;
    begin
        Clear(l_dlgDialogo);
        l_dlgDialogo.Open('Verificando vigencia de autenticación Web Service...');
        fntVerificarVigenciaWS(l_strServicio, l_rst50400);
        fntTraerTokenySignWS(l_strServicio, l_strToken, l_strSign);
        l_dlgDialogo.Close;

        //Consulta cantidad CUITs que permite consultar
        l_dlgDialogo.Open('Consultando la cantidad máxima de CUITs posible a solicitar...');
        l_intCantCUITs := fntReprowebCantCUITs(l_strServicio, l_codCUITSolicitante);

        if l_intCantCUITs = 0 then
            Error('Debe verificar la cantidad máxima de consultas de CUIT.');

        Clear(l_rst23);
        Clear(l_rstPPS);
        l_rstPPS.Get();
        l_rst23.SetFilter("Vendor Posting Group", '<>%1', l_rstPPS."Grupo Contable Importaciones");
        l_rst23.SetFilter("VAT Registration No.", '<>%1', '');
        l_rst23.SetRange(Blocked, l_rst23.Blocked::" ");
        l_intCantProveedores := 0;
        l_intCantProveedores := l_rst23.Count;

        l_dlgDialogo.Open('Proveedor #1###########, número #2########## de #3###########...\' +
                          'Estado: #4#############');

        Clear(l_rst23c);
        l_rst23c.CopyFilters(l_rst23);
        if l_rst23c.FindLast then;
        i := 0;
        j := l_rst23.Count;
        l_dlgDialogo.Update(3, j);
        if l_rst23.FindSet then
            repeat

                l_dlgDialogo.Update(4, 'Armando consulta');
                i += 1;
                k += 1;

                l_dlgDialogo.Update(1, l_rst23.Name);
                l_dlgDialogo.Update(2, k);

                if i = 1 then
                    l_codPrimerProveedor := l_rst23."No.";


                if (i <> l_intCantCUITs)/* OR (l_rst23c."No." = l_rst23."No.")*/ then begin

                    l_codUltimoProveedor := l_rst23."No.";

                    Clear(l_xml);
                    //Reproweb Producción
                    l_sb := l_sb.StringBuilder();
                    l_url := 'https://servicios1.afip.gov.ar/wsagr/wsagr.asmx';
                    l_soapActionUrl := 'http://servicios1.afip.gob.ar/wsagr/Consulta';

                    l_sb.Append('<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:wsag="http://servicios1.afip.gob.ar/wsagr/">');
                    l_sb.Append('   <soap:Header/>');
                    l_sb.Append('   <soap:Body>');
                    l_sb.Append('      <wsag:Consulta>');
                    l_sb.Append('         <wsag:Auth>');
                    l_sb.Append('            <wsag:Token>' + l_strToken + '</wsag:Token>');
                    l_sb.Append('            <wsag:Sign>' + l_strSign + '</wsag:Sign>');
                    l_sb.Append('            <wsag:Cuit>' + l_codCUITSolicitante + '</wsag:Cuit>');
                    l_sb.Append('         </wsag:Auth>');
                    l_sb.Append('         <wsag:Periodo>' + l_strPeriodo + '</wsag:Periodo>');

                    Clear(l_rst23b);
                    Clear(l_rstPPS);
                    l_rstPPS.Get();
                    l_rst23b.SetFilter("Vendor Posting Group", '<>%1', l_rstPPS."Grupo Contable Importaciones");
                    l_rst23b.SetRange(Blocked, l_rst23b.Blocked::" ");
                    l_rst23b.SetFilter("No.", '%1..%2', l_codPrimerProveedor, l_codUltimoProveedor);
                    l_rst23b.SetFilter("VAT Registration No.", '<>%1', '');
                    if l_rst23b.FindSet then
                        repeat

                            if StrLen(DelChr(l_rst23b."VAT Registration No.", '=', '-')) <> 11 then begin

                                //ERROR('El CUIT del proveedor %1 es incorrecto. Por favor, verifíquelo y vuelva a intentar',l_rst23."VAT Registration No.");
                                l_rst23b.Blocked := l_rst23b.Blocked::All;
                                l_rst23b."Fecha consulta Reproweb" := 0D;
                                l_rst23b.Modify;

                            end
                            else
                                l_sb.Append('         <wsag:Cuit>' + DelChr(l_rst23b."VAT Registration No.", '=', '-') + '</wsag:Cuit>')

                        until l_rst23b.Next = 0;

                    l_sb.Append('      </wsag:Consulta>');
                    l_sb.Append('   </soap:Body>');
                    l_sb.Append('</soap:Envelope>');

                    l_sb.Append(l_xml);

                    l_uriObj := l_uriObj.Uri(l_url);

                    l_lgRequest := l_lgRequest.CreateDefault(l_uriObj);
                    l_lgRequest.Method := 'POST';
                    l_lgRequest.ContentType := 'text/xml; charset=utf-8';
                    if l_soapActionUrl <> '' then
                        l_lgRequest.Headers.Add('SOAPAction', l_soapActionUrl);
                    l_lgRequest.Timeout := 120000;
                    l_stream := l_stream.StreamWriter(l_lgRequest.GetRequestStream(), l_ascii.ASCII);
                    l_stream.Write(l_sb.ToString());
                    l_xml := l_sb.ToString;
                    l_stream.Close();
                    l_lgResponse := l_lgRequest.GetResponse();
                    l_str := l_lgResponse.GetResponseStream();
                    l_reader := l_reader.XmlTextReader(l_str);
                    l_document := l_document.XmlDocument();
                    l_document.Load(l_reader);

                    Clear(l_rstUS);
                    l_rstUS.SetRange("User ID", UserId);
                    if l_rstUS.FindFirst then;

                    l_strRespuesta := l_document.InnerXml();
                    if StrPos(l_strRespuesta, '<Err>') <> 0 then
                        fntControlErrores(l_document, l_rst23."VAT Registration No." + l_codCUITSolicitado, false);

                    l_Txt := l_strRespuesta;

                    l_dlgDialogo.Update(4, 'Actualizando base');
                    if StrPos(l_Txt, '</FTran>') <> 0 then
                        repeat

                            l_strRespuesta := CopyStr(l_Txt, 1, StrPos(l_Txt, '</FTran>') + StrLen('</FTran>'));
                            l_Txt := CopyStr(l_Txt, StrPos(l_Txt, '</FTran>') + StrLen('</FTran>'));

                            if l_strRespuesta <> '' then begin

                                //Niveles de digitalización
                                l_strNivel[1] := l_strServicio; //Servicio
                                l_strNivel[2] := Format(Today); //Fecha consulta
                                l_strNivel[3] := l_rstUS.Grupo; //Grupo seguridad
                                l_strNivel[4] := l_codCUITSolicitado;
                                l_strNivel[5] := UserId; //Usuario solicitud

                                //CUIT Solicitado
                                l_strNivel[6] := l_strRespuesta;
                                l_strNivel[6] := CopyStr(l_strNivel[6], StrPos(l_strNivel[6], '<Cuit>') + StrLen('<Cuit>'), 1000000);
                                l_strNivel[6] := CopyStr(l_strNivel[6], 1, StrPos(l_strNivel[6], '</Cuit>') - 1);

                                //Periodo solicitado
                                l_strNivel[7] := l_strRespuesta;
                                l_strNivel[7] := CopyStr(l_strNivel[7], StrPos(l_strNivel[7], '<Pdo>') + StrLen('<Pdo>'), 1000000);
                                l_strNivel[7] := CopyStr(l_strNivel[7], 1, StrPos(l_strNivel[7], '</Pdo>') - 1);

                                //Respuesta a estado situación fiscal
                                l_strNivel[8] := l_strRespuesta;
                                l_strNivel[8] := CopyStr(l_strNivel[8], StrPos(l_strNivel[8], '<Rsp>') + StrLen('<Rsp>'), 1000000);
                                l_strNivel[8] := CopyStr(l_strNivel[8], 1, StrPos(l_strNivel[8], '</Rsp>') - 1);

                                Clear(rstProveedor);
                                rstProveedor.SetRange("VAT Registration No.", CopyStr(l_strNivel[6], 1, 2) + '-' + CopyStr(l_strNivel[6], 3, 8) + '-' + CopyStr(l_strNivel[6], 11, 1));
                                if rstProveedor.FindFirst then begin

                                    Clear(rstAreaImpuesto);
                                    if rstAreaImpuesto.Get(rstProveedor."Tax Area Code") then begin

                                        if rstAreaImpuesto."Importar Reproweb" then begin

                                            Clear(rstFecha);
                                            rstFecha.SetRange(rstFecha."Period Type", rstFecha."Period Type"::Month);
                                            rstFecha.SetRange("Period Start", CalcDate('<-CM>', Today));
                                            if rstFecha.Find('-') then
                                                rstProveedor."Fecha consulta Reproweb" := rstFecha."Period End";

                                            rstProveedor."Estado de situación fiscal" := l_strNivel[8];
                                            rstProveedor.Modify;

                                        end;

                                    end;

                                end;

                            end;

                        until StrPos(l_Txt, '</FTran>') = 0;

                    Clear(l_rst99008535);
                    l_rst99008535.CreateOutStream(l_OutStream, TEXTENCODING::UTF8);
                    l_OutStream.WriteText(l_xml);

                    Clear(l_rstDocumentosDigitalizados);
                    if l_rstDocumentosDigitalizados.Find('+') then
                        intLinea := l_rstDocumentosDigitalizados.Linea
                    else
                        intLinea := 1;

                    Clear(l_rstDocumentosDigitalizados);
                    l_rstDocumentosDigitalizados.Linea := intLinea + 1;
                    l_rstDocumentosDigitalizados."Nivel 1" := CopyStr(l_strNivel[1], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 1"));
                    l_rstDocumentosDigitalizados."Nivel 2" := CopyStr(l_strNivel[2], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 2"));
                    l_rstDocumentosDigitalizados."Nivel 3" := CopyStr(l_strNivel[3], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 3"));
                    l_rstDocumentosDigitalizados."Nivel 4" := CopyStr(l_codPrimerProveedor, 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 4"));
                    l_rstDocumentosDigitalizados."Nivel 5" := CopyStr(l_strNivel[5], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 5"));
                    l_rstDocumentosDigitalizados."Nivel 6" := CopyStr(l_codUltimoProveedor, 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 6"));
                    l_rstDocumentosDigitalizados."Nivel 7" := CopyStr(l_strNivel[7], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 7"));
                    l_rstDocumentosDigitalizados."Nivel 8" := CopyStr(l_strNivel[8], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 8"));
                    l_rstDocumentosDigitalizados."Nivel 9" := CopyStr(l_strNivel[9], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 9"));
                    l_rstDocumentosDigitalizados."Nivel 10" := CopyStr(l_strNivel[10], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 10"));
                    l_rstDocumentosDigitalizados."Nivel 11" := CopyStr(l_strNivel[11], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 11"));
                    //l_rstDocumentosDigitalizados.BlobFile := l_rst99008535.Blob;
                    l_rstDocumentosDigitalizados.Insert;

                    clear(l_rrDocsDigitalizados);
                    l_rrDocsDigitalizados.get(l_rstDocumentosDigitalizados.RecordId);
                    l_rst99008535.ToRecordRef(l_rrDocsDigitalizados, l_rstDocumentosDigitalizados.FieldNo("BlobFile"));
                    l_rrDocsDigitalizados.Modify;

                    l_reader.Close();
                    l_str.Close();

                    i := 0;
                    l_codPrimerProveedor := '';
                    l_codUltimoProveedor := '';

                end;

            until l_rst23.Next = 0;

        l_dlgDialogo.Close;

    end;

    [Scope('OnPrem')]
    procedure fntReprowebCantCUITs(l_strServicio: Text[30]; l_codCUITSolicitante: Code[11]): Integer
    var
        l_rst50400: Record "AFIP Interface Register";
        Error0001: Label 'No se ha encontrado una conexión vigente a la AFIP para el servicio %1.';
        l_xml: Text;
        l_url: Text;
        l_soapActionUrl: Text;
        l_sb: DotNet StringBuilder;
        l_uriObj: DotNet Uri;
        l_lgRequest: DotNet HttpWebRequest;
        l_stream: DotNet StreamWriter;
        l_lgResponse: DotNet HttpWebResponse;
        l_str: DotNet Stream;
        l_reader: DotNet XmlTextReader;
        l_document: DotNet XmlDocument;
        l_ascii: DotNet Encoding;
        l_credentials: DotNet CredentialCache;
        l_cduFM: Codeunit "File Management";
        l_FileTest: File;
        l_StreamInTest: OutStream;
        l_CrLf: Text;
        l_FileMgt: Codeunit "File Management";
        l_strArchivo: Text;
        l_strToken: Text;
        l_strSign: Text;
        l_rst99008535: codeunit "Temp Blob";
        l_strFile: Text;
        l_rstDocumentosDigitalizados: Record "Documentos digitalizados";
        l_strNivel: array[12] of Text;
        l_rstUS: Record "User Setup";
        l_strRespuesta: Text;
        intLinea: Integer;
        l_rst23: Record Vendor temporary;
        l_rstPPS: Record "Purchases & Payables Setup";
        l_Txt: Text;
        strFecha: Text[30];
        codEstado: Code[30];
        rstProveedor: Record Vendor temporary;
        rstAreaImpuesto: Record "Tax Area";
        rstFecha: Record Date;
        l_intCant: Integer;
        l_OutStream: OutStream;
        l_rrDocsDigitalizados: RecordRef;
    begin
        //Consulta cantidad CUITs que permite consultar
        fntTraerTokenySignWS(l_strServicio, l_strToken, l_strSign);
        l_sb := l_sb.StringBuilder();
        l_url := 'https://servicios1.afip.gov.ar/wsagr/wsagr.asmx';
        l_soapActionUrl := 'http://servicios1.afip.gob.ar/wsagr/ConsultaCantCuit';

        l_sb.Append('<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:wsag="http://servicios1.afip.gob.ar/wsagr/">');
        l_sb.Append('   <soap:Header/>');
        l_sb.Append('   <soap:Body>');
        l_sb.Append('      <wsag:ConsultaCantCuit>');
        l_sb.Append('         <wsag:Auth>');
        l_sb.Append('            <wsag:Token>' + l_strToken + '</wsag:Token>');
        l_sb.Append('            <wsag:Sign>' + l_strSign + '</wsag:Sign>');
        l_sb.Append('            <wsag:Cuit>' + l_codCUITSolicitante + '</wsag:Cuit>');
        l_sb.Append('         </wsag:Auth>');
        l_sb.Append('      </wsag:ConsultaCantCuit>');
        l_sb.Append('   </soap:Body>');
        l_sb.Append('</soap:Envelope>');

        l_sb.Append(l_xml);

        l_uriObj := l_uriObj.Uri(l_url);

        l_lgRequest := l_lgRequest.CreateDefault(l_uriObj);
        l_lgRequest.Method := 'POST';
        l_lgRequest.ContentType := 'text/xml; charset=utf-8';
        if l_soapActionUrl <> '' then
            l_lgRequest.Headers.Add('SOAPAction', l_soapActionUrl);
        l_lgRequest.Timeout := 120000;
        l_stream := l_stream.StreamWriter(l_lgRequest.GetRequestStream(), l_ascii.ASCII);
        l_stream.Write(l_sb.ToString());
        l_xml := l_sb.ToString;
        l_stream.Close();
        l_lgResponse := l_lgRequest.GetResponse();
        l_str := l_lgResponse.GetResponseStream();
        l_reader := l_reader.XmlTextReader(l_str);
        l_document := l_document.XmlDocument();
        l_document.Load(l_reader);

        Clear(l_rstUS);
        l_rstUS.SetRange("User ID", UserId);
        if l_rstUS.FindFirst then;

        l_strRespuesta := l_document.InnerXml();
        if StrPos(l_strRespuesta, '<Err>') <> 0 then
            fntControlErrores(l_document, '', false);

        //Niveles de digitalización
        l_strNivel[1] := l_strServicio; //Servicio
        l_strNivel[2] := Format(Today); //Fecha consulta
        l_strNivel[3] := l_rstUS.Grupo; //Grupo seguridad
        l_strNivel[4] := '';
        l_strNivel[5] := UserId; //Usuario solicitud

        //Código Transacción
        l_strNivel[10] := l_strRespuesta;
        l_strNivel[10] := CopyStr(l_strNivel[10], StrPos(l_strNivel[10], '<Cantidad>') + StrLen('<Cantidad>'), 1000000);
        l_strNivel[10] := CopyStr(l_strNivel[10], 1, StrPos(l_strNivel[10], '</Cantidad>') - 1);
        Evaluate(l_intCant, l_strNivel[10]);

        Clear(l_rst99008535);

        Clear(l_rst99008535);
        l_rst99008535.CreateOutStream(l_OutStream, TEXTENCODING::UTF8);
        l_OutStream.WriteText(l_xml);

        Clear(l_rstDocumentosDigitalizados);
        if l_rstDocumentosDigitalizados.Find('+') then
            intLinea := l_rstDocumentosDigitalizados.Linea
        else
            intLinea := 1;

        Clear(l_rstDocumentosDigitalizados);
        l_rstDocumentosDigitalizados.Linea := intLinea + 1;
        l_rstDocumentosDigitalizados."Nivel 1" := CopyStr(l_strNivel[1], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 1"));
        l_rstDocumentosDigitalizados."Nivel 2" := CopyStr(l_strNivel[2], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 2"));
        l_rstDocumentosDigitalizados."Nivel 3" := CopyStr(l_strNivel[3], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 3"));
        l_rstDocumentosDigitalizados."Nivel 4" := CopyStr(l_strNivel[4], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 4"));
        l_rstDocumentosDigitalizados."Nivel 5" := CopyStr(l_strNivel[5], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 5"));
        l_rstDocumentosDigitalizados."Nivel 6" := CopyStr(UserId, 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 6"));
        l_rstDocumentosDigitalizados."Nivel 7" := '';
        l_rstDocumentosDigitalizados."Nivel 8" := '';
        l_rstDocumentosDigitalizados."Nivel 9" := '';
        l_rstDocumentosDigitalizados."Nivel 10" := CopyStr(l_strNivel[10], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 10"));
        l_rstDocumentosDigitalizados."Nivel 11" := '';
        //l_rstDocumentosDigitalizados.BlobFile := l_rst99008535.Blob;
        l_rstDocumentosDigitalizados.Insert;

        clear(l_rrDocsDigitalizados);
        l_rrDocsDigitalizados.get(l_rstDocumentosDigitalizados.RecordId);
        l_rst99008535.ToRecordRef(l_rrDocsDigitalizados, l_rstDocumentosDigitalizados.FieldNo("BlobFile"));
        l_rrDocsDigitalizados.Modify;

        l_reader.Close();
        l_str.Close();

        exit(l_intCant);
    end;

    local procedure fntControlErrores(l_document: DotNet XmlDocument; l_code: Code[20]; l_blnDetenerProceso: Boolean): Text
    var
        l_strRespuesta: Text;
        l_strNivel: array[2] of Text;
        l_rst99008535: codeunit "Temp Blob";
        l_rstDocumentosDigitalizados: Record "Documentos digitalizados";
        intLinea: Integer;
        l_strError: Text;
        l_OutStream: OutStream;
        l_rrDocsDigitalizados: RecordRef;
    begin
        l_strRespuesta := l_document.InnerXml();

        if StrPos(l_strRespuesta, '<Obs') <> 0 then begin
            l_strError := CopyStr(l_strRespuesta, StrPos(l_strRespuesta, '<Obs') - StrLen('<Obs') - 1, 1024);

            if StrPos(l_strError, '<Code>') <> 0 then begin

                l_strNivel[1] := l_strError;
                l_strNivel[1] := CopyStr(l_strNivel[1], StrPos(l_strNivel[1], '<Code>') + StrLen('<Code>'), 1000000);
                l_strNivel[1] := CopyStr(l_strNivel[1], 1, StrPos(l_strNivel[1], '</Code>') - 1);
                l_blnDetenerProceso := false;

            end;

            if StrPos(l_strError, '<Msg>') <> 0 then begin

                l_strNivel[2] := l_strError;
                l_strNivel[2] := CopyStr(l_strNivel[2], StrPos(l_strNivel[2], '<Msg>') + StrLen('<Msg>'), 1000000);
                l_strNivel[2] := CopyStr(l_strNivel[2], 1, StrPos(l_strNivel[2], '</Msg>') - 1);
                l_blnDetenerProceso := false;

            end;

        end;

        l_strRespuesta := l_document.InnerXml();
        if StrPos(l_strRespuesta, '<Error') <> 0 then begin
            l_strError := CopyStr(l_strRespuesta, StrPos(l_strRespuesta, '<Error') - StrLen('<Error') - 1, 1024);

            //Código Error
            if StrPos(l_strError, '<Code>') <> 0 then begin

                l_strNivel[1] := l_strError;
                l_strNivel[1] := CopyStr(l_strNivel[1], StrPos(l_strNivel[1], '<Code>') + StrLen('<Code>'), 1000000);
                l_strNivel[1] := CopyStr(l_strNivel[1], 1, StrPos(l_strNivel[1], '</Code>') - 1);
                l_code := l_strNivel[1];
                l_blnDetenerProceso := true;

            end;

            if StrPos(l_strError, '<Msg>') <> 0 then begin

                l_strNivel[2] := l_strError;
                l_strNivel[2] := CopyStr(l_strNivel[2], StrPos(l_strNivel[2], '<Msg>') + StrLen('<Msg>'), 1000000);
                l_strNivel[2] := CopyStr(l_strNivel[2], 1, StrPos(l_strNivel[2], '</Msg>') - 1);
                l_blnDetenerProceso := true;

            end;
            //Mensaje Error

        end;

        Clear(l_rst99008535);
        l_rst99008535.CreateOutStream(l_OutStream, TEXTENCODING::UTF8);
        l_OutStream.WriteText(l_strRespuesta);

        Clear(l_rstDocumentosDigitalizados);
        if l_rstDocumentosDigitalizados.Find('+') then
            intLinea := l_rstDocumentosDigitalizados.Linea
        else
            intLinea := 1;

        Clear(l_rstDocumentosDigitalizados);
        l_rstDocumentosDigitalizados.Linea := intLinea + 1;
        l_rstDocumentosDigitalizados."Nivel 1" := l_strNivel[1];
        l_rstDocumentosDigitalizados."Nivel 2" := 'ERROR';
        /*
        l_rstDocumentosDigitalizados."Nivel 3" := l_strNivel[3];
        l_rstDocumentosDigitalizados."Nivel 4" := l_strNivel[4];
        l_rstDocumentosDigitalizados."Nivel 5" := l_strNivel[5];
        l_rstDocumentosDigitalizados."Nivel 6" := l_strNivel[6];
        l_rstDocumentosDigitalizados."Nivel 7" := l_strNivel[7];
        l_rstDocumentosDigitalizados."Nivel 8" := l_strNivel[8];
        l_rstDocumentosDigitalizados."Nivel 9" := l_strNivel[9];
        l_rstDocumentosDigitalizados."Nivel 10" := l_strNivel[10];
        l_rstDocumentosDigitalizados."Nivel 11" := l_strNivel[11];
        */
        //l_rstDocumentosDigitalizados.BlobFile := l_rst99008535.Blob;
        l_rstDocumentosDigitalizados.Insert;

        clear(l_rrDocsDigitalizados);
        l_rrDocsDigitalizados.get(l_rstDocumentosDigitalizados.RecordId);
        l_rst99008535.ToRecordRef(l_rrDocsDigitalizados, l_rstDocumentosDigitalizados.FieldNo("BlobFile"));
        l_rrDocsDigitalizados.Modify;

        Commit;

        if l_blnDetenerProceso then
            Error('La interfaz con AFIP ha emitido el error %1, con el valor %2. El registro que generó el error fue el %3.', l_strNivel[1], l_strNivel[2], l_code)
        else
            if not Confirm('La interfaz con AFIP ha emitido el error ' + l_strNivel[1] + ', con el valor ' + l_strNivel[2] + '. El registro que generó el error fue el ' + l_code + '.\' +
                       '¿Desea continuar?', true) then
                Error('La interfaz con AFIP ha emitido el error ' + l_strNivel[1] + ', con el valor ' + l_strNivel[2] + '. El registro que generó el error fue el ' + l_code);

    end;

    local procedure fntInsertarYEjecutar()
    begin
    end;

    local procedure fntFE()
    begin
    end;

    [Scope('OnPrem')]
    procedure fntPersonaService5(l_strServicio: Text[30]; l_codCUITSolicitante: Code[11]; l_codCUITSolicitado: Code[11]; l_strPeriodo: Code[7]; var l_rst23: Record Vendor)
    var
        l_rst50400: Record "AFIP Interface Register";
        Error0001: Label 'No se ha encontrado una conexión vigente a la AFIP para el servicio %1.';
        l_xml: Text;
        l_url: Text;
        l_soapActionUrl: Text;
        l_sb: DotNet StringBuilder;
        l_uriObj: DotNet Uri;
        l_lgRequest: DotNet HttpWebRequest;
        l_streamwriter: DotNet StreamWriter;
        l_streamReader: DotNet StreamReader;
        l_lgResponse: DotNet HttpWebResponse;
        l_str: DotNet Stream;
        l_reader: DotNet XmlTextReader;
        l_document: DotNet XmlDocument;
        l_ascii: DotNet Encoding;
        l_credentials: DotNet CredentialCache;
        l_cduFM: Codeunit "File Management";
        l_FileTest: File;
        l_StreamInTest: OutStream;
        l_CrLf: Text;
        l_FileMgt: Codeunit "File Management";
        l_strArchivo: Text;
        l_strToken: Text;
        l_strSign: Text;
        l_rst99008535: Codeunit "Temp Blob";
        l_strFile: Text;
        l_rstDocumentosDigitalizados: Record "Documentos digitalizados";
        l_strNivel: array[12] of Text;
        l_rstUS: Record "User Setup";
        l_strRespuesta: Text;
        intLinea: Integer;
        l_rstPPS: Record "Purchases & Payables Setup";
        l_Txt: Text;
        strFecha: Text[30];
        codEstado: Code[30];
        rstProveedor: Record Vendor temporary;
        rstAreaImpuesto: Record "Tax Area";
        rstFecha: Record Date;
        l_intCantCUITs: Integer;
        i: Integer;
        l_intCantProveedores: Integer;
        l_codPrimerProveedor: Code[20];
        l_codUltimoProveedor: Code[20];
        l_rst23b: Record Vendor;
        l_TxtTemp: Text;
        l_dlgDialogo: Dialog;
        j: Integer;
        k: Integer;
        t_rst23c: Record Vendor temporary;
        l_rstGLS: Record "General Ledger Setup";
        l_rstDV: Record "Dimension Value";
        l_rst352: Record "Default Dimension";
        l_TxtTempB: Text;
        l_strDescrImpuesto: Text;
        l_strIdImpuesto: Text;
        l_strPeriodoImpuesto: Text[6];
        l_strName: Text;
        l_rstAP: Record "Actividad proveedor";
        l_rstAA: Record "Actividad AFIP";
        l_intMes: Integer;
        l_intYear: Integer;
        l_strtipoRegimen: Text;
        l_strIdRegimen: Text;
        l_strIdOrden: Text;
        l_rst50401: Record "AFIP Interface Register detail";
        l_pge50507: Page "AFIP Interface Register detail";
        Error0002: Label 'Se ha detenido la actualización.';
        l_strCK: Text;
        l_strIdCategoria: Text;
        l_datFecha: Date;
        l_OutStream: OutStream;
        l_rrDocsDigitalizados: RecordRef;
    begin
        Clear(l_dlgDialogo);
        l_dlgDialogo.Open('Verificando vigencia de autenticación Web Service...');
        fntVerificarVigenciaWS(l_strServicio, l_rst50400);
        fntTraerTokenySignWS(l_strServicio, l_strToken, l_strSign);
        l_dlgDialogo.Close;

        Clear(l_rstGLS);
        Clear(l_rstPPS);
        l_rstPPS.Get();
        l_rstGLS.Get();
        //Inicializar
        l_Txt := '';
        l_strRespuesta := '';
        for i := 1 to 10 do begin
            l_strNivel[i] := '';
        end;

        l_dlgDialogo.Open('Proveedor #1###########, número #2########## de #3###########...\' +
                          'Estado: #4#############');

        i := 0;
        l_dlgDialogo.Update(3, j);
        j := l_rst23.Count;
        l_intCantProveedores := l_rst23.Count;
        /*
        IF l_codCUITSolicitado <> '' then
          l_rst23.SETRANGE("No.",l_rst23."No.");
        */
        if l_rst23.FindSet then
            repeat

                l_dlgDialogo.Update(4, 'Armando consulta');

                i += 1;
                k += 1;

                l_dlgDialogo.Update(1, l_rst23.Name);
                l_dlgDialogo.Update(2, k);

                if i = 1 then
                    l_codPrimerProveedor := l_rst23."No.";
                l_codUltimoProveedor := l_rst23."No.";

                Clear(l_xml);
                //Reproweb Producción
                l_sb := l_sb.StringBuilder();
                l_url := 'https://aws.afip.gov.ar/sr-padron/webservices/personaServiceA5';
                l_soapActionUrl := 'getPersona_v2';

                l_sb.Append('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:a5="http://a5.soap.ws.server.puc.sr/">');
                l_sb.Append('   <soapenv:Header/>');
                l_sb.Append('   <soapenv:Body>');
                l_sb.Append('      <a5:getPersona_v2>');
                l_sb.Append('          <token>' + l_strToken + '</token>');
                l_sb.Append('          <sign>' + l_strSign + '</sign>');
                l_sb.Append('          <cuitRepresentada>' + l_codCUITSolicitante + '</cuitRepresentada>');

                Clear(l_rst23b);
                Clear(l_rstPPS);
                l_rstPPS.Get();
                l_rst23b.SetFilter("Vendor Posting Group", '<>%1', l_rstPPS."Grupo Contable Importaciones");
                l_rst23b.SetRange(Blocked, l_rst23b.Blocked::" ");
                l_rst23b.SetFilter("No.", '%1..%2', l_codPrimerProveedor, l_codUltimoProveedor);
                if l_rst23b.FindSet then
                    repeat

                        if StrLen(DelChr(l_rst23b."VAT Registration No.", '=', '-')) <> 11 then begin

                            //ERROR('El CUIT del proveedor %1 es incorrecto. Por favor, verifíquelo y vuelva a intentar',l_rst23."VAT Registration No.");
                            l_rst23b.Blocked := l_rst23b.Blocked::All;
                            l_rst23b."Fecha Consulta" := 0D;
                            l_rst23b.Modify;

                        end
                        else
                            l_sb.Append('          <idPersona>' + DelChr(l_rst23b."VAT Registration No.", '=', '-') + '</idPersona>')

                    until l_rst23b.Next = 0;

                l_sb.Append('      </a5:getPersona_v2>');
                l_sb.Append('   </soapenv:Body>');
                l_sb.Append('</soapenv:Envelope>');

                l_sb.Append(l_xml);

                l_uriObj := l_uriObj.Uri(l_url);

                l_dlgDialogo.Update(4, 'Enviando consulta');
                l_lgRequest := l_lgRequest.CreateDefault(l_uriObj);
                l_lgRequest.Method := 'POST';
                l_lgRequest.ContentType := 'text/xml; charset=unicode';
                if l_soapActionUrl <> '' then
                    l_lgRequest.Headers.Add('SOAPAction', l_soapActionUrl);
                l_lgRequest.Timeout := 120000;
                l_streamwriter := l_streamwriter.StreamWriter(l_lgRequest.GetRequestStream(), l_ascii.Unicode);
                l_streamwriter.Write(l_sb.ToString());
                l_xml := l_sb.ToString;
                l_streamwriter.Close();
                l_lgResponse := l_lgRequest.GetResponse();
                l_str := l_lgResponse.GetResponseStream();
                l_reader := l_reader.XmlTextReader(l_str);
                l_document := l_document.XmlDocument();
                l_document.Load(l_reader);

                Clear(l_rstUS);
                l_rstUS.SetRange("User ID", UserId);
                if l_rstUS.FindFirst then;

                l_strRespuesta := l_document.InnerXml();
                if StrPos(l_strRespuesta, '<error') <> 0 then
                    fntControlErrores(l_document, l_rst23."VAT Registration No.", true);

                l_Txt := l_strRespuesta;

                l_Txt := fntAnularAcentosyEnes(l_Txt);

                l_dlgDialogo.Update(4, 'Actualizando base');
                if StrPos(l_Txt, '</ns2:getPersona_v2Response>') <> 0 then
                    repeat

                        //l_strRespuesta := COPYSTR(l_Txt,1,STRPOS(l_Txt,'</ns2:getPersona_v2Response>')+STRLEN('</ns2:getPersona_v2Response>'));
                        l_Txt := CopyStr(l_Txt, StrPos(l_Txt, '</ns2:getPersona_v2Response>') + StrLen('</ns2:getPersona_v2Response>'));

                        if l_strRespuesta <> '' then begin

                            //Niveles de digitalización
                            l_strNivel[1] := l_strServicio; //Servicio
                            l_strNivel[2] := Format(Today); //Fecha consulta
                            l_strNivel[3] := l_rstUS.Grupo; //Grupo seguridad
                            l_strNivel[4] := l_rst23."No.";
                            l_strNivel[5] := UserId; //Usuario solicitud

                            //CUIT Solicitado
                            l_strNivel[6] := l_strRespuesta;
                            l_strNivel[6] := CopyStr(l_strNivel[6], StrPos(l_strNivel[6], '<idPersona>') + StrLen('<idPersona>'), 1000000);
                            l_strNivel[6] := CopyStr(l_strNivel[6], 1, StrPos(l_strNivel[6], '</idPersona>') - 1);
                            //MESSAGE(l_strRespuesta);
                            //Nombre
                            l_strNivel[7] := l_strRespuesta;
                            if StrPos(l_strNivel[7], '<nombre>') <> 0 then begin

                                l_strNivel[7] := CopyStr(l_strNivel[7], StrPos(l_strNivel[7], '<nombre>') + StrLen('<nombre>'), 1000000);
                                l_strNivel[7] := CopyStr(l_strNivel[7], 1, StrPos(l_strNivel[7], '</nombre>') - 1);

                            end
                            else
                                l_strNivel[7] := '';

                            //Apellido
                            l_strNivel[8] := l_strRespuesta;
                            if StrPos(l_strNivel[8], '<apellido>') <> 0 then begin

                                l_strNivel[8] := CopyStr(l_strNivel[8], StrPos(l_strNivel[8], '<apellido>') + StrLen('<apellido>'), 1000000);
                                l_strNivel[8] := CopyStr(l_strNivel[8], 1, StrPos(l_strNivel[8], '</apellido>') - 1);

                            end
                            else
                                l_strNivel[8] := '';


                            //Código Transacción
                            if StrPos(l_strRespuesta, '<RTran>') <> 0 then begin

                                l_strNivel[9] := l_strRespuesta;
                                l_strNivel[9] := CopyStr(l_strNivel[9], StrPos(l_strNivel[9], '<RTran>') + StrLen('<RTran>'), 1000000);
                                l_strNivel[9] := CopyStr(l_strNivel[9], 1, StrPos(l_strNivel[9], '</RTran>') - 1);

                            end;
                            ///INSERTAR DATOS EN PROVEEDOR

                            Clear(l_rst99008535);
                            l_rst99008535.CreateOutStream(l_OutStream, TEXTENCODING::UTF8);
                            l_OutStream.WriteText(l_strRespuesta);

                            Clear(l_rstDocumentosDigitalizados);
                            if l_rstDocumentosDigitalizados.Find('+') then
                                intLinea := l_rstDocumentosDigitalizados.Linea
                            else
                                intLinea := 1;

                            Clear(l_rstDocumentosDigitalizados);
                            l_rstDocumentosDigitalizados.Linea := intLinea + 1;
                            l_rstDocumentosDigitalizados."Nivel 1" := CopyStr(l_strNivel[1], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 1"));
                            l_rstDocumentosDigitalizados."Nivel 2" := CopyStr(l_strNivel[2], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 2"));
                            l_rstDocumentosDigitalizados."Nivel 3" := CopyStr(l_strNivel[3], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 3"));
                            l_rstDocumentosDigitalizados."Nivel 4" := CopyStr(l_codPrimerProveedor, 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 4"));
                            l_rstDocumentosDigitalizados."Nivel 5" := CopyStr(l_strNivel[5], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 5"));
                            l_rstDocumentosDigitalizados."Nivel 6" := CopyStr(l_codUltimoProveedor, 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 6"));
                            l_rstDocumentosDigitalizados."Nivel 7" := CopyStr(l_strNivel[7], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 7"));
                            l_rstDocumentosDigitalizados."Nivel 8" := CopyStr(l_strNivel[8], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 8"));
                            l_rstDocumentosDigitalizados."Nivel 9" := CopyStr(l_strNivel[9], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 9"));
                            l_rstDocumentosDigitalizados."Nivel 10" := CopyStr(l_strNivel[10], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 10"));
                            l_rstDocumentosDigitalizados."Nivel 11" := CopyStr(l_strNivel[11], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 11"));
                            //l_rstDocumentosDigitalizados.BlobFile := l_rst99008535.Blob;
                            l_rstDocumentosDigitalizados.Insert;

                            clear(l_rrDocsDigitalizados);
                            l_rrDocsDigitalizados.get(l_rstDocumentosDigitalizados.RecordId);
                            l_rst99008535.ToRecordRef(l_rrDocsDigitalizados, l_rstDocumentosDigitalizados.FieldNo("BlobFile"));
                            l_rrDocsDigitalizados.Modify;

                            //Razón social, nombre y apellido
                            l_TxtTemp := l_strRespuesta;
                            if StrPos(l_TxtTemp, '<razonSocial>') <> 0 then begin

                                l_TxtTemp := CopyStr(l_TxtTemp, StrPos(l_TxtTemp, '<razonSocial>') + StrLen('<razonSocial>'), 1000000);
                                if StrPos(l_TxtTemp, '</razonSocial>') <> 0 then
                                    l_strName := CopyStr(l_TxtTemp, 1, StrPos(l_TxtTemp, '</razonSocial>') - 1);

                            end
                            else
                                l_strName := l_strNivel[8] + ', ' + l_strNivel[7];


                            //Copiar proveedor a uno temporal
                            Clear(t_rst23c);
                            t_rst23c.Copy(l_rst23);

                            fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::Vendor, t_rst23c.FieldNo(Name), l_rst23.Name, CopyStr(l_strName, 1, 50), CopyStr(t_rst23c.GetPosition, 1, 250));
                            t_rst23c.Validate(Name, CopyStr(l_strName, 1, 50));

                            fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::Vendor, t_rst23c.FieldNo("Name 2"), l_rst23."Name 2", CopyStr(l_strName, 51, 50), CopyStr(t_rst23c.GetPosition, 1, 250));
                            t_rst23c.Validate("Name 2", CopyStr(l_strName, 51, 50));

                            //EVALUATE(t_rst23c."Fecha consulta",l_strNivel[10]);
                            l_datFecha := Today;

                            fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::Vendor, t_rst23c.FieldNo("Fecha Consulta"), Format(l_rst23."Fecha Consulta"), Format(CalcDate('<+CM>', l_datFecha)), CopyStr(t_rst23c.GetPosition, 1, 250));
                            t_rst23c."Fecha Consulta" := CalcDate('<+CM>', l_datFecha);

                            l_TxtTemp := l_strRespuesta;
                            l_TxtTemp := CopyStr(l_TxtTemp, StrPos(l_TxtTemp, '<codPostal>') + StrLen('<codPostal>'), 1000000);
                            t_rst23c.Address := CopyStr(l_TxtTemp, 1, StrPos(l_TxtTemp, '</codPostal>') - 1);

                            fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::Vendor, t_rst23c.FieldNo("Post Code"), l_rst23."Post Code", CopyStr(l_TxtTemp, 1, StrPos(l_TxtTemp, '</codPostal>') - 1), CopyStr(t_rst23c.GetPosition, 1, 250));

                            l_TxtTemp := l_strRespuesta;
                            l_TxtTemp := CopyStr(l_TxtTemp, StrPos(l_TxtTemp, '<direccion>') + StrLen('<direccion>'), 1000000);
                            //t_rst23c.Address := COPYSTR(l_TxtTemp,1,STRPOS(l_TxtTemp,'</direccion>')-1);
                            t_rst23c.Address := CopyStr(CopyStr(l_TxtTemp, 1, StrPos(l_TxtTemp, '</direccion>') - 1), 1, 50);

                            fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::Vendor, t_rst23c.FieldNo(Address), l_rst23.Address, CopyStr(l_TxtTemp, 1, StrPos(l_TxtTemp, '</direccion>') - 1), CopyStr(t_rst23c.GetPosition, 1, 250));

                            l_TxtTemp := l_strRespuesta;
                            l_TxtTemp := CopyStr(l_TxtTemp, StrPos(l_TxtTemp, '<direccion>') + StrLen('<direccion>'), 1000000);
                            //t_rst23c.Address := COPYSTR(l_TxtTemp,1,STRPOS(l_TxtTemp,'</direccion>')-1);
                            t_rst23c.Address := CopyStr(CopyStr(l_TxtTemp, 1, StrPos(l_TxtTemp, '</direccion>') - 1), 1, 50);

                            l_TxtTemp := l_strRespuesta;
                            l_TxtTemp := CopyStr(l_TxtTemp, StrPos(l_TxtTemp, '<tipoPersona>') + StrLen('<tipoPersona>'), 1000000);
                            l_TxtTemp := CopyStr(l_TxtTemp, 1, StrPos(l_TxtTemp, '</tipoPersona>') - 1);

                            fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::Vendor, t_rst23c.FieldNo("Tipo persona"), Format(l_rst23."Tipo persona"), l_TxtTemp, CopyStr(t_rst23c.GetPosition, 1, 250));
                            case l_TxtTemp of
                                'Fisica':
                                    t_rst23c."Tipo persona" := t_rst23c."Tipo persona"::Fisica;
                                'Juridica':
                                    t_rst23c."Tipo persona" := t_rst23c."Tipo persona"::Juridica;
                            end;

                            l_TxtTemp := l_strRespuesta;
                            while ((StrPos(l_TxtTemp, '<descripcionImpuesto>') + StrPos(l_TxtTemp, '</descripcionImpuesto>')) <> 0) do begin

                                if StrPos(l_TxtTemp, '<descripcionImpuesto>') <> 0 then begin
                                    l_TxtTemp := CopyStr(l_TxtTemp, StrPos(l_TxtTemp, '<descripcionImpuesto>') + StrLen('<descripcionImpuesto>'), 1000000);
                                    l_TxtTempB := l_TxtTemp;
                                end
                                else begin
                                    l_TxtTempB := l_TxtTemp;
                                    l_TxtTemp := '';
                                end;

                                l_strDescrImpuesto := CopyStr(l_TxtTempB, 1, StrPos(l_TxtTempB, '</descripcionImpuesto>') - 1);

                                if StrPos(l_TxtTemp, '<idImpuesto>') <> 0 then begin
                                    l_TxtTemp := CopyStr(l_TxtTemp, StrPos(l_TxtTemp, '<idImpuesto>') + StrLen('<idImpuesto>'), 1000000);
                                    l_TxtTempB := l_TxtTemp;
                                end
                                else begin
                                    l_TxtTempB := l_TxtTemp;
                                    l_TxtTemp := '';
                                end;

                                l_strIdImpuesto := CopyStr(l_TxtTempB, 1, StrPos(l_TxtTempB, '</idImpuesto>') - 1);

                                if StrPos(l_TxtTemp, '<periodo>') <> 0 then begin
                                    l_TxtTemp := CopyStr(l_TxtTemp, StrPos(l_TxtTemp, '<periodo>') + StrLen('<periodo>'), 1000000);
                                    l_TxtTempB := l_TxtTemp;
                                end
                                else begin
                                    l_TxtTempB := l_TxtTemp;
                                    l_TxtTemp := '';
                                end;

                                l_strPeriodoImpuesto := CopyStr(l_TxtTempB, 1, StrPos(l_TxtTempB, '</periodo>') - 1);

                                Clear(l_rstDV);
                                l_rstDV.SetRange("Dimension Code", l_rstGLS."WS - Taxes");
                                l_rstDV.SetRange(Code, l_strIdImpuesto);
                                if not l_rstDV.FindFirst then begin

                                    Clear(l_rstDV);
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Dimension Value", l_rstDV.FieldNo("Dimension Code"), l_rstDV."Dimension Code", l_rstGLS."WS - Taxes", '');
                                    l_rstDV."Dimension Code" := l_rstGLS."WS - Taxes";
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Dimension Value", l_rstDV.FieldNo(Code), l_rstDV.Code, l_strIdImpuesto, '');
                                    l_rstDV.Code := l_strIdImpuesto;
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Dimension Value", l_rstDV.FieldNo(Name), l_rstDV.Name, l_strDescrImpuesto, '');
                                    l_rstDV.Name := l_strDescrImpuesto;
                                    if l_rstDV.Insert(true) then;

                                end;

                                Clear(l_rstAA);
                                l_rstAA.SetRange(l_rstAA."No. actividad", l_strIdImpuesto);
                                l_rstAA.SetRange(l_rstAA.Nombre, l_strDescrImpuesto);
                                l_rstAA.SetRange(l_rstAA."Tipo actividad", l_rstAA."Tipo actividad"::Impuesto);
                                if not l_rstAA.FindFirst then begin

                                    Clear(l_rstAA);
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad AFIP", l_rstAA.FieldNo("No. actividad"), l_rstAA."No. actividad", l_strIdImpuesto, '');
                                    l_rstAA."No. actividad" := l_strIdImpuesto;
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad AFIP", l_rstAA.FieldNo(Nombre), l_rstAA.Nombre, l_strDescrImpuesto, '');
                                    l_rstAA.Nombre := l_strDescrImpuesto;
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad AFIP", l_rstAA.FieldNo("Tipo actividad"), Format(l_rstAA."Tipo actividad"), Format(l_rstAA."Tipo actividad"::Impuesto), '');
                                    l_rstAA."Tipo actividad" := l_rstAA."Tipo actividad"::Impuesto;
                                    if l_rstAA.Insert(true) then;

                                end;

                                Clear(l_rstAP);
                                l_rstAP.SetRange("No. proveedor", t_rst23c."No.");
                                l_rstAP.SetRange("No. actividad", l_strIdImpuesto);
                                if l_rstAP.IsEmpty then begin

                                    Clear(l_rstAP);
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad proveedor", l_rstAP.FieldNo("No. proveedor"), l_rstAP."No. proveedor", t_rst23c."No.", '');
                                    l_rstAP."No. proveedor" := t_rst23c."No.";
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad proveedor", l_rstAP.FieldNo("No. actividad"), l_rstAP."No. actividad", l_strIdImpuesto, '');
                                    l_rstAP."No. actividad" := l_strIdImpuesto;
                                    Evaluate(l_intMes, CopyStr(l_strPeriodoImpuesto, 5, 2));
                                    Evaluate(l_intYear, CopyStr(l_strPeriodoImpuesto, 1, 4));
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad proveedor", l_rstAP.FieldNo("Fecha alta"), Format(l_rstAP."Fecha alta"), Format(DMY2Date(1, l_intMes, l_intYear)), '');
                                    l_rstAP."Fecha alta" := DMY2Date(1, l_intMes, l_intYear);
                                    //l_rstAP."Fecha baja" := 0d;
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad proveedor", l_rstAP.FieldNo("Tipo actividad"), Format(l_rstAP."Tipo actividad"), Format(l_rstAP."Tipo actividad"::Impuesto), '');
                                    l_rstAP."Tipo actividad" := l_rstAP."Tipo actividad"::Impuesto;
                                    if not l_rstAP.Insert(true) then;

                                end;
                                /*
                                No creo relaciones con estas dimensiones, porque existen varias combinaciones para un mismo proveedor.
                                CLEAR(l_rst352);
                                l_rst352.SETRANGE(l_rst352."Table ID",23);
                                l_rst352.SETRANGE(l_rst352."No.",t_rst23c."No.");
                                l_rst352.SETRANGE("Dimension Code",l_rstGLS."WS - Taxes");
                                l_rst352.SETRANGE("Dimension Value Code",l_strIdImpuesto);
                                IF l_rst352.ISEMPTY THEN
                                BEGIN

                                  CLEAR(l_rst352);
                                  fntRegistroDetail(l_rst50400,l_rstDocumentosDigitalizados,DATABASE::"Default Dimension",l_rst352.FIELDNO("Table ID"),FORMAT(l_rst352."Table ID"),FORMAT(DATABASE::Vendor),'');
                                  l_rst352."Table ID" := DATABASE::Vendor;
                                  fntRegistroDetail(l_rst50400,l_rstDocumentosDigitalizados,DATABASE::"Default Dimension",l_rst352.FIELDNO("No."),l_rst352."No.",t_rst23c."No.",'');
                                  l_rst352."No." := t_rst23c."No.";
                                  fntRegistroDetail(l_rst50400,l_rstDocumentosDigitalizados,DATABASE::"Default Dimension",l_rst352.FIELDNO("Dimension Code"),FORMAT(l_rst352."Dimension Code"),l_rstGLS."WS - Taxes",'');
                                  l_rst352."Dimension Code" := l_rstGLS."WS - Taxes";
                                  fntRegistroDetail(l_rst50400,l_rstDocumentosDigitalizados,DATABASE::"Default Dimension",l_rst352.FIELDNO("Dimension Value Code"),FORMAT(l_rst352."Dimension Value Code"),FORMAT(l_strIdImpuesto),'');
                                  l_rst352."Dimension Value Code" := l_strIdImpuesto;
                                  IF NOT l_rst352.INSERT(TRUE) THEN;

                                END;
                                */
                            end;

                            l_TxtTemp := l_strRespuesta;
                            while ((StrPos(l_TxtTemp, '<descripcionActividad>') + StrPos(l_TxtTemp, '</descripcionActividad>')) <> 0) do begin

                                if StrPos(l_TxtTemp, '<descripcionActividad>') <> 0 then begin
                                    l_TxtTemp := CopyStr(l_TxtTemp, StrPos(l_TxtTemp, '<descripcionActividad>') + StrLen('<descripcionActividad>'), 1000000);
                                    l_TxtTempB := l_TxtTemp;
                                end
                                else begin
                                    l_TxtTempB := l_TxtTemp;
                                    l_TxtTemp := '';
                                end;

                                l_strDescrImpuesto := CopyStr(l_TxtTempB, 1, StrPos(l_TxtTempB, '</descripcionActividad>') - 1);

                                if StrPos(l_TxtTemp, '<idActividad>') <> 0 then begin
                                    l_TxtTemp := CopyStr(l_TxtTemp, StrPos(l_TxtTemp, '<idActividad>') + StrLen('<idActividad>'), 1000000);
                                    l_TxtTempB := l_TxtTemp;
                                end
                                else begin
                                    l_TxtTempB := l_TxtTemp;
                                    l_TxtTemp := '';
                                end;

                                l_strIdRegimen := CopyStr(l_TxtTempB, 1, StrPos(l_TxtTempB, '</idActividad>') - 1);

                                if StrPos(l_TxtTemp, '<nomenclador>') <> 0 then begin
                                    l_TxtTemp := CopyStr(l_TxtTemp, StrPos(l_TxtTemp, '<nomenclador>') + StrLen('<nomenclador>'), 1000000);
                                    l_TxtTempB := l_TxtTemp;
                                end
                                else begin
                                    l_TxtTempB := l_TxtTemp;
                                    l_TxtTemp := '';
                                end;

                                l_strIdImpuesto := CopyStr(l_TxtTempB, 1, StrPos(l_TxtTempB, '</nomenclador>') - 1);

                                if StrPos(l_TxtTemp, '<orden>') <> 0 then begin
                                    l_TxtTemp := CopyStr(l_TxtTemp, StrPos(l_TxtTemp, '<orden>') + StrLen('<orden>'), 1000000);
                                    l_TxtTempB := l_TxtTemp;
                                end
                                else begin
                                    l_TxtTempB := l_TxtTemp;
                                    l_TxtTemp := '';
                                end;

                                l_strIdOrden := CopyStr(l_TxtTempB, 1, StrPos(l_TxtTempB, '</orden>') - 1);

                                if StrPos(l_TxtTemp, '<periodo>') <> 0 then begin
                                    l_TxtTemp := CopyStr(l_TxtTemp, StrPos(l_TxtTemp, '<periodo>') + StrLen('<periodo>'), 1000000);
                                    l_TxtTempB := l_TxtTemp;
                                end
                                else begin
                                    l_TxtTempB := l_TxtTemp;
                                    l_TxtTemp := '';
                                end;

                                l_strPeriodoImpuesto := CopyStr(l_TxtTempB, 1, StrPos(l_TxtTempB, '</periodo>') - 1);

                                Clear(l_rstAA);
                                l_rstAA.SetRange(l_rstAA."No. actividad", l_strIdRegimen);
                                l_rstAA.SetRange(l_rstAA.Nombre, l_strDescrImpuesto);
                                l_rstAA.SetRange(l_rstAA."Tipo actividad", l_rstAA."Tipo actividad"::Actividad);
                                if not l_rstAA.FindFirst then begin

                                    Clear(l_rstAA);
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad AFIP", l_rstAA.FieldNo("No. actividad"), l_rstAA."No. actividad", l_strIdRegimen, '');
                                    l_rstAA."No. actividad" := l_strIdRegimen;
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad AFIP", l_rstAA.FieldNo(Nombre), l_rstAA.Nombre, l_strDescrImpuesto, '');
                                    l_rstAA.Nombre := l_strDescrImpuesto;
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad AFIP", l_rstAA.FieldNo(Nombre), Format(l_rstAA."Tipo actividad"), Format(l_rstAA."Tipo actividad"::Actividad), '');
                                    l_rstAA."Tipo actividad" := l_rstAA."Tipo actividad"::Actividad;
                                    if l_rstAA.Insert(true) then;

                                end;

                                Clear(l_rstAP);
                                l_rstAP.SetRange("No. proveedor", t_rst23c."No.");
                                l_rstAP.SetRange("No. actividad", l_strIdRegimen);
                                l_rstAP.SetRange("Id. impuesto", l_strIdImpuesto);
                                if l_rstAP.IsEmpty then begin

                                    Clear(l_rstAP);
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad proveedor", l_rstAP.FieldNo("No. proveedor"), l_rstAP."No. proveedor", t_rst23c."No.", '');
                                    l_rstAP."No. proveedor" := t_rst23c."No.";
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad proveedor", l_rstAP.FieldNo("No. actividad"), l_rstAP."No. actividad", l_strIdRegimen, '');
                                    l_rstAP."No. actividad" := l_strIdRegimen;
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad proveedor", l_rstAP.FieldNo("Id. impuesto"), l_rstAP."Id. impuesto", l_strIdImpuesto, '');
                                    l_rstAP."Id. impuesto" := l_strIdImpuesto;
                                    Evaluate(l_rstAP.Orden, l_strIdOrden);
                                    Evaluate(l_intMes, CopyStr(l_strPeriodoImpuesto, 5, 2));
                                    Evaluate(l_intYear, CopyStr(l_strPeriodoImpuesto, 1, 4));
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad proveedor", l_rstAP.FieldNo("Fecha alta"), Format(l_rstAP."Fecha alta"), Format(DMY2Date(1, l_intMes, l_intYear)), '');
                                    l_rstAP."Fecha alta" := DMY2Date(1, l_intMes, l_intYear);
                                    //l_rstAP."Fecha baja" := 0d;
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad proveedor", l_rstAP.FieldNo("Tipo actividad"), Format(l_rstAP."Tipo actividad"), Format(l_rstAP."Tipo actividad"::Actividad), '');
                                    l_rstAP."Tipo actividad" := l_rstAP."Tipo actividad"::Actividad;
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad proveedor", l_rstAP.FieldNo("Tipo regimen"), Format(l_rstAP."Tipo regimen"), Format(l_strtipoRegimen), '');
                                    l_rstAP."Tipo regimen" := l_strtipoRegimen;
                                    if l_rstAP.Insert(true) then;

                                end;

                            end;

                            l_TxtTemp := l_strRespuesta;
                            while ((StrPos(l_TxtTemp, '<descripcionImpuesto>') + StrPos(l_TxtTemp, '</descripcionImpuesto>')) <> 0) do begin

                                if StrPos(l_TxtTemp, '<descripcionImpuesto>') <> 0 then begin
                                    l_TxtTemp := CopyStr(l_TxtTemp, StrPos(l_TxtTemp, '<descripcionImpuesto>') + StrLen('<descripcionImpuesto>'), 1000000);
                                    l_TxtTempB := l_TxtTemp;
                                end
                                else begin
                                    l_TxtTempB := l_TxtTemp;
                                    l_TxtTemp := '';
                                end;

                                l_strDescrImpuesto := CopyStr(l_TxtTempB, 1, StrPos(l_TxtTempB, '</descripcionImpuesto>') - 1);

                                if StrPos(l_TxtTemp, '<idImpuesto>') <> 0 then begin
                                    l_TxtTemp := CopyStr(l_TxtTemp, StrPos(l_TxtTemp, '<idImpuesto>') + StrLen('<idImpuesto>'), 1000000);
                                    l_TxtTempB := l_TxtTemp;
                                end
                                else begin
                                    l_TxtTempB := l_TxtTemp;
                                    l_TxtTemp := '';
                                end;

                                l_strIdImpuesto := CopyStr(l_TxtTempB, 1, StrPos(l_TxtTempB, '</idImpuesto>') - 1);

                                if StrPos(l_TxtTemp, '<periodo>') <> 0 then begin
                                    l_TxtTemp := CopyStr(l_TxtTemp, StrPos(l_TxtTemp, '<periodo>') + StrLen('<periodo>'), 1000000);
                                    l_TxtTempB := l_TxtTemp;
                                end
                                else begin
                                    l_TxtTempB := l_TxtTemp;
                                    l_TxtTemp := '';
                                end;

                                l_strPeriodoImpuesto := CopyStr(l_TxtTempB, 1, StrPos(l_TxtTempB, '</periodo>') - 1);

                                Clear(l_rstDV);
                                l_rstDV.SetRange("Dimension Code", l_rstGLS."WS - Taxes");
                                l_rstDV.SetRange(Code, l_strIdImpuesto);
                                if not l_rstDV.FindFirst then begin

                                    Clear(l_rstDV);
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Dimension Value", l_rstDV.FieldNo("Dimension Code"), Format(l_rstDV."Dimension Code"), Format(l_rstGLS."WS - Taxes"), '');
                                    l_rstDV."Dimension Code" := l_rstGLS."WS - Taxes";
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Dimension Value", l_rstDV.FieldNo(Code), Format(l_rstDV.Code), Format(l_strIdImpuesto), '');
                                    l_rstDV.Code := l_strIdImpuesto;
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Dimension Value", l_rstDV.FieldNo(Name), Format(l_rstDV.Name), Format(l_strDescrImpuesto), '');
                                    l_rstDV.Name := l_strDescrImpuesto;
                                    if l_rstDV.Insert(true) then;

                                end;

                                Clear(l_rstAA);
                                l_rstAA.SetRange(l_rstAA."No. actividad", l_strIdImpuesto);
                                l_rstAA.SetRange(l_rstAA.Nombre, l_strDescrImpuesto);
                                l_rstAA.SetRange(l_rstAA."Tipo actividad", l_rstAA."Tipo actividad"::Impuesto);
                                if not l_rstAA.FindFirst then begin

                                    Clear(l_rstAA);
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad AFIP", l_rstAA.FieldNo("No. actividad"), Format(l_rstAA."No. actividad"), Format(l_strIdImpuesto), '');
                                    l_rstAA."No. actividad" := l_strIdImpuesto;
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad AFIP", l_rstAA.FieldNo(Nombre), Format(l_rstAA.Nombre), Format(l_strDescrImpuesto), '');
                                    l_rstAA.Nombre := l_strDescrImpuesto;
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad AFIP", l_rstAA.FieldNo("Tipo actividad"), Format(l_rstAA."Tipo actividad"), Format(l_rstAA."Tipo actividad"::Impuesto), '');
                                    l_rstAA."Tipo actividad" := l_rstAA."Tipo actividad"::Impuesto;
                                    if not l_rstAA.Insert(true) then;

                                end;

                                Clear(l_rstAP);
                                l_rstAP.SetRange("No. proveedor", t_rst23c."No.");
                                l_rstAP.SetRange("No. actividad", l_strIdImpuesto);
                                if l_rstAP.IsEmpty then begin

                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad proveedor", l_rstAP.FieldNo("No. proveedor"), Format(l_rstAP."No. proveedor"), Format(t_rst23c."No."), '');
                                    l_rstAP."No. proveedor" := t_rst23c."No.";
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad proveedor", l_rstAP.FieldNo("No. actividad"), Format(l_rstAP."No. actividad"), Format(l_strIdImpuesto), '');
                                    l_rstAP."No. actividad" := l_strIdImpuesto;
                                    Evaluate(l_intMes, CopyStr(l_strPeriodoImpuesto, 5, 2));
                                    Evaluate(l_intYear, CopyStr(l_strPeriodoImpuesto, 1, 4));
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad proveedor", l_rstAP.FieldNo("Fecha alta"), Format(l_rstAP."Fecha alta"), Format(DMY2Date(1, l_intMes, l_intYear)), '');
                                    l_rstAP."Fecha alta" := DMY2Date(1, l_intMes, l_intYear);
                                    //l_rstAP."Fecha baja" := 0d;
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad proveedor", l_rstAP.FieldNo("Tipo actividad"), Format(l_rstAP."Tipo actividad"), Format(l_rstAP."Tipo actividad"::Impuesto), '');
                                    l_rstAP."Tipo actividad" := l_rstAP."Tipo actividad"::Impuesto;
                                    if not l_rstAP.Insert(true) then;

                                end;

                            end;

                            l_TxtTemp := l_strRespuesta;

                            while ((StrPos(l_TxtTemp, '<descripcionCategoria>') + StrPos(l_TxtTemp, '</descripcionCategoria>')) <> 0) do begin

                                if StrPos(l_TxtTemp, '<descripcionCategoria>') <> 0 then begin
                                    l_TxtTemp := CopyStr(l_TxtTemp, StrPos(l_TxtTemp, '<descripcionCategoria>') + StrLen('<descripcionCategoria>'), 1000000);
                                    l_TxtTempB := l_TxtTemp;
                                end
                                else begin
                                    l_TxtTempB := l_TxtTemp;
                                    l_TxtTemp := '';
                                end;

                                l_strDescrImpuesto := CopyStr(l_TxtTempB, 1, StrPos(l_TxtTempB, '</descripcionCategoria>') - 1);

                                if StrPos(l_TxtTemp, '<idCategoria>') <> 0 then begin
                                    l_TxtTemp := CopyStr(l_TxtTemp, StrPos(l_TxtTemp, '<idCategoria>') + StrLen('<idCategoria>'), 1000000);
                                    l_TxtTempB := l_TxtTemp;
                                end
                                else begin
                                    l_TxtTempB := l_TxtTemp;
                                    l_TxtTemp := '';
                                end;

                                l_strIdCategoria := CopyStr(l_TxtTempB, 1, StrPos(l_TxtTempB, '</idCategoria>') - 1);

                                if StrPos(l_TxtTemp, '<idImpuesto>') <> 0 then begin
                                    l_TxtTemp := CopyStr(l_TxtTemp, StrPos(l_TxtTemp, '<idImpuesto>') + StrLen('<idImpuesto>'), 1000000);
                                    l_TxtTempB := l_TxtTemp;
                                end
                                else begin
                                    l_TxtTempB := l_TxtTemp;
                                    l_TxtTemp := '';
                                end;

                                l_strIdImpuesto := CopyStr(l_TxtTempB, 1, StrPos(l_TxtTempB, '</idImpuesto>') - 1);

                                if StrPos(l_TxtTemp, '<periodo>') <> 0 then begin
                                    l_TxtTemp := CopyStr(l_TxtTemp, StrPos(l_TxtTemp, '<periodo>') + StrLen('<periodo>'), 1000000);
                                    l_TxtTempB := l_TxtTemp;
                                end
                                else begin
                                    l_TxtTempB := l_TxtTemp;
                                    l_TxtTemp := '';
                                end;

                                l_strPeriodoImpuesto := CopyStr(l_TxtTempB, 1, StrPos(l_TxtTempB, '</periodo>') - 1);

                                Clear(l_rstDV);
                                l_rstDV.SetRange("Dimension Code", l_rstGLS."WS - Taxes");
                                l_rstDV.SetRange(Code, l_strIdImpuesto);
                                if not l_rstDV.FindFirst then begin

                                    Clear(l_rstDV);
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Dimension Value", l_rstDV.FieldNo("Dimension Code"), Format(l_rstDV."Dimension Code"), Format(l_rstGLS."WS - Taxes"), '');
                                    l_rstDV."Dimension Code" := l_rstGLS."WS - Taxes";
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Dimension Value", l_rstDV.FieldNo(Code), Format(l_rstDV.Code), Format(l_strIdImpuesto), '');
                                    l_rstDV.Code := l_strIdImpuesto;
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Dimension Value", l_rstDV.FieldNo(Name), Format(l_rstDV.Name), Format(l_strDescrImpuesto), '');
                                    l_rstDV.Name := l_strDescrImpuesto;
                                    if l_rstDV.Insert(true) then;

                                end;

                                Clear(l_rstAA);
                                l_rstAA.SetRange(l_rstAA."No. actividad", l_strIdImpuesto);
                                l_rstAA.SetRange(l_rstAA.Nombre, l_strDescrImpuesto);
                                l_rstAA.SetRange(l_rstAA."Tipo actividad", l_rstAA."Tipo actividad"::Impuesto);
                                if not l_rstAA.FindFirst then begin

                                    Clear(l_rstAA);
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad AFIP", l_rstAA.FieldNo("No. actividad"), Format(l_rstAA."No. actividad"), Format(l_strIdImpuesto), '');
                                    l_rstAA."No. actividad" := l_strIdImpuesto;
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad AFIP", l_rstAA.FieldNo(Nombre), Format(l_rstAA.Nombre), Format(l_strDescrImpuesto), '');
                                    l_rstAA.Nombre := l_strDescrImpuesto;
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad AFIP", l_rstAA.FieldNo("Tipo actividad"), Format(l_rstAA."Tipo actividad"), Format(l_rstAA."Tipo actividad"::Impuesto), '');
                                    l_rstAA."Tipo actividad" := l_rstAA."Tipo actividad"::Impuesto;
                                    if not l_rstAA.Insert(true) then;

                                end;

                                Clear(l_rstAP);
                                l_rstAP.SetRange("No. proveedor", t_rst23c."No.");
                                l_rstAP.SetRange("No. actividad", l_strIdImpuesto);
                                if l_rstAP.IsEmpty then begin

                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad proveedor", l_rstAP.FieldNo("No. proveedor"), Format(l_rstAP."No. proveedor"), Format(t_rst23c."No."), '');
                                    l_rstAP."No. proveedor" := t_rst23c."No.";
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad proveedor", l_rstAP.FieldNo("No. actividad"), Format(l_rstAP."No. actividad"), Format(l_strIdImpuesto), '');
                                    l_rstAP."No. actividad" := l_strIdImpuesto;
                                    Evaluate(l_intMes, CopyStr(l_strPeriodoImpuesto, 5, 2));
                                    Evaluate(l_intYear, CopyStr(l_strPeriodoImpuesto, 1, 4));
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad proveedor", l_rstAP.FieldNo("Fecha alta"), Format(l_rstAP."Fecha alta"), Format(DMY2Date(1, l_intMes, l_intYear)), '');
                                    l_rstAP."Fecha alta" := DMY2Date(1, l_intMes, l_intYear);
                                    //l_rstAP."Fecha baja" := 0d;
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad proveedor", l_rstAP.FieldNo("Tipo actividad"), Format(l_rstAP."Tipo actividad"), Format(l_rstAP."Tipo actividad"::Impuesto), '');
                                    l_rstAP."Tipo actividad" := l_rstAP."Tipo actividad"::Impuesto;
                                    fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::"Actividad proveedor", l_rstAP.FieldNo(Categoria), Format(l_rstAP.Categoria), Format(l_strIdCategoria), '');
                                    l_rstAP.Categoria := l_strIdCategoria;
                                    if not l_rstAP.Insert(true) then;

                                end;

                            end;

                        end;

                    until StrPos(l_Txt, '</FTran>') = 0;

                l_reader.Close();
                l_str.Close();

                i := 0;
                l_codPrimerProveedor := '';
                l_codUltimoProveedor := '';

            until l_rst23.Next = 0;

        l_dlgDialogo.Close;

        Commit;

        Clear(l_rst50401);
        l_rst50401.SetRange("Imported document entry no.", l_rstDocumentosDigitalizados.Linea);
        l_rst50401.SetRange("Register entry no.", l_rst50400."Entry no.");
        l_rst50401.SetFilter("Clave registro", '<>%1', '');
        Clear(l_pge50507);
        l_pge50507.SetTableView(l_rst50401);
        l_pge50507.Editable := true;
        l_pge50507.LookupMode := true;
        if l_pge50507.RunModal = ACTION::LookupOK then begin

            l_dlgDialogo.Open('Actualizando datos en tabla #1###########');

            l_rst50401.SetRange(Ommit, false);
            if l_rst50401.FindSet then
                repeat

                    l_dlgDialogo.Update(1, l_rst50401."Table Caption");
                    fntActualizarDatoenTabla(l_rst50401."Table No.", l_rst50401."Field No.", l_rst50401."Clave registro", l_rst50401."New Value");

                until l_rst50401.Next = 0;

            //MESSAGE('Commiteado');

        end
        else
            Error(Error0002);

    end;

    [Scope('OnPrem')]
    procedure fntConstatacionComprobante(l_strServicio: Text[30]; l_codCUITEmisor: Code[11]; l_strCbteModo: Text[4]; l_strPtoVta: Text[5]; l_strCbteTipo: Text[3]; l_strCbteNro: Text[8]; l_strCbteFch: Text[8]; l_strImpTotal: Text; l_strCodAutorizacion: Text[14]; l_codCUITSolicitante: Code[11]) strError: Text
    var
        l_rst50400: Record "AFIP Interface Register";
        Error0001: Label 'No se ha encontrado una conexión vigente a la AFIP para el servicio %1.';
        l_xml: Text;
        l_url: Text;
        l_soapActionUrl: Text;
        l_sb: DotNet StringBuilder;
        l_uriObj: DotNet Uri;
        l_lgRequest: DotNet HttpWebRequest;
        l_streamwriter: DotNet StreamWriter;
        l_streamReader: DotNet StreamReader;
        l_lgResponse: DotNet HttpWebResponse;
        l_str: DotNet Stream;
        l_reader: DotNet XmlTextReader;
        l_document: DotNet XmlDocument;
        l_ascii: DotNet Encoding;
        l_credentials: DotNet CredentialCache;
        l_cduFM: Codeunit "File Management";
        l_FileTest: File;
        l_StreamInTest: OutStream;
        l_CrLf: Text;
        l_FileMgt: Codeunit "File Management";
        l_strArchivo: Text;
        l_strToken: Text;
        l_strSign: Text;
        l_rst99008535: Codeunit "Temp Blob";
        l_strFile: Text;
        l_rstDocumentosDigitalizados: Record "Documentos digitalizados";
        l_strNivel: array[12] of Text;
        l_rstUS: Record "User Setup";
        l_strRespuesta: Text;
        intLinea: Integer;
        l_rstPPS: Record "Purchases & Payables Setup";
        l_Txt: Text;
        strFecha: Text[30];
        codEstado: Code[30];
        rstProveedor: Record Vendor;
        rstAreaImpuesto: Record "Tax Area";
        rstFecha: Record Date;
        l_intCantCUITs: Integer;
        i: Integer;
        l_intCantProveedores: Integer;
        l_codPrimerProveedor: Code[20];
        l_codUltimoProveedor: Code[20];
        l_rst23b: Record Vendor;
        l_TxtTemp: Text;
        l_dlgDialogo: Dialog;
        j: Integer;
        k: Integer;
        t_rst23c: Record Vendor temporary;
        l_rstGLS: Record "General Ledger Setup";
        l_rstDV: Record "Dimension Value";
        l_rst352: Record "Default Dimension";
        l_TxtTempB: Text;
        l_strDescrImpuesto: Text;
        l_strIdImpuesto: Text;
        l_strPeriodoImpuesto: Text[6];
        l_strName: Text;
        l_rstAP: Record "Actividad proveedor";
        l_rstAA: Record "Actividad AFIP";
        l_intMes: Integer;
        l_intYear: Integer;
        l_strtipoRegimen: Text;
        l_strIdRegimen: Text;
        l_strIdOrden: Text;
        l_rst50401: Record "AFIP Interface Register detail";
        l_pge50507: Page "AFIP Interface Register detail";
        Error0002: Label 'Se ha detenido la actualización.';
        l_strCK: Text;
        l_strIdCategoria: Text;
        l_datFecha: Date;
        TipoDocumento: Label '80';
        rstGLS: Record "General Ledger Setup";
        l_OutStream: OutStream;
        l_rrDocsDigitalizados: RecordRef;
    begin
        Clear(l_dlgDialogo);
        l_dlgDialogo.Open('Verificando vigencia de autenticación Web Service...');
        fntVerificarVigenciaWS(l_strServicio, l_rst50400);
        fntTraerTokenySignWS(l_strServicio, l_strToken, l_strSign);
        l_dlgDialogo.Close;

        Clear(rstGLS);
        rstGLS.Get();

        //fntComprobantesModalidadConsultar(rstGLS."WS - Verif. Comprobante",l_codCUITSolicitante,l_codCUITEmisor);

        Clear(l_rstGLS);
        Clear(l_rstPPS);
        l_rstPPS.Get();
        l_rstGLS.Get();
        //Inicializar
        l_Txt := '';
        l_strRespuesta := '';
        for i := 1 to 10 do begin
            l_strNivel[i] := '';
        end;

        Clear(rstProveedor);
        rstProveedor.SetRange("No.", CopyStr(l_codCUITEmisor, 1, 10));
        if rstProveedor.FindFirst then;

        l_dlgDialogo.Open('Verificando comprobante #1###########');

        l_dlgDialogo.Update(1, l_strCbteNro);

        Clear(l_xml);
        Clear(l_sb);
        l_sb := l_sb.StringBuilder();
        l_url := 'https://servicios1.afip.gov.ar/WSCDC/service.asmx';
        l_soapActionUrl := 'http://servicios1.afip.gob.ar/wscdc/ComprobanteConstatar';

        l_sb.Append('<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:wsc="http://servicios1.afip.gob.ar/wscdc/">');
        l_sb.Append('   <soap:Header/>');
        l_sb.Append('   <soap:Body>');
        l_sb.Append('      <wsc:ComprobanteConstatar>');
        l_sb.Append('         <wsc:Auth>');
        l_sb.Append('            <wsc:Token>' + l_strToken + '</wsc:Token>');
        l_sb.Append('            <wsc:Sign>' + l_strSign + '</wsc:Sign>');
        l_sb.Append('            <wsc:Cuit>' + l_codCUITSolicitante + '</wsc:Cuit>');
        l_sb.Append('         </wsc:Auth>');
        l_sb.Append('         <wsc:CmpReq>');
        l_sb.Append('            <wsc:CbteModo>' + l_strCbteModo + '</wsc:CbteModo>');
        l_sb.Append('            <wsc:CuitEmisor>' + l_codCUITEmisor + '</wsc:CuitEmisor>');
        l_sb.Append('            <wsc:PtoVta>' + l_strPtoVta + '</wsc:PtoVta>');
        l_sb.Append('            <wsc:CbteTipo>' + l_strCbteTipo + '</wsc:CbteTipo>');
        l_sb.Append('            <wsc:CbteNro>' + l_strCbteNro + '</wsc:CbteNro>');
        l_sb.Append('            <wsc:CbteFch>' + l_strCbteFch + '</wsc:CbteFch>');
        l_sb.Append('            <wsc:ImpTotal>' + l_strImpTotal + '</wsc:ImpTotal>');
        l_sb.Append('            <wsc:CodAutorizacion>' + l_strCodAutorizacion + '</wsc:CodAutorizacion>');
        l_sb.Append('            <wsc:DocTipoReceptor>' + TipoDocumento + '</wsc:DocTipoReceptor>');
        l_sb.Append('            <wsc:DocNroReceptor>' + l_codCUITSolicitante + '</wsc:DocNroReceptor>');
        l_sb.Append('         </wsc:CmpReq>');
        l_sb.Append('      </wsc:ComprobanteConstatar>');
        l_sb.Append('   </soap:Body>');
        l_sb.Append('</soap:Envelope>');

        l_sb.Append(l_xml);

        l_uriObj := l_uriObj.Uri(l_url);

        l_lgRequest := l_lgRequest.CreateDefault(l_uriObj);
        l_lgRequest.Method := 'POST';
        l_lgRequest.ContentType := 'text/xml; charset=UTF-8';
        if l_soapActionUrl <> '' then
            l_lgRequest.Headers.Add('SOAPAction', l_soapActionUrl);
        l_lgRequest.Timeout := 120000;
        l_streamwriter := l_streamwriter.StreamWriter(l_lgRequest.GetRequestStream(), l_ascii.UTF8);
        l_streamwriter.Write(l_sb.ToString());
        l_xml := l_sb.ToString;
        l_streamwriter.Close();
        l_lgResponse := l_lgRequest.GetResponse();
        l_str := l_lgResponse.GetResponseStream();
        l_reader := l_reader.XmlTextReader(l_str);
        l_document := l_document.XmlDocument();
        l_document.Load(l_reader);

        Clear(l_rstUS);
        l_rstUS.SetRange("User ID", UserId);
        if l_rstUS.FindFirst then;

        l_strRespuesta := l_document.InnerXml();
        if StrPos(l_strRespuesta, '<Errors>') <> 0 then
            fntControlErrores(l_document, l_codCUITEmisor, true);

        if StrPos(l_strRespuesta, '<Msg>') <> 0 then
            fntControlErrores(l_document, l_codCUITEmisor, true);


        l_Txt := l_strRespuesta;

        l_Txt := fntAnularAcentosyEnes(l_Txt);

        if StrPos(l_Txt, '<Resultado>') <> 0 then begin

            l_Txt := CopyStr(l_Txt, StrPos(l_Txt, '</Resultado>') + StrLen('</Resultado>'));

            if l_strRespuesta <> '' then begin

                //Niveles de digitalización
                l_strNivel[1] := l_strServicio; //Servicio
                l_strNivel[2] := Format(Today); //Fecha consulta
                l_strNivel[3] := l_rstUS.Grupo; //Grupo seguridad
                l_strNivel[4] := rstProveedor."No.";
                l_strNivel[5] := UserId; //Usuario solicitud

                //CUIT Solicitado
                l_strNivel[6] := l_strPtoVta + '-' + l_strCbteNro;
                //MESSAGE(l_strRespuesta);
                //Nombre
                l_strNivel[7] := l_strRespuesta;
                if StrPos(l_strNivel[7], '<FchProceso>') <> 0 then begin

                    l_strNivel[7] := CopyStr(l_strNivel[7], StrPos(l_strNivel[7], '<FchProceso>') + StrLen('<FchProceso>'), 1000000);
                    l_strNivel[7] := CopyStr(l_strNivel[7], 1, StrPos(l_strNivel[7], '</FchProceso>') - 1);

                end
                else
                    l_strNivel[7] := '';

                //Apellido
                l_strNivel[8] := l_strRespuesta;
                if StrPos(l_strNivel[8], '<Resultado>') <> 0 then begin

                    l_strNivel[8] := CopyStr(l_strNivel[8], StrPos(l_strNivel[8], '<Resultado>') + StrLen('<Resultado>'), 1000000);
                    l_strNivel[8] := CopyStr(l_strNivel[8], 1, StrPos(l_strNivel[8], '</Resultado>') - 1);

                end
                else
                    l_strNivel[8] := '';

                strError := l_strRespuesta;
                if StrPos(strError, '<Msg>') <> 0 then begin

                    strError := CopyStr(strError, StrPos(strError, '<Msg>') + StrLen('<Msg>'), 1000000);
                    strError := CopyStr(strError, 1, StrPos(strError, '</Msg>') - 1);

                end
                else
                    strError := '';

                Clear(l_rst99008535);
                l_rst99008535.CreateOutStream(l_OutStream, TEXTENCODING::UTF8);
                l_OutStream.WriteText(l_strRespuesta);

                Clear(l_rstDocumentosDigitalizados);
                if l_rstDocumentosDigitalizados.Find('+') then
                    intLinea := l_rstDocumentosDigitalizados.Linea
                else
                    intLinea := 1;

                Clear(l_rstDocumentosDigitalizados);
                l_rstDocumentosDigitalizados.Linea := intLinea + 1;
                l_rstDocumentosDigitalizados."Nivel 1" := CopyStr(l_strNivel[1], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 1"));
                l_rstDocumentosDigitalizados."Nivel 2" := CopyStr(l_strNivel[2], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 2"));
                l_rstDocumentosDigitalizados."Nivel 3" := CopyStr(l_strNivel[3], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 3"));
                l_rstDocumentosDigitalizados."Nivel 4" := CopyStr(rstProveedor."No.", 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 4"));
                l_rstDocumentosDigitalizados."Nivel 5" := CopyStr(l_strNivel[5], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 5"));
                l_rstDocumentosDigitalizados."Nivel 6" := CopyStr(rstProveedor."No.", 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 6"));
                l_rstDocumentosDigitalizados."Nivel 7" := CopyStr(l_strNivel[7], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 7"));
                l_rstDocumentosDigitalizados."Nivel 8" := CopyStr(l_strNivel[8], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 8"));
                l_rstDocumentosDigitalizados."Nivel 9" := CopyStr(l_strNivel[9], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 9"));
                l_rstDocumentosDigitalizados."Nivel 10" := CopyStr(l_strNivel[10], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 10"));
                l_rstDocumentosDigitalizados."Nivel 11" := CopyStr(l_strNivel[11], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 11"));
                //l_rstDocumentosDigitalizados.BlobFile := l_rst99008535.Blob;
                l_rstDocumentosDigitalizados.Insert;

                clear(l_rrDocsDigitalizados);
                l_rrDocsDigitalizados.get(l_rstDocumentosDigitalizados.RecordId);
                l_rst99008535.ToRecordRef(l_rrDocsDigitalizados, l_rstDocumentosDigitalizados.FieldNo("BlobFile"));
                l_rrDocsDigitalizados.Modify;

            end;

        end;

        l_reader.Close();
        l_str.Close();

        l_dlgDialogo.Close;

        Commit;

        if strError <> '' then
            exit(strError);
    end;

    [Scope('OnPrem')]
    procedure fntComprobantesModalidadConsultar(l_strServicio: Text[30]; l_codCUITSolicitante: Code[11]; l_codCUITSolicitado: Code[11]): Text[4]
    var
        l_rst50400: Record "AFIP Interface Register";
        Error0001: Label 'No se ha encontrado una conexión vigente a la AFIP para el servicio %1.';
        l_xml: Text;
        l_url: Text;
        l_soapActionUrl: Text;
        l_sb: DotNet StringBuilder;
        l_uriObj: DotNet Uri;
        l_lgRequest: DotNet HttpWebRequest;
        l_streamwriter: DotNet StreamWriter;
        l_streamReader: DotNet StreamReader;
        l_lgResponse: DotNet HttpWebResponse;
        l_str: DotNet Stream;
        l_reader: DotNet XmlTextReader;
        l_document: DotNet XmlDocument;
        l_ascii: DotNet Encoding;
        l_credentials: DotNet CredentialCache;
        l_cduFM: Codeunit "File Management";
        l_FileTest: File;
        l_StreamInTest: OutStream;
        l_CrLf: Text;
        l_FileMgt: Codeunit "File Management";
        l_strArchivo: Text;
        l_strToken: Text;
        l_strSign: Text;
        l_rst99008535: Codeunit "Temp Blob";
        l_strFile: Text;
        l_rstDocumentosDigitalizados: Record "Documentos digitalizados";
        l_strNivel: array[12] of Text;
        l_rstUS: Record "User Setup";
        l_strRespuesta: Text;
        intLinea: Integer;
        l_rstPPS: Record "Purchases & Payables Setup";
        l_Txt: Text;
        strFecha: Text[30];
        codEstado: Code[30];
        rstProveedor: Record Vendor temporary;
        rstAreaImpuesto: Record "Tax Area";
        rstFecha: Record Date;
        l_intCantCUITs: Integer;
        i: Integer;
        l_intCantProveedores: Integer;
        l_codPrimerProveedor: Code[20];
        l_codUltimoProveedor: Code[20];
        l_rst23b: Record Vendor;
        l_TxtTemp: Text;
        l_dlgDialogo: Dialog;
        j: Integer;
        k: Integer;
        t_rst23c: Record Vendor temporary;
        l_rstGLS: Record "General Ledger Setup";
        l_rstDV: Record "Dimension Value";
        l_rst352: Record "Default Dimension";
        l_TxtTempB: Text;
        l_strDescrImpuesto: Text;
        l_strIdImpuesto: Text;
        l_strPeriodoImpuesto: Text[6];
        l_strName: Text;
        l_rstAP: Record "Actividad proveedor";
        l_rstAA: Record "Actividad AFIP";
        l_intMes: Integer;
        l_intYear: Integer;
        l_strtipoRegimen: Text;
        l_strIdRegimen: Text;
        l_strIdOrden: Text;
        l_rst50401: Record "AFIP Interface Register detail";
        l_pge50507: Page "AFIP Interface Register detail";
        Error0002: Label 'Se ha detenido la actualización.';
        l_strCK: Text;
        l_strIdCategoria: Text;
        l_datFecha: Date;
        l_OutStream: OutStream;
        l_rrDocsDigitalizados: RecordRef;
    begin
        Clear(l_dlgDialogo);
        l_dlgDialogo.Open('Verificando vigencia de autenticación Web Service...');
        fntVerificarVigenciaWS(l_strServicio, l_rst50400);
        fntTraerTokenySignWS(l_strServicio, l_strToken, l_strSign);
        l_dlgDialogo.Close;

        Clear(l_rstGLS);
        Clear(l_rstPPS);
        l_rstPPS.Get();
        l_rstGLS.Get();
        //Inicializar
        l_Txt := '';
        l_strRespuesta := '';
        for i := 1 to 10 do begin
            l_strNivel[i] := '';
        end;

        Clear(rstProveedor);
        rstProveedor.SetRange("No.", CopyStr(l_codCUITSolicitado, 1, 10));
        if rstProveedor.FindFirst then;

        Clear(l_xml);
        //Reproweb Producción
        l_sb := l_sb.StringBuilder();
        l_url := 'https://servicios1.afip.gov.ar/WSCDC/service.asmx';
        l_soapActionUrl := 'http://servicios1.afip.gob.ar/wscdc/ComprobantesModalidadConsultar';

        l_sb.Append('<?xml version="1.0" encoding="utf-8"?>');
        l_sb.Append('<soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope">');
        l_sb.Append('  <soap12:Body>');
        l_sb.Append('    <ComprobantesModalidadConsultar xmlns="http://servicios1.afip.gob.ar/wscdc/">');
        l_sb.Append('      <Auth>');
        l_sb.Append('        <Token>' + l_strToken + '</Token>');
        l_sb.Append('        <Sign>' + l_strSign + '</Sign>');
        l_sb.Append('        <Cuit>' + l_codCUITSolicitante + '</Cuit>');
        l_sb.Append('      </Auth>');
        l_sb.Append('    </ComprobantesModalidadConsultar>');
        l_sb.Append('  </soap12:Body>');
        l_sb.Append('</soap12:Envelope>');

        l_sb.Append(l_xml);


        l_uriObj := l_uriObj.Uri(l_url);

        l_lgRequest := l_lgRequest.CreateDefault(l_uriObj);
        l_lgRequest.Method := 'POST';
        l_lgRequest.ContentType := 'text/xml; charset=unicode';
        if l_soapActionUrl <> '' then
            l_lgRequest.Headers.Add('SOAPAction', l_soapActionUrl);
        l_lgRequest.Timeout := 120000;
        l_streamwriter := l_streamwriter.StreamWriter(l_lgRequest.GetRequestStream(), l_ascii.Unicode);
        l_streamwriter.Write(l_sb.ToString());
        l_xml := l_sb.ToString;
        l_streamwriter.Close();
        l_lgResponse := l_lgRequest.GetResponse();
        l_str := l_lgResponse.GetResponseStream();
        l_reader := l_reader.XmlTextReader(l_str);
        l_document := l_document.XmlDocument();
        l_document.Load(l_reader);

        Clear(l_rstUS);
        l_rstUS.SetRange("User ID", UserId);
        if l_rstUS.FindFirst then;

        l_strRespuesta := l_document.InnerXml();
        if StrPos(l_strRespuesta, '<error') <> 0 then
            fntControlErrores(l_document, l_codCUITSolicitado, true);

        l_Txt := l_strRespuesta;

        l_Txt := fntAnularAcentosyEnes(l_Txt);

        if StrPos(l_Txt, '<FacModTipo>') <> 0 then begin

            l_Txt := CopyStr(l_Txt, StrPos(l_Txt, '</FacModTipo>') + StrLen('</FacModTipo>'));

            if l_strRespuesta <> '' then begin

                //Niveles de digitalización
                l_strNivel[1] := l_strServicio; //Servicio
                l_strNivel[2] := Format(Today); //Fecha consulta
                l_strNivel[3] := l_rstUS.Grupo; //Grupo seguridad
                l_strNivel[4] := rstProveedor."No.";
                l_strNivel[5] := UserId; //Usuario solicitud

                //CUIT Solicitado
                l_strNivel[6] := l_strRespuesta;
                l_strNivel[6] := CopyStr(l_strNivel[6], StrPos(l_strNivel[6], '<FacModTipo>') + StrLen('<FacModTipo>'), 1000000);
                l_strNivel[6] := CopyStr(l_strNivel[6], 1, StrPos(l_strNivel[6], '</FacModTipo>') - 1);
                //MESSAGE(l_strRespuesta);
                //Nombre
                l_strNivel[7] := l_strRespuesta;
                if StrPos(l_strNivel[7], '<Cod>') <> 0 then begin

                    l_strNivel[7] := CopyStr(l_strNivel[7], StrPos(l_strNivel[7], '<Cod>') + StrLen('<Cod>'), 1000000);
                    l_strNivel[7] := CopyStr(l_strNivel[7], 1, StrPos(l_strNivel[7], '</Cod>') - 1);

                end
                else
                    l_strNivel[7] := '';

                //Apellido
                l_strNivel[8] := l_strRespuesta;
                if StrPos(l_strNivel[8], '<Desc>') <> 0 then begin

                    l_strNivel[8] := CopyStr(l_strNivel[8], StrPos(l_strNivel[8], '<Desc>') + StrLen('<Desc>'), 1000000);
                    l_strNivel[8] := CopyStr(l_strNivel[8], 1, StrPos(l_strNivel[8], '</Desc>') - 1);

                end
                else
                    l_strNivel[8] := '';

                /*
                  //Código Transacción
                  IF STRPOS(l_strRespuesta,'<RTran>') <>0 THEN
                  BEGIN

                    l_strNivel[9] := l_strRespuesta;
                    l_strNivel[9] := COPYSTR(l_strNivel[9],STRPOS(l_strNivel[9],'<RTran>')+STRLEN('<RTran>'),1000000);
                    l_strNivel[9] := COPYSTR(l_strNivel[9],1,STRPOS(l_strNivel[9],'</RTran>')-1);

                  END;
                  ///INSERTAR DATOS EN PROVEEDOR
                  */

                Clear(l_rst99008535);
                l_rst99008535.CreateOutStream(l_OutStream, TEXTENCODING::UTF8);
                l_OutStream.WriteText(l_strRespuesta);

                Clear(l_rstDocumentosDigitalizados);
                if l_rstDocumentosDigitalizados.Find('+') then
                    intLinea := l_rstDocumentosDigitalizados.Linea
                else
                    intLinea := 1;

                Clear(l_rstDocumentosDigitalizados);
                l_rstDocumentosDigitalizados.Linea := intLinea + 1;
                l_rstDocumentosDigitalizados."Nivel 1" := CopyStr(l_strNivel[1], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 1"));
                l_rstDocumentosDigitalizados."Nivel 2" := CopyStr(l_strNivel[2], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 2"));
                l_rstDocumentosDigitalizados."Nivel 3" := CopyStr(l_strNivel[3], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 3"));
                l_rstDocumentosDigitalizados."Nivel 4" := CopyStr(rstProveedor."No.", 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 4"));
                l_rstDocumentosDigitalizados."Nivel 5" := CopyStr(l_strNivel[5], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 5"));
                l_rstDocumentosDigitalizados."Nivel 6" := CopyStr(rstProveedor."No.", 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 6"));
                l_rstDocumentosDigitalizados."Nivel 7" := CopyStr(l_strNivel[7], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 7"));
                l_rstDocumentosDigitalizados."Nivel 8" := CopyStr(l_strNivel[8], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 8"));
                l_rstDocumentosDigitalizados."Nivel 9" := CopyStr(l_strNivel[9], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 9"));
                l_rstDocumentosDigitalizados."Nivel 10" := CopyStr(l_strNivel[10], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 10"));
                l_rstDocumentosDigitalizados."Nivel 11" := CopyStr(l_strNivel[11], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 11"));
                //l_rstDocumentosDigitalizados.BlobFile := l_rst99008535.Blob;
                l_rstDocumentosDigitalizados.Insert;

                clear(l_rrDocsDigitalizados);
                l_rrDocsDigitalizados.get(l_rstDocumentosDigitalizados.RecordId);
                l_rst99008535.ToRecordRef(l_rrDocsDigitalizados, l_rstDocumentosDigitalizados.FieldNo("BlobFile"));
                l_rrDocsDigitalizados.Modify;


            end;

        end;

        l_reader.Close();
        l_str.Close();

        exit(l_strNivel[7]);

    end;

    [Scope('OnPrem')]
    procedure fntFacturacion(l_strServicio: Text[30]; l_codCUITSolicitante: Code[11]; l_codPermiso: Code[16])
    var
        l_rst50400: Record "AFIP Interface Register";
        Error0003: Label 'El proveedor %1 tiene el área de impuesto %2, que está configurada para no requerir consulta Reproweb.';
        Error0002: Label 'Se ha detenido la actualización.';
        Error0001: Label 'No se ha encontrado una conexión vigente a la AFIP para el servicio %1.';
        l_xml: Text;
        l_url: Text;
        l_soapActionUrl: Text;
        l_sb: DotNet StringBuilder;
        l_uriObj: DotNet Uri;
        l_lgRequest: DotNet HttpWebRequest;
        l_stream: DotNet StreamWriter;
        l_lgResponse: DotNet HttpWebResponse;
        l_str: DotNet Stream;
        l_reader: DotNet XmlTextReader;
        l_document: DotNet XmlDocument;
        l_ascii: DotNet Encoding;
        l_credentials: DotNet CredentialCache;
        l_cduFM: Codeunit "File Management";
        l_FileTest: File;
        l_StreamInTest: OutStream;
        l_CrLf: Text;
        l_FileMgt: Codeunit "File Management";
        l_strArchivo: Text;
        l_strToken: Text;
        l_strSign: Text;
        l_rst99008535: Codeunit "Temp Blob";
        l_strFile: Text;
        l_rstDocumentosDigitalizados: Record "Documentos digitalizados";
        l_strNivel: array[12] of Text;
        l_rstUS: Record "User Setup";
        l_strRespuesta: Text;
        intLinea: Integer;
        l_rst23: Record Vendor;
        l_rstPPS: Record "Purchases & Payables Setup";
        l_Txt: Text;
        strFecha: Text[30];
        codEstado: Code[30];
        rstProveedor: Record Vendor temporary;
        rstAreaImpuesto: Record "Tax Area";
        rstFecha: Record Date;
        l_intCantCUITs: Integer;
        i: Integer;
        strSource: Text;
        strDestination: Text;
        strUniqueid: Text;
        t_rst23c: Record Vendor temporary;
        l_TxtTemp: Text;
        l_rst50401: Record "AFIP Interface Register detail";
        l_pge50507: Page "AFIP Interface Register detail";
        l_dlgDialogo: Dialog;
        l_CodeMens: Codeunit "Mensajería";
        Mensaje: Text;
        Mensaje0001: Label 'Se ha actualizado el proveedor %1 con los Web Services Reproweb.';
        l_ConfUsu: Record "User Setup";
        l_PunMensajeria: Record Mensajeria;
        l_strError: Text;
        l_rst318: Record "Tax Area";
        Mensaje0002: Label 'El proveedor %1 tiene el área de impuesto %2, que está configurada para no requerir consulta Reproweb.';
        l_datFecha: Date;
        l_codTipoEmpr: Label 'IMEX';
        l_OutStream: OutStream;
        l_rrDocsDigitalizados: RecordRef;
    begin
        fntVerificarVigenciaWS(l_strServicio, l_rst50400);
        fntTraerTokenySignWS(l_strServicio, l_strToken, l_strSign);

        Clear(l_dlgDialogo);
        l_dlgDialogo.Open('Ejecutando consulta Permiso de embarque...\' +
                          'Proveedor #1###########, \' +
                          'Estado:   #2###########');
        //Inicializar
        l_Txt := '';
        l_strRespuesta := '';
        for i := 1 to 10 do begin
            l_strNivel[i] := '';
        end;

        l_sb := l_sb.StringBuilder();
        l_url := 'https://webservicesadu.afip.gob.ar/diav2/wconsrecaudacion/wconsrecaudacion.asmx';
        l_soapActionUrl := 'BeneficiosExpoDetalle';

        /*
        l_sb.Append('<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:ar="Ar.Gob.Afip.Dga.wconsrecaudacion">');
        l_sb.Append('   <soap:Header/>');
        l_sb.Append('   <soap:Body>');
        l_sb.Append('      <ar:BeneficiosExpoRequisitos>');
        l_sb.Append('         <ar:argWSAutenticacionEmpresa>');
        l_sb.Append('            <ar:Token>'+l_strToken+'</ar:Token>');
        l_sb.Append('            <ar:Sign>'+l_strSign+'</ar:Sign>');
        l_sb.Append('            <ar:CuitEmpresaConectada>'+l_codCUITSolicitante+'</ar:CuitEmpresaConectada>');
        l_sb.Append('            <ar:TipoAgente>'+l_codTipoEmpr+'</ar:TipoAgente>');
        l_sb.Append('            <ar:Rol>'+l_codTipoEmpr+'</ar:Rol>');
        l_sb.Append('         </ar:argWSAutenticacionEmpresa>');
        l_sb.Append('         <ar:argIdentificadorDeclaracion>'+l_codPermiso+'</ar:argIdentificadorDeclaracion>');
        l_sb.Append('      </ar:BeneficiosExpoRequisitos>');
        l_sb.Append('   </soap:Body>');
        l_sb.Append('</soap:Envelope>');
        */
        l_sb.Append('<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:ar="Ar.Gob.Afip.Dga.wconsrecaudacion">');
        l_sb.Append('   <soap:Header/>');
        l_sb.Append('   <soap:Body>');
        l_sb.Append('      <ar:BeneficiosExpoDetalle>');
        l_sb.Append('         <ar:argWSAutenticacionEmpresa>');
        l_sb.Append('            <ar:Token>' + l_strToken + '</ar:Token>');
        l_sb.Append('            <ar:Sign>' + l_strSign + '</ar:Sign>');
        l_sb.Append('            <ar:CuitEmpresaConectada>' + l_codCUITSolicitante + '</ar:CuitEmpresaConectada>');
        l_sb.Append('            <ar:TipoAgente>' + l_codTipoEmpr + '</ar:TipoAgente>');
        l_sb.Append('            <ar:Rol>' + l_codTipoEmpr + '</ar:Rol>');
        l_sb.Append('         </ar:argWSAutenticacionEmpresa>');
        l_sb.Append('         <ar:argIdentificadorDestinacion>' + l_codPermiso + '</ar:argIdentificadorDestinacion>');
        l_sb.Append('      </ar:BeneficiosExpoDetalle>');
        l_sb.Append('   </soap:Body>');
        l_sb.Append('</soap:Envelope>');

        l_sb.Append(l_xml);
        l_uriObj := l_uriObj.Uri(l_url);
        l_lgRequest := l_lgRequest.CreateDefault(l_uriObj);
        l_lgRequest.Method := 'POST';
        l_lgRequest.ContentType := 'text/xml; charset=utf-8';
        if l_soapActionUrl <> '' then
            l_lgRequest.Headers.Add('SOAPAction', l_soapActionUrl);
        l_lgRequest.Timeout := 120000;
        l_stream := l_stream.StreamWriter(l_lgRequest.GetRequestStream(), l_ascii.ASCII);
        l_stream.Write(l_sb.ToString());
        l_xml := l_sb.ToString;
        l_stream.Close();
        l_lgResponse := l_lgRequest.GetResponse();
        l_str := l_lgResponse.GetResponseStream();
        l_reader := l_reader.XmlTextReader(l_str);
        l_document := l_document.XmlDocument();
        l_document.Load(l_reader);

        Clear(l_rstUS);
        l_rstUS.SetRange("User ID", UserId);
        if l_rstUS.FindFirst then;

        l_strError := '';
        l_strRespuesta := l_document.InnerXml();
        if StrPos(l_strRespuesta, '<Err>') <> 0 then
            l_strError := fntControlErrores(l_document, l_codPermiso, true);

        //Niveles de digitalización
        l_strNivel[1] := l_strServicio; //Servicio
        l_strNivel[2] := Format(Today); //Fecha consulta
        l_strNivel[3] := l_rstUS.Grupo; //Grupo seguridad
        l_strNivel[4] := l_codPermiso;
        l_strNivel[5] := UserId; //Usuario solicitud

        //Permiso solicitado
        l_strNivel[6] := l_strRespuesta;

        //Periodo solicitado
        l_strNivel[7] := l_strRespuesta;
        l_strNivel[7] := CopyStr(l_strNivel[7], StrPos(l_strNivel[7], '<Pdo>') + StrLen('<Pdo>'), 1000000);
        l_strNivel[7] := CopyStr(l_strNivel[7], 1, StrPos(l_strNivel[7], '</Pdo>') - 1);

        //Respuesta a estado situación fiscal
        l_strNivel[8] := l_strRespuesta;
        l_strNivel[8] := CopyStr(l_strNivel[8], StrPos(l_strNivel[8], '<Rsp>') + StrLen('<Rsp>'), 1000000);
        l_strNivel[8] := CopyStr(l_strNivel[8], 1, StrPos(l_strNivel[8], '</Rsp>') - 1);

        //Código Transacción
        l_strNivel[9] := l_strRespuesta;
        l_strNivel[9] := CopyStr(l_strNivel[9], StrPos(l_strNivel[9], '<RTran>') + StrLen('<RTran>'), 1000000);
        l_strNivel[9] := CopyStr(l_strNivel[9], 1, StrPos(l_strNivel[9], '</RTran>') - 1);

        //Código Transacción
        l_strNivel[10] := l_strRespuesta;
        l_strNivel[10] := CopyStr(l_strNivel[10], StrPos(l_strNivel[10], '<FTran>') + StrLen('<FTran>'), 1000000);
        l_strNivel[10] := CopyStr(l_strNivel[10], 1, StrPos(l_strNivel[10], '</FTran>') - 1);

        Clear(l_rst99008535);
        l_rst99008535.CreateOutStream(l_OutStream, TEXTENCODING::UTF8);
        l_OutStream.WriteText(l_strRespuesta);

        Clear(l_rstDocumentosDigitalizados);
        if l_rstDocumentosDigitalizados.Find('+') then
            intLinea := l_rstDocumentosDigitalizados.Linea
        else
            intLinea := 1;

        Clear(l_rstDocumentosDigitalizados);
        l_rstDocumentosDigitalizados.Linea := intLinea + 1;
        l_rstDocumentosDigitalizados."Nivel 1" := CopyStr(l_strNivel[1], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 1"));
        l_rstDocumentosDigitalizados."Nivel 2" := CopyStr(l_strNivel[2], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 2"));
        l_rstDocumentosDigitalizados."Nivel 3" := CopyStr(l_strNivel[3], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 3"));
        l_rstDocumentosDigitalizados."Nivel 4" := CopyStr(l_strNivel[4], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 4"));
        l_rstDocumentosDigitalizados."Nivel 5" := CopyStr(l_strNivel[5], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 5"));
        l_rstDocumentosDigitalizados."Nivel 6" := CopyStr(l_strNivel[6], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 6"));
        l_rstDocumentosDigitalizados."Nivel 7" := CopyStr(l_strNivel[7], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 7"));
        l_rstDocumentosDigitalizados."Nivel 8" := CopyStr(l_strNivel[8], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 8"));
        l_rstDocumentosDigitalizados."Nivel 9" := CopyStr(l_strNivel[9], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 9"));
        l_rstDocumentosDigitalizados."Nivel 10" := CopyStr(l_strNivel[10], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 10"));
        l_rstDocumentosDigitalizados."Nivel 11" := CopyStr(l_strNivel[11], 1, MaxStrLen(l_rstDocumentosDigitalizados."Nivel 11"));
        //l_rstDocumentosDigitalizados.BlobFile := l_rst99008535.Blob;
        l_rstDocumentosDigitalizados.Insert;

        /*
        if l_strError <> '' then
            l_rst99008535.DeleteAll;
        */

        clear(l_rrDocsDigitalizados);
        l_rrDocsDigitalizados.get(l_rstDocumentosDigitalizados.RecordId);
        l_rst99008535.ToRecordRef(l_rrDocsDigitalizados, l_rstDocumentosDigitalizados.FieldNo("BlobFile"));
        l_rrDocsDigitalizados.Modify;

        Clear(t_rst23c);
        t_rst23c.Copy(l_rst23);

        Evaluate(l_datFecha, l_strNivel[10]);

        fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::Vendor, t_rst23c.FieldNo("Fecha consulta Reproweb"), Format(l_rst23."Fecha consulta Reproweb"), Format(CalcDate('<+CM>', l_datFecha)), CopyStr(t_rst23c.GetPosition, 1, 250));
        t_rst23c."Fecha consulta Reproweb" := CalcDate('<+CM>', l_datFecha);

        fntRegistroDetail(l_rst50400, l_rstDocumentosDigitalizados, DATABASE::Vendor, t_rst23c.FieldNo("Estado de situación fiscal"), Format(l_rst23."Estado de situación fiscal"), Format(l_strNivel[8]), CopyStr(t_rst23c.GetPosition, 1, 250));
        Evaluate(t_rst23c."Estado de situación fiscal", l_strNivel[8]);

        l_reader.Close();
        l_str.Close();

        Commit;

        Clear(l_rst50401);
        l_rst50401.SetRange("Imported document entry no.", l_rstDocumentosDigitalizados.Linea);
        l_rst50401.SetRange("Register entry no.", l_rst50400."Entry no.");
        l_rst50401.SetFilter("Clave registro", '<>%1', '');
        Clear(l_pge50507);
        l_pge50507.SetTableView(l_rst50401);
        l_pge50507.LookupMode := true;
        if l_pge50507.RunModal = ACTION::LookupOK then begin

            l_dlgDialogo.Open('Actualizando datos en tabla #1###########');

            l_rst50401.SetRange(Ommit, false);
            if l_rst50401.FindSet then
                repeat

                    l_dlgDialogo.Update(1, l_rst50401."Table Caption");
                    fntActualizarDatoenTabla(l_rst50401."Table No.", l_rst50401."Field No.", l_rst50401."Clave registro", l_rst50401."New Value");

                until l_rst50401.Next = 0;

            //MESSAGE('Commiteado');

        end
        else
            Error(Error0002);

        if l_strError <> '' then
            Mensaje := l_strError
        else
            Mensaje := StrSubstNo(Mensaje0001, l_rst23."No." + ' ' + l_rst23.Name);

        Clear(l_ConfUsu);
        l_ConfUsu.Get(UserId);

        l_CodeMens.RegistrarMensaje(Mensaje, '', l_rst23."No.", 'Proveedor', 'Reproweb', Today,
        l_PunMensajeria."Tipo movimiento"::Mensaje, l_ConfUsu.Grupo, '', '', '', '', '', '', '');

        l_dlgDialogo.Close;

    end;
}

