tableextension 51119 tableextension51119 extends "VAT Report Archive"
{
    fields
    {
        modify("VAT Report No.")
        {
            Caption = 'VAT Report No.';
        }
        modify("Submission Message BLOB")
        {
            Caption = 'Submission Message BLOB';
        }
        modify("Submittion Date")
        {
            Caption = 'Submittion Date';
        }
        modify("Response Received Date")
        {
            Caption = 'Response Received Date';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "NoSubmissionMessageAvailableErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //NoSubmissionMessageAvailableErr : ENU=The submission message of the report is not available.;ESP=El mensaje de envío del informe no está disponible.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NoSubmissionMessageAvailableErr : ENU=The submission message of the report is not available.;ESP=El mensaje de envío del informe no está disponible.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "NoResponseMessageAvailableErr(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //NoResponseMessageAvailableErr : ENU=The response message of the report is not available.;ESP=El mensaje de respuesta del informe no está disponible.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NoResponseMessageAvailableErr : ENU=The response message of the report is not available.;ESP=El mensaje de respuesta del informe no está disponible.;
    //Variable type has not been exported.
}

