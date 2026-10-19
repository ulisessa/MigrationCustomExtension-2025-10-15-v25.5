tableextension 50369 tableextension50369 extends "VAT Statement Line"
{
    Caption = 'VAT Statement Line';
    fields
    {
        modify("Statement Template Name")
        {
            Caption = 'Statement Template Name';
        }
        modify("Statement Name")
        {
            Caption = 'Statement Name';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Row No.")
        {
            Caption = 'Row No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Account Totaling")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("New Page")
        {
            Caption = 'New Page';
        }
        modify("Tax Jurisdiction Code")
        {
            Caption = 'Tax Jurisdiction Code';
        }
        modify("Use Tax")
        {
            Caption = 'Use Tax';
        }
        modify("Box No.")
        {
            Caption = 'Box No.';
        }
        field(50000; "Cód. grupo impuesto"; Code[10])
        {
            Caption = 'Tax Group Code';
            ToolTip = 'Specifies the value of the Tax Group Code field.';
            TableRelation = "Tax Group";
        }
        field(50001; "Grupo contable producto"; Code[10])
        {
            Caption = 'Grupo contable producto';
            ToolTip = 'Specifies the value of the Grupo contable producto field.';
            TableRelation = "Tax Jurisdiction";
        }
        field(50002; "Grupo contable negocio"; Code[10])
        {
            Caption = 'Grupo contable negocio';
            ToolTip = 'Specifies the value of the Grupo contable negocio field.';
            TableRelation = "Tax Jurisdiction";
        }
    }
}

