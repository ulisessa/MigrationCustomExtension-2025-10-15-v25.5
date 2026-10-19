table 50506 "Concepto Días Pesca"
{
    // IBdos Argentina - USS - 111102 - Adición Arbumasa


    fields
    {
        field(1; Concepto; Text[30])
        {
            Caption = 'Concepto';
            ToolTip = 'Specifies the value of the Concepto field.';
        }
        field(2; "Día"; Boolean)
        {
            Caption = 'Day';
            ToolTip = 'Specifies the value of the Day field.';
        }
        field(3; "Dias Pesca"; Integer)
        {
            Caption = 'Dias Pesca';
            ToolTip = 'Specifies the value of the Dias Pesca field.';
        }
    }

    keys
    {
        key(Key1; Concepto)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

