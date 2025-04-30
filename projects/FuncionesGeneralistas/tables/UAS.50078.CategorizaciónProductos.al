table 50078 "Categorizacion productos"
{

    fields
    {
        field(1; "Cód. categorización"; Code[4])
        {
        }
        field(2; "Descripción"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Cód. categorización")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

