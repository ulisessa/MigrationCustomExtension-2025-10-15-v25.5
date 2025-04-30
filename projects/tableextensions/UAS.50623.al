tableextension 50623 tableextension50623 extends "To-do"
{
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Team Code")
        {
            Caption = 'Team Code';
        }
        modify("Salesperson Code")
        {
            Caption = 'Salesperson Code';
        }
        modify("Campaign No.")
        {
            Caption = 'Campaign No.';
        }
        modify("Contact No.")
        {
            Caption = 'Contact No.';
        }
        modify("Opportunity No.")
        {
            Caption = 'Opportunity No.';
        }
        modify("Segment No.")
        {
            Caption = 'Segment No.';
        }
        modify(Description)
        {

            //Unsupported feature: Property Modification (Data type) on "Description(Field 12)".

            Caption = 'Description';
        }
        modify("Campaign Description")
        {
            Caption = 'Campaign Description';
        }
        modify("Contact Company No.")
        {
            Caption = 'Contact Company No.';
        }
        modify(Recurring)
        {
            Caption = 'Recurring';
        }
        modify("Recurring Date Interval")
        {
            Caption = 'Recurring Date Interval';
        }
        modify("Opportunity Description")
        {
            Caption = 'Opportunity Description';
        }
        modify(Duration)
        {
            Caption = 'Duration';
        }
        modify("Opportunity Entry No.")
        {
            Caption = 'Opportunity Entry No.';
        }
        modify("Last Date Modified")
        {
            Caption = 'Last Date Modified';
        }
        modify("Last Time Modified")
        {
            Caption = 'Last Time Modified';
        }
        modify("All Day Event")
        {
            Caption = 'All Day Event';
        }
        modify("Organizer To-do No.")
        {
            Caption = 'Organizer Task No.';
        }
        modify("Interaction Template Code")
        {
            Caption = 'Interaction Template Code';
        }
        modify("Language Code")
        {
            Caption = 'Language Code';
        }
        modify("Attachment No.")
        {
            Caption = 'Attachment No.';
        }
        modify("Unit Duration (Min.)")
        {
            Caption = 'Unit Duration (Min.)';
        }
        modify("No. of Attendees")
        {
            Caption = 'No. of Attendees';
        }
        modify("Attendees Accepted No.")
        {
            Caption = 'Attendees Accepted No.';
        }
        modify("Segment Description")
        {
            Caption = 'Segment Description';
        }
        modify("Activity Code")
        {
            Caption = 'Activity Code';
        }
        modify("Wizard Campaign Description")
        {
            Caption = 'Wizard Campaign Description';
        }
        modify("Wizard Opportunity Description")
        {
            Caption = 'Wizard Opportunity Description';
        }
    }

    //Unsupported feature: Code Modification on "StartWizard(PROCEDURE 48)".

    //procedure StartWizard();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Wizard Step" := "Wizard Step"::"1";

    "Wizard Contact Name" := GetContactName;
    #4..14
    GetEndDateTime;

    Insert;
    if PAGE.RunModal(PAGE::"Create Task",Rec) = ACTION::OK then;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..17
    //++Arbu IF PAGE.RUNMODAL(PAGE::"Create Task",Rec) = ACTION::OK THEN;
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=%1 No. %2 has been created from recurring %3 %4.;ESP=%1 No. %2 se ha creado desde %3 %4 periódico.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=%1 No. %2 has been created from recurring %3 %4.;ESP=%1 No.%2 se ha creado desde %3 %4 periódico.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : @@@="%1 = Segment Header No.";ENU=Do you want to create a Task for all contacts in the %1 Segment;ESP=¿Desea crear una tarea en todos los contactos del segmento %1?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : @@@="%1 = Segment Header No.";ENU=Do you want to create a Task for all contacts in the %1 Segment;ESP=?Desea crear una tarea en todos los contactos del segmento %1?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text003 : @@@="%1 = Segment Header No.";ENU=Do you want to assign an activity to all Contacts in the %1 Segment;ESP=¿Desea asignar una actividad a todos los contactos del segmento %1?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : @@@="%1 = Segment Header No.";ENU=Do you want to assign an activity to all Contacts in the %1 Segment;ESP=?Desea asignar una actividad a todos los contactos del segmento %1?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text004(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text004 : ENU=Do you want to register an Interaction Log Entry?;ESP=¿Desea registrar un movimiento de registro de interacción?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text004 : ENU=Do you want to register an Interaction Log Entry?;ESP=?Desea registrar un movimiento de registro de interacción?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text005(Variable 1013)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text005 : ENU=Information that you have entered in this field will cause the duration to be negative which is not allowed. Please modify the ending date/time value.;ESP=La información que ha introducido en este campo hará que la duración sea negativa, lo que no está permitido. Modifique el campo fecha/hora fin.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text005 : ENU=Information that you have entered in this field will cause the duration to be negative which is not allowed. Please modify the ending date/time value.;ESP=La información que ha introducido en este campo har? que la duración sea negativa, lo que no está permitido. Modifique el campo fecha/hora fin.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text006(Variable 1015)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text006 : ENU=The valid range of dates is from %1 to %2. Please enter a date within this range.;ESP=El rango válido de fechas es desde %1 hasta %2. Introduzca una fecha dentro de este rango.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text006 : ENU=The valid range of dates is from %1 to %2. Please enter a date within this range.;ESP=El rango válido de fechas es desde %1 hasta %2. Introduzca una fecha dentro de este rango.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text007(Variable 1016)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text007 : ENU=Information that you have entered in this field will cause the duration to be less than 1 minute, which is not allowed. Please modify the ending date/time value.;ESP=La información que ha introducido en este campo hará que la duración sea inferior a 1 minuto, lo que no está permitido. Modifique el campo fecha/hora fin.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text007 : ENU=Information that you have entered in this field will cause the duration to be less than 1 minute, which is not allowed. Please modify the ending date/time value.;ESP=La información que ha introducido en este campo har? que la duración sea inferior a 1 minuto, lo que no está permitido. Modifique el campo fecha/hora fin.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text008(Variable 1017)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text008 : ENU=Information that you have entered in this field will cause the duration to be more than 10 years, which is not allowed. Please modify the ending date/time value.;ESP=La información que ha introducido en este campo hará que la duración sea superior a 10 años, lo que no está permitido. Modifique el campo fecha/hora fin.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text008 : ENU=Information that you have entered in this field will cause the duration to be more than 10 years, which is not allowed. Please modify the ending date/time value.;ESP=La información que ha introducido en este campo har? que la duración sea superior a 10 años, lo que no está permitido. Modifique el campo fecha/hora fin.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text009(Variable 1022)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text009 : @@@="%1=Salesperson Code";ENU=You cannot change the %1 for this Task, because this salesperson is the meeting organizer.;ESP=No puede modificar %1 para esta tarea, porque este vendedor es el organizador de la reunión.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text009 : @@@="%1=Salesperson Code";ENU=You cannot change the %1 for this Task, because this salesperson is the meeting organizer.;ESP=No puede modificar %1 para esta tarea, porque este vendedor es el organizador de la reunión.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text010(Variable 1023)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text010 : @@@="%1=Task Interaction Language,%2=Language Code";ENU=Do you want to create a new %2 value in %1 for this Task?;ESP=¿Desea crear un nuevo valor de %2 en %1 para esta tarea?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text010 : @@@="%1=Task Interaction Language,%2=Language Code";ENU=Do you want to create a new %2 value in %1 for this Task?;ESP=?Desea crear un nuevo valor de %2 en %1 para esta tarea?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text012(Variable 1025)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text012 : ENU=You cannot change a Task type from Blank or Phone Call to Meeting and vice versa. You can only change a Task type from Blank to Phone Call or from Phone Call to Blank.;ESP=No puede cambiar un tipo de tarea de En blanco o Llamada a Reunión y viceversa. Solo puede modificar un tipo de tarea de En blanco a Llamada o de Llamada a En blanco.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text012 : ENU=You cannot change a Task type from Blank or Phone Call to Meeting and vice versa. You can only change a Task type from Blank to Phone Call or from Phone Call to Blank.;ESP=No puede cambiar un tipo de tarea de En blanco o Llamada a Reunión y viceversa. Solo puede modificar un tipo de tarea de En blanco a Llamada o de Llamada a En blanco.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text016(Variable 1030)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text016 : @@@="%1 = Task Date,%2 = Task StartTime,%3=Task location";ENU=You are cordially invited to attend the meeting, which will take place on %1, %2 at %3.;ESP=Ha sido invitado a la reunión que tendrá lugar el %1 a las %2 en %3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text016 : @@@="%1 = Task Date,%2 = Task StartTime,%3=Task location";ENU=You are cordially invited to attend the meeting, which will take place on %1, %2 at %3.;ESP=Ha sido invitado a la reunión que tendrá lugar el %1 a las %2 en %3.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text018(Variable 1031)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text018 : ENU=The %1 check box is not selected.;ESP=No está seleccionada la casilla de activación %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text018 : ENU=The %1 check box is not selected.;ESP=No está seleccionada la casilla de activación %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text019(Variable 1032)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text019 : ENU=Send invitations to all Attendees with selected %1 check boxes.;ESP=Enviar invitaciones a todos los asistentes con las casillas de verificación %1 seleccionadas.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text019 : ENU=Send invitations to all Attendees with selected %1 check boxes.;ESP=Enviar invitaciones a todos los asistentes con las casillas de verificación %1 seleccionadas.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text020(Variable 1033)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text020 : ENU=Send invitations to Attendees who have not been sent invitations yet.;ESP=Enviar invitaciones a los asistentes a los que no se les hayan enviado todavía.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text020 : ENU=Send invitations to Attendees who have not been sent invitations yet.;ESP=Enviar invitaciones a los asistentes a los que no se les hayan enviado todavía.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text022(Variable 1035)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text022 : ENU=Invitations have already been sent to Attendees with selected %1 check boxes. Do you want to resend the invitations?;ESP=Ya se han enviado invitaciones a los asistentes con las casillas de verificación %1 seleccionadas. ¿Desea volver a enviar las invitaciones?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text022 : ENU=Invitations have already been sent to Attendees with selected %1 check boxes. Do you want to resend the invitations?;ESP=Ya se han enviado invitaciones a los asistentes con las casillas de verificación %1 seleccionadas. ?Desea volver a enviar las invitaciones?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text023(Variable 1036)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text023 : ENU=Outlook failed to send an invitation to %1.;ESP=Outlook no pudo enviar una invitación a %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text023 : ENU=Outlook failed to send an invitation to %1.;ESP=Outlook no pudo enviar una invitación a %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "TasksWillBeDeletedQst(Variable 1043)".

    //var
    //>>>> ORIGINAL VALUE:
    //TasksWillBeDeletedQst : @@@="%1 = old Team code, %2 = new Team code";ENU=Tasks of the %1 team members who do not belong to the %2 team will be deleted. Do you want to continue?;ESP=Se eliminarán las tareas de los miembros del equipo %1 que no pertenezcan al equipo %2. ¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TasksWillBeDeletedQst : @@@="%1 = old Team code, %2 = new Team code";ENU=Tasks of the %1 team members who do not belong to the %2 team will be deleted. Do you want to continue?;ESP=Se eliminarán las tareas de los miembros del equipo %1 que no pertenezcan al equipo %2. ?Desea continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text032(Variable 1045)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text032 : @@@="%1=Task No.,%2=Salesperson Code";ENU=Task No. %1 will be reassigned to %2 and the corresponding salesperson Tasks for team members will be deleted. Do you want to continue?;ESP=La tarea n.º %1 se reasignará a %2 y se eliminarán las tareas del vendedor correspondiente para todos los miembros del equipo. ¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text032 : @@@="%1=Task No.,%2=Salesperson Code";ENU=Task No. %1 will be reassigned to %2 and the corresponding salesperson Tasks for team members will be deleted. Do you want to continue?;ESP=La tarea no. %1 se reasignará a %2 y se eliminarán las tareas del vendedor correspondiente para todos los miembros del equipo. ?Desea continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text033(Variable 1046)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text033 : @@@="%1=Task No.,%2=Salesperson Code";ENU=Task No. %1 will be reassigned to %2. Do you want to continue?;ESP=La tarea n.º %1 se reasignará a %2. ¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text033 : @@@="%1=Task No.,%2=Salesperson Code";ENU=Task No. %1 will be reassigned to %2. Do you want to continue?;ESP=La tarea no. %1 se reasignará a %2. ?Desea continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text034(Variable 1047)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text034 : ENU=Do you want to close the Task?;ESP=¿Desea cerrar la tarea?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text034 : ENU=Do you want to close the Task?;ESP=?Desea cerrar la tarea?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "TaskNoMsg(Variable 1048)".

    //var
    //>>>> ORIGINAL VALUE:
    //TaskNoMsg : @@@="%1 = counter";ENU=Task No. #1##############\;ESP=N.º tarea #1##############\;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TaskNoMsg : @@@="%1 = counter";ENU=Task No. #1##############\;ESP=No. tarea #1##############\;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text039(Variable 1051)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text039 : @@@="%1=Task No,%2=Team Code,%3=Team Code";ENU=Task No. %1 is closed and will be reopened. The Tasks of the %2 team members who do not belong to the %3 team will be deleted. Do you want to continue?;ESP=La tarea n.º %1 está cerrada y se reabrirá. Se eliminarán las tareas de los miembros del equipo %2 que no pertenezcan al equipo %3. ¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text039 : @@@="%1=Task No,%2=Team Code,%3=Team Code";ENU=Task No. %1 is closed and will be reopened. The Tasks of the %2 team members who do not belong to the %3 team will be deleted. Do you want to continue?;ESP=La tarea no. %1 está cerrada y se reabrirá. Se eliminarán las tareas de los miembros del equipo %2 que no pertenezcan al equipo %3. ?Desea continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text040(Variable 1052)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text040 : @@@="%1=Task No.,%2=Salesperson Code";ENU=Task No. %1 is closed and will be reopened. It will be reassigned to %2, and the corresponding salesperson Tasks for team members will be deleted. Do you want to continue?;ESP=La tarea n.º %1 está cerrada y se reabrirá. Se reasignará a %2 y se eliminarán las tareas del vendedor correspondiente para todos los miembros del equipo. ¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text040 : @@@="%1=Task No.,%2=Salesperson Code";ENU=Task No. %1 is closed and will be reopened. It will be reassigned to %2, and the corresponding salesperson Tasks for team members will be deleted. Do you want to continue?;ESP=La tarea no. %1 está cerrada y se reabrirá. Se reasignará a %2 y se eliminarán las tareas del vendedor correspondiente para todos los miembros del equipo. ?Desea continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text041(Variable 1053)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text041 : @@@="%1=Task No.,%2=Salesperson Code";ENU=Task No. %1 is closed. It will be reopened and reassigned to %2. Do you want to continue?;ESP=La tarea n.º %1 está cerrada y se reabrirá y reasignará a %2. ¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text041 : @@@="%1=Task No.,%2=Salesperson Code";ENU=Task No. %1 is closed. It will be reopened and reassigned to %2. Do you want to continue?;ESP=La tarea no. %1 está cerrada y se reabrirá y reasignará a %2. ?Desea continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text042(Variable 1054)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text042 : @@@="%1=Task No.,%2=Team Code";ENU=Task No. %1 is closed. Do you want to reopen it and assign to the %2 team?;ESP=La tarea n.º %1 está cerrada. ¿Desea reabrirla y asignarla al equipo %2?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text042 : @@@="%1=Task No.,%2=Team Code";ENU=Task No. %1 is closed. Do you want to reopen it and assign to the %2 team?;ESP=La tarea no. %1 está cerrada. ?Desea reabrirla y asignarla al equipo %2?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text047(Variable 1072)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text047 : ENU=You cannot use the wizard to create an attachment. You can create an attachment in the Interaction Template window.;ESP=No puede utilizar el asistente para crear un anexo. Puede crear anexos en la ventana Plantilla interacción.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text047 : ENU=You cannot use the wizard to create an attachment. You can create an attachment in the Interaction Template window.;ESP=No puede utilizar el asistente para crear un anexo. Puede crear anexos en la ventana Plantilla interacción.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text051(Variable 1077)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text051 : ENU=Activity Code;ESP=Cód. actividad;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text051 : ENU=Activity Code;ESP=Cód. actividad;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text056(Variable 1073)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text056 : @@@="%1=Activity Code";ENU=Activity %1 contains Tasks of type Meeting. You must fill in the Meeting Organizer field.;ESP=La actividad %1 contiene tareas de tipo Reunión. Introduzca un valor en el campo Organizador de la reunión.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text056 : @@@="%1=Activity Code";ENU=Activity %1 contains Tasks of type Meeting. You must fill in the Meeting Organizer field.;ESP=La actividad %1 contiene tareas de tipo Reunión. Introduzca un valor en el campo Organizador de la reunión.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text067(Variable 1019)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text067 : ENU=The %1 must contain an attachment if you want to send an invitation to an %2 of the contact type.;ESP=%1 debe contener un anexo si desea enviar una invitación a un %2 del tipo de contacto.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text067 : ENU=The %1 must contain an attachment if you want to send an invitation to an %2 of the contact type.;ESP=%1 debe contener un anexo si desea enviar una invitación a un %2 del tipo de contacto.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text068(Variable 1080)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text068 : ENU=You cannot select the Send invitation(s) on Finish check box, because none of the %1 check boxes are selected.;ESP=No puede seleccionar Enviar invitación/es cuando pulse Terminar, porque ninguna de las casillas %1 están seleccionadas.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text068 : ENU=You cannot select the Send invitation(s) on Finish check box, because none of the %1 check boxes are selected.;ESP=No puede seleccionar Enviar invitación/es cuando pulse Terminar, porque ninguna de las casillas %1 están seleccionadas.;
    //Variable type has not been exported.
}

