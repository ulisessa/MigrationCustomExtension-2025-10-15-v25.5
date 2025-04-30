tableextension 50691 tableextension50691 extends "Detailed Employee Ledger Entry"
{
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Employee Ledger Entry No.")
        {
            Caption = 'Employee Ledger Entry No.';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("Employee No.")
        {
            Caption = 'Employee No.';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("Transaction No.")
        {
            Caption = 'Transaction No.';
        }
        modify("Journal Batch Name")
        {
            Caption = 'Journal Batch Name';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("Applied Empl. Ledger Entry No.")
        {
            Caption = 'Applied Empl. Ledger Entry No.';
        }
        modify("Unapplied by Entry No.")
        {
            Caption = 'Unapplied by Entry No.';
        }
        modify("Application No.")
        {
            Caption = 'Application No.';
        }
    }
}

