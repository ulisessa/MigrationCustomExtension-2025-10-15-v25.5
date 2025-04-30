table 50520 Estados
{

    fields
    {
        field(1; Estados; Text[50])
        {
        }
        field(2; Nivel; Integer)
        {
            MaxValue = 100;
            MinValue = 0;
        }
        field(3; "Fórmula de fecha"; DateFormula)
        {
        }
        field(4; "No editable"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; Estados)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

