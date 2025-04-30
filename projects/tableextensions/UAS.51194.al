tableextension 51194 tableextension51194 extends "Exch. Rate Adjmt. Reg."
{
    Caption = 'Exch. Rate Adjmt. Reg.';
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Creation Date")
        {
            Caption = 'Creation Date';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
    }
}

