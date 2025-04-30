tableextension 51237 tableextension51237 extends "Warehouse WMS Cue"
{
    Caption = 'Warehouse WMS Cue';
    fields
    {
        modify("Released Sales Orders - Today")
        {
            Caption = 'Released Sales Orders - Today';
        }
        modify("Posted Shipments - Today")
        {
            Caption = 'Posted Shipments - Today';
        }
        modify("Posted Receipts - Today")
        {
            Caption = 'Posted Receipts - Today';
        }
        modify("Location Filter")
        {
            Caption = 'Location Filter';
        }
    }
}

