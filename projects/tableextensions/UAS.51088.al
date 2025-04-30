tableextension 51088 tableextension51088 extends "Whse. Internal Put-away Header"
{
    Caption = 'Whse. Internal Put-away Header';
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
        modify("From Bin Code")
        {
            Caption = 'From Bin Code';
        }
        modify("From Zone Code")
        {
            Caption = 'From Zone Code';
        }
        modify("Sorting Method")
        {
            Caption = 'Sorting Method';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1007)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=You have changed %1 on the %2, but it has not been changed on the existing Warehouse Internal Put-Away Lines.\;ESP=Ha modificado %1 en la %2, pero no ha sido modificado en las líns. ubicación interna alm. actuales.\;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=You have changed %1 on the %2, but it has not been changed on the existing Warehouse Internal Put-Away Lines.\;ESP=Ha modificado %1 en la %2, pero no ha sido modificado en las líns. ubicación interna alm. actuales.\;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text003 : ENU=You must update the existing Warehouse Internal Put-Away Lines manually.;ESP=Debe actualizar las líns. ubicación interna alm. actuales manualmente.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : ENU=You must update the existing Warehouse Internal Put-Away Lines manually.;ESP=Debe actualizar las líns. ubicación interna alm. actuales manualmente.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text005(Variable 1012)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text005 : ENU=You cannot change the %1, because the document has one or more lines.;ESP=No puede cambiar el %1, porque el documento tiene una o más líneas.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text005 : ENU=You cannot change the %1, because the document has one or more lines.;ESP=No puede cambiar el %1, porque el documento tiene una o más líneas.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text006(Variable 1013)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text006 : ENU=You are not allowed to use %1 %2.;ESP=No le está permitido utilizar %1 %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text006 : ENU=You are not allowed to use %1 %2.;ESP=No le está permitido utilizar %1 %2.;
    //Variable type has not been exported.
}

