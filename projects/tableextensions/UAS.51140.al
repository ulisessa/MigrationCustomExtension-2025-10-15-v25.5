tableextension 51140 tableextension51140 extends "Report Selections"
{
    Caption = 'Report Selections';
    fields
    {
        modify("Report Caption")
        {
            Caption = 'Report Caption';
        }
        modify("Custom Report Layout Code")
        {
            Caption = 'Custom Report Layout Code';
        }
        modify("Use for Email Attachment")
        {
            Caption = 'Use for Email Attachment';
        }
        modify("Use for Email Body")
        {
            Caption = 'Use for Email Body';
        }
        modify("Email Body Layout Code")
        {
            Caption = 'Email Body Layout Code';
        }
        modify("Email Body Layout Description")
        {
            Caption = 'Email Body Layout Description';
        }
        modify("Email Body Layout Type")
        {
            Caption = 'Email Body Layout Type';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "MustSelectAndEmailBodyOrAttahmentErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //MustSelectAndEmailBodyOrAttahmentErr : @@@="%1 = Usage, for example Sales Invoice";ENU=You must select an email body or attachment in report selection for %1.;ESP=Debe seleccionar un cuerpo o datos adjuntos del correo electrónico en la selección de informes para %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //MustSelectAndEmailBodyOrAttahmentErr : @@@="%1 = Usage, for example Sales Invoice";ENU=You must select an email body or attachment in report selection for %1.;ESP=Debe seleccionar un cuerpo o datos adjuntos del correo electrónico en la selección de informes para %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "EmailBodyIsAlreadyDefinedErr(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //EmailBodyIsAlreadyDefinedErr : @@@="%1 = Usage, for example Sales Invoice";ENU=An email body is already defined for %1.;ESP=Ya hay un cuerpo del correo electrónico definido para %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //EmailBodyIsAlreadyDefinedErr : @@@="%1 = Usage, for example Sales Invoice";ENU=An email body is already defined for %1.;ESP=Ya hay un cuerpo del correo electrónico definido para %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CannotBeUsedAsAnEmailBodyErr(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotBeUsedAsAnEmailBodyErr : @@@="%1 = Report ID,%2 = Type";ENU=Report %1 uses the %2 which cannot be used as an email body.;ESP=El informe %1 usa el %2, que no se puede usar como cuerpo del correo electrónico.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotBeUsedAsAnEmailBodyErr : @@@="%1 = Report ID,%2 = Type";ENU=Report %1 uses the %2 which cannot be used as an email body.;ESP=El informe %1 usa el %2, que no se puede usar como cuerpo del correo electrónico.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "OneRecordWillBeSentQst(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //OneRecordWillBeSentQst : ENU=Only the first of the selected documents can be scheduled in the job queue.\\Do you want to continue?;ESP=Solo el primero de los documentos seleccionados se puede programar en la cola de proyectos.\\¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //OneRecordWillBeSentQst : ENU=Only the first of the selected documents can be scheduled in the job queue.\\Do you want to continue?;ESP=Solo el primero de los documentos seleccionados se puede programar en la cola de proyectos.\\?Desea continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "MailingJobCategoryTok(Variable 1007)".

    //var
    //>>>> ORIGINAL VALUE:
    //MailingJobCategoryTok : ENU=Sending invoices via email;ESP=Envío de facturas por correo electrónico;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //MailingJobCategoryTok : ENU=Sending invoices via email;ESP=Envío de facturas por correo electrónico;
    //Variable type has not been exported.
}

