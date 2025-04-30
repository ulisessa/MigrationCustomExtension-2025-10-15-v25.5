tableextension 51369 tableextension51369 extends "Order Promising Line"
{
    Caption = 'Order Promising Line';
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Source Batch Name")
        {
            Caption = 'Source Batch Name';
        }
        modify("Source Line No.")
        {
            Caption = 'Source Line No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Original Shipment Date")
        {
            Caption = 'Original Shipment Date';
        }
        modify("Earliest Shipment Date")
        {
            Caption = 'Earliest Shipment Date';
        }
        modify("Requested Shipment Date")
        {
            Caption = 'Requested Shipment Date';
        }
    }
}

