table 50577 "Temp Liq. Account Schedule Col"
{

    fields
    {
        field(1; "Column Layout Name"; Code[10])
        {
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; "Column No."; Code[10])
        {
        }
        field(4; "Column Header"; Text[30])
        {
        }
        field(5; "Column Type"; Option)
        {
            OptionMembers = Pageula,"Net Change","Balance at Date","Beginning Balance","Year to Date","Rest of Fiscal Year","Entire Fiscal Year";
        }
        field(6; "Entry Type"; Option)
        {
            OptionMembers = "Liquidity Ledger Entry";
        }
        field(7; "Amount Type"; Option)
        {
            OptionMembers = Amount;
        }
        field(8; Formula; Code[80])
        {
        }
        field(9; "Comparison Date Formula"; DateFormula)
        {
        }
        field(10; "Show Opposite Sign"; Boolean)
        {
        }
        field(11; Show; Option)
        {
            OptionMembers = Always,Never,"When Positive","When Negative";
        }
        field(12; "Rounding Factor"; Option)
        {
            OptionMembers = "None","1","1000","1000000";
        }
        field(13; "Comparison Period Formula"; Code[20])
        {
        }
        field(16; "Dimension 1 Totaling"; Text[80])
        {
        }
        field(17; "Dimension 2 Totaling"; Text[80])
        {
        }
        field(18; "Dimension 3 Totaling"; Text[80])
        {
        }
        field(19; "Dimension 4 Totaling"; Text[80])
        {
        }
    }

    keys
    {
        key(Key1; "Column Layout Name", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

