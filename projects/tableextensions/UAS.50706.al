tableextension 50706 tableextension50706 extends "Exchange Service Setup"
{
    Caption = 'Exchange Service Setup';
    fields
    {
        modify("Azure AD App. ID")
        {
            Caption = 'Azure AD App. ID';
        }
        modify("Azure AD App. Cert. Thumbprint")
        {
            Caption = 'Azure AD App. Cert. Thumbprint';
        }
        modify("Azure AD Auth. Endpoint")
        {
            Caption = 'Azure AD Auth. Endpoint';
        }
    }
}

