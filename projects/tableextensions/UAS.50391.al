tableextension 50391 tableextension50391 extends "Bank Account Posting Group"
{
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("Liabs. for Disc. Bills Acc.")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Bank Services Acc.")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Discount Interest Acc.")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Rejection Expenses Acc.")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Liabs. for Factoring Acc.")
        {
            TableRelation = "G/L Account"."No.";
        }
    }
}

