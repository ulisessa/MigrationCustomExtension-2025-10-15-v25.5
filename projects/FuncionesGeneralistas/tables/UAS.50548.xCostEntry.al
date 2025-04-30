table 50548 "xCost Entry"
{

    fields
    {
        field(1; "Line No."; Integer)
        {
        }
        field(4; "Cost Type No."; Text[20])
        {
        }
        field(5; "Posting Date"; Date)
        {
        }
        field(7; "Document No."; Code[20])
        {
        }
        field(8; Text; Text[80])
        {
        }
        field(16; Amount; Decimal)
        {
        }
        field(17; "Debit Amount"; Decimal)
        {
        }
        field(18; "Credit Amount"; Decimal)
        {
        }
        field(20; "Cost Center Code"; Code[20])
        {
        }
        field(21; "Cost Object Code"; Code[20])
        {
        }
        field(27; "Reason Code"; Code[10])
        {
        }
        field(28; "GL Account"; Code[20])
        {
        }
        field(29; "GL Entry No."; Integer)
        {
        }
        field(30; "Source Code"; Code[10])
        {
        }
        field(31; "System-Created Entry"; Boolean)
        {
        }
        field(32; Allocated; Boolean)
        {
        }
        field(33; "Allocated with Journal No."; Integer)
        {
        }
        field(40; "User ID"; Code[20])
        {
        }
        field(41; "Batch Name"; Code[10])
        {
        }
        field(42; "Register No."; Integer)
        {
        }
        field(50; "Allocation Ratio"; Text[80])
        {
        }
        field(51; "Allocation ID"; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

