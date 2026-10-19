table 50553 "Niveles de archivo"
{
    DataPerCompany = false;

    fields
    {
        field(1; "Cód. Nivel"; Code[3])
        {
            Caption = 'Level Code';
            ToolTip = 'Specifies the value of the Level Code field.';
        }
        field(2; "Descripción Nivel"; Text[200])
        {
            Caption = 'Descripción Nivel';
            ToolTip = 'Specifies the value of the Descripción Nivel field.';
        }
        field(3; "Cantidad máx. caracteres"; Integer)
        {
            Caption = 'Cantidad máx. caracteres';
            ToolTip = 'Specifies the value of the Cantidad máx. caracteres field.';
        }
        field(4; Requerido; Boolean)
        {
            Caption = 'Requerido';
            ToolTip = 'Specifies the value of the Requerido field.';
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

