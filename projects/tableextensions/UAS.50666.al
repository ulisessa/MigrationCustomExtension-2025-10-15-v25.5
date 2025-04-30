tableextension 50666 tableextension50666 extends Attendee
{
    fields
    {
        modify("To-do No.")
        {
            Caption = 'Task No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Attendee No.")
        {
            Caption = 'Attendee No.';
        }
        modify("Send Invitation")
        {
            Caption = 'Send Invitation';
        }
        modify("Invitation Response Type")
        {
            Caption = 'Invitation Response Type';
        }
        modify("Invitation Sent")
        {
            Caption = 'Invitation Sent';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=You cannot have more than one task organizer.;ESP=No puede tener más de un organizador de tareas.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=You cannot have more than one task organizer.;ESP=No puede tener más de un organizador de tareas.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text004(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text004 : @@@="%1 = field caption for Send Invitation, %2 = Salesperson Name";ENU=You cannot select the %1 for %2 because he/she does not have an email address.;ESP=No puede seleccionar %1 para %2 por que no tiene dirección de correo electrónico.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text004 : @@@="%1 = field caption for Send Invitation, %2 = Salesperson Name";ENU=You cannot select the %1 for %2 because he/she does not have an email address.;ESP=No puede seleccionar %1 para %2 por que no tiene dirección de correo electrónico.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "SendInvitationIsNotAvailableErr(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //SendInvitationIsNotAvailableErr : ENU=The Send Invitation option is not available for a task organizer.;ESP=La opción Enviar invitación no está disponible para el organizador de la tarea.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SendInvitationIsNotAvailableErr : ENU=The Send Invitation option is not available for a task organizer.;ESP=La opción Enviar invitación no está disponible para el organizador de la tarea.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text011(Variable 1009)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text011 : @@@="%1 = Sales / Purchaseer person name";ENU=You cannot set %1 as organizer because he/she does not have email address.;ESP=No puede configurar a %1 como organizador porque no tiene una dirección de correo electrónico.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text011 : @@@="%1 = Sales / Purchaseer person name";ENU=You cannot set %1 as organizer because he/she does not have email address.;ESP=No puede configurar a %1 como organizador porque no tiene una dirección de correo electrónico.;
    //Variable type has not been exported.
}

