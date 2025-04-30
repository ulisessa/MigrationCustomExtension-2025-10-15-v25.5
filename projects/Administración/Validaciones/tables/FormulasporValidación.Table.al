table 50604 "Formulas por Validación"
{
    DrillDownPageID = "Lista formula validacion";
    LookupPageID = "Lista formula validacion";

    fields
    {
        field(1; "Cód. fórmula"; Code[20])
        {
            NotBlank = true;
            TableRelation = Formulas;
        }
        field(2; "Validación"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Maestro validaciones";
        }
    }

    keys
    {
        key(Key1; "Cód. fórmula", "Validación")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

