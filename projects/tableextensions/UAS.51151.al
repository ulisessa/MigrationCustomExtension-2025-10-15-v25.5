tableextension 51151 tableextension51151 extends "Certificate of Supply"
{
    fields
    {
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Receipt Date")
        {
            Caption = 'Receipt Date';
        }
        modify("Shipment Method Code")
        {
            Caption = 'Shipment Method Code';
        }
        modify("Shipment/Posting Date")
        {
            Caption = 'Shipment/Posting Date';
        }
        modify("Ship-to Country/Region Code")
        {
            Caption = 'Ship-to Country/Region Code';
        }
        modify("Customer/Vendor No.")
        {
            Caption = 'Customer/Vendor No.';
        }
        modify("Vehicle Registration No.")
        {
            Caption = 'Vehicle Registration No.';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "RecDateCannotBeEmptyErr(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //RecDateCannotBeEmptyErr : ENU=The Receipt Date cannot be empty when Status is Received.;ESP=La fecha de recepción no puede estar vacía si el estado es Recibido.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RecDateCannotBeEmptyErr : ENU=The Receipt Date cannot be empty when Status is Received.;ESP=La fecha de recepción no puede estar vacía si el estado es Recibido.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "RecDateCannotBeEnteredErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //RecDateCannotBeEnteredErr : ENU=You can enter the Receipt Date only if the status of the Certificate of Supply is Received.;ESP=Puede escribir la fecha de recepción solo si el estado del certificado de suministro es Recibido.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RecDateCannotBeEnteredErr : ENU=You can enter the Receipt Date only if the status of the Certificate of Supply is Received.;ESP=Puede escribir la fecha de recepción solo si el estado del certificado de suministro es Recibido.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CertRecDateBeforeShipmPostDateErr(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //CertRecDateBeforeShipmPostDateErr : ENU=The Receipt Date of the certificate cannot be earlier than the Shipment/Posting Date.;ESP=La fecha de recepción del certificado no puede ser anterior a la fecha de envío o registro.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CertRecDateBeforeShipmPostDateErr : ENU=The Receipt Date of the certificate cannot be earlier than the Shipment/Posting Date.;ESP=La fecha de recepción del certificado no puede ser anterior a la fecha de envío o registro.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "NoCannotBeEnteredErr(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //NoCannotBeEnteredErr : ENU=The No. field cannot be filled in when the status of the Certificate of Supply is set to Not Applicable.;ESP=El campo No. no puede rellenarse si el estado del certificado de suministro se establece en No aplica.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NoCannotBeEnteredErr : ENU=The No. field cannot be filled in when the status of the Certificate of Supply is set to Not Applicable.;ESP=El campo No.no puede rellenarse si el estado del certificado de suministro se establece en No aplica.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "NoCannotBeEmptyErr(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //NoCannotBeEmptyErr : ENU=The No. field cannot be empty when the status of the Certificate of Supply is set to Required, Received, or Not Received.;ESP=El campo No. no puede estar vacío si el estado del certificado de suministro se establece en Obligatorio, Recibido o No recibido.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NoCannotBeEmptyErr : ENU=The No. field cannot be empty when the status of the Certificate of Supply is set to Required, Received, or Not Received.;ESP=El campo No.no puede estar vacío si el estado del certificado de suministro se establece en Obligatorio, Recibido o No recibido.;
    //Variable type has not been exported.
}

