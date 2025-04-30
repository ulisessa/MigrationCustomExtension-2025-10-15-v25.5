tableextension 50446 tableextension50446 extends "VAT Product Posting Group"
{
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
        modify("Delivery Operation Code")
        {
            Caption = 'Delivery Operation Code';
        }
    }
}

