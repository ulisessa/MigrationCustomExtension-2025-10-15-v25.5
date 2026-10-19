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
            Caption = 'Type of Tax';
            ToolTip = 'Specifies the value of the Type of Tax field.';
            OptionMembers = IVA,"IVA No Inscripto","IVA Percepcion","Ingreso Brutos",Otros;
        }
        field(50701; "Company Excemption %"; Decimal)
        {
            Caption = 'Company Excemption %';
            ToolTip = 'Specifies the value of the Company Excemption % field.';
        }
        field(50702; "Company Excemption date"; Date)
        {
            Caption = 'Company Excemption date';
            ToolTip = 'Specifies the value of the Company Excemption date field.';
        }
        field(50703; Discrimina; Boolean)
        {
            Caption = 'Discrimina';
            ToolTip = 'Specifies the value of the Discrimina field.';
        }
        field(50704; "No Computable"; Boolean)
        {
            Caption = 'No Computable';
            ToolTip = 'Specifies the value of the No Computable field.';
        }
        field(50705; "Cod. provincia"; Code[10])
        {
            Caption = 'Cod. provincia';
            ToolTip = 'Specifies the value of the Cod. provincia field.';
        }
    }
}

