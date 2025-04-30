tableextension 51256 tableextension51256 extends "ATO Sales Buffer"
{
    Caption = 'ATO Sales Buffer';
    fields
    {
        modify("Order No.")
        {
            Caption = 'Order No.';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Parent Item No.")
        {
            Caption = 'Parent Item No.';
        }
        modify("Profit %")
        {
            Caption = 'Profit %';
        }
        modify("Parent Description")
        {
            Caption = 'Parent Description';
        }
    }
}

