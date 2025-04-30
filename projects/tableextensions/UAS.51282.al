tableextension 51282 tableextension51282 extends "Email Item"
{
    Caption = 'Email Item';
    fields
    {
        modify("From Address")
        {
            Caption = 'From Address';
        }
        modify("Send CC")
        {
            Caption = 'Send CC';
        }
        modify("Send BCC")
        {
            Caption = 'Send BCC';
        }
        modify("Message Type")
        {
            OptionCaption = 'Custom Message,From Email Body Template';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "TargetEmailAddressErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //TargetEmailAddressErr : ENU=The target email address has not been specified.;ESP=No se ha especificado la dirección de correo electrónico de destino.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TargetEmailAddressErr : ENU=The target email address has not been specified.;ESP=No se ha especificado la dirección de correo electrónico de destino.;
    //Variable type has not been exported.
}

