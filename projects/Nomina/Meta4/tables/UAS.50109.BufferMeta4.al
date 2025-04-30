table 50109 "Buffer Meta4"
{

    fields
    {
        field(1; "No. mov."; Integer)
        {
            AutoIncrement = false;
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(2; "Id. Sociedad"; Code[10])
        {
        }
        field(3; "Id. Empleado"; Code[30])
        {
            TableRelation = Employee WHERE("No." = FIELD("Id. Empleado"));
        }
        field(4; "Cod. cuenta"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(5; Proyecto; Code[20])
        {
        }
        field(6; "Id. Empresa"; Code[10])
        {
        }
        field(7; "Fecha pago"; Date)
        {
        }
        field(8; "Fecha imputacion"; Date)
        {
        }
        field(9; "Tipo imputacion"; Code[10])
        {
        }
        field(10; "Id. categoria"; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('CATEGORIAS'));
        }
        field(11; "Nombre categoria"; Text[100])
        {
        }
        field(12; "Id. puesto"; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('PUESTOS'));
        }
        field(13; "Nombre puesto"; Text[100])
        {
        }
        field(14; "Id. nacionalidad"; Code[10])
        {
        }
        field(16; "Fecha sicore"; Date)
        {
        }
        field(17; Importe; Decimal)
        {
        }
        field(18; Generado; Boolean)
        {
        }
        field(19; "Fecha de importacion"; DateTime)
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
        field(23; "Proyecto original"; Code[20])
        {
        }
        field(24; "Cuenta original"; Code[20])
        {
        }
        field(25; "Registro real"; Boolean)
        {
        }
        field(26; "Fecha registro"; Date)
        {
        }
        field(27; "Tipo cambio"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Tipo imputacion auxiliar"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Id. Sociedad", "Id. Empleado", "Cod. cuenta", Proyecto, "Id. Empresa", "Fecha pago", "Fecha imputacion", "Tipo imputacion", "Id. categoria", "Id. puesto", "Id. nacionalidad", "Fecha sicore", "Fecha de importacion")
        {
            Clustered = true;
            SumIndexFields = Importe;
        }
        key(Key2; "Id. Empleado", "Fecha imputacion", "Fecha pago", "Tipo imputacion", "Cod. cuenta")
        {
        }
        key(Key3; "No. mov.")
        {
        }
        key(Key4; Proyecto, Importe)
        {
            SumIndexFields = Importe;
        }
        key(Key5; "Cod. cuenta", Importe)
        {
        }
        key(Key6; "Fecha de importacion")
        {
        }
        key(Key7; Proyecto, Costo)
        {
        }
        key(Key8; "Id. Sociedad", "Id. Empleado", Proyecto, "Id. Empresa", Importe)
        {
            SumIndexFields = Importe;
        }
        key(Key9; "Fecha sicore")
        {
        }
        key(Key10; "Id. Sociedad", "Id. Empleado", "Cod. cuenta", "Proyecto original", "Id. Empresa")
        {
            SQLIndex = "Id. Sociedad", "Id. Empleado", "Cod. cuenta", "Proyecto original", "Id. Empresa";
        }
    }

    fieldgroups
    {
    }
}

