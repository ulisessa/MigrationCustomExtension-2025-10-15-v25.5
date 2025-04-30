table 50552 "xCost Allocation Source"
{

    fields
    {
        field(1; ID; Code[10])
        {
        }
        field(2; Level; Integer)
        {
        }
        field(3; "Valid From"; Date)
        {
        }
        field(4; "Valid To"; Date)
        {
        }
        field(5; "Cost Type Range"; Text[30])
        {
        }
        field(6; "Cost Center Code"; Code[20])
        {
        }
        field(7; "Cost Object Code"; Code[20])
        {
        }
        field(8; Variant; Code[10])
        {
        }
        field(10; "Credit to Cost Type"; Text[20])
        {
        }
        field(20; Comment; Text[50])
        {
        }
        field(22; "Total Share"; Decimal)
        {
        }
        field(30; Blocked; Boolean)
        {
        }
        field(60; "Last Date Modified"; Date)
        {
        }
        field(61; "User ID"; Code[20])
        {
        }
        field(100; "Allocation Type"; Option)
        {
            OptionMembers = Both,Actual,Budget;
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

