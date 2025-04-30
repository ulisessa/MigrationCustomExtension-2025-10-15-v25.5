table 50131 "Subfamilia recurso"
{

    fields
    {
        field(1; "Familia recurso"; Code[10])
        {
            NotBlank = true;
        }
        field(2; "Cód. subfamilia recurso"; Code[5])
        {
            NotBlank = true;
        }
        field(3; "Nombre subfamilia recurso"; Text[50])
        {
        }
    }

    keys
    {
        key(Key1; "Familia recurso", "Cód. subfamilia recurso")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

