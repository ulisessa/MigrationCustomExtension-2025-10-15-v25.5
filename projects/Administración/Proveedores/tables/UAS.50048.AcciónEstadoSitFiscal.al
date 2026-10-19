table 50048 "Acción estado sit. fiscal"
{

    fields
    {
        field(1; "Estado de Situación fiscal"; Code[10])
        {
            Caption = 'Estado de Situación fiscal';
            ToolTip = 'Specifies the value of the Estado de Situación fiscal field.';
        }
        field(2; "Descripción"; Text[250])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';
        }
        field(3; "Acción exclusión"; Option)
        {
            Caption = 'Acción exclusión';
            ToolTip = 'Specifies the value of the Acción exclusión field.';
            BlankZero = true;
            OptionMembers = ,"Aplicar exención","No aplicar exención","Consultar al usuario";
        }
        field(4; "Acción retención"; Option)
        {
            Caption = 'Acción retención';
            ToolTip = 'Specifies the value of the Acción retención field.';
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

