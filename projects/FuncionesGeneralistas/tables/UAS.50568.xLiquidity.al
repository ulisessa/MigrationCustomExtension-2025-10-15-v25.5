table 50568 xLiquidity
{

    fields
    {
        field(1; "No."; Code[20])
        {
        }
        field(2; "Search Name"; Code[50])
        {
        }
        field(3; Description; Text[50])
        {
        }
        field(4; "Description 2"; Text[50])
        {
        }
        field(5; "Consider Discount"; Boolean)
        {
        }
        field(6; "Creation Date"; Date)
        {
        }
        field(7; "Created By"; Code[20])
        {
        }
        field(8; "Neutral Payments To"; Date)
        {
        }
        field(9; Comment; Boolean)
        {
        }
        field(10; "No. Series"; Code[10])
        {
        }
        field(11; "Neutral Payments From"; Date)
        {
        }
        field(12; "G/L Budget From"; Date)
        {
        }
        field(13; "G/L Budget To"; Date)
        {
        }
        field(14; "Consider Liq. Payment Terms"; Boolean)
        {
        }
        field(15; "Consider Pmt. Disc. Tol. Date"; Boolean)
        {
        }
        field(16; "Consider Pmt. Tol. Amount"; Boolean)
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

