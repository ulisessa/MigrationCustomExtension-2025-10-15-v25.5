table 50049 "Inflation Adjustment Entry"
{

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'No.';
            ToolTip = 'Specifies the value of the No field.';
            DataClassification = ToBeClassified;
        }
        field(2; "Posting Date"; Date)
        {
            Caption = 'Creation Date';
            ToolTip = 'Specifies the value of the Creation Date field.';
            DataClassification = ToBeClassified;
        }
        field(3; "User ID"; Code[50])
        {
            Caption = 'User ID';
            ToolTip = 'Specifies the value of the User ID field.';
            DataClassification = ToBeClassified;
            //This property is currently not supported
            //TestTableRelation = false;

        }
        field(4; "Document No."; Code[30])
        {
            Caption = 'Document No.';
            ToolTip = 'Specifies the value of the Document No field.';
            DataClassification = ToBeClassified;
        }
        field(5; "Account No."; Code[10])
        {
            Caption = 'No. cuenta';
            ToolTip = 'Specifies the value of the No. cuenta field.';
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No.";
        }
        field(7; Amount; Decimal)
        {
            Caption = 'Importe';
            ToolTip = 'Specifies the value of the Importe field.';
            DataClassification = ToBeClassified;
        }
        field(8; "Job No."; Code[10])
        {
            Caption = 'Job No.';
            ToolTip = 'Specifies the value of the Job No field.';
            DataClassification = ToBeClassified;
        }
        field(9; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(10; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(11; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
            DataClassification = ToBeClassified;

        }
        field(12; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
            DataClassification = ToBeClassified;

        }
        field(13; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 5 Code field.';
            DataClassification = ToBeClassified;

        }
        field(14; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 6 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 6 Code field.';
            DataClassification = ToBeClassified;

        }
        field(15; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 7 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 7 Code field.';
            DataClassification = ToBeClassified;

        }
        field(16; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            ToolTip = 'Specifies the value of the Dimension Set ID field.';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
        field(20; "Adjustment Origin Account No."; Code[10])
        {
            Caption = 'No. cuenta origen ajuste';
            ToolTip = 'Specifies the value of the No. cuenta origen ajuste field.';
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No.";
        }
        field(21; "Adjustment Dest. Account No."; Code[10])
        {
            Caption = 'No. cuenta destino ajuste';
            ToolTip = 'Specifies the value of the No. cuenta destino ajuste field.';
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No.";
        }
        field(100; "Starting Inflation Index"; Decimal)
        {
            Caption = 'Indice inflación inicial';
            ToolTip = 'Specifies the value of the Indice inflación inicial field.';
            DataClassification = ToBeClassified;
        }
        field(101; "Ending Inflation Index"; Decimal)
        {
            Caption = 'Indice inflación final';
            ToolTip = 'Specifies the value of the Indice inflación final field.';
            DataClassification = ToBeClassified;
        }
        field(102; "Inflation Amount"; Decimal)
        {
            Caption = 'Importe inflación';
            ToolTip = 'Specifies the value of the Importe inflación field.';
            DataClassification = ToBeClassified;
        }
        field(103; "Inflation Adjustment Quotient"; Decimal)
        {
            Caption = 'Cociente de ajuste por inflación';
            ToolTip = 'Specifies the value of the Cociente de ajuste por inflación field.';
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

