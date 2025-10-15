tableextension 50239 "Office Sugg. Line Item Ext." extends "Office Suggested Line Item"
{
    Caption = 'Office Suggested Line Item';
    fields
    {
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Item Description")
        {
            Caption = 'Item Description';
        }
    }
}

