table 50004 "Inflation index"
{

    fields
    {
        field(1; Year; Integer)
        {
            Caption = 'Año';
            ToolTip = 'Specifies the value of the Año field.';
            DataClassification = CustomerContent;
        }
        field(2; Month; Integer)
        {
            Caption = 'Mes';
            ToolTip = 'Specifies the value of the Mes field.';
            DataClassification = CustomerContent;
        }
        field(3; "Inflation index"; Decimal)
        {
            Caption = 'Öndice de inflación';
            ToolTip = 'Specifies the value of the Öndice de inflación field.';
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

