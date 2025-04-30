table 58052 "Workday detail"
{
    Caption = 'Workday detail';

    fields
    {
        field(1; "Workday code"; Code[10])
        {
            Caption = 'Workday code';
            TableRelation = Workday;
        }
        field(2; "Starting day"; Option)
        {
            Caption = 'Starting day';
            OptionCaption = ' ,Monday,Tusday,Wednesday,Thursday,Friday,Saturday,Sunday';
            OptionMembers = " ",Monday,Tusday,Wednesday,Thursday,Friday,Saturday,Sunday;
        }
        field(3; "Ending day"; Option)
        {
            Caption = 'Ending day';
            OptionCaption = ' ,Monday,Tusday,Wednesday,Thursday,Friday,Saturday,Sunday';
            OptionMembers = " ",Monday,Tusday,Wednesday,Thursday,Friday,Saturday,Sunday;
        }
        field(4; "Starting time"; Time)
        {
            Caption = 'Starting time';
        }
        field(5; "Ending time"; Time)
        {
            Caption = 'Ending time';
        }
        field(6; "Additional percentage value"; Decimal)
        {
            Caption = 'Additional percentage value';
            MaxValue = 100;
            MinValue = 0;
        }
        field(7; "Enabled since"; DateTime)
        {
            Caption = 'Enabled since';
        }
        field(8; "Enabled until"; DateTime)
        {
            Caption = 'Enabled until';
        }
        field(9; "Last date modified"; Date)
        {
            Caption = 'Last date modified';
        }
        field(10; "User Id."; Text[50])
        {
            Caption = 'User Id.';
        }
        field(11; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(12; "Meta4 code"; Integer)
        {
            TableRelation = "Meta4 concept";
        }
        field(13; "Cantidad horas"; Decimal)
        {
        }
        field(14; "Flexible o restricto"; Option)
        {
            OptionMembers = Restricto,Flexible,Mixto;
        }
        field(15; Nivel; Option)
        {
            OptionMembers = " ","1","2","3","4","5","6";

            trigger OnValidate()
            begin

                if Nivel = Nivel::" " then begin

                    TestField("Flexible o restricto", "Flexible o restricto"::Restricto);

                end;
            end;
        }
    }

    keys
    {
        key(Key1; "Workday code", "Flexible o restricto", "Starting day", "Ending day", Nivel, "Starting time", "Ending time", "Enabled since")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

