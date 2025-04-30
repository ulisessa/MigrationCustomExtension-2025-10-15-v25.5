table 50400 "AFIP Interface Register"
{

    fields
    {
        field(1; "Entry no."; Integer)
        {
            Caption = 'No. mov.';
            DataClassification = ToBeClassified;
        }
        field(2; Service; Text[30])
        {
            Caption = 'Servicio';
            DataClassification = ToBeClassified;
        }
        field(3; Source; Text[100])
        {
            Caption = 'Origen';
            DataClassification = ToBeClassified;
        }
        field(4; Destination; Text[100])
        {
            Caption = 'Destino';
            DataClassification = ToBeClassified;
        }
        field(5; UniqueID; Text[30])
        {
            Caption = 'UniqueID';
            DataClassification = ToBeClassified;
        }
        field(6; GenerationTime; DateTime)
        {
            Caption = 'Generación';
            DataClassification = ToBeClassified;
        }
        field(7; ExpirationTime; DateTime)
        {
            Caption = 'Expiración';
            DataClassification = ToBeClassified;
        }
        field(8; Token; BLOB)
        {
            Caption = 'Token';
            DataClassification = ToBeClassified;
        }
        field(9; Sign; BLOB)
        {
            Caption = 'Sign';
            DataClassification = ToBeClassified;
        }
        field(10; File; BLOB)
        {
            Caption = 'Archivo';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry no.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

