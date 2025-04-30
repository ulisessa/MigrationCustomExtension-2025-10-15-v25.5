tableextension 50458 tableextension50458 extends "Tracking Specification"
{
    Caption = 'Tracking Specification';
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Creation Date")
        {
            Caption = 'Creation Date';
        }
        modify("Source Batch Name")
        {
            Caption = 'Source Batch Name';
        }
        modify("Source Prod. Order Line")
        {
            Caption = 'Source Prod. Order Line';
        }
        modify("Source Ref. No.")
        {
            Caption = 'Source Ref. No.';
        }
        modify("Item Ledger Entry No.")
        {
            Caption = 'Item Ledger Entry No.';
        }
        modify("Transfer Item Entry No.")
        {
            Caption = 'Transfer Item Entry No.';
        }
        modify("Serial No.")
        {
            Caption = 'Serial No.';
        }
        modify("Appl.-to Item Entry")
        {
            Caption = 'Appl.-to Item Entry';
        }
        modify("Warranty Date")
        {
            Caption = 'Warranty Date';
        }
        modify("Buffer Status2")
        {
            OptionCaption = ',ExpDate blocked';
        }
        modify("New Serial No.")
        {
            Caption = 'New Serial No.';
        }
        modify("New Lot No.")
        {
            Caption = 'New Lot No.';
        }
        modify("Prohibit Cancellation")
        {
            Caption = 'Prohibit Cancellation';
        }
        modify("Lot No.")
        {
            Caption = 'Lot No.';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Bin Code")
        {
            Caption = 'Bin Code';
        }
        modify(Correction)
        {
            Caption = 'Correction';
        }

        //Unsupported feature: Code Modification on ""Expiration Date"(Field 41).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        WMSManagement.CheckItemTrackingChange(Rec,xRec);
        if "Buffer Status2" = "Buffer Status2"::"ExpDate blocked" then begin
          "Expiration Date" := xRec."Expiration Date";
          Message(Text004);
        end;

        if "Expiration Date" <> xRec."Expiration Date" then
          ItemTrackingMgt.UpdateExpirationDateForLot(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..6
        {IF "Expiration Date" <> xRec."Expiration Date" THEN
          ItemTrackingMgt.UpdateExpirationDateForLot(Rec);
          }
        */
        //end;


        //Unsupported feature: Code Modification on ""Qty. to Handle (Base)"(Field 50).OnValidate".

        //trigger  to Handle (Base)"(Field 50)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if ("Qty. to Handle (Base)" * "Quantity (Base)" < 0) or
           (Abs("Qty. to Handle (Base)") > Abs("Quantity (Base)")
            - "Quantity Handled (Base)")
        #4..8
        InitQtyToInvoice;
        "Qty. to Handle" := CalcQty("Qty. to Handle (Base)");
        CheckSerialNoQty;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..11
        //++Arbu

        Clear(cduProductionFishing);
        Validate("Net kilos to handle (Base)",cduProductionFishing.FunCalcPesoNeto("Qty. to Handle (Base)","Item No.",
                                                                            "Qty. per Unit of Measure"));
        Validate("Gross kilos to handle (Base)",cduProductionFishing.FunCalcPesoBruto("Qty. to Handle (Base)",
                                                                              "Item No.","Qty. per Unit of Measure"));

        //--Arbu
        */
        //end;


        //Unsupported feature: Code Modification on ""Qty. to Invoice (Base)"(Field 51).OnValidate".

        //trigger  to Invoice (Base)"(Field 51)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if ("Qty. to Invoice (Base)" * "Quantity (Base)" < 0) or
           (Abs("Qty. to Invoice (Base)") > Abs("Qty. to Handle (Base)"
              + "Quantity Handled (Base)" - "Quantity Invoiced (Base)"))
        #4..7

        "Qty. to Invoice" := CalcQty("Qty. to Invoice (Base)");
        CheckSerialNoQty;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..10
        //++Arbu

        Clear(cduProductionFishing);
        Validate("Net kilos to invoice (Base)",cduProductionFishing.FunCalcPesoNeto("Qty. to Invoice (Base)","Item No.",
                                                                            "Qty. per Unit of Measure"));
        Validate("Gross kilos to invoice (Base)",cduProductionFishing.FunCalcPesoBruto("Qty. to Invoice (Base)",
                                                                              "Item No.","Qty. per Unit of Measure"));

        //--Arbu
        */
        //end;
        field(50010; "Net kilos (Base)"; Decimal)
        {
            Caption = 'Net kilos (Base)';
            DecimalPlaces = 0 : 5;

        }
        field(50011; "Gross kilos (Base)"; Decimal)
        {
            Caption = 'Gross kilos (Base)';
            DecimalPlaces = 0 : 5;

        }
        field(50014; "Net kilos to handle (Base)"; Decimal)
        {
            Caption = 'Net kilos to handle (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(50015; "Gross kilos to handle (Base)"; Decimal)
        {
            Caption = 'Gross kilos to handle (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(50016; "Net kilos to invoice (Base)"; Decimal)
        {
            Caption = 'Net kilos to invoice (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(50017; "Gross kilos to invoice (Base)"; Decimal)
        {
            Caption = 'Gross kilos to invoice (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(50018; "Net kilos invoiced (Base)"; Decimal)
        {
            Caption = 'Net kilos invoiced (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(50019; "Gross kilos invoiced (Base)"; Decimal)
        {
            Caption = 'Gross kilos invoiced (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(50022; "Net kilos to Handle"; Decimal)
        {
            Caption = 'Net kilos to Handle';
            DecimalPlaces = 0 : 5;
        }
        field(50023; "Gross kilos to Handle"; Decimal)
        {
            Caption = 'Gross kilos to Handle';
            DecimalPlaces = 0 : 5;
        }
        field(50024; "Net kilos to invoice"; Decimal)
        {
            Caption = 'Net kilos to invoice';
            DecimalPlaces = 0 : 5;
        }
        field(50025; "Gross kilos to invoice"; Decimal)
        {
            Caption = 'Gross kilos to invoice';
            DecimalPlaces = 0 : 5;
        }
        field(50026; "Nk actual handled (Base)"; Decimal)
        {
            Caption = 'Nk actual handled (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50027; "Gk actual handled (Base)"; Decimal)
        {
            Caption = 'Gk actual handled (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50028; "Buffer Value6"; Decimal)
        {
            Caption = 'Buffer Value5';
            Description = 'Buffer Value4 KN';
            Editable = false;
        }
        field(50029; "Buffer Value7"; Decimal)
        {
            Caption = 'Buffer Value5';
            Description = 'Buffer Value4 KB';
            Editable = false;
        }
        field(50030; "Buffer Value8"; Decimal)
        {
            Caption = 'Buffer Value5';
            Description = 'Buffer Value2 KN';
            Editable = false;
        }
        field(50031; "Buffer Value9"; Decimal)
        {
            Caption = 'Buffer Value5';
            Description = 'Buffer Value2 KB';
            Editable = false;
        }
        field(50032; "Buffer Value10"; Decimal)
        {
            Caption = 'Buffer Value5';
            Description = 'Buffer Value1 KN';
            Editable = false;
        }
        field(50033; "Buffer Value11"; Decimal)
        {
            Caption = 'Buffer Value5';
            Description = 'Buffer Value1 KB';
            Editable = false;
        }
        field(50034; "Buffer Value12"; Decimal)
        {
            Caption = 'Buffer Value5';
            Description = 'Buffer Value3 KN';
            Editable = false;
        }
        field(50035; "Buffer Value13"; Decimal)
        {
            Caption = 'Buffer Value5';
            Description = 'Buffer Value3 KB';
            Editable = false;
        }
        field(50036; "Buffer Value14"; Decimal)
        {
            Caption = 'Buffer Value5';
            Description = 'Buffer Value5 KN';
            Editable = false;
        }
        field(50037; "Buffer Value15"; Decimal)
        {
            Caption = 'Buffer Value5';
            Description = 'Buffer Value5 KB';
            Editable = false;
        }
        field(50038; "Net kilos handled (Base)"; Decimal)
        {
            Caption = 'Net kilos handled (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50039; "Gross kilos handled (Base)"; Decimal)
        {
            Caption = 'Gross kilos handled (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
    }


    //Unsupported feature: Code Modification on "InitQtyToShip(PROCEDURE 15)".

    //procedure InitQtyToShip();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    OnBeforeInitQtyToShip(Rec);

    "Qty. to Handle (Base)" := "Quantity (Base)" - "Quantity Handled (Base)";
    "Qty. to Handle" := CalcQty("Qty. to Handle (Base)");

    InitQtyToInvoice;

    OnAfterInitQtyToShip(Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5
    //++Arbu
    "Net kilos to handle (Base)" := "Net kilos (Base)" - "Net kilos handled (Base)";
    "Net kilos to Handle" := "Net kilos to handle (Base)";
    "Gross kilos to handle (Base)" := "Gross kilos (Base)" - "Gross kilos handled (Base)";
    "Gross kilos to Handle" := "Gross kilos to handle (Base)";
    //--Arbu

    #6..8
    */
    //end;


    //Unsupported feature: Code Modification on "InitQtyToInvoice(PROCEDURE 13)".

    //procedure InitQtyToInvoice();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    OnBeforeInitQtyToInvoice(Rec);

    "Qty. to Invoice (Base)" := "Quantity Handled (Base)" + "Qty. to Handle (Base)" - "Quantity Invoiced (Base)";
    "Qty. to Invoice" := CalcQty("Qty. to Invoice (Base)");

    OnAfterInitQtyToInvoice(Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
    //++Arbu
    "Net kilos to invoice (Base)" := "Net kilos handled (Base)"+"Net kilos to handle (Base)" - "Net kilos invoiced (Base)";
    "Net kilos to invoice" := "Net kilos to invoice (Base)";
    "Gross kilos to invoice (Base)" := "Gross kilos handled (Base)"+"Gross kilos to handle (Base)" - "Gross kilos invoiced (Base)";
    "Gross kilos to invoice" := "Gross kilos to invoice (Base)";
    //--Arbu

    OnAfterInitQtyToInvoice(Rec);
    */
    //end;


    //Unsupported feature: Code Modification on "InitExpirationDate(PROCEDURE 2)".

    //procedure InitExpirationDate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if ("Serial No." = xRec."Serial No.") and ("Lot No." = xRec."Lot No.") then
      exit;

    "Expiration Date" := 0D;
    ItemTrackingMgt.CopyExpirationDateForLot(Rec);

    ExpDate := ItemTrackingMgt.ExistingExpirationDate("Item No.","Variant Code","Lot No.","Serial No.",false,EntriesExist);
    if EntriesExist then begin
    #9..14
      "New Expiration Date" := "Expiration Date";
      "Warranty Date" := ItemTrackingMgt.ExistingWarrantyDate("Item No.","Variant Code","Lot No.","Serial No.",EntriesExist);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
    //ItemTrackingMgt.CopyExpirationDateForLot(Rec);
    #6..17
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=You cannot invoice more than %1 units.;ESP=No se pueden facturar más de %1 unidades.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=You cannot invoice more than %1 units.;ESP=No se pueden facturar más de %1 unidades.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=You cannot handle more than %1 units.;ESP=No puede manipular más de %1 unidades.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=You cannot handle more than %1 units.;ESP=No puede manipular más de %1 unidades.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text003 : ENU=%1 must be -1, 0 or 1 when %2 is stated.;ESP=%1 debe ser -1, 0 o 1 cuendo está seleccionado %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : ENU=%1 must be -1, 0 or 1 when %2 is stated.;ESP=%1 debe ser -1, 0 o 1 cuendo está seleccionado %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text004(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text004 : ENU=Expiration date has been established by existing entries and cannot be changed.;ESP=La fecha caducidad se estableció con los movimientos existentes y no se puede cambiar.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text004 : ENU=Expiration date has been established by existing entries and cannot be changed.;ESP=La fecha caducidad se estableci? con los movimientos existentes y no se puede cambiar.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "WrongQtyForItemErr(Variable 1009)".

    //var
    //>>>> ORIGINAL VALUE:
    //WrongQtyForItemErr : @@@=%1 - Qty. to Handle or Qty. to Invoice, %2 - Item No., %3 - actual value, %4 - expected value, %5 - Serial No., %6 - Lot No.;ENU=%1 in the item tracking assigned to the document line for item %2 is currently %3. It must be %4.\\Check the assignment for serial number %5, lot number %6.;ESP=%1 en el seguimiento de producto asignado a la línea del documento para el producto %2 es actualmente %3. Debe ser %4.\\Compruebe la asignación para el número de serie %5, número de lote %6.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //WrongQtyForItemErr : @@@=%1 - Qty. to Handle or Qty. to Invoice, %2 - Item No., %3 - actual value, %4 - expected value, %5 - Serial No., %6 - Lot No.;ENU=%1 in the item tracking assigned to the document line for item %2 is currently %3. It must be %4.\\Check the assignment for serial number %5, lot number %6.;ESP=%1 en el seguimiento de producto asignado a la línea del documento para el producto %2 es actualmente %3. Debe ser %4.\\Compruebe la asignación para el número de serie %5, número de lote %6.;
    //Variable type has not been exported.

    var
        "---ARBUMASA---": Integer;
        Producto: Record Item;
}

