tableextension 51284 tableextension51284 extends "Time Sheet Line"
{
    Caption = 'Time Sheet Line';
    fields
    {
        modify("Time Sheet No.")
        {
            Caption = 'Time Sheet No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Job No.")
        {
            Caption = 'Job No.';
        }
        modify("Job Task No.")
        {
            Caption = 'Job Task No.';
        }
        modify("Cause of Absence Code")
        {
            Caption = 'Cause of Absence Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Work Type Code")
        {
            Caption = 'Work Type Code';
        }
        modify("Service Order No.")
        {
            Caption = 'Service Order No.';
        }
        modify("Service Order Line No.")
        {
            Caption = 'Service Order Line No.';
        }
        modify("Assembly Order No.")
        {
            Caption = 'Assembly Order No.';
        }
        modify("Assembly Order Line No.")
        {
            Caption = 'Assembly Order Line No.';
        }
        modify("Approval Date")
        {
            Caption = 'Approval Date';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=There is no employee linked with resource %1.;ESP=No hay ningún empleado vinculado al recurso %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=There is no employee linked with resource %1.;ESP=No hay ningún empleado vinculado al recurso %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU="Status must be Open or Rejected in line with Time Sheet No.='%1', Line No.='%2'.";ESP="El estado debe ser Pendiente o Impagado en la línea con parte de horas No.='%1', línea No.='%2'.";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU="Status must be Open or Rejected in line with Time Sheet No.='%1', Line No.='%2'.";ESP="El estado debe ser Pendiente o Impagado en la línea con parte de horas n?='%1', línea n?='%2'.";
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "PrivacyBlockedErr(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //PrivacyBlockedErr : @@@="%1=resource no.";ENU=You cannot use resource %1 because they are marked as blocked due to privacy.;ESP=No puede usar el recurso %1 porque está marcado como bloqueado por motivos de privacidad.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PrivacyBlockedErr : @@@="%1=resource no.";ENU=You cannot use resource %1 because they are marked as blocked due to privacy.;ESP=No puede usar el recurso %1 porque está marcado como bloqueado por motivos de privacidad.;
    //Variable type has not been exported.
}

