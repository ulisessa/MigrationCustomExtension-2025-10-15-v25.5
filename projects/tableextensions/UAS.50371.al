tableextension 50371 tableextension50371 extends "Transaction Type"
{
    Caption = 'Transaction Type';
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
    }
}

