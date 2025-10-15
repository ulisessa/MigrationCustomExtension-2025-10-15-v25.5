tableextension 50170 "Inc. Doc. Att. Overview Ext." extends "Inc. Doc. Attachment Overview"
{
    fields
    {
        modify("Incoming Document Entry No.")
        {
            Caption = 'Incoming Document Entry No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Created Date-Time")
        {
            Caption = 'Created Date-Time';
        }
        modify(Type)
        {
            OptionCaption = ' ,Image,PDF,Word,Excel,PowerPoint,Email,XML,Other';
        }
        modify("File Extension")
        {
            Caption = 'File Extension';
        }
        modify("Attachment Type")
        {
            OptionCaption = ',Group,Main Attachment,OCR Result,Supporting Attachment,Link';
        }
        modify("Sorting Order")
        {
            Caption = 'Sorting Order';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "NotAvailableAttachmentMsg(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //NotAvailableAttachmentMsg : ENU=The attachment is no longer available.;ESP=El archivo adjunto ya no está disponible.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NotAvailableAttachmentMsg : ENU=The attachment is no longer available.;ESP=El archivo adjunto ya no está disponible.;
    //Variable type has not been exported.
}

