table 50518 "Seguimiento por grupo"
{

    fields
    {
        field(1; Grupo; Code[20])
        {
            TableRelation = Seguridad;
        }
        field(2; "Tipo documento"; Text[100])
        {
            TableRelation = "Tipos documento";
        }
        field(3; "Estado documento"; Text[50])
        {
            TableRelation = Estados;
        }
        field(4; "No. form"; Integer)
        {
            TableRelation = Object.ID WHERE(Type = CONST(Report));
        }
        field(5; "Filtro grupo origen"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Seguridad;
        }
        field(6; "Filtro grupo destino"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Seguridad;
        }
        field(7; Cantidad; Integer)
        {
            CalcFormula = Count(Mensajeria WHERE("Destinatario/Grupo" = FIELD("Filtro grupo destino"),
                                                  Remitente = FIELD("Filtro grupo origen"),
                                                  "Tipo Documento" = FIELD("Tipo documento"),
                                                  Estado = FIELD("Estado documento"),
                                                  Ciudad = FIELD("Filtro ciudad")));
            FieldClass = FlowField;
        }
        field(8; "Enviar correo"; Boolean)
        {
        }
        field(9; "Filtro ciudad"; Code[10])
        {
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

