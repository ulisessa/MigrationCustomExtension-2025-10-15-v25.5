table 50008 "Weighing Scale Parameters"
{

    fields
    {
        field(1; "Scale code"; Code[10])
        {
            Caption = 'Cód. balanza';
            DataClassification = ToBeClassified;
        }
        field(2; Name; Text[30])
        {
            Caption = 'Nombre balanza';
            DataClassification = ToBeClassified;
        }
        field(3; Port; Code[10])
        {
            Caption = 'Puerto';
            DataClassification = ToBeClassified;
        }
        field(4; "Baud Rate"; Integer)
        {
            Caption = 'Velocidad';
            DataClassification = ToBeClassified;
        }
        field(5; Parity; Option)
        {
            Caption = 'Paridad';
            DataClassification = ToBeClassified;
            OptionCaption = 'Par,Impar';
            OptionMembers = Even,Odd;
        }
        field(6; "Data Bits"; Integer)
        {
            Caption = 'Bits de datos';
            DataClassification = ToBeClassified;
        }
        field(7; "Stop Bits"; Option)
        {
            Caption = 'Bits de parada';
            DataClassification = ToBeClassified;
            OptionMembers = "1","2";
        }
        field(8; Handshake; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Ninguno,XOnXOff';
            OptionMembers = "None",XOnXOff;
        }
        field(9; "No. Lot"; Code[10])
        {
            Caption = 'Lot';
            DataClassification = ToBeClassified;
        }
        field(10; "Update Interval (ms)"; Integer)
        {
            Caption = 'Intervalo de actualización (ms)';
            DataClassification = ToBeClassified;
        }
        field(11; "Upward limit"; Integer)
        {
            Caption = 'Límite superior';
            DataClassification = ToBeClassified;
        }
        field(12; "Downward limit"; Integer)
        {
            Caption = 'Límite inferior';
            DataClassification = ToBeClassified;
        }
        field(13; "Serial no."; Code[10])
        {
            Caption = 'No. serie';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(14; "Scale seals"; Code[100])
        {
            Caption = 'Precintos balanza';
            DataClassification = ToBeClassified;
        }
        field(15; "Header seals"; Code[100])
        {
            Caption = 'Precintos cabezal';
            DataClassification = ToBeClassified;
        }
        field(16; "Periodic certification"; Code[10])
        {
            Caption = 'Certificación periódica';
            DataClassification = ToBeClassified;
        }
        field(17; "Periodic cert. expiration date"; Date)
        {
            Caption = 'Fecha expiración cert. periódica';
            DataClassification = ToBeClassified;
        }
        field(18; "IP address"; Text[15])
        {
            Caption = 'Dirección IP';
            DataClassification = ToBeClassified;
        }
        field(19; "TCP port"; Integer)
        {
            Caption = 'Puerto TCP';
            DataClassification = ToBeClassified;
        }
        field(20; "Connection method"; Option)
        {
            Caption = 'Método conexión';
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

