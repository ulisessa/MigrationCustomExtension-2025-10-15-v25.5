table 50005 "Resource family"
{
    Caption = 'Familia recurso';
    DataCaptionFields = "No", Nombre;

    fields
    {
        field(1; "No"; Code[20])
        {
            Caption = 'No';
            ToolTip = 'Specifies the value of the No field.';
            NotBlank = true;
        }
        field(2; Nombre; Text[50])
        {
            Caption = 'Name';
            ToolTip = 'Specifies the value of the Name field.';
        }
        field(22; "Filtro fecha"; Date)
        {
            Caption = 'Date Filter';
            ToolTip = 'Specifies the value of the Date Filter field.';
            FieldClass = FlowFilter;
        }
        field(26; "Filtro unidad medida"; Code[10])
        {
            Caption = 'Filtro unidad medida';
            ToolTip = 'Specifies the value of the Filtro unidad medida field.';
            FieldClass = FlowFilter;
            TableRelation = "Unit of Measure";
        }
        field(33; "Filtro facturable"; Boolean)
        {
            Caption = 'Filtro facturable';
            ToolTip = 'Specifies the value of the Filtro facturable field.';
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

