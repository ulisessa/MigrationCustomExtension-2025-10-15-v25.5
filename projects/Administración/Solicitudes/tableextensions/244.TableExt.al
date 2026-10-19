tableextension 244 "Extiende Libro Hoja Demanda" extends "Req. Wksh. Template"
{
    fields
    {
        field(50000; "No. Serie"; Code[20])
        {
            Caption = 'No. Serie';
            ToolTip = 'Specifies the value of the No. Serie field.';
            TableRelation = "No. Series";
        }
        field(50001; "No. serie consumo"; Code[20])
        {
            Caption = 'No. serie consumo';
            ToolTip = 'Specifies the value of the No. serie consumo field.';
            TableRelation = "No. Series";
        }
        field(50002; "Tipo documento"; Text[50])
        {
            Caption = 'Document Type';
            ToolTip = 'Specifies the value of the Document Type field.';
            DataClassification = ToBeClassified;
            TableRelation = "Tipos documento" WHERE("No. form" = CONST(50512));
        }
        field(50003; "Habilitar líneas nuevas"; Boolean)
        {
            Caption = 'Habilitar líneas nuevas';
            ToolTip = 'Specifies the value of the Habilitar líneas nuevas field.';
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