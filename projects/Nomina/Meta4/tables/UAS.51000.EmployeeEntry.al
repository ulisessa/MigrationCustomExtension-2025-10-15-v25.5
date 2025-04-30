table 51000 "Employee entry"
{
    Caption = 'Employee entry';

    fields
    {
        field(1; "Entry no."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry no.';
            Editable = false;
        }
        field(2; "Company no."; Integer)
        {
            Caption = 'Company no.';
            Editable = false;
        }
        field(3; "File no."; Code[10])
        {
            Caption = 'File no.';
            TableRelation = Employee WHERE ("Workday code" = FILTER (<> ''));
        }
        field(4; "Hiring date"; Date)
        {
            Caption = 'Hiring date';
            Editable = false;
        }
        field(5; "Event code"; Integer)
        {
            Caption = 'Event code';
            TableRelation = "Meta4 concept";
        }
        field(6; "Start date and time"; DateTime)
        {
            Caption = 'Start date and time';
        }
        field(7; "Finish date and time"; DateTime)
        {
            Caption = 'Finish date and time';
        }
        field(8; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(9; "Import date"; DateTime)
        {
            Caption = 'Import date';
        }
        field(10; "User ID"; Code[50])
        {
            Caption = 'User ID';
            TableRelation = User."User Name";
        }
        field(11; Records; Code[20])
        {
            Caption = 'Records';
        }
        field(12; Name; Text[100])
        {
            Caption = 'Name';
            Editable = false;
        }
        field(13; "Application date"; Date)
        {
            Caption = 'Application date';
            Editable = false;
        }
        field(14; "Workday code"; Code[10])
        {
            Caption = 'Workday code';
            TableRelation = Workday;
        }
        field(15; "% time"; Code[10])
        {
            Caption = '% time';
        }
        field(16; Exported; Boolean)
        {
            Caption = 'Exported';
        }
        field(17; "News code"; Integer)
        {
            Caption = 'News code';
            TableRelation = "Meta4 concept";
        }
        field(18; "Quantity to distribute"; Decimal)
        {
            Caption = 'Quantity to distribute';
        }
        field(19; "Start record"; Integer)
        {
        }
        field(20; "Finish record"; Integer)
        {
        }
        field(21; "Applied quantity"; Decimal)
        {
            Caption = 'Quantity';
        }
        field(22; Difference; Decimal)
        {
        }
        field(23; "Workday level"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Entry no.")
        {
            Clustered = true;
        }
        key(Key2; "Company no.", "File no.", "Application date", "Event code")
        {
            SumIndexFields = Quantity;
        }
        key(Key3; "Company no.", "File no.", "Event code", "Start date and time", Records)
        {
            SumIndexFields = Quantity;
        }
        key(Key4; "Company no.", "File no.", "Start date and time", Records)
        {
        }
        key(Key5; "Company no.", "File no.", "Event code", "Start date and time", "Finish date and time")
        {
            SumIndexFields = Quantity;
        }
        key(Key6; "Company no.", "File no.", "Application date", "Event code", Records)
        {
            SumIndexFields = Quantity;
        }
    }

    fieldgroups
    {
    }
}

