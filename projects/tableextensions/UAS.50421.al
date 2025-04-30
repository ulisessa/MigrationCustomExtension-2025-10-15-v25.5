tableextension 50421 tableextension50421 extends "Finance Charge Text"
{
    Caption = 'Finance Charge Text';
    fields
    {
        modify("Fin. Charge Terms Code")
        {
            Caption = 'Fin. Charge Terms Code';
        }
        modify(Position)
        {
            Caption = 'Position';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
    }
}

