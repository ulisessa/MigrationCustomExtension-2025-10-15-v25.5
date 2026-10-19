table 50118 "Seguridad cambio estados"
{

    fields
    {
        field(1; Usuario; Code[50])
        {
            Caption = 'User ID';
            ToolTip = 'Specifies the value of the User ID field.';
            TableRelation = "User Setup"."User ID";
            ValidateTableRelation = true;
        }
        field(2; "Tipo documento"; Text[50])
        {
            Caption = 'Document Type';
            ToolTip = 'Specifies the value of the Document Type field.';
            TableRelation = "Tipos documento";
        }
        field(3; "Estado original"; Text[50])
        {
            Caption = 'Estado original';
            ToolTip = 'Specifies the value of the Estado original field.';
            TableRelation = Estados;
        }
        field(4; "Estado destino"; Text[50])
        {
            Caption = 'Estado destino';
            ToolTip = 'Specifies the value of the Estado destino field.';
            TableRelation = Estados;
        }
        field(5; "Grupo destino"; Code[10])
        {
            Caption = 'Grupo destino';
            ToolTip = 'Specifies the value of the Grupo destino field.';
            TableRelation = Seguridad;
        }
        field(6; "Enviar correo"; Boolean)
        {
            Caption = 'Enviar correo';
            ToolTip = 'Specifies the value of the Enviar correo field.';
        }
        field(7; Recomendado; Boolean)
        {
            Caption = 'Recomendado';
            ToolTip = 'Specifies the value of the Recomendado field.';
        }
        field(8; "Filtro por monto"; Text[250])
        {
            Caption = 'Filtro por monto';
            ToolTip = 'Specifies the value of the Filtro por monto field.';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; Usuario, "Tipo documento", "Estado original", "Estado destino", "Grupo destino")
        {
            Clustered = true;
        }
        key(Key2; Usuario, "Tipo documento", "Estado destino", "Grupo destino")
        {
        }
    }

    fieldgroups
    {
    }

    var
        rstCambioEstados: Record "Seguridad cambio estados";

    [Scope('OnPrem')]
    procedure funCambiarEstados(codUserID: Code[50]; strTipoDocumento: Text[50]; strEstadoOrigen: Text[50]; strEstadoDestino: Text[50]): Boolean
    begin
        Clear(rstCambioEstados);
        rstCambioEstados.SetRange(Usuario, UserId);
        rstCambioEstados.SetRange("Tipo documento", strTipoDocumento);
        rstCambioEstados.SetFilter("Estado original", '%1|%2', strEstadoOrigen, '');
        rstCambioEstados.SetRange("Estado destino", strEstadoDestino);
        if rstCambioEstados.Find('-') then
            exit(true)
        else
            exit(false);
    end;
}

