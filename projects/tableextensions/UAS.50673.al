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
            Caption = 'Fecha inicial';
            ToolTip = 'Specifies the value of the Fecha inicial field.';
        }
        field(50001; "Fecha final"; Date)
        {
            Caption = 'Fecha final';
            ToolTip = 'Specifies the value of the Fecha final field.';
        }
        field(50002; "Gínero"; Option)
        {
            Caption = 'Gender';
            ToolTip = 'Specifies the value of the Gender field.';
            OptionCaption = ' ,Female,Male';
            OptionMembers = " ",Female,Male;
        }
        field(50003; "Tipo de documento"; Integer)
        {
            Caption = 'Tipo de documento';
            ToolTip = 'Specifies the value of the Tipo de documento field.';
        }
        field(50004; "No. documento"; Text[30])
        {
            Caption = 'Document No.';
            ToolTip = 'Specifies the value of the Document No field.';
        }
        field(50005; "Tipo asignación"; Option)
        {
            Caption = 'Tipo asignación';
            ToolTip = 'Specifies the value of the Tipo asignación field.';
            OptionMembers = "No está a cargo",Prenatal,"A Cargo","Esposa trabaja con hijo menor de 4 años","Esposa que trabaja y no está a cargo";
        }
        field(50006; Incapacidad; Boolean)
        {
            Caption = 'Incapacidad';
            ToolTip = 'Specifies the value of the Incapacidad field.';
        }
        field(50007; "Fecha presentación certificado"; Date)
        {
            Caption = 'Fecha presentación certificado';
            ToolTip = 'Specifies the value of the Fecha presentación certificado field.';
        }
        field(50008; "Fecha alta impuesto"; Date)
        {
            Caption = 'Fecha alta impuesto';
            ToolTip = 'Specifies the value of the Fecha alta impuesto field.';
        }
        field(50009; "Fecha baja impuesto"; Date)
        {
            Caption = 'Fecha baja impuesto';
            ToolTip = 'Specifies the value of the Fecha baja impuesto field.';
        }
        field(50010; "Fecha alta familiar a cargo"; Date)
        {
            Caption = 'Fecha alta familiar a cargo';
            ToolTip = 'Specifies the value of the Fecha alta familiar a cargo field.';
        }
        field(50011; "Fecha baja familiar a cargo"; Date)
        {
            Caption = 'Fecha baja familiar a cargo';
            ToolTip = 'Specifies the value of the Fecha baja familiar a cargo field.';
        }
        field(50012; "Fecha inicio embargo"; Date)
        {
            Caption = 'Fecha inicio embargo';
            ToolTip = 'Specifies the value of the Fecha inicio embargo field.';
        }
        field(50013; "Ocupación"; Option)
        {
            Caption = 'Ocupación';
            ToolTip = 'Specifies the value of the Ocupación field.';
            OptionMembers = Otros,Estudiante,Empleado;
        }
        field(50014; "Fecha declaración jurada"; Date)
        {
            Caption = 'Fecha declaración jurada';
            ToolTip = 'Specifies the value of the Fecha declaración jurada field.';
        }
        field(50015; "No. ordinal"; Integer)
        {
            Caption = 'No. ordinal';
            ToolTip = 'Specifies the value of the No. ordinal field.';
        }
        field(50016; Alias; Text[100])
        {
            Caption = 'Alias';
            ToolTip = 'Specifies the value of the Alias field.';
        }
    }
}

