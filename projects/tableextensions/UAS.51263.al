tableextension 51263 tableextension51263 extends "Support Contact Information"
{
    Caption = 'Support Contact Information';
    fields
    {
        modify(Email)
        {
            Caption = 'Email';
        }
        modify(URL)
        {
            Caption = 'URL';
        }
    }
}

