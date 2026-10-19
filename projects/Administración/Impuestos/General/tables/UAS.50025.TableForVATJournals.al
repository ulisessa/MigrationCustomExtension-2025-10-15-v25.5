table 50025 "Table for VAT journals"
{
    Caption = 'Tabla para libros de IVA';

    fields
    {
        field(1; "Jurisdicción"; Code[20])
        {
            Caption = 'Jurisdicción';
            ToolTip = 'Specifies the value of the Jurisdicción field.';
        }
        field(2; "Grupo impuesto"; Code[10])
        {
            Caption = 'Grupo impuesto';
            ToolTip = 'Specifies the value of the Grupo impuesto field.';
        }
        field(3; Importe; Decimal)
        {
            Caption = 'Importe';
            ToolTip = 'Specifies the value of the Importe field.';
        }
        field(4; Base; Decimal)
        {
            Caption = 'Base';
            ToolTip = 'Specifies the value of the Base field.';
        }
        field(5; Total; Decimal)
        {
            Caption = 'Total';
            ToolTip = 'Specifies the value of the Total field.';
        }
        field(6; "Número"; Code[10])
        {
            Caption = 'Number';
            ToolTip = 'Specifies the value of the Number field.';
        }
        field(7; "Título"; Text[80])
        {
            Caption = 'Título';
            ToolTip = 'Specifies the value of the Título field.';
        }
        field(8; "Tipo base"; Boolean)
        {
            Caption = 'Tipo base';
            ToolTip = 'Specifies the value of the Tipo base field.';
        }
        field(9; "No. línea"; Code[10])
        {
            Caption = 'Line No.';
            ToolTip = 'Specifies the value of the Line No field.';
        }
        field(10; Formla; Text[30])
        {
            Caption = 'Formla';
            ToolTip = 'Specifies the value of the Formla field.';
        }
        field(11; "Para formula"; Boolean)
        {
            Caption = 'Para formula';
            ToolTip = 'Specifies the value of the Para formula field.';
        }
        field(12; Fila1; Code[10])
        {
            Caption = 'Fila1';
            ToolTip = 'Specifies the value of the Fila1 field.';
        }
        field(13; Fila2; Code[10])
        {
            Caption = 'Fila2';
            ToolTip = 'Specifies the value of the Fila2 field.';
        }
        field(14; Fila3; Code[10])
        {
            Caption = 'Fila3';
            ToolTip = 'Specifies the value of the Fila3 field.';
        }
        field(15; Fila4; Code[10])
        {
            Caption = 'Fila4';
            ToolTip = 'Specifies the value of the Fila4 field.';
        }
        field(16; Fila5; Code[10])
        {
            Caption = 'Fila5';
            ToolTip = 'Specifies the value of the Fila5 field.';
        }
        field(17; Fila6; Code[10])
        {
            Caption = 'Fila6';
            ToolTip = 'Specifies the value of the Fila6 field.';
        }
        field(18; Fila7; Code[10])
        {
            Caption = 'Fila7';
            ToolTip = 'Specifies the value of the Fila7 field.';
        }
        field(19; Fila8; Code[10])
        {
            Caption = 'Fila8';
            ToolTip = 'Specifies the value of the Fila8 field.';
        }
        field(20; Fila9; Code[10])
        {
            Caption = 'Fila9';
            ToolTip = 'Specifies the value of the Fila9 field.';
        }
        field(21; Fila10; Code[10])
        {
            Caption = 'Fila10';
            ToolTip = 'Specifies the value of the Fila10 field.';
        }
        field(22; Imprimir; Boolean)
        {
            Caption = 'Imprimir';
            ToolTip = 'Specifies the value of the Imprimir field.';
        }
        field(23; Fila11; Code[10])
        {
            Caption = 'Fila11';
            ToolTip = 'Specifies the value of the Fila11 field.';
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

