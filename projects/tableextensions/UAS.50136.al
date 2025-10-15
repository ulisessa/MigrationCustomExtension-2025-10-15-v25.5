tableextension 50136 "Bank Clearing Standard Ext." extends "Bank Clearing Standard"
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

