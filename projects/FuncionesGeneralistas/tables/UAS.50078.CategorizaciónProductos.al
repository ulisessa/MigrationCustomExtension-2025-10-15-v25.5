table 50078 "Categorizacion productos"
{

    fields
    {
        field(1; "Cód. categorización"; Code[4])
        {
            Caption = 'Cód. categorización';
            ToolTip = 'Specifies the value of the Cód. categorización field.';
        }
        field(2; "Descripción"; Text[250])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';
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

