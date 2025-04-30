tableextension 50050 tableextension50050 extends "SII Setup"
{
    Caption = 'SII VAT Setup';
    fields
    {
        modify("Enable Batch Submissions")
        {
            Caption = 'Enable Batch Submissions';
        }
        modify("Job Batch Submission Threshold")
        {
            Caption = 'Job Batch Submission Threshold';
        }
        modify("Do Not Export Negative Lines")
        {
            Caption = 'Do Not Export Negative Lines';
        }
        modify("Auto Missing Entries Check")
        {
            Caption = 'Auto Missing Entries Check';
        }
        modify("Operation Date")
        {
            Caption = 'Operation Date';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "CannotEnableWithoutCertificateErr(Variable 1100000)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotEnableWithoutCertificateErr : ENU=The setup cannot be enabled without a valid certificate.;ESP=No se puede activar la configuración sin un certificado válido.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotEnableWithoutCertificateErr : ENU=The setup cannot be enabled without a valid certificate.;ESP=No se puede activar la configuración sin un certificado válido.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CertificatePasswordIncorrectErr(Variable 1100001)".

    //var
    //>>>> ORIGINAL VALUE:
    //CertificatePasswordIncorrectErr : ENU=The certificate could not get loaded. The password for the certificate may be incorrect.;ESP=No se pudo cargar el certificado. Puede que la contraseña del certificado sea incorrecta.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CertificatePasswordIncorrectErr : ENU=The certificate could not get loaded. The password for the certificate may be incorrect.;ESP=No se pudo cargar el certificado. Puede que la contraseña del certificado sea incorrecta.;
    //Variable type has not been exported.
}

