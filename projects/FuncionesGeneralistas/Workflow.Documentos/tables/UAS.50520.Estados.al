table 50520 Estados
{

    fields
    {
        field(1; Estados; Text[50])
        {
            Caption = 'Estados';
            ToolTip = 'Specifies the value of the Estados field.';
        }
        field(2; Nivel; Integer)
        {
            Caption = 'Nivel';
            ToolTip = 'Specifies the value of the Nivel field.';
            MaxValue = 100;
            MinValue = 0;
        }
        field(3; "Fórmula de fecha"; DateFormula)
        {
            Caption = 'Fórmula de fecha';
            ToolTip = 'Specifies the value of the Fórmula de fecha field.';
        }
        field(4; "No editable"; Boolean)
        {
            Caption = 'No editable';
            ToolTip = 'Specifies the value of the No editable field.';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; Estados)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

