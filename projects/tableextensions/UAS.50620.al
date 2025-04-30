tableextension 50620 tableextension50620 extends "Segment Line"
{
    Caption = 'Segment Line';
    fields
    {
        modify("Segment No.")
        {
            Caption = 'Segment No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Contact No.")
        {
            Caption = 'Contact No.';
        }
        modify("Campaign No.")
        {
            Caption = 'Campaign No.';
        }
        modify("Salesperson Code")
        {
            Caption = 'Salesperson Code';
        }
        modify("Interaction Template Code")
        {
            Caption = 'Interaction Template Code';
        }
        modify("Duration (Min.)")
        {
            Caption = 'Duration (Min.)';
        }
        modify("Attachment No.")
        {
            Caption = 'Attachment No.';
        }
        modify("Campaign Response")
        {
            Caption = 'Campaign Response';
        }
        modify("Information Flow")
        {
            Caption = 'Information Flow';
        }
        modify("Contact Alt. Address Code")
        {
            Caption = 'Contact Alt. Address Code';
        }
        modify(Evaluation)
        {
            Caption = 'Evaluation';
        }
        modify("Campaign Target")
        {
            Caption = 'Campaign Target';
        }
        modify("Language Code")
        {
            Caption = 'Language Code';
        }
        modify(Description)
        {

            //Unsupported feature: Property Modification (Data type) on "Description(Field 22)".

            Caption = 'Description';
        }
        modify("Time of Interaction")
        {
            Caption = 'Time of Interaction';
        }
        modify("To-do No.")
        {
            Caption = 'Task No.';
        }
        modify("Contact Company No.")
        {
            Caption = 'Contact Company No.';
        }
        modify("Campaign Entry No.")
        {
            Caption = 'Campaign Entry No.';
        }
        modify("Interaction Group Code")
        {
            Caption = 'Interaction Group Code';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("Send Word Doc. As Attmt.")
        {
            Caption = 'Send Word Doc. As Attmt.';
        }
        modify("Contact Via")
        {
            Caption = 'Contact Via';
        }
        modify("Version No.")
        {
            Caption = 'Version No.';
        }
        modify("Doc. No. Occurrence")
        {
            Caption = 'Doc. No. Occurrence';
        }
        modify("Opportunity No.")
        {
            Caption = 'Opportunity No.';
        }
        modify("Opportunity Description")
        {
            Caption = 'Opportunity Description';
        }
        modify("Campaign Description")
        {
            Caption = 'Campaign Description';
        }
        modify("Interaction Successful")
        {
            Caption = 'Interaction Successful';
        }
    }

    //Unsupported feature: Code Modification on "FinishWizard(PROCEDURE 18)".

    //procedure FinishWizard();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    HTMLAttachment := IsHTMLAttachment;
    Flag := false;
    if IsFinish then
    #4..23
      send := (IsFinish and ("Correspondence Type" <> "Correspondence Type"::" "));
      if send and HTMLAttachment then begin
        TempAttachment.ReadHTMLCustomLayoutAttachment(HTMLContentBodyText,CustomLayoutCode);
        AttachmentManagement.GenerateHTMLContent(TempAttachment,Rec);
      end;
      SegManagement.LogInteraction(Rec,TempAttachment,TempInterLogEntryCommentLine,send,not IsFinish);
      InteractionLogEntry.FindLast;
    #31..42
    end;

    OnAfterFinishWizard(Rec,InteractionLogEntry,IsFinish,Flag);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..26
    //++Arbu    AttachmentManagement.GenerateHTMLContent(TempAttachment,Rec);
    #28..45
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text004(Variable 1012)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text004 : ENU=The program has stopped importing the attachment at your request.;ESP=El programa ha parado la importación del anexo a su petición.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text004 : ENU=The program has stopped importing the attachment at your request.;ESP=El programa ha parado la importación del anexo a su petición.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text006(Variable 1011)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text006 : ENU=Your Segment is now empty.\Do you want to reset number of criteria actions?;ESP=Su segmento está vacío.\¿Desea restablecer el número de acciones de criterio?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text006 : ENU=Your Segment is now empty.\Do you want to reset number of criteria actions?;ESP=Su segmento está vacío.\?Desea restablecer el número de acciones de criterio?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text007(Variable 1016)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text007 : ENU=Do you want to finish this interaction later?;ESP=¿Desea terminar la interacción más tarde?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text007 : ENU=Do you want to finish this interaction later?;ESP=?Desea terminar la interacción más tarde?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text008(Variable 1022)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text008 : ENU=You must select an interaction template with an attachment.;ESP=Debe seleccionar una plantilla de interacción que incluya un archivo adjunto.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text008 : ENU=You must select an interaction template with an attachment.;ESP=Debe seleccionar una plantilla de interacción que incluya un archivo adjunto.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text013(Variable 1024)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text013 : ENU=You must fill in the phone number.;ESP=Debe rellenar el número de teléfono.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text013 : ENU=You must fill in the phone number.;ESP=Debe rellenar el número de teléfono.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text025(Variable 1033)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text025 : @@@=%2 - product name;ENU=The email could not be sent because of the following error: %1.\Note: if you run %2 as administrator, you must run Outlook as administrator as well.;ESP=El correo electrónico no se pudo enviar debido al siguiente error: %1.\Nota: Si ejecuta %2 como administrador, también debe ejecutar Outlook como administrador.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text025 : @@@=%2 - product name;ENU=The email could not be sent because of the following error: %1.\Note: if you run %2 as administrator, you must run Outlook as administrator as well.;ESP=El correo electrónico no se pudo enviar debido al siguiente error: %1.\Nota: Si ejecuta %2 como administrador, tambión debe ejecutar Outlook como administrador.;
    //Variable type has not been exported.
}

