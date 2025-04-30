tableextension 50347 tableextension50347 extends "Reason Code"
{
    Caption = 'Reason Code';
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
        modify("Contract Gain/Loss Amount")
        {
            Caption = 'Contract Gain/Loss Amount';
        }
    }
}

