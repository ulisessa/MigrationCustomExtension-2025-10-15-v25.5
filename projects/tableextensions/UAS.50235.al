tableextension 50235 "Office Admin. Credentials Ext." extends "Office Admin. Credentials"
{
    fields
    {
        modify(Email)
        {
            Caption = 'Email';
        }
        modify(Password)
        {
            Caption = 'Password';
        }
    }
}

