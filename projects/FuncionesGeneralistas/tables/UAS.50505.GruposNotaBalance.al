table 50505 "Grupos Nota Balance"
{

    fields
    {
        field(1; Orden; Integer)
        {
            AutoIncrement = true;
        }
        field(2; Nivel; Option)
        {
            OptionMembers = A,B,C,D;
        }
        field(3; "Descripción"; Text[200])
        {
        }
        field(50000; "Saldo 1er Nivel"; Decimal)
        {
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

