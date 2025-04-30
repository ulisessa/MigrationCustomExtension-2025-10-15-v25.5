table 50116 "Actividad proveedor"
{
    DataPerCompany = false;

    fields
    {
        field(1; "No. proveedor"; Code[20])
        {
            TableRelation = Vendor."No.";
        }
        field(2; "No. actividad"; Code[10])
        {
            TableRelation = "Actividad AFIP"."No. actividad";
        }
        field(3; "Nombre proveedor"; Text[200])
        {
            CalcFormula = Lookup(Vendor.Name WHERE("No." = FIELD("No. proveedor")));
            FieldClass = FlowField;
        }
        field(4; "Nombre actividad"; Text[250])
        {
            CalcFormula = Lookup("Actividad AFIP".Nombre WHERE("No. actividad" = FIELD("No. actividad")));
            FieldClass = FlowField;
        }
        field(5; "Fecha alta"; Date)
        {
        }
        field(6; "Fecha baja"; Date)
        {
        }
        field(7; "Tipo actividad"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Actividad,Impuesto,Regimen;
        }
        field(8; "Id. impuesto"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Actividad AFIP"."No. actividad" WHERE("Tipo actividad" = FILTER(Impuesto));
        }
        field(9; "Tipo regimen"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Orden; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(11; Categoria; Code[10])
        {
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

