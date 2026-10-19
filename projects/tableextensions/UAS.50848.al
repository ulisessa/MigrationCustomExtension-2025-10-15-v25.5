tableextension 50848 tableextension50848 extends "Warehouse Activity Line"
{
    Caption = 'Warehouse Activity Line';
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Source No.")
        {
            Caption = 'Source No.';
        }
        modify("Source Line No.")
        {
            Caption = 'Source Line No.';
        }
        modify("Source Subline No.")
        {
            Caption = 'Source Subline No.';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Shelf No.")
        {
            Caption = 'Shelf No.';
        }
        modify("Sorting Sequence No.")
        {
            Caption = 'Sorting Sequence No.';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Description 2")
        {
            Caption = 'Description 2';
        }
        modify("Shipping Advice")
        {
            Caption = 'Shipping Advice';
        }
        modify("Destination No.")
        {
            Caption = 'Destination No.';
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
        modify("Serial No.")
        {
            Caption = 'Serial No.';
        }
        modify("Lot No.")
        {
            Caption = 'Lot No.';
        }
        modify("Warranty Date")
        {
            Caption = 'Warranty Date';
        }
        modify("Serial No. Blocked")
        {
            Caption = 'Serial No. Blocked';
        }
        modify("Lot No. Blocked")
        {
            Caption = 'Lot No. Blocked';
        }
        modify("Bin Code")
        {
            Caption = 'Bin Code';
        }
        modify("Zone Code")
        {
            Caption = 'Zone Code';
        }
        modify("Action Type")
        {
            Caption = 'Action Type';
        }
        modify("Whse. Document Type")
        {
            Caption = 'Whse. Document Type';
        }
        modify("Whse. Document No.")
        {
            Caption = 'Whse. Document No.';
        }
        modify("Whse. Document Line No.")
        {
            Caption = 'Whse. Document Line No.';
        }
        modify("Bin Ranking")
        {
            Caption = 'Bin Ranking';
        }
        modify("Special Equipment Code")
        {
            Caption = 'Special Equipment Code';
        }
        modify("Bin Type Code")
        {
            Caption = 'Bin Type Code';
        }
        modify("Breakbulk No.")
        {
            Caption = 'Breakbulk No.';
        }
        modify("Original Breakbulk")
        {
            Caption = 'Original Breakbulk';
        }
        modify(Breakbulk)
        {
            Caption = 'Breakbulk';
        }
        modify("Cross-Dock Information")
        {
            Caption = 'Cross-Dock Information';
            OptionCaption = ' ,Cross-Dock Items,Some Items Cross-Docked';
        }

        //Unsupported feature: Code Modification on "Quantity(Field 20).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        Validate("Qty. Outstanding",(Quantity - "Qty. Handled"));
        "Qty. (Base)" := CalcBaseQty(Quantity);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        Validate("Qty. Outstanding",(Quantity - "Qty. Handled"));
        "Qty. (Base)" := CalcBaseQty(Quantity);

        //++Migración Arbumasa a 2009

        Item.Get("Item No.");
        if (Item."Utiliza Tarifario") and ("Activity Type" in["Activity Type"::"Put-away",
            "Activity Type"::"Invt. Put-away"]) then
        begin

          Validate("Net kilos",FunCalcPesoNeto(Quantity,"Item No.","Qty. per Unit of Measure"));
          Validate("Gross kilos",FunCalcPesoBruto(Quantity,"Item No.","Qty. per Unit of Measure"));

        end;

        //--Migración Arbumasa a 2009
        */
        //end;


        //Unsupported feature: Code Modification on ""Bin Code"(Field 7300).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CheckBinInSourceDoc;

        if "Bin Code" <> '' then
        #4..36
                    AvailableQtyBase :=
                      CreatePick.CalcTotalAvailQtyToPick(
                        "Location Code","Item No.","Variant Code","Lot No.","Serial No.",
                        "Source Type","Source Subtype","Source No.","Source Line No.","Source Subline No.",0,false);
                    AvailableQtyBase += "Qty. Outstanding (Base)";
                    if AvailableQtyBase < 0 then
                      AvailableQtyBase := 0;
        #44..84
            "Bin Type Code" := '';
          end;
        end;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..39
                        "Source Type","Source Subtype","Source No.","Source Line No.","Source Subline No.",0,
                        //++Arbu
                        0,0);
                        //--Arbu
        #41..87
        */
        //end;
        field(50010; "Net kilos"; Decimal)
        {
            Caption = 'Net kilos';
            ToolTip = 'Specifies the value of the Net kilos field.';
            DecimalPlaces = 0 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                Validate("Net kilos Outstanding", ("Net kilos" - "Net kilos Handled"));
                "Net kilos (Base)" := CalcBaseKNQty("Net kilos");
            end;
        }
        field(50011; "Gross kilos"; Decimal)
        {
            Caption = 'Gross kilos';
            ToolTip = 'Specifies the value of the Gross kilos field.';
            DecimalPlaces = 0 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                Validate("Gross kilos Outstanding", ("Gross kilos" - "Gross kilos Handled"));
                "Gross kilos (Base)" := CalcBaseKBQty("Gross kilos");
            end;
        }
        field(50012; "Net kilos (Base)"; Decimal)
        {
            Caption = 'Net kilos (Base)';
            ToolTip = 'Specifies the value of the Net kilos (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                TestField("Qty. per Unit of Measure", 1);
                Validate("Net kilos", "Net kilos (Base)");
            end;
        }
        field(50013; "Gross kilos (Base)"; Decimal)
        {
            Caption = 'Gross kilos (Base)';
            ToolTip = 'Specifies the value of the Gross kilos (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                TestField("Qty. per Unit of Measure", 1);
                Validate("Gross kilos", "Gross kilos (Base)");
            end;
        }
        field(50014; "Net kilos Outstanding"; Decimal)
        {
            Caption = 'Net kilos Outstanding';
            ToolTip = 'Specifies the value of the Net kilos Outstanding field.';
            DecimalPlaces = 0 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                "Net kilos Outstanding (Base)" := CalcBaseKNQty("Net kilos Outstanding");
                Validate("Net kilos to Handle", "Net kilos Outstanding");
            end;
        }
        field(50015; "Gross kilos Outstanding"; Decimal)
        {
            Caption = 'Gross kilos Outstanding';
            ToolTip = 'Specifies the value of the Gross kilos Outstanding field.';
            DecimalPlaces = 0 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                "Gross kilos Outstanding (Base)" := CalcBaseKBQty("Gross kilos Outstanding");
                Validate("Gross kilos to Handle", "Gross kilos Outstanding");
            end;
        }
        field(50016; "Net kilos Outstanding (Base)"; Decimal)
        {
            Caption = 'Net kilos Outstanding (Base)';
            ToolTip = 'Specifies the value of the Net kilos Outstanding (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                TestField("Qty. per Unit of Measure", 1);
                Validate("Net kilos Outstanding", "Net kilos Outstanding (Base)");
            end;
        }
        field(50017; "Gross kilos Outstanding (Base)"; Decimal)
        {
            Caption = 'Gross kilos Outstanding (Base)';
            ToolTip = 'Specifies the value of the Gross kilos Outstanding (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                TestField("Qty. per Unit of Measure", 1);
                Validate("Gross kilos Outstanding", "Gross kilos Outstanding (Base)");
            end;
        }
        field(50018; "Net kilos to Handle"; Decimal)
        {
            Caption = 'Net kilos to Handle';
            ToolTip = 'Specifies the value of the Net kilos to Handle field.';
            DecimalPlaces = 0 : 5;
            MinValue = 0;

        }
        field(50019; "Gross kilos to Handle"; Decimal)
        {
            Caption = 'Gross kilos to Handle';
            ToolTip = 'Specifies the value of the Gross kilos to Handle field.';
            DecimalPlaces = 0 : 5;
            MinValue = 0;

        }
        field(50020; "Net kilos to Handle (Base)"; Decimal)
        {
            Caption = 'Net kilos to Handle (Base)';
            ToolTip = 'Specifies the value of the Net kilos to Handle (Base) field.';
            DecimalPlaces = 0 : 5;

        }
        field(50021; "Gross kilos to Handle (Base)"; Decimal)
        {
            Caption = 'Gross kilos to Handle (Base)';
            ToolTip = 'Specifies the value of the Gross kilos to Handle (Base) field.';
            DecimalPlaces = 0 : 5;

        }
        field(50022; "Net kilos Handled"; Decimal)
        {
            Caption = 'Net kilos Handled';
            ToolTip = 'Specifies the value of the Net kilos Handled field.';
            DecimalPlaces = 0 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                "Net kilos Handled (Base)" := FunCalcPesoNeto("Qty. Handled", "Item No.", "Qty. per Unit of Measure");
            end;
        }
        field(50023; "Gross kilos Handled"; Decimal)
        {
            Caption = 'Gross kilos Handled';
            ToolTip = 'Specifies the value of the Gross kilos Handled field.';
            DecimalPlaces = 0 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                "Gross kilos Handled (Base)" := FunCalcPesoBruto("Qty. Handled", "Item No.", "Qty. per Unit of Measure");
            end;
        }
        field(50024; "Net kilos Handled (Base)"; Decimal)
        {
            Caption = 'Net kilos Handled (Base)';
            ToolTip = 'Specifies the value of the Net kilos Handled (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50025; "Gross kilos Handled (Base)"; Decimal)
        {
            Caption = 'Gross kilos Handled (Base)';
            ToolTip = 'Specifies the value of the Gross kilos Handled (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
    }


    //Unsupported feature: Code Modification on "CheckIncreaseCapacity(PROCEDURE 6)".

    //procedure CheckIncreaseCapacity();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if DeductLineCapacity then begin
      DeductCubage := xRec.Cubage;
      DeductWeight := xRec.Weight;
    end;

    if BinContent.Get("Location Code","Bin Code","Item No.","Variant Code","Unit of Measure Code") then
      BinContent.CheckIncreaseBinContent(
        "Qty. to Handle (Base)","Qty. Outstanding (Base)",
        DeductCubage,DeductWeight,Cubage,Weight,false,false)
    else
      Bin.CheckIncreaseBin(
        "Bin Code","Item No.","Qty. to Handle",
        DeductCubage,DeductWeight,Cubage,Weight,false,false);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..8
        DeductCubage,DeductWeight,Cubage,Weight,false,false,
        //++Arbu
        "Net kilos to Handle (Base)","Net kilos Outstanding (Base)",
        "Gross kilos to Handle (Base)","Gross kilos Outstanding (Base)")
        //--Arbu
    #10..13
    */
    //end;


    //Unsupported feature: Code Modification on "LookUpTrackingSummary(PROCEDURE 50)".

    //procedure LookUpTrackingSummary();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    with WhseActivLine do begin
      InitTrackingSpecFromWhseActivLine(TempTrackingSpecification,WhseActivLine);
      TempTrackingSpecification."Quantity (Base)" := "Qty. Outstanding (Base)";
    #4..12
        Clear(ItemTrackingDataCollection);
      OnLookUpTrackingSummaryOnAfterCheckDataSet(WhseActivLine,Item,TempTrackingSpecification);
      ItemTrackingDataCollection.SetCurrentBinAndItemTrkgCode("Bin Code",ItemTrackingCode);
      ItemTrackingDataCollection.AssistEditTrackingNo(
        TempTrackingSpecification,SearchForSupply,SignFactor,TrackingType,"Qty. Outstanding");

      OnLookUpTrackingSummaryOnAfterAssistEditTrackingNo(WhseActivLine,TempTrackingSpecification,TrackingType);

      case TrackingType of
    #22..35
    end;

    OnAfterLookupTrackingSummary(WhseActivLine,TempTrackingSpecification,TrackingType);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..15
      {ItemTrackingDataCollection.AssistEditTrackingNo(
        TempTrackingSpecification,SearchForSupply,SignFactor,TrackingType,"Qty. Outstanding",
        //++Arbu
        "Net kilos Outstanding","Gross kilos Outstanding");}
        //--Arbu
    #19..38
    */
    //end;

    //Unsupported feature: Variable Insertion (Variable: ----ARBUMASA---) (VariableCollection) on "CheckReservedItemTrkg(PROCEDURE 7)".


    //Unsupported feature: Variable Insertion (Variable: LineReservedQtyKN) (VariableCollection) on "CheckReservedItemTrkg(PROCEDURE 7)".


    //Unsupported feature: Variable Insertion (Variable: AvailQtyFromOtherResvLinesKN) (VariableCollection) on "CheckReservedItemTrkg(PROCEDURE 7)".


    //Unsupported feature: Variable Insertion (Variable: LineReservedQtyKB) (VariableCollection) on "CheckReservedItemTrkg(PROCEDURE 7)".


    //Unsupported feature: Variable Insertion (Variable: AvailQtyFromOtherResvLinesKB) (VariableCollection) on "CheckReservedItemTrkg(PROCEDURE 7)".



    //Unsupported feature: Code Modification on "CheckReservedItemTrkg(PROCEDURE 7)".

    //procedure CheckReservedItemTrkg();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IsHandled := ("Activity Type" = "Activity Type"::"Invt. Pick") and "Assemble to Order";
    OnBeforeCheckReservedItemTrkg(Rec,CheckType,ItemTrkgCode,IsHandled);
    if IsHandled then
    #4..30
          Item.SetRange("Variant Filter","Variant Code");
          Item.SetRange("Lot No. Filter",ItemTrkgCode);
          Item.CalcFields(Inventory,"Reserved Qty. on Inventory");
          LineReservedQty :=
            WhseAvailMgt.CalcLineReservedQtyOnInvt(
              "Source Type","Source Subtype","Source No.","Source Line No.","Source Subline No.",true,'',
              ItemTrkgCode,TempWhseActivLine);
          ReservEntry.SetCurrentKey("Item No.","Variant Code","Location Code","Reservation Status");
          ReservEntry.SetRange("Item No.","Item No.");
          ReservEntry.SetRange("Variant Code","Variant Code");
    #41..65
            Error(Text017,FieldCaption("Lot No."),ItemTrkgCode);
        end;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..33
          //++Arbu
          //LineReservedQty :=
            WhseAvailMgt.CalcLineReservedQtyonInvt(
              "Source Type","Source Subtype","Source No.","Source Line No.","Source Subline No.",true,'',
              ItemTrkgCode,TempWhseActivLine,LineReservedQty,LineReservedQtyKN,LineReservedQtyKB);
          //--Arbu);
    #38..68
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateReservation(PROCEDURE 90)".

    //procedure UpdateReservation();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    with TempWhseActivLine2 do begin
      if ("Action Type" <> "Action Type"::Take) and ("Breakbulk No." = 0) and
         ("Whse. Document Type" = "Whse. Document Type"::Shipment)
    #4..11
        TempTrackingSpecification.Insert;
      end;
      ItemTrackingMgt.SetPick("Activity Type" = "Activity Type"::Pick);
      ItemTrackingMgt.SynchronizeWhseItemTracking(TempTrackingSpecification,'',Deletion);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..14
      //ItemTrackingMgt.SynchronizeWhseItemTracking(TempTrackingSpecification,'',Deletion);
    end;
    */
    //end;


    //Unsupported feature: Code Modification on "FindLotNoBySerialNo(PROCEDURE 32)".

    //procedure FindLotNoBySerialNo();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    InitTrackingSpecFromWhseActivLine(TempTrackingSpecification,Rec);
    CheckGlobalEntrySummary :=
      ("Activity Type" <> "Activity Type"::"Put-away") and
      (not ("Source Document" in
            ["Source Document"::"Purchase Order","Source Document"::"Prod. Output","Source Document"::"Assembly Order"]));
    if CheckGlobalEntrySummary then
      Validate("Lot No.",ItemTrackingDataCollection.FindLotNoBySN(TempTrackingSpecification))
    else begin
      if not ItemTrackingDataCollection.FindLotNoBySNSilent(LotNo,TempTrackingSpecification) then
        LotNo := TempTrackingSpecification."Lot No.";
      Validate("Lot No.",LotNo);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..8
      {IF NOT ItemTrackingDataCollection.FindLotNoBySNSilent(LotNo,TempTrackingSpecification) THEN
        LotNo := TempTrackingSpecification."Lot No.";
      }Validate("Lot No.",LotNo);
    end;
    */
    //end;

    procedure "----ARBUMASA----"()
    begin
    end;

    local procedure CalcBaseKNQty(Qty: Decimal): Decimal
    begin
        TestField("Qty. per Unit of Measure");
        exit(Round(Qty * "Qty. per Unit of Measure", 0.00001));
    end;

    local procedure CalcBaseKBQty(Qty: Decimal): Decimal
    begin
        TestField("Qty. per Unit of Measure");
        exit(Round(Qty * "Qty. per Unit of Measure", 0.00001));
    end;

    procedure FunCalcPesoNeto(VarCantidad: Decimal; VarProducto: Code[20]; VarQ: Decimal): Decimal
    var
        PunProducto: Record Item;
    begin
        PunProducto.Reset;
        PunProducto.Get(VarProducto);
        exit(VarCantidad * PunProducto."Net Weight" * VarQ);
    end;

    procedure FunCalcPesoBruto(VarCantidad: Decimal; VarProducto: Code[20]; VarQ: Decimal): Decimal
    var
        PunProducto: Record Item;
    begin
        PunProducto.Reset;
        PunProducto.Get(VarProducto);
        exit(VarCantidad * PunProducto."Gross Weight" * VarQ);
    end;


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=You cannot handle more than the outstanding %1 units.;ESP=No puede manipular más de %1 unidades pendientes.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=You cannot handle more than the outstanding %1 units.;ESP=No puede manipular más de %1 unidades pendientes.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text004(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text004 : ENU=If you delete %1 %2, %3 %4, %5 %6\the quantity to %7 will be imbalanced.\Do you still want to delete the %8?;ESP=Si elimina %1 %2, %3 %4, %5 %6\la cantidad a %7 no cuadrará.\¿Desea eliminar el %8?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text004 : ENU=If you delete %1 %2, %3 %4, %5 %6\the quantity to %7 will be imbalanced.\Do you still want to delete the %8?;ESP=Si elimina %1 %2, %3 %4, %5 %6\la cantidad a %7 no cuadrar?.\?Desea eliminar el %8?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text005(Variable 1045)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text005 : ENU=You must not change the %1 in breakbulk lines.;ESP=No debe cambiar el %1 en líns. división bulto.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text005 : ENU=You must not change the %1 in breakbulk lines.;ESP=No debe cambiar el %1 en líns. división bulto.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text007(Variable 1007)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text007 : ENU=You must not split breakbulk lines.;ESP=No debe dividir las líns. división bulto.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text007 : ENU=You must not split breakbulk lines.;ESP=No debe dividir las líns. división bulto.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text008(Variable 1022)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text008 : ENU=Quantity available to pick is not enough to fill in all the lines.;ESP=Cant. disp. para picking no es suficiente para cubrir todas las líneas.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text008 : ENU=Quantity available to pick is not enough to fill in all the lines.;ESP=Cant. disp. para picking no es suficiente para cubrir todas las líneas.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text009(Variable 1023)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text009 : ENU=If you delete the %1\you must recreate related Warehouse Worksheet Lines manually.\\Do you want to delete the %1?;ESP=Si elimina el %1\debe recrear las líneas de hoja de almacén relacionadas manualmente.\\¿Desea eliminar el %1?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text009 : ENU=If you delete the %1\you must recreate related Warehouse Worksheet Lines manually.\\Do you want to delete the %1?;ESP=Si elimina el %1\debe recrear las líneas de hoja de almacén relacionadas manualmente.\\?Desea eliminar el %1?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text012(Variable 1028)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text012 : ENU=The %1 %2 exceeds the quantity available to pick %3 of the %4.\Do you still want to enter this %5?;ESP=El %1 %2 excede la cant. disponible picking %3 del %4.\¿Desea insertar este %5?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text012 : ENU=The %1 %2 exceeds the quantity available to pick %3 of the %4.\Do you still want to enter this %5?;ESP=El %1 %2 excede la cant. disponible picking %3 del %4.\?Desea insertar este %5?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text013(Variable 1029)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text013 : ENU=All related Warehouse Activity Lines are deleted.;ESP=Se han borrado todas las líns. actividad almacén relacionadas.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text013 : ENU=All related Warehouse Activity Lines are deleted.;ESP=Se han borrado todas las líns. actividad almacén relacionadas.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text015(Variable 1031)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text015 : ENU=The total available quantity has already been applied.;ESP=Ya liquidó el total de la cantidad disponible.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text015 : ENU=The total available quantity has already been applied.;ESP=Ya liquid? el total de la cantidad disponible.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text017(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text017 : ENU=%1 %2 is not available in inventory, it has already been reserved for another document, or the quantity available is lower than the quantity to handle specified on the line.;ESP=%1 %2 no está disponible en el inventario, ya fue reservado para otro documento o la cantidad disponible es menor que la cantidad a manipular especificada en la línea.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text017 : ENU=%1 %2 is not available in inventory, it has already been reserved for another document, or the quantity available is lower than the quantity to handle specified on the line.;ESP=%1 %2 no está disponible en el inventario, ya fue reservado para otro documento o la cantidad disponible es menor que la cantidad a manipular especificada en la línea.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text019(Variable 1011)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text019 : ENU=The %1 bin code must be different from the %2 bin code on location %3.;ESP=El código de ubicación %1 debe ser diferente del código de ubicación %2 del almacén %3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text019 : ENU=The %1 bin code must be different from the %2 bin code on location %3.;ESP=El código de ubicación %1 debe ser diferente del código de ubicación %2 del almacén %3.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text020(Variable 1012)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text020 : ENU=The %1 bin code must not be the Receipt Bin Code or the Shipment Bin Code that are set up on location %2.;ESP=El código de ubicación %1 no debe ser el Cód. ubicación recepción ni el Cód. ubicación envío establecidos en el almacén %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text020 : ENU=The %1 bin code must not be the Receipt Bin Code or the Shipment Bin Code that are set up on location %2.;ESP=El código de ubicación %1 no debe ser el Cód. ubicación recepción ni el Cód. ubicación envío establecidos en el almacén %2.;
    //Variable type has not been exported.
}

