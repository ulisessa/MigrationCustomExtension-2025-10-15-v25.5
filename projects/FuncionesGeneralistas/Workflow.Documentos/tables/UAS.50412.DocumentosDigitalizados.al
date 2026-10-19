table 50412 "Documentos digitalizados"
{

    fields
    {
        field(1; Linea; Integer)
        {
            Caption = 'Linea';
            ToolTip = 'Specifies the value of the Linea field.';
        }
        field(2; Archivo; Text[250])
        {
            Caption = 'Archivo';
            ToolTip = 'Specifies the value of the Archivo field.';

        }
        field(3; "Nivel 1"; Code[20])
        {
            Caption = 'Nivel 1';
            ToolTip = 'Specifies the value of the Nivel 1 field.';
        }
        field(4; "Nivel 2"; Code[20])
        {
            Caption = 'Nivel 2';
            ToolTip = 'Specifies the value of the Nivel 2 field.';
        }
        field(5; "Nivel 3"; Code[20])
        {
            Caption = 'Nivel 3';
            ToolTip = 'Specifies the value of the Nivel 3 field.';
        }
        field(6; "Nivel 4"; Code[30])
        {
            Caption = 'Nivel 4';
            ToolTip = 'Specifies the value of the Nivel 4 field.';
        }
        field(7; "Nivel 5"; Code[20])
        {
            Caption = 'Nivel 5';
            ToolTip = 'Specifies the value of the Nivel 5 field.';
        }
        field(8; "Nivel 6"; Code[30])
        {
            Caption = 'Nivel 6';
            ToolTip = 'Specifies the value of the Nivel 6 field.';
        }
        field(9; "Nivel 7"; Code[30])
        {
            Caption = 'Nivel 7';
            ToolTip = 'Specifies the value of the Nivel 7 field.';
        }
        field(10; "Nivel 8"; Code[30])
        {
            Caption = 'Nivel 8';
            ToolTip = 'Specifies the value of the Nivel 8 field.';
        }
        field(11; "Nivel 9"; Code[30])
        {
            Caption = 'Nivel 9';
            ToolTip = 'Specifies the value of the Nivel 9 field.';
        }
        field(12; "Nivel 10"; Code[30])
        {
            Caption = 'Nivel 10';
            ToolTip = 'Specifies the value of the Nivel 10 field.';
        }
        field(13; "Nivel 11"; Code[30])
        {
            Caption = 'Nivel 11';
            ToolTip = 'Specifies the value of the Nivel 11 field.';
        }
        field(20; "Ruta específica"; Code[10])
        {
            Caption = 'Ruta específica';
            ToolTip = 'Specifies the value of the Ruta específica field.';
        }
        field(21; Existe; Boolean)
        {
            Caption = 'Existe';
            ToolTip = 'Specifies the value of the Existe field.';
        }
        field(22; Estado; Text[50])
        {
            Caption = 'Estado';
            ToolTip = 'Specifies the value of the Estado field.';
        }
        field(23; BlobFile; BLOB)
        {
            Caption = 'BlobFile';
            ToolTip = 'Specifies the value of the BlobFile field.';
            DataClassification = ToBeClassified;
        }
        field(24; "QR AFIP"; BLOB)
        {
            Caption = 'QR AFIP';
            ToolTip = 'Specifies the value of the QR AFIP field.';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; Linea)
        {
            Clustered = true;
        }
        key(Key2; "Nivel 1")
        {
            MaintainSIFTIndex = false;
            MaintainSQLIndex = false;
        }
        key(Key3; "Nivel 2")
        {
            MaintainSIFTIndex = false;
            MaintainSQLIndex = false;
        }
        key(Key4; "Nivel 3")
        {
            MaintainSIFTIndex = false;
            MaintainSQLIndex = false;
        }
        key(Key5; "Nivel 4")
        {
        }
        key(Key6; "Nivel 5")
        {
            MaintainSIFTIndex = false;
            MaintainSQLIndex = false;
        }
        key(Key7; "Nivel 6")
        {
            MaintainSIFTIndex = false;
            MaintainSQLIndex = false;
        }
        key(Key8; "Nivel 7")
        {
            MaintainSIFTIndex = false;
            MaintainSQLIndex = false;
        }
        key(Key9; "Nivel 8")
        {
            MaintainSIFTIndex = false;
            MaintainSQLIndex = false;
            SQLIndex = "Nivel 8";
        }
        key(Key10; "Nivel 9")
        {
            MaintainSIFTIndex = false;
            MaintainSQLIndex = false;
        }
        key(Key11; "Nivel 10")
        {
            MaintainSIFTIndex = false;
            MaintainSQLIndex = false;
        }
        key(Key12; "Ruta específica")
        {
            MaintainSIFTIndex = false;
            MaintainSQLIndex = false;
        }
        key(Key13; Archivo)
        {
            MaintainSIFTIndex = false;
        }
        key(Key14; "Nivel 8", "Nivel 6")
        {
            SQLIndex = "Nivel 8", "Nivel 6";
        }
    }

    fieldgroups
    {
    }

    var
        rstInfoEmpresa: Record "Company Information";
}

