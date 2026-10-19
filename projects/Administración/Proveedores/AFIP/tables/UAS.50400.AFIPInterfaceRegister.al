table 50400 "AFIP Interface Register"
{

    fields
    {
        field(1; "Entry no."; Integer)
        {
            Caption = 'No. mov.';
            ToolTip = 'Specifies the value of the No. mov field.';
            DataClassification = ToBeClassified;
        }
        field(2; Service; Text[30])
        {
            Caption = 'Servicio';
            ToolTip = 'Specifies the value of the Servicio field.';
            DataClassification = ToBeClassified;
        }
        field(3; Source; Text[100])
        {
            Caption = 'Origen';
            ToolTip = 'Specifies the value of the Origen field.';
            DataClassification = ToBeClassified;
        }
        field(4; Destination; Text[100])
        {
            Caption = 'Destination';
            ToolTip = 'Specifies the value of the Destination field.';
            DataClassification = ToBeClassified;
        }
        field(5; UniqueID; Text[30])
        {
            Caption = 'UniqueID';
            ToolTip = 'Specifies the value of the UniqueID field.';
            DataClassification = ToBeClassified;
        }
        field(6; GenerationTime; DateTime)
        {
            Caption = 'Generación';
            ToolTip = 'Specifies the value of the Generación field.';
            DataClassification = ToBeClassified;
        }
        field(7; ExpirationTime; DateTime)
        {
            Caption = 'Expiración';
            ToolTip = 'Specifies the value of the Expiración field.';
            DataClassification = ToBeClassified;
        }
        field(8; Token; BLOB)
        {
            Caption = 'Token';
            ToolTip = 'Specifies the value of the Token field.';
            DataClassification = ToBeClassified;
        }
        field(9; Sign; BLOB)
        {
            Caption = 'Sign';
            ToolTip = 'Specifies the value of the Sign field.';
            DataClassification = ToBeClassified;
        }
        field(10; File; BLOB)
        {
            Caption = 'Archivo';
            ToolTip = 'Specifies the value of the Archivo field.';
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

