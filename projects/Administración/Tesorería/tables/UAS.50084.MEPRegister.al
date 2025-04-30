table 50084 "MEP Register"
{
    Caption = 'MEP Register';
    LookupPageID = "G/L Registers";

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
        }
        field(2; "From Entry No."; Integer)
        {
            Caption = 'From Entry No.';
            TableRelation = "G/L Entry";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(3; "To Entry No."; Integer)
        {
            Caption = 'To Entry No.';
            TableRelation = "G/L Entry";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(4; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
        }
        field(5; "Registro ID"; Code[2])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "File id."; Text[20])
        {
            Caption = 'Id de archivo';
            DataClassification = ToBeClassified;
        }
        field(7; "File creation date"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "File sequential no."; Integer)
        {
            Caption = 'Nro. secuencial del archivo p/adherente';
            DataClassification = ToBeClassified;
        }
        field(9; "File identification"; Code[11])
        {
            Caption = 'Identificación de archivo';
            DataClassification = ToBeClassified;
        }
        field(10; "Agreement no."; Integer)
        {
            Caption = 'Nro. de convenio';
            DataClassification = ToBeClassified;
        }
        field(11; "Lot date"; Date)
        {
            Caption = 'Fecha del lote';
            DataClassification = ToBeClassified;
        }
        field(12; "Immediate execution"; Boolean)
        {
            Caption = 'Ejecución inmediata';
            DataClassification = ToBeClassified;
        }
        field(13; Informant; Code[3])
        {
            Caption = 'Informante';
            DataClassification = ToBeClassified;
        }
        field(14; "Informant no."; Integer)
        {
            Caption = 'No. informante';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Creation Date")
        {
        }
        key(Key3; "Registro ID", "File creation date", "Creation Date")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", "From Entry No.", "To Entry No.", "Creation Date", "Registro ID")
        {
        }
    }
}

