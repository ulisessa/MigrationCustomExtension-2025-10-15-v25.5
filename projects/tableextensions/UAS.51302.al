tableextension 51302 tableextension51302 extends "Custom Report Selection"
{
    Caption = 'Custom Report Selection';
    fields
    {
        modify("Source No.")
        {
            Caption = 'Source No.';
        }
        modify("Report Caption")
        {
            Caption = 'Report Caption';
        }
        modify("Custom Report Layout Code")
        {
            Caption = 'Custom Report Layout Code';
        }
        modify("Custom Report Description")
        {
            Caption = 'Custom Report Description';
        }
        modify("Send To Email")
        {
            Caption = 'Send To Email';
        }
        modify("Use for Email Attachment")
        {
            Caption = 'Use for Email Attachment';
        }
        modify("Use for Email Body")
        {
            Caption = 'Use for Email Body';
        }
        modify("Email Body Layout Code")
        {
            Caption = 'Email Body Layout Code';
        }
        modify("Email Body Layout Description")
        {
            Caption = 'Email Body Layout Description';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "EmailBodyIsAlreadyDefinedErr(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //EmailBodyIsAlreadyDefinedErr : @@@="%1 = Usage, for example Sales Invoice";ENU=An email body is already defined for %1.;ESP=Ya hay un cuerpo del correo electrónico definido para %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //EmailBodyIsAlreadyDefinedErr : @@@="%1 = Usage, for example Sales Invoice";ENU=An email body is already defined for %1.;ESP=Ya hay un cuerpo del correo electrónico definido para %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CannotBeUsedAsAnEmailBodyErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotBeUsedAsAnEmailBodyErr : @@@="%1 = Report ID,%2 = Type";ENU=Report %1 uses the %2, which cannot be used as an email body.;ESP=El informe %1 usa el tipo %2, que no se puede usar como cuerpo del correo electrónico.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotBeUsedAsAnEmailBodyErr : @@@="%1 = Report ID,%2 = Type";ENU=Report %1 uses the %2, which cannot be used as an email body.;ESP=El informe %1 usa el tipo %2, que no se puede usar como cuerpo del correo electrónico.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "TargetEmailAddressErr(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //TargetEmailAddressErr : @@@=%1 - RecordID;ENU=The target email address has not been specified in %1.;ESP=No se ha especificado la dirección de correo electrónico de destino en %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TargetEmailAddressErr : @@@=%1 - RecordID;ENU=The target email address has not been specified in %1.;ESP=No se ha especificado la dirección de correo electrónico de destino en %1.;
    //Variable type has not been exported.
}

