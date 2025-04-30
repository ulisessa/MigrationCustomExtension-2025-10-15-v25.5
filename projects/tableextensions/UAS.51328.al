tableextension 51328 tableextension51328 extends "Routing Line"
{
    Caption = 'Routing Line';
    fields
    {
        modify("Routing No.")
        {
            Caption = 'Routing No.';
        }
        modify("Version Code")
        {
            Caption = 'Version Code';
        }
        modify("Operation No.")
        {
            Caption = 'Operation No.';
        }
        modify("Next Operation No.")
        {
            Caption = 'Next Operation No.';
        }
        modify("Previous Operation No.")
        {
            Caption = 'Previous Operation No.';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Work Center No.")
        {
            Caption = 'Work Center No.';
        }
        modify("Work Center Group Code")
        {
            Caption = 'Work Center Group Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Setup Time")
        {
            Caption = 'Setup Time';
        }
        modify("Run Time")
        {
            Caption = 'Run Time';
        }
        modify("Lot Size")
        {
            Caption = 'Lot Size';
        }
        modify("Setup Time Unit of Meas. Code")
        {
            Caption = 'Setup Time Unit of Meas. Code';
        }
        modify("Run Time Unit of Meas. Code")
        {
            Caption = 'Run Time Unit of Meas. Code';
        }
        modify("Wait Time Unit of Meas. Code")
        {
            Caption = 'Wait Time Unit of Meas. Code';
        }
        modify("Move Time Unit of Meas. Code")
        {
            Caption = 'Move Time Unit of Meas. Code';
        }
        modify("Minimum Process Time")
        {
            Caption = 'Minimum Process Time';
        }
        modify("Maximum Process Time")
        {
            Caption = 'Maximum Process Time';
        }
        modify("Routing Link Code")
        {
            Caption = 'Routing Link Code';
        }
        modify("Standard Task Code")
        {
            Caption = 'Standard Task Code';
        }
        modify("Sequence No. (Forward)")
        {
            Caption = 'Sequence No. (Forward)';
        }
        modify("Sequence No. (Backward)")
        {
            Caption = 'Sequence No. (Backward)';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "CannotDeleteCertifiedRoutingVersionExistsErr(Variable 1010)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotDeleteCertifiedRoutingVersionExistsErr : @@@="%1 = Routing Line Type option; %2 = No.";ENU=You cannot delete %1 %2 because there is at least one certified routing version associated with it.;ESP=No puede eliminar %1 %2 porque tiene asociada al menos una versión de enrutamiento certificada.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotDeleteCertifiedRoutingVersionExistsErr : @@@="%1 = Routing Line Type option; %2 = No.";ENU=You cannot delete %1 %2 because there is at least one certified routing version associated with it.;ESP=No puede eliminar %1 %2 porque tiene asociada al menos una versión de enrutamiento certificada.;
    //Variable type has not been exported.
}

