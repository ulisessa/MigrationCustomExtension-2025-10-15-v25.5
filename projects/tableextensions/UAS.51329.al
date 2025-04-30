tableextension 51329 tableextension51329 extends "Manufacturing Setup"
{
    Caption = 'Manufacturing Setup';
    fields
    {
        modify("Normal Ending Time")
        {
            Caption = 'Normal Ending Time';
        }
        modify("Doc. No. Is Prod. Order No.")
        {
            Caption = 'Doc. No. Is Prod. Order No.';
        }
        modify("Cost Incl. Setup")
        {
            Caption = 'Cost Incl. Setup';
        }
        modify("Dynamic Low-Level Code")
        {
            Caption = 'Dynamic Low-Level Code';
        }
        modify("Planning Warning")
        {
            Caption = 'Planning Warning';
        }
        modify("Simulated Order Nos.")
        {
            Caption = 'Simulated Order Nos.';
        }
        modify("Planned Order Nos.")
        {
            Caption = 'Planned Order Nos.';
        }
        modify("Firm Planned Order Nos.")
        {
            Caption = 'Firm Planned Order Nos.';
        }
        modify("Released Order Nos.")
        {
            Caption = 'Released Order Nos.';
        }
        modify("Machine Center Nos.")
        {
            Caption = 'Machine Center Nos.';
        }
        modify("Production BOM Nos.")
        {
            Caption = 'Production BOM Nos.';
        }
        modify("Current Production Forecast")
        {
            Caption = 'Current Demand Forecast';
        }
        modify("Use Forecast on Locations")
        {
            Caption = 'Use Forecast on Locations';
        }
        modify("Combined MPS/MRP Calculation")
        {
            Caption = 'Combined MPS/MRP Calculation';
        }
        modify("Default Safety Lead Time")
        {
            Caption = 'Default Safety Lead Time';
        }
        modify("Blank Overflow Level")
        {
            OptionCaption = 'Allow Default Calculation,Use Item/SKU Values Only';
        }
        modify("Preset Output Quantity")
        {
            OptionCaption = 'Expected Quantity,Zero on All Operations,Zero on Last Operation';
        }
    }
}

