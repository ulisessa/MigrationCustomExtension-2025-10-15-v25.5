tableextension 50304 tableextension50304 extends "Job Posting Group"
{
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("WIP Costs Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("WIP Accrued Costs Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Job Costs Applied Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Job Costs Adjustment Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("G/L Expense Acc. (Contract)")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Job Sales Adjustment Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("WIP Accrued Sales Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("WIP Invoiced Sales Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Job Sales Applied Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Recognized Costs Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Recognized Sales Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Item Costs Applied Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Resource Costs Applied Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("G/L Costs Applied Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify(Description)
        {
            Caption = 'Description';
        }
    }
}

