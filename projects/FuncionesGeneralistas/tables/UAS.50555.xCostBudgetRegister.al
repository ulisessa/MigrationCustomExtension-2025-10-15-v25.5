table 50555 "xCost Budget Register"
{

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
            ToolTip = 'Specifies the value of the No field.';
        }
        field(2; Source; Option)
        {
            Caption = 'Source';
            ToolTip = 'Specifies the value of the Source field.';
            OptionMembers = "Transfer from G/L Budget","Cost Journal",Allocation,Manual;
        }
        field(3; Text; Text[30])
        {
            Caption = 'Text';
            ToolTip = 'Specifies the value of the Text field.';
        }
        field(4; "From Budget Entry No."; Integer)
        {
            Caption = 'From Budget Entry No.';
            ToolTip = 'Specifies the value of the From Budget Entry No field.';
        }
        field(5; "To Budget Entry No."; Integer)
        {
            Caption = 'To Budget Entry No.';
            ToolTip = 'Specifies the value of the To Budget Entry No field.';
        }
        field(6; "From Cost Budget Entry No."; Integer)
        {
            Caption = 'From Cost Budget Entry No.';
            ToolTip = 'Specifies the value of the From Cost Budget Entry No field.';
        }
        field(7; "To Cost Budget Entry No."; Integer)
        {
            Caption = 'To Cost Budget Entry No.';
            ToolTip = 'Specifies the value of the To Cost Budget Entry No field.';
        }
        field(8; "No. of Entries"; Integer)
        {
            Caption = 'No. of Entries';
            ToolTip = 'Specifies the value of the No. of Entries field.';
        }
        field(15; "Debit Amount"; Decimal)
        {
            Caption = 'Debit Amount';
            ToolTip = 'Specifies the value of the Debit Amount field.';
        }
        field(16; "Credit Amount"; Decimal)
        {
            Caption = 'Credit Amount';
            ToolTip = 'Specifies the value of the Credit Amount field.';
        }
        field(20; "Processed Date"; Date)
        {
            Caption = 'Processed Date';
            ToolTip = 'Specifies the value of the Processed Date field.';
        }
        field(21; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            ToolTip = 'Specifies the value of the Posting Date field.';
        }
        field(23; Definite; Boolean)
        {
            Caption = 'Definite';
            ToolTip = 'Specifies the value of the Definite field.';
        }
        field(25; Level; Integer)
        {
            Caption = 'Level';
            ToolTip = 'Specifies the value of the Level field.';
        }
        field(31; "User ID"; Code[20])
        {
            Caption = 'User ID';
            ToolTip = 'Specifies the value of the User ID field.';
        }
        field(32; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            ToolTip = 'Specifies the value of the Journal Batch Name field.';
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

