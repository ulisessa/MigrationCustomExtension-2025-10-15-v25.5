tableextension 50242 "Payroll Setup Ext." extends "Payroll Setup"
{
    Caption = 'Payroll Setup';
    fields
    {
        modify("General Journal Batch Name")
        {
            Caption = 'General Journal Batch Name';
        }
    }
}

