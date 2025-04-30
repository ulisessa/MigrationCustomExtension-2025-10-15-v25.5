tableextension 51259 tableextension51259 extends "My Item"
{
    Caption = 'My Item';
    fields
    {
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
    }
}

