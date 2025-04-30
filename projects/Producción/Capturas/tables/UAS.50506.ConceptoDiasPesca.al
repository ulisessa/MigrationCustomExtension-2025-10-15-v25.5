table 50506 "Concepto Días Pesca"
{
    // IBdos Argentina - USS - 111102 - Adición Arbumasa


    fields
    {
        field(1; Concepto; Text[30])
        {
        }
        field(2; "Día"; Boolean)
        {
        }
        field(3; "Dias Pesca"; Integer)
        {
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

