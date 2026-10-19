table 50574 "Temp Liq. Journal Line"
{

    fields
    {
        field(1; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
            ToolTip = 'Specifies the value of the Journal Template Name field.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            ToolTip = 'Specifies the value of the Line No field.';
        }
        field(3; "Liquidity No."; Code[20])
        {
            Caption = 'Liquidity No.';
            ToolTip = 'Specifies the value of the Liquidity No field.';
        }
        field(4; "Due Date"; Date)
        {
            Caption = 'Due Date';
            ToolTip = 'Specifies the value of the Due Date field.';
        }
        field(5; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            ToolTip = 'Specifies the value of the Document No field.';
        }
        field(6; "Liquidity Account No."; Code[20])
        {
            Caption = 'Liquidity Account No.';
            ToolTip = 'Specifies the value of the Liquidity Account No field.';
        }
        field(7; "Source Type"; Option)
        {
            Caption = 'Source Type';
            ToolTip = 'Specifies the value of the Source Type field.';
            OptionMembers = " ",Customer,Vendor,"Liquid Funds","Neutral Expenses","Neutral Revenues","Sales Orders","Purchase Orders","Budgeted Fixed Assets","Sale of Fixed Assets";
        }
        field(8; Description; Text[50])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';
        }
        field(9; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            ToolTip = 'Specifies the value of the Currency Code field.';
        }
        field(10; "Amount (Currency)"; Decimal)
        {
            Caption = 'Amount (Currency)';
            ToolTip = 'Specifies the value of the Amount (Currency) field.';
        }
        field(13; "Discount %"; Decimal)
        {
            Caption = 'Discount %';
            ToolTip = 'Specifies the value of the Discount % field.';
        }
        field(14; "Payment Discount"; Decimal)
        {
            Caption = 'Payment Discount';
            ToolTip = 'Specifies the value of the Payment Discount field.';
        }
        field(15; "Associated Entry No."; Integer)
        {
            Caption = 'Associated Entry No.';
            ToolTip = 'Specifies the value of the Associated Entry No field.';
        }
        field(16; "Account Type"; Option)
        {
            Caption = 'Account Type';
            ToolTip = 'Specifies the value of the Account Type field.';
            OptionMembers = " ","G/L Account",Customer,Vendor,"Fixed Asset";
        }
        field(17; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
        }
        field(18; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
        }
        field(19; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            ToolTip = 'Specifies the value of the Source Code field.';
        }
        field(20; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            ToolTip = 'Specifies the value of the Journal Batch Name field.';
        }
        field(21; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            ToolTip = 'Specifies the value of the Reason Code field.';
        }
        field(22; "Recurring Method"; Option)
        {
            Caption = 'Recurring Method';
            ToolTip = 'Specifies the value of the Recurring Method field.';
            OptionMembers = ,"Fixed",Variable;
        }
        field(23; "Expiration Date"; Date)
        {
            Caption = 'Expiration Date';
            ToolTip = 'Specifies the value of the Expiration Date field.';
        }
        field(24; "Recurring Frequency"; Code[20])
        {
            Caption = 'Recurring Frequency';
            ToolTip = 'Specifies the value of the Recurring Frequency field.';
        }
        field(25; "Gen. Bus. Posting Group"; Code[10])
        {
            Caption = 'Gen. Bus. Posting Group';
            ToolTip = 'Specifies the value of the Gen. Bus. Posting Group field.';
        }
        field(26; "Gen. Prod. Posting Group"; Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field.';
        }
        field(28; "Posting No. Series"; Code[10])
        {
            Caption = 'Posting No. Series';
            ToolTip = 'Specifies the value of the Posting No. Series field.';
        }
        field(30; Amount; Decimal)
        {
            Caption = 'Amount';
            ToolTip = 'Specifies the value of the Amount field.';
        }
        field(31; "Liquidity Date"; Date)
        {
            Caption = 'Liquidity Date';
            ToolTip = 'Specifies the value of the Liquidity Date field.';
        }
        field(32; Splitted; Boolean)
        {
            Caption = 'Splitted';
            ToolTip = 'Specifies the value of the Splitted field.';
        }
        field(33; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            ToolTip = 'Specifies the value of the Posting Date field.';
        }
        field(34; "Account Number"; Code[20])
        {
            Caption = 'Account Number';
            ToolTip = 'Specifies the value of the Account Number field.';
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

