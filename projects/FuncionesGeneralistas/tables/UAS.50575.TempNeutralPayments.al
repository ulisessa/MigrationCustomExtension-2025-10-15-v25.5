table 50575 "Temp Neutral Payments"
{

    fields
    {
        field(1; "Revenue/Expense"; Option)
        {
            Caption = 'Revenue/Expense';
            ToolTip = 'Specifies the value of the Revenue/Expense field.';
            OptionMembers = Revenue,Expense;
        }
        field(2; "Code"; Code[10])
        {
            Caption = 'Code';
            ToolTip = 'Specifies the value of the Code field.';
        }
        field(3; "Liquidity Account No."; Code[20])
        {
            Caption = 'Liquidity Account No.';
            ToolTip = 'Specifies the value of the Liquidity Account No field.';
        }
        field(4; Description; Text[30])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';
        }
        field(5; "First Execution"; Date)
        {
            Caption = 'First Execution';
            ToolTip = 'Specifies the value of the First Execution field.';
        }
        field(6; "Expiration Date"; Date)
        {
            Caption = 'Expiration Date';
            ToolTip = 'Specifies the value of the Expiration Date field.';
        }
        field(7; "Recurring Frequency"; Code[20])
        {
            Caption = 'Recurring Frequency';
            ToolTip = 'Specifies the value of the Recurring Frequency field.';
        }
        field(8; Amount; Decimal)
        {
            Caption = 'Amount';
            ToolTip = 'Specifies the value of the Amount field.';
        }
        field(9; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code';
            ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
        }
        field(10; "Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Global Dimension 2 Code';
            ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
        }
    }

    keys
    {
        key(Key1; "Revenue/Expense", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

