tableextension 244 "Extiende Libro Hoja Demanda" extends "Req. Wksh. Template"
{
    fields
    {
        field(50000; "No. Serie"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50001; "No. serie consumo"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50002; "Tipo documento"; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tipos documento" WHERE("No. form" = CONST(50512));
        }
        field(50003; "Habilitar líneas nuevas"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}