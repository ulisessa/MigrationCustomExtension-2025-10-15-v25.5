pageextension 5233 "Extends Human Resources Setup" extends "Human Resources Setup"
{
    Caption = 'Human Resources Setup';
    PromotedActionCategories = 'New,Process,Report,Employee,Documents';

    layout
    {
        addlast(content)
        {
            group("Exportar BPA")
            {
                field(Legajo; codRes)
                {
                    TableRelation = Resource."No." WHERE(Type = CONST(Person));
                }
            }
            group("Conf. interfaz meta4")
            {
                field("TNS SID"; "TNS SID")
                {
                }
                field("Meta4 userid"; "Meta4 userid")
                {
                }
                field("Meta4 password"; "Meta4 password")
                {
                }
                field("Nombre libro nomina"; "Nombre libro nomina")
                {
                }
                field("Nombre sección nomina"; "Nombre sección nomina")
                {
                }
                field("Nombre sección nomina temporal"; "Nombre sección nomina temporal")
                {
                }
            }
            group("Replicación Meta4")
            {
                field("Fecha inicio "; datFechaInicio)
                {
                }
                field("Fecha fin"; datFechaFin)
                {
                }
                field("Generar diario"; blnGenerarDiario)
                {
                }
                field(Registrar; blnRegistrar)
                {
                }
            }
            group(Dimensiones)
            {
                field("DNI Dimension"; "DNI Dimension")
                {
                }
                field("CI Dimension"; "CI Dimension")
                {
                }
                field("LE Dimension"; "LE Dimension")
                {
                }
                field("CUIL Dimension"; "CUIL Dimension")
                {
                }
                field("Union dimension"; "Union dimension")
                {
                }
            }
        }
    }

    actions
    {
        addlast(processing)
        {
            action("Sincronizar personal con Meta4")
            {
                Image = Migration;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    cduMeta4: Codeunit "Interfaz Meta4";
                begin
                    cduMeta4.fntSincronizarPersonal(Today, Today, false, true);
                end;
            }
            action("Sincronizar nómina con Meta4")
            {
                Image = PayrollStatistics;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    cduMeta4: Codeunit "Interfaz Meta4";
                begin
                    cduMeta4.fntActivarInterfazMeta4(datFechaInicio, datFechaFin, true, true, blnRegistrar, blnGenerarDiario);
                    decImporte := 0;
                    codCuenta := '';
                end;
            }
            action("Sincronizar roles")
            {
                Image = PayrollStatistics;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    cduMeta4: Codeunit "Interfaz Meta4";
                begin
                    cduMeta4.fntSincronizarRolPorDias(datFechaInicio, datFechaFin, true, true);
                end;
            }
            action("Exportar archivo Banco Patagonia")
            {
                Image = Bank;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    rstConfCont: Record "General Ledger Setup";
                    cdu419: Codeunit "File Management";
                    strBPA: Text;
                    cduCommonControl: Codeunit Mail;
                    Error2: Label 'Por favor, seleccione un empleado a exportar';
                begin
                    if (codRes = '') then
                        Error(Error2);
                    strArchivo := '';
                    strRetCualquiera2 := '';

                    Clear(cdu419);
                    Clear(cduCommonControl);
                    Clear(FileMgt);

                    strRetCualquiera2 := FileMgt.ServerTempFileName(strRetCualquiera2);

                    fntExportarBPA(strRetCualquiera2, codRes);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        strRetCualquiera2 := '';

        blnRegistrar := false;
    end;

    var
        datFechaInicio: Date;
        datFechaFin: Date;
        strArchivo: Text;
        strRetCualquiera2: Text;
        codRes: Code[20];
        FileMgt: Codeunit "File Management";
        strVariable: array[1000] of Text;
        AsciiStr: Text[250];
        AnsiStr: Text[250];
        CharVar: array[32] of Char;
        rstProvincia: Record "Area";
        blnRegistrar: Boolean;
        blnGenerarDiario: Boolean;
        decImporte: Decimal;
        codCuenta: Code[10];

    [Scope('OnPrem')]
    procedure fntExportarBPA(strArchivo: Text; codRes: Text)
    var
        StreamInTest: OutStream;
        FileTest: File;
        Txt: Text;
        rstProv: Record Vendor;
        rstCompanyInfo: Record "Company Information";
        rstRet: Record "Withholding details";
        codProv: Code[11];
        strProv: Text[60];
        datDesde: Date;
        datHasta: Date;
        intPor: Integer;
        rstInBF: Record "Invoice Withholding Buffer";
        rstInBFNC: Record "Invoice Withholding Buffer";
        rstMens: Record Mensajeria;
        strDia: Text[2];
        strMes: Text[2];
        "strAño": Text[4];
        rstTipoRet: Record "Withholding codes";
        rstCont: Record "G/L Entry";
        CrLf: Text;
        strForm: Text[4];
        strVersion: Text[4];
        strTrazabilidad: Text[10];
        strCUITAgente: Text[11];
        intImpuesto: Integer;
        intRegimen: Integer;
        strCUITRetenido: Text[11];
        strFechaRet: Text[10];
        strTipo: Text[2];
        strFechaCom: Text[10];
        strNroCompr: Text[16];
        strImpComp: Text[14];
        strImpRet: Text[14];
        strCertOrigNro: Text[25];
        strCertOrigFech: Text[10];
        strCertOrigImp: Text[14];
        strOtrosDatos: Text[30];
        strDec: Text[2];
        intDec: Decimal;
        dlgDialogo: Dialog;
        rstRes: Record Employee;
        i: Integer;
        strRetCualquiera3: Text;
    begin
        FileTest.TextMode(true);
        FileTest.Create(strArchivo);
        FileTest.CreateOutStream(StreamInTest);

        Clear(dlgDialogo);
        dlgDialogo.Open('#1##################################');


        CrLf[1] := 13;
        CrLf[2] := 10;

        Clear(rstRes);
        rstRes.SetFilter(rstRes."No.", codRes);
        if rstRes.FindSet then
            repeat

                Txt := '';

                Clear(rstCompanyInfo);
                rstCompanyInfo.Get();

                for i := 1 to 33 do begin

                    case i of
                        1:
                            strVariable[i] := '6264';
                        2:
                            strVariable[i] := fntAlfa(15, fntAnularAcentosyEñes(rstRes.pat_Apellido));
                        3:
                            strVariable[i] := fntAlfa(15, '');
                        4:
                            strVariable[i] := fntAlfa(16, fntAnularAcentosyEñes(rstRes.pat_Nombre));
                        5:
                            strVariable[i] := fntNum(3, Format(rstRes."pat_Tipo de documento"));
                        6:
                            strVariable[i] := fntNum(17, fntAnularAcentosyEñes(Format(rstRes."pat_No. documento")));
                        7:
                            strVariable[i] := fntNum(2, Format(rstRes."pat_Provincia documento"));
                        8:
                            strVariable[i] := fntAlfa(1, CopyStr(Format(rstRes.pat_Nacionalidad), 1, 1));
                        9:
                            begin

                                if rstRes."pat_Fecha nacimiento" <> 0D then
                                    strVariable[i] := fntNum(2, Format(Date2DMY(rstRes."pat_Fecha nacimiento", 1))) +
                                                      fntNum(2, Format(Date2DMY(rstRes."pat_Fecha nacimiento", 2))) +
                                                      fntNum(4, Format(Date2DMY(rstRes."pat_Fecha nacimiento", 3)))
                                else
                                    strVariable[i] := fntNum(8, '0');

                            end;
                        10:
                            begin

                                if rstRes.pat_Sexo = 'M' then
                                    strVariable[i] := 'F';
                                if rstRes.pat_Sexo = 'H' then
                                    strVariable[i] := 'M';

                            end;
                        11:
                            strVariable[i] := fntAlfa(1, rstRes."pat_Estado civil");
                        12:
                            strVariable[i] := fntAlfa(19, fntAnularAcentosyEñes(rstRes."pat_Calle domicilio particular"));
                        13:
                            strVariable[i] := fntNum(5, CopyStr(Format(rstRes."pat_Número puerta dom. part."), 1, 5));
                        14:
                            begin
                                if rstRes."pat_Piso dom. part." = 'null' then
                                    strVariable[i] := fntAlfa(2, '')
                                else
                                    strVariable[i] := fntAlfa(2, Format(rstRes."pat_Piso dom. part."));
                            end;
                        15:
                            begin
                                if rstRes."pat_Piso dom. part." = 'null' then
                                    strVariable[i] := fntAlfa(2, '')
                                else
                                    strVariable[i] := fntAlfa(2, Format(rstRes."pat_Unidad dom. part."));
                            end;
                        16:
                            strVariable[i] := fntAlfa(30, Format(rstRes."pat_Localidad dom. part."));
                        17:
                            strVariable[i] := fntNum(5, CopyStr(rstRes."pat_Cód. postal dom. part.", 1, 5));
                        18:
                            strVariable[i] := fntNum(2, CopyStr(rstRes."pat_Cód. provincia dom. part.", 1, 2));
                        19:
                            strVariable[i] := fntNum(1, Format(rstRes."pat_Tipo cuenta solicitada"));
                        20:
                            strVariable[i] := fntAlfa(30, '');
                        21:
                            strVariable[i] := fntNum(3, Format(rstRes."pat_Cód. ident. AFIP"));
                        22:
                            strVariable[i] := fntNum(11, DelChr(rstRes."CIF/NIF", '=', '-.'));
                        23:
                            strVariable[i] := fntNum(5, Format(rstRes."pat_Ingresos netos"));
                        24:
                            strVariable[i] := fntAlfa(3, '');
                        25:
                            strVariable[i] := fntAlfa(15, rstRes."pat_ Categoría/Cargo/Rango");
                        26:
                            begin

                                if rstRes."pat_Fecha ingreso laboral" <> 0D then
                                    strVariable[i] := fntNum(2, Format(Date2DMY(rstRes."pat_Fecha ingreso laboral", 1))) +
                                                   fntNum(2, Format(Date2DMY(rstRes."pat_Fecha ingreso laboral", 2))) +
                                                   fntNum(4, Format(Date2DMY(rstRes."pat_Fecha ingreso laboral", 3)))
                                else
                                    strVariable[i] := fntNum(8, '0');

                            end;
                        27:
                            strVariable[i] := fntAlfa(15, '01');
                        28:
                            strVariable[i] := fntNum(5, rstRes."pat_Cód. postal dep. pago");
                        29:
                            strVariable[i] := fntAlfa(25, '');
                        30:
                            strVariable[i] := fntAlfa(4, rstRes."pat_Teléfono - prefijo país/p");
                        31:
                            strVariable[i] := fntAlfa(4, rstRes."pat_Teléfono - característica");
                        32:
                            strVariable[i] := fntNum(5, rstRes."pat_Teléfono - Número");
                        33:
                            strVariable[i] := fntAlfa(19, '');
                    end;

                end;

                for i := 1 to 33 do begin

                    Txt := Txt + strVariable[i];

                end;

                dlgDialogo.Update(1, Txt);

                StreamInTest.WriteText(Txt +
                                       CrLf);

            until rstRes.Next = 0;

        dlgDialogo.Close;

        FileTest.Close();

        FileMgt.DownloadTempFile(strArchivo);

        FileMgt.DownloadHandler(strArchivo, 'Archivo nuevo', '', 'Archivos de texto (*.txt)|*.txt', strRetCualquiera3);

    end;

    [Scope('OnPrem')]
    procedure fntAlfa(intQty: Integer; strData: Text[50]): Text[30]
    begin
        if StrLen(strData) < intQty then
            repeat

                strData := strData + ' ';

            until StrLen(strData) = intQty;

        if StrLen(strData) > intQty then
            repeat

                strData := CopyStr(strData, 1, StrLen(strData) - 1);

            until StrLen(strData) = intQty;

        exit(fntAnularAcentosyEñes(strData));
    end;

    [Scope('OnPrem')]
    procedure fntNum(intQty: Integer; strData: Text[30]): Text[30]
    begin
        strData := DelChr(strData, '=', '.');
        if StrLen(strData) < intQty then
            repeat

                strData := '0' + strData;

            until StrLen(strData) = intQty;

        if StrLen(strData) > intQty then
            repeat

                strData := CopyStr(strData, 2, 30);

            until StrLen(strData) = intQty;

        exit(fntAnularAcentosyEñes(strData));
    end;

    [Scope('OnPrem')]
    procedure Ascii2Ansi(_Text: Text[250]): Text[30]
    begin
        MakeVars;
        exit(ConvertStr(_Text, AnsiStr, AsciiStr));
    end;

    [Scope('OnPrem')]
    procedure MakeVars()
    begin
        AsciiStr := '€‚ƒ„…†‡ˆ‰Š‹ŒŽ‘’“”•–—˜™š›œžŸ ¡¢£¤¥¦§¨©ª«¬­®¯ÝÝÝÝÝµ¶·¸ÝÝ++½¾++--+-+ÆÇ++--Ý-+';
        AsciiStr := AsciiStr + 'ÏÐÑÒÓÔiÖ×Ø++Ý_ÝÞîàáâãäåæçèéêëìíîïðñ=óôõö÷øùúûüýÝÿ';
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
        AnsiStr := 'Çüéâäàåçêëèïîì' + Format(CharVar[1]) + Format(CharVar[2]) + Format(CharVar[3]) + 'æÆôö' + Format(CharVar[4]);
        AnsiStr := AnsiStr + 'ûùÿÖ' + Format(CharVar[5]) + 'ø£Ø×ƒáíóúñÑª' + Format(CharVar[6]) + Format(CharVar[7]);
        AnsiStr := AnsiStr + '®¬½' + Format(CharVar[8]) + '¡«' + Format(CharVar[9]) + '___¦¦' + Format(CharVar[10]) + Format(CharVar[11]);
        AnsiStr := AnsiStr + Format(CharVar[12]) + '©¦¦++¢¥++--+-+ã' + Format(CharVar[13]) + '++--¦-+¤ðÐ';
        AnsiStr := AnsiStr + Format(CharVar[14]) + Format(CharVar[15]) + Format(CharVar[16]) + 'i' + Format(CharVar[17]) + Format(CharVar[18]);
        AnsiStr := AnsiStr + 'Ï++__¦' + Format(CharVar[19]) + Format(CharVar[20]) + 'Ó' + Format(CharVar[21]) + 'ÔÒõ';
        AnsiStr := AnsiStr + Format(CharVar[22]) + 'µ' + Format(CharVar[23]) + 'Þ' + Format(CharVar[24]) + Format(CharVar[25]);
        AnsiStr := AnsiStr + Format(CharVar[26]) + 'ýÝ¯' + Format(CharVar[27]) + '­' + Format(CharVar[28]) + '=¾¶§÷¸' +
        Format(CharVar[29]);
        AnsiStr := AnsiStr + '¨·' + Format(CharVar[30]) + Format(CharVar[31]) + Format(CharVar[32]) + '_ ';
    end;

    [Scope('OnPrem')]
    procedure Ansi2Ascii(_Text: Text[30]): Text[30]
    begin
        MakeVars;
        exit(ConvertStr(_Text, AnsiStr, AsciiStr));
    end;

    [Scope('OnPrem')]
    procedure "fntAnularAcentosyEñes"(strTexto: Text[100]): Text[100]
    begin
        exit(ConvertStr(strTexto, 'áéíóúñÑ¡', 'aeiounNi'));
    end;
}

