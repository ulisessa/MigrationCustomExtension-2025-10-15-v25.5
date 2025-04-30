tableextension 51019 tableextension51019 extends "Category Code"
{
    Caption = 'Category Code';
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

