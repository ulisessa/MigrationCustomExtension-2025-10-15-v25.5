tableextension 50872 tableextension50872 extends "Capacity Ledger Entry"
{
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Operation No.")
        {
            Caption = 'Operation No.';
        }
        modify("Work Center No.")
        {
            Caption = 'Work Center No.';
        }
        modify("Setup Time")
        {
            Caption = 'Setup Time';
        }
        modify("Run Time")
        {
            Caption = 'Run Time';
        }
        modify("Cap. Unit of Measure Code")
        {
            Caption = 'Cap. Unit of Measure Code';
        }
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
        }
        modify("Last Output Line")
        {
            Caption = 'Last Output Line';
        }
        modify("Routing No.")
        {
            Caption = 'Routing No.';
        }
        modify("Routing Reference No.")
        {
            Caption = 'Routing Reference No.';
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
        modify("Document Date")
        {
            Caption = 'Document Date';
        }
        modify("External Document No.")
        {
            Caption = 'External Document No.';
        }
        modify("Stop Code")
        {
            Caption = 'Stop Code';
        }
        modify("Scrap Code")
        {
            Caption = 'Scrap Code';
        }
        modify("Work Center Group Code")
        {
            Caption = 'Work Center Group Code';
        }
        modify("Work Shift Code")
        {
            Caption = 'Work Shift Code';
        }
        modify(Subcontracting)
        {
            Caption = 'Subcontracting';
        }
        modify("Order No.")
        {
            Caption = 'Order No.';
        }
        modify("Order Line No.")
        {
            Caption = 'Order Line No.';
        }
        field(50000; "Global Dimension 3 Code"; Code[10])
        {
            CaptionClass = '1,1,3';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (3));
        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            CaptionClass = '1,1,4';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (4));
        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            CaptionClass = '1,1,5';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (5));
        }
        field(50003; "Global Dimension 6 Code"; Code[10])
        {
            CaptionClass = '1,1,6';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (6));
        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,1,7';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (7));
        }
        field(50010; "Net kilos"; Decimal)
        {
            Caption = 'Net kilos';
            DecimalPlaces = 0 : 5;
        }
        field(50011; "Gross kilos"; Decimal)
        {
            Caption = 'Gross kilos';
            DecimalPlaces = 0 : 5;
        }
        field(50012; "Invoiced net kilos"; Decimal)
        {
            Caption = 'Invoiced net kilos';
            DecimalPlaces = 0 : 5;
        }
        field(50013; "Invoiced gross kilos"; Decimal)
        {
            Caption = 'Invoiced gross kilos';
            DecimalPlaces = 0 : 5;
        }
        field(50014; "Output net kilos"; Decimal)
        {
            Caption = 'Output net kilos';
            DecimalPlaces = 0 : 5;
        }
        field(50015; "Output gross kilos"; Decimal)
        {
            Caption = 'Output gross kilos';
            DecimalPlaces = 0 : 5;
        }
        field(50016; "Scrap net kilos"; Decimal)
        {
            Caption = 'Scrap net kilos';
            DecimalPlaces = 0 : 5;
        }
        field(50017; "Scrap gross kilos"; Decimal)
        {
            Caption = 'Scrap gross kilos';
            DecimalPlaces = 0 : 5;
        }
    }
}

