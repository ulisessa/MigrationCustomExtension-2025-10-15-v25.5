tableextension 50176 "Named Forward Link Ext." extends "Named Forward Link"
{
    Caption = 'Named Forward Link';
    fields
    {
        modify(Description)
        {
            Caption = 'Description';
        }
        modify(Link)
        {
            Caption = 'Link';
        }
    }
}

