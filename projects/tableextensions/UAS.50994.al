tableextension 50994 tableextension50994 extends "Return Reason"
{
    Caption = 'Return Reason';
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
        modify("Default Location Code")
        {
            Caption = 'Default Location Code';
        }
    }
}

