table 50008 "Weighing Scale Parameters"
{

    fields
    {
        field(1; "Scale code"; Code[10])
        {
            Caption = 'Cód. balanza';
            ToolTip = 'Specifies the value of the Cód. balanza field.';
            DataClassification = ToBeClassified;
        }
        field(2; Name; Text[30])
        {
            Caption = 'Nombre balanza';
            ToolTip = 'Specifies the value of the Nombre balanza field.';
            DataClassification = ToBeClassified;
        }
        field(3; Port; Code[10])
        {
            Caption = 'Puerto';
            ToolTip = 'Specifies the value of the Puerto field.';
            DataClassification = ToBeClassified;
        }
        field(4; "Baud Rate"; Integer)
        {
            Caption = 'Velocidad';
            ToolTip = 'Specifies the value of the Velocidad field.';
            DataClassification = ToBeClassified;
        }
        field(5; Parity; Option)
        {
            Caption = 'Paridad';
            ToolTip = 'Specifies the value of the Paridad field.';
            DataClassification = ToBeClassified;
            OptionCaption = 'Par,Impar';
            OptionMembers = Even,Odd;
        }
        field(6; "Data Bits"; Integer)
        {
            Caption = 'Bits de datos';
            ToolTip = 'Specifies the value of the Bits de datos field.';
            DataClassification = ToBeClassified;
        }
        field(7; "Stop Bits"; Option)
        {
            Caption = 'Bits de parada';
            ToolTip = 'Specifies the value of the Bits de parada field.';
            DataClassification = ToBeClassified;
            OptionMembers = "1","2";
        }
        field(8; Handshake; Option)
        {
            Caption = 'Handshake';
            ToolTip = 'Specifies the value of the Handshake field.';
            DataClassification = ToBeClassified;
            OptionCaption = 'Ninguno,XOnXOff';
            OptionMembers = "None",XOnXOff;
        }
        field(9; "No. Lot"; Code[10])
        {
            Caption = 'Lot';
            ToolTip = 'Specifies the value of the Lot field.';
            DataClassification = ToBeClassified;
        }
        field(10; "Update Interval (ms)"; Integer)
        {
            Caption = 'Intervalo de actualización (ms)';
            ToolTip = 'Specifies the value of the Intervalo de actualización (ms) field.';
            DataClassification = ToBeClassified;
        }
        field(11; "Upward limit"; Integer)
        {
            Caption = 'Límite superior';
            ToolTip = 'Specifies the value of the Límite superior field.';
            DataClassification = ToBeClassified;
        }
        field(12; "Downward limit"; Integer)
        {
            Caption = 'Límite inferior';
            ToolTip = 'Specifies the value of the Límite inferior field.';
            DataClassification = ToBeClassified;
        }
        field(13; "Serial no."; Code[10])
        {
            Caption = 'No. serie';
            ToolTip = 'Specifies the value of the No. serie field.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(14; "Scale seals"; Code[100])
        {
            Caption = 'Precintos balanza';
            ToolTip = 'Specifies the value of the Precintos balanza field.';
            DataClassification = ToBeClassified;
        }
        field(15; "Header seals"; Code[100])
        {
            Caption = 'Precintos cabezal';
            ToolTip = 'Specifies the value of the Precintos cabezal field.';
            DataClassification = ToBeClassified;
        }
        field(16; "Periodic certification"; Code[10])
        {
            Caption = 'Certificación periódica';
            ToolTip = 'Specifies the value of the Certificación periódica field.';
            DataClassification = ToBeClassified;
        }
        field(17; "Periodic cert. expiration date"; Date)
        {
            Caption = 'Fecha expiración cert. periódica';
            ToolTip = 'Specifies the value of the Fecha expiración cert. periódica field.';
            DataClassification = ToBeClassified;
        }
        field(18; "IP address"; Text[15])
        {
            Caption = 'Dirección IP';
            ToolTip = 'Specifies the value of the Dirección IP field.';
            DataClassification = ToBeClassified;
        }
        field(19; "TCP port"; Integer)
        {
            Caption = 'Puerto TCP';
            ToolTip = 'Specifies the value of the Puerto TCP field.';
            DataClassification = ToBeClassified;
        }
        field(20; "Connection method"; Option)
        {
            Caption = 'Método conexión';
            ToolTip = 'Specifies the value of the Método conexión field.';
            DataClassification = ToBeClassified;
            OptionCaption = 'Serie,TCP';
            OptionMembers = Serial,TCP;
        }
    }

    keys
    {
        key(Key1; "Scale code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

