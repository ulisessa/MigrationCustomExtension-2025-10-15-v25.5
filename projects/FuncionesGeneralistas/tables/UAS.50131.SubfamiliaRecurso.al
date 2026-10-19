table 50131 "Subfamilia recurso"
{

    fields
    {
        field(1; "Familia recurso"; Code[10])
        {
            Caption = 'Familia recurso';
            ToolTip = 'Specifies the value of the Familia recurso field.';
            NotBlank = true;
        }
        field(2; "Cód. subfamilia recurso"; Code[5])
        {
            Caption = 'Cód. subfamilia recurso';
            ToolTip = 'Specifies the value of the Cód. subfamilia recurso field.';
            NotBlank = true;
        }
        field(3; "Nombre subfamilia recurso"; Text[50])
        {
            Caption = 'Nombre subfamilia recurso';
            ToolTip = 'Specifies the value of the Nombre subfamilia recurso field.';
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

