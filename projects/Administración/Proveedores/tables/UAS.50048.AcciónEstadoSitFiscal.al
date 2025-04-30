table 50048 "Acción estado sit. fiscal"
{

    fields
    {
        field(1; "Estado de Situación fiscal"; Code[10])
        {
        }
        field(2; "Descripción"; Text[250])
        {
        }
        field(3; "Acción exclusión"; Option)
        {
            BlankZero = true;
            OptionMembers = ,"Aplicar exención","No aplicar exención","Consultar al usuario";
        }
        field(4; "Acción retención"; Option)
        {
            OptionMembers = " ","Aplicar 100%","Aplicar 80%ó50%",,"Consultar al usuario","Consultar al usuario y aplicar el 100%","Consultar al usuario y aplicar el 80%ó50%";
        }
    }

    keys
    {
        key(Key1; "Estado de Situación fiscal")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Estado de Situación fiscal", "Descripción")
        {
        }
    }
}

