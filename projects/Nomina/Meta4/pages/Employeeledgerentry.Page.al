page 50077 "Employee ledger entry"
{
    Caption = 'Diario movimiento empleados';
    DelayedInsert = false;
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = Worksheet;
    SaveValues = true;
    ShowFilter = false;
    SourceTable = "Employee entry";
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            field(blnTomarAplicados; blnTomarAplicados)
            {
                Caption = 'Recalcular aplicados';
            }
            field(codFiltroLegajo; codFiltroLegajo)
            {
                Caption = 'Filtro legajo';

                trigger OnValidate()
                begin
                    fntFiltrarLegajo(codFiltroLegajo);
                end;
            }
            field(strFiltroFecha; strFiltroFecha)
            {
                Caption = 'Filtro fecha';
                QuickEntry = true;
                RowSpan = 2;

                trigger OnValidate()
                var
                    l_rstMarcajes: Record "Markup entry";
                begin
                    Clear(l_rstMarcajes);
                    rstRec.SetFilter(rstRec."Employment Date", strFiltroFecha);
                    strFiltroFecha := rstRec.GetFilter(rstRec."Employment Date");

                    Clear(l_rstMarcajes);

                    fntFiltrarLegajo(codFiltroLegajo);
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
                    BlankZero = true;
                    QuickEntry = false;
                    Style = StrongAccent;
                    StyleExpr = "News codeEmphasize";

                    trigger OnValidate()
                    var
                        l_rstMarcajes: Record "Markup entry";
                        l_rstConcept: Record "Meta4 concept";
                    begin
                        Clear(l_rstMarcajes);
                        if (Records <> '') then begin

                            //  l_rstMarcajes.SETFILTER("Entry no.",Records);

                            Clear(l_rstConcept);
                            if l_rstConcept.Get("News code") then begin

                                //  l_rstMarcajes.MODIFYALL("Event code",l_rstConcept."Meta4 concept");
                                "Event code" := l_rstConcept."Meta4 concept";

                            end
                            else begin

                                // l_rstMarcajes.SETFILTER("Entry no.",'%1|%2',"Start record","Finish record");
                                //l_rstMarcajes.MODIFYALL("Event code",0);
                                "News code" := l_rstConcept."Meta4 concept";

                            end;

                        end;
                    end;
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
                                rstMarkupInsert."Entry no." := rstMarkup."Entry no." + 1;
                                rstMarkupInsert."Markup date and time" := "Start date and time";
                                rstMarkupInsert."Fecha filtro" := DT2Date("Start date and time");
                                rstMarkupInsert."Import date" := CurrentDateTime;
                                rstMarkupInsert."Markup type" := 2;
                                rstMarkupInsert."Workday code" := "Workday code";
                                //rstMarkupInsert."% time" := "% time";
                                rstMarkupInsert."Workday level" := "Workday level";
                                rstMarkupInsert.Insert;

                                intEncontrar := "Entry no.";

                            end;

                        end;

                        /*fntAgrupar(intAgrupar);*/

                        //fntRefresh;

                        StartdateandtimeOnFormat;
                        FinishdateandtimeOnFormat;

                        CurrPage.Update;

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
                            Clear(rstMarkup);
                            rstMarkup.FindLast;

                            Clear(rstMarcajesIni);
                            Evaluate(intIni, CopyStr(Records, 1, StrPos(Records, '|') - 1));
                            rstMarcajesIni.Get(intIni);
                            rstMarkupInsert := rstMarcajesIni;
                            rstMarkupInsert."Entry no." := rstMarkup."Entry no." + 1;
                            rstMarkupInsert."Markup date and time" := "Finish date and time";
                            rstMarkupInsert."Fecha filtro" := DT2Date("Finish date and time");
                            rstMarkupInsert."Import date" := CurrentDateTime;
                            rstMarkupInsert."Markup type" := 2;
                            rstMarkupInsert."Workday code" := "Workday code";
                            //rstMarkupInsert."% time" := "% time";
                            rstMarkupInsert."Workday level" := "Workday level";
                            rstMarkupInsert.Insert;

                            intEncontrar := "Entry no.";

                        end;



                        StartdateandtimeOnFormat;
                        FinishdateandtimeOnFormat;

                        CurrPage.Update(false);
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
                    //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
                    //BlankZero = true;
                    QuickEntry = false;
                }
                field(Quantity; Quantity)
                {
                    BlankNumbers = BlankZero;
                    BlankZero = true;
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
                    BlankZero = true;
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
        area(navigation)
        {
            group("A&cciones")
            {
                Caption = 'A&cciones';
                action("Generar diario")
                {
                    Caption = 'Generar diario';
                    Image = CalculatePlan;
                    Promoted = true;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #50075. Unsupported part was commented. Please check it.
                        /*CurrPage.SubFormProcesarMarcajes.FORM.*/
                        fntAgrupar(1);

                    end;
                }
                action("Generar diario x evento")
                {
                    Caption = 'Generar diario x evento';
                    Image = CalculatePlan;
                    Promoted = true;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #50075. Unsupported part was commented. Please check it.
                        /*CurrPage.SubFormProcesarMarcajes.FORM.*/
                        fntAgrupar(2);

                    end;
                }
                action("Generar diario x empleado")
                {
                    Caption = 'Generar diario x empleado';
                    Image = CalculatePlan;
                    Promoted = true;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #50075. Unsupported part was commented. Please check it.
                        /*CurrPage.SubFormProcesarMarcajes.FORM.*/
                        fntAgrupar(3);

                    end;
                }
                action(Recalcular)
                {
                    Caption = 'Recalcular';
                    Image = RefreshLines;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Clear(rstRec);
                        rstRec.SetFilter(rstRec."Employment Date", strFiltroFecha);
                        strFiltroFecha := rstRec.GetFilter(rstRec."Employment Date");
                        Clear(rstRec);

                        fntFiltrarFecha(strFiltroFecha);
                        fntAgrupar(3);
                    end;
                }
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
                        CurrPage.Update(false);
                    end;
                }
            }
        }
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

        if "Application date" = 0D then begin

            "Event code" := 0;
            "News code" := 0;
            "% time" := '';
            t_rstEE.SetRange("File no.", "File no.");

            t_rstEE.FindSet;
            t_rstEE.CalcSums(Quantity, "Quantity to distribute");

        end;

        if "News code" = 0 then begin

            if "% time" = '0' then
                "News code" := 1691;

            if "% time" = '50' then
                "News code" := 1801;

            if "% time" = '100' then
                "News code" := 1811;

        end;

        if "Event code" = 0 then begin

            if "% time" = '0' then
                "Event code" := 1691;

            if "% time" = '50' then
                "Event code" := 1801;

            if "% time" = '100' then
                "Event code" := 1811;

        end;
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
        blnTomarAplicados: Boolean;
        codFiltroLegajo: Text;
        t_rstEE: Record "Employee entry" temporary;

    [Scope('OnPrem')]
    procedure fntFiltrarFecha(l_datFechaLiq: Text[50])
    begin
        datFechaLiq := l_datFechaLiq;
    end;

    [Scope('OnPrem')]
    procedure fntFiltrarLegajo(l_codLegajo: Code[10])
    begin
        codLegajo := l_codLegajo;
        if codLegajo <> '' then
            SetFilter("File no.", codLegajo);
    end;

    [Scope('OnPrem')]
    procedure fntVerIncidencias(t_blnIncidencias: Boolean)
    begin
        blnIncidencias := t_blnIncidencias;
    end;

    [Scope('OnPrem')]
    procedure fntEjecutar()
    begin
        cduProcesar.fntProcesar(Rec, false, false, blnTomarAplicados, false);
    end;

    [Scope('OnPrem')]
    procedure fntAgrupar(l_intAgrupar: Integer)
    begin
        case l_intAgrupar of
            1:
                begin

                    intAgrupar := l_intAgrupar;
                    cduProcesar.fntFiltrarFecha(datFechaLiq);
                    cduProcesar.fntFiltrarLegajo(codLegajo);
                    cduProcesar.fntProcesar(Rec, false, false, blnTomarAplicados, false);
                    CurrPage.Update(false);

                end;
            2:
                begin

                    intAgrupar := l_intAgrupar;
                    cduProcesar.fntFiltrarFecha(datFechaLiq);
                    cduProcesar.fntFiltrarLegajo(codLegajo);
                    cduProcesar.fntProcesar(Rec, true, false, blnTomarAplicados, false);
                    Rec.SetCurrentKey("Company no.", "File no.", "Event code", "Start date and time", Records);
                    CurrPage.Update(false);

                end;

            3:
                begin

                    intAgrupar := l_intAgrupar;
                    cduProcesar.fntFiltrarFecha(datFechaLiq);
                    cduProcesar.fntFiltrarLegajo(codLegajo);
                    cduProcesar.fntProcesar(Rec, false, true, blnTomarAplicados, false);
                    Rec.SetCurrentKey("Company no.", "File no.", "Application date", Records);
                    CurrPage.Update(false);

                end;

        end;


        Clear(t_rstEE);
        t_rstEE.DeleteAll;
        if FindSet then
            repeat

                t_rstEE.TransferFields(Rec);
                t_rstEE.Insert;

            until Next = 0;

        if FindFirst then;
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
        if "Application date" = 0D then begin

            "File no.Emphasize" := true;
            IntentColumn := 1;

        end
        else begin

            if "Quantity to distribute" <> 0 then begin

                IntentColumn := 3;

            end
            else begin

                "File no.Emphasize" := true;
                IntentColumn := 2;

            end;

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
        if Quantity <> "Quantity to distribute" then begin

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

        end
        else
            "Start date and timeEmphasize" := '';
    end;

    local procedure FinishdateandtimeOnFormat()
    begin
        if Quantity <> "Quantity to distribute" then begin

            Clear(rstMarcajesIni);
            if Evaluate(intIni, CopyStr(Records, StrPos(Records, '|') + 1), 10) then begin

                if (rstMarcajesIni.Get(intIni)) and ("Finish date and time" <> 0DT) then begin

                    datIniRec := "Finish date and time";
                    datIniMar := rstMarcajesIni."Markup date and time";
                    intIni := 0;
                    intIni := datIniRec - datIniMar;
                    "Finish date and timeEmphasize" := '';

                    if (Abs(intIni) > 60000) then
                        "Finish date and timeEmphasize" := 'Unfavorable'
                    else
                        if rstMarcajesIni."Markup type" = 2 then
                            "Finish date and timeEmphasize" := 'Ambiguous'
                        else
                            "Finish date and timeEmphasize" := '';

                end;

            end;

        end
        else
            "Finish date and timeEmphasize" := '';
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
        Commit;
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

