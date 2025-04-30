table 50539 "Carpeta por OC"
{
    fields
    {
        field(1; "No. documento"; Code[30])
        {
        }
        field(2; "Fecha modificación"; Date)
        {
        }
        field(3; "Carpeta de Importación"; Code[20])
        {
            NotBlank = true;
        }
    }

    keys
    {
        key(Key1; "No. documento", "Carpeta de Importación")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Fecha modificación" := Today;
    end;
}

