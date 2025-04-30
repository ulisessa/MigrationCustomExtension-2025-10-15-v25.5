tableextension 50172 tableextension50172 extends Location
{
    Caption = 'Location';
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("Default Bin Code")
        {
            Caption = 'Default Bin Code';
        }
        modify(Address)
        {
            Caption = 'Address';
        }
        modify("Address 2")
        {
            Caption = 'Address 2';
        }
        modify(City)
        {
            Caption = 'City';
        }
        modify("Phone No.")
        {
            Caption = 'Phone No.';
        }
        modify("Phone No. 2")
        {
            Caption = 'Phone No. 2';
        }
        modify("Telex No.")
        {
            Caption = 'Telex No.';
        }
        modify("Fax No.")
        {
            Caption = 'Fax No.';
        }
        modify("Post Code")
        {
            Caption = 'Post Code';
        }
        modify("E-Mail")
        {
            Caption = 'Email';
        }
        modify("Country/Region Code")
        {
            Caption = 'Country/Region Code';
        }
        modify("Use As In-Transit")
        {
            Caption = 'Use As In-Transit';
        }
        modify("Require Put-away")
        {
            Caption = 'Require Put-away';
        }
        modify("Cross-Dock Due Date Calc.")
        {
            Caption = 'Cross-Dock Due Date Calc.';
        }
        modify("Use Cross-Docking")
        {
            Caption = 'Use Cross-Docking';
        }
        modify("Require Receive")
        {
            Caption = 'Require Receive';
        }
        modify("Require Shipment")
        {
            Caption = 'Require Shipment';
        }
        modify("Default Bin Selection")
        {
            Caption = 'Default Bin Selection';
        }
        modify("Put-away Template Code")
        {
            Caption = 'Put-away Template Code';
        }
        modify("Use Put-away Worksheet")
        {
            Caption = 'Use Put-away Worksheet';
        }
        modify("Pick According to FEFO")
        {
            Caption = 'Pick According to FEFO';
        }
        modify("Allow Breakbulk")
        {
            Caption = 'Allow Breakbulk';
        }
        modify("Bin Capacity Policy")
        {
            Caption = 'Bin Capacity Policy';
            OptionCaption = 'Never Check Capacity,Allow More Than Max. Capacity,Prohibit More Than Max. Cap.';
        }
        modify("To-Production Bin Code")
        {
            Caption = 'To-Production Bin Code';
        }
        modify("From-Production Bin Code")
        {
            Caption = 'From-Production Bin Code';
        }
        modify("Adjustment Bin Code")
        {
            Caption = 'Adjustment Bin Code';
        }
        modify("Always Create Put-away Line")
        {
            Caption = 'Always Create Put-away Line';
        }
        modify("Always Create Pick Line")
        {
            Caption = 'Always Create Pick Line';
        }
        modify("Special Equipment")
        {
            OptionCaption = ' ,According to Bin,According to SKU/Item';
        }
        modify("Receipt Bin Code")
        {
            Caption = 'Receipt Bin Code';
        }
        modify("Shipment Bin Code")
        {
            Caption = 'Shipment Bin Code';
        }
        modify("Cross-Dock Bin Code")
        {
            Caption = 'Cross-Dock Bin Code';
        }
        modify("To-Assembly Bin Code")
        {
            Caption = 'To-Assembly Bin Code';
        }
        modify("From-Assembly Bin Code")
        {
            Caption = 'From-Assembly Bin Code';
        }
        modify("Asm.-to-Order Shpt. Bin Code")
        {
            Caption = 'Asm.-to-Order Shpt. Bin Code';
        }
        modify("Base Calendar Code")
        {
            Caption = 'Base Calendar Code';
        }
        field(50000; Grupo; Code[20])
        {
            TableRelation = Seguridad;
        }
        field(50001; "Default bin"; Code[20])
        {
            TableRelation = Bin.Code;
        }
        field(50002; "Default item posting group"; Code[10])
        {
            Caption = 'Grupo contable predefinido';
            TableRelation = "Gen. Product Posting Group";
        }
        field(50003; "Don't check item qt per pallet"; Boolean)
        {
            Caption = 'No verificar bultos por pallet';
            DataClassification = ToBeClassified;
        }
        field(50004; "Don't require pallet no."; Boolean)
        {
            Caption = 'No requerir número de pallet';
            DataClassification = ToBeClassified;
        }
    }


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    StockkeepingUnit.SetRange("Location Code",Code);
    if not StockkeepingUnit.IsEmpty then
      Error(CannotDeleteLocSKUExistErr,Code);
    #4..19
        WorkCenter.Modify(true);
      until WorkCenter.Next = 0;

    CalendarManagement.DeleteCustomizedBaseCalendarData(CustomizedCalendarChange."Source Type"::Location,Code);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..22
    //CalendarManagement.DeleteCustomizedBaseCalendarData(CustomizedCalendarChange."Source Type"::Location,Code);
    */
    //end;


    //Unsupported feature: Code Modification on "OnRename".

    //trigger OnRename()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CalendarManagement.RenameCustomizedBaseCalendarData(CustomizedCalendarChange."Source Type"::Location,Code,xRec.Code);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //CalendarManagement.RenameCustomizedBaseCalendarData(CustomizedCalendarChange."Source Type"::Location,Code,xRec.Code);
    */
    //end;


    //Unsupported feature: Code Modification on "CreateInboundWhseRequest(PROCEDURE 13)".

    //procedure CreateInboundWhseRequest();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TransferLine.SetRange("Transfer-to Code",Code);
    if TransferLine.FindSet then
      repeat
        if TransferLine."Quantity Received" <> TransferLine."Quantity Shipped" then begin
          TransferHeader.Get(TransferLine."Document No.");
          WhseTransferRelease.InitializeWhseRequest(WarehouseRequest,TransferHeader,TransferHeader.Status);
          WhseTransferRelease.CreateInboundWhseRequest(WarehouseRequest,TransferHeader);

          TransferLine.SetRange("Document No.",TransferLine."Document No.");
          TransferLine.FindLast;
          TransferLine.SetRange("Document No.");
        end;
      until TransferLine.Next = 0;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5
    //      WhseTransferRelease.InitializeWhseRequest(WarehouseRequest,TransferHeader,TransferHeader.Status);
          //WhseTransferRelease.CreateInboundWhseRequest(WarehouseRequest,TransferHeader);
    #8..13
    */
    //end;

    //Unsupported feature: Property Modification (TextConstString) on "GetRequirementText(PROCEDURE 6).Text000(Variable 1002)".



    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=You cannot delete the %1 %2, because one or more Warehouse Activity Lines exist for this %1.;ESP=No puede borrar el %1 %2 , porque existen una o más líns. actividad almacén para este %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=You cannot delete the %1 %2, because one or more Warehouse Activity Lines exist for this %1.;ESP=No puede borrar el %1 %2 , porque existen una o más líns. actividad almacén para este %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1007)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=%1 must be Yes, because the bins contain items.;ESP=%1 tiene que ser sí, porque las ubic. contienen prods.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=%1 must be Yes, because the bins contain items.;ESP=%1 tiene que ser sí, porque las ubic. contienen prods.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text005(Variable 1012)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text005 : ENU=Do you still want to delete this %1?;ESP=¿Quiere todavía borrar este %1?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text005 : ENU=Do you still want to delete this %1?;ESP=?Quiere todavía borrar este %1?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text007(Variable 1013)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text007 : ENU=You have to delete all Adjustment Warehouse Journal Lines first before you can change the %1.;ESP=Primero debe eliminar todos los ajustes de líneas diario almacén para poder cambiar el %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text007 : ENU=You have to delete all Adjustment Warehouse Journal Lines first before you can change the %1.;ESP=Primero debe eliminar todos los ajustes de líneas diario almacén para poder cambiar el %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text008(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text008 : ENU=%1 must be %2, because one or more %3 exist.;ESP=%1 tiene que ser %2, porque uno o más %3 existen.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text008 : ENU=%1 must be %2, because one or more %3 exist.;ESP=%1 tiene que ser %2, porque uno o más %3 existen.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text009(Variable 1014)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text009 : ENU=You cannot change %1 because there are one or more open ledger entries on this location.;ESP=No puede cambiar %1 por que hay uno ó más movs. abiertos en este almacén.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text009 : ENU=You cannot change %1 because there are one or more open ledger entries on this location.;ESP=No puede cambiar %1 por que hay uno ? más movs. abiertos en este almacén.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text011(Variable 1016)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text011 : ENU=You cannot change the %1 to %2 until the inventory stored in this bin is 0.;ESP=No puede cambiar %1 a %2 hasta que el valor del inventario almacenado en esta ubicación sea 0.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text011 : ENU=You cannot change the %1 to %2 until the inventory stored in this bin is 0.;ESP=No puede cambiar %1 a %2 hasta que el valor del inventario almacenado en esta ubicación sea 0.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text012(Variable 1017)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text012 : ENU=Before you can use Online Map, you must fill in the Online Map Setup window.\See Setting Up Online Map in Help.;ESP=Para poder usar Online Map, primero debe rellenar la ventana Configuración Online Map.\Consulte Configuración de Online Map en la Ayuda.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text012 : ENU=Before you can use Online Map, you must fill in the Online Map Setup window.\See Setting Up Online Map in Help.;ESP=Para poder usar Online Map, primero debe rellenar la ventana Configuración Online Map.\Consulte Configuración de Online Map en la Ayuda.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text013(Variable 1018)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text013 : ENU=You cannot delete %1 because there are one or more ledger entries on this location.;ESP=No puede eliminar %1 porque hay uno o más movimientos en este almacén.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text013 : ENU=You cannot delete %1 because there are one or more ledger entries on this location.;ESP=No puede eliminar %1 porque hay uno o más movimientos en este almacén.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text014(Variable 1019)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text014 : ENU=You cannot change %1 because one or more %2 exist.;ESP=No puede cambiar %1 porque existen uno o más %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text014 : ENU=You cannot change %1 because one or more %2 exist.;ESP=No puede cambiar %1 porque existen uno o más %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CannotDeleteLocSKUExistErr(Variable 1021)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotDeleteLocSKUExistErr : @@@=%1: Field(Code);ENU=You cannot delete %1 because one or more stockkeeping units exist at this location.;ESP=No se puede eliminar %1 porque existen una o varias unidades de almacenamiento en esta ubicación.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotDeleteLocSKUExistErr : @@@=%1: Field(Code);ENU=You cannot delete %1 because one or more stockkeeping units exist at this location.;ESP=No se puede eliminar %1 porque existen una o varias unidades de almacenamiento en esta ubicación.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "UnspecifiedLocationLbl(Variable 1020)".

    //var
    //>>>> ORIGINAL VALUE:
    //UnspecifiedLocationLbl : ENU=(Unspecified Location);ESP=(Ubicación sin especificar);
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UnspecifiedLocationLbl : ENU=(Unspecified Location);ESP=(Ubicación sin especificar);
    //Variable type has not been exported.
}

