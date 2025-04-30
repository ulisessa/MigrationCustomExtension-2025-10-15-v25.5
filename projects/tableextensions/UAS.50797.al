tableextension 50797 tableextension50797 extends "VAT Clause by Doc. Type"
{
    Caption = 'VAT Clause by Document Type';
    fields
    {
        modify("VAT Clause Code")
        {
            Caption = 'VAT Clause Code';
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

