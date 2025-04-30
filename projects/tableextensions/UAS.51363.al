tableextension 51363 tableextension51363 extends "Production Forecast Entry"
{
    Caption = 'Demand Forecast Entry';
    fields
    {
        modify("Production Forecast Name")
        {
            Caption = 'Demand Forecast Name';
        }
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Forecast Date")
        {
            Caption = 'Forecast Date';
        }
        modify("Forecast Quantity")
        {
            Caption = 'Forecast Quantity';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Forecast Quantity (Base)")
        {
            Caption = 'Forecast Quantity (Base)';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
    }
}

