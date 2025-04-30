table 50526 "Detalle mensajería"
{
    fields
    {
        field(1; "No. mensaje"; Code[30])
        {
        }
        field(2; "No. linea"; Integer)
        {
        }
        field(3; Mensaje; Text[120])
        {
        }
        field(4; Usuario; Code[50])
        {
            TableRelation = User."User Name";
        }
    }

    keys
    {
        key(Key1; "No. mensaje", "No. linea")
        {
            Clustered = true;
        }
        key(Key2; "No. linea")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        if Usuario <> UpperCase(UserId) then
            Error('Usted no está habilitado para modificar una línea escrita por %1', Usuario);
    end;

    trigger OnInsert()
    begin
        Usuario := UserId;
    end;

    trigger OnModify()
    begin
        if Usuario <> UpperCase(UserId) then
            Error('Usted no está habilitado para modificar una línea escrita por %1', Usuario);
    end;

    trigger OnRename()
    begin
        if Usuario <> UpperCase(UserId) then
            Error('Usted no está habilitado para modificar una línea escrita por %1', Usuario);
    end;
}

