tableextension 50352 tableextension50352 extends "Vendor Invoice Disc."
{
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("Minimum Amount")
        {
            Caption = 'Minimum Amount';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
    }
}

