tableextension 50122 "Bank Stmt Mult. Match Ln. Ext." extends "Bank Stmt Multiple Match Line"
{
    Caption = 'Bank Stmt Multiple Match Line';
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
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
    }
}

