table 50024 "VAT Template Buffer Table"
{
    Caption = 'VAT books setup';

    fields
    {
        field(1; "jurisdicción"; Code[20])
        {
            Caption = 'jurisdicción';
            ToolTip = 'Specifies the value of the jurisdicción field.';
        }
        field(2; "grupo impuesto"; Code[10])
        {
            Caption = 'grupo impuesto';
            ToolTip = 'Specifies the value of the grupo impuesto field.';
        }
        field(3; importe; Decimal)
        {
            Caption = 'importe';
            ToolTip = 'Specifies the value of the importe field.';
        }
        field(4; base; Decimal)
        {
            Caption = 'base';
            ToolTip = 'Specifies the value of the base field.';
        }
        field(5; total; Decimal)
        {
            Caption = 'total';
            ToolTip = 'Specifies the value of the total field.';
        }
        field(6; "Número"; Code[10])
        {
            Caption = 'Number';
            ToolTip = 'Specifies the value of the Number field.';
        }
        field(7; Titulo; Text[80])
        {
            Caption = 'Titulo';
            ToolTip = 'Specifies the value of the Titulo field.';
        }
        field(8; "Tipo base"; Boolean)
        {
            Caption = 'Tipo base';
            ToolTip = 'Specifies the value of the Tipo base field.';
        }
        field(9; "No Linea"; Code[10])
        {
            Caption = 'No Linea';
            ToolTip = 'Specifies the value of the No Linea field.';
        }
        field(10; Formula; Text[30])
        {
            Caption = 'Formula';
            ToolTip = 'Specifies the value of the Formula field.';
        }
        field(11; "Para Formula"; Boolean)
        {
            Caption = 'Para Formula';
            ToolTip = 'Specifies the value of the Para Formula field.';
        }
        field(12; fila1; Code[10])
        {
            Caption = 'fila1';
            ToolTip = 'Specifies the value of the fila1 field.';
        }
        field(13; fila2; Code[10])
        {
            Caption = 'fila2';
            ToolTip = 'Specifies the value of the fila2 field.';
        }
        field(14; fila3; Code[10])
        {
            Caption = 'fila3';
            ToolTip = 'Specifies the value of the fila3 field.';
        }
        field(15; fila4; Code[10])
        {
            Caption = 'fila4';
            ToolTip = 'Specifies the value of the fila4 field.';
        }
        field(16; fila5; Code[10])
        {
            Caption = 'fila5';
            ToolTip = 'Specifies the value of the fila5 field.';
        }
        field(17; fila6; Code[10])
        {
            Caption = 'fila6';
            ToolTip = 'Specifies the value of the fila6 field.';
        }
        field(18; fila7; Code[10])
        {
            Caption = 'fila7';
            ToolTip = 'Specifies the value of the fila7 field.';
        }
        field(19; fila8; Code[10])
        {
            Caption = 'fila8';
            ToolTip = 'Specifies the value of the fila8 field.';
        }
        field(20; fila9; Code[10])
        {
            Caption = 'fila9';
            ToolTip = 'Specifies the value of the fila9 field.';
        }
        field(21; fila10; Code[10])
        {
            Caption = 'fila10';
            ToolTip = 'Specifies the value of the fila10 field.';
        }
        field(22; Imprimir; Boolean)
        {
            Caption = 'Imprimir';
            ToolTip = 'Specifies the value of the Imprimir field.';
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

