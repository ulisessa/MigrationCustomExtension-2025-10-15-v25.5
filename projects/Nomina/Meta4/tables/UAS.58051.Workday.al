table 58051 Workday
{
    Caption = 'Workday';

    fields
    {
        field(1; "Workday code"; Code[10])
        {
            Caption = 'Workday code';
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(3; "Workday usual limit"; Decimal)
        {
            Caption = 'Workday usual limit';
        }
        field(4; "Sundays complete"; Boolean)
        {
            Caption = 'Sundays complete';
        }
        field(5; "Weekday normal hours"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Saturday normal hours"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Sunday normal hours"; Decimal)
        {
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

