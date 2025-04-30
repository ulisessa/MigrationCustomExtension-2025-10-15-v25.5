table 50047 "Inflation Adjustment Register"
{

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(2; "From date"; Date)
        {
            Caption = 'Desde fecha';
            DataClassification = ToBeClassified;
        }
        field(3; "To date"; Date)
        {
            Caption = 'Hasta fecha';
            DataClassification = ToBeClassified;
        }
        field(4; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
            DataClassification = ToBeClassified;
        }
        field(5; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            DataClassification = ToBeClassified;
            TableRelation = "Source Code";
        }
        field(6; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = ToBeClassified;
            //This property is currently not supported
            //TestTableRelation = false;

        }
        field(7; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            DataClassification = ToBeClassified;
        }
        field(8; Reversed; Boolean)
        {
            Caption = 'Reversed';
            DataClassification = ToBeClassified;
        }
        field(10700; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            ClosingDates = true;
            DataClassification = ToBeClassified;
        }
        field(50000; "No. documento"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50505; "Nombre libro diario"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50598; "Usuario Anulación"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50599; Anulado; Boolean)
        {
            DataClassification = ToBeClassified;
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

