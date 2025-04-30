tableextension 50448 tableextension50448 extends "Tax Setup"
{
    Caption = 'Tax Setup';
    fields
    {
        modify("Auto. Create Tax Details")
        {
            Caption = 'Auto. Create Tax Details';
        }
        modify("Non-Taxable Tax Group Code")
        {
            Caption = 'Non-Taxable Tax Group Code';
        }
        modify("Tax Account (Sales)")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Tax Account (Purchases)")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Unreal. Tax Acc. (Sales)")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Unreal. Tax Acc. (Purchases)")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Reverse Charge (Purchases)")
        {
            TableRelation = "G/L Account"."No.";
            Caption = 'Reverse Charge (Purchases)';
        }
        modify("Unreal. Rev. Charge (Purch.)")
        {
            TableRelation = "G/L Account"."No.";
        }
    }
}

