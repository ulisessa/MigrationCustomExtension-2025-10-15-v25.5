tableextension 50244 "Payroll Import Buffer Ext." extends "Payroll Import Buffer"
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

