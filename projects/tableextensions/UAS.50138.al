tableextension 50138 "Outstanding Bank Trans. Ext." extends "Outstanding Bank Transaction"
{
    Caption = 'Outstanding Bank Transaction';
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Document Type")
        {
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("Bank Account No.")
        {
            Caption = 'Bank Account No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Statement Type")
        {
            OptionCaption = 'Bank Reconciliation,Payment Application';
        }
        modify("Statement No.")
        {
            Caption = 'Statement No.';
        }
    }
}

