table 50552 "xCost Allocation Source"
{

    fields
    {
        field(1; ID; Code[10])
        {
            Caption = 'ID';
            ToolTip = 'Specifies the value of the ID field.';
        }
        field(2; Level; Integer)
        {
            Caption = 'Level';
            ToolTip = 'Specifies the value of the Level field.';
        }
        field(3; "Valid From"; Date)
        {
            Caption = 'Valid From';
            ToolTip = 'Specifies the value of the Valid From field.';
        }
        field(4; "Valid To"; Date)
        {
            Caption = 'Valid To';
            ToolTip = 'Specifies the value of the Valid To field.';
        }
        field(5; "Cost Type Range"; Text[30])
        {
            Caption = 'Cost Type Range';
            ToolTip = 'Specifies the value of the Cost Type Range field.';
        }
        field(6; "Cost Center Code"; Code[20])
        {
            Caption = 'Cost Center Code';
            ToolTip = 'Specifies the value of the Cost Center Code field.';
        }
        field(7; "Cost Object Code"; Code[20])
        {
            Caption = 'Cost Object Code';
            ToolTip = 'Specifies the value of the Cost Object Code field.';
        }
        field(8; Variant; Code[10])
        {
            Caption = 'Variant';
            ToolTip = 'Specifies the value of the Variant field.';
        }
        field(10; "Credit to Cost Type"; Text[20])
        {
            Caption = 'Credit to Cost Type';
            ToolTip = 'Specifies the value of the Credit to Cost Type field.';
        }
        field(20; Comment; Text[50])
        {
            Caption = 'Comment';
            ToolTip = 'Specifies the value of the Comment field.';
        }
        field(22; "Total Share"; Decimal)
        {
            Caption = 'Total Share';
            ToolTip = 'Specifies the value of the Total Share field.';
        }
        field(30; Blocked; Boolean)
        {
            Caption = 'Blocked';
            ToolTip = 'Specifies the value of the Blocked field.';
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
        field(100; "Allocation Type"; Option)
        {
            Caption = 'Allocation Type';
            ToolTip = 'Specifies the value of the Allocation Type field.';
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

