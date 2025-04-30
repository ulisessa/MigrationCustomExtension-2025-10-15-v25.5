tableextension 50425 tableextension50425 extends "Issued Fin. Charge Memo Line"
{
    Caption = 'Issued Fin. Charge Memo Line';
    fields
    {
        modify("Finance Charge Memo No.")
        {
            Caption = 'Finance Charge Memo No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Attached to Line No.")
        {
            Caption = 'Attached to Line No.';
        }
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Document Date")
        {
            Caption = 'Document Date';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Interest Rate")
        {
            Caption = 'Interest Rate';
        }
        modify("VAT Calculation Type")
        {
            Caption = 'VAT Calculation Type';
        }
        modify("Tax Group Code")
        {
            Caption = 'Tax Group Code';
        }
        modify("VAT Clause Code")
        {
            Caption = 'VAT Clause Code';
        }
        modify("Detailed Interest Rates Entry")
        {
            Caption = 'Detailed Interest Rates Entry';
        }
        modify("System-Created Entry")
        {
            Caption = 'System-Created Entry';
        }
    }
}

