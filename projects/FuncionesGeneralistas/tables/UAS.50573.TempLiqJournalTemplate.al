table 50573 "Temp Liq. Journal Template"
{

    fields
    {
        field(1; Name; Code[10])
        {
        }
        field(2; Description; Text[80])
        {
        }
        field(5; "Test Report ID"; Integer)
        {
        }
        field(6; "Form ID"; Integer)
        {
        }
        field(7; "Posting Report ID"; Integer)
        {
        }
        field(8; "Force Posting Report"; Boolean)
        {
        }
        field(10; "Source Code"; Code[10])
        {
        }
        field(11; "Reason Code"; Code[10])
        {
        }
        field(12; Recurring; Boolean)
        {
        }
        field(13; "Test Report Name"; Text[30])
        {
        }
        field(14; "Form Name"; Text[30])
        {
        }
        field(15; "Posting Report Name"; Text[30])
        {
        }
        field(16; "No. Series"; Code[10])
        {
        }
        field(17; "Posting No. Series"; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; Name)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

