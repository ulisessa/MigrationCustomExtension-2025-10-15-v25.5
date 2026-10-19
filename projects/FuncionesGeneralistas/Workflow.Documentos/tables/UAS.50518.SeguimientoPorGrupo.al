table 50518 "Seguimiento por grupo"
{

    fields
    {
        field(1; Grupo; Code[20])
        {
            Caption = 'Grupo';
            ToolTip = 'Specifies the value of the Grupo field.';
            TableRelation = Seguridad;
        }
        field(2; "Tipo documento"; Text[100])
        {
            Caption = 'Document Type';
            ToolTip = 'Specifies the value of the Document Type field.';
            TableRelation = "Tipos documento";
        }
        field(3; "Estado documento"; Text[50])
        {
            Caption = 'Estado documento';
            ToolTip = 'Specifies the value of the Estado documento field.';
            TableRelation = Estados;
        }
        field(4; "No. form"; Integer)
        {
            Caption = 'No. form';
            ToolTip = 'Specifies the value of the No. form field.';
            TableRelation = Object.ID WHERE(Type = CONST(Report));
        }
        field(5; "Filtro grupo origen"; Code[20])
        {
            Caption = 'Filtro grupo origen';
            ToolTip = 'Specifies the value of the Filtro grupo origen field.';
            FieldClass = FlowFilter;
            TableRelation = Seguridad;
        }
        field(6; "Filtro grupo destino"; Code[20])
        {
            Caption = 'Filtro grupo destino';
            ToolTip = 'Specifies the value of the Filtro grupo destino field.';
            FieldClass = FlowFilter;
            TableRelation = Seguridad;
        }
        field(7; Cantidad; Integer)
        {
            Caption = 'Quantity';
            ToolTip = 'Specifies the value of the Quantity field.';
            CalcFormula = Count(Mensajeria WHERE("Destinatario/Grupo" = FIELD("Filtro grupo destino"),
                                                  Remitente = FIELD("Filtro grupo origen"),
                                                  "Tipo Documento" = FIELD("Tipo documento"),
                                                  Estado = FIELD("Estado documento"),
                                                  Ciudad = FIELD("Filtro ciudad")));
            FieldClass = FlowField;
        }
        field(8; "Enviar correo"; Boolean)
        {
            Caption = 'Enviar correo';
            ToolTip = 'Specifies the value of the Enviar correo field.';
        }
        field(9; "Filtro ciudad"; Code[10])
        {
            Caption = 'Filtro ciudad';
            ToolTip = 'Specifies the value of the Filtro ciudad field.';
            FieldClass = FlowFilter;
        }
    }

    keys
    {
        key(Key1; Grupo, "Tipo documento", "Estado documento")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

