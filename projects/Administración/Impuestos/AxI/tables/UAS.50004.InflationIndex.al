table 50004 "Inflation index"
{

    fields
    {
        field(1; Year; Integer)
        {
            Caption = 'Año';
            DataClassification = CustomerContent;
        }
        field(2; Month; Integer)
        {
            Caption = 'Mes';
            DataClassification = CustomerContent;
        }
        field(3; "Inflation index"; Decimal)
        {
            Caption = 'Öndice de inflación';
            DataClassification = CustomerContent;
            DecimalPlaces = 2 : 6;
        }
    }

    keys
    {
        key(Key1; Year, Month)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

