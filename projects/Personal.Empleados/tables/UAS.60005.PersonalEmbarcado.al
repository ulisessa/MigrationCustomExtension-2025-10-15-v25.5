table 60005 "Personal embarcado"
{

    fields
    {
        field(2; "Id. Sociedad"; Code[10])
        {
        }
        field(3; "Id. Empleado"; Code[20])
        {
            TableRelation = Resource WHERE("No." = FIELD("Id. Empleado"),
                                            Type = CONST(Person));
        }
        field(5; Proyecto; Code[20])
        {
            TableRelation = Job;
        }
        field(6; "Id. Empresa"; Code[10])
        {
        }
        field(10; "Id. categoría"; Code[10])
        {
        }
        field(11; "Nombre categoría"; Text[100])
        {
        }
        field(12; "Id. puesto"; Code[10])
        {
        }
        field(13; "Nombre puesto"; Text[100])
        {
        }
        field(14; "Id. nacionalidad"; Code[10])
        {
        }
        field(17; Importe; Decimal)
        {
            CalcFormula = Sum("Buffer Meta4".Importe WHERE("Id. Sociedad" = FIELD("Id. Sociedad"),
                                                            "Id. Empleado" = FIELD("Id. Empleado"),
                                                            Proyecto = FIELD(Proyecto),
                                                            "Id. Empresa" = FIELD("Id. Empresa"),
                                                            Importe = FILTER(> 0)));
            FieldClass = FlowField;
        }
        field(19; "Fecha de importación"; DateTime)
        {
        }
        field(20; Buque; Code[10])
        {
        }
        field(21; Marea; Code[10])
        {
        }
        field(22; Costo; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Id. Sociedad", "Id. Empleado", Proyecto)
        {
            Clustered = true;
        }
        key(Key2; Proyecto)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        TestField("Id. Empleado");
    end;
}

