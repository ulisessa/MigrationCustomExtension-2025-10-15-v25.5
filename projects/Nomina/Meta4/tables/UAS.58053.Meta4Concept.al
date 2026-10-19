table 58053 "Meta4 concept"
{
    Caption = 'Meta4 concept';

    fields
    {
        field(1; "Concept code"; Integer)
        {
            Caption = 'Concept code';
            ToolTip = 'Specifies the value of the Concept code field.';
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';
        }
        field(3; "Hours per unit"; Decimal)
        {
            Caption = 'Hours per unit';
            ToolTip = 'Specifies the value of the Hours per unit field.';
        }
        field(4; "Meta4 concept"; Integer)
        {
            Caption = 'Meta4 concept';
            ToolTip = 'Specifies the value of the Meta4 concept field.';
        }
        field(5; "% tiempo"; Integer)
        {
            Caption = '% tiempo';
            ToolTip = 'Specifies the value of the % tiempo field.';
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

