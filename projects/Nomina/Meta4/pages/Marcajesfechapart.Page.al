page 50032 "Marcajes fecha (part)"
{
    DelayedInsert = false;
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = ListPart;
    ShowFilter = false;
    SourceTable = "Employee entry";
    SourceTableTemporary = true;

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
                    /*
                    CLEAR(l_rstMarcajes);
                    l_rstMarcajes.SETFILTER("Markup date and time",strFiltroFecha);
                    strFiltroFecha := l_rstMarcajes.GETFILTER("Markup date and time");
                    */
                    Clear(l_rstMarcajes);
                    rstRec.SetFilter(rstRec."Employment Date", strFiltroFecha);
                    strFiltroFecha := rstRec.GetFilter(rstRec."Employment Date");

                    /*
                    WHILE STRPOS(strFiltroFecha,'a.m.') <> 0 DO
                    BEGIN
                    
                      strFiltroFecha := DELSTR(strFiltroFecha,STRPOS(strFiltroFecha,'a.m.'),4);
                    
                    END;
                    
                    strFiltroFecha := FORMAT(CREATEDATETIME(DT2DATE(l_rstMarcajes.GETRANGEMIN("Markup date and time")),0T))+'..'+
                                      FORMAT(CREATEDATETIME(DT2DATE(l_rstMarcajes.GETRANGEMAX("Markup date and time")),235900T));
                    */
                    Clear(l_rstMarcajes);

                    fntFiltrarFecha(strFiltroFecha);
                    fntAgrupar(3);

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
                field("Hiring date"; "Hiring date")
                {
                    QuickEntry = false;
                    Style = StrongAccent;
                    StyleExpr = "Hiring dateEmphasize";
                    Visible = false;
                }
                field("News code"; "News code")
                {
                    QuickEntry = false;
                    Style = StrongAccent;
                    StyleExpr = "News codeEmphasize";
                }
                field("Start date and time"; "Start date and time")
                {
                    QuickEntry = false;
                    StyleExpr = "Start date and timeEmphasize";

                    trigger OnAssistEdit()
                    begin
                        if (StrLen(Records) > 1) and ("Start date and time" <> 0DT) then begin

                            Clear(rstMarcajesFin);
                            Evaluate(intFin, CopyStr(Records, StrPos(Records, '|') + 1), 10);
                            if rstMarcajesFin.Get(intFin) then;
                            datFinRec := "Start date and time";
                            datFinMar := rstMarcajesFin."Markup date and time";
                            intFin := 0;
                            intFin := datFinRec - datFinMar;
                            if (Abs(intFin) > 10000) then begin

                                Clear(rstMarkup);
                                rstMarkup.FindLast;

                                Clear(rstMarcajesIni);
                                Evaluate(intIni, CopyStr(Records, 1, StrPos(Records, '|') - 1));
                                rstMarcajesIni.Get(intIni);
                                rstMarkupInsert := rstMarcajesIni;
                                //rstMarkupInsert."Entry no." := rstMarkup."Entry no."+1;
                                rstMarkupInsert."Markup date and time" := "Start date and time";
                                rstMarkupInsert."Fecha filtro" := DT2Date("Start date and time");
                                rstMarkupInsert."Import date" := CurrentDateTime;
                                rstMarkupInsert."Markup type" := 2;
                                rstMarkupInsert.Insert;

                                intEncontrar := "Entry no.";

                            end;

                        end;

                        /*fntAgrupar(intAgrupar);*/

                        fntRefresh;

                    end;
                }
                field("Finish date and time"; "Finish date and time")
                {
                    QuickEntry = false;
                    StyleExpr = "Finish date and timeEmphasize";

                    trigger OnAssistEdit()
                    begin
                        if (StrLen(Records) > 1) and ("Finish date and time" <> 0DT) then begin

                            Clear(rstMarcajesFin);
                            Evaluate(intFin, CopyStr(Records, StrPos(Records, '|') + 1), 10);
                            rstMarcajesFin.Get(intFin);
                            datFinRec := "Finish date and time";
                            datFinMar := rstMarcajesFin."Markup date and time";
                            intFin := 0;
                            intFin := datFinRec - datFinMar;
                            if (Abs(intFin) > 10000) then begin

                                Clear(rstMarkup);
                                rstMarkup.FindLast;

                                Clear(rstMarcajesIni);
                                Evaluate(intIni, CopyStr(Records, 1, StrPos(Records, '|') - 1));
                                rstMarcajesIni.Get(intIni);
                                rstMarkupInsert := rstMarcajesIni;
                                //rstMarkupInsert."Entry no." := rstMarkup."Entry no."+1;
                                rstMarkupInsert."Markup date and time" := "Finish date and time";
                                rstMarkupInsert."Fecha filtro" := DT2Date("Finish date and time");
                                rstMarkupInsert."Import date" := CurrentDateTime;
                                rstMarkupInsert."Markup type" := 2;
                                rstMarkupInsert.Insert;

                                intEncontrar := "Entry no.";

                            end;

                        end;

                        /*fntAgrupar(intAgrupar);*/
                        Rec.Get(intEncontrar);
                        CurrPage.Update(false);

                        fntRefresh;

                    end;
                }
                field("Application date"; "Application date")
                {
                    QuickEntry = false;
                    Style = StrongAccent;
                    StyleExpr = "Application dateEmphasize";
                }
                field("% time"; "% time")
                {
                }
                field(Quantity; Quantity)
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

                    trigger OnValidate()
                    begin
                        fntFiltrarFecha(strFiltroFecha);
                        fntAgrupar(3);
                    end;
                }
                field("Quantity to distribute"; "Quantity to distribute")
                {
                }
                field("Import date"; "Import date")
                {
                    QuickEntry = false;
                    Style = StrongAccent;
                    StyleExpr = "Import dateEmphasize";
                }
                field(Records; Records)
                {
                    QuickEntry = false;
                    Style = Attention;
                    StyleExpr = RecordsEmphasize;

                    trigger OnAssistEdit()
                    begin
                        intEncontrar := "Entry no.";
                        Clear(rstMarcajes);
                        rstMarcajes.SetCurrentKey("Entry no.");
                        if StrPos(Format(Records), '|0') <> 0 then
                            rstMarcajes.SetFilter("Entry no.", CopyStr(Records, 1, StrLen(Format(Records)) - 2));
                        if CopyStr(Format(Records), 1, 2) = '0|' then
                            rstMarcajes.SetFilter("Entry no.", CopyStr(Format(Records), 3, 20));
                        if StrPos(Format(Records), '|0') = 0 then
                            rstMarcajes.SetFilter("Entry no.", Records);

                        if rstMarcajes.FindSet then begin

                            Clear(frmMarcajes);

                            frmMarcajes.SetTableView(rstMarcajes);

                            frmMarcajes.RunModal;

                            fntAgrupar(intAgrupar);
                            Rec.Get(intEncontrar);
                            CurrPage.Update(false);

                        end;
                    end;

                    trigger OnValidate()
                    begin
                        fntFiltrarFecha(strFiltroFecha);
                        fntAgrupar(3);
                    end;
                }
                field("User ID"; "User ID")
                {
                    QuickEntry = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
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
        strActivate: Text;

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
                    cduProcesar.fntProcesar(Rec, false, true, false, false);
                    Rec.SetCurrentKey("Company no.", "File no.", "Start date and time", Records);
                    CurrPage.Update(false);

                end;

        end;
    end;

    [Scope('OnPrem')]
    procedure fntRegistrar()
    var
        rstEE: Record "Employee entry";
    begin
        Clear(rstEE);
        CurrPage.SetSelectionFilter(rstEE);
        //cduProcesar.fntRegistrar(rstEE);
        cduProcesar.fntRegistrar(Rec);
    end;

    local procedure FilenoOnFormat()
    begin
        if Records = '' then begin
            "File no.Emphasize" := true;
            IntentColumn := 1;
        end
        else begin
            "File no.Emphasize" := false;
            IntentColumn := 2;
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
            if rstMarcajesFin.Get(intFin) then
                datFinMar := rstMarcajesFin."Markup date and time"
            else
                datFinMar := "Finish date and time";

            datFinRec := "Finish date and time";
            datFinMar := rstMarcajesFin."Markup date and time";
            intFin := 0;
            intFin := datFinRec - datFinMar;
            Clear(rstConcept);
            if rstConcept.Get("Event code") then;
            if (intFin = 0) or ((Abs(intFin) > 60000) and (rstConcept."Hours per unit" = 1)) then
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
    procedure fntRefresh()
    begin
        intEncontrar := "Entry no.";
        Clear(rstMarcajes);
        if StrPos(Format(Records), '|0') <> 0 then
            rstMarcajes.SetFilter("Entry no.", CopyStr(Records, 1, StrLen(Format(Records)) - 2));
        if CopyStr(Format(Records), 1, 2) = '0|' then
            rstMarcajes.SetFilter("Entry no.", CopyStr(Format(Records), 3, 20));
        if StrPos(Format(Records), '|0') = 0 then
            rstMarcajes.SetFilter("Entry no.", Records);

        if rstMarcajes.FindSet then begin

            Clear(frmMarcajes);
            frmMarcajes.SetTableView(rstMarcajes);

            frmMarcajes.RunModal;

            fntAgrupar(intAgrupar);
            Rec.Get(intEncontrar);
            CurrPage.Update(false);

        end;
    end;
}

