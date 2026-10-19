tableextension 50786 tableextension50786 extends "FA Posting Group"
{
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("Acquisition Cost Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Accum. Depreciation Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Write-Down Account")
        {
            TableRelation = "G/L Account"."No.";
            Caption = 'Write-Down Account';
        }
        modify("Appreciation Account")
        {
            TableRelation = "G/L Account"."No.";
            Caption = 'Appreciation Account';
        }
        modify("Custom 1 Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Custom 2 Account")
        {
            TableRelation = "G/L Account"."No.";
            Caption = 'Custom 2 Account';
        }
        modify("Acq. Cost Acc. on Disposal")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Accum. Depr. Acc. on Disposal")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Write-Down Acc. on Disposal")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Appreciation Acc. on Disposal")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Custom 1 Account on Disposal")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Custom 2 Account on Disposal")
        {
            TableRelation = "G/L Account"."No.";
            Caption = 'Custom 2 Account on Disposal';
        }
        modify("Gains Acc. on Disposal")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Losses Acc. on Disposal")
        {
            TableRelation = "G/L Account"."No.";
            Caption = 'Losses Acc. on Disposal';
        }
        modify("Book Val. Acc. on Disp. (Gain)")
        {
            TableRelation = "G/L Account"."No.";
            Caption = 'Book Val. Acc. on Disp. (Gain)';
        }
        modify("Sales Acc. on Disp. (Gain)")
        {
            TableRelation = "G/L Account"."No.";
            Caption = 'Sales Acc. on Disp. (Gain)';
        }
        modify("Write-Down Bal. Acc. on Disp.")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Apprec. Bal. Acc. on Disp.")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Custom 1 Bal. Acc. on Disposal")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Custom 2 Bal. Acc. on Disposal")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Maintenance Expense Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Maintenance Bal. Acc.")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Acquisition Cost Bal. Acc.")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Depreciation Expense Acc.")
        {
            TableRelation = "G/L Account"."No.";
            Caption = 'Depreciation Expense Acc.';
        }
        modify("Write-Down Expense Acc.")
        {
            TableRelation = "G/L Account"."No.";
            Caption = 'Write-Down Expense Acc.';
        }
        modify("Appreciation Bal. Account")
        {
            TableRelation = "G/L Account"."No.";
            Caption = 'Appreciation Bal. Account';
        }
        modify("Custom 1 Expense Acc.")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Custom 2 Expense Acc.")
        {
            TableRelation = "G/L Account"."No.";
            Caption = 'Custom 2 Expense Acc.';
        }
        modify("Sales Bal. Acc.")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Allocated Depreciation %")
        {
            Caption = 'Allocated Depreciation %';
        }
        modify("Allocated Write-Down %")
        {
            Caption = 'Allocated Write-Down %';
        }
        modify("Allocated Appreciation %")
        {
            Caption = 'Allocated Appreciation %';
        }
        modify("Allocated Custom 2 %")
        {
            Caption = 'Allocated Custom 2 %';
        }
        modify("Allocated Loss %")
        {
            Caption = 'Allocated Loss %';
        }
        modify("Allocated Book Value % (Gain)")
        {
            Caption = 'Allocated Book Value % (Gain)';
        }
        modify("Allocated Book Value % (Loss)")
        {
            Caption = 'Allocated Book Value % (Loss)';
        }
        modify("Sales Acc. on Disp. (Loss)")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Book Val. Acc. on Disp. (Loss)")
        {
            TableRelation = "G/L Account"."No.";
        }
        field(50000; "No Proyecto Amortizacion"; Code[20])
        {
            Caption = 'No Proyecto Amortizacion';
            ToolTip = 'Specifies the value of the No Proyecto Amortizacion field.';
            TableRelation = Job;
        }
        field(50001; "% Amotización lineal"; Decimal)
        {
            Caption = '% Amotización lineal';
            ToolTip = 'Specifies the value of the % Amotización lineal field.';
            MaxValue = 100;
            MinValue = 0;
        }
        field(50002; "Cta. provisión compra"; Code[20])
        {
            Caption = 'Cta. provisión compra';
            ToolTip = 'Specifies the value of the Cta. provisión compra field.';
            TableRelation = "G/L Account"."No.";

            trigger OnValidate()
            begin
                CheckGLAcc("Cta. provisión compra", false);
            end;
        }
    }
}

