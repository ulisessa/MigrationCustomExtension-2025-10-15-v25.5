tableextension 50060 "Cost Journal Batch Ext." extends "Cost Journal Batch"
{
    Caption = 'Cost Journal Batch';
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
        modify("Bal. Cost Type No.")
        {
            Caption = 'Bal. Cost Type No.';
        }
        modify("Bal. Cost Center Code")
        {
            Caption = 'Bal. Cost Center Code';
        }
        modify("Bal. Cost Object Code")
        {
            Caption = 'Bal. Cost Object Code';
        }
        modify("Delete after Posting")
        {
            Caption = 'Delete after Posting';
        }
    }
}

