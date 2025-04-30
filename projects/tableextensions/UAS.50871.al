tableextension 50871 tableextension50871 extends "Availability Calc. Overview"
{
    Caption = 'Availability Calc. Overview';
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify(Type)
        {
            OptionCaption = 'Item,As of Date,Inventory,Supply,Supply Forecast,Demand';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Attached to Entry No.")
        {
            Caption = 'Attached to Entry No.';
        }
        modify("Source Batch Name")
        {
            Caption = 'Source Batch Name';
        }
        modify("Source Ref. No.")
        {
            Caption = 'Source Ref. No.';
        }
        modify("Source Prod. Order Line")
        {
            Caption = 'Source Prod. Order Line';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
    }
}

