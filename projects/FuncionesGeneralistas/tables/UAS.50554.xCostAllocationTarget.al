table 50554 "xCost Allocation Target"
{

    fields
    {
        field(1; ID; Code[10])
        {
        }
        field(2; "Line No."; Integer)
        {
        }
        field(5; "Target Cost Type"; Text[20])
        {
        }
        field(6; "Target Cost Center"; Code[20])
        {
        }
        field(7; "Target Cost Object"; Code[20])
        {
        }
        field(8; "Static Base"; Decimal)
        {
        }
        field(9; "Static Weighting"; Decimal)
        {
        }
        field(10; Share; Decimal)
        {
        }
        field(11; Percent; Decimal)
        {
        }
        field(20; Comment; Text[50])
        {
        }
        field(30; Base; Option)
        {
            OptionMembers = Static,"G/L Movement","G/L Budget","Cost Type Movement","Cost Type Budget",,,,,"No of Employees",,"Items Sold (Qty)","Items Purchased (Qty)","Items Sold (Amount)","Items Purchased (Amount)";
        }
        field(31; "No. Filter"; Code[30])
        {
        }
        field(32; "Cost Center Filter"; Code[30])
        {
        }
        field(33; "Cost Object Filter"; Code[30])
        {
        }
        field(34; "Date Filter Code"; Option)
        {
            OptionMembers = " ",Week,"Last Week",Month,"Last Month","Month of Last Year",Year,"Last Year",Period,"Last Period","Period of Last Year","Fiscal Year","Last Fiscal Year";
        }
        field(35; "Group Filter"; Code[30])
        {
        }
        field(38; "Allocation Type"; Option)
        {
            OptionMembers = "All Costs","Percent per Share","Amount per Share";
        }
        field(40; "Percent per Share"; Decimal)
        {
        }
        field(41; "Amount per Share"; Decimal)
        {
        }
        field(50; "Share Updated on"; Date)
        {
        }
        field(60; "Last Date Modified"; Date)
        {
        }
        field(61; "User ID"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; ID, "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

