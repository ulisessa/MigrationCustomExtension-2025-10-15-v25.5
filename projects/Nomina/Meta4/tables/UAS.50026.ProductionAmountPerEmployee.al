table 50026 "Production amount per employee"
{
    Caption = 'Importe producción por empleado';

    fields
    {
        field(1; "Entry no."; Integer)
        {
            AutoIncrement = true;
            Caption = 'No. mov.';
            ToolTip = 'Specifies the value of the No. mov field.';
        }
        field(2; "File no."; Code[10])
        {
            Caption = 'File no.';
            ToolTip = 'Specifies the value of the File no field.';
            TableRelation = Resource WHERE (Type = CONST (Person),
                                            "Workday code" = FILTER (<> ''));
        }
        field(3; "Job no."; Code[20])
        {
            Caption = 'Job No.';
            ToolTip = 'Specifies the value of the Job No field.';
        }
        field(4; "Starting date"; Date)
        {
            Caption = 'Día inicio';
            ToolTip = 'Specifies the value of the Día inicio field.';
        }
        field(5; "Ending date"; Date)
        {
            Caption = 'Ending day';
            ToolTip = 'Specifies the value of the Ending day field.';
        }
        field(6; "Role code"; Code[10])
        {
            Caption = 'Cód. rol';
            ToolTip = 'Specifies the value of the Cód. rol field.';
            TableRelation = "Dimension Value".Code WHERE ("Dimension Code" = CONST ('PUESTOS'));
        }
        field(7; "Exchange rate"; Decimal)
        {
            Caption = 'Tipo cambio';
            ToolTip = 'Specifies the value of the Tipo cambio field.';
        }
    }

    keys
    {
        key(Key1; "Entry no.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

