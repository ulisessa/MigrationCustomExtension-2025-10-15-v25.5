table 50114 "Imputación directa por grupo"
{

    fields
    {
        field(1; "No. Cuenta"; Code[30])
        {
            Caption = 'No. Cuenta';
            ToolTip = 'Specifies the value of the No. Cuenta field.';
            TableRelation = "G/L Account"."No.";
        }
        field(2; "No. lín."; Integer)
        {
            Caption = 'No. lín.';
            ToolTip = 'Specifies the value of the No. lín field.';
        }
        field(3; "Descripción cuenta"; Text[100])
        {
            Caption = 'Descripción cuenta';
            ToolTip = 'Specifies the value of the Descripción cuenta field.';
            CalcFormula = Lookup("G/L Account".Name WHERE("No." = FIELD("No. Cuenta")));
            FieldClass = FlowField;
        }
        field(100; "Grupo seguridad"; Code[20])
        {
            Caption = 'Grupo seguridad';
            ToolTip = 'Specifies the value of the Grupo seguridad field.';
            TableRelation = Seguridad;
        }
        field(200; "Imputación directa"; Boolean)
        {
            Caption = 'Imputación directa';
            ToolTip = 'Specifies the value of the Imputación directa field.';
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

