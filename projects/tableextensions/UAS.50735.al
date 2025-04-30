tableextension 50735 tableextension50735 extends "Prod. Order Component"
{
    Caption = 'Prod. Order Component';
    fields
    {
        modify("Prod. Order No.")
        {
            Caption = 'Prod. Order No.';
        }
        modify("Prod. Order Line No.")
        {
            Caption = 'Prod. Order Line No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify(Position)
        {
            Caption = 'Position';
        }
        modify("Position 2")
        {
            Caption = 'Position 2';
        }
        modify("Position 3")
        {
            Caption = 'Position 3';
        }
        modify("Routing Link Code")
        {
            Caption = 'Routing Link Code';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Flushing Method")
        {
            Caption = 'Flushing Method';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        modify("Shortcut Dimension 2 Code")
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        modify("Bin Code")
        {
            Caption = 'Bin Code';
        }
        modify("Supplied-by Line No.")
        {
            Caption = 'Supplied-by Line No.';
        }
        modify("Planning Level Code")
        {
            Caption = 'Planning Level Code';
        }
        modify("Item Low-Level Code")
        {
            Caption = 'Item Low-Level Code';
        }
        modify("Calculation Formula")
        {
            Caption = 'Calculation Formula';
        }
        modify("Substitution Available")
        {
            Caption = 'Substitution Available';
        }
        modify("Original Item No.")
        {
            Caption = 'Original Item No.';
        }
        modify("Original Variant Code")
        {
            Caption = 'Original Variant Code';
        }

        //Unsupported feature: Code Modification on ""Item No."(Field 11).OnValidate".

        //trigger "(Field 11)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if xRec.Find then begin
          CalcFields("Act. Consumption (Qty)");
          TestField("Act. Consumption (Qty)",0);
        #4..25
        Validate("Unit of Measure Code",Item."Base Unit of Measure");
        GetUpdateFromSKU;
        CreateDim(DATABASE::Item,"Item No.");
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..28
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++Arbu
        "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
        "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
        "Shortcut Dimension 7 Code"
        //--Arbu
        );
        */
        //end;


        //Unsupported feature: Code Modification on ""Expected Quantity"(Field 25).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if Item.Get("Item No.") then
          if Item."Rounding Precision" > 0 then begin
            "Expected Quantity" := UOMMgt.RoundToItemRndPrecision("Expected Quantity",Item."Rounding Precision");
            OnAfterRoundExpectedQuantity(Rec);
          end;

        #7..25
            "Expected Quantity" *
            (("Direct Unit Cost" * "Indirect Cost %" / 100) + "Overhead Rate"));
        "Direct Cost Amount" := Round("Expected Quantity" * "Direct Unit Cost");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        if Item.Get("Item No.") then
          if Item."Rounding Precision" > 0 then begin
            //"Expected Quantity" := UOMMgt.RoundToItemRndPrecision("Expected Quantity",Item."Rounding Precision");
        #4..28
        */
        //end;


        //Unsupported feature: Code Modification on ""Due Date"(Field 52).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        WhseValidateSourceLine.ProdComponentVerifyChange(Rec,xRec);
        if not Blocked then begin
          if CurrFieldNo <> 0 then
            CheckDateConflict.ProdOrderComponentCheck(Rec,true,true)
          else
            if CheckDateConflict.ProdOrderComponentCheck(Rec,not WarningRaised,false) then
              WarningRaised := true;
        end;
        UpdateDatetime;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        WhseValidateSourceLine.ProdComponentVerifyChange(Rec,xRec);
        if not Blocked then begin
          {IF CurrFieldNo <> 0 THEN
            CheckDateConflict.ProdOrderComponentCheck(Rec,TRUE,TRUE)
          ELSE
            IF CheckDateConflict.ProdOrderComponentCheck(Rec,NOT WarningRaised,FALSE) THEN
              WarningRaised := TRUE;
        }end;
        UpdateDatetime;
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
        //DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */
        //end;
        field(50000; "Global Dimension 3 Code"; Code[10])
        {
            CaptionClass = '1,1,3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            CaptionClass = '1,1,4';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            CaptionClass = '1,1,5';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));
        }
        field(50003; "Global Dimension 6 Code"; Code[10])
        {
            CaptionClass = '1,1,6';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));
        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,1,7';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));
        }
        field(50010; "Net kilos"; Decimal)
        {
            Caption = 'Net kilos';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50011; "Gross kilos"; Decimal)
        {
            Caption = 'Gross kilos';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50012; "Expected net kilos"; Decimal)
        {
            Caption = 'Expected net kilos';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50013; "Expected gross kilos"; Decimal)
        {
            Caption = 'Expected gross kilos ';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50014; "Remaining net kilos"; Decimal)
        {
            Caption = 'Remaining net kilos';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50015; "Remaining gross kilos"; Decimal)
        {
            Caption = 'Remaining gross kilos ';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50016; "Act. Consumption (kn)"; Decimal)
        {
            CalcFormula = - Sum("Item Ledger Entry"."Net kilos" WHERE("Entry Type" = CONST(Consumption),
                                                                      "Order Type" = CONST(Production),
                                                                      "Order No." = FIELD("Prod. Order No."),
                                                                      "Order Line No." = FIELD("Prod. Order Line No."),
                                                                      "Prod. Order Comp. Line No." = FIELD("Line No.")));
            Caption = 'Act. Consumption (kn)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50017; "Act. Consumption (kb)"; Decimal)
        {
            CalcFormula = - Sum("Item Ledger Entry"."Gross kilos" WHERE("Entry Type" = CONST(Consumption),
                                                                        "Order Type" = CONST(Production),
                                                                        "Order No." = FIELD("Prod. Order No."),
                                                                        "Order Line No." = FIELD("Prod. Order Line No."),
                                                                        "Prod. Order Comp. Line No." = FIELD("Line No.")));
            Caption = 'Act. Consumption (kb)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50018; "Remaining nk (Base)"; Decimal)
        {
            Caption = 'Remaining nk (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50019; "Remaining gk (Base)"; Decimal)
        {
            Caption = 'Remaining gk (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50020; "Net kilos (Base)"; Decimal)
        {
            Caption = 'Net kilos (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50021; "Gross kilos (Base)"; Decimal)
        {
            Caption = 'Gross kilos (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50022; "Reserved nk (Base)"; Decimal)
        {
            CalcFormula = - Sum("Reservation Entry"."Net kilos (Base)" WHERE("Source ID" = FIELD("Prod. Order No."),
                                                                             "Source Ref. No." = FIELD("Line No."),
                                                                             "Source Type" = CONST(5407),
                                                                             "Source Batch Name" = CONST(''),
                                                                             "Source Prod. Order Line" = FIELD("Prod. Order Line No."),
                                                                             "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved nk (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50023; "Reserved gk (Base)"; Decimal)
        {
            CalcFormula = - Sum("Reservation Entry"."Gross kilos (Base)" WHERE("Source ID" = FIELD("Prod. Order No."),
                                                                               "Source Ref. No." = FIELD("Line No."),
                                                                               "Source Type" = CONST(5407),
                                                                               "Source Batch Name" = CONST(''),
                                                                               "Source Prod. Order Line" = FIELD("Prod. Order Line No."),
                                                                               "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved gk (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50024; "Reserved nk"; Decimal)
        {
            CalcFormula = - Sum("Reservation Entry"."Net kilos" WHERE("Source ID" = FIELD("Prod. Order No."),
                                                                      "Source Ref. No." = FIELD("Line No."),
                                                                      "Source Type" = CONST(5407),
                                                                      "Source Batch Name" = CONST(''),
                                                                      "Source Prod. Order Line" = FIELD("Prod. Order Line No."),
                                                                      "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved nk';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50025; "Reserved gk "; Decimal)
        {
            CalcFormula = - Sum("Reservation Entry"."Gross kilos" WHERE("Source ID" = FIELD("Prod. Order No."),
                                                                        "Source Ref. No." = FIELD("Line No."),
                                                                        "Source Type" = CONST(5407),
                                                                        "Source Batch Name" = CONST(''),
                                                                        "Source Prod. Order Line" = FIELD("Prod. Order Line No."),
                                                                        "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved gk';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50026; "Expected nk (Base)"; Decimal)
        {
            Caption = 'Expected nk (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50027; "Expected gk (Base)"; Decimal)
        {
            Caption = 'Expected gk (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50028; "Pick net kilos"; Decimal)
        {
            CalcFormula = Sum("Warehouse Activity Line"."Net kilos Outstanding" WHERE("Activity Type" = FILTER(<> "Put-away"),
                                                                                       "Source Type" = CONST(5407),
                                                                                       "Source No." = FIELD("Prod. Order No."),
                                                                                       "Source Line No." = FIELD("Prod. Order Line No."),
                                                                                       "Source Subline No." = FIELD("Line No."),
                                                                                       "Unit of Measure Code" = FIELD("Unit of Measure Code"),
                                                                                       "Action Type" = FILTER(" " | Place),
                                                                                       "Original Breakbulk" = CONST(false),
                                                                                       "Breakbulk No." = CONST(0)));
            Caption = 'Pick net kilos';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50029; "Pick gross kilos"; Decimal)
        {
            CalcFormula = Sum("Warehouse Activity Line"."Gross kilos Outstanding" WHERE("Activity Type" = FILTER(<> "Put-away"),
                                                                                         "Source Type" = CONST(5407),
                                                                                         "Source No." = FIELD("Prod. Order No."),
                                                                                         "Source Line No." = FIELD("Prod. Order Line No."),
                                                                                         "Source Subline No." = FIELD("Line No."),
                                                                                         "Unit of Measure Code" = FIELD("Unit of Measure Code"),
                                                                                         "Action Type" = FILTER(" " | Place),
                                                                                         "Original Breakbulk" = CONST(false),
                                                                                         "Breakbulk No." = CONST(0)));
            Caption = 'Pick gross kilos';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50030; "Net kilos picked"; Decimal)
        {
            Caption = 'Net kilos picked';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50031; "Gross kilos picked"; Decimal)
        {
            Caption = 'Gross kilos picked';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50032; "Net kilos picked (Base)"; Decimal)
        {
            Caption = 'Net kilos picked (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50033; "Gross kilos picked (Base)"; Decimal)
        {
            Caption = 'Gross kilos picked (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50034; "Pick nk (Base)"; Decimal)
        {
            CalcFormula = Sum("Warehouse Activity Line"."Net kilos Outstanding (Base)" WHERE("Activity Type" = FILTER(<> "Put-away"),
                                                                                              "Source Type" = CONST(5407),
                                                                                              "Source No." = FIELD("Prod. Order No."),
                                                                                              "Source Line No." = FIELD("Prod. Order Line No."),
                                                                                              "Source Subline No." = FIELD("Line No."),
                                                                                              "Action Type" = FILTER(" " | Place),
                                                                                              "Original Breakbulk" = CONST(false),
                                                                                              "Breakbulk No." = CONST(0)));
            Caption = 'Pick nk (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50035; "Pick gk (Base)"; Decimal)
        {
            CalcFormula = Sum("Warehouse Activity Line"."Gross kilos Outstanding (Base)" WHERE("Activity Type" = FILTER(<> "Put-away"),
                                                                                                "Source Type" = CONST(5407),
                                                                                                "Source No." = FIELD("Prod. Order No."),
                                                                                                "Source Line No." = FIELD("Prod. Order Line No."),
                                                                                                "Source Subline No." = FIELD("Line No."),
                                                                                                "Action Type" = FILTER(" " | Place),
                                                                                                "Original Breakbulk" = CONST(false),
                                                                                                "Breakbulk No." = CONST(0)));
            Caption = 'Pick gk (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50503; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(50504; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(50505; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }
        field(50506; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }
        field(50507; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Shortcut Dimension 7 Code");
            end;
        }
    }

    //Unsupported feature: Variable Insertion (Variable: ---ARBUMASA---) (VariableCollection) on "GetNeededQty(PROCEDURE 3)".


    //Unsupported feature: Variable Insertion (Variable: CompQtyBaseKN) (VariableCollection) on "GetNeededQty(PROCEDURE 3)".


    //Unsupported feature: Variable Insertion (Variable: CompQtyBaseKB) (VariableCollection) on "GetNeededQty(PROCEDURE 3)".


    //Unsupported feature: Variable Insertion (Variable: OutputQtyBaseKN) (VariableCollection) on "GetNeededQty(PROCEDURE 3)".


    //Unsupported feature: Variable Insertion (Variable: OutputQtyBaseKB) (VariableCollection) on "GetNeededQty(PROCEDURE 3)".



    //Unsupported feature: Code Modification on "GetNeededQty(PROCEDURE 3)".

    //procedure GetNeededQty();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    Item.Get("Item No.");
    if Item."Rounding Precision" = 0 then
      Item."Rounding Precision" := UOMMgt.QtyRndPrecision;
    #4..29
            OnGetNeededQtyOnBeforeAddOutputQtyBase(CapLedgEntry,OutputQtyBase,IsHandled);
            if not IsHandled then
              OutputQtyBase := OutputQtyBase + CapLedgEntry."Output Quantity" + CapLedgEntry."Scrap Quantity";
          until CapLedgEntry.Next = 0;
      end;

      CompQtyBase := CostCalcMgt.CalcActNeededQtyBase(ProdOrderLine,Rec,OutputQtyBase);
      OnGetNeededQtyAfterCalcCompQtyBase(Rec,CompQtyBase);

      if IncludePreviousPosting then begin
        if Status in [Status::Released,Status::Finished] then
          CalcFields("Act. Consumption (Qty)");
        OnGetNeededQtyAfterCalcActConsumptionQty(Rec);
        exit(
          UOMMgt.RoundToItemRndPrecision(
            (CompQtyBase - "Act. Consumption (Qty)") / "Qty. per Unit of Measure",
            Item."Rounding Precision"));
      end;
      exit(UOMMgt.RoundToItemRndPrecision(CompQtyBase / "Qty. per Unit of Measure",Item."Rounding Precision"));
    end;
    OnGetNeededQtyOnAfterCalcBasedOn(Rec);
    exit(Round("Remaining Quantity",Item."Rounding Precision"));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..32
            //++Arbu
            OutputQtyBaseKN := OutputQtyBaseKN + CapLedgEntry."Output net kilos" + CapLedgEntry."Scrap net kilos";
            OutputQtyBaseKB := OutputQtyBaseKB + CapLedgEntry."Output gross kilos" + CapLedgEntry."Scrap gross kilos";
            //--Arbu
    #33..35
      //++Arbu
      //CompQtyBase := CostCalcMgt.CalcActNeededQtyBase(ProdOrderLine,Rec,OutputQtyBase);
      CostCalcMgt.CalcActNeededQtyBase(ProdOrderLine,Rec,OutputQtyBase,CompQtyBase,
                                       CompQtyBaseKN,CompQtyBaseKB);

      //--Arbu
    #37..42
    {    EXIT(
    #44..46
     } end;
      //EXIT(UOMMgt.RoundToItemRndPrecision(CompQtyBase / "Qty. per Unit of Measure",Item."Rounding Precision"));
    #49..51
    */
    //end;


    //Unsupported feature: Code Modification on "CreateDim(PROCEDURE 5)".

    //procedure CreateDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TableID[1] := Type1;
    No[1] := No1;
    OnAfterCreateDimTableIDs(Rec,CurrFieldNo,TableID,No);
    #4..7
    "Dimension Set ID" :=
      DimMgt.GetRecDefaultDimID(
        Rec,CurrFieldNo,TableID,No,'',
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",ProdOrderLine."Dimension Set ID",DATABASE::Item);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..10
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
      //++Arbu
      "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
      "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
      "Shortcut Dimension 7 Code",
      //--Arbu
      ProdOrderLine."Dimension Set ID",DATABASE::Item);
    */
    //end;

    //Unsupported feature: Variable Insertion (Variable: decQty) (VariableCollection) on "AutoReserve(PROCEDURE 2)".



    //Unsupported feature: Code Modification on "AutoReserve(PROCEDURE 2)".

    //procedure AutoReserve();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if Status in [Status::Simulated,Status::Finished] then
      exit;

    #4..9
    if "Remaining Qty. (Base)" <> 0 then begin
      TestField("Due Date");
      ReservMgt.SetProdOrderComponent(Rec);
      ReservMgt.AutoReserve(FullAutoReservation,'',"Due Date","Remaining Quantity","Remaining Qty. (Base)");
      CalcFields("Reserved Quantity","Reserved Qty. (Base)");
      Find;
      if not FullAutoReservation and
    #17..23
    end;

    OnAfterAutoReserve(Item,Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..12
      //++Arbu
      decQty[1] := "Remaining Qty. (Base)";
      decQty[1] := "Remaining nk (Base)";
      decQty[1] := "Remaining gk (Base)";
      ReservMgt.AutoReserve(FullAutoReservation,'',"Due Date",decQty,"Remaining Qty. (Base)");
      //--Arbu
    #14..26
    */
    //end;


    //Unsupported feature: Code Modification on "ShowDimensions(PROCEDURE 69)".

    //procedure ShowDimensions();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Dimension Set ID" :=
      DimMgt.EditDimensionSet2(
        "Dimension Set ID",StrSubstNo('%1 %2 %3',Status,"Prod. Order No.","Prod. Order Line No."),
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++Arbu
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        "Shortcut Dimension 1 Code"
        //--Arbu
        );
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1028)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=A finished production order component cannot be inserted, modified, or deleted.;ESP=No se puede insertar, modificar o eliminar un componente de orden de producción terminado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=A finished production order component cannot be inserted, modified, or deleted.;ESP=No se puede insertar, modificar o eliminar un componente de orden de producción terminado.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1015)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=The changed %1 now points to bin %2. Do you want to update the bin on this line?;ESP=El %1 cambiado ahora señala al almacén %2. ¿Desea actualizar la ubicación en esta línea?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=The changed %1 now points to bin %2. Do you want to update the bin on this line?;ESP=El %1 cambiado ahora se?ala al almacén %2. ?Desea actualizar la ubicación en esta línea?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text99000000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text99000000 : ENU=You cannot delete item %1 in line %2 because at least one item ledger entry is associated with it.;ESP=No puede eliminar el producto %1 de la línea %2 porque tiene al menos un mov. producto asociado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text99000000 : ENU=You cannot delete item %1 in line %2 because at least one item ledger entry is associated with it.;ESP=No puede eliminar el producto %1 de la línea %2 porque tiene al menos un mov. producto asociado.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text99000002(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text99000002 : ENU=You cannot change flushing method to %1 when there is at least one record in table %2 associated with it.;ESP=No puede cambiar el método de baja a %1 si existe por lo menos un registro en la tabla %2 asociado con él.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text99000002 : ENU=You cannot change flushing method to %1 when there is at least one record in table %2 associated with it.;ESP=No puede cambiar el método de baja a %1 si existe por lo menos un registro en la tabla %2 asociado con él.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text99000007(Variable 1029)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text99000007 : ENU=You cannot change flushing method to %1 because a pick has already been created for production order component %2.;ESP=No puede cambiar el método de baja a %1 porque se ha creado ya un picking para el componente orden producción %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text99000007 : ENU=You cannot change flushing method to %1 because a pick has already been created for production order component %2.;ESP=No puede cambiar el método de baja a %1 porque se ha creado ya un picking para el componente orden producción %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text99000008(Variable 1030)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text99000008 : ENU=You cannot change flushing method to %1 because production order component %2 has already been picked.;ESP=No puede cambiar el método de baja a %1 porque ya se ha realizado el picking de del componente orden producción %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text99000008 : ENU=You cannot change flushing method to %1 because production order component %2 has already been picked.;ESP=No puede cambiar el método de baja a %1 porque ya se ha realizado el picking de del componente orden producción %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text99000009(Variable 1013)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text99000009 : ENU=Automatic reservation is not possible.\Do you want to reserve items manually?;ESP=No se puede reservar automáticamente.\¿Desea reservar los productos manualmente?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text99000009 : ENU=Automatic reservation is not possible.\Do you want to reserve items manually?;ESP=No se puede reservar automáticamente.\?Desea reservar los productos manualmente?;
    //Variable type has not been exported.
}

