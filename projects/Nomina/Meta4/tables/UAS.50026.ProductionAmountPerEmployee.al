table 50026 "Production amount per employee"
{
    Caption = 'Importe producción por empleado';

    fields
    {
        field(1; "Entry no."; Integer)
        {
            AutoIncrement = true;
            Caption = 'No. mov.';
        }
        field(2; "File no."; Code[10])
        {
            Caption = 'File no.';
            TableRelation = Resource WHERE (Type = CONST (Person),
                                            "Workday code" = FILTER (<> ''));
        }
        field(3; "Job no."; Code[20])
        {
            Caption = 'No. proyecto';
        }
        field(4; "Starting date"; Date)
        {
            Caption = 'Día inicio';
        }
        field(5; "Ending date"; Date)
        {
            Caption = 'Día final';
        }
        field(6; "Role code"; Code[10])
        {
            Caption = 'Cód. rol';
            TableRelation = "Dimension Value".Code WHERE ("Dimension Code" = CONST ('PUESTOS'));
        }
        field(7; "Exchange rate"; Decimal)
        {
            Caption = 'Tipo cambio';
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

