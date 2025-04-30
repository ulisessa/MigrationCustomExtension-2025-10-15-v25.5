tableextension 50915 tableextension50915 extends "Symptom Code"
{
    Caption = 'Symptom Code';
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

