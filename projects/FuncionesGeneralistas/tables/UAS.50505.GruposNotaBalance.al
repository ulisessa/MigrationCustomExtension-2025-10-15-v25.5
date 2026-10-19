table 50505 "Grupos Nota Balance"
{

    fields
    {
        field(1; Orden; Integer)
        {
            Caption = 'Orden';
            ToolTip = 'Specifies the value of the Orden field.';
            AutoIncrement = true;
        }
        field(2; Nivel; Option)
        {
            Caption = 'Nivel';
            ToolTip = 'Specifies the value of the Nivel field.';
            OptionMembers = A,B,C,D;
        }
        field(3; "Descripción"; Text[200])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';
        }
        field(50000; "Saldo 1er Nivel"; Decimal)
        {
            Caption = 'Saldo 1er Nivel';
            ToolTip = 'Specifies the value of the Saldo 1er Nivel field.';
            FieldClass = Normal;
        }
    }

    keys
    {
        key(Key1; Orden, Nivel, "Descripción")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

