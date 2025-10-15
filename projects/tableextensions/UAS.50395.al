tableextension 50395 tableextension50395 extends "Phys. Inventory Ledger Entry"
{
    Caption = 'Phys. Inventory Ledger Entry';
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
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Salespers./Purch. Code")
        {
            Caption = 'Salespers./Purch. Code';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
        }
        modify("Journal Batch Name")
        {
            Caption = 'Journal Batch Name';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("Qty. (Phys. Inventory)")
        {
            Caption = 'Qty. (Phys. Inventory)';
        }
        modify("Last Item Ledger Entry No.")
        {
            Caption = 'Last Item Ledger Entry No.';
        }
        modify("Document Date")
        {
            Caption = 'Document Date';
        }
        modify("External Document No.")
        {
            Caption = 'External Document No.';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Phys Invt Counting Period Code")
        {
            Caption = 'Phys Invt Counting Period Code';
        }
        modify("Phys Invt Counting Period Type")
        {
            Caption = 'Phys Invt Counting Period Type';
        }
        field(50000; "Global Dimension 3 Code"; Code[10])
        {
            CaptionClass = '1,2,3';

        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            CaptionClass = '1,2,4';

        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            CaptionClass = '1,2,5';

        }
        field(50003; "Global Dimension 6 Code"; Code[10])
        {
            CaptionClass = '1,2,6';

        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';

        }
        field(50005; "Lote origen"; Code[10])
        {
        }
        field(50505; "Nombre libro diario"; Code[10])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(50506; "Net kilos"; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(50507; "Net kilos (Calculated)"; Decimal)
        {
            Caption = 'Qty. (Calculated)';
            DecimalPlaces = 0 : 5;
        }
        field(50508; "Net kilos (Phys. Inventory)"; Decimal)
        {
            Caption = 'Qty. (Phys. Inventory)';
            DecimalPlaces = 0 : 5;
        }
        field(50509; "Gross kilos"; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(50510; "Gross kilos (Calculated)"; Decimal)
        {
            Caption = 'Qty. (Calculated)';
            DecimalPlaces = 0 : 5;
        }
        field(50511; "Gross kilos (Phys. Inventory)"; Decimal)
        {
            Caption = 'Qty. (Phys. Inventory)';
            DecimalPlaces = 0 : 5;
        }
    }
}

