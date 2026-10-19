table 50532 "Permission Ranges Temp"
{

    fields
    {
        field(1; Objeto; Option)
        {
            Caption = 'Objeto';
            ToolTip = 'Specifies the value of the Objeto field.';
            OptionMembers = Tabla,Formulario,Reporte,Dataport,"Codeunit","Page";
        }
        field(2; Nro; Integer)
        {
            Caption = 'Nro';
            ToolTip = 'Specifies the value of the Nro field.';
        }
    }

    keys
    {
        key(Key1; Objeto, Nro)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

