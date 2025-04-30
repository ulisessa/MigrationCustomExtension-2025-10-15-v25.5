tableextension 50757 tableextension50757 extends "Tax Group Buffer"
{
    Caption = 'Tax Group Buffer';
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
        modify("Last Modified DateTime")
        {
            Caption = 'Last Modified DateTime';
        }
    }
}

