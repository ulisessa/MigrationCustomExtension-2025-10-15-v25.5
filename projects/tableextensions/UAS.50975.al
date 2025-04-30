tableextension 50975 tableextension50975 extends "Azure AD Mgt. Setup"
{
    Caption = 'Azure AD Mgt. Setup';
    fields
    {
        modify("Auth Flow Codeunit ID")
        {
            Caption = 'Auth Flow Codeunit ID';
        }
        modify("Azure AD User Mgt. Codeunit ID")
        {
            Caption = 'Azure AD User Mgt. Codeunit ID';
        }

    }
}

