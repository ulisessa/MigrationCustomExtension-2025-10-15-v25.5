tableextension 50744 tableextension50744 extends "Planning Error Log"
{
    Caption = 'Planning Error Log';
    fields
    {
        modify("Journal Batch Name")
        {
            Caption = 'Journal Batch Name';
        }
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Error Description")
        {
            Caption = 'Error Description';
        }
        modify("Table Position")
        {
            Caption = 'Table Position';
        }
    }
}

