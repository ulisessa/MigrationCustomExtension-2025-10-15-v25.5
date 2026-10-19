table 50455 "Actividad AFIP"
{
    DataPerCompany = false;

    fields
    {
        field(1; "No. actividad"; Code[10])
        {
            Caption = 'No. actividad';
            ToolTip = 'Specifies the value of the No. actividad field.';
        }
        field(2; Nombre; Text[250])
        {
            Caption = 'Name';
            ToolTip = 'Specifies the value of the Name field.';
        }
        field(3; "Actividad registrada en RG3594"; Boolean)
        {
            Caption = 'Actividad registrada en RG3594';
            ToolTip = 'Specifies the value of the Actividad registrada en RG3594 field.';
        }
        field(4; "Tipo actividad"; Option)
        {
            Caption = 'Tipo actividad';
            ToolTip = 'Specifies the value of the Tipo actividad field.';
            DataClassification = ToBeClassified;
            OptionMembers = Actividad,Impuesto,Regimen;
        }
    }

    keys
    {
        key(Key1; "No. actividad")
        {
            Clustered = true;
        }
        key(Key2; Nombre)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No. actividad", Nombre, "Tipo actividad")
        {
        }
    }

    trigger OnDelete()
    var
        rstLC: Record "Purchase Line";
    begin
        if "No. actividad" <> '' then begin

            Clear(rstLC);
            rstLC.SetRange("Actividad AFIP", "No. actividad");
            if rstLC.FindFirst then
                Error(Error50000);

        end;
    end;

    var
        rstLC: Record "Purchase Line";
        Error50000: Label 'Existen líneas de compra para esta actividad, por favor, solucione este problema antes de eliminar el código de actividad';
}

