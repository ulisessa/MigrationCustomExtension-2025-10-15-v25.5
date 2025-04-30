tableextension 50767 tableextension50767 extends "Tax Area Buffer"
{
    Caption = 'Tax Area Buffer';
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
        modify("Last Modified Date Time")
        {
            Caption = 'Last Modified Date Time';
        }
    }
}

