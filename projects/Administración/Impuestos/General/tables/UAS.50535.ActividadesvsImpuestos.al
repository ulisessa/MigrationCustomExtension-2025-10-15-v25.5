table 50535 "Actividades vs impuestos"
{

    fields
    {
        field(2; "No. actividad"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Actividad AFIP"."No. actividad" WHERE("Tipo actividad" = CONST(Impuesto));
        }
        field(3; "Nombre actividad"; Text[250])
        {
            CalcFormula = Lookup("Actividad AFIP".Nombre WHERE("No. actividad" = FIELD("No. actividad")));
            FieldClass = FlowField;
        }
        field(4; "Cod. area impuesto"; Code[10])
        {
            Caption = 'Cód. área impuesto';
            DataClassification = ToBeClassified;
            TableRelation = "Tax Area".Code;
        }
        field(5; "Nombre area impuesto"; Text[100])
        {
            CalcFormula = Lookup("Tax Area".Description WHERE(Code = FIELD("Cod. area impuesto")));
            Caption = 'Nombre área impuesto';
            FieldClass = FlowField;
        }
        field(6; Accion; Option)
        {
            Caption = 'Acción';
            DataClassification = ToBeClassified;
            NotBlank = true;
            OptionMembers = " ",Habilitado,Bloqueado;
        }
    }

    keys
    {
        key(Key1; "No. actividad", "Cod. area impuesto")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

