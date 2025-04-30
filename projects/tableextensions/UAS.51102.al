tableextension 51102 tableextension51102 extends "Internal Movement Header"
{
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Assignment Date")
        {
            Caption = 'Assignment Date';
        }
        modify("Assignment Time")
        {
            Caption = 'Assignment Time';
        }
        modify("To Bin Code")
        {
            Caption = 'To Bin Code';
        }
        modify("Sorting Method")
        {
            Caption = 'Sorting Method';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1013)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text003 : ENU=You cannot use Location Code %1.;ESP=No puede usar el código de almacén %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : ENU=You cannot use Location Code %1.;ESP=No puede usar el código de almacén %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text004(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text004 : ENU=You have changed the %1 on the %2, but it has not been changed on the existing internal movement lines.\You must update the existing internal movement lines manually.;ESP=Ha cambiado %1 en la %2, pero no se ha modificado en las líneas de movimiento interno existentes.\Debe actualizar las líneas de movimiento interno existentes manualmente.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text004 : ENU=You have changed the %1 on the %2, but it has not been changed on the existing internal movement lines.\You must update the existing internal movement lines manually.;ESP=Ha cambiado %1 en la %2, pero no se ha modificado en las líneas de movimiento interno existentes.\Debe actualizar las líneas de movimiento interno existentes manualmente.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "NoAllowedLocationsErr(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //NoAllowedLocationsErr : ENU=Internal movement is not possible at any locations where you are a warehouse employee.;ESP=El movimiento interno no es posible en ningún almacén en la que sea empleado de almacén.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NoAllowedLocationsErr : ENU=Internal movement is not possible at any locations where you are a warehouse employee.;ESP=El movimiento interno no es posible en ningún almacén en la que sea empleado de almacén.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "LinesExistErr(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //LinesExistErr : @@@="%1=Location Code";ENU=You cannot change %1 because one or more lines exist.;ESP=No puede cambiar %1 porque existen uno o más líneas.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LinesExistErr : @@@="%1=Location Code";ENU=You cannot change %1 because one or more lines exist.;ESP=No puede cambiar %1 porque existen uno o más líneas.;
    //Variable type has not been exported.
}

