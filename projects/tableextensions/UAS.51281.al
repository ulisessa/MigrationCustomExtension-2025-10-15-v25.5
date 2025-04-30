tableextension 51281 tableextension51281 extends "Time Sheet Header"
{
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Resource No.")
        {
            Caption = 'Resource No.';
        }
        modify("Job No. Filter")
        {
            Caption = 'Job No. Filter';
        }
        modify("Job Task No. Filter")
        {
            Caption = 'Job Task No. Filter';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=%1 does not contain lines.;ESP=%1 no contiene líneas.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=%1 does not contain lines.;ESP=%1 no contiene líneas.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "PrivacyBlockedErr(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //PrivacyBlockedErr : @@@="%1=resource no.";ENU=You cannot use resource %1 because they are marked as blocked due to privacy.;ESP=No puede usar el recurso %1 porque está marcado como bloqueado por motivos de privacidad.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PrivacyBlockedErr : @@@="%1=resource no.";ENU=You cannot use resource %1 because they are marked as blocked due to privacy.;ESP=No puede usar el recurso %1 porque está marcado como bloqueado por motivos de privacidad.;
    //Variable type has not been exported.
}

