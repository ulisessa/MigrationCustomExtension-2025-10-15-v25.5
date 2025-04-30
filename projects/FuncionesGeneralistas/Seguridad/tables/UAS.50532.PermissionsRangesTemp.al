table 50532 "Permission Ranges Temp"
{

    fields
    {
        field(1; Objeto; Option)
        {
            OptionMembers = Tabla,Formulario,Reporte,Dataport,"Codeunit","Page";
        }
        field(2; Nro; Integer)
        {
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

