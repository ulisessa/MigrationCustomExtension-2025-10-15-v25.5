tableextension 50090 tableextension50090 extends "Credit Transfer Entry"
{
    Caption = 'Credit Transfer Entry';
    fields
    {
        modify("Credit Transfer Register No.")
        {
            Caption = 'Credit Transfer Register No.';
        }
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Account No.")
        {
            Caption = 'Account No.';
        }
        modify("Applies-to Entry No.")
        {
            Caption = 'Applies-to Entry No.';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("Transaction ID")
        {
            Caption = 'Transaction ID';
        }
        modify("Recipient Bank Acc. No.")
        {
            Caption = 'Recipient Bank Acc. No.';
        }
    }
}

