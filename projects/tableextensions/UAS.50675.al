tableextension 50675 tableextension50675 extends "Employee Absence"
{
    fields
    {
        modify("Employee No.")
        {
            Caption = 'Employee No.';
        }
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Cause of Absence Code")
        {
            Caption = 'Cause of Absence Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "BlockedErr(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //BlockedErr : ENU=You cannot register absence because the employee is blocked due to privacy.;ESP=No puede registrar una ausencia porque el empleado está bloqueado por motivos de privacidad.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //BlockedErr : ENU=You cannot register absence because the employee is blocked due to privacy.;ESP=No puede registrar una ausencia porque el empleado está bloqueado por motivos de privacidad.;
    //Variable type has not been exported.
}

