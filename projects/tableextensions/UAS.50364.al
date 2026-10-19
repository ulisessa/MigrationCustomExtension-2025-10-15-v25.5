tableextension 50364 tableextension50364 extends "Gen. Product Posting Group"
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
        modify("Def. VAT Prod. Posting Group")
        {
            Caption = 'Def. VAT Prod. Posting Group';
        }
        modify("Auto Insert Default")
        {
            Caption = 'Auto Insert Default';
        }
        modify("Operation Code")
        {
            Caption = 'Operation Code';
        }
        field(50500; Tipo; Option)
        {
            Caption = 'Tipo';
            ToolTip = 'Specifies the value of the Tipo field.';
            OptionMembers = Producto,Recurso;
        }
    }
}

