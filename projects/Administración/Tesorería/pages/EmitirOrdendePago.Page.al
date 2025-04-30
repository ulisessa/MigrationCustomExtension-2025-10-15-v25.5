page 50006 "Emitir Orden de Pago"
{
    SaveValues = true;

    layout
    {
        area(content)
        {
            group("Banco de débito")
            {
                field("Banco débito"; strBancoDebito)
                {
                    TableRelation = "Bank Account";
                }
                field("Nro Orden Pago"; strNroOP)
                {
                }
                field(Observaciones; strObs)
                {
                    MultiLine = true;
                }
            }
            group(Exportar)
            {
                field("Filtro completo"; strFiltro)
                {
                    MultiLine = true;
                }
                field("Archivo a exportar"; strOP)
                {
                    Editable = false;

                    trigger OnAssistEdit()
                    var
                        cduCommonControl: Codeunit Mail;
                        optFiletype: Option " ",Text,Excel,Word,Custom;
                    begin
                        strOP := '';

                        Clear(cduCommonControl);

                        strRetCualquiera2 := FileMgt.ServerTempFileName(strRetCualquiera2);

                        strOP := strRetCualquiera2;
                    end;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Exportar archivo")
            {
                Image = Export;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    rstConfCont: Record "General Ledger Setup";
                    cdu419: Codeunit "File Management";
                begin
                    Clear(cdu419);

                    strRetenidoSRV := strOP;

                    fntExportarOP(strFiltro);

                    Message(Message1, Format(j));

                    CurrPage.Close;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        strOP := '';
    end;

    var
        dlgDialogo: Dialog;
        strFiltro: Text;
        strOP: Text[1024];
        Error1: Label 'Por favor, seleccione primero el tipo de archivo a importar';
        strRetCualquiera1: Text[1024];
        strRetCualquiera2: Text[1024];
        strRetCualquiera3: Text[1024];
        datFinal: Date;
        FileMgt: Codeunit "File Management";
        DOSFile: File;
        Error2: Label 'Por favor, ingrese primero el filtro de fechas para las retenciones a exportar';
        Message1: Label 'Acción finalizada. Se han procesado %1 registros.';
        i: Integer;
        j: Integer;
        strRetenidoSRV: Text[1024];
        StreamInTest: OutStream;
        FileTest: File;
        Txt: Text[250];
        intPor: Integer;
        CrLf: Text;
        strNroOP: Text[8];
        strObs: Text[60];
        strBancoDebito: Code[10];
        rstBanco: Record "Bank Account";

    [Scope('OnPrem')]
    procedure fntExportarOP(strSelect: Text)
    var
        aADO_Con: DotNet dnOracleConnection;
        aADO_Comm: DotNet dnOracleCommand;
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strNBanco: Text[30];
        ServerName: Text;
        OracleDB: Text;
        ConnectionString: Text;
        UserName: Text;
        Pass: Text;
        datFechaVariable: DateTime;
        strVariable: Text[1024];
        strIDBanco: Text[1024];
        strTipoCuenta: Text[1024];
        strNroCuenta: Text[1024];
        strFechaVariable: Text[1024];
        strLiquido: Text[1024];
        strTipoReg: Text[3];
        strDec: Text;
        decLiquido: Decimal;
        strTotal: Text[17];
        strCtaCorto: Text[2];
        strEsp: Text[136];
        strDC: Text;
        strDia: Text[2];
        strMes: Text[2];
        "strAño": Text[4];
        strConsolidado: Text[1];
        strTripleCero: Text[3];
        strFechaArchivo: Text[8];
        strSecuencia: Text[8];
        strIDBancoOrigen: Text[3];
        strTipoCuentaDebito: Text[4];
        strNroCuentaDebito: Text[22];
        strObsLocal: Text[60];
    begin
        //FileMgt.ServerTempFileName(strRetenidoSRV);
        FileTest.TextMode(true);
        FileTest.Create(strOP);
        //FileTest.OPEN(strRetenidoSRV);
        FileTest.CreateOutStream(StreamInTest);

        Clear(dlgDialogo);
        dlgDialogo.Open('#1##################################');

        CrLf[1] := 13;
        CrLf[2] := 10;

        ServerName := 'meta4.arbumasa.net.ar';
        OracleDB := 'meta4';
        UserName := 'meta4';
        Pass := 'meta4';
        ConnectionString := 'Data Source=' + ServerName + ';' +
                            'Integrated Security=false' + ';' +
                            'Password=' + Pass + ';' +
                            'User ID=' + UserName + ';';

        dlgDialogo.Update(1, 'Exportar pagos');

        aADO_Con := aADO_Con.OracleConnection('Data Source=meta4.arbumasa.net.ar;User Id=meta4;Password=meta4;');
        aADO_Con.Open;

        //aADO_Comm := aADO_Con.OracleConnection;

        aADO_Comm := aADO_Comm.OracleCommand('ALTER SESSION SET NLS_DATE_FORMAT=''YYYY/MM/DD''', aADO_Con);

        aADO_Reader := aADO_Comm.ExecuteReader;

        aADO_Comm := aADO_Comm.OracleCommand(strSelect, aADO_Con);

        aADO_Reader := aADO_Comm.ExecuteReader;
        strIDBanco := '';
        strTipoCuenta := '';
        strNroCuenta := '';

        if strBancoDebito = '' then
            Error('Seleccione un banco');

        Clear(rstBanco);
        rstBanco.Get(strBancoDebito);

        strIDBancoOrigen := rstBanco."CCC Bank No.";
        strTipoCuentaDebito := '';
        strTipoCuentaDebito := /*rstBanco."CCC Control Digits"rstBanco."CCC Bank Branch No."*/rstBanco."Tipo cuenta";
        strNroCuentaDebito := rstBanco."CCC No.";
        //MESSAGE('Previa lectura');

        while aADO_Reader.Read() do begin

            //MESSAGE('post lectura');
            strFechaVariable := '';
            strLiquido := '';
            strTipoReg := '';
            strDec := '';
            decLiquido := 0;
            strTotal := '';
            strCtaCorto := '';
            strEsp := '';
            strDC := '';
            strConsolidado := '';
            strTripleCero := '';
            strFechaArchivo := '';
            strSecuencia := '';

            Txt := '';

            Clear(rstRecurso);
            decLegajo := 0;

            j += 1;
            Evaluate(decLegajo, Format(aADO_Reader.Item('ID_EMPLEADO')));

            codLegajo := '';
            codLegajo := DelChr(Format(decLegajo), '=', ',.');

            if StrLen(codLegajo) < 5 then
                repeat

                    codLegajo := '0' + codLegajo;

                until StrLen(codLegajo) = 5;

            //EVALUATE(strFechaVariable,FORMAT(aADO_Reader.Item('FEC_IMPUTACION')));
            Evaluate(strFechaVariable, Format(CurrentDateTime()));
            Evaluate(datFechaVariable, strFechaVariable);
            Evaluate(strIDBanco, Format(aADO_Reader.Item('ID_BANCO')));
            strFechaVariable := Format(DT2Date(datFechaVariable));
            Evaluate(strTipoCuenta, Format(aADO_Reader.Item('ID_TIPO_CUENTA')));
            Evaluate(strNroCuenta, Format(aADO_Reader.Item('NUM_CUENTA')));
            Evaluate(strLiquido, Format(aADO_Reader.Item('LIQUIDO')));
            Evaluate(decLiquido, strLiquido);

            if j = 1 then begin

                for i := 1 to 13 do begin

                    case i of
                        1:
                            begin
                                strTipoReg := '*U*';
                            end;
                        2:
                            begin
                                if StrLen(strIDBancoOrigen) < 3 then
                                    repeat

                                        strIDBancoOrigen := strIDBancoOrigen + ' ';

                                    until StrLen(strIDBancoOrigen) = 3
                                else begin

                                    if StrLen(strIDBancoOrigen) > 3 then
                                        repeat

                                            if CopyStr(strIDBancoOrigen, 1, 1) = '0' then
                                                strIDBancoOrigen := CopyStr(strIDBancoOrigen, 2, 10)
                                            else
                                                Error('El ID de Banco %1 es incorrecto', strIDBancoOrigen);

                                        until StrLen(strIDBancoOrigen) = 3;

                                end;

                            end;

                        3:
                            begin
                                //MESSAGE(strTipoCuentaDebito);
                                case strTipoCuentaDebito of

                                    'CC':
                                        strTipoCuentaDebito := '01';
                                    'CA':
                                        strTipoCuentaDebito := '02';
                                    '01':
                                        strTipoCuentaDebito := '01';
                                    '02':
                                        strTipoCuentaDebito := '02';

                                end;

                                if StrLen(strTipoCuentaDebito) < 2 then
                                    repeat

                                        strTipoCuentaDebito := '0' + strTipoCuentaDebito;

                                    until StrLen(strTipoCuentaDebito) = 2
                                else begin

                                    if StrLen(strTipoCuentaDebito) > 2 then
                                        Error('El Tipo de Cuenta %1 es incorrecto', strTipoCuentaDebito);

                                end;

                            end;
                        4:
                            begin
                                //MESSAGE(strNroCuentaDebito);
                                if StrLen(strNroCuentaDebito) < 17 then
                                    repeat

                                        strNroCuentaDebito := strNroCuentaDebito + ' ';

                                    until StrLen(strNroCuentaDebito) = 17
                                else begin

                                    if StrLen(strNroCuentaDebito) > 17 then
                                        Error('El Número de Cuenta %1 es incorrecto', strNroCuentaDebito);

                                end;

                            end;
                        5:
                            begin

                                strDC := 'D';

                            end;
                        6:
                            begin
                                //MESSAGE('%1',FORMAT(datFechaVariable));
                                strDia := Format(Date2DMY(DT2Date(datFechaVariable), 1));
                                if StrLen(strDia) = 1 then
                                    strDia := '0' + strDia;
                                strMes := Format(Date2DMY(DT2Date(datFechaVariable), 2));
                                if StrLen(strMes) = 1 then
                                    strMes := '0' + strMes;
                                strAño := Format(Date2DMY(DT2Date(datFechaVariable), 3));

                                strFechaVariable := strAño +
                                                    strMes +
                                                    strDia;

                            end;
                        7:
                            begin

                                strConsolidado := 'S';

                            end;
                        8:
                            begin
                                //MESSAGE(strObs);
                                if StrLen(strObs) < 60 then
                                    repeat

                                        strObs := strObs + ' ';

                                    until StrLen(strObs) = 60

                            end;
                        9:
                            begin

                                strTripleCero := '000';

                            end;
                        10:
                            begin

                                strCtaCorto := '00';

                            end;
                        11:
                            begin

                                strDia := Format(Date2DMY(DT2Date(datFechaVariable), 1));
                                if StrLen(strDia) = 1 then
                                    strDia := '0' + strDia;
                                strMes := Format(Date2DMY(DT2Date(datFechaVariable), 2));
                                if StrLen(strMes) = 1 then
                                    strMes := '0' + strMes;
                                strAño := Format(Date2DMY(DT2Date(datFechaVariable), 3));

                                strFechaArchivo := strMes +
                                                    '/' +
                                                    strDia +
                                                    '/' +
                                                    CopyStr(strAño, 3, 2);

                            end;
                        12:
                            begin

                                if StrLen(strSecuencia) < 8 then
                                    repeat

                                        strSecuencia := strSecuencia + ' ';

                                    until StrLen(strSecuencia) = 8;

                            end;
                        13:
                            begin
                                //MESSAGE(strEsp);
                                if StrLen(strEsp) < 123 then
                                    repeat

                                        strEsp := strEsp + ' ';

                                    until StrLen(strEsp) = 123;

                            end;

                    end;

                end;


                Txt := strTipoReg +
                       strIDBancoOrigen +
                       strTipoCuentaDebito +
                       strNroCuentaDebito +
                       strDC +
                       strFechaVariable +
                       strConsolidado +
                       strObs + ' ' +
                       strTripleCero +
                       strCtaCorto +
                       strFechaArchivo +
                       strSecuencia +
                       strEsp;

                //dlgDialogo.UPDATE(1,Txt);

                StreamInTest.WriteText(Txt +
                                       CrLf);


            end;

            //MESSAGE('Lineas');
            strFechaVariable := '';
            strTipoReg := '';
            strDec := '';
            strTotal := '';
            strCtaCorto := '';
            strEsp := '';
            strDC := '';
            strConsolidado := '';
            strTripleCero := '';
            strFechaArchivo := '';
            strSecuencia := '';

            Txt := '';

            for i := 1 to 8 do begin

                case i of
                    1:
                        begin
                            strTipoReg := '*M*';
                        end;
                    2:
                        begin
                            if StrLen(strIDBanco) < 3 then
                                repeat

                                    strIDBanco := strIDBanco + ' ';

                                until StrLen(strIDBanco) = 3
                            else begin

                                if StrLen(strIDBanco) > 3 then
                                    repeat

                                        if CopyStr(strIDBanco, 1, 1) = '0' then
                                            strIDBanco := CopyStr(strIDBanco, 2, 10)
                                        else
                                            Error('El ID de Banco %1 es incorrecto', strIDBanco);

                                    until StrLen(strIDBanco) = 3;

                            end;
                            if strIDBanco = '317' then
                                strIDBanco := '034';
                        end;

                    3:
                        begin
                            case strTipoCuenta of

                                'CC':
                                    strTipoCuenta := '01';
                                'CA':
                                    strTipoCuenta := '02';

                            end;

                            if StrLen(strTipoCuenta) < 2 then
                                repeat

                                    strTipoCuenta := '0' + strTipoCuenta;

                                until StrLen(strTipoCuenta) = 2
                            else begin

                                if StrLen(strTipoCuenta) > 2 then
                                    Error('El Tipo de Cuenta %1 es incorrecto', strTipoCuenta);

                            end;

                        end;
                    4:
                        begin

                            if StrLen(strNroCuenta) < 17 then
                                repeat

                                    strNroCuenta := strNroCuenta + ' ';

                                until StrLen(strNroCuenta) = 17
                            else begin

                                if StrLen(strNroCuenta) > 17 then
                                    Error('El Número de Cuenta %1 es incorrecto', strNroCuenta);

                            end;

                        end;
                    5:
                        begin

                            Evaluate(strLiquido, strLiquido);
                            strDec := '';
                            strDec := CopyStr(Format(Round(decLiquido, 0.01, '<') - Round(decLiquido, 1, '<')),
                                              StrPos(Format(Round(decLiquido, 0.01, '<') - Round(decLiquido, 1, '<')), ',') + 1,
                                      2);
                            if StrLen(strDec) < 2 then
                                repeat

                                    strDec := strDec + '0';

                                until StrLen(strDec) = 2;

                            strTotal := DelChr(Format(Round(decLiquido, 1, '<')), '=', '.,') + DelChr(strDec, '=', '.,');

                            if StrLen(strTotal) < 17 then
                                repeat

                                    strTotal := '0' + strTotal;

                                until StrLen(strTotal) = 17;

                        end;
                    6:
                        begin

                            if StrLen(strObs) < 60 then
                                repeat

                                    strObs := strObs + ' ';

                                until StrLen(strObs) = 60

                        end;
                    7:
                        begin

                            strCtaCorto := '00';

                        end;
                    8:
                        begin

                            if StrLen(strEsp) < 136 then
                                repeat

                                    strEsp := strEsp + ' ';

                                until StrLen(strEsp) = 136

                        end;

                end;

            end;

            Txt := strTipoReg +
                   strIDBanco +
                   strTipoCuenta +
                   strNroCuenta +
                   strTotal +
                   strObs +
                   strCtaCorto +
                   strEsp;

            // dlgDialogo.UPDATE(1,Txt);

            StreamInTest.WriteText(Txt +
                                   CrLf);


        end;

        dlgDialogo.Close;

        FileTest.Close();

        aADO_Con.Close();
        aADO_Comm.Dispose();
        aADO_Reader.Close();

        FileMgt.DownloadTempFile(strRetenidoSRV);

        strRetCualquiera3 := FileMgt.UploadFile('Archivo nuevo', 'Archivos de texto (*.txt)|*.txt');
        FileMgt.CopyServerFile(strRetenidoSRV, strRetCualquiera3, true);

    end;
}

