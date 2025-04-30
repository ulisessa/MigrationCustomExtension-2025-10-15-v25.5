tableextension 50972 tableextension50972 extends "Azure AD App Setup"
{
    Caption = 'Azure AD App Setup';
    fields
    {
        modify("App ID")
        {
            Caption = 'App ID';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "OnlyOneRecordErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //OnlyOneRecordErr : ENU=There should be only one record for Azure AD App Setup.;ESP=Debería haber un único registro para la configuración de la aplicación de Azure AD.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //OnlyOneRecordErr : ENU=There should be only one record for Azure AD App Setup.;ESP=Debería haber un único registro para la configuración de la aplicación de Azure AD.;
    //Variable type has not been exported.
}

