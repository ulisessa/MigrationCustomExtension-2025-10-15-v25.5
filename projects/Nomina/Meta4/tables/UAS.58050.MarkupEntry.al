table 58050 "Markup entry"
{

    fields
    {
        field(1; "Entry no."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry no.';
        }
        field(2; "Company no."; Integer)
        {
            Caption = 'Company no.';
        }
        field(3; "File no."; Code[10])
        {
            Caption = 'File no.';
            TableRelation = Employee;
        }
        field(4; "Hiring date"; Date)
        {
            Caption = 'Hiring date';
        }
        field(5; "Event code"; Integer)
        {
            Caption = 'Event code';
            TableRelation = "Meta4 concept";
        }
        field(6; "Markup date and time"; DateTime)
        {
            Caption = 'Markup date and time';

            trigger OnValidate()
            begin
                "Fecha filtro" := DT2Date("Markup date and time");
            end;
        }
        field(7; "Import date"; DateTime)
        {
            Caption = 'Import date';
        }
        field(8; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(9; "User ID"; Code[50])
        {
            Caption = 'User ID';
            TableRelation = User."User Name";
        }
        field(10; Applied; Boolean)
        {
            Caption = 'Applied';
        }
        field(11; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(12; "Workday code"; Code[10])
        {
            Caption = 'Workday code';
            TableRelation = Workday;
        }
        field(13; "% time"; Code[10])
        {
            Caption = '% time';
        }
        field(14; "Markup type"; Option)
        {
            OptionCaption = ' ,Automatic,Incident';
            OptionMembers = " ","Automático",Incidencia;
        }
        field(20; Userid; Text[20])
        {
        }
        field(21; CheckType; Text[2])
        {
        }
        field(22; Sensorid; Text[10])
        {
        }
        field(23; Checked; Boolean)
        {
        }
        field(24; WorkType; Integer)
        {
        }
        field(25; AttFlag; Integer)
        {
        }
        field(26; Logid; Integer)
        {
        }
        field(27; "Fecha filtro"; Date)
        {
        }
        field(28; "Workday level"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Entry no.")
        {
            Clustered = true;
        }
        key(Key2; "File no.", "Markup date and time")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Fecha filtro" := DT2Date("Markup date and time");
    end;

    trigger OnModify()
    begin
        "Fecha filtro" := DT2Date("Markup date and time");
    end;
}

