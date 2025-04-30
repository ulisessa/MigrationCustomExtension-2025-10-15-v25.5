table 50549 "xCost Register"
{

    fields
    {
        field(1; "No."; Integer)
        {
        }
        field(2; Source; Option)
        {
            OptionMembers = "Transfer from G/L","Cost Journal",Allocation;
        }
        field(3; Text; Text[30])
        {
        }
        field(4; "From Entry No."; Integer)
        {
        }
        field(5; "To Entry No."; Integer)
        {
        }
        field(6; "From Cost Entry No."; Integer)
        {
        }
        field(7; "To Cost Entry No."; Integer)
        {
        }
        field(8; "No. of Entries"; Integer)
        {
        }
        field(15; "Debit Amount"; Decimal)
        {
        }
        field(16; "Credit Amount"; Decimal)
        {
        }
        field(20; "Processed Date"; Date)
        {
        }
        field(21; "Posting Date"; Date)
        {
        }
        field(23; Definite; Boolean)
        {
        }
        field(25; Level; Integer)
        {
        }
        field(31; "User ID"; Code[20])
        {
        }
        field(32; "Journal Batch Name"; Code[10])
        {
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

