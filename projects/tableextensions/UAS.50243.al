tableextension 50243 "Import G/L Transaction Ext." extends "Import G/L Transaction"
{
    Caption = 'Import G/L Transaction';
    fields
    {
        modify("App ID")
        {
            Caption = 'App ID';
        }
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
    }
}

