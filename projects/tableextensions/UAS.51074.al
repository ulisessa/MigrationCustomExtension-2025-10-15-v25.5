tableextension 51074 tableextension51074 extends "Warehouse Receipt Header"
{
    Caption = 'Warehouse Receipt Header';
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
        modify("Sorting Method")
        {
            Caption = 'Sorting Method';
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
        modify("Cross-Dock Zone Code")
        {
            Caption = 'Cross-Dock Zone Code';
        }
        modify("Cross-Dock Bin Code")
        {
            Caption = 'Cross-Dock Bin Code';
        }
        modify("Receiving No.")
        {
            Caption = 'Receiving No.';
        }
        modify("Last Receiving No.")
        {
            Caption = 'Last Receiving No.';
        }
        modify("Receiving No. Series")
        {
            Caption = 'Receiving No. Series';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=You cannot change the %1, because the document has one or more lines.;ESP=No puede cambiar el %1, porque el documento tiene una o más líneas.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=You cannot change the %1, because the document has one or more lines.;ESP=No puede cambiar el %1, porque el documento tiene una o más líneas.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=You must first set up user %1 as a warehouse employee.;ESP=Primero debe configurar usuario %1 como empleado almacén.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=You must first set up user %1 as a warehouse employee.;ESP=Primero debe configurar usuario %1 como empleado almacén.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text003 : ENU=You are not allowed to use location code %1.;ESP=No le está permitido utilizar %1 cód. almacén.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : ENU=You are not allowed to use location code %1.;ESP=No le está permitido utilizar %1 Cód. almacén.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text006(Variable 1013)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text006 : ENU=You have changed %1 on the %2, but it has not been changed on the existing Warehouse Receipt Lines.\;ESP=Ha modificado %1 en la %2, pero no ha sido modificado en las líns. recep. almacén actuales.\;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text006 : ENU=You have changed %1 on the %2, but it has not been changed on the existing Warehouse Receipt Lines.\;ESP=Ha modificado %1 en la %2, pero no ha sido modificado en las líns. recep. almacén actuales.\;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text007(Variable 1012)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text007 : ENU=You must update the existing Warehouse Receipt Lines manually.;ESP=Debe actualizar las líns. recep. almacén actuales manualmente.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text007 : ENU=You must update the existing Warehouse Receipt Lines manually.;ESP=Debe actualizar las líns. recep. almacén actuales manualmente.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text008(Variable 1010)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text008 : ENU=The Whse. Receipt is not completely received.\Do you really want to delete the Whse. Receipt?;ESP=La Recep. almacén no se ha recibido completamente.\¿Desea eliminar la Recep. almacén?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text008 : ENU=The Whse. Receipt is not completely received.\Do you really want to delete the Whse. Receipt?;ESP=La Recep. almacén no se ha recibido completamente.\?Desea eliminar la Recep. almacén?;
    //Variable type has not been exported.
}

