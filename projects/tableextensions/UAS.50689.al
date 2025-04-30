tableextension 50689 tableextension50689 extends "Employee Posting Group"
{
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("Payables Account")
        {
            TableRelation = "G/L Account"."No.";
        }
    }
}

