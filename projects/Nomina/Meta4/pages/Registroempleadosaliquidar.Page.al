page 50082 "Registro empleados a liquidar"
{
    DelayedInsert = false;
    DeleteAllowed = true;
    Editable = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = Worksheet;
    SaveValues = true;
    SourceTable = "Employee entry";
    SourceTableTemporary = true;
    SourceTableView = SORTING("Entry no.");

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

                    fntFiltrarLegajo(codFiltroLegajo);
                    fntFiltrarFecha(strFiltroFecha);
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
                field("Application date"; "Application date")
                {
                    QuickEntry = false;
                    Style = StrongAccent;
                    StyleExpr = "Application dateEmphasize";
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
                }
                field("Finish date and time"; "Finish date and time")
                {
                    QuickEntry = false;
                    StyleExpr = "Finish date and timeEmphasize";
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

                        end;
                    end;
                }
                field("Start record"; "Start record")
                {
                }
                field("Finish record"; "Finish record")
                {
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
                action(Recalcular)
                {
                    Caption = 'Recalcular';
                    Image = RefreshLines;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
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

        /*
        IF "Application date" = 0D THENBEGIN
        
          "Event code" := 0;
          "News code" := 0;
          "% time" := '';
          t_rstEE.SETRANGE("File no.","File no.");
        
          t_rstEE.FINDSET;
          t_rstEE.CALCSUMS(Quantity,"Quantity to distribute");
        
        END;
        
        IF "News code" = 0 THEN
        BEGIN
        
          IF "% time" = '0' THEN
            "News code" := 1691;
        
          IF "% time" = '50' THEN
            "News code" := 1801;
        
          IF "% time" = '100' THEN
            "News code" := 1811;
        
        END;
        
        IF "Event code" = 0 THEN
        BEGIN
        
          IF "% time" = '0' THEN
            "Event code" := 1691;
        
          IF "% time" = '50' THEN
            "Event code" := 1801;
        
          IF "% time" = '100' THEN
            "Event code" := 1811;
        
        END;
        */

    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        l_rstEE: Record "Employee entry";
    begin
        Clear(l_rstEE);
        TestField("File no.");
        TestField("Event code");
        TestField("Start date and time");
        TestField("Finish date and time");
        TestField(Quantity);
        TestField(Records);
        TestField("Application date");
        TestField("Workday code");
    end;

    trigger OnOpenPage()
    begin
        Clear(Rec);
        strActivate := 'ID1000000012;MD' + Format(Time, 0, 1);
    end;

    var
        FiltroProd: Text[1024];
        infoEmpresa: Record "Company Information";
        strNombre: Text[1024];
        rstRec: Record Employee;
        blnPrecalcular: Boolean;
        intLineas: Integer;
        intCont: Integer;
        rstJor: Record "Workday detail";
        rstMovEmp: Record "Employee entry";
        intContados: Integer;
        intCantARepartir: Decimal;
        intCantRepartida: Decimal;
        rstJor2: Record "Workday detail";
        decRedondeoSegundos: Decimal;
        datFechaLiq: Text[50];
        codLegajo: Code[10];
        cduProcesar: Codeunit Employees;
        blnIncidencias: Boolean;
        rstJornada: Record Workday;
        intIni: Integer;
        intFin: Integer;
        datIniRec: DateTime;
        datIniMar: DateTime;
        datFinRec: DateTime;
        datFinMar: DateTime;
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
        rstMarcajes: Record "Markup entry";

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
        cduProcesar.fntProcesar(Rec, false, false, blnTomarAplicados, true);
    end;

    [Scope('OnPrem')]
    procedure fntAgrupar(l_intAgrupar: Integer)
    var
        t_rstEE: Record "Employee entry" temporary;
        intContados: Integer;
    begin
        Clear(cduProcesar);

        if strFiltroFecha <> '' then begin

            Clear(rstMovEmp);
            rstMovEmp.SetFilter("Application date", strFiltroFecha);
            if codFiltroLegajo <> '' then
                rstMovEmp.SetFilter("File no.", codFiltroLegajo);
            if rstMovEmp.FindSet then
                repeat

                    t_rstEE.TransferFields(rstMovEmp);
                    t_rstEE.Insert;

                until rstMovEmp.Next = 0;

            cduProcesar.fntFiltrarFecha(strFiltroFecha);
            cduProcesar.fntFiltrarLegajo(codFiltroLegajo);
            cduProcesar.fntSugerirMovLiq(t_rstEE);

        end;

        DeleteAll();
        t_rstEE.SetCurrentKey(t_rstEE."File no.", t_rstEE."Application date", t_rstEE."Start date and time");
        if t_rstEE.FindSet then
            repeat

                intContados += 1;
                TransferFields(t_rstEE);
                "Entry no." := intContados;
                Insert;

            until t_rstEE.Next = 0;

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
        cduProcesar.fntRegistrarLiq(Rec);
    end;

    local procedure FilenoOnFormat()
    begin
        if (Records = '') then begin

            if ("Application date" <> 0D) then begin

                if ("Event code" <> 0) and ("Start date and time" = 0DT) then begin

                    "File no.Emphasize" := true;
                    IntentColumn := 3;

                end
                else begin

                    "File no.Emphasize" := true;
                    IntentColumn := 2;

                end;

            end
            else begin

                "File no.Emphasize" := true;
                IntentColumn := 1;

            end;
        end
        else begin

            "File no.Emphasize" := false;
            IntentColumn := 3;

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
    end;

    local procedure FinishdateandtimeOnFormat()
    begin
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

        fntAgrupar(intAgrupar);
        CurrPage.Update(false);
    end;
}

