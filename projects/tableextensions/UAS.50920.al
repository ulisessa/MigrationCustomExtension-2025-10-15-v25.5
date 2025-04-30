tableextension 50920 tableextension50920 extends "Fault Area/Symptom Code"
{
    Caption = 'Fault Area/Symptom Code';
    fields
    {
        modify(Type)
        {
            OptionCaption = ',Fault Area,Symptom Code';
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

