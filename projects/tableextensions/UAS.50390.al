tableextension 50390 tableextension50390 extends "Bank Account Statement Line"
{
    Caption = 'Bank Account Statement Line';
    fields
    {
        modify("Bank Account No.")
        {
            Caption = 'Bank Account No.';
        }
        modify("Statement No.")
        {
            Caption = 'Statement No.';
        }
        modify("Statement Line No.")
        {
            Caption = 'Statement Line No.';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Check No.")
        {
            Caption = 'Check No.';
        }
        modify("Transaction ID")
        {
            Caption = 'Transaction ID';
        }
    }
}

