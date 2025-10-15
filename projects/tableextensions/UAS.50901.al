tableextension 50901 tableextension50901 extends "Service Line"
{
    Caption = 'Service Line';
    fields
    {
        modify("Customer No.")
        {
            Caption = 'Customer No.';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Description 2")
        {
            Caption = 'Description 2';
        }
        modify("Line Discount %")
        {
            Caption = 'Line Discount %';
        }
        modify("Line Discount Amount")
        {
            Caption = 'Line Discount Amount';
        }
        modify("Appl.-to Item Entry")
        {
            Caption = 'Appl.-to Item Entry';
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        modify("Shortcut Dimension 2 Code")
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        modify("Job No.")
        {
            Caption = 'Job No.';
        }
        modify("Job Task No.")
        {
            Caption = 'Job Task No.';
        }
        modify("Job Line Type")
        {
            Caption = 'Job Line Type';
        }
        modify("Work Type Code")
        {
            Caption = 'Work Type Code';
        }
        modify("Shipment No.")
        {
            Caption = 'Shipment No.';
        }
        modify("Shipment Line No.")
        {
            Caption = 'Shipment Line No.';
        }
        modify("Bill-to Customer No.")
        {
            Caption = 'Bill-to Customer No.';
        }
        modify("VAT Calculation Type")
        {
            Caption = 'VAT Calculation Type';
        }
        modify("Transaction Type")
        {
            Caption = 'Transaction Type';
        }
        modify("Attached to Line No.")
        {
            Caption = 'Attached to Line No.';
        }
        modify("Area")
        {
            Caption = 'Area';
        }
        modify("Transaction Specification")
        {
            Caption = 'Transaction Specification';
        }
        modify("Tax Area Code")
        {
            Caption = 'Tax Area Code';
        }
        modify("Tax Group Code")
        {
            Caption = 'Tax Group Code';
        }
        modify("VAT Clause Code")
        {
            Caption = 'VAT Clause Code';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("System-Created Entry")
        {
            Caption = 'System-Created Entry';
        }
        modify("Line Amount")
        {
            Caption = 'Line Amount';
        }
        modify("Time Sheet No.")
        {
            Caption = 'Time Sheet No.';
        }
        modify("Time Sheet Line No.")
        {
            Caption = 'Time Sheet Line No.';
        }
        modify("Job Planning Line No.")
        {
            Caption = 'Job Planning Line No.';
        }
        modify("Job Remaining Line Amount")
        {
            Caption = 'Job Remaining Line Amount';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Bin Code")
        {
            Caption = 'Bin Code';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Substitution Available")
        {
            Caption = 'Substitution Available';
        }
        modify("Item Category Code")
        {
            Caption = 'Item Category Code';
        }
        modify(Nonstock)
        {
            Caption = 'Catalog';
        }
        modify("Whse. Outstanding Qty. (Base)")
        {
            Caption = 'Whse. Outstanding Qty. (Base)';
        }
        modify("Shipping Time")
        {
            Caption = 'Shipping Time';
        }
        modify("Shipping Agent Code")
        {
            Caption = 'Shipping Agent Code';
        }
        modify("Shipping Agent Service Code")
        {
            Caption = 'Shipping Agent Service Code';
        }
        modify("Service Item No.")
        {
            Caption = 'Service Item No.';
        }
        modify("Service Item Line No.")
        {
            Caption = 'Service Item Line No.';
        }
        modify("Service Item Serial No.")
        {
            Caption = 'Service Item Serial No.';
        }
        modify("Service Item Line Description")
        {
            Caption = 'Service Item Line Description';
        }
        modify("Serv. Price Adjmt. Gr. Code")
        {
            Caption = 'Serv. Price Adjmt. Gr. Code';
        }
        modify("Ship-to Code")
        {
            Caption = 'Ship-to Code';
        }
        modify("Service Price Group Code")
        {
            Caption = 'Service Price Group Code';
        }
        modify("Fault Area Code")
        {
            Caption = 'Fault Area Code';
        }
        modify("Symptom Code")
        {
            Caption = 'Symptom Code';
        }
        modify("Fault Code")
        {
            Caption = 'Fault Code';
        }
        modify("Resolution Code")
        {
            Caption = 'Resolution Code';
        }
        modify("Exclude Warranty")
        {
            Caption = 'Exclude Warranty';
        }
        modify(Warranty)
        {
            Caption = 'Warranty';
        }
        modify("Contract No.")
        {
            Caption = 'Contract No.';
        }
        modify("Warranty Disc. %")
        {
            Caption = 'Warranty Disc. %';
        }
        modify("Component Line No.")
        {
            Caption = 'Component Line No.';
        }
        modify("Spare Part Action")
        {
            Caption = 'Spare Part Action';
        }
        modify("Fault Reason Code")
        {
            Caption = 'Fault Reason Code';
        }
        modify("Replaced Item No.")
        {
            Caption = 'Replaced Item No.';
        }
        modify("Line Discount Type")
        {
            Caption = 'Line Discount Type';
            OptionCaption = ' ,Warranty Disc.,Contract Disc.,Line Disc.,Manual';
        }
        modify("Copy Components From")
        {
            OptionCaption = 'None,Item BOM,Old Service Item,Old Serv.Item w/o Serial No.';
        }
        modify("Return Reason Code")
        {
            Caption = 'Return Reason Code';
        }
        modify("Allow Line Disc.")
        {
            Caption = 'Allow Line Disc.';
        }

        //Unsupported feature: Code Modification on "Amount(Field 29).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GetServHeader;
        Amount := Round(Amount,Currency."Amount Rounding Precision");
        case "VAT Calculation Type" of
        #4..23
                Amount +
                SalesTaxCalculate.CalculateTax(
                  "Tax Area Code","Tax Group Code","Tax Liable",ServHeader."Posting Date",
                  "VAT Base Amount","Quantity (Base)",ServHeader."Currency Factor");
              if "VAT Base Amount" <> 0 then
                "VAT %" :=
                  Round(100 * ("Amount Including VAT" - "VAT Base Amount") / "VAT Base Amount",0.00001)
        #31..37

        "Pmt. Discount Amount" := 0;
        InitOutstandingAmount;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..26
                  "VAT Base Amount","Quantity (Base)",ServHeader."Currency Factor",
                  //++Arbu
                  "Customer No.",Type,'',Amount
                  //--Arbu
                  );
        #28..40
        */
        //end;


        //Unsupported feature: Code Modification on ""Line Amount"(Field 103).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestField(Type);
        TestField(Quantity);
        TestField("Unit Price");
        Currency.Initialize("Currency Code");
        "Line Amount" := Round("Line Amount",Currency."Amount Rounding Precision");
        LineDiscountAmountExpected := Round(CalcChargeableQty * "Unit Price",Currency."Amount Rounding Precision") - "Line Amount";
        if ServAmountsMgt.AmountsDifferByMoreThanRoundingPrecision(LineDiscountAmountExpected,"Line Discount Amount",Currency."Amount Rounding Precision") then
          Validate("Line Discount Amount",LineDiscountAmountExpected);
        GetServHeader;
        if ServHeader."Tax Area Code" = '' then
          UpdateVATAmounts;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..6
        //IF ServAmountsMgt.AmountsDifferByMoreThanRoundingPrecision(LineDiscountAmountExpected,"Line Discount Amount",Currency."Amount Rounding Precision") THEN
          //VALIDATE("Line Discount Amount",LineDiscountAmountExpected);
        #9..11
        */
        //end;


        //Unsupported feature: Code Modification on ""Dimension Set ID"(Field 480).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
          //++Arbu
          "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
          "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
          "Shortcut Dimension 7 Code"
          //--Arbu
        );
        */
        //end;
        field(50503; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(50504; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(50505; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 1 Code';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(50506; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 2 Code';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }
        field(50507; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 1 Code';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
    }


    //Unsupported feature: Code Modification on "CreateDim(PROCEDURE 26)".

    //procedure CreateDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SourceCodeSetup.Get;
    GetServHeader;
    if not ServItemLine.Get(ServHeader."Document Type",ServHeader."No.","Service Item Line No.") then
    #4..12

    "Shortcut Dimension 1 Code" := '';
    "Shortcut Dimension 2 Code" := '';
    DimensionSetID := ServItemLine."Dimension Set ID";
    if DimensionSetID = 0 then
      DimensionSetID := ServHeader."Dimension Set ID";
    UpdateDimSetupFromDimSetID(TableID,No,DimensionSetID);
    "Dimension Set ID" :=
      DimMgt.GetRecDefaultDimID(
        Rec,CurrFieldNo,TableID,No,SourceCodeSetup."Service Management",
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",DimensionSetID,DATABASE::Customer);
    DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..15
    //++Arbu
    "Shortcut Dimension 3 Code" := '';
    "Shortcut Dimension 4 Code" := '';
    "Shortcut Dimension 5 Code" := '';
    "Shortcut Dimension 6 Code" := '';
    "Shortcut Dimension 7 Code" := '';
    //--Arbu

    #16..22
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
      //++Arbu
      "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
      "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
      "Shortcut Dimension 7 Code",
      //--Arbu
      DimensionSetID,DATABASE::Customer);
    DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
    //++Arbu
    "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
    "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
    "Shortcut Dimension 1 Code"
    //--Arbu
    );
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateAmounts(PROCEDURE 13)".

    //procedure UpdateAmounts();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if GuiAllowed and (CurrFieldNo <> 0) then
      ConfirmAdjPriceLineChange;

    #4..15
    InitOutstandingAmount;
    if not IsCustCrLimitChecked and (CurrFieldNo <> 0) then begin
      IsCustCrLimitChecked := true;
      CustCheckCrLimit.ServiceLineCheck(Rec);
    end;
    UpdateRemainingCostsAndAmounts;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..18
    //  CustCheckCrLimit.ServiceLineCheck(Rec);
    end;
    UpdateRemainingCostsAndAmounts;
    */
    //end;


    //Unsupported feature: Code Modification on "ShowDimensions(PROCEDURE 25)".

    //procedure ShowDimensions();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if ("Contract No." <> '') and ("Appl.-to Service Entry" <> 0) then
      ViewDimensionSetEntries
    else
      "Dimension Set ID" :=
        DimMgt.EditDimensionSet2(
          "Dimension Set ID",StrSubstNo('%1 %2 %3',"Document Type","Document No.","Line No."),
          "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6
          "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
          //++Arbu
          "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
          "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
          "Shortcut Dimension 1 Code"
          //--Arbu
          );
    */
    //end;


    //Unsupported feature: Code Modification on "AutoReserve(PROCEDURE 39)".

    //procedure AutoReserve();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TestField(Type,Type::Item);
    TestField("No.");
    if Reserve = Reserve::Never then
      FieldError(Reserve);
    ReserveServLine.ReservQuantity(Rec,QtyToReserve,QtyToReserveBase);
    if QtyToReserveBase <> 0 then begin
      ReservMgt.SetServLine(Rec);
      if ReplaceServItemAction then begin
    #9..19
        end;
      end;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
    //++Arbu
    ReserveServLine.ReservQuantity(Rec,QtyToReserve[1],QtyToReserveBase);
    //--Arbu
    #6..22
    */
    //end;


    //Unsupported feature: Code Modification on "ShowNonstock(PROCEDURE 32)".

    //procedure ShowNonstock();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TestField(Type,Type::Item);
    TestField("No.",'');
    if PAGE.RunModal(PAGE::"Catalog Item List",NonstockItem) = ACTION::LookupOK then begin
      NonstockItem.TestField("Item Template Code");
      ConfigTemplateHeader.SetRange("Table ID",DATABASE::Item);
      ConfigTemplateHeader.SetRange(Code,NonstockItem."Item Template Code");
      ConfigTemplateHeader.SetRange(Enabled,true);
      ConfigTemplateHeader.FindFirst;

      TestConfigTemplateLineField(NonstockItem."Item Template Code",ItemTemplate.FieldNo("Gen. Prod. Posting Group"));
      TestConfigTemplateLineField(NonstockItem."Item Template Code",ItemTemplate.FieldNo("Inventory Posting Group"));

      "No." := NonstockItem."Entry No.";
      CatalogItemMgt.NonStockFSM(Rec);
      Validate("No.","No.");
      Validate("Unit Price",NonstockItem."Unit Price");
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    TestField(Type,Type::Item);
    TestField("No.",'');
    {IF PAGE.RUNMODAL(PAGE::"Catalog Item List",NonstockItem) = ACTION::LookupOK THEN BEGIN
      NonstockItem.TESTFIELD("Item Template Code");
      ConfigTemplateHeader.SETRANGE("Table ID",DATABASE::Item);
      ConfigTemplateHeader.SETRANGE(Code,NonstockItem."Item Template Code");
      ConfigTemplateHeader.SETRANGE(Enabled,TRUE);
      ConfigTemplateHeader.FINDFIRST;

      TestConfigTemplateLineField(NonstockItem."Item Template Code",ItemTemplate.FIELDNO("Gen. Prod. Posting Group"));
      TestConfigTemplateLineField(NonstockItem."Item Template Code",ItemTemplate.FIELDNO("Inventory Posting Group"));
    #12..14
      VALIDATE("No.","No.");
      VALIDATE("Unit Price",NonstockItem."Unit Price");
    END;
    }
    */
    //end;


    //Unsupported feature: Code Modification on "InsertItemTracking(PROCEDURE 20)".

    //procedure InsertItemTracking();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ServiceLine := Rec;
    if TempTrackingSpecification.FindFirst then begin
      ReserveServLine.DeleteLine(Rec);
      Clear(CreateReservEntry);
      with ServiceLine do begin
        CreateReservEntry.CreateReservEntryFor(DATABASE::"Service Line","Document Type","Document No.",
          '',0,"Line No.","Qty. per Unit of Measure",Quantity,"Quantity (Base)",
          TempTrackingSpecification."Serial No.",TempTrackingSpecification."Lot No.");
        CreateReservEntry.CreateEntry("No.","Variant Code","Location Code",Description,
          0D,"Posting Date",0,ReservEntry."Reservation Status"::Surplus);
      end;
      TempTrackingSpecification.DeleteAll;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..7
          TempTrackingSpecification."Serial No.",TempTrackingSpecification."Lot No.",
          //++Arbu
          0,0);
          //--Arbu
    #9..13
    */
    //end;


    //Unsupported feature: Code Modification on "InitOutstandingAmount(PROCEDURE 61)".

    //procedure InitOutstandingAmount();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if (Quantity = 0) or (CalcChargeableQty = 0) then begin
      "Outstanding Amount" := 0;
      "Outstanding Amount (LCY)" := 0;
    #4..11
            Round(
              SalesTaxCalculate.CalculateTax(
                "Tax Area Code","Tax Group Code","Tax Liable",ServHeader."Posting Date",
                CalcLineAmount,"Quantity (Base)",ServHeader."Currency Factor"),
              Currency."Amount Rounding Precision")
        else
          AmountInclVAT :=
    #19..33
    end;

    OnAfterInitOutstandingAmount(Rec,ServHeader,Currency);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..14
                CalcLineAmount,"Quantity (Base)",ServHeader."Currency Factor",
                //++Arbu
                "Customer No.",Type,'',Amount
                //--Arbu
                ),
    #16..36
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateVATAmounts(PROCEDURE 38)".

    //procedure UpdateVATAmounts();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    OnBeforeUpdateVATAmounts(Rec);

    GetServHeader;
    #4..117
                  SalesTaxCalculate.CalculateTax(
                    "Tax Area Code","Tax Group Code","Tax Liable",ServHeader."Posting Date",
                    TotalAmount + Amount,TotalQuantityBase + "Quantity (Base)",
                    ServHeader."Currency Factor"),Currency."Amount Rounding Precision") -
                TotalAmountInclVAT;
              if "VAT Base Amount" <> 0 then
                "VAT %" :=
    #125..131
    end;

    OnAfterUpdateVATAmounts(Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..120
                    ServHeader."Currency Factor",
                    //++Arbu
                    "Customer No.",Type,'',Amount),
                    //--Arbu
                    Currency."Amount Rounding Precision") -
    #122..134
    */
    //end;

    //Unsupported feature: Property Insertion (Dimensions) on "AutoReserve(PROCEDURE 39).QtyToReserve(Variable 1000)".



    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1085)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=You cannot invoice more than %1 units.;ESP=No se pueden facturar más de %1 unidades.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=You cannot invoice more than %1 units.;ESP=No se pueden facturar más de %1 unidades.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1084)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=You cannot invoice more than %1 base units.;ESP=No se pueden facturar más de %1 unidades base.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=You cannot invoice more than %1 base units.;ESP=No se pueden facturar más de %1 unidades base.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text005(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text005 : ENU=The update has been interrupted to respect the warning.;ESP=Se ha interrumpido la actualización para respetar la advertencia.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text005 : ENU=The update has been interrupted to respect the warning.;ESP=Se ha interrumpido la actualización para respetar la advertencia.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text008(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text008 : ENU=You cannot change the value of the %1 field because the %2 field in the Fault Reason Codes window contains a check mark for the %3 %4.;ESP=No puede modificar el campo %1 porque %3 %4 tiene el campo %2 activo en la ventana Códigos auditoría defecto.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text008 : ENU=You cannot change the value of the %1 field because the %2 field in the Fault Reason Codes window contains a check mark for the %3 %4.;ESP=No puede modificar el campo %1 porque %3 %4 tiene el campo %2 activo en la ventana Códigos auditoría defecto.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text009(Variable 1009)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text009 : ENU=You have changed the value of the field %1.\Do you want to continue ?;ESP=Ha modificado el valor del campo %1.\¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text009 : ENU=You have changed the value of the field %1.\Do you want to continue ?;ESP=Ha modificado el valor del campo %1.\?Desea continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ManualReserveQst(Variable 1087)".

    //var
    //>>>> ORIGINAL VALUE:
    //ManualReserveQst : ENU=Automatic reservation is not possible.\Do you want to reserve items manually?;ESP=No se puede reservar automáticamente.\¿Desea reservar los productos manualmente?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ManualReserveQst : ENU=Automatic reservation is not possible.\Do you want to reserve items manually?;ESP=No se puede reservar automáticamente.\?Desea reservar los productos manualmente?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text015(Variable 1015)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text015 : ENU=You have already selected %1 %2 for replacement.;ESP=Ya ha seleccionado %1 %2 para reposición.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text015 : ENU=You have already selected %1 %2 for replacement.;ESP=Ya ha seleccionado %1 %2 para reposición.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text016(Variable 1083)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text016 : ENU=You cannot ship more than %1 units.;ESP=No se pueden enviar más de %1 unidades.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text016 : ENU=You cannot ship more than %1 units.;ESP=No se pueden enviar más de %1 unidades.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text017(Variable 1082)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text017 : ENU=You cannot ship more than %1 base units.;ESP=No se pueden enviar más de %1 unidades base.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text017 : ENU=You cannot ship more than %1 base units.;ESP=No se pueden enviar más de %1 unidades base.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CompAlreadyReplacedErr(Variable 1021)".

    //var
    //>>>> ORIGINAL VALUE:
    //CompAlreadyReplacedErr : @@@="%1 = Line No.";ENU=The component that you selected has already been replaced in service line %1.;ESP=El componente que ha seleccionado ya se ha sustituido en la línea de servicio %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CompAlreadyReplacedErr : @@@="%1 = Line No.";ENU=The component that you selected has already been replaced in service line %1.;ESP=El componente que ha seleccionado ya se ha sustituido en la línea de servicio %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Subtype) on "CatalogItemMgt(Variable 1064)".

    //var
    //>>>> ORIGINAL VALUE:
    //CatalogItemMgt : "Catalog Item Management";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CatalogItemMgt : "Nonstock Item Management";
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text023(Variable 1077)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text023 : ENU=You must enter a serial number.;ESP=Debe introducir número de serie.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text023 : ENU=You must enter a serial number.;ESP=Debe introducir número de serie.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text026(Variable 1068)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text026 : ENU=When replacing or creating a service item component you may only enter a whole number into the %1 field.;ESP=Si crea o sustituye un componente de producto de servicio, en el campo %1 solo puede introducir un número completo.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text026 : ENU=When replacing or creating a service item component you may only enter a whole number into the %1 field.;ESP=Si crea o sustituye un componente de producto de servicio, en el campo %1 solo puede introducir un número completo.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text027(Variable 1070)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text027 : ENU=The %1 %2 with a check mark in the %3 field cannot be entered if the service line type is other than Item or Resource.;ESP=No se puede utilizar el %1 %2 con una marca en la casilla de verificación del campo %3 si el tipo de línea de servicio es diferente del Producto o del Recurso.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text027 : ENU=The %1 %2 with a check mark in the %3 field cannot be entered if the service line type is other than Item or Resource.;ESP=No se puede utilizar el %1 %2 con una marca en la casilla de verificación del campo %3 si el tipo de línea de servicio es diferente del Producto o del Recurso.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text028(Variable 1014)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text028 : ENU=You cannot consume more than %1 units.;ESP=No puede consumir más de %1 unidades.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text028 : ENU=You cannot consume more than %1 units.;ESP=No puede consumir más de %1 unidades.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text032(Variable 1095)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text032 : ENU=You cannot consume more than %1 base units.;ESP=No puede consumir más de %1 unidades base.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text032 : ENU=You cannot consume more than %1 base units.;ESP=No puede consumir más de %1 unidades base.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text033(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text033 : ENU=The line you are trying to change has the adjusted price.\;ESP=La línea que intenta modificar ha ajustado el precio.\;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text033 : ENU=The line you are trying to change has the adjusted price.\;ESP=La línea que intenta modificar ha ajustado el precio.\;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text034(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text034 : ENU=Do you want to continue?;ESP=¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text034 : ENU=Do you want to continue?;ESP=?Desea continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text035(Variable 1076)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text035 : ENU=Warehouse;ESP=Almacén;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text035 : ENU=Warehouse;ESP=Almacén;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text039(Variable 1081)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text039 : ENU=You cannot return more than %1 units for %2 %3.;ESP=No puede devolver más de %1 unidades para %2 %3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text039 : ENU=You cannot return more than %1 units for %2 %3.;ESP=No puede devolver más de %1 unidades para %2 %3.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text041(Variable 1105)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text041 : ENU=There were no Resource Lines to split.;ESP=No hay líneas de recurso que dividir.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text041 : ENU=There were no Resource Lines to split.;ESP=No hay líneas de recurso que dividir.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text042(Variable 1072)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text042 : ENU=When posting the Applied to Ledger Entry %1 will be opened first;ESP=Al registrar, se abrirá primero Liq. por mov. producto %1;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text042 : ENU=When posting the Applied to Ledger Entry %1 will be opened first;ESP=Al registrar, se abrirá primero Liq. por mov. producto %1;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text043(Variable 1097)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text043 : ENU=You cannot change the value of the %1 field manually if %2 for this line is %3.;ESP=No puede cambiar el valor del campo %1 manualmente si %2 es %3 para esta línea.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text043 : ENU=You cannot change the value of the %1 field manually if %2 for this line is %3.;ESP=No puede cambiar el valor del campo %1 manualmente si %2 es %3 para esta línea.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text044(Variable 1012)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text044 : ENU=Do you want to split the resource line and use it to create resource lines\for the other service items with divided amounts?;ESP=¿Confirma que desea dividir la línea recurso y utilizarla para crear líneas\ recurso para los otros productos servicio con los importes divididos?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text044 : ENU=Do you want to split the resource line and use it to create resource lines\for the other service items with divided amounts?;ESP=?Confirma que desea dividir la línea recurso y utilizarla para crear líneas\ recurso para los otros productos servicio con los importes divididos?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text045(Variable 1099)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text045 : ENU=You cannot delete this service line because one or more service entries exist for this line.;ESP=No se puede eliminar esta línea de servicio porque tiene asociado uno o varios movimientos de servicio.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text045 : ENU=You cannot delete this service line because one or more service entries exist for this line.;ESP=No se puede eliminar esta línea de servicio porque tiene asociado uno o varios movimientos de servicio.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text046(Variable 1067)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text046 : ENU=You cannot change the %1 when the %2 has been filled in.;ESP=No puede cambiar %1 después de introducir datos en %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text046 : ENU=You cannot change the %1 when the %2 has been filled in.;ESP=No puede cambiar %1 después de introducir datos en %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "WhseRequirementMsg(Variable 1104)".

    //var
    //>>>> ORIGINAL VALUE:
    //WhseRequirementMsg : @@@="%1=Document";ENU=%1 is required for this line. The entered information may be disregarded by warehouse activities.;ESP=%1 se requiere para esta línea. La información introducida puede ser ignorada por las actividades de almacén.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //WhseRequirementMsg : @@@="%1=Document";ENU=%1 is required for this line. The entered information may be disregarded by warehouse activities.;ESP=%1 se requiere para esta línea. La información introducida puede ser ignorada por las actividades de almacén.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text051(Variable 1107)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text051 : ENU=You cannot add an item line.;ESP=No puede agregar una línea de producto.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text051 : ENU=You cannot add an item line.;ESP=No puede agregar una línea de producto.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text052(Variable 1108)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text052 : ENU=You cannot change the %1 field because one or more service entries exist for this line.;ESP=No se puede cambiar el campo %1 porque existen uno o más movimientos de servicio para esta línea.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text052 : ENU=You cannot change the %1 field because one or more service entries exist for this line.;ESP=No se puede cambiar el campo %1 porque existen uno o más movimientos de servicio para esta línea.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text053(Variable 1020)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text053 : ENU=You cannot modify the service line because one or more service entries exist for this line.;ESP=No puede modificar la línea de servicio porque existen uno o más movimientos de servicio para esta línea.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text053 : ENU=You cannot modify the service line because one or more service entries exist for this line.;ESP=No puede modificar la línea de servicio porque existen uno o más movimientos de servicio para esta línea.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "LocationChangedMsg(Variable 1055)".

    //var
    //>>>> ORIGINAL VALUE:
    //LocationChangedMsg : @@@="%1 = Item No., %2 = Item serial No., %3 = Location code";ENU=Item %1 with serial number %2 is stored on location %3. The Location Code field on the service line will be updated.;ESP=El producto %1 con el número de serie %2 se almacena en el almacén %3. Se actualizará el campo de código de almacén en la línea de servicio.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LocationChangedMsg : @@@="%1 = Item No., %2 = Item serial No., %3 = Location code";ENU=Item %1 with serial number %2 is stored on location %3. The Location Code field on the service line will be updated.;ESP=El producto %1 con el número de serie %2 se almacena en el almacén %3. Se actualizará el campo de código de almacén en la línea de servicio.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "LineDiscountPctErr(Variable 1022)".

    //var
    //>>>> ORIGINAL VALUE:
    //LineDiscountPctErr : ENU=The value in the Line Discount % field must be between 0 and 100.;ESP=El valor en el campo % Descuento línea debe ser entre 0 y 100.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LineDiscountPctErr : ENU=The value in the Line Discount % field must be between 0 and 100.;ESP=El valor en el campo % Descuento línea debe ser entre 0 y 100.;
    //Variable type has not been exported.
}

