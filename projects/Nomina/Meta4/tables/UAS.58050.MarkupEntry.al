table 58050 "Markup entry"
{

    fields
    {
        field(1; "Entry no."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry no.';
            ToolTip = 'Specifies the value of the Entry no field.';
        }
        field(2; "Company no."; Integer)
        {
            Caption = 'Company no.';
            ToolTip = 'Specifies the value of the Company no field.';
        }
        field(3; "File no."; Code[10])
        {
            Caption = 'File no.';
            ToolTip = 'Specifies the value of the File no field.';
            TableRelation = Employee;
        }
        field(4; "Hiring date"; Date)
        {
            Caption = 'Hiring date';
            ToolTip = 'Specifies the value of the Hiring date field.';
        }
        field(5; "Event code"; Integer)
        {
            Caption = 'Event code';
            ToolTip = 'Specifies the value of the Event code field.';
            TableRelation = "Meta4 concept";
        }
        field(6; "Markup date and time"; DateTime)
        {
            Caption = 'Markup date and time';
            ToolTip = 'Specifies the value of the Markup date and time field.';

            trigger OnValidate()
            begin
                "Fecha filtro" := DT2Date("Markup date and time");
            end;
        }
        field(7; "Import date"; DateTime)
        {
            Caption = 'Import date';
            ToolTip = 'Specifies the value of the Import date field.';
        }
        field(8; Quantity; Decimal)
        {
            Caption = 'Quantity';
            ToolTip = 'Specifies the value of the Quantity field.';
        }
        field(9; "User ID"; Code[50])
        {
            Caption = 'User ID';
            ToolTip = 'Specifies the value of the User ID field.';
            TableRelation = User."User Name";
        }
        field(10; Applied; Boolean)
        {
            Caption = 'Applied';
            ToolTip = 'Specifies the value of the Applied field.';
        }
        field(11; Name; Text[100])
        {
            Caption = 'Name';
            ToolTip = 'Specifies the value of the Name field.';
        }
        field(12; "Workday code"; Code[10])
        {
            Caption = 'Workday code';
            ToolTip = 'Specifies the value of the Workday code field.';
            TableRelation = Workday;
        }
        field(13; "% time"; Code[10])
        {
            Caption = '% time';
            ToolTip = 'Specifies the value of the % time field.';
        }
        field(14; "Markup type"; Option)
        {
            Caption = 'Markup type';
            ToolTip = 'Specifies the value of the Markup type field.';
            OptionCaption = ' ,Automatic,Incident';
            OptionMembers = " ","Automático",Incidencia;
        }
        field(20; Userid; Text[20])
        {
            Caption = 'Userid';
            ToolTip = 'Specifies the value of the Userid field.';
        }
        field(21; CheckType; Text[2])
        {
            Caption = 'CheckType';
            ToolTip = 'Specifies the value of the CheckType field.';
        }
        field(22; Sensorid; Text[10])
        {
            Caption = 'Sensorid';
            ToolTip = 'Specifies the value of the Sensorid field.';
        }
        field(23; Checked; Boolean)
        {
            Caption = 'Checked';
            ToolTip = 'Specifies the value of the Checked field.';
        }
        field(24; WorkType; Integer)
        {
            Caption = 'WorkType';
            ToolTip = 'Specifies the value of the WorkType field.';
        }
        field(25; AttFlag; Integer)
        {
            Caption = 'AttFlag';
            ToolTip = 'Specifies the value of the AttFlag field.';
        }
        field(26; Logid; Integer)
        {
            Caption = 'Logid';
            ToolTip = 'Specifies the value of the Logid field.';
        }
        field(27; "Fecha filtro"; Date)
        {
            Caption = 'Fecha filtro';
            ToolTip = 'Specifies the value of the Fecha filtro field.';
        }
        field(28; "Workday level"; Integer)
        {
            Caption = 'Workday level';
            ToolTip = 'Specifies the value of the Workday level field.';
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

