table 50517 "Relación seguridad"
{

    fields
    {
        field(1; "Grupo Origen"; Code[20])
        {
            Caption = 'Grupo Origen';
            ToolTip = 'Specifies the value of the Grupo Origen field.';
            TableRelation = Seguridad;
        }
        field(2; "Grupo Destino"; Code[20])
        {
            Caption = 'Grupo Destino';
            ToolTip = 'Specifies the value of the Grupo Destino field.';
            TableRelation = Seguridad;
        }
        field(3; "Filtro tipo documento"; Text[50])
        {
            Caption = 'Filtro tipo documento';
            ToolTip = 'Specifies the value of the Filtro tipo documento field.';
            FieldClass = FlowFilter;
            TableRelation = "Tipos documento";
        }
        field(4; "Filtro estado documento"; Text[50])
        {
            Caption = 'Filtro estado documento';
            ToolTip = 'Specifies the value of the Filtro estado documento field.';
            FieldClass = FlowFilter;
            TableRelation = Estados;
        }
        field(5; Cantidad; Integer)
        {
            Caption = 'Quantity';
            ToolTip = 'Specifies the value of the Quantity field.';
            CalcFormula = Count(Mensajeria WHERE("Destinatario/Grupo" = FIELD("Grupo Destino"),
                                                  Remitente = FILTER(''),
                                                  Remitente = FIELD("Grupo Origen"),
                                                  "Tipo Documento" = FIELD("Filtro tipo documento"),
                                                  Estado = FIELD("Filtro estado documento")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Grupo Origen", "Grupo Destino")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

