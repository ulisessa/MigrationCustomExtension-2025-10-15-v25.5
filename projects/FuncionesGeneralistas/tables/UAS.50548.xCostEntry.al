table 50548 "xCost Entry"
{

    fields
    {
        field(1; "Line No."; Integer)
        {
            Caption = 'Line No.';
            ToolTip = 'Specifies the value of the Line No field.';
        }
        field(4; "Cost Type No."; Text[20])
        {
            Caption = 'Cost Type No.';
            ToolTip = 'Specifies the value of the Cost Type No field.';
        }
        field(5; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            ToolTip = 'Specifies the value of the Posting Date field.';
        }
        field(7; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            ToolTip = 'Specifies the value of the Document No field.';
        }
        field(8; Text; Text[80])
        {
            Caption = 'Text';
            ToolTip = 'Specifies the value of the Text field.';
        }
        field(16; Amount; Decimal)
        {
            Caption = 'Amount';
            ToolTip = 'Specifies the value of the Amount field.';
        }
        field(17; "Debit Amount"; Decimal)
        {
            Caption = 'Debit Amount';
            ToolTip = 'Specifies the value of the Debit Amount field.';
        }
        field(18; "Credit Amount"; Decimal)
        {
            Caption = 'Credit Amount';
            ToolTip = 'Specifies the value of the Credit Amount field.';
        }
        field(20; "Cost Center Code"; Code[20])
        {
            Caption = 'Cost Center Code';
            ToolTip = 'Specifies the value of the Cost Center Code field.';
        }
        field(21; "Cost Object Code"; Code[20])
        {
            Caption = 'Cost Object Code';
            ToolTip = 'Specifies the value of the Cost Object Code field.';
        }
        field(27; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            ToolTip = 'Specifies the value of the Reason Code field.';
        }
        field(28; "GL Account"; Code[20])
        {
            Caption = 'GL Account';
            ToolTip = 'Specifies the value of the GL Account field.';
        }
        field(29; "GL Entry No."; Integer)
        {
            Caption = 'GL Entry No.';
            ToolTip = 'Specifies the value of the GL Entry No field.';
        }
        field(30; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            ToolTip = 'Specifies the value of the Source Code field.';
        }
        field(31; "System-Created Entry"; Boolean)
        {
            Caption = 'System-Created Entry';
            ToolTip = 'Specifies the value of the System-Created Entry field.';
        }
        field(32; Allocated; Boolean)
        {
            Caption = 'Allocated';
            ToolTip = 'Specifies the value of the Allocated field.';
        }
        field(33; "Allocated with Journal No."; Integer)
        {
            Caption = 'Allocated with Journal No.';
            ToolTip = 'Specifies the value of the Allocated with Journal No field.';
        }
        field(40; "User ID"; Code[20])
        {
            Caption = 'User ID';
            ToolTip = 'Specifies the value of the User ID field.';
        }
        field(41; "Batch Name"; Code[10])
        {
            Caption = 'Batch Name';
            ToolTip = 'Specifies the value of the Batch Name field.';
        }
        field(42; "Register No."; Integer)
        {
            Caption = 'Register No.';
            ToolTip = 'Specifies the value of the Register No field.';
        }
        field(50; "Allocation Ratio"; Text[80])
        {
            Caption = 'Allocation Ratio';
            ToolTip = 'Specifies the value of the Allocation Ratio field.';
        }
        field(51; "Allocation ID"; Code[10])
        {
            Caption = 'Allocation ID';
            ToolTip = 'Specifies the value of the Allocation ID field.';
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

