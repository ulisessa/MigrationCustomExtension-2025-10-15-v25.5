tableextension 51181 tableextension51181 extends "Cash Flow Account"
{
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("New Page")
        {
            Caption = 'New Page';
        }
        modify("No. of Blank Lines")
        {
            Caption = 'No. of Blank Lines';
        }
        modify("Last Date Modified")
        {
            Caption = 'Last Date Modified';
        }
        modify("Cash Flow Forecast Filter")
        {
            Caption = 'Cash Flow Forecast Filter';
        }
        modify("Global Dimension 1 Filter")
        {
            Caption = 'Global Dimension 1 Filter';
        }
        modify("Global Dimension 2 Filter")
        {
            Caption = 'Global Dimension 2 Filter';
        }
        modify("G/L Integration")
        {
            Caption = 'G/L Integration';
        }
        modify("G/L Account Filter")
        {
            TableRelation = "G/L Account"."No.";
        }
    }
}

