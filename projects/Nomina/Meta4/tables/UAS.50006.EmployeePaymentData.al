table 50006 "Employee payment data"
{
    Caption = 'Datos pago empleado';

    fields
    {
        field(1; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            ToolTip = 'Specifies the value of the Employee No field.';
            NotBlank = true;
            TableRelation = Employee;
        }
        field(2; "Id. dato pago"; Code[10])
        {
            Caption = 'Id. dato pago';
            ToolTip = 'Specifies the value of the Id. dato pago field.';
        }
        field(3; "Fecha inicial"; Date)
        {
            Caption = 'Fecha inicial';
            ToolTip = 'Specifies the value of the Fecha inicial field.';
        }
        field(4; "Fecha final"; Date)
        {
            Caption = 'Fecha final';
            ToolTip = 'Specifies the value of the Fecha final field.';
        }
        field(5; Banco; Code[10])
        {
            Caption = 'Banco';
            ToolTip = 'Specifies the value of the Banco field.';
        }
        field(6; Agencia; Code[10])
        {
            Caption = 'Agencia';
            ToolTip = 'Specifies the value of the Agencia field.';
        }
        field(7; "No. cuenta"; Code[20])
        {
            Caption = 'No. cuenta';
            ToolTip = 'Specifies the value of the No. cuenta field.';
        }
        field(8; "Cód. forma pago"; Code[10])
        {
            Caption = 'Payment Method Code';
            ToolTip = 'Specifies the value of the Payment Method Code field.';
        }
        field(9; "Cód. centro pago"; Code[10])
        {
            Caption = 'Cód. centro pago';
            ToolTip = 'Specifies the value of the Cód. centro pago field.';
        }
        field(10; Name; Text[30])
        {
            Caption = 'Name';
            ToolTip = 'Specifies the value of the Name field.';
        }
        field(11; "First Family Name"; Text[30])
        {
            Caption = 'First Family Name';
            ToolTip = 'Specifies the value of the First Family Name field.';
        }
        field(12; "Second Family Name"; Text[30])
        {
            Caption = 'Second Family Name';
            ToolTip = 'Specifies the value of the Second Family Name field.';
        }
        field(13; "Id. legal"; Code[10])
        {
            Caption = 'Id. legal';
            ToolTip = 'Specifies the value of the Id. legal field.';
        }
        field(14; "Tipo cuenta"; Option)
        {
            Caption = 'Tipo cuenta';
            ToolTip = 'Specifies the value of the Tipo cuenta field.';
            OptionMembers = CA,CC;
        }
        field(15; "No. sucursal"; Code[20])
        {
            Caption = 'No. sucursal';
            ToolTip = 'Specifies the value of the No. sucursal field.';
        }
    }

    keys
    {
        key(Key1; "Employee No.", "Id. dato pago")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

