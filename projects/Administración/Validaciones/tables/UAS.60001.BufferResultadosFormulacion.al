table 60001 "Buffer resultados formulación"
{

    fields
    {
        field(1; "Cód. fórmula"; Code[20])
        {
            Caption = 'Cód. fórmula';
            ToolTip = 'Specifies the value of the Cód. fórmula field.';
        }
        field(2; "Cód. maestro"; Code[20])
        {
            Caption = 'Cód. maestro';
            ToolTip = 'Specifies the value of the Cód. maestro field.';
        }
        field(3; "No. línea"; Integer)
        {
            Caption = 'Line No.';
            ToolTip = 'Specifies the value of the Line No field.';
        }
        field(4; Referencia; Text[30])
        {
            Caption = 'Referencia';
            ToolTip = 'Specifies the value of the Referencia field.';
        }
        field(5; Resultado; Code[20])
        {
            Caption = 'Resultado';
            ToolTip = 'Specifies the value of the Resultado field.';
            TableRelation = Resource."No." WHERE (Type = CONST (Person));
        }
        field(6; Nivel; Integer)
        {
            Caption = 'Nivel';
            ToolTip = 'Specifies the value of the Nivel field.';
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

