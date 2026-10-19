table 50603 Formulas
{

    fields
    {
        field(1; "Cód. fórmula"; Code[20])
        {
            Caption = 'Cód. fórmula';
            ToolTip = 'Specifies the value of the Cód. fórmula field.';
            NotBlank = false;
            TableRelation = Formulas;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(2; "Expresión"; Text[250])
        {
            Caption = 'Expresión';
            ToolTip = 'Specifies the value of the Expresión field.';
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

