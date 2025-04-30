tableextension 50360 tableextension50360 extends "VAT Reg. No. Srv Config"
{
    Caption = 'VAT Reg. No. Srv Config';
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Default Template Code")
        {
            Caption = 'Default Template Code';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "VATRegNoVIESSettingIsNotEnabledErr(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //VATRegNoVIESSettingIsNotEnabledErr : ENU=VAT Reg. No. Validation Setup is not enabled.;ESP=La Configuración de validación de CIF/NIF no está habilitada.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //VATRegNoVIESSettingIsNotEnabledErr : ENU=VAT Reg. No. Validation Setup is not enabled.;ESP=La Configuración de validación de CIF/NIF no está habilitada.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CannotInsertMultipleSettingsErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotInsertMultipleSettingsErr : ENU=You cannot insert multiple settings.;ESP=No puede insertar varias opciones de configuración.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotInsertMultipleSettingsErr : ENU=You cannot insert multiple settings.;ESP=No puede insertar varias opciones de configuración.;
    //Variable type has not been exported.
}

