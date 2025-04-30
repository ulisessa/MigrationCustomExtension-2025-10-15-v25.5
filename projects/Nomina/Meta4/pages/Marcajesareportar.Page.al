page 50081 "Marcajes a reportar"
{
    DelayedInsert = false;
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Worksheet;
    ShowFilter = false;
    SourceTable = "Employee entry";
    SourceTableTemporary = true;
    SourceTableView = SORTING("Entry no.")
                      ORDER(Ascending);

    layout
    {
        area(content)
        {
            field(strFiltroFecha; strFiltroFecha)
            {
                Caption = 'Filtro fecha';
                QuickEntry = true;
                RowSpan = 2;

                trigger OnValidate()
                var
                    l_rstMarcajes: Record "Markup entry";
                begin
                    Clear(Rec);
                    Clear(rstRec);
                    rstRec.SetFilter(rstRec."Employment Date", strFiltroFecha);
                    strFiltroFecha := rstRec.GetFilter(rstRec."Employment Date");
                    Clear(rstRec);

                    fntFiltrarFecha(strFiltroFecha);
                    fntAgrupar(3);

                    SetCurrentKey("File no.", "Event code", Records);
                    CurrPage.Update;
                    /*
                    CLEAR(l_rstMarcajes);
                    l_rstMarcajes.SETFILTER("Markup date and time",strFiltroFecha);
                    strFiltroFecha := l_rstMarcajes.GETFILTER("Markup date and time");
                    
                    strFiltroFecha := FORMAT(CREATEDATETIME(DT2DATE(l_rstMarcajes.GETRANGEMIN("Markup date and time")),0T))+'..'+
                                      FORMAT(CREATEDATETIME(DT2DATE(l_rstMarcajes.GETRANGEMAX("Markup date and time")),235900T));
                    CLEAR(l_rstMarcajes);
                    
                    fntFiltrarFecha(strFiltroFecha);
                    fntAgrupar(3);
                    */

                end;
            }
            repeater(Control1000000000)
            {
                IndentationColumn = IntentColumn;
                ShowAsTree = true;
                ShowCaption = false;
                field("File no."; "File no.")
                {
                    QuickEntry = false;
                    Style = StrongAccent;
                    StyleExpr = "File no.Emphasize";
                }
                field(Name; Name)
                {
                    QuickEntry = false;
                    Style = StrongAccent;
                    StyleExpr = NameEmphasize;
                }
                field("Event code"; "Event code")
                {
                    BlankZero = true;
                    QuickEntry = false;
                    Style = StrongAccent;
                    StyleExpr = "News codeEmphasize";
                }
                field("News code"; "News code")
                {
                    Caption = 'News code';
                }
                field("Descripción"; rstConcept.Description)
                {
                    QuickEntry = false;
                }
                field("Día de la semana"; rstDate."Period Name")
                {
                    QuickEntry = false;
                }
                field("Application date"; "Application date")
                {
                    QuickEntry = false;
                    Style = StrongAccent;
                    StyleExpr = "Application dateEmphasize";
                }
                field(decQ; Quantity)
                {
                    BlankNumbers = BlankZero;
                    QuickEntry = false;
                    Style = StrongAccent;
                    StyleExpr = QuantityEmphasize;

                    trigger OnDrillDown()
                    begin
                        Clear(frmMarcajes);
                        Clear(rstMarcajes);

                        /*rstMarcajes.SETRANGE(rstMarcajes."No. empresa","No. empresa");
                        rstMarcajes.SETRANGE("No. legajo","No. legajo");
                        rstMarcajes.SETRANGE("Fecha alta","Fecha alta");
                        rstMarcajes.SETFILTER("Fecha y hora de computación",'%1|%2',"Fecha y hora inicio","Fecha y hora fin");
                         */

                        rstMarcajes.SetFilter("Entry no.", Records);

                        frmMarcajes.SetTableView(rstMarcajes);
                        frmMarcajes.RunModal;

                    end;
                }
                field(decQD; "Quantity to distribute")
                {
                    QuickEntry = false;
                }
                field(decDiferencia; Difference)
                {
                    Caption = 'Diferencia';
                    QuickEntry = false;
                }
                field(decQLiq; "Applied quantity")
                {
                    Caption = 'Quantity';
                    QuickEntry = false;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("A&cciones")
            {
                Caption = 'A&cciones';
                action("A&plicar y registrar")
                {
                    Caption = 'A&plicar y registrar';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F11';

                    trigger OnAction()
                    begin
                        fntRegistrar;
                        //fntAgrupar(3);
                        CurrPage.Update(false);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        rstMovEmp: Record "Employee entry" temporary;
        rstMovEmp2: Record "Employee entry" temporary;
    begin
        FilenoOnFormat;
        NameOnFormat;
        HiringdateOnFormat;
        NewscodeOnFormat;
        StartdateandtimeOnFormat;
        FinishdateandtimeOnFormat;
        ApplicationdateOnFormat;
        QuantityOnFormat;
        QuantitytodistributeOnFormat;
        ImportdateOnFormat;
        RecordsOnFormat;
        decDiferencia := 0;
    end;

    trigger OnOpenPage()
    begin
        strActivate := 'ID1000000012;MD' + Format(Time, 0, 1);
    end;

    var
        FiltroProd: Text[1024];
        infoEmpresa: Record "Company Information";
        strNombre: Text[1024];
        rstRec: Record Employee;
        blnPrecalcular: Boolean;
        t_rstMarcajes: Record "Markup entry" temporary;
        intLineas: Integer;
        intCont: Integer;
        rstMovIni: Record "Markup entry";
        rstMovFin: Record "Markup entry" temporary;
        rstJor: Record "Workday detail";
        rstMovEmp: Record "Employee entry" temporary;
        intContados: Integer;
        tempMarcajes: Record "Markup entry" temporary;
        intCantARepartir: Decimal;
        intCantRepartida: Decimal;
        rstJor2: Record "Workday detail";
        decRedondeoSegundos: Decimal;
        rstMarcajes: Record "Markup entry";
        datFechaLiq: Text[50];
        codLegajo: Code[10];
        cduProcesar: Codeunit Employees;
        blnIncidencias: Boolean;
        rstJornada: Record Workday;
        rstMarcajesIni: Record "Markup entry";
        rstMarcajesFin: Record "Markup entry";
        intIni: Integer;
        intFin: Integer;
        datIniRec: DateTime;
        datIniMar: DateTime;
        datFinRec: DateTime;
        datFinMar: DateTime;
        rstMarkup: Record "Markup entry";
        rstMarkupInsert: Record "Markup entry";
        intEntrada: Integer;
        intAgrupar: Integer;
        intEncontrar: Integer;
        rstConcept: Record "Meta4 concept";

        "File no.Emphasize": Boolean;

        NameEmphasize: Boolean;

        "Hiring dateEmphasize": Boolean;

        "News codeEmphasize": Boolean;

        "Start date and timeEmphasize": Text[1024];

        "Finish date and timeEmphasize": Text[1024];

        "Application dateEmphasize": Boolean;

        QuantityEmphasize: Boolean;

        QuantitytodistributeEmphasize: Boolean;

        "Import dateEmphasize": Boolean;

        RecordsEmphasize: Boolean;
        frmMarcajes: Page "Mov. marcajes";
        strFiltroFecha: Text[1024];
        IntentColumn: Integer;
        rstDate: Record Date;
        decQD: Decimal;
        decLiq: Decimal;
        decQ: Decimal;
        decLiqT: Decimal;
        blnRegistrar: Boolean;
        cduRegistrar: Codeunit Employees;
        decQT: Decimal;
        rstWorkday: Record Workday;
        intDia: Integer;
        decQST: Decimal;
        decQDT: Decimal;
        decDiferencia: Decimal;
        p: Integer;
        blnYaEjecutado: Boolean;
        strActivate: Text;
        strArchivo: Text;
        strRetCualquiera2: Text;
        FileMgt: Codeunit "File Management";

    [Scope('OnPrem')]
    procedure fntFiltrarFecha(l_datFechaLiq: Text[50])
    begin
        datFechaLiq := l_datFechaLiq;
    end;

    [Scope('OnPrem')]
    procedure fntFiltrarLegajo(l_codLegajo: Code[10])
    begin
        codLegajo := l_codLegajo;
    end;

    [Scope('OnPrem')]
    procedure fntVerIncidencias(t_blnIncidencias: Boolean)
    begin
        blnIncidencias := t_blnIncidencias;
    end;

    [Scope('OnPrem')]
    procedure fntEjecutar()
    begin
        cduProcesar.fntProcesar(Rec, false, false, false, false);
    end;

    [Scope('OnPrem')]
    procedure fntAgrupar(l_intAgrupar: Integer)
    begin
        case l_intAgrupar of
            1:
                begin

                    intAgrupar := l_intAgrupar;
                    cduProcesar.fntFiltrarFecha(datFechaLiq);
                    cduProcesar.fntProcesar(Rec, false, false, false, false);
                    CurrPage.Update(false);

                end;
            2:
                begin

                    intAgrupar := l_intAgrupar;
                    cduProcesar.fntFiltrarFecha(datFechaLiq);
                    cduProcesar.fntProcesar(Rec, true, false, false, false);
                    Rec.SetCurrentKey("Company no.", "File no.", "Event code", "Start date and time", Records);
                    CurrPage.Update(false);

                end;

            3:
                begin

                    intAgrupar := l_intAgrupar;
                    cduProcesar.fntFiltrarFecha(datFechaLiq);
                    //cduProcesar.fntProcesar(      //cduProcesar.fntProcesar(Rec,FALSE,TRUE);
                    cduProcesar.fntPresentarMeta4(Rec, false, true);
                    //      Rec.SETCURRENTKEY("Company no.","File no.","Event code","Start date and time",Records);
                    //     Rec.SETCURRENTKEY("Company no.","File no.");
                    CurrPage.Update(false);

                end;

        end;

        fntQ;
    end;

    [Scope('OnPrem')]
    procedure fntRegistrar()
    var
        datIni: Date;
        datFin: Date;
        rstEE: Record "Employee entry";
        intRegistrados: Integer;
        rstEETemp: Record "Employee entry";
        decLiq: Decimal;
        tpm_rstEE: Record "Employee entry" temporary;
        tpm_rstEEBis: Record "Employee entry" temporary;
        tmp_rstEmployee: Record Employee temporary;
        rstEmployee: Record Employee;
        rstEvent: Record "Meta4 concept";
        codEvent: Integer;
        codEmpleado: Code[20];
        dlgVentana: Dialog;
        rstCompanyInfo: Record "Company Information";
        rstConfCont: Record "General Ledger Setup";
        cdu419: Codeunit "File Management";
        strBPA: Text;
        cduCommonControl: Codeunit Mail;
        StreamInTest: OutStream;
        StreamInTestAlicuotas: OutStream;
        StreamInTestDespachos: OutStream;
        FileTest: File;
        FileTestAlicuotas: File;
        Txt: Text;
        CrLf: Text;
        strVariable: array[1000] of Text;
        i: Integer;
        aADO_Con: DotNet dnOracleConnection;
        aADO_Comm: DotNet dnOracleCommand;
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        ConnectionString: Text;
        strRetCualquiera3: Text;
        l_datLocal: Date;
        strFRegistro: Text;
        codMes: Code[2];
        "codAño": Code[4];
        cduGestArch: Codeunit GestionArchivos;
    begin
        while StrPos(datFechaLiq, 'a.m.') <> 0 do begin

            datFechaLiq := DelStr(datFechaLiq, StrPos(datFechaLiq, 'a.m.'), 4);

        end;

        rstEETemp.SetFilter("Start date and time", datFechaLiq);
        datIni := DT2Date(rstEETemp.GetRangeMin("Start date and time"));
        datFin := DT2Date(rstEETemp.GetRangeMax("Start date and time"));

        Clear(rstCompanyInfo);
        rstCompanyInfo.Get();
        /*
        IF rstCompanyInfo."Demo Company" THEN
        BEGIN
        */
        strRetCualquiera2 := '';

        Clear(cdu419);
        Clear(cduCommonControl);
        Clear(FileMgt);

        strRetCualquiera2 := FileMgt.ServerTempFileName(strRetCualquiera2);

        FileTest.TextMode(true);
        FileTest.Create(strRetCualquiera2);
        FileTest.CreateOutStream(StreamInTest);

        CrLf[1] := 13;
        CrLf[2] := 10;
        /*
        END;
        */
        dlgVentana.Open('Legajo:   #1##############\' +
                        'Empleado: #2#################################\' +
                        'Marcaje : #3##############\' +
                        'Estado: #4#################');

        SetCurrentKey("File no.", "News code", Records);
        if FindSet then
            repeat

                if Date2DMY(datIni, 1) < 16 then
                    strFRegistro := '11'
                else
                    strFRegistro := '25';

                Clear(rstEmployee);
                if rstEmployee.Get("File no.") then;
                if (rstEmployee."Inactive Date" < rstEmployee."Employment Date") then begin

                    if ("News code" <> 0) and (Records = '') and ("Applied quantity" <> 0) then begin

                        if codEmpleado <> "File no." then begin

                            if (codEmpleado <> '') and (decLiq <> 0) then begin

                                Clear(rstEvent);
                                rstEvent.Get("Event code");
                                Clear(rstEmployee);
                                rstEmployee.Get(codEmpleado);
                                dlgVentana.Update(1, codEmpleado);
                                dlgVentana.Update(2, rstEmployee.Name);
                                dlgVentana.Update(4, 'Registrando...');

                                Clear(cduRegistrar);
                                /*
                                IF rstCompanyInfo."Demo Company" THEN
                                BEGIN
                                */
                                Txt := '';
                                for i := 1 to 8 do begin

                                    case i of
                                        1://2 ID Sociedad, siempre 01
                                            begin

                                                strVariable[i] := '01';

                                            end;
                                        2:// ID Empleado
                                            begin

                                                strVariable[i] := codEmpleado;

                                            end;
                                        3://10 Fecha alta empleado
                                            begin
                                                Clear(rstEmployee);
                                                rstEmployee.Get(codEmpleado);

                                                filtString1 := '';
                                                filtString1 := 'select MAX(FEC_ALTA_EMPLEADO) as FEC_ALTA_EMPLEADO from M4T_FASES_ALTA ' +
                                                               'where ID_EMPLEADO = ' + codEmpleado;

                                                //IF codFile = '80008' THEN
                                                //MESSAGE('%1',filtString1);

                                                ConnectionString := fntConfSincrMeta4;

                                                aADO_Con := aADO_Con.OracleConnection(ConnectionString);
                                                aADO_Con.Open;

                                                //aADO_Comm := aADO_Con.OracleConnection;

                                                aADO_Comm := aADO_Comm.OracleCommand(filtString1, aADO_Con);
                                                aADO_Reader := aADO_Comm.ExecuteReader;
                                                while aADO_Reader.Read() do begin
                                                    if aADO_Reader.HasRows then begin
                                                        strVariable[i] := Format(aADO_Reader.Item('FEC_ALTA_EMPLEADO'));
                                                        Evaluate(l_datLocal, strVariable[i]);
                                                        strVariable[i] := Format(Format(l_datLocal, 0, '<Day,2>/<Month,2>/<Year4>'));
                                                    end;
                                                end;
                                                aADO_Con.Close;

                                            end;
                                        4://ID tipo ausentismo
                                            begin
                                                strVariable[i] := Format(codEvent);
                                            end;
                                        5://Fecha inicio
                                            begin
                                                codMes := Format(Date2DMY(datIni, 2));
                                                if StrLen(codMes) = 1 then
                                                    codMes := '0' + codMes;
                                                codAño := Format(Date2DMY(datIni, 3));
                                                if StrLen(codAño) = 2 then
                                                    codAño := '20' + codAño;
                                                strVariable[i] := strFRegistro + '/' + codMes + '/' + codAño;
                                                //strVariable[i] := strFRegistro+'/'+FORMAT(FORMAT(DATE2DMY(datIni,2))+'/'+FORMAT(DATE2DMY(datIni,3)));
                                            end;
                                        6://Fecha final
                                            begin
                                                codMes := Format(Date2DMY(datFin, 2));
                                                if StrLen(codMes) = 1 then
                                                    codMes := '0' + codMes;
                                                codAño := Format(Date2DMY(datFin, 3));
                                                if StrLen(codAño) = 2 then
                                                    codAño := '20' + codAño;
                                                strVariable[i] := strFRegistro + '/' + codMes + '/' + codAño;
                                                //strVariable[i] := strFRegistro+'/'+FORMAT(FORMAT(DATE2DMY(datFin,2))+'/'+FORMAT(DATE2DMY(datFin,3)));
                                            end;
                                        7://Horas
                                            begin
                                                Clear(rstConcept);
                                                rstConcept.Get(codEvent);
                                                strVariable[i] := ConvertStr(Format(Round(decLiq / rstConcept."Hours per unit", 0.5)), ',', '.');
                                            end;
                                        8://Comentario
                                            begin
                                                strVariable[i] := '2,';
                                            end;
                                    end;
                                end;

                                for i := 1 to 8 do begin

                                    if i = 8 then
                                        Txt := Txt + strVariable[i]
                                    else
                                        Txt := Txt + strVariable[i] + ',';

                                end;

                                StreamInTest.WriteText(Txt +
                                                       CrLf);
                                intRegistrados := 1;
                                /*
                                END
                                ELSE
                                BEGIN
                                  intRegistrados := cduRegistrar.fntRegistrarMeta4Sencillo(codEmpleado,
                                                                         codEvent,
                                                                         datIni,
                                                                         datFin,
                                                                         decLiq);

                                END;
                                */
                                if intRegistrados <> 0 then begin

                                    Clear(rstEE);
                                    rstEE.SetRange("Company no.", "Company no.");
                                    rstEE.SetRange("File no.", codEmpleado);
                                    rstEE.SetRange("Event code", codEvent);
                                    rstEE.SetRange(rstEE."Application date", datIni, datFin);
                                    //rstEE.SETRANGE("Finish date and time","Finish date and time");
                                    if rstEE.FindFirst then begin

                                        rstEE.Exported := true;
                                        rstEE.Modify;

                                    end;

                                end;

                                codEmpleado := "File no.";
                                codEvent := rstEvent."Meta4 concept";
                                decLiq := "Applied quantity";

                            end
                            else begin

                                if codEmpleado = '' then begin

                                    Clear(rstEvent);
                                    rstEvent.Get("Event code");
                                    codEvent := rstEvent."Meta4 concept";
                                    decLiq += "Applied quantity";
                                    codEmpleado := "File no.";

                                end;

                            end;

                        end
                        else begin

                            Clear(rstEvent);
                            rstEvent.Get("Event code");
                            if rstEvent."Meta4 concept" <> codEvent then begin

                                Clear(rstEmployee);
                                rstEmployee.Get(codEmpleado);
                                dlgVentana.Update(1, codEmpleado);
                                dlgVentana.Update(2, rstEmployee.Name);
                                dlgVentana.Update(4, 'Registrando...');

                                if codEvent <> 0 then begin

                                    Clear(cduRegistrar);
                                    /*
                                    IF rstCompanyInfo."Demo Company" THEN
                                    BEGIN
                                    */
                                    Txt := '';
                                    for i := 1 to 8 do begin

                                        case i of
                                            1://2 ID Sociedad, siempre 01
                                                begin

                                                    strVariable[i] := '01';

                                                end;
                                            2:// ID Empleado
                                                begin

                                                    strVariable[i] := codEmpleado;

                                                end;
                                            3://10 Fecha alta empleado
                                                begin
                                                    Clear(rstEmployee);
                                                    rstEmployee.Get(codEmpleado);

                                                    filtString1 := '';
                                                    filtString1 := 'select MAX(FEC_ALTA_EMPLEADO) as FEC_ALTA_EMPLEADO from M4T_FASES_ALTA ' +
                                                                   'where ID_EMPLEADO = ' + codEmpleado;


                                                    //IF codFile = '80008' THEN
                                                    //MESSAGE('%1',filtString1);

                                                    ConnectionString := fntConfSincrMeta4;
                                                    aADO_Con := aADO_Con.OracleConnection(ConnectionString);
                                                    aADO_Con.Open;

                                                    //aADO_Comm := aADO_Con.OracleConnection;

                                                    aADO_Comm := aADO_Comm.OracleCommand(filtString1, aADO_Con);
                                                    aADO_Reader := aADO_Comm.ExecuteReader;
                                                    while aADO_Reader.Read() do begin
                                                        if aADO_Reader.HasRows then begin
                                                            strVariable[i] := Format(aADO_Reader.Item('FEC_ALTA_EMPLEADO'));
                                                            Evaluate(l_datLocal, strVariable[i]);
                                                            strVariable[i] := Format(Format(l_datLocal, 0, '<Day,2>/<Month,2>/<Year4>'));
                                                        end;
                                                    end;
                                                    aADO_Con.Close;

                                                end;
                                            4://ID tipo ausentismo
                                                begin
                                                    strVariable[i] := Format(codEvent);
                                                end;
                                            5://Fecha inicio
                                                begin
                                                    codMes := Format(Date2DMY(datIni, 2));
                                                    if StrLen(codMes) = 1 then
                                                        codMes := '0' + codMes;
                                                    codAño := Format(Date2DMY(datIni, 3));
                                                    if StrLen(codAño) = 2 then
                                                        codAño := '20' + codAño;
                                                    strVariable[i] := strFRegistro + '/' + codMes + '/' + codAño;
                                                    //strVariable[i] := strFRegistro+'/'+FORMAT(FORMAT(DATE2DMY(datIni,2))+'/'+FORMAT(DATE2DMY(datIni,3)));
                                                end;
                                            6://Fecha final
                                                begin
                                                    codMes := Format(Date2DMY(datFin, 2));
                                                    if StrLen(codMes) = 1 then
                                                        codMes := '0' + codMes;
                                                    codAño := Format(Date2DMY(datFin, 3));
                                                    if StrLen(codAño) = 2 then
                                                        codAño := '20' + codAño;
                                                    strVariable[i] := strFRegistro + '/' + codMes + '/' + codAño;
                                                    //strVariable[i] := strFRegistro+'/'+FORMAT(FORMAT(DATE2DMY(datFin,2))+'/'+FORMAT(DATE2DMY(datFin,3)));
                                                end;
                                            7://Horas
                                                begin
                                                    Clear(rstConcept);
                                                    rstConcept.Get(codEvent);
                                                    strVariable[i] := ConvertStr(Format(Round(decLiq / rstConcept."Hours per unit", 0.5)), ',', '.');
                                                end;
                                            8://Comentario
                                                begin
                                                    strVariable[i] := '2,';
                                                end;
                                        end;
                                    end;

                                    for i := 1 to 8 do begin

                                        if i = 8 then
                                            Txt := Txt + strVariable[i]
                                        else
                                            Txt := Txt + strVariable[i] + ',';

                                    end;

                                    StreamInTest.WriteText(Txt +
                                                           CrLf);
                                    intRegistrados := 1;
                                    /*
                                    END
                                    ELSE
                                    BEGIN
                                      intRegistrados := cduRegistrar.fntRegistrarMeta4Sencillo(codEmpleado,
                                                                             codEvent,
                                                                             datIni,
                                                                             datFin,
                                                                             decLiq);

                                    END;
                                    */
                                    if intRegistrados <> 0 then begin

                                        Clear(rstEE);
                                        rstEE.SetRange("Company no.", "Company no.");
                                        rstEE.SetRange("File no.", "File no.");
                                        rstEE.SetRange("Event code", "Event code");
                                        //rstEE.SETRANGE("Start date and time","Start date and time");
                                        //rstEE.SETRANGE("Finish date and time","Finish date and time");
                                        rstEE.SetRange("Application date", datIni, datFin);
                                        if rstEE.FindFirst then begin

                                            rstEE.Exported := true;
                                            rstEE.Modify;

                                        end;

                                    end;

                                    codEvent := rstEvent."Meta4 concept";
                                    decLiq := "Applied quantity";

                                end
                                else begin

                                    codEvent := rstEvent."Meta4 concept";
                                    decLiq += "Applied quantity";

                                end;

                            end
                            else begin

                                decLiq += "Applied quantity";

                            end;

                        end;

                    end;

                end;

            until Next = 0;

        /*
        IF rstCompanyInfo."Demo Company" THEN
        BEGIN
        */
        Txt := '';
        for i := 1 to 8 do begin

            case i of
                1://2 ID Sociedad, siempre 01
                    begin

                        strVariable[i] := '01';

                    end;
                2:// ID Empleado
                    begin

                        strVariable[i] := codEmpleado;

                    end;
                3://10 Fecha alta empleado
                    begin
                        Clear(rstEmployee);
                        rstEmployee.Get(codEmpleado);

                        filtString1 := '';
                        filtString1 := 'select MAX(FEC_ALTA_EMPLEADO) as FEC_ALTA_EMPLEADO from M4T_FASES_ALTA ' +
                                        'where ID_EMPLEADO = ' + codEmpleado;


                        //IF codFile = '80008' THEN
                        //MESSAGE('%1',filtString1);

                        ConnectionString := fntConfSincrMeta4;

                        aADO_Con := aADO_Con.OracleConnection(ConnectionString);
                        aADO_Con.Open;

                        //aADO_Comm := aADO_Con.OracleConnection;

                        aADO_Comm := aADO_Comm.OracleCommand(filtString1, aADO_Con);
                        aADO_Reader := aADO_Comm.ExecuteReader;
                        while aADO_Reader.Read() do begin
                            if aADO_Reader.HasRows then begin
                                strVariable[i] := Format(aADO_Reader.Item('FEC_ALTA_EMPLEADO'));
                                Evaluate(l_datLocal, strVariable[i]);
                                strVariable[i] := Format(Format(l_datLocal, 0, '<Day,2>/<Month,2>/<Year4>'));
                            end;
                        end;
                        aADO_Con.Close;

                    end;
                4://ID tipo ausentismo
                    begin
                        strVariable[i] := Format(codEvent);
                    end;
                5://Fecha inicio
                    begin
                        codMes := Format(Date2DMY(datIni, 2));
                        if StrLen(codMes) = 1 then
                            codMes := '0' + codMes;
                        codAño := Format(Date2DMY(datIni, 3));
                        if StrLen(codAño) = 2 then
                            codAño := '20' + codAño;
                        strVariable[i] := strFRegistro + '/' + codMes + '/' + codAño;
                        //strVariable[i] := FORMAT(FORMAT(datIni,0,'<Day,2>/<Month,2>/<Year4>'))
                    end;
                6://Fecha final
                    begin
                        codMes := Format(Date2DMY(datFin, 2));
                        if StrLen(codMes) = 1 then
                            codMes := '0' + codMes;
                        codAño := Format(Date2DMY(datFin, 3));
                        if StrLen(codAño) = 2 then
                            codAño := '20' + codAño;
                        strVariable[i] := strFRegistro + '/' + codMes + '/' + codAño;
                        //strVariable[i] := FORMAT(FORMAT(datFin,0,'<Day,2>/<Month,2>/<Year4>'))
                    end;
                7://Horas
                    begin
                        Clear(rstConcept);
                        rstConcept.Get(codEvent);
                        strVariable[i] := ConvertStr(Format(Round(decLiq / rstConcept."Hours per unit", 0.5)), ',', '.');
                    end;
                8://Comentario
                    begin
                        strVariable[i] := '2,';
                    end;
            end;
        end;

        for i := 1 to 8 do begin

            if i = 8 then
                Txt := Txt + strVariable[i]
            else
                Txt := Txt + strVariable[i] + ',';

        end;

        StreamInTest.WriteText(Txt +
                                CrLf);
        intRegistrados := 1;
        /*
        END;
        */
        FileTest.Close();

        FileMgt.DownloadTempFile(strRetCualquiera2);

        FileMgt.DownloadHandler(strRetCualquiera2, 'Marcajes', '', '*.*', strRetCualquiera3);

    end;

    local procedure FilenoOnFormat()
    begin
        if Records = '' then begin
            "File no.Emphasize" := true;
            Clear(rstDate);
            if "Event code" = 0 then
                Clear(rstConcept);
            IntentColumn := 1;
        end
        else begin
            "File no.Emphasize" := false;
            IntentColumn := 3;
            Clear(rstDate);
            rstDate.SetRange("Period Type", rstDate."Period Type"::Date);
            rstDate.SetRange(rstDate."Period Start", "Application date");
            if rstDate.FindSet then begin

                case rstDate."Period Name" of
                    'lunes':
                        intDia := 1;
                    'martes':
                        intDia := 2;
                    'miércoles':
                        intDia := 3;
                    'jueves':
                        intDia := 4;
                    'viernes':
                        intDia := 5;
                    'sábado':
                        intDia := 6;
                    'domingo':
                        intDia := 7;
                end;

            end;

        end;

        if ("Event code" <> 0) and (IntentColumn = 1) then begin

            IntentColumn := 2;
            Clear(rstDate);

        end;
    end;

    local procedure NameOnFormat()
    begin
        if Records = '' then
            NameEmphasize := true
        else
            NameEmphasize := false;
    end;

    local procedure HiringdateOnFormat()
    begin
        if Records = '' then
            "Hiring dateEmphasize" := true
        else
            "Hiring dateEmphasize" := false;
    end;

    local procedure NewscodeOnFormat()
    begin
        if Records = '' then
            "News codeEmphasize" := true
        else
            "News codeEmphasize" := false;
    end;

    local procedure StartdateandtimeOnFormat()
    begin
        if StrLen(Records) > 1 then begin

            Clear(rstMarcajesIni);
            Evaluate(intIni, CopyStr(Records, 1, StrPos(Records, '|') - 1));
            rstMarcajesIni.Get(intIni);
            datIniRec := "Start date and time";
            datIniMar := rstMarcajesIni."Markup date and time";
            intIni := 0;
            intIni := datIniRec - datIniMar;
            if (Abs(intIni) > 60000) then
                "Start date and timeEmphasize" := 'Unfavorable'
            else
                if rstMarcajesIni."Markup type" = 2 then
                    "Start date and timeEmphasize" := 'Ambiguous'
                else
                    "Start date and timeEmphasize" := '';

        end;
    end;

    local procedure FinishdateandtimeOnFormat()
    begin
        if (StrLen(Records) > 1) and ("Finish date and time" <> 0DT) then begin

            Clear(rstMarcajesFin);
            Evaluate(intFin, CopyStr(Records, StrPos(Records, '|') + 1), 10);
            rstMarcajesFin.Get(intFin);
            datFinRec := "Finish date and time";
            datFinMar := rstMarcajesFin."Markup date and time";
            intFin := 0;
            intFin := datFinRec - datFinMar;
            if "Event code" <> 0 then begin
                Clear(rstConcept);
                rstConcept.Get("Event code");
            end;
            if (Abs(intFin) > 60000) and (rstConcept."Hours per unit" = 1) then
                "Finish date and timeEmphasize" := 'Ambiguous'
            else
                if rstMarcajesFin."Markup type" = 2 then
                    "Finish date and timeEmphasize" := 'Unfavorable'
                else
                    "Finish date and timeEmphasize" := '';

        end;
    end;

    local procedure ApplicationdateOnFormat()
    begin
        if Records = '' then
            "Application dateEmphasize" := true
        else
            "Application dateEmphasize" := false;
    end;

    local procedure QuantityOnFormat()
    begin
        if Records = '' then
            QuantityEmphasize := true
        else
            QuantityEmphasize := false;
    end;

    local procedure QuantitytodistributeOnFormat()
    begin
        if ("Quantity to distribute" = 0) and (Records <> '') then
            QuantitytodistributeEmphasize := true
        else
            QuantitytodistributeEmphasize := false;

        Clear(rstJornada);
        if rstJornada.Get("Workday code") then;
        if ("Quantity to distribute" > rstJornada."Workday usual limit") and (Records <> '') then
            QuantitytodistributeEmphasize := true
        else
            QuantitytodistributeEmphasize := false;
    end;

    local procedure ImportdateOnFormat()
    begin
        if Records = '' then
            "Import dateEmphasize" := true
        else
            "Import dateEmphasize" := false;
    end;

    local procedure RecordsOnFormat()
    begin
        if ("Finish date and time" = 0DT) and not ("Start date and time" = 0DT) then
            RecordsEmphasize := true
        else
            RecordsEmphasize := false;
    end;

    [Scope('OnPrem')]
    procedure fntQ()
    begin
        if FindSet then
            repeat

                if (Records <> '') then begin

                    decQ := Round(Quantity, 0.5);

                    decQT += decQ;
                    decLiq := 0;

                    if "Event code" <> 0 then begin
                        Clear(rstConcept);
                        rstConcept.Get("Event code");
                    end;

                    Clear(rstWorkday);
                    rstWorkday.Get("Workday code");

                    Clear(rstJor2);
                    rstJor2.SetRange("Workday code", "Workday code");
                    rstJor2.SetRange("Flexible o restricto", rstJor2."Flexible o restricto"::Flexible);
                    rstJor2.SetFilter("Starting day", '<=%1', intDia);
                    rstJor2.SetFilter("Ending day", '>=%1', intDia);
                    rstJor2.SetRange("Additional percentage value", 0);
                    if blnRegistrar then
                        rstJor2.SetRange("Meta4 code", "News code")
                    else
                        rstJor2.SetRange("Meta4 code", "Event code");
                    if rstJor2.FindSet then begin

                        Clear(rstJor);
                        rstJor.SetRange("Workday code", "Workday code");
                        rstJor.SetRange("Flexible o restricto", rstJor."Flexible o restricto"::Flexible);
                        rstJor.SetFilter("Starting day", '<=%1', intDia);
                        rstJor.SetFilter("Ending day", '>=%1', intDia);
                        if blnRegistrar then
                            rstJor.SetRange("Meta4 code", "News code")
                        else
                            rstJor.SetRange("Meta4 code", "Event code");
                        if rstJor.FindFirst then;

                        if rstJor."Additional percentage value" <> 0 then begin

                            if (rstDate."Period Name" = 'domingo') and (rstWorkday."Sundays complete") then
                                decLiq := 4
                            else begin

                                decQD := 0;
                                decLiq := decQ + decQST;
                                if decQST < 0 then
                                    decQST += decQ;
                                if decLiq < 0 then
                                    decLiq := 0;

                            end;

                        end
                        else begin

                            if rstConcept."Hours per unit" <> 1 then begin

                                decQD := Round(rstConcept."Hours per unit", 0.5);
                                decQDT += Round(rstConcept."Hours per unit", 0.5);

                            end
                            else begin

                                decQD := rstJor2."Cantidad horas";
                                decQDT += rstJor2."Cantidad horas";

                            end;

                            decLiq := decQD;
                            decQST += decQ - decQD;

                        end;

                    end
                    else begin

                        Clear(rstJor);
                        rstJor.SetRange("Workday code", "Workday code");
                        rstJor.SetRange("Flexible o restricto", rstJor."Flexible o restricto"::Flexible);
                        rstJor.SetFilter("Starting day", '<=%1', intDia);
                        rstJor.SetFilter("Ending day", '>=%1', intDia);
                        if blnRegistrar then
                            rstJor.SetRange("Meta4 code", "News code")
                        else
                            rstJor.SetRange("Meta4 code", "Event code");
                        if rstJor.FindFirst then begin

                            if rstJor."Additional percentage value" <> 0 then begin

                                if (rstDate."Period Name" = 'domingo') and (rstWorkday."Sundays complete") then
                                    decLiq := 4
                                else begin

                                    decQD := 0;
                                    decLiq := decQ + decQST;
                                    if decQST < 0 then
                                        decQST += decQ;
                                    if decLiq < 0 then
                                        decLiq := 0;

                                end;

                            end
                            else begin

                                if rstConcept."Hours per unit" <> 1 then begin

                                    decQD := Round(rstConcept."Hours per unit", 0.5);
                                    decQDT += Round(rstConcept."Hours per unit", 0.5);

                                end
                                else begin

                                    decQD := rstJor2."Cantidad horas";
                                    decQDT += rstJor2."Cantidad horas";

                                end;

                                decLiq := decQ;
                                decQST += decQ - decQD;

                            end;

                        end
                        else begin

                            decQD := decQ;
                            decQDT += decQ;
                            decLiq := decQ;

                        end;

                    end;

                    //END;

                    decLiqT += decLiq;

                    Quantity := decQ;
                    "Quantity to distribute" := decQD;
                    "Applied quantity" := decLiq;
                    Difference := Quantity - "Quantity to distribute";
                    Modify;

                end;

            until Next = 0;

        if FindSet then
            repeat

                rstMovEmp.TransferFields(Rec);
                rstMovEmp.Insert;

            until Next = 0;

        if FindSet then
            repeat

                if (Records = '') and ("Event code" = 0) then begin

                    Clear(rstMovEmp);
                    rstMovEmp.SetRange("File no.", "File no.");
                    rstMovEmp.CalcSums(rstMovEmp.Quantity, rstMovEmp."Quantity to distribute", rstMovEmp."Applied quantity", rstMovEmp.Difference);
                    Quantity := rstMovEmp.Quantity;
                    "Quantity to distribute" := rstMovEmp."Quantity to distribute";
                    "Applied quantity" := rstMovEmp."Applied quantity";
                    Difference := rstMovEmp.Difference;
                    Clear(rstDate);
                    Modify;

                end;

                if ("Event code" <> 0) and (Records = '') then begin

                    Clear(rstMovEmp);
                    rstMovEmp.SetRange("File no.", "File no.");
                    rstMovEmp.SetRange("Event code", "Event code");
                    rstMovEmp.CalcSums(rstMovEmp.Quantity, rstMovEmp."Quantity to distribute", rstMovEmp."Applied quantity", rstMovEmp.Difference);
                    Quantity := rstMovEmp.Quantity;
                    "Quantity to distribute" := rstMovEmp."Quantity to distribute";
                    "Applied quantity" := rstMovEmp."Applied quantity";
                    Difference := rstMovEmp.Difference;
                    Clear(rstDate);
                    Modify;

                end;

            until Next = 0;
    end;

    local procedure fntConfSincrMeta4(): Text
    var
        l_rstHRS: Record "Human Resources Setup";
        l_strSID: Text;
        l_strUID: Text;
        l_strPWD: Text;
    begin
        Clear(l_rstHRS);
        l_rstHRS.Get();
        l_strSID := l_rstHRS."TNS SID";
        l_strUID := l_rstHRS."Meta4 userid";
        l_strPWD := l_rstHRS."Meta4 password";

        exit('Data Source=' + l_strSID + ';' +
             //'Integrated Security=false'+';'+
             'Password=' + l_strPWD + ';' +
             'User ID=' + l_strUID + ';');
    end;
}

