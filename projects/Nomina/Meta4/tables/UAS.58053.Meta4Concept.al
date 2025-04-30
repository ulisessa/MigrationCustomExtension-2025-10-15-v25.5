table 58053 "Meta4 concept"
{
    Caption = 'Meta4 concept';

    fields
    {
        field(1; "Concept code"; Integer)
        {
            Caption = 'Concept code';
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(3; "Hours per unit"; Decimal)
        {
            Caption = 'Hours per unit';
        }
        field(4; "Meta4 concept"; Integer)
        {
        }
        field(5; "% tiempo"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Concept code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

