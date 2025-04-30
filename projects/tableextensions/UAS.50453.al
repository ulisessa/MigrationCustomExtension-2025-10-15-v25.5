tableextension 50453 tableextension50453 extends "Adjust Exchange Rate Buffer"
{
    fields
    {
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("Dimension Entry No.")
        {
            Caption = 'Dimension Entry No.';
        }
        modify("IC Partner Code")
        {
            Caption = 'IC Partner Code';
        }
        modify(Index)
        {
            Caption = 'Index';
        }
        modify("Account No.")
        {
            Caption = 'Account No.';
        }
    }
}

