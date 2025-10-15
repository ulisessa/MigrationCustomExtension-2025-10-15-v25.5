tableextension 50281 "Business Unit Information Ext." extends "Business Unit Information"
{
    Caption = 'Business Unit Information';
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("Currency Code")
        {
            Caption = 'Currency Code';
        }
        modify("Exch. Rate Gains Acc.")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Exch. Rate Losses Acc.")
        {
            Caption = 'Exch. Rate Losses Acc.';
            TableRelation = "G/L Account"."No.";
        }
        modify("Residual Account")
        {
            TableRelation = "G/L Account"."No.";
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
    }
}

