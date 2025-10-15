tableextension 50171 "Unlinked Attachment Ext." extends "Unlinked Attachment"
{
    fields
    {
        modify("Created Date-Time")
        {
            Caption = 'Created Date-Time';
        }
        modify(Type)
        {
            OptionCaption = ' ,Image,PDF,Word,Excel,PowerPoint,Email,XML,Other';
        }
    }
}

