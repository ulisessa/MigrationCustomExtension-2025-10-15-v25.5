tableextension 50124 "Bank Stmt. Match. Buffer Ext." extends "Bank Statement Matching Buffer"
{
    Caption = 'Bank Statement Matching Buffer';
    fields
    {
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Account No.")
        {
            Caption = 'Account No.';
        }
        modify("No. of Entries")
        {
            Caption = 'No. of Entries';
        }
    }
}

