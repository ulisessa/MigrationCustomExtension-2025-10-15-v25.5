table 58052 "Workday detail"
{
    Caption = 'Workday detail';

    fields
    {
        field(1; "Workday code"; Code[10])
        {
            Caption = 'Workday code';
            ToolTip = 'Specifies the value of the Workday code field.';
            TableRelation = Workday;
        }
        field(2; "Starting day"; Option)
        {
            Caption = 'Starting day';
            ToolTip = 'Specifies the value of the Starting day field.';
            OptionCaption = ' ,Monday,Tusday,Wednesday,Thursday,Friday,Saturday,Sunday';
            OptionMembers = " ",Monday,Tusday,Wednesday,Thursday,Friday,Saturday,Sunday;
        }
        field(3; "Ending day"; Option)
        {
            Caption = 'Ending day';
            ToolTip = 'Specifies the value of the Ending day field.';
            OptionCaption = ' ,Monday,Tusday,Wednesday,Thursday,Friday,Saturday,Sunday';
            OptionMembers = " ",Monday,Tusday,Wednesday,Thursday,Friday,Saturday,Sunday;
        }
        field(4; "Starting time"; Time)
        {
            Caption = 'Starting time';
            ToolTip = 'Specifies the value of the Starting time field.';
        }
        field(5; "Ending time"; Time)
        {
            Caption = 'Ending time';
            ToolTip = 'Specifies the value of the Ending time field.';
        }
        field(6; "Additional percentage value"; Decimal)
        {
            Caption = 'Additional percentage value';
            ToolTip = 'Specifies the value of the Additional percentage value field.';
            MaxValue = 100;
            MinValue = 0;
        }
        field(7; "Enabled since"; DateTime)
        {
            Caption = 'Enabled since';
            ToolTip = 'Specifies the value of the Enabled since field.';
        }
        field(8; "Enabled until"; DateTime)
        {
            Caption = 'Enabled until';
            ToolTip = 'Specifies the value of the Enabled until field.';
        }
        field(9; "Last date modified"; Date)
        {
            Caption = 'Last date modified';
            ToolTip = 'Specifies the value of the Last date modified field.';
        }
        field(10; "User Id."; Text[50])
        {
            Caption = 'User Id.';
            ToolTip = 'Specifies the value of the User Id field.';
        }
        field(11; Description; Text[50])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';
        }
        field(12; "Meta4 code"; Integer)
        {
            Caption = 'Meta4 code';
            ToolTip = 'Specifies the value of the Meta4 code field.';
            TableRelation = "Meta4 concept";
        }
        field(13; "Cantidad horas"; Decimal)
        {
            Caption = 'Cantidad horas';
            ToolTip = 'Specifies the value of the Cantidad horas field.';
        }
        field(14; "Flexible o restricto"; Option)
        {
            Caption = 'Flexible o restricto';
            ToolTip = 'Specifies the value of the Flexible o restricto field.';
            OptionMembers = Restricto,Flexible,Mixto;
        }
        field(15; Nivel; Option)
        {
            Caption = 'Nivel';
            ToolTip = 'Specifies the value of the Nivel field.';
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

