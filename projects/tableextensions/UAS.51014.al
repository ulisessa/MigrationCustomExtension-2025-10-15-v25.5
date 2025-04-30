tableextension 51014 tableextension51014 extends "Closed Cartera Doc."
{
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Bank Account No.")
        {
            Caption = 'Bank Account No.';
        }
        modify("Dealing Type")
        {
            Caption = 'Dealing Type';
        }
        modify("Payment Method Code")
        {
            Caption = 'Payment Method Code';
        }
        modify(Accepted)
        {
            OptionCaption = 'Not Required,Yes';
        }
        modify("Bill Gr./Pmt. Order No.")
        {
            Caption = 'Bill Gr./Pmt. Order No.';
        }
        modify("Account No.")
        {
            Caption = 'Account No.';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("Cust./Vendor Bank Acc. Code")
        {
            Caption = 'Cust./Vendor Bank Acc. Code';
        }
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
        }
        modify("Original Document No.")
        {
            Caption = 'Original Document No.';
        }
        field(50000; "Global dimension 3 Code"; Code[10])
        {
            CaptionClass = '1,1,3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            CaptionClass = '1,1,4';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            CaptionClass = '1,1,5';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));
        }
        field(50003; "Global dimension 6 Code"; Code[10])
        {
            CaptionClass = '1,1,6';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));
        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,1,7';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));
        }
    }
}

