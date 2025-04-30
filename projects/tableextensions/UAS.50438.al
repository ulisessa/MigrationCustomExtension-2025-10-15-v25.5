tableextension 50438 tableextension50438 extends "Payable Vendor Ledger Entry"
{
    fields
    {
        modify("Vendor No.")
        {
            Caption = 'Vendor No.';
        }
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Vendor Ledg. Entry No.")
        {
            Caption = 'Vendor Ledg. Entry No.';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
    }
}

