tableextension 51072 tableextension51072 extends "Warehouse Entry"
{
    Caption = 'Warehouse Entry';
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Journal Batch Name")
        {
            Caption = 'Journal Batch Name';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
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
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Source No.")
        {
            Caption = 'Source No.';
        }
        modify("Source Line No.")
        {
            Caption = 'Source Line No.';
        }
        modify("Source Subline No.")
        {
            Caption = 'Source Subline No.';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("Bin Type Code")
        {
            Caption = 'Bin Type Code';
        }
        modify("Whse. Document No.")
        {
            Caption = 'Whse. Document No.';
        }
        modify("Whse. Document Type")
        {
            Caption = 'Whse. Document Type';
        }
        modify("Whse. Document Line No.")
        {
            Caption = 'Whse. Document Line No.';
        }
        modify("Reference No.")
        {
            Caption = 'Reference No.';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Serial No.")
        {
            Caption = 'Serial No.';
        }
        modify("Lot No.")
        {
            Caption = 'Lot No.';
        }
        modify("Warranty Date")
        {
            Caption = 'Warranty Date';
        }
        modify("Phys Invt Counting Period Code")
        {
            Caption = 'Phys Invt Counting Period Code';
        }
        modify("Phys Invt Counting Period Type")
        {
            Caption = 'Phys Invt Counting Period Type';
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
        field(50012; "Net kilos (Base)"; Decimal)
        {
            Caption = 'Net kilos (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(50013; "Gross kilos (Base)"; Decimal)
        {
            Caption = 'Gross kilos (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(50014; "Lote origen"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50142; "Ommit position validation"; Boolean)
        {
            Caption = 'Omitir validación de posición';
            DataClassification = ToBeClassified;
        }
        field(50500; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(50501; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(50502; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 2 Code';
            DataClassification = ToBeClassified;

        }
    }
}

