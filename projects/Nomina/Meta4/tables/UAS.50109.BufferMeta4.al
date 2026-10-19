table 50109 "Buffer Meta4"
{

    fields
    {
        field(1; "No. mov."; Integer)
        {
            Caption = 'No. mov.';
            ToolTip = 'Specifies the value of the No. mov field.';
            AutoIncrement = false;
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(2; "Id. Sociedad"; Code[10])
        {
            Caption = 'Id. Sociedad';
            ToolTip = 'Specifies the value of the Id. Sociedad field.';
        }
        field(3; "Id. Empleado"; Code[30])
        {
            Caption = 'Id. Empleado';
            ToolTip = 'Specifies the value of the Id. Empleado field.';
            TableRelation = Employee WHERE("No." = FIELD("Id. Empleado"));
        }
        field(4; "Cod. cuenta"; Code[20])
        {
            Caption = 'Cod. cuenta';
            ToolTip = 'Specifies the value of the Cod. cuenta field.';
            TableRelation = "G/L Account"."No.";
        }
        field(5; Proyecto; Code[20])
        {
            Caption = 'Proyecto';
            ToolTip = 'Specifies the value of the Proyecto field.';
        }
        field(6; "Id. Empresa"; Code[10])
        {
            Caption = 'Id. Empresa';
            ToolTip = 'Specifies the value of the Id. Empresa field.';
        }
        field(7; "Fecha pago"; Date)
        {
            Caption = 'Fecha pago';
            ToolTip = 'Specifies the value of the Fecha pago field.';
        }
        field(8; "Fecha imputacion"; Date)
        {
            Caption = 'Fecha imputacion';
            ToolTip = 'Specifies the value of the Fecha imputacion field.';
        }
        field(9; "Tipo imputacion"; Code[10])
        {
            Caption = 'Tipo imputacion';
            ToolTip = 'Specifies the value of the Tipo imputacion field.';
        }
        field(10; "Id. categoria"; Code[10])
        {
            Caption = 'Id. categoria';
            ToolTip = 'Specifies the value of the Id. categoria field.';
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('CATEGORIAS'));
        }
        field(11; "Nombre categoria"; Text[100])
        {
            Caption = 'Nombre categoria';
            ToolTip = 'Specifies the value of the Nombre categoria field.';
        }
        field(12; "Id. puesto"; Code[10])
        {
            Caption = 'Id. puesto';
            ToolTip = 'Specifies the value of the Id. puesto field.';
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('PUESTOS'));
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
        field(16; "Fecha sicore"; Date)
        {
            Caption = 'Fecha sicore';
            ToolTip = 'Specifies the value of the Fecha sicore field.';
        }
        field(17; Importe; Decimal)
        {
            Caption = 'Importe';
            ToolTip = 'Specifies the value of the Importe field.';
        }
        field(18; Generado; Boolean)
        {
            Caption = 'Generado';
            ToolTip = 'Specifies the value of the Generado field.';
        }
        field(19; "Fecha de importacion"; DateTime)
        {
            Caption = 'Fecha de importacion';
            ToolTip = 'Specifies the value of the Fecha de importacion field.';
        }
        field(20; Buque; Code[10])
        {
            Caption = 'Buque';
            ToolTip = 'Specifies the value of the Buque field.';
        }
        field(21; Marea; Code[10])
        {
            Caption = 'Marea';
            ToolTip = 'Specifies the value of the Marea field.';
        }
        field(22; Costo; Code[10])
        {
            Caption = 'Costo';
            ToolTip = 'Specifies the value of the Costo field.';
        }
        field(23; "Proyecto original"; Code[20])
        {
            Caption = 'Proyecto original';
            ToolTip = 'Specifies the value of the Proyecto original field.';
        }
        field(24; "Cuenta original"; Code[20])
        {
            Caption = 'Cuenta original';
            ToolTip = 'Specifies the value of the Cuenta original field.';
        }
        field(25; "Registro real"; Boolean)
        {
            Caption = 'Registro real';
            ToolTip = 'Specifies the value of the Registro real field.';
        }
        field(26; "Fecha registro"; Date)
        {
            Caption = 'Fecha registro';
            ToolTip = 'Specifies the value of the Fecha registro field.';
        }
        field(27; "Tipo cambio"; Decimal)
        {
            Caption = 'Tipo cambio';
            ToolTip = 'Specifies the value of the Tipo cambio field.';
            DataClassification = ToBeClassified;
        }
        field(28; "Tipo imputacion auxiliar"; Code[10])
        {
            Caption = 'Tipo imputacion auxiliar';
            ToolTip = 'Specifies the value of the Tipo imputacion auxiliar field.';
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

