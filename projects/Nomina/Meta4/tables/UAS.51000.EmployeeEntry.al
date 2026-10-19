table 51000 "Employee entry"
{
    Caption = 'Employee entry';

    fields
    {
        field(1; "Entry no."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry no.';
            ToolTip = 'Specifies the value of the Entry no field.';
            Editable = false;
        }
        field(2; "Company no."; Integer)
        {
            Caption = 'Company no.';
            ToolTip = 'Specifies the value of the Company no field.';
            Editable = false;
        }
        field(3; "File no."; Code[10])
        {
            Caption = 'File no.';
            ToolTip = 'Specifies the value of the File no field.';
            TableRelation = Employee WHERE ("Workday code" = FILTER (<> ''));
        }
        field(4; "Hiring date"; Date)
        {
            Caption = 'Hiring date';
            ToolTip = 'Specifies the value of the Hiring date field.';
            Editable = false;
        }
        field(5; "Event code"; Integer)
        {
            Caption = 'Event code';
            ToolTip = 'Specifies the value of the Event code field.';
            TableRelation = "Meta4 concept";
        }
        field(6; "Start date and time"; DateTime)
        {
            Caption = 'Start date and time';
            ToolTip = 'Specifies the value of the Start date and time field.';
        }
        field(7; "Finish date and time"; DateTime)
        {
            Caption = 'Finish date and time';
            ToolTip = 'Specifies the value of the Finish date and time field.';
        }
        field(8; Quantity; Decimal)
        {
            Caption = 'Quantity';
            ToolTip = 'Specifies the value of the Quantity field.';
        }
        field(9; "Import date"; DateTime)
        {
            Caption = 'Import date';
            ToolTip = 'Specifies the value of the Import date field.';
        }
        field(10; "User ID"; Code[50])
        {
            Caption = 'User ID';
            ToolTip = 'Specifies the value of the User ID field.';
            TableRelation = User."User Name";
        }
        field(11; Records; Code[20])
        {
            Caption = 'Records';
            ToolTip = 'Specifies the value of the Records field.';
        }
        field(12; Name; Text[100])
        {
            Caption = 'Name';
            ToolTip = 'Specifies the value of the Name field.';
            Editable = false;
        }
        field(13; "Application date"; Date)
        {
            Caption = 'Application date';
            ToolTip = 'Specifies the value of the Application date field.';
            Editable = false;
        }
        field(14; "Workday code"; Code[10])
        {
            Caption = 'Workday code';
            ToolTip = 'Specifies the value of the Workday code field.';
            TableRelation = Workday;
        }
        field(15; "% time"; Code[10])
        {
            Caption = '% time';
            ToolTip = 'Specifies the value of the % time field.';
        }
        field(16; Exported; Boolean)
        {
            Caption = 'Exported';
            ToolTip = 'Specifies the value of the Exported field.';
        }
        field(17; "News code"; Integer)
        {
            Caption = 'News code';
            ToolTip = 'Specifies the value of the News code field.';
            TableRelation = "Meta4 concept";
        }
        field(18; "Quantity to distribute"; Decimal)
        {
            Caption = 'Quantity to distribute';
            ToolTip = 'Specifies the value of the Quantity to distribute field.';
        }
        field(19; "Start record"; Integer)
        {
            Caption = 'Start record';
            ToolTip = 'Specifies the value of the Start record field.';
        }
        field(20; "Finish record"; Integer)
        {
            Caption = 'Finish record';
            ToolTip = 'Specifies the value of the Finish record field.';
        }
        field(21; "Applied quantity"; Decimal)
        {
            Caption = 'Quantity';
            ToolTip = 'Specifies the value of the Quantity field.';
        }
        field(22; Difference; Decimal)
        {
            Caption = 'Difference';
            ToolTip = 'Specifies the value of the Difference field.';
        }
        field(23; "Workday level"; Integer)
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

