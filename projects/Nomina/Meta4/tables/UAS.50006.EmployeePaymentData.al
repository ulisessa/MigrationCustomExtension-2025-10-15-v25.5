table 50006 "Employee payment data"
{
    Caption = 'Datos pago empleado';

    fields
    {
        field(1; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            NotBlank = true;
            TableRelation = Employee;
        }
        field(2; "Id. dato pago"; Code[10])
        {
        }
        field(3; "Fecha inicial"; Date)
        {
        }
        field(4; "Fecha final"; Date)
        {
        }
        field(5; Banco; Code[10])
        {
        }
        field(6; Agencia; Code[10])
        {
        }
        field(7; "No. cuenta"; Code[20])
        {
        }
        field(8; "Cód. forma pago"; Code[10])
        {
        }
        field(9; "Cód. centro pago"; Code[10])
        {
        }
        field(10; Name; Text[30])
        {
            Caption = 'Name';
        }
        field(11; "First Family Name"; Text[30])
        {
            Caption = 'First Family Name';
        }
        field(12; "Second Family Name"; Text[30])
        {
            Caption = 'Second Family Name';
        }
        field(13; "Id. legal"; Code[10])
        {
        }
        field(14; "Tipo cuenta"; Option)
        {
            OptionMembers = CA,CC;
        }
        field(15; "No. sucursal"; Code[20])
        {
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

