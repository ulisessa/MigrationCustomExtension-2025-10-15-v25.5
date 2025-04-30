tableextension 50442 tableextension50442 extends "Tax Jurisdiction"
{
    Caption = 'Tax Jurisdiction';
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Tax Account (Sales)")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Tax Account (Purchases)")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Report-to Jurisdiction")
        {
            Caption = 'Report-to Jurisdiction';
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
        field(50700; "Type of Tax"; Option)
        {
            OptionMembers = IVA,"IVA No Inscripto","IVA Percepcion","Ingreso Brutos",Otros;
        }
        field(50701; "Company Excemption %"; Decimal)
        {
        }
        field(50702; "Company Excemption date"; Date)
        {
        }
        field(50703; Discrimina; Boolean)
        {
        }
        field(50704; "No Computable"; Boolean)
        {
        }
        field(50705; "Cod. provincia"; Code[10])
        {
        }
    }
}

