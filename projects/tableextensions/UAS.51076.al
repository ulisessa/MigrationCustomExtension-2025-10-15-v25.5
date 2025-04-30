tableextension 51076 tableextension51076 extends "Posted Whse. Receipt Header"
{
    Caption = 'Posted Whse. Receipt Header';
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
        modify("Zone Code")
        {
            Caption = 'Zone Code';
        }
        modify("Bin Code")
        {
            Caption = 'Bin Code';
        }
        modify("Vendor Shipment No.")
        {
            Caption = 'Vendor Shipment No.';
        }
        modify("Whse. Receipt No.")
        {
            Caption = 'Whse. Receipt No.';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=You must first set up user %1 as a warehouse employee.;ESP=Primero debe configurar usuario %1 como empleado almacén.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=You must first set up user %1 as a warehouse employee.;ESP=Primero debe configurar usuario %1 como empleado almacén.;
    //Variable type has not been exported.
}

