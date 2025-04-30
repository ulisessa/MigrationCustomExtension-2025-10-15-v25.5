tableextension 380 "DetailedVendLedgerEntry" extends "Detailed Vendor Ledg. Entry" //OriginalId
{
    fields
    {
        field(50000; "Initial Entry Global Dim. 3"; Code[20])
        {
            Caption = 'Initial Entry Global Dim. 3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(50001; "Initial Entry Global Dim. 4"; Code[20])
        {
            Caption = 'Initial Entry Global Dim. 4';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
        }
        field(50002; "Initial Entry Global Dim. 5"; Code[20])
        {
            Caption = 'Initial Entry Global Dim. 5';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));
        }
        field(50003; "Initial Entry Global Dim. 6"; Code[20])
        {
            Caption = 'Initial Entry Global Dim. 6';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));
        }
        field(50004; "Initial Entry Global Dim. 7"; Code[20])
        {
            Caption = 'Initial Entry Global Dim. 7';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));
        }
        field(50010; "Linked Vend. Ledger Entry No."; Integer)
        {
            Caption = 'Applied Vend. Ledger Entry No.';
        }
    }
}