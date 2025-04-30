tableextension 50692 tableextension50692 extends "Payable Employee Ledger Entry"
{
    fields
    {
        modify("Employee No.")
        {
            Caption = 'Employee No.';
        }
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Employee Ledg. Entry No.")
        {
            Caption = 'Employee Ledg. Entry No.';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
    }
}

