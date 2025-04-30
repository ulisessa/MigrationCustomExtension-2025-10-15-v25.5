table 50024 "VAT Template Buffer Table"
{
    Caption = 'VAT books setup';

    fields
    {
        field(1; "jurisdicción"; Code[20])
        {
        }
        field(2; "grupo impuesto"; Code[10])
        {
        }
        field(3; importe; Decimal)
        {
        }
        field(4; base; Decimal)
        {
        }
        field(5; total; Decimal)
        {
        }
        field(6; "Número"; Code[10])
        {
        }
        field(7; Titulo; Text[80])
        {
        }
        field(8; "Tipo base"; Boolean)
        {
        }
        field(9; "No Linea"; Code[10])
        {
        }
        field(10; Formula; Text[30])
        {
        }
        field(11; "Para Formula"; Boolean)
        {
        }
        field(12; fila1; Code[10])
        {
        }
        field(13; fila2; Code[10])
        {
        }
        field(14; fila3; Code[10])
        {
        }
        field(15; fila4; Code[10])
        {
        }
        field(16; fila5; Code[10])
        {
        }
        field(17; fila6; Code[10])
        {
        }
        field(18; fila7; Code[10])
        {
        }
        field(19; fila8; Code[10])
        {
        }
        field(20; fila9; Code[10])
        {
        }
        field(21; fila10; Code[10])
        {
        }
        field(22; Imprimir; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "jurisdicción", "grupo impuesto", "Número")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

