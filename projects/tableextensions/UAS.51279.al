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
            TableRelation = "G/L Account"."No.";
        }
    }
}

