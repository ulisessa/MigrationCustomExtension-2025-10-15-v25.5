tableextension 50337 tableextension50337 extends "Business Unit"
{
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("Consolidation %")
        {
            Caption = 'Consolidation %';
        }
        modify("Exch. Rate Losses Acc.")
        {
            TableRelation = "G/L Account"."No.";
            Caption = 'Exch. Rate Losses Acc.';
        }
        modify("Exch. Rate Gains Acc.")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Residual Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Last Balance Currency Factor")
        {
            Caption = 'Last Balance Currency Factor';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("Comp. Exch. Rate Gains Acc.")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Comp. Exch. Rate Losses Acc.")
        {
            TableRelation = "G/L Account"."No.";
            Caption = 'Comp. Exch. Rate Losses Acc.';
        }
        modify("Equity Exch. Rate Gains Acc.")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Equity Exch. Rate Losses Acc.")
        {
            TableRelation = "G/L Account"."No.";
            Caption = 'Equity Exch. Rate Losses Acc.';
        }
        modify("Minority Exch. Rate Gains Acc.")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Minority Exch. Rate Losses Acc")
        {
            TableRelation = "G/L Account"."No.";
            Caption = 'Minority Exch. Rate Losses Acc';
        }
        modify("File Format")
        {
            OptionCaption = 'Version 4.00 or Later (.xml),Version 3.70 or Earlier (.txt)';
        }
        modify("Last Run")
        {
            Caption = 'Last Run';
        }
        modify("G/L Account No.")
        {
            Caption = 'G/L Account No.';
            OptionCaption = 'Current G/L Account Nos.,Old G/L Account Nos.';
        }
    }
}

