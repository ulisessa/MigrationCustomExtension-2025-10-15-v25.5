tableextension 51087 tableextension51087 extends "Bin Content Buffer"
{
    fields
    {
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Zone Code")
        {
            Caption = 'Zone Code';
        }
        modify("Bin Code")
        {
            Caption = 'Bin Code';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Lot No.")
        {
            Caption = 'Lot No.';
        }
        modify("Serial No.")
        {
            Caption = 'Serial No.';
        }
        field(50000; "Net kilos to Handle (Base)"; Decimal)
        {
            Caption = 'Net kilos to Handle (Base)';
            ToolTip = 'Specifies the value of the Net kilos to Handle (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50001; "Net kilos Outstanding (Base)"; Decimal)
        {
            Caption = 'Net kilos Outstanding (Base)';
            ToolTip = 'Specifies the value of the Net kilos Outstanding (Base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50002; "Gross kilos to Handle (Base)"; Decimal)
        {
            Caption = 'Gross kilos to Handle (Base)';
            ToolTip = 'Specifies the value of the Gross kilos to Handle (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50003; "Gross kilos Outstanding (Base)"; Decimal)
        {
            Caption = 'Gross kilos Outstanding (Base)';
            ToolTip = 'Specifies the value of the Gross kilos Outstanding (Base) field.';
            DecimalPlaces = 0 : 5;
        }
    }
}

