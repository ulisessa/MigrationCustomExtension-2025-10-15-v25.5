tableextension 51351 tableextension51351 extends "Sales Planning Line"
{
    Caption = 'Sales Planning Line';
    fields
    {
        modify("Sales Order No.")
        {
            Caption = 'Sales Order No.';
        }
        modify("Sales Order Line No.")
        {
            Caption = 'Sales Order Line No.';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Shipment Date")
        {
            Caption = 'Shipment Date';
        }
        modify("Next Planning Date")
        {
            Caption = 'Next Planning Date';
        }
        modify("Expected Delivery Date")
        {
            Caption = 'Expected Delivery Date';
        }
        modify("Needs Replanning")
        {
            Caption = 'Needs Replanning';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Low-Level Code")
        {
            Caption = 'Low-Level Code';
        }
    }
}

