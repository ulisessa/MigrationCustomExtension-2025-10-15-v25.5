tableextension 50077 "OAuth 2.0 Setup Ext." extends "OAuth 2.0 Setup"
{
    Caption = 'OAuth 2.0 Setup';
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Service URL")
        {
            Caption = 'Service URL';
        }
        modify("Redirect URL")
        {
            Caption = 'Redirect URL';
        }
        modify("Refresh Token")
        {
            Caption = 'Refresh Token';
        }
        modify("Authorization URL Path")
        {
            Caption = 'Authorization URL Path';
        }
        modify("Access Token URL Path")
        {
            Caption = 'Access Token URL Path';
        }
        modify("Refresh Token URL Path")
        {
            Caption = 'Refresh Token URL Path';
        }
        modify(Scope)
        {
            Caption = 'Scope';
        }
        modify("Authorization Response Type")
        {
            Caption = 'Authorization Response Type';
        }
        modify("Token DataScope")
        {
            OptionCaption = 'Module,User,Company,UserAndCompany';
        }
        modify("Daily Limit")
        {
            Caption = 'Daily Limit';
        }
        modify("Latest Datetime")
        {
            Caption = 'Latest Datetime';
        }
        modify("Feature GUID")
        {
            Caption = 'Feature GUID';
        }
    }
}

