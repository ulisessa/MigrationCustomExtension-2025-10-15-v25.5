tableextension 50780 tableextension50780 extends "VAT Clause"
{
    Caption = 'VAT Clause';
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
        modify("Description 2")
        {
            Caption = 'Description 2';
        }
        modify("Last Modified DateTime")
        {
            Caption = 'Last Modified DateTime';
        }
        modify("SII Exemption Code")
        {
            Caption = 'SII Exemption Code';
        }
    }
}

