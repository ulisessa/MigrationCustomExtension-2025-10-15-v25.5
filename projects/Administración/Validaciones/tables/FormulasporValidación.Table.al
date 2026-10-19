table 50604 "Formulas por Validación"
{

    fields
    {
        field(1; "Cód. fórmula"; Code[20])
        {
            Caption = 'Cód. fórmula';
            ToolTip = 'Specifies the value of the Cód. fórmula field.';
            NotBlank = true;
            TableRelation = Formulas;
        }
        field(2; "Validación"; Code[20])
        {
            Caption = 'Validación';
            ToolTip = 'Specifies the value of the Validación field.';
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

