table 60005 "Personal embarcado"
{

    fields
    {
        field(2; "Id. Sociedad"; Code[10])
        {
            Caption = 'Id. Sociedad';
            ToolTip = 'Specifies the value of the Id. Sociedad field.';
        }
        field(3; "Id. Empleado"; Code[20])
        {
            Caption = 'Id. Empleado';
            ToolTip = 'Specifies the value of the Id. Empleado field.';
            TableRelation = Resource WHERE("No." = FIELD("Id. Empleado"),
                                            Type = CONST(Person));
        }
        field(5; Proyecto; Code[20])
        {
            Caption = 'Proyecto';
            ToolTip = 'Specifies the value of the Proyecto field.';
            TableRelation = Job;
        }
        field(6; "Id. Empresa"; Code[10])
        {
            Caption = 'Id. Empresa';
            ToolTip = 'Specifies the value of the Id. Empresa field.';
        }
        field(10; "Id. categoría"; Code[10])
        {
            Caption = 'Id. categoría';
            ToolTip = 'Specifies the value of the Id. categoría field.';
        }
        field(11; "Nombre categoría"; Text[100])
        {
            Caption = 'Nombre categoría';
            ToolTip = 'Specifies the value of the Nombre categoría field.';
        }
        field(12; "Id. puesto"; Code[10])
        {
            Caption = 'Id. puesto';
            ToolTip = 'Specifies the value of the Id. puesto field.';
        }
        field(13; "Nombre puesto"; Text[100])
        {
            Caption = 'Nombre puesto';
            ToolTip = 'Specifies the value of the Nombre puesto field.';
        }
        field(14; "Id. nacionalidad"; Code[10])
        {
            Caption = 'Id. nacionalidad';
            ToolTip = 'Specifies the value of the Id. nacionalidad field.';
        }
        field(17; Importe; Decimal)
        {
            Caption = 'Importe';
            ToolTip = 'Specifies the value of the Importe field.';
            CalcFormula = Sum("Buffer Meta4".Importe WHERE("Id. Sociedad" = FIELD("Id. Sociedad"),
                                                            "Id. Empleado" = FIELD("Id. Empleado"),
                                                            Proyecto = FIELD(Proyecto),
                                                            "Id. Empresa" = FIELD("Id. Empresa"),
                                                            Importe = FILTER(> 0)));
            FieldClass = FlowField;
        }
        field(19; "Fecha de importación"; DateTime)
        {
            Caption = 'Import date';
            ToolTip = 'Specifies the value of the Import date field.';
        }
        field(20; Buque; Code[10])
        {
            Caption = 'Buque';
            ToolTip = 'Specifies the value of the Buque field.';
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(21; Marea; Code[10])
        {
            Caption = 'Marea';
            ToolTip = 'Specifies the value of the Marea field.';
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(22; Costo; Code[10])
        {
            Caption = 'Costo';
            ToolTip = 'Specifies the value of the Costo field.';
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

