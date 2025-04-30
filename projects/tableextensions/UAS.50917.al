tableextension 50917 tableextension50917 extends "Fault Code"
{
    Caption = 'Fault Code';
    fields
    {
        modify("Fault Area Code")
        {
            Caption = 'Fault Area Code';
        }
        modify("Symptom Code")
        {
            Caption = 'Symptom Code';
        }
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

