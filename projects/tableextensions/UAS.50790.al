tableextension 50790 tableextension50790 extends "VAT Clause Translation"
{
    Caption = 'VAT Clause Translation';
    fields
    {
        modify("VAT Clause Code")
        {
            Caption = 'VAT Clause Code';
        }
        modify("Language Code")
        {
            Caption = 'Language Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Description 2")
        {
            Caption = 'Description 2';
        }
    }
}

