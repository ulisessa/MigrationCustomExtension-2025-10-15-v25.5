table 50130 "Familia recursos por proveedor"
{

    fields
    {
        field(1; "No. familia recurso"; Code[10])
        {
            NotBlank = true;
            TableRelation = "Resource Group";
        }
        field(2; "No. proveedor"; Code[20])
        {
            NotBlank = true;
            TableRelation = Vendor;
        }
        field(3; "Nombre familia recurso"; Text[50])
        {
            CalcFormula = Lookup("Resource Group".Name WHERE("No." = FIELD("No. familia recurso")));
            FieldClass = FlowField;
        }
        field(4; "Nombre proveedor"; Text[100])
        {
            CalcFormula = Lookup(Vendor.Name WHERE("No." = FIELD("No. proveedor")));
            FieldClass = FlowField;
        }
        field(5; "No. Subfamilia recurso"; Code[6])
        {
            Editable = true;
            Enabled = true;
            NotBlank = true;
            TableRelation = "Subfamilia recurso"."Cód. subfamilia recurso" WHERE("Familia recurso" = FIELD("No. familia recurso"));
        }
        field(6; "Nombre Subfamilia recurso"; Text[50])
        {
            CalcFormula = Lookup("Subfamilia recurso"."Nombre subfamilia recurso" WHERE("Cód. subfamilia recurso" = FIELD("No. Subfamilia recurso")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "No. familia recurso", "No. Subfamilia recurso", "No. proveedor")
        {
            Clustered = true;
        }
        key(Key2; "No. proveedor")
        {
        }
    }

    fieldgroups
    {
    }
}

