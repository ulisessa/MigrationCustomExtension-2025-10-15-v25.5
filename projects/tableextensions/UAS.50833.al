tableextension 50833 tableextension50833 extends "Finance Charge Interest Rate"
{
    Caption = 'Fin. Charge Interest Rate';
    fields
    {
        modify("Fin. Charge Terms Code")
        {
            Caption = 'Fin. Charge Terms Code';
        }
        modify("Interest Rate")
        {
            Caption = 'Interest Rate';
        }
        modify("Interest Period (Days)")
        {
            Caption = 'Interest Period (Days)';
        }
    }
}

