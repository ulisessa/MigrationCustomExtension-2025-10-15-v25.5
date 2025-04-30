table 50114 "Imputación directa por grupo"
{

    fields
    {
        field(1; "No. Cuenta"; Code[30])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(2; "No. lín."; Integer)
        {
        }
        field(3; "Descripción cuenta"; Text[100])
        {
            CalcFormula = Lookup("G/L Account".Name WHERE("No." = FIELD("No. Cuenta")));
            FieldClass = FlowField;
        }
        field(100; "Grupo seguridad"; Code[20])
        {
            TableRelation = Seguridad;
        }
        field(200; "Imputación directa"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "No. Cuenta", "No. lín.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

