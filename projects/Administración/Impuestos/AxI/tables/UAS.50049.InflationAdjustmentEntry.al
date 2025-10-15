table 50049 "Inflation Adjustment Entry"
{

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Posting Date"; Date)
        {
            Caption = 'Creation Date';
            DataClassification = ToBeClassified;
        }
        field(3; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = ToBeClassified;
            //This property is currently not supported
            //TestTableRelation = false;

        }
        field(4; "Document No."; Code[30])
        {
            Caption = 'No. documento';
            DataClassification = ToBeClassified;
        }
        field(5; "Account No."; Code[10])
        {
            Caption = 'No. cuenta';
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No.";
        }
        field(7; Amount; Decimal)
        {
            Caption = 'Importe';
            DataClassification = ToBeClassified;
        }
        field(8; "Job No."; Code[10])
        {
            Caption = 'No. proyecto';
            DataClassification = ToBeClassified;
        }
        field(9; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(10; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(11; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            DataClassification = ToBeClassified;

        }
        field(12; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            DataClassification = ToBeClassified;

        }
        field(13; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            DataClassification = ToBeClassified;

        }
        field(14; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 6 Code';
            DataClassification = ToBeClassified;

        }
        field(15; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 7 Code';
            DataClassification = ToBeClassified;

        }
        field(16; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
        field(20; "Adjustment Origin Account No."; Code[10])
        {
            Caption = 'No. cuenta origen ajuste';
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No.";
        }
        field(21; "Adjustment Dest. Account No."; Code[10])
        {
            Caption = 'No. cuenta destino ajuste';
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No.";
        }
        field(100; "Starting Inflation Index"; Decimal)
        {
            Caption = 'Indice inflación inicial';
            DataClassification = ToBeClassified;
        }
        field(101; "Ending Inflation Index"; Decimal)
        {
            Caption = 'Indice inflación final';
            DataClassification = ToBeClassified;
        }
        field(102; "Inflation Amount"; Decimal)
        {
            Caption = 'Importe inflación';
            DataClassification = ToBeClassified;
        }
        field(103; "Inflation Adjustment Quotient"; Decimal)
        {
            Caption = 'Cociente de ajuste por inflación';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

