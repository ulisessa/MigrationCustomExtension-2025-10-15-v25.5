table 50575 "Temp Neutral Payments"
{

    fields
    {
        field(1; "Revenue/Expense"; Option)
        {
            OptionMembers = Revenue,Expense;
        }
        field(2; "Code"; Code[10])
        {
        }
        field(3; "Liquidity Account No."; Code[20])
        {
        }
        field(4; Description; Text[30])
        {
        }
        field(5; "First Execution"; Date)
        {
        }
        field(6; "Expiration Date"; Date)
        {
        }
        field(7; "Recurring Frequency"; Code[20])
        {
        }
        field(8; Amount; Decimal)
        {
        }
        field(9; "Global Dimension 1 Code"; Code[20])
        {
        }
        field(10; "Global Dimension 2 Code"; Code[20])
        {
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

