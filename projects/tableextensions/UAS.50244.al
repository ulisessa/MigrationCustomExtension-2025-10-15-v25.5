tableextension 50244 tableextension50244 extends "Payroll Import Buffer"
{
    Caption = 'Payroll Import Buffer';
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Account No.")
        {
            Caption = 'Account No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
    }
}

