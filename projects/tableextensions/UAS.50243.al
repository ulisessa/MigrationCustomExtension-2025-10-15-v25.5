tableextension 50243 tableextension50243 extends "Import G/L Transaction"
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

