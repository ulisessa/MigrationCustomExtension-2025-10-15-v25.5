table 60001 "Buffer resultados formulación"
{

    fields
    {
        field(1; "Cód. fórmula"; Code[20])
        {
        }
        field(2; "Cód. maestro"; Code[20])
        {
        }
        field(3; "No. línea"; Integer)
        {
        }
        field(4; Referencia; Text[30])
        {
        }
        field(5; Resultado; Code[20])
        {
            TableRelation = Resource."No." WHERE (Type = CONST (Person));
        }
        field(6; Nivel; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Cód. fórmula", "Cód. maestro", "No. línea")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

