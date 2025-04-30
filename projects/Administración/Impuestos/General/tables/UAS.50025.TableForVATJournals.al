table 50025 "Table for VAT journals"
{
    Caption = 'Tabla para libros de IVA';

    fields
    {
        field(1; "Jurisdicción"; Code[20])
        {
        }
        field(2; "Grupo impuesto"; Code[10])
        {
        }
        field(3; Importe; Decimal)
        {
        }
        field(4; Base; Decimal)
        {
        }
        field(5; Total; Decimal)
        {
        }
        field(6; "Número"; Code[10])
        {
        }
        field(7; "Título"; Text[80])
        {
        }
        field(8; "Tipo base"; Boolean)
        {
        }
        field(9; "No. línea"; Code[10])
        {
        }
        field(10; Formla; Text[30])
        {
        }
        field(11; "Para formula"; Boolean)
        {
        }
        field(12; Fila1; Code[10])
        {
        }
        field(13; Fila2; Code[10])
        {
        }
        field(14; Fila3; Code[10])
        {
        }
        field(15; Fila4; Code[10])
        {
        }
        field(16; Fila5; Code[10])
        {
        }
        field(17; Fila6; Code[10])
        {
        }
        field(18; Fila7; Code[10])
        {
        }
        field(19; Fila8; Code[10])
        {
        }
        field(20; Fila9; Code[10])
        {
        }
        field(21; Fila10; Code[10])
        {
        }
        field(22; Imprimir; Boolean)
        {
        }
        field(23; Fila11; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Jurisdicción", "Grupo impuesto", "Número")
        {
            Clustered = true;
        }
        key(Key2; "Número")
        {
        }
    }

    fieldgroups
    {
    }
}

