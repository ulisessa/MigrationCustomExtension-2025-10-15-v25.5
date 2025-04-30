tableextension 50985 tableextension50985 extends "Lot No. Information"
{
    Caption = 'Lot No. Information';
    fields
    {
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Lot No.")
        {
            Caption = 'Lot No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Certificate Number")
        {
            Caption = 'Certificate Number';
        }
        modify("Location Filter")
        {
            Caption = 'Location Filter';
        }
        modify("Bin Filter")
        {
            Caption = 'Bin Filter';
        }
    }
}

