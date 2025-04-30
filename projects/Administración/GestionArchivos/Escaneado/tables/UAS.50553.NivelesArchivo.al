table 50553 "Niveles de archivo"
{
    DataPerCompany = false;

    fields
    {
        field(1; "Cód. Nivel"; Code[3])
        {
        }
        field(2; "Descripción Nivel"; Text[200])
        {
        }
        field(3; "Cantidad máx. caracteres"; Integer)
        {
        }
        field(4; Requerido; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Cód. Nivel", "Descripción Nivel")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

