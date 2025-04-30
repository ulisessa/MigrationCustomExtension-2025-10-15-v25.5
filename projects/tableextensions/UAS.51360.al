tableextension 51360 tableextension51360 extends "Action Message Entry"
{
    Caption = 'Action Message Entry';
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify(Calculation)
        {
            Caption = 'Calculation';
        }
        modify("Suppressed Action Msg.")
        {
            Caption = 'Suppressed Action Msg.';
        }
        modify("Source Batch Name")
        {
            Caption = 'Source Batch Name';
        }
        modify("Source Prod. Order Line")
        {
            Caption = 'Source Prod. Order Line';
        }
        modify("Source Ref. No.")
        {
            Caption = 'Source Ref. No.';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Bin Code")
        {
            Caption = 'Bin Code';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        field(50000; "Net kilos"; Decimal)
        {
            Caption = 'Net kilos';
            DecimalPlaces = 0 : 5;
        }
        field(50001; "Gross kilos"; Decimal)
        {
            Caption = 'Gross kilos';
            DecimalPlaces = 0 : 5;
        }
    }
}

