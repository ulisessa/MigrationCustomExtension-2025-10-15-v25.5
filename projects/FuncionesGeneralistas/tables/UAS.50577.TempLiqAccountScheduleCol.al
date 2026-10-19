table 50577 "Temp Liq. Account Schedule Col"
{

    fields
    {
        field(1; "Column Layout Name"; Code[10])
        {
            Caption = 'Column Layout Name';
            ToolTip = 'Specifies the value of the Column Layout Name field.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            ToolTip = 'Specifies the value of the Line No field.';
        }
        field(3; "Column No."; Code[10])
        {
            Caption = 'Column No.';
            ToolTip = 'Specifies the value of the Column No field.';
        }
        field(4; "Column Header"; Text[30])
        {
            Caption = 'Column Header';
            ToolTip = 'Specifies the value of the Column Header field.';
        }
        field(5; "Column Type"; Option)
        {
            Caption = 'Column Type';
            ToolTip = 'Specifies the value of the Column Type field.';
            OptionMembers = Pageula,"Net Change","Balance at Date","Beginning Balance","Year to Date","Rest of Fiscal Year","Entire Fiscal Year";
        }
        field(6; "Entry Type"; Option)
        {
            Caption = 'Entry Type';
            ToolTip = 'Specifies the value of the Entry Type field.';
            OptionMembers = "Liquidity Ledger Entry";
        }
        field(7; "Amount Type"; Option)
        {
            Caption = 'Amount Type';
            ToolTip = 'Specifies the value of the Amount Type field.';
            OptionMembers = Amount;
        }
        field(8; Formula; Code[80])
        {
            Caption = 'Formula';
            ToolTip = 'Specifies the value of the Formula field.';
        }
        field(9; "Comparison Date Formula"; DateFormula)
        {
            Caption = 'Comparison Date Formula';
            ToolTip = 'Specifies the value of the Comparison Date Formula field.';
        }
        field(10; "Show Opposite Sign"; Boolean)
        {
            Caption = 'Show Opposite Sign';
            ToolTip = 'Specifies the value of the Show Opposite Sign field.';
        }
        field(11; Show; Option)
        {
            Caption = 'Show';
            ToolTip = 'Specifies the value of the Show field.';
            OptionMembers = Always,Never,"When Positive","When Negative";
        }
        field(12; "Rounding Factor"; Option)
        {
            Caption = 'Rounding Factor';
            ToolTip = 'Specifies the value of the Rounding Factor field.';
            OptionMembers = "None","1","1000","1000000";
        }
        field(13; "Comparison Period Formula"; Code[20])
        {
            Caption = 'Comparison Period Formula';
            ToolTip = 'Specifies the value of the Comparison Period Formula field.';
        }
        field(16; "Dimension 1 Totaling"; Text[80])
        {
            Caption = 'Dimension 1 Totaling';
            ToolTip = 'Specifies the value of the Dimension 1 Totaling field.';
        }
        field(17; "Dimension 2 Totaling"; Text[80])
        {
            Caption = 'Dimension 2 Totaling';
            ToolTip = 'Specifies the value of the Dimension 2 Totaling field.';
        }
        field(18; "Dimension 3 Totaling"; Text[80])
        {
            Caption = 'Dimension 3 Totaling';
            ToolTip = 'Specifies the value of the Dimension 3 Totaling field.';
        }
        field(19; "Dimension 4 Totaling"; Text[80])
        {
            Caption = 'Dimension 4 Totaling';
            ToolTip = 'Specifies the value of the Dimension 4 Totaling field.';
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

