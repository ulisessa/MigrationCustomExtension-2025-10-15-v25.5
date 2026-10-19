table 58051 Workday
{
    Caption = 'Workday';

    fields
    {
        field(1; "Workday code"; Code[10])
        {
            Caption = 'Workday code';
            ToolTip = 'Specifies the value of the Workday code field.';
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';
        }
        field(3; "Workday usual limit"; Decimal)
        {
            Caption = 'Workday usual limit';
            ToolTip = 'Specifies the value of the Workday usual limit field.';
        }
        field(4; "Sundays complete"; Boolean)
        {
            Caption = 'Sundays complete';
            ToolTip = 'Specifies the value of the Sundays complete field.';
        }
        field(5; "Weekday normal hours"; Decimal)
        {
            Caption = 'Weekday normal hours';
            ToolTip = 'Specifies the value of the Weekday normal hours field.';
            DataClassification = ToBeClassified;
        }
        field(6; "Saturday normal hours"; Decimal)
        {
            Caption = 'Saturday normal hours';
            ToolTip = 'Specifies the value of the Saturday normal hours field.';
            DataClassification = ToBeClassified;
        }
        field(7; "Sunday normal hours"; Decimal)
        {
            Caption = 'Sunday normal hours';
            ToolTip = 'Specifies the value of the Sunday normal hours field.';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Workday code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

