tableextension 50851 tableextension50851 extends "Warehouse Comment Line"
{
    Caption = 'Warehouse Comment Line';
    fields
    {
        modify("Table Name")
        {
            OptionCaption = 'Whse. Activity Header,Whse. Receipt,Whse. Shipment,Internal Put-away,Internal Pick,Rgstrd. Whse. Activity Header,Posted Whse. Receipt,Posted Whse. Shipment,Posted Invt. Put-Away,Posted Invt. Pick,Registered Invt. Movement,Internal Movement';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Code")
        {
            Caption = 'Code';
        }
    }
}

