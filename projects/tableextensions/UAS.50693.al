tableextension 50693 tableextension50693 extends "Employee Payment Buffer"
{
    fields
    {
        modify("Employee No.")
        {
            Caption = 'Employee No.';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("Employee Ledg. Entry No.")
        {
            Caption = 'Employee Ledg. Entry No.';
        }
        modify("Dimension Entry No.")
        {
            Caption = 'Dimension Entry No.';
        }
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("Employee Ledg. Entry Doc. No.")
        {
            Caption = 'Employee Ledg. Entry Doc. No.';
        }
        modify("Creditor No.")
        {
            Caption = 'Creditor No.';
        }
        modify("Payment Method Code")
        {
            Caption = 'Payment Method Code';
        }
        modify("Applies-to Ext. Doc. No.")
        {
            Caption = 'Applies-to Ext. Doc. No.';
        }
    }
}

