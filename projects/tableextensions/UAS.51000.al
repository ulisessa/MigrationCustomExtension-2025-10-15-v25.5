tableextension 51000 tableextension51000 extends "Exchange Sync"
{
    Caption = 'Exchange Sync';
    fields
    {
        modify("Exchange Service URI")
        {
            Caption = 'Exchange Service URI';
        }
        modify("Exchange Account Password Key")
        {
            Caption = 'Exchange Account Password Key';
        }
        modify("Last Sync Date Time")
        {
            Caption = 'Last Sync Date Time';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "EncryptionIsNotActivatedQst(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //EncryptionIsNotActivatedQst : ENU=Data encryption is not activated. It is recommended that you encrypt data. \Do you want to open the Data Encryption Management window?;ESP=El cifrado de datos no está activado. Se recomienda cifrar los datos. \¿Desea abrir la ventana Administración del cifrado de datos?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //EncryptionIsNotActivatedQst : ENU=Data encryption is not activated. It is recommended that you encrypt data. \Do you want to open the Data Encryption Management window?;ESP=El cifrado de datos no está activado. Se recomienda cifrar los datos. \?Desea abrir la ventana Administración del cifrado de datos?;
    //Variable type has not been exported.
}

