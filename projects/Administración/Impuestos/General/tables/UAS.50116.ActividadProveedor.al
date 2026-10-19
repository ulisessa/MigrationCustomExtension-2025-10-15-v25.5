table 50116 "Actividad proveedor"
{
    DataPerCompany = false;

    fields
    {
        field(1; "No. proveedor"; Code[20])
        {
            Caption = 'Vendor No.';
            ToolTip = 'Specifies the value of the Vendor No field.';
            TableRelation = Vendor."No.";
        }
        field(2; "No. actividad"; Code[10])
        {
            Caption = 'No. actividad';
            ToolTip = 'Specifies the value of the No. actividad field.';
            TableRelation = "Actividad AFIP"."No. actividad";
        }
        field(3; "Nombre proveedor"; Text[200])
        {
            Caption = 'Nombre proveedor';
            ToolTip = 'Specifies the value of the Nombre proveedor field.';
            CalcFormula = Lookup(Vendor.Name WHERE("No." = FIELD("No. proveedor")));
            FieldClass = FlowField;
        }
        field(4; "Nombre actividad"; Text[250])
        {
            Caption = 'Nombre actividad';
            ToolTip = 'Specifies the value of the Nombre actividad field.';
            CalcFormula = Lookup("Actividad AFIP".Nombre WHERE("No. actividad" = FIELD("No. actividad")));
            FieldClass = FlowField;
        }
        field(5; "Fecha alta"; Date)
        {
            Caption = 'Hiring date';
            ToolTip = 'Specifies the value of the Hiring date field.';
        }
        field(6; "Fecha baja"; Date)
        {
            Caption = 'Fecha baja';
            ToolTip = 'Specifies the value of the Fecha baja field.';
        }
        field(7; "Tipo actividad"; Option)
        {
            Caption = 'Tipo actividad';
            ToolTip = 'Specifies the value of the Tipo actividad field.';
            DataClassification = ToBeClassified;
            OptionMembers = Actividad,Impuesto,Regimen;
        }
        field(8; "Id. impuesto"; Code[10])
        {
            Caption = 'Id. impuesto';
            ToolTip = 'Specifies the value of the Id. impuesto field.';
            DataClassification = ToBeClassified;
            TableRelation = "Actividad AFIP"."No. actividad" WHERE("Tipo actividad" = FILTER(Impuesto));
        }
        field(9; "Tipo regimen"; Text[30])
        {
            Caption = 'Tipo regimen';
            ToolTip = 'Specifies the value of the Tipo regimen field.';
            DataClassification = ToBeClassified;
        }
        field(10; Orden; Integer)
        {
            Caption = 'Orden';
            ToolTip = 'Specifies the value of the Orden field.';
            DataClassification = ToBeClassified;
        }
        field(11; Categoria; Code[10])
        {
            Caption = 'Categoria';
            ToolTip = 'Specifies the value of the Categoria field.';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No. proveedor", "No. actividad")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No. actividad", "Nombre actividad")
        {
        }
    }
}

