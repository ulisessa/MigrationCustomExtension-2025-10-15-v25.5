table 50519 "Tipos documento"
{

    fields
    {
        field(1; "Tipos documento"; Text[40])
        {
        }
        field(2; "No. Form"; Integer)
        {
            TableRelation = Object.ID WHERE(Type = CONST(Page));
        }
        field(3; "Tipo documento Navision"; Text[30])
        {
        }
        field(4; "Origen externo"; Boolean)
        {
        }
        field(5; "No. serie"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(6; "e-mail"; Text[100])
        {
        }
        field(7; Dataport; Integer)
        {
            TableRelation = Object.ID;
        }
        field(8; "Tipo de control"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Por cantidad","Por importe";
        }
        field(9; "Documento interno"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Tipos documento", "No. form")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Objeto: Record "Object";
}

