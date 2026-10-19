tableextension 50686 tableextension50686 extends "Human Resources Setup"
{
    fields
    {
        modify("Employee Nos.")
        {
            Caption = 'Employee Nos.';
        }
        modify("Automatically Create Resource")
        {
            Caption = 'Automatically Create Resource';
        }
        field(50000; "DNI Dimension"; Code[20])
        {
            Caption = 'DNI Dimension';
            ToolTip = 'Specifies the value of the DNI Dimension field.';
            TableRelation = Dimension;
        }
        field(50001; "CI Dimension"; Code[20])
        {
            Caption = 'CI Dimension';
            ToolTip = 'Specifies the value of the CI Dimension field.';
            TableRelation = Dimension;
        }
        field(50002; "LE Dimension"; Code[20])
        {
            Caption = 'LE Dimension';
            ToolTip = 'Specifies the value of the LE Dimension field.';
            TableRelation = Dimension;
        }
        field(50003; "CUIL Dimension"; Code[20])
        {
            Caption = 'CUIL Dimension';
            ToolTip = 'Specifies the value of the CUIL Dimension field.';
            TableRelation = Dimension;
        }
        field(50004; "TNS SID"; Text[250])
        {
            Caption = 'SID TNS';
            ToolTip = 'Specifies the value of the SID TNS field.';
            DataClassification = ToBeClassified;
        }
        field(50005; "Meta4 userid"; Text[30])
        {
            Caption = 'Meta4 usuario';
            ToolTip = 'Specifies the value of the Meta4 usuario field.';
            DataClassification = ToBeClassified;
        }
        field(50006; "Meta4 password"; Text[30])
        {
            Caption = 'Meta4 contraseña';
            ToolTip = 'Specifies the value of the Meta4 contraseña field.';
            DataClassification = ToBeClassified;
            ExtendedDatatype = Masked;
        }
        field(50007; "Nombre libro nomina"; Code[10])
        {
            Caption = 'Nombre libro nomina';
            ToolTip = 'Specifies the value of the Nombre libro nomina field.';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template".Name;
        }
        field(50008; "Nombre sección nomina"; Code[10])
        {
            Caption = 'Nombre sección nomina';
            ToolTip = 'Specifies the value of the Nombre sección nomina field.';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Nombre libro nomina"));
        }
        field(50009; "Nombre sección nomina temporal"; Code[10])
        {
            Caption = 'Nombre sección nomina temporal';
            ToolTip = 'Specifies the value of the Nombre sección nomina temporal field.';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Nombre libro nomina"));
        }
        field(50010; "Union dimension"; Code[10])
        {
            Caption = 'Dimensión sindicato';
            ToolTip = 'Specifies the value of the Dimensión sindicato field.';
            DataClassification = ToBeClassified;
            TableRelation = Dimension;
        }
        field(50011; "ID Empresa Meta4"; Code[2])
        {
            Caption = 'ID Empresa Meta4';
            ToolTip = 'Specifies the value of the ID Empresa Meta4 field.';
            DataClassification = ToBeClassified;
        }
    }
}

