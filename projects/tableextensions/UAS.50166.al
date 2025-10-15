tableextension 50166 "Incoming Document Att. Ext." extends "Incoming Document Attachment"
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
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("Document Table No. Filter")
        {
            Caption = 'Document Table No. Filter';
        }
        modify("Document No. Filter")
        {
            Caption = 'Document No. Filter';
        }
        modify("Journal Line No. Filter")
        {
            Caption = 'Journal Line No. Filter';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "DeleteQst(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //DeleteQst : ENU=Do you want to delete the attachment?;ESP=¿Confirma que desea eliminar el archivo adjunto?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DeleteQst : ENU=Do you want to delete the attachment?;ESP=?Confirma que desea eliminar el archivo adjunto?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "NotifIncDocCompletedMsg(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //NotifIncDocCompletedMsg : ENU=The action to create an incoming document from file has completed.;ESP=Se completó la acción de crear un documento entrante desde el archivo.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NotifIncDocCompletedMsg : ENU=The action to create an incoming document from file has completed.;ESP=Se completó la acción de crear un documento entrante desde el archivo.;
    //Variable type has not been exported.
}

