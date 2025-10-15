tableextension 50286 "VAT Assisted Setup Temp. Ext." extends "VAT Assisted Setup Templates"
{
    Caption = 'VAT Assisted Setup Templates';
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

