tableextension 50807 tableextension50807 extends "VAT Clause by Doc. Type Trans."
{
    Caption = 'VAT Clause by Document Type Translation';
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

