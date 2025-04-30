tableextension 51080 tableextension51080 extends "Posted Whse. Shipment Header"
{
    Caption = 'Posted Whse. Shipment Header';
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
        modify("Bin Code")
        {
            Caption = 'Bin Code';
        }
        modify("Zone Code")
        {
            Caption = 'Zone Code';
        }
        modify("Shipment Date")
        {
            Caption = 'Shipment Date';
        }
        modify("Shipping Agent Code")
        {
            Caption = 'Shipping Agent Code';
        }
        modify("Shipping Agent Service Code")
        {
            Caption = 'Shipping Agent Service Code';
        }
        modify("Shipment Method Code")
        {
            Caption = 'Shipment Method Code';
        }
        modify("Whse. Shipment No.")
        {
            Caption = 'Whse. Shipment No.';
        }
        modify("External Document No.")
        {
            Caption = 'External Document No.';
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

