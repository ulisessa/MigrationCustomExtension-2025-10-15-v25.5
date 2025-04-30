tableextension 50477 tableextension50477 extends "ECSL VAT Report Line"
{
    Caption = 'ECSL VAT Report Line';
    fields
    {
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Report No.")
        {
            Caption = 'Report No.';
        }
        modify("Country Code")
        {
            Caption = 'Country Code';
        }
        modify("Transaction Indicator")
        {
            Caption = 'Transaction Indicator';
            OptionCaption = 'B2B Goods,,Triangulated Goods,B2B Services';
        }
    }
}

