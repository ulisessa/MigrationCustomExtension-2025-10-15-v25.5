tableextension 50377 tableextension50377 extends "Currency Amount"
{
    fields
    {
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
    }
}

