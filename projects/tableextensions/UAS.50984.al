tableextension 50984 tableextension50984 extends "Serial No. Information"
{
    Caption = 'Serial No. Information';
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
        modify("Serial No.")
        {
            Caption = 'Serial No.';
        }
        modify(Description)
        {
            Caption = 'Description';
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

