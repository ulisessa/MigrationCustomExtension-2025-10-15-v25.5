tableextension 51078 tableextension51078 extends "Warehouse Shipment Header"
{
    Caption = 'Warehouse Shipment Header';
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
        modify("Bin Code")
        {
            Caption = 'Bin Code';
        }
        modify("Zone Code")
        {
            Caption = 'Zone Code';
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
        modify("Shipment Date")
        {
            Caption = 'Shipment Date';
        }
        modify("External Document No.")
        {
            Caption = 'External Document No.';
        }
        modify("Shipping No.")
        {
            Caption = 'Shipping No.';
        }
        modify("Last Shipping No.")
        {
            Caption = 'Last Shipping No.';
        }
        modify("Shipping No. Series")
        {
            Caption = 'Shipping No. Series';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1010)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=You cannot change the %1, because the document has one or more lines.;ESP=No puede cambiar el %1, porque el documento tiene una o más líneas.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=You cannot change the %1, because the document has one or more lines.;ESP=No puede cambiar el %1, porque el documento tiene una o más líneas.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=You must first set up user %1 as a warehouse employee.;ESP=Primero debe configurar usuario %1 como empleado almacén.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=You must first set up user %1 as a warehouse employee.;ESP=Primero debe configurar usuario %1 como empleado almacén.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text003 : ENU=You are not allowed to use location code %1.;ESP=No le está permitido utilizar %1 cód. almacén.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : ENU=You are not allowed to use location code %1.;ESP=No le está permitido utilizar %1 Cód. almacén.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text006(Variable 1012)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text006 : ENU=You have changed %1 on the %2, but it has not been changed on the existing Warehouse Shipment Lines.\;ESP=Ha modificado %1 en la %2, pero no ha sido modificado en las líns. recep. almacén actuales.\;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text006 : ENU=You have changed %1 on the %2, but it has not been changed on the existing Warehouse Shipment Lines.\;ESP=Ha modificado %1 en la %2, pero no ha sido modificado en las líns. recep. almacén actuales.\;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text007(Variable 1009)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text007 : ENU=You must update the existing Warehouse Shipment Lines manually.;ESP=Debe actualizar las líns. recep. almacén actuales manualmente.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text007 : ENU=You must update the existing Warehouse Shipment Lines manually.;ESP=Debe actualizar las líns. recep. almacén actuales manualmente.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text008(Variable 1014)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text008 : ENU=You have modified the %1.\\Do you want to update the lines?;ESP=Ha modificado el %1.\\¿Desea actualizar las líneas?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text008 : ENU=You have modified the %1.\\Do you want to update the lines?;ESP=Ha modificado el %1.\\?Desea actualizar las líneas?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text009(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text009 : ENU=The items have been picked. If you delete the warehouse shipment, then the items will remain in the shipping area until you put them away.\Related item tracking information that is defined during the pick will be deleted.\Are you sure that you want to delete the warehouse shipment?;ESP=Se han preparado los productos. Si elimina el envío de almacén, los productos permanecerán en el área de envío hasta que los ubique.\Se eliminará la información de seguimiento de productos definida durante la preparación.\¿Está seguro de que desea eliminar el envío de almacén?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text009 : ENU=The items have been picked. If you delete the warehouse shipment, then the items will remain in the shipping area until you put them away.\Related item tracking information that is defined during the pick will be deleted.\Are you sure that you want to delete the warehouse shipment?;ESP=Se han preparado los productos. Si elimina el envío de almacén, los productos permanecerán en el área de envío hasta que los ubique.\Se eliminará la información de seguimiento de productos definida durante la preparación.\?está seguro de que desea eliminar el envío de almacén?;
    //Variable type has not been exported.
}

