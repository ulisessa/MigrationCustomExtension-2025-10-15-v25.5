table 50005 "Resource family"
{
    Caption = 'Familia recurso';
    DataCaptionFields = "No", Nombre;

    fields
    {
        field(1; "No"; Code[20])
        {
            NotBlank = true;
        }
        field(2; Nombre; Text[50])
        {
        }
        field(22; "Filtro fecha"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(26; "Filtro unidad medida"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Unit of Measure";
        }
        field(33; "Filtro facturable"; Boolean)
        {
            FieldClass = FlowFilter;
        }
    }

    keys
    {
        key(Key1; "No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        MovCapacidadRec.SetCurrentKey(MovCapacidadRec."Entry No.");
        MovCapacidadRec.SetRange(MovCapacidadRec."Resource No.", "No");
        MovCapacidadRec.DeleteAll;

        LinComentar.SetRange("Table Name", LinComentar."Table Name"::"Resource Group");
        LinComentar.SetRange("No.", "No");
        LinComentar.DeleteAll;
    end;

    var
        MovCapacidadRec: Record "Res. Capacity Entry";

        LinComentar: Record "Comment Line";
}

