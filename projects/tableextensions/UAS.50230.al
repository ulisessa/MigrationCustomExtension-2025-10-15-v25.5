tableextension 50230 "Office Add-in Context Ext." extends "Office Add-in Context"
{
    fields
    {
        modify(Email)
        {
            Caption = 'Email';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify(Duration)
        {
            Caption = 'Duration';
        }
        modify(Version)
        {
            Caption = 'Version';
        }
        modify("Contact No.")
        {
            Caption = 'Contact No.';
        }
        modify("Item Type")
        {
            Caption = 'Item Type';
        }
    }
}

