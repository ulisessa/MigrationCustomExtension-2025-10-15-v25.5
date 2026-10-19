table 50568 xLiquidity
{

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            ToolTip = 'Specifies the value of the No field.';
        }
        field(2; "Search Name"; Code[50])
        {
            Caption = 'Search Name';
            ToolTip = 'Specifies the value of the Search Name field.';
        }
        field(3; Description; Text[50])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';
        }
        field(4; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
            ToolTip = 'Specifies the value of the Description 2 field.';
        }
        field(5; "Consider Discount"; Boolean)
        {
            Caption = 'Consider Discount';
            ToolTip = 'Specifies the value of the Consider Discount field.';
        }
        field(6; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
            ToolTip = 'Specifies the value of the Creation Date field.';
        }
        field(7; "Created By"; Code[20])
        {
            Caption = 'Created By';
            ToolTip = 'Specifies the value of the Created By field.';
        }
        field(8; "Neutral Payments To"; Date)
        {
            Caption = 'Neutral Payments To';
            ToolTip = 'Specifies the value of the Neutral Payments To field.';
        }
        field(9; Comment; Boolean)
        {
            Caption = 'Comment';
            ToolTip = 'Specifies the value of the Comment field.';
        }
        field(10; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            ToolTip = 'Specifies the value of the No. Series field.';
        }
        field(11; "Neutral Payments From"; Date)
        {
            Caption = 'Neutral Payments From';
            ToolTip = 'Specifies the value of the Neutral Payments From field.';
        }
        field(12; "G/L Budget From"; Date)
        {
            Caption = 'G/L Budget From';
            ToolTip = 'Specifies the value of the G/L Budget From field.';
        }
        field(13; "G/L Budget To"; Date)
        {
            Caption = 'G/L Budget To';
            ToolTip = 'Specifies the value of the G/L Budget To field.';
        }
        field(14; "Consider Liq. Payment Terms"; Boolean)
        {
            Caption = 'Consider Liq. Payment Terms';
            ToolTip = 'Specifies the value of the Consider Liq. Payment Terms field.';
        }
        field(15; "Consider Pmt. Disc. Tol. Date"; Boolean)
        {
            Caption = 'Consider Pmt. Disc. Tol. Date';
            ToolTip = 'Specifies the value of the Consider Pmt. Disc. Tol. Date field.';
        }
        field(16; "Consider Pmt. Tol. Amount"; Boolean)
        {
            Caption = 'Consider Pmt. Tol. Amount';
            ToolTip = 'Specifies the value of the Consider Pmt. Tol. Amount field.';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

