tableextension 50288 "Cust. Invoice Disc. Ext." extends "Cust. Invoice Disc."
{
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("Minimum Amount")
        {
            Caption = 'Minimum Amount';
        }
        modify("Currency Code")
        {
            Caption = 'Currency Code';
        }
    }
}

