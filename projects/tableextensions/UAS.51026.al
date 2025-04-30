tableextension 51026 tableextension51026 extends "Cartera Setup"
{
    Caption = 'Cartera Setup';
    fields
    {
        modify("Bill Group Nos.")
        {
            Caption = 'Bill Group Nos.';
        }
        modify("Payment Order Nos.")
        {
            Caption = 'Payment Order Nos.';
        }
        modify("Bills Discount Limit Warnings")
        {
            Caption = 'Bills Discount Limit Warnings';
        }
        modify("Euro Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Euro Currency Code';
        }
    }
}

