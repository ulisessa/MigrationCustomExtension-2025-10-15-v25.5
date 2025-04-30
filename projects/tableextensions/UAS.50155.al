tableextension 50155 tableextension50155 extends "Incoming Documents Setup"
{
    Caption = 'Incoming Documents Setup';
    fields
    {
        modify("General Journal Batch Name")
        {
            Caption = 'General Journal Batch Name';
        }
        modify("Require Approval To Create")
        {
            Caption = 'Require Approval To Create';
        }
        modify("Require Approval To Post")
        {
            Caption = 'Require Approval To Post';
        }
    }
}

