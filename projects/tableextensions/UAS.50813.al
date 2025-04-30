tableextension 50813 tableextension50813 extends "FA G/L Posting Buffer"
{
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Account No.")
        {
            Caption = 'Account No.';
        }
        modify(Correction)
        {
            Caption = 'Correction';
        }
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
        }
        modify("FA Entry No.")
        {
            Caption = 'FA Entry No.';
        }
        modify("Automatic Entry")
        {
            Caption = 'Automatic Entry';
        }
        modify("FA Allocation Type")
        {
            Caption = 'FA Allocation Type';
        }
        modify("FA Allocation Line No.")
        {
            Caption = 'FA Allocation Line No.';
        }
        modify("Original General Journal Line")
        {
            Caption = 'Original General Journal Line';
        }
        field(50000; "Global Dimension 3 Code"; Code[10])
        {
            CaptionClass = '1,1,3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            CaptionClass = '1,1,4';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            CaptionClass = '1,1,5';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));
        }
        field(50003; "Global Dimension 6 Code"; Code[10])
        {
            CaptionClass = '1,1,6';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));
        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,1,7';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));
        }
        field(50005; "No. proyecto"; Code[20])
        {
        }
        field(50006; "Concepto proyecto"; Code[10])
        {
            TableRelation = "Standard Text";
        }
    }
}

