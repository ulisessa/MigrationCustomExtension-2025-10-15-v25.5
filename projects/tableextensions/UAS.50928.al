tableextension 50928 tableextension50928 extends "Service Item"
{
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Serial No.")
        {
            Caption = 'Serial No.';
        }
        modify("Service Item Group Code")
        {
            Caption = 'Service Item Group Code';
        }
        modify(Description)
        {

            //Unsupported feature: Property Modification (Data type) on "Description(Field 4)".

            Caption = 'Description';
        }
        modify("Description 2")
        {
            Caption = 'Description 2';
        }
        modify("Customer No.")
        {
            Caption = 'Customer No.';
        }
        modify("Ship-to Code")
        {
            Caption = 'Ship-to Code';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Location of Service Item")
        {
            Caption = 'Location of Service Item';
        }
        modify("Warranty Starting Date (Labor)")
        {
            Caption = 'Warranty Starting Date (Labor)';
        }
        modify("Warranty Ending Date (Labor)")
        {
            Caption = 'Warranty Ending Date (Labor)';
        }
        modify("Warranty Starting Date (Parts)")
        {
            Caption = 'Warranty Starting Date (Parts)';
        }
        modify("Warranty Ending Date (Parts)")
        {
            Caption = 'Warranty Ending Date (Parts)';
        }
        modify("Warranty % (Parts)")
        {
            Caption = 'Warranty % (Parts)';
        }
        modify("Warranty % (Labor)")
        {
            Caption = 'Warranty % (Labor)';
        }
        modify("Installation Date")
        {
            Caption = 'Installation Date';
        }
        modify("Last Service Date")
        {
            Caption = 'Last Service Date';
        }
        modify("Default Contract Value")
        {
            Caption = 'Default Contract Value';
        }
        modify("Default Contract Discount %")
        {
            Caption = 'Default Contract Discount %';
        }
        modify("No. of Active Contracts")
        {
            Caption = 'No. of Active Contracts';
        }
        modify("Vendor No.")
        {
            Caption = 'Vendor No.';
        }
        modify("Vendor Item No.")
        {
            Caption = 'Vendor Item No.';
        }
        modify("Item Description")
        {
            Caption = 'Item Description';
        }
        modify(Address)
        {
            Caption = 'Address';
        }
        modify("Address 2")
        {
            Caption = 'Address 2';
        }
        modify("Post Code")
        {
            Caption = 'Post Code';
        }
        modify(City)
        {
            Caption = 'City';
        }
        modify("Phone No.")
        {
            Caption = 'Phone No.';
        }
        modify("Ship-to Name")
        {
            Caption = 'Ship-to Name';
        }
        modify("Ship-to Address")
        {
            Caption = 'Ship-to Address';
        }
        modify("Ship-to Address 2")
        {
            Caption = 'Ship-to Address 2';
        }
        modify("Ship-to Post Code")
        {
            Caption = 'Ship-to Post Code';
        }
        modify("Ship-to City")
        {
            Caption = 'Ship-to City';
        }
        modify("Ship-to Contact")
        {
            Caption = 'Ship-to Contact';
        }
        modify("Ship-to Phone No.")
        {
            Caption = 'Ship-to Phone No.';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Ship-to County")
        {
            Caption = 'Ship-to County';
        }
        modify("Country/Region Code")
        {
            Caption = 'Country/Region Code';
        }
        modify("Ship-to Country/Region Code")
        {
            Caption = 'Ship-to Country/Region Code';
        }
        modify("Ship-to Name 2")
        {
            Caption = 'Ship-to Name 2';
        }
        modify("Service Price Group Code")
        {
            Caption = 'Service Price Group Code';
        }
        modify("Default Contract Cost")
        {
            Caption = 'Default Contract Cost';
        }
        modify("Search Description")
        {
            Caption = 'Search Description';
        }
        modify("Sales/Serv. Shpt. Document No.")
        {
            Caption = 'Sales/Serv. Shpt. Document No.';
        }
        modify("Sales/Serv. Shpt. Line No.")
        {
            Caption = 'Sales/Serv. Shpt. Line No.';
        }
        modify("Shipment Type")
        {
            Caption = 'Shipment Type';
        }
    }

    //Unsupported feature: Code Modification on "OnRename".

    //trigger OnRename()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if "No." <> xRec."No." then begin
      DimMgt.RenameDefaultDim(DATABASE::"Service Item",xRec."No.","No.");
      ServLogMgt.ServItemNoChange(Rec,xRec);
      ServContractLine.Reset;
      ServContractLine.SetCurrentKey("Service Item No.","Contract Status");
    #6..12
            xRec."No.","No.","No.",0);
        until ServContractLine.Next = 0;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if "No." <> xRec."No." then begin
      //++Arbu DimMgt.RenameDefaultDim(DATABASE::"Service Item",xRec."No.","No.");
    #3..15
    */
    //end;


    //Unsupported feature: Code Modification on "CheckIfCanBeDeleted(PROCEDURE 5)".

    //procedure CheckIfCanBeDeleted();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if ServItemLinesExist then
      exit(
        StrSubstNo(
    #4..22
        exit(
          StrSubstNo(Text002,TableCaption,"No."));

    exit(MoveEntries.CheckIfServiceItemCanBeDeleted(ServiceLedgerEntry,"No."));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..25
    //++Arbu EXIT(MoveEntries.CheckIfServiceItemCanBeDeleted(ServiceLedgerEntry,"No."));
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=You cannot delete %1 %2,because it is attached to a service order.;ESP=No puede eliminar %1 %2, porque está relacionado con un ped. servicio.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=You cannot delete %1 %2,because it is attached to a service order.;ESP=No puede eliminar %1 %2, porque está relacionado con un ped. servicio.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=You cannot delete %1 %2, because it belongs to one or more contracts.;ESP=No puede eliminar %1 %2, porque pertenece a uno o más contratos.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=You cannot delete %1 %2, because it belongs to one or more contracts.;ESP=No puede eliminar %1 %2, porque pertenece a uno o más contratos.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text004(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text004 : ENU=You cannot change %1 %2 because the %3 %4 belongs to one or more contracts.;ESP=No puede modificar %1 %2 porque el %3 %4 pertenece a uno o más contratos.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text004 : ENU=You cannot change %1 %2 because the %3 %4 belongs to one or more contracts.;ESP=No puede modificar %1 %2 porque el %3 %4 pertenece a uno o más contratos.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text017(Variable 1030)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text017 : ENU=Service ledger entries exist for this %1\\ Do you want to change the %2?;ESP=Existen movs. servicio para este %1\\ ¿Desea modificar el %2?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text017 : ENU=Service ledger entries exist for this %1\\ Do you want to change the %2?;ESP=Existen movs. servicio para este %1\\ ?Desea modificar el %2?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ChgCustomerErr(Variable 1010)".

    //var
    //>>>> ORIGINAL VALUE:
    //ChgCustomerErr : @@@="%1 - Field Caption; %2 - Service Order No.;%3 - Serice Line No.;%4 - Service Item No.;%5 - Serial No.;%6 - Customer No.;%7 - Ship to Code.";ENU=You cannot change the %1 in the service item because of the following outstanding service order line:\\ Order %2, line %3, service item number %4, serial number %5, customer %6, ship-to code %7.;ESP=No se puede cambiar %1 en el producto de servicio debido a la línea de pedido de servicio pendiente:\\ pedido %2, línea %3, número de producto de servicio %4, número de serie %5, cliente %6, código de dirección de envío %7.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ChgCustomerErr : @@@="%1 - Field Caption; %2 - Service Order No.;%3 - Serice Line No.;%4 - Service Item No.;%5 - Serial No.;%6 - Customer No.;%7 - Ship to Code.";ENU=You cannot change the %1 in the service item because of the following outstanding service order line:\\ Order %2, line %3, service item number %4, serial number %5, customer %6, ship-to code %7.;ESP=No se puede cambiar %1 en el producto de servicio debido a la línea de pedido de servicio pendiente:\\ pedido %2, línea %3, número de producto de servicio %4, número de serie %5, cliente %6, código de dirección de envío %7.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ChangeItemQst(Variable 1009)".

    //var
    //>>>> ORIGINAL VALUE:
    //ChangeItemQst : @@@=%1 - Field Caption, %2 - Field Caption;ENU=Changing the %1 will delete the existing %2 on the %2 list.\\Do you want to change the %1?;ESP=Al cambiar %1 se eliminará el %2 existente en la lista %2.\\¿Desea cambiar el %1?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ChangeItemQst : @@@=%1 - Field Caption, %2 - Field Caption;ENU=Changing the %1 will delete the existing %2 on the %2 list.\\Do you want to change the %1?;ESP=Al cambiar %1 se eliminará el %2 existente en la lista %2.\\?Desea cambiar el %1?;
    //Variable type has not been exported.
}

