tableextension 51279 tableextension51279 extends "Inventory Posting Group"
{
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
        field(50500; "Resultado x Tenencia"; Code[10])
        {
            Caption = 'Resultado x Tenencia';
            ToolTip = 'Specifies the value of the Resultado x Tenencia field.';
            TableRelation = "G/L Account"."No.";
        }
    }
}

