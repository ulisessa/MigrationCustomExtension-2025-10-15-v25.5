tableextension 50136 tableextension50136 extends "Bank Clearing Standard"
{
    Caption = 'Bank Clearing Standard';
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

