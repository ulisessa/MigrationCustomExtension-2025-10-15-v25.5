table 50431 "Concepto proyecto"
{
    DataCaptionFields = "Código", Nombre;

    fields
    {
        field(1; "Código"; Code[10])
        {
            NotBlank = true;
        }
        field(2; Nombre; Text[50])
        {
        }
        field(6; "Cód. consolidación"; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Código")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Código", Nombre)
        {
        }
    }
}

