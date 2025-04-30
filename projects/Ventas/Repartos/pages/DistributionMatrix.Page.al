page 50602 "Distribution Matrix"
{
    Caption = 'Budget Matrix';
    DataCaptionExpression = BudgetName;
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = ListPart;
    SourceTable = "Dimension Code Buffer";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                IndentationColumn = NameIndent;
                IndentationControls = Name;
                ShowCaption = false;
                field("Code"; Code)
                {
                    Editable = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookUpCode(LineDimOption, LineDimCode, Code);
                    end;
                }
                field(Name; Name)
                {
                    Editable = false;
                }
                field(TotalBudgetedAmount; Amount)
                {
                    BlankZero = true;
                    Caption = 'Budgeted Amount';
                    Editable = false;

                    trigger OnDrillDown()
                    begin
                        SetCommonFilters(GLAccBudgetBuf);
                        SetDimFilters(GLAccBudgetBuf, 0);
                        BudgetDrillDown;
                    end;
                }
                field(Field1; MATRIX_CellData[1])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[1];

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(1);
                    end;

                    trigger OnValidate()
                    begin
                        UpdateAmount(1);
                    end;
                }
                field(Field2; MATRIX_CellData[2])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[2];

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(2);
                    end;

                    trigger OnValidate()
                    begin
                        UpdateAmount(2);
                    end;
                }
                field(Field3; MATRIX_CellData[3])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[3];

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(3);
                    end;

                    trigger OnValidate()
                    begin
                        UpdateAmount(3);
                    end;
                }
                field(Field4; MATRIX_CellData[4])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[4];

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(4);
                    end;

                    trigger OnValidate()
                    begin
                        UpdateAmount(4);
                    end;
                }
                field(Field5; MATRIX_CellData[5])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[5];

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(5);
                    end;

                    trigger OnValidate()
                    begin
                        UpdateAmount(5);
                    end;
                }
                field(Field6; MATRIX_CellData[6])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[6];

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(6);
                    end;

                    trigger OnValidate()
                    begin
                        UpdateAmount(6);
                    end;
                }
                field(Field7; MATRIX_CellData[7])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[7];

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(7);
                    end;

                    trigger OnValidate()
                    begin
                        UpdateAmount(7);
                    end;
                }
                field(Field8; MATRIX_CellData[8])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[8];

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(8);
                    end;

                    trigger OnValidate()
                    begin
                        UpdateAmount(8);
                    end;
                }
                field(Field9; MATRIX_CellData[9])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[9];

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(9);
                    end;

                    trigger OnValidate()
                    begin
                        UpdateAmount(9);
                    end;
                }
                field(Field10; MATRIX_CellData[10])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[10];

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(10);
                    end;

                    trigger OnValidate()
                    begin
                        UpdateAmount(10);
                    end;
                }
                field(Field11; MATRIX_CellData[11])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[11];

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(11);
                    end;

                    trigger OnValidate()
                    begin
                        UpdateAmount(11);
                    end;
                }
                field(Field12; MATRIX_CellData[12])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[12];

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(12);
                    end;

                    trigger OnValidate()
                    begin
                        UpdateAmount(12);
                    end;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Saldo")
            {
                Caption = '&Balance';
                action("Saldo cuenta/&Presupuesto")
                {
                    Caption = 'G/L Account Balance/Bud&get';

                    trigger OnAction()
                    begin
                        GLAccountBalanceBudget;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        MATRIX_CurrentColumnOrdinal: Integer;
    begin
        NameIndent := 0;
        for MATRIX_CurrentColumnOrdinal := 1 to MATRIX_CurrentNoOfMatrixColumn do
            MATRIX_OnAfterGetRecord(MATRIX_CurrentColumnOrdinal);
        Amount := ToRoundedValue(CalcAmount(false));
        NameOnFormat;
    end;

    trigger OnFindRecord(Which: Text): Boolean
    begin
        exit(FindRec(LineDimOption, Rec, Which));
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        exit(NextRec(LineDimOption, Rec, Steps));
    end;

    trigger OnOpenPage()
    var
        GLAcc: Record "G/L Account";
    begin
        if GLAccBudgetBuf.GetFilter("Global Dimension 1 Filter") <> '' then
            GlobalDim1Filter := GLAccBudgetBuf.GetFilter("Global Dimension 1 Filter");
        if GLAccBudgetBuf.GetFilter("Global Dimension 2 Filter") <> '' then
            GlobalDim2Filter := GLAccBudgetBuf.GetFilter("Global Dimension 2 Filter");

        GLSetup.Get;
    end;

    var
        Text001: Label 'Period';
        Text002: Label 'You may only edit column 1 to %1.';
        GLSetup: Record "General Ledger Setup";
        GLAccBudgetBuf: Record "G/L Acc. Budget Buffer";
        GLBudgetName: Record "G/L Budget Name";
        PrevGLBudgetName: Record "G/L Budget Name";
        MatrixRecords: array[12] of Record "Dimension Code Buffer";
        MATRIX_MatrixRecord: Record "Dimension Code Buffer";
        BudgetName: Code[10];
        LineDimOption: Option "G/L Account",Period,"Business Unit","Global Dimension 1","Global Dimension 2","Budget Dimension 1","Budget Dimension 2","Budget Dimension 3","Budget Dimension 4",,,,,"Historic G/L Account";
        ColumnDimOption: Option "G/L Account",Period,"Business Unit","Global Dimension 1","Global Dimension 2","Budget Dimension 1","Budget Dimension 2","Budget Dimension 3","Budget Dimension 4",,,,,"Historic G/L Account";
        LineDimCode: Text[30];
        RoundingFactor: Option "None","1","1000","1000000";
        ShowColumnName: Boolean;
        DateFilter: Text[30];
        InternalDateFilter: Text[30];
        BusUnitFilter: Code[250];
        GLAccFilter: Code[250];
        HistoricGLAccFilter: Code[250];
        GlobalDim1Filter: Code[250];
        GlobalDim2Filter: Code[250];
        BudgetDim1Filter: Code[250];
        BudgetDim2Filter: Code[250];
        BudgetDim3Filter: Code[250];
        BudgetDim4Filter: Code[250];
        MatrixHeader: Text[50];
        PeriodInitialized: Boolean;
        MATRIX_CurrentNoOfMatrixColumn: Integer;
        MATRIX_CellData: array[12] of Decimal;
        MATRIX_CaptionSet: array[12] of Text[80];
        PeriodType: Enum "Analysis Period Type";

        NameEmphasize: Boolean;

        NameIndent: Integer;

    local procedure DimCodeToOption(DimCode: Text[30]): Integer
    var
        BusUnit: Record "Business Unit";
        GLAcc: Record "G/L Account";
        "---ARBUMASA---": Integer;
        rstDistrib: Record "Productos por lote";
    begin
        case DimCode of
            //++Migración Arbumasa a 2009
            rstDistrib.TableCaption:
                exit(50541);
        //--Migración Arbumasa a 2009
        end;
    end;

    local procedure FindRec(DimOption: Option "G/L Account",Period,"Business Unit","Global Dimension 1","Global Dimension 2","Budget Dimension 1","Budget Dimension 2","Budget Dimension 3","Budget Dimension 4",,,,,"Historic G/L Account",,,,"Item per lot"; var DimCodeBuf: Record "Dimension Code Buffer"; Which: Text[250]): Boolean
    var
        GLAcc: Record "G/L Account";
        BusUnit: Record "Business Unit";
        Period: Record Date;
        DimVal: Record "Dimension Value";
        PeriodFormMgt: Codeunit PeriodPageManagement;
        Found: Boolean;
        "----ARBUMASA---": Integer;
        rstIPL: Record "Productos por lote";
    begin
        case DimOption of
            //++Migración Arbumasa a 2009
            DimOption::"Item per lot":
                begin
                    rstIPL."No. documento" := DimCodeBuf.Code;
                    if GLAccFilter <> '' then
                        rstIPL.SetFilter("No. documento", GLAccFilter);
                    Found := rstIPL.Find(Which);
                    if Found then
                        CopyDistribToBuf(rstIPL, DimCodeBuf);
                end;
        //--Migración Arbumasa a 2009
        end;
        exit(Found);
    end;

    local procedure NextRec(DimOption: Option "G/L Account",Period,"Business Unit","Global Dimension 1","Global Dimension 2","Budget Dimension 1","Budget Dimension 2","Budget Dimension 3","Budget Dimension 4",,,,,"Historic G/L Account",,,,"Item per lot"; var DimCodeBuf: Record "Dimension Code Buffer"; Steps: Integer): Integer
    var
        GLAcc: Record "G/L Account";
        BusUnit: Record "Business Unit";
        Period: Record Date;
        DimVal: Record "Dimension Value";
        PeriodFormMgt: Codeunit PeriodPageManagement;
        ResultSteps: Integer;
        "----ARBUMASA---": Integer;
        rstIPL: Record "Productos por lote";
    begin
        case DimOption of
            DimOption::"Item per lot":
                begin
                    rstIPL."No. documento" := DimCodeBuf.Code;
                    if GLAccFilter <> '' then
                        rstIPL.SetFilter("No. documento", GLAccFilter);
                    ResultSteps := rstIPL.Next(Steps);
                    if ResultSteps <> 0 then
                        CopyDistribToBuf(rstIPL, DimCodeBuf);
                end;
        end;
        exit(ResultSteps);
    end;

    local procedure FindPeriod(SearchText: Code[10])
    var
        GLAcc: Record "G/L Account";
        Calendar: Record Date;
        PeriodFormMgt: Codeunit PeriodPageManagement;
        PeriodType: Enum "Analysis Period Type";
    begin
        if DateFilter <> '' then begin
            Calendar.SetFilter("Period Start", DateFilter);
            if not PeriodFormMgt.FindDate('+', Calendar, PeriodType) then
                PeriodFormMgt.FindDate('+', Calendar, PeriodType::Day);
            Calendar.SetRange("Period Start");
        end;
        PeriodFormMgt.FindDate(SearchText, Calendar, PeriodType);
        GLAcc.SetRange("Date Filter", Calendar."Period Start", Calendar."Period End");
        if GLAcc.GetRangeMin("Date Filter") = GLAcc.GetRangeMax("Date Filter") then
            GLAcc.SetRange("Date Filter", GLAcc.GetRangeMin("Date Filter"));
        InternalDateFilter := GLAcc.GetFilter("Date Filter");
        if (LineDimOption <> LineDimOption::Period) and (ColumnDimOption <> ColumnDimOption::Period) then
            DateFilter := InternalDateFilter;
    end;

    local procedure LookUpCode(DimOption: Option "G/L Account",Period,"Business Unit","Global Dimension 1","Global Dimension 2","Budget Dimension 1","Budget Dimension 2","Budget Dimension 3","Budget Dimension 4",,,,,"Historic G/L Account",,,"Item per lot"; DimCode: Text[30]; "Code": Text[30])
    var
        GLAcc: Record "G/L Account";
        BusUnit: Record "Business Unit";
        DimVal: Record "Dimension Value";
        "----ARBUMASA---": Integer;
        rstIPL: Record "Productos por lote";
    begin
        case DimOption of
            DimOption::"Item per lot":
                begin
                    rstIPL.Get(Code);
                    PAGE.RunModal(50601, rstIPL);
                end;
        end;
    end;

    local procedure SetCommonFilters(var TheGLAccBudgetBuf: Record "G/L Acc. Budget Buffer")
    begin
        with TheGLAccBudgetBuf do begin
            Reset;
        end;
    end;

    local procedure SetDimFilters(var TheGLAccBudgetBuf: Record "G/L Acc. Budget Buffer"; LineOrColumn: Option Line,Column)
    var
        DimOption: Option "G/L Account",Period,"Business Unit","Global Dimension 1","Global Dimension 2","Budget Dimension 1","Budget Dimension 2","Budget Dimension 3","Budget Dimension 4",,,,,"Historic G/L Account";
        DimCodeBuf: Record "Dimension Code Buffer";
    begin
        if LineOrColumn = LineOrColumn::Line then begin
            DimCodeBuf := Rec;
            DimOption := LineDimOption;
        end else begin
            DimCodeBuf := MATRIX_MatrixRecord;
            DimOption := ColumnDimOption;
        end;

        with TheGLAccBudgetBuf do
            case DimOption of
            end;
    end;

    local procedure BudgetDrillDown()
    var
        GLBudgetEntry: Record "G/L Budget Entry";
    begin
    end;

    local procedure CalcAmount(SetColumnFilter: Boolean): Decimal
    begin
    end;

    local procedure ToRoundedValue(OrgAmount: Decimal): Decimal
    var
        NewAmount: Decimal;
    begin
        NewAmount := OrgAmount;
        case RoundingFactor of
            RoundingFactor::"1":
                NewAmount := Round(OrgAmount, 1);
            RoundingFactor::"1000":
                NewAmount := Round(OrgAmount / 1000);
            RoundingFactor::"1000000":
                NewAmount := Round(OrgAmount / 1000000);
        end;
        exit(NewAmount);
    end;

    local procedure FromRoundedValue(OrgAmount: Decimal): Decimal
    var
        NewAmount: Decimal;
    begin
        NewAmount := OrgAmount;
        case RoundingFactor of
            RoundingFactor::"1000":
                NewAmount := OrgAmount * 1000;
            RoundingFactor::"1000000":
                NewAmount := OrgAmount * 1000000;
        end;
        exit(NewAmount);
    end;

    [Scope('OnPrem')]
    procedure Load(var MatrixColumns1: array[32] of Text[80]; var MatrixRecords1: array[12] of Record "Dimension Code Buffer"; CurrentNoOfMatrixColumns: Integer; _LineDimCode: Text[30]; _LineDimOption: Integer; _ColumnDimOption: Integer; _GlobalDim1Filter: Code[250]; _GlobalDim2Filter: Code[250]; _BudgetDim1Filter: Code[250]; _BudgetDim2Filter: Code[250]; _BudgetDim3Filter: Code[250]; _BudgetDim4Filter: Code[250]; var _GLBudgetName: Record "G/L Budget Name"; _DateFilter: Text[30]; _GLAccFilter: Code[250]; _HistoricGLAccFilter: Code[250]; _RoundingFactor: Integer; _PeriodType: Enum "Analysis Period Type")
    var
        i: Integer;
    begin
        for i := 1 to 12 do begin
            if MatrixColumns1[i] = '' then
                MATRIX_CaptionSet[i] := ' '
            else
                MATRIX_CaptionSet[i] := MatrixColumns1[i];
            MatrixRecords[i] := MatrixRecords1[i];
        end;
        if MATRIX_CaptionSet[1] = '' then; // To make this form pass preCAL test
        if CurrentNoOfMatrixColumns > ArrayLen(MATRIX_CellData) then
            MATRIX_CurrentNoOfMatrixColumn := ArrayLen(MATRIX_CellData)
        else
            MATRIX_CurrentNoOfMatrixColumn := CurrentNoOfMatrixColumns;
        LineDimCode := _LineDimCode;
        LineDimOption := _LineDimOption;
        ColumnDimOption := _ColumnDimOption;
        GlobalDim1Filter := _GlobalDim1Filter;
        GlobalDim2Filter := _GlobalDim2Filter;
        BudgetDim1Filter := _BudgetDim1Filter;
        BudgetDim2Filter := _BudgetDim2Filter;
        BudgetDim3Filter := _BudgetDim3Filter;
        BudgetDim4Filter := _BudgetDim4Filter;
        GLBudgetName := _GLBudgetName;
        DateFilter := _DateFilter;
        GLAccFilter := _GLAccFilter;
        HistoricGLAccFilter := _HistoricGLAccFilter;
        RoundingFactor := _RoundingFactor;
        PeriodType := _PeriodType;
    end;

    local procedure MATRIX_OnDrillDown(MATRIX_ColumnOrdinal: Integer)
    begin
        MATRIX_MatrixRecord := MatrixRecords[MATRIX_ColumnOrdinal];
        SetCommonFilters(GLAccBudgetBuf);
        SetDimFilters(GLAccBudgetBuf, 0);
        SetDimFilters(GLAccBudgetBuf, 1);
        BudgetDrillDown;
    end;

    local procedure MATRIX_OnAfterGetRecord(MATRIX_ColumnOrdinal: Integer)
    begin
        if ShowColumnName then
            MatrixHeader := MatrixRecords[MATRIX_ColumnOrdinal].Name
        else
            MatrixHeader := MatrixRecords[MATRIX_ColumnOrdinal].Code;
        MATRIX_MatrixRecord := MatrixRecords[MATRIX_ColumnOrdinal];
        MATRIX_CellData[MATRIX_ColumnOrdinal] := ToRoundedValue(CalcAmount(true));
    end;

    [Scope('OnPrem')]
    procedure UpdateAmount(MATRIX_ColumnOrdinal: Integer)
    var
        GLBudgEntry2: Record "G/L Budget Entry";
        ChangeLogMgt: Codeunit "Change Log Management";
        RecRef: RecordRef;
        LastEntryNo2: Integer;
        LogInsertion: Boolean;
        NewAmount: Decimal;
    begin
        if MATRIX_ColumnOrdinal > MATRIX_CurrentNoOfMatrixColumn then
            Error(Text002, MATRIX_CurrentNoOfMatrixColumn);
        MATRIX_MatrixRecord := MatrixRecords[MATRIX_ColumnOrdinal];
        NewAmount := FromRoundedValue(MATRIX_CellData[MATRIX_ColumnOrdinal]);


        Amount := ToRoundedValue(CalcAmount(false));

        CurrPage.Update;
    end;

    [Scope('OnPrem')]
    procedure GLAccountBalanceBudget()
    var
        GLAcc: Record "G/L Account";
    begin
        if DimCodeToOption(LineDimCode) = 0 then
            GLAcc.Get(Code)
        else begin
            if GLAccFilter <> '' then
                GLAcc.SetFilter("No.", GLAccFilter);
            GLAcc.Find('-');
            GLAcc.Reset;
        end;
        with GLAcc do begin
            SetRange("Budget Filter", BudgetName);
            if BusUnitFilter <> '' then
                SetFilter("Business Unit Filter", BusUnitFilter);
            if GLAccFilter <> '' then
                SetFilter("No.", GLAccFilter);
            if GlobalDim1Filter <> '' then
                SetFilter("Global Dimension 1 Filter", GlobalDim1Filter);
            if GlobalDim2Filter <> '' then
                SetFilter("Global Dimension 2 Filter", GlobalDim2Filter);
        end;
        PAGE.Run(PAGE::"G/L Account Balance/Budget", GLAcc);
    end;

    local procedure NameOnFormat()
    begin
        NameEmphasize := "Show in Bold";
        NameIndent := Indentation;
    end;

    [Scope('OnPrem')]
    procedure "---ARBUMASA---"()
    begin
    end;

    local procedure CopyDistribToBuf(var TheDistrib: Record "Productos por lote"; var TheDimCodeBuf: Record "Dimension Code Buffer")
    begin
        with TheDimCodeBuf do begin
            Init;
            Code := TheDistrib."No. documento";
            /*  Name := TheGLAcc.Name;
              Totaling := TheGLAcc.Totaling;
              Indentation := TheGLAcc.Indentation;
              "Show in Bold" := TheGLAcc."Account Type" <> TheGLAcc."Account Type"::Posting;*/
        end;

    end;

}
/*
enum 50000 PeriodType
{
    Extensible = true;

    value(0; Day)
    {
        CaptionML = ESP = 'Día', ENU = 'Day';
    }
    value(1; Week)
    {
        CaptionML = ESP = 'Semana', ENU = 'Week';
    }
}
    value(2; Month){
        CaptionML = ESP='Mes',ENU='Month';}
    }
    value(3; Quarter){
        CaptionML = ESP='Trimestre',ENU='Quarter';}
    }
    value(4; Year){
        CaptionML = ESP='Año',ENU='Year';}
    }
    value(5; Accounting Period){
        CaptionML = ESP='Período contable',ENU='Accounting Period';}
    }
*/


