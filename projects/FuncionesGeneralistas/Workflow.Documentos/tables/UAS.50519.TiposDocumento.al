table 50519 "Tipos documento"
{

    fields
    {
        field(1; "Tipos documento"; Text[40])
        {
            Caption = 'Tipos documento';
            ToolTip = 'Specifies the value of the Tipos documento field.';
        }
        field(2; "No. Form"; Integer)
        {
            Caption = 'No. Form';
            ToolTip = 'Specifies the value of the No. Form field.';
            TableRelation = Object.ID WHERE(Type = CONST(Page));
        }
        field(3; "Tipo documento Navision"; Text[30])
        {
            Caption = 'Tipo documento Navision';
            ToolTip = 'Specifies the value of the Tipo documento Navision field.';
        }
        field(4; "Origen externo"; Boolean)
        {
            Caption = 'Origen externo';
            ToolTip = 'Specifies the value of the Origen externo field.';
        }
        field(5; "No. serie"; Code[10])
        {
            Caption = 'No. serie';
            ToolTip = 'Specifies the value of the No. serie field.';
            TableRelation = "No. Series";
        }
        field(6; "e-mail"; Text[100])
        {
            Caption = 'e-mail';
            ToolTip = 'Specifies the value of the e-mail field.';
        }
        field(7; Dataport; Integer)
        {
            Caption = 'Dataport';
            ToolTip = 'Specifies the value of the Dataport field.';
            TableRelation = Object.ID;
        }
        field(8; "Tipo de control"; Option)
        {
            Caption = 'Tipo de control';
            ToolTip = 'Specifies the value of the Tipo de control field.';
            DataClassification = ToBeClassified;
            OptionMembers = "Por cantidad","Por importe";
        }
        field(9; "Documento interno"; Boolean)
        {
            Caption = 'Documento interno';
            ToolTip = 'Specifies the value of the Documento interno field.';
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

