tableextension 50810 tableextension50810 extends "Insurance Journal Batch"
{
    Caption = 'Insurance Journal Batch';
    fields
    {
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("Posting No. Series")
        {
            Caption = 'Posting No. Series';
        }
    }
}

