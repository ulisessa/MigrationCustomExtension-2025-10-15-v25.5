tableextension 50982 tableextension50982 extends "Merge Duplicates Line Buffer"
{
    Caption = 'Merge Duplicates Line Buffer';
    fields
    {
        modify("In Primary Key")
        {
            OptionCaption = 'Yes,No';
        }
    }
}

