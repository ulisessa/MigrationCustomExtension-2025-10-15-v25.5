tableextension 50287 "VAT Ass. Set. Bus. Grp. Ext." extends "VAT Assisted Setup Bus. Grp."
{
    Caption = 'VAT Assisted Setup Bus. Grp.';
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
    }
}

