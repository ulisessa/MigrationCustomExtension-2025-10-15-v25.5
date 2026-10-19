table 50554 "xCost Allocation Target"
{

    fields
    {
        field(1; ID; Code[10])
        {
            Caption = 'ID';
            ToolTip = 'Specifies the value of the ID field.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            ToolTip = 'Specifies the value of the Line No field.';
        }
        field(5; "Target Cost Type"; Text[20])
        {
            Caption = 'Target Cost Type';
            ToolTip = 'Specifies the value of the Target Cost Type field.';
        }
        field(6; "Target Cost Center"; Code[20])
        {
            Caption = 'Target Cost Center';
            ToolTip = 'Specifies the value of the Target Cost Center field.';
        }
        field(7; "Target Cost Object"; Code[20])
        {
            Caption = 'Target Cost Object';
            ToolTip = 'Specifies the value of the Target Cost Object field.';
        }
        field(8; "Static Base"; Decimal)
        {
            Caption = 'Static Base';
            ToolTip = 'Specifies the value of the Static Base field.';
        }
        field(9; "Static Weighting"; Decimal)
        {
            Caption = 'Static Weighting';
            ToolTip = 'Specifies the value of the Static Weighting field.';
        }
        field(10; Share; Decimal)
        {
            Caption = 'Share';
            ToolTip = 'Specifies the value of the Share field.';
        }
        field(11; Percent; Decimal)
        {
            Caption = 'Percent';
            ToolTip = 'Specifies the value of the Percent field.';
        }
        field(20; Comment; Text[50])
        {
            Caption = 'Comment';
            ToolTip = 'Specifies the value of the Comment field.';
        }
        field(30; Base; Option)
        {
            Caption = 'Base';
            ToolTip = 'Specifies the value of the Base field.';
            OptionMembers = Static,"G/L Movement","G/L Budget","Cost Type Movement","Cost Type Budget",,,,,"No of Employees",,"Items Sold (Qty)","Items Purchased (Qty)","Items Sold (Amount)","Items Purchased (Amount)";
        }
        field(31; "No. Filter"; Code[30])
        {
            Caption = 'No. Filter';
            ToolTip = 'Specifies the value of the No. Filter field.';
        }
        field(32; "Cost Center Filter"; Code[30])
        {
            Caption = 'Cost Center Filter';
            ToolTip = 'Specifies the value of the Cost Center Filter field.';
        }
        field(33; "Cost Object Filter"; Code[30])
        {
            Caption = 'Cost Object Filter';
            ToolTip = 'Specifies the value of the Cost Object Filter field.';
        }
        field(34; "Date Filter Code"; Option)
        {
            Caption = 'Date Filter Code';
            ToolTip = 'Specifies the value of the Date Filter Code field.';
            OptionMembers = " ",Week,"Last Week",Month,"Last Month","Month of Last Year",Year,"Last Year",Period,"Last Period","Period of Last Year","Fiscal Year","Last Fiscal Year";
        }
        field(35; "Group Filter"; Code[30])
        {
            Caption = 'Group Filter';
            ToolTip = 'Specifies the value of the Group Filter field.';
        }
        field(38; "Allocation Type"; Option)
        {
            Caption = 'Allocation Type';
            ToolTip = 'Specifies the value of the Allocation Type field.';
            OptionMembers = "All Costs","Percent per Share","Amount per Share";
        }
        field(40; "Percent per Share"; Decimal)
        {
            Caption = 'Percent per Share';
            ToolTip = 'Specifies the value of the Percent per Share field.';
        }
        field(41; "Amount per Share"; Decimal)
        {
            Caption = 'Amount per Share';
            ToolTip = 'Specifies the value of the Amount per Share field.';
        }
        field(50; "Share Updated on"; Date)
        {
            Caption = 'Share Updated on';
            ToolTip = 'Specifies the value of the Share Updated on field.';
        }
        field(60; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            ToolTip = 'Specifies the value of the Last Date Modified field.';
        }
        field(61; "User ID"; Code[20])
        {
            Caption = 'User ID';
            ToolTip = 'Specifies the value of the User ID field.';
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

