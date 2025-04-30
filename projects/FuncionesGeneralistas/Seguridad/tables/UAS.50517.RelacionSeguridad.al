table 50517 "Relación seguridad"
{

    fields
    {
        field(1; "Grupo Origen"; Code[20])
        {
            TableRelation = Seguridad;
        }
        field(2; "Grupo Destino"; Code[20])
        {
            TableRelation = Seguridad;
        }
        field(3; "Filtro tipo documento"; Text[50])
        {
            FieldClass = FlowFilter;
            TableRelation = "Tipos documento";
        }
        field(4; "Filtro estado documento"; Text[50])
        {
            FieldClass = FlowFilter;
            TableRelation = Estados;
        }
        field(5; Cantidad; Integer)
        {
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

