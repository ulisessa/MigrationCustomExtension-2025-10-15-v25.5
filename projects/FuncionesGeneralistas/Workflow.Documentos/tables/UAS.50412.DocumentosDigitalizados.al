table 50412 "Documentos digitalizados"
{

    fields
    {
        field(1; Linea; Integer)
        {
        }
        field(2; Archivo; Text[250])
        {

        }
        field(3; "Nivel 1"; Code[20])
        {
        }
        field(4; "Nivel 2"; Code[20])
        {
        }
        field(5; "Nivel 3"; Code[20])
        {
        }
        field(6; "Nivel 4"; Code[30])
        {
        }
        field(7; "Nivel 5"; Code[20])
        {
        }
        field(8; "Nivel 6"; Code[30])
        {
        }
        field(9; "Nivel 7"; Code[30])
        {
        }
        field(10; "Nivel 8"; Code[30])
        {
        }
        field(11; "Nivel 9"; Code[30])
        {
        }
        field(12; "Nivel 10"; Code[30])
        {
        }
        field(13; "Nivel 11"; Code[30])
        {
        }
        field(20; "Ruta específica"; Code[10])
        {
        }
        field(21; Existe; Boolean)
        {
        }
        field(22; Estado; Text[50])
        {
        }
        field(23; BlobFile; BLOB)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "QR AFIP"; BLOB)
        {
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

