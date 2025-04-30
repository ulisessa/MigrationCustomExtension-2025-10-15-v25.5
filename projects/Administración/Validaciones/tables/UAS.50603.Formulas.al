table 50603 Formulas
{

    fields
    {
        field(1; "Cód. fórmula"; Code[20])
        {
            NotBlank = false;
            TableRelation = Formulas;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(2; "Expresión"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Cód. fórmula")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

