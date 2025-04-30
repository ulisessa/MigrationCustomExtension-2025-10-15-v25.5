tableextension 50454 tableextension50454 extends "Currency Total Buffer"
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

