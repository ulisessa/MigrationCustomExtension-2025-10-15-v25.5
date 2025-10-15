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
            TableRelation = Dimension;
        }
        field(50001; "CI Dimension"; Code[20])
        {
            Caption = 'CI Dimension';
            TableRelation = Dimension;
        }
        field(50002; "LE Dimension"; Code[20])
        {
            Caption = 'LE Dimension';
            TableRelation = Dimension;
        }
        field(50003; "CUIL Dimension"; Code[20])
        {
            Caption = 'CUIL Dimension';
            TableRelation = Dimension;
        }
        field(50004; "TNS SID"; Text[250])
        {
            Caption = 'SID TNS';
            DataClassification = ToBeClassified;
        }
        field(50005; "Meta4 userid"; Text[30])
        {
            Caption = 'Meta4 usuario';
            DataClassification = ToBeClassified;
        }
        field(50006; "Meta4 password"; Text[30])
        {
            Caption = 'Meta4 contraseña';
            DataClassification = ToBeClassified;
            ExtendedDatatype = Masked;
        }
        field(50007; "Nombre libro nomina"; Code[10])
        {
            Caption = 'Nombre libro nomina';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template".Name;
        }
        field(50008; "Nombre sección nomina"; Code[10])
        {
            Caption = 'Nombre sección nomina';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Nombre libro nomina"));
        }
        field(50009; "Nombre sección nomina temporal"; Code[10])
        {
            Caption = 'Nombre sección nomina temporal';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Nombre libro nomina"));
        }
        field(50010; "Union dimension"; Code[10])
        {
            Caption = 'Dimensión sindicato';
            DataClassification = ToBeClassified;
            TableRelation = Dimension;
        }
        field(50011; "ID Empresa Meta4"; Code[2])
        {
            DataClassification = ToBeClassified;
        }
    }
}

