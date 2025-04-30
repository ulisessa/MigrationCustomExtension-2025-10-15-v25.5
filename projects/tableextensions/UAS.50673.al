tableextension 50673 tableextension50673 extends "Employee Relative"
{
    fields
    {
        modify("Employee No.")
        {
            Caption = 'Employee No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Relative Code")
        {
            Caption = 'Relative Code';
        }
        modify("Phone No.")
        {
            Caption = 'Phone No.';
        }
        modify("Relative's Employee No.")
        {
            Caption = 'Relative''s Employee No.';
        }
        field(50000; "Fecha inicial"; Date)
        {
        }
        field(50001; "Fecha final"; Date)
        {
        }
        field(50002; "Gínero"; Option)
        {
            Caption = 'Gender';
            OptionCaption = ' ,Female,Male';
            OptionMembers = " ",Female,Male;
        }
        field(50003; "Tipo de documento"; Integer)
        {
        }
        field(50004; "No. documento"; Text[30])
        {
        }
        field(50005; "Tipo asignación"; Option)
        {
            OptionMembers = "No está a cargo",Prenatal,"A Cargo","Esposa trabaja con hijo menor de 4 años","Esposa que trabaja y no está a cargo";
        }
        field(50006; Incapacidad; Boolean)
        {
        }
        field(50007; "Fecha presentación certificado"; Date)
        {
        }
        field(50008; "Fecha alta impuesto"; Date)
        {
        }
        field(50009; "Fecha baja impuesto"; Date)
        {
        }
        field(50010; "Fecha alta familiar a cargo"; Date)
        {
        }
        field(50011; "Fecha baja familiar a cargo"; Date)
        {
        }
        field(50012; "Fecha inicio embargo"; Date)
        {
        }
        field(50013; "Ocupación"; Option)
        {
            OptionMembers = Otros,Estudiante,Empleado;
        }
        field(50014; "Fecha declaración jurada"; Date)
        {
        }
        field(50015; "No. ordinal"; Integer)
        {
        }
        field(50016; Alias; Text[100])
        {
        }
    }
}

