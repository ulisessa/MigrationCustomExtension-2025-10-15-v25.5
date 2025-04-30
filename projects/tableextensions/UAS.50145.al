tableextension 50145 tableextension50145 extends "Incoming Document"
{
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Created Date-Time")
        {
            Caption = 'Created Date-Time';
        }
        modify("Last Date-Time Modified")
        {
            Caption = 'Last Date-Time Modified';
        }
        modify("Last Modified By User ID")
        {
            Caption = 'Last Modified By User ID';
        }
        modify("Last Modified By User Name")
        {
            Caption = 'Last Modified By User Name';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify(Status)
        {
            OptionCaption = 'New,Released,Rejected,Posted,Created,Failed,Pending Approval';
        }
        modify("Document Date")
        {
            Caption = 'Document Date';
        }
        modify("Vendor Bank Branch No.")
        {
            Caption = 'Vendor Bank Branch No.';
        }
        modify("Vendor Bank Account No.")
        {
            Caption = 'Vendor Bank Account No.';
        }
        modify("Vendor No.")
        {
            Caption = 'Vendor No.';
        }
        modify("OCR Status")
        {
            OptionCaption = ' ,Ready,Sent,Error,Success,Awaiting Verification';
        }
        modify("OCR Service Doc. Template Code")
        {
            Caption = 'OCR Service Doc. Template Code';
        }
        modify("Currency Code")
        {
            Caption = 'Currency Code';
        }
        modify("Vendor Invoice No.")
        {
            Caption = 'Vendor Invoice No.';
        }
        modify("Order No.")
        {
            Caption = 'Order No.';
        }
        modify("Vendor Phone No.")
        {
            Caption = 'Vendor Phone No.';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "UrlTooLongErr(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //UrlTooLongErr : ENU=Only URLs with a maximum 1000 characters are allowed.;ESP=Solo se permiten URL con un máximo de 1000 caracteres.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UrlTooLongErr : ENU=Only URLs with a maximum 1000 characters are allowed.;ESP=Solo se permiten URL con un máximo de 1000 caracteres.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "NoDocumentMsg(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //NoDocumentMsg : ENU=There is no incoming document for this combination of posting date and document number.;ESP=No existe ningún documento entrante con esta combinación de fecha de registro y número de documento.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NoDocumentMsg : ENU=There is no incoming document for this combination of posting date and document number.;ESP=No existe ningún documento entrante con esta combinación de fecha de registro y número de documento.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "AlreadyUsedInJnlErr(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //AlreadyUsedInJnlErr : @@@="%1 = journal batch name, %2=line number.";ENU=The incoming document has already been assigned to journal batch %1, line number. %2.;ESP=El documento entrante ya se ha asignado a la sección de diario %1, número de línea. %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AlreadyUsedInJnlErr : @@@="%1 = journal batch name, %2=line number.";ENU=The incoming document has already been assigned to journal batch %1, line number. %2.;ESP=El documento entrante ya se ha asignado a la sección de diario %1, número de línea. %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "DocApprovedErr(Variable 1010)".

    //var
    //>>>> ORIGINAL VALUE:
    //DocApprovedErr : ENU=This incoming document requires releasing.;ESP=Este documento entrante requiere liberación.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DocApprovedErr : ENU=This incoming document requires releasing.;ESP=Este documento entrante requiere liberación.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "DetachQst(Variable 1012)".

    //var
    //>>>> ORIGINAL VALUE:
    //DetachQst : ENU=Do you want to remove the reference from this incoming document to posted document %1, posting date %2?;ESP=¿Desea quitar la referencia de este documento entrante al documento registrado %1, con fecha de registro %2?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DetachQst : ENU=Do you want to remove the reference from this incoming document to posted document %1, posting date %2?;ESP=?Desea quitar la referencia de este documento entrante al documento registrado %1, con fecha de registro %2?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "EntityNotFoundErr(Variable 1014)".

    //var
    //>>>> ORIGINAL VALUE:
    //EntityNotFoundErr : ENU=Cannot create the document. Make sure the data exchange definition is correct.;ESP=No se puede crear el documento. Asegúrese de que la definición de intercambio de datos es correcta.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //EntityNotFoundErr : ENU=Cannot create the document. Make sure the data exchange definition is correct.;ESP=No se puede crear el documento. Asegúrese de que la definición de intercambio de datos es correcta.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "DocNotCreatedMsg(Variable 1017)".

    //var
    //>>>> ORIGINAL VALUE:
    //DocNotCreatedMsg : ENU=The document was not created due to errors in the conversion process.;ESP=El documento no se creó debido a errores en el proceso de conversión.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DocNotCreatedMsg : ENU=The document was not created due to errors in the conversion process.;ESP=El documento no se creó debido a errores en el proceso de conversión.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "DeleteRecordQst(Variable 1025)".

    //var
    //>>>> ORIGINAL VALUE:
    //DeleteRecordQst : ENU=The reference to the record has been removed.\\Do you want to delete the record?;ESP=Se ha quitado la referencia del registro.\\¿Desea eliminar el registro?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DeleteRecordQst : ENU=The reference to the record has been removed.\\Do you want to delete the record?;ESP=Se ha quitado la referencia del registro.\\?Desea eliminar el registro?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "DocWhenApprovalIsCompleteErr(Variable 1026)".

    //var
    //>>>> ORIGINAL VALUE:
    //DocWhenApprovalIsCompleteErr : ENU=The document can only be created when the approval process is complete.;ESP=El documento solo se puede crear una vez completado el proceso de aprobación.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DocWhenApprovalIsCompleteErr : ENU=The document can only be created when the approval process is complete.;ESP=El documento solo se puede crear una vez completado el proceso de aprobación.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "InvalidCurrencyCodeErr(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //InvalidCurrencyCodeErr : ENU=You must enter a valid currency code.;ESP=Debe introducir un código de divisa válido.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //InvalidCurrencyCodeErr : ENU=You must enter a valid currency code.;ESP=Debe introducir un código de divisa válido.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ReplaceMainAttachmentQst(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //ReplaceMainAttachmentQst : ENU=Are you sure you want to replace the attached file?;ESP=¿Está seguro de que desea sustituir el archivo adjunto?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReplaceMainAttachmentQst : ENU=Are you sure you want to replace the attached file?;ESP=?está seguro de que desea sustituir el archivo adjunto?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "DoYouWantToRemoveReferenceQst(Variable 1023)".

    //var
    //>>>> ORIGINAL VALUE:
    //DoYouWantToRemoveReferenceQst : ENU=Do you want to remove the reference?;ESP=¿Confirma que quiere eliminar la referencia?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DoYouWantToRemoveReferenceQst : ENU=Do you want to remove the reference?;ESP=?Confirma que quiere eliminar la referencia?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "NoDocAttachErr(Variable 1028)".

    //var
    //>>>> ORIGINAL VALUE:
    //NoDocAttachErr : ENU=No document is attached.\\Attach a document, and then try again.;ESP=No hay ningún documento adjunto.\\Adjunte uno y vuelva a intentarlo.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NoDocAttachErr : ENU=No document is attached.\\Attach a document, and then try again.;ESP=No hay ningún documento adjunto.\\Adjunte uno y vuelva a intentarlo.;
    //Variable type has not been exported.
}

