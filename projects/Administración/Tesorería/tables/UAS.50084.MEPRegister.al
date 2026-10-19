table 50084 "MEP Register"
{
    Caption = 'MEP Register';
    LookupPageID = "G/L Registers";

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
            ToolTip = 'Specifies the value of the No field.';
        }
        field(2; "From Entry No."; Integer)
        {
            Caption = 'From Entry No.';
            ToolTip = 'Specifies the value of the From Entry No field.';
            TableRelation = "G/L Entry";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(3; "To Entry No."; Integer)
        {
            Caption = 'To Entry No.';
            ToolTip = 'Specifies the value of the To Entry No field.';
            TableRelation = "G/L Entry";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(4; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
            ToolTip = 'Specifies the value of the Creation Date field.';
        }
        field(5; "Registro ID"; Code[2])
        {
            Caption = 'Registro ID';
            ToolTip = 'Specifies the value of the Registro ID field.';
            DataClassification = ToBeClassified;
        }
        field(6; "File id."; Text[20])
        {
            Caption = 'Id de archivo';
            ToolTip = 'Specifies the value of the Id de archivo field.';
            DataClassification = ToBeClassified;
        }
        field(7; "File creation date"; Time)
        {
            Caption = 'File creation date';
            ToolTip = 'Specifies the value of the File creation date field.';
            DataClassification = ToBeClassified;
        }
        field(8; "File sequential no."; Integer)
        {
            Caption = 'Nro. secuencial del archivo p/adherente';
            ToolTip = 'Specifies the value of the Nro. secuencial del archivo p/adherente field.';
            DataClassification = ToBeClassified;
        }
        field(9; "File identification"; Code[11])
        {
            Caption = 'Identificación de archivo';
            ToolTip = 'Specifies the value of the Identificación de archivo field.';
            DataClassification = ToBeClassified;
        }
        field(10; "Agreement no."; Integer)
        {
            Caption = 'Nro. de convenio';
            ToolTip = 'Specifies the value of the Nro. de convenio field.';
            DataClassification = ToBeClassified;
        }
        field(11; "Lot date"; Date)
        {
            Caption = 'Fecha del lote';
            ToolTip = 'Specifies the value of the Fecha del lote field.';
            DataClassification = ToBeClassified;
        }
        field(12; "Immediate execution"; Boolean)
        {
            Caption = 'Ejecución inmediata';
            ToolTip = 'Specifies the value of the Ejecución inmediata field.';
            DataClassification = ToBeClassified;
        }
        field(13; Informant; Code[3])
        {
            Caption = 'Informante';
            ToolTip = 'Specifies the value of the Informante field.';
            DataClassification = ToBeClassified;
        }
        field(14; "Informant no."; Integer)
        {
            Caption = 'No. informante';
            ToolTip = 'Specifies the value of the No. informante field.';
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

