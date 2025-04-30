tableextension 50437 tableextension50437 extends "Tax Area Translation"
{
    Caption = 'Tax Area Translation';
    fields
    {
        modify("Tax Area Code")
        {
            Caption = 'Tax Area Code';
        }
        modify("Language Code")
        {
            Caption = 'Language Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
    }
}

