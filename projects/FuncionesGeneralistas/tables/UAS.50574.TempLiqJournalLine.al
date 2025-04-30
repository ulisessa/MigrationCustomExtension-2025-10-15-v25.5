table 50574 "Temp Liq. Journal Line"
{

    fields
    {
        field(1; "Journal Template Name"; Code[10])
        {
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; "Liquidity No."; Code[20])
        {
        }
        field(4; "Due Date"; Date)
        {
        }
        field(5; "Document No."; Code[20])
        {
        }
        field(6; "Liquidity Account No."; Code[20])
        {
        }
        field(7; "Source Type"; Option)
        {
            OptionMembers = " ",Customer,Vendor,"Liquid Funds","Neutral Expenses","Neutral Revenues","Sales Orders","Purchase Orders","Budgeted Fixed Assets","Sale of Fixed Assets";
        }
        field(8; Description; Text[50])
        {
        }
        field(9; "Currency Code"; Code[10])
        {
        }
        field(10; "Amount (Currency)"; Decimal)
        {
        }
        field(13; "Discount %"; Decimal)
        {
        }
        field(14; "Payment Discount"; Decimal)
        {
        }
        field(15; "Associated Entry No."; Integer)
        {
        }
        field(16; "Account Type"; Option)
        {
            OptionMembers = " ","G/L Account",Customer,Vendor,"Fixed Asset";
        }
        field(17; "Shortcut Dimension 2 Code"; Code[20])
        {
        }
        field(18; "Shortcut Dimension 1 Code"; Code[20])
        {
        }
        field(19; "Source Code"; Code[10])
        {
        }
        field(20; "Journal Batch Name"; Code[10])
        {
        }
        field(21; "Reason Code"; Code[10])
        {
        }
        field(22; "Recurring Method"; Option)
        {
            OptionMembers = ,"Fixed",Variable;
        }
        field(23; "Expiration Date"; Date)
        {
        }
        field(24; "Recurring Frequency"; Code[20])
        {
        }
        field(25; "Gen. Bus. Posting Group"; Code[10])
        {
        }
        field(26; "Gen. Prod. Posting Group"; Code[10])
        {
        }
        field(28; "Posting No. Series"; Code[10])
        {
        }
        field(30; Amount; Decimal)
        {
        }
        field(31; "Liquidity Date"; Date)
        {
        }
        field(32; Splitted; Boolean)
        {
        }
        field(33; "Posting Date"; Date)
        {
        }
        field(34; "Account Number"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Journal Template Name", "Journal Batch Name", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

