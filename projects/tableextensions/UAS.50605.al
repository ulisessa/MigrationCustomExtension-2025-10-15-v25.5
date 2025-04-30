tableextension 50605 tableextension50605 extends Attachment
{
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("File Extension")
        {
            Caption = 'File Extension';
        }
        modify("Last Date Modified")
        {
            Caption = 'Last Date Modified';
        }
        modify("Last Time Modified")
        {
            Caption = 'Last Time Modified';
        }
        modify("Merge Source")
        {
            Caption = 'Merge Source';
        }
        modify("Email Message Url")
        {
            Caption = 'Email Message Url';
        }
    }

    //Unsupported feature: Code Modification on "PreviewHTMLContent(PROCEDURE 30)".

    //procedure PreviewHTMLContent();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ContentPreview.SetContent(AttachmentMgt.LoadHTMLContent(Rec,SegmentLine));
    ContentPreview.RunModal;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //++Arbu ContentPreview.SetContent(AttachmentMgt.LoadHTMLContent(Rec,SegmentLine));
    ContentPreview.RunModal;
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=The attachment is empty.;ESP=El anexo está vacío.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=The attachment is empty.;ESP=El anexo está vacío.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text003 : ENU=Attachment is already in use on this machine.;ESP=El anexo ya está utilizándose en esta máquina.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : ENU=Attachment is already in use on this machine.;ESP=El anexo ya está utilizándose en esta máquina.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text004(Variable 1012)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text004 : ENU=The attachment file must be saved to disk before you can import it.\\Do you want to save the file?;ESP=El archivo adjunto debe guardarse en el disco antes de poder importarlo.\\¿Desea guardar el archivo?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text004 : ENU=The attachment file must be saved to disk before you can import it.\\Do you want to save the file?;ESP=El archivo adjunto debe guardarse en el disco antes de poder importarlo.\\?Desea guardar el archivo?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text009(Variable 1009)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text009 : ENU=Do you want to remove %1?;ESP=¿Confirma que desea eliminar %1?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text009 : ENU=Do you want to remove %1?;ESP=?Confirma que desea eliminar %1?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text015(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text015 : ENU=The email cannot be displayed or has been deleted.;ESP=No se puede mostrar el mensaje de correo electrónico o se eliminó.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text015 : ENU=The email cannot be displayed or has been deleted.;ESP=No se puede mostrar el mensaje de correo electrónico o se elimiNo.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text016(Variable 1011)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text016 : ENU=When you have finished working with a document, you should delete the associated temporary file. Please note that this will not delete the document.\\Do you want to delete the temporary file?;ESP=Cuando haya terminado de trabajar con un documento, debe borrar el archivo temporal asociado. Por favor, tenga en cuenta que esto no eliminará el documento.\\¿Desea borrar el archivo temporal?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text016 : ENU=When you have finished working with a document, you should delete the associated temporary file. Please note that this will not delete the document.\\Do you want to delete the temporary file?;ESP=Cuando haya terminado de trabajar con un documento, debe borrar el archivo temporal asociado. Por favor, tenga en cuenta que esto no eliminará el documento.\\?Desea borrar el archivo temporal?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text020(Variable 1022)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text020 : ENU=An Outlook dialog box is open. Close it and try again.;ESP=Hay un cuadro de diálogo de Outlook abierto. Ciérrelo e inténtelo de nuevo.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text020 : ENU=An Outlook dialog box is open. Close it and try again.;ESP=Hay un cuadro de diálogo de Outlook abierto. Ci?rrelo e inténtelo de nuevo.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CouldNotActivateOutlookErr(Variable 1023)".

    //var
    //>>>> ORIGINAL VALUE:
    //CouldNotActivateOutlookErr : @@@=%1 - product name;ENU=Cannot connect to Microsoft Outlook. If Microsoft Outlook is already running, make sure that you are not running either %1 or Microsoft Outlook as administrator. Close all instances of Microsoft Outlook and try again.;ESP=No se puede establecer la conexión a Microsoft Outlook. Si Microsoft Outlook ya se está ejecutando, compruebe que no está ejecutando %1 o Microsoft Outlook como administrador. Cierre todas las instancias de Microsoft Outlook y vuelva a intentarlo.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CouldNotActivateOutlookErr : @@@=%1 - product name;ENU=Cannot connect to Microsoft Outlook. If Microsoft Outlook is already running, make sure that you are not running either %1 or Microsoft Outlook as administrator. Close all instances of Microsoft Outlook and try again.;ESP=No se puede establecer la conexión a Microsoft Outlook. Si Microsoft Outlook ya se está ejecutando, compruebe que no está ejecutando %1 o Microsoft Outlook como administrador. Cierre todas las instancias de Microsoft Outlook y vuelva a intentarlo.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "UnspecifiedOutlookErr(Variable 1024)".

    //var
    //>>>> ORIGINAL VALUE:
    //UnspecifiedOutlookErr : ENU=" Microsoft Outlook cannot display the message. Make sure that Microsoft Outlook is configured with access to the message that you are trying to open.";ESP=" Microsoft Outlook no puede mostrar el mensaje. Compruebe que Microsoft Outlook está configurado con acceso al mensaje que está intentando abrir.";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UnspecifiedOutlookErr : ENU=" Microsoft Outlook cannot display the message. Make sure that Microsoft Outlook is configured with access to the message that you are trying to open.";ESP=" Microsoft Outlook no puede mostrar el mensaje. Compruebe que Microsoft Outlook está configurado con acceso al mensaje que está intentando abrir.";
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "AttachmentImportQst(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //AttachmentImportQst : ENU=Do you want to import attachment?;ESP=¿Desea importar el archivo adjunto?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AttachmentImportQst : ENU=Do you want to import attachment?;ESP=?Desea importar el archivo adjunto?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "AttachmentExportQst(Variable 1016)".

    //var
    //>>>> ORIGINAL VALUE:
    //AttachmentExportQst : ENU=Do you want to export attachment to view or edit it externaly?;ESP=¿Desea exportar el archivo adjunto para verlo o editarlo externamente?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AttachmentExportQst : ENU=Do you want to export attachment to view or edit it externaly?;ESP=?Desea exportar el archivo adjunto para verlo o editarlo externamente?;
    //Variable type has not been exported.
}

