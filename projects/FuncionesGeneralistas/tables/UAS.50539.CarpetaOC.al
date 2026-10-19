table 50539 "Carpeta por OC"
{
    fields
    {
        field(1; "No. documento"; Code[30])
        {
            Caption = 'Document No.';
            ToolTip = 'Specifies the value of the Document No field.';
        }
        field(2; "Fecha modificación"; Date)
        {
            Caption = 'Fecha modificación';
            ToolTip = 'Specifies the value of the Fecha modificación field.';
        }
        field(3; "Carpeta de Importación"; Code[20])
        {
            Caption = 'Carpeta de Importación';
            ToolTip = 'Specifies the value of the Carpeta de Importación field.';
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

