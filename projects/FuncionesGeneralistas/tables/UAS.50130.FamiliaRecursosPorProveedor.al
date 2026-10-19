table 50130 "Familia recursos por proveedor"
{

    fields
    {
        field(1; "No. familia recurso"; Code[10])
        {
            Caption = 'No. familia recurso';
            ToolTip = 'Specifies the value of the No. familia recurso field.';
            NotBlank = true;
            TableRelation = "Resource Group";
        }
        field(2; "No. proveedor"; Code[20])
        {
            Caption = 'Vendor No.';
            ToolTip = 'Specifies the value of the Vendor No field.';
            NotBlank = true;
            TableRelation = Vendor;
        }
        field(3; "Nombre familia recurso"; Text[50])
        {
            Caption = 'Nombre familia recurso';
            ToolTip = 'Specifies the value of the Nombre familia recurso field.';
            CalcFormula = Lookup("Resource Group".Name WHERE("No." = FIELD("No. familia recurso")));
            FieldClass = FlowField;
        }
        field(4; "Nombre proveedor"; Text[100])
        {
            Caption = 'Nombre proveedor';
            ToolTip = 'Specifies the value of the Nombre proveedor field.';
            CalcFormula = Lookup(Vendor.Name WHERE("No." = FIELD("No. proveedor")));
            FieldClass = FlowField;
        }
        field(5; "No. Subfamilia recurso"; Code[6])
        {
            Caption = 'No. Subfamilia recurso';
            ToolTip = 'Specifies the value of the No. Subfamilia recurso field.';
            Editable = true;
            Enabled = true;
            NotBlank = true;
            TableRelation = "Subfamilia recurso"."Cód. subfamilia recurso" WHERE("Familia recurso" = FIELD("No. familia recurso"));
        }
        field(6; "Nombre Subfamilia recurso"; Text[50])
        {
            Caption = 'Nombre Subfamilia recurso';
            ToolTip = 'Specifies the value of the Nombre Subfamilia recurso field.';
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

