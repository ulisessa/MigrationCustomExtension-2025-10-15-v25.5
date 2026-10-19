table 50431 "Concepto proyecto"
{
    DataCaptionFields = "Código", Nombre;

    fields
    {
        field(1; "Código"; Code[10])
        {
            Caption = 'Code';
            ToolTip = 'Specifies the value of the Code field.';
            NotBlank = true;
        }
        field(2; Nombre; Text[50])
        {
            Caption = 'Name';
            ToolTip = 'Specifies the value of the Name field.';
        }
        field(6; "Cód. consolidación"; Code[10])
        {
            Caption = 'Consolidation Code';
            ToolTip = 'Specifies the value of the Consolidation Code field.';
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

