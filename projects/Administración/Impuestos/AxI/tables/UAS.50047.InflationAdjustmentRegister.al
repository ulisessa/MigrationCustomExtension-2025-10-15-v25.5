table 50047 "Inflation Adjustment Register"
{

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
            ToolTip = 'Specifies the value of the No field.';
            DataClassification = ToBeClassified;
        }
        field(2; "From date"; Date)
        {
            Caption = 'Desde fecha';
            ToolTip = 'Specifies the value of the Desde fecha field.';
            DataClassification = ToBeClassified;
        }
        field(3; "To date"; Date)
        {
            Caption = 'Hasta fecha';
            ToolTip = 'Specifies the value of the Hasta fecha field.';
            DataClassification = ToBeClassified;
        }
        field(4; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
            ToolTip = 'Specifies the value of the Creation Date field.';
            DataClassification = ToBeClassified;
        }
        field(5; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            ToolTip = 'Specifies the value of the Source Code field.';
            DataClassification = ToBeClassified;
            TableRelation = "Source Code";
        }
        field(6; "User ID"; Code[50])
        {
            Caption = 'User ID';
            ToolTip = 'Specifies the value of the User ID field.';
            DataClassification = ToBeClassified;
            //This property is currently not supported
            //TestTableRelation = false;

        }
        field(7; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            ToolTip = 'Specifies the value of the Journal Batch Name field.';
            DataClassification = ToBeClassified;
        }
        field(8; Reversed; Boolean)
        {
            Caption = 'Reversed';
            ToolTip = 'Specifies the value of the Reversed field.';
            DataClassification = ToBeClassified;
        }
        field(10700; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            ToolTip = 'Specifies the value of the Posting Date field.';
            ClosingDates = true;
            DataClassification = ToBeClassified;
        }
        field(50000; "No. documento"; Code[30])
        {
            Caption = 'Document No.';
            ToolTip = 'Specifies the value of the Document No field.';
            DataClassification = ToBeClassified;
        }
        field(50505; "Nombre libro diario"; Code[10])
        {
            Caption = 'Nombre libro diario';
            ToolTip = 'Specifies the value of the Nombre libro diario field.';
            DataClassification = ToBeClassified;
        }
        field(50598; "Usuario Anulación"; Code[20])
        {
            Caption = 'Usuario Anulación';
            ToolTip = 'Specifies the value of the Usuario Anulación field.';
            DataClassification = ToBeClassified;
        }
        field(50599; Anulado; Boolean)
        {
            Caption = 'Anulado';
            ToolTip = 'Specifies the value of the Anulado field.';
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

