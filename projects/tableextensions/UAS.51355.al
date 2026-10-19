tableextension 51355 tableextension51355 extends "Planning Component"
{
    fields
    {
        modify("Worksheet Batch Name")
        {
            Caption = 'Worksheet Batch Name';
        }
        modify("Worksheet Line No.")
        {
            Caption = 'Worksheet Line No.';
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
        modify("Ref. Order No.")
        {
            Caption = 'Ref. Order No.';
        }
        modify("Ref. Order Line No.")
        {
            Caption = 'Ref. Order Line No.';
        }
        modify("Calculation Formula")
        {
            Caption = 'Calculation Formula';
        }
        modify(Critical)
        {
            Caption = 'Critical';
        }
        modify("Planning Line Origin")
        {
            Caption = 'Planning Line Origin';
        }

        //Unsupported feature: Code Modification on ""Expected Quantity"(Field 25).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if Item.Get("Item No.") and ("Ref. Order Type" <> "Ref. Order Type"::Assembly) then
          if Item."Rounding Precision" > 0 then
            "Expected Quantity" := UOMMgt.RoundToItemRndPrecision("Expected Quantity",Item."Rounding Precision");
        "Expected Quantity (Base)" := Round("Expected Quantity" * "Qty. per Unit of Measure",UOMMgt.QtyRndPrecision);
        "Net Quantity (Base)" := "Expected Quantity (Base)" - "Original Expected Qty. (Base)";

        #7..11
            "Expected Quantity" *
            (("Direct Unit Cost" * "Indirect Cost %" / 100) + "Overhead Rate" * "Qty. per Unit of Measure"));
        "Direct Cost Amount" := Round("Expected Quantity" * "Direct Unit Cost");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF Item.GET("Item No.") AND ("Ref. Order Type" <> "Ref. Order Type"::Assembly) THEN
          IF Item."Rounding Precision" > 0 THEN
            "Expected Quantity" := UOMMgt.RoundToItemRndPrecision("Expected Quantity",Item."Rounding Precision");
        }
        #4..14
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
            Caption = 'Shortcut Dimension 3 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(50504; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(50505; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(50506; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }
        field(50507; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
    }


    //Unsupported feature: Code Modification on "CreateDim(PROCEDURE 12)".

    //procedure CreateDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TableID[1] := Type1;
    No[1] := No1;
    OnAfterCreateDimTableIDs(Rec,CurrFieldNo,TableID,No);

    "Shortcut Dimension 1 Code" := '';
    "Shortcut Dimension 2 Code" := '';
    GetReqLine;
    DimensionSetIDArr[1] :=
      DimMgt.GetRecDefaultDimID(Rec,CurrFieldNo,TableID,No,'',"Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",0,0);
    DimensionSetIDArr[2] := ReqLine."Dimension Set ID";
    "Dimension Set ID" :=
      DimMgt.GetCombinedDimensionSetID(DimensionSetIDArr,"Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6
    //++Arbu
    "Shortcut Dimension 3 Code" := '';
    "Shortcut Dimension 4 Code" := '';
    "Shortcut Dimension 5 Code" := '';
    "Shortcut Dimension 6 Code" := '';
    "Shortcut Dimension 7 Code" := '';
    //--Arbu
    GetReqLine;
    DimensionSetIDArr[1] :=
      DimMgt.GetRecDefaultDimID(Rec,CurrFieldNo,TableID,No,'',"Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
    //++Arbu
    "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
    "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
    "Shortcut Dimension 7 Code",
    //--Arbu
    0,0);
    DimensionSetIDArr[2] := ReqLine."Dimension Set ID";
    "Dimension Set ID" :=
      DimMgt.GetCombinedDimensionSetID(DimensionSetIDArr,"Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
      //++Arbu
      "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
      "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
      "Shortcut Dimension 7 Code"
      //--Arbu
      );
    */
    //end;


    //Unsupported feature: Code Modification on "ShowDimensions(PROCEDURE 7)".

    //procedure ShowDimensions();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Dimension Set ID" :=
      DimMgt.EditDimensionSet2(
        "Dimension Set ID",
        StrSubstNo(
          '%1 %2 %3',"Worksheet Template Name","Worksheet Batch Name",
          "Worksheet Line No."),
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++Arbu
        "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
        "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
        "Shortcut Dimension 7 Code"
        //--Arbu
        );
    */
    //end;


    //Unsupported feature: Code Modification on "GetRefOrderTypeBin(PROCEDURE 28)".

    //procedure GetRefOrderTypeBin();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    case ReqLine."Ref. Order Type" of
      ReqLine."Ref. Order Type"::"Prod. Order":
        begin
          if "Location Code" = ReqLine."Location Code" then
            if FindFirstRtngLine(PlanningRoutingLine,ReqLine) then
              BinCode := WMSManagement.GetProdCenterBinCode(
                  PlanningRoutingLine.Type,PlanningRoutingLine."No.","Location Code",true,"Flushing Method");
          if BinCode <> '' then
            exit(BinCode);
          BinCode := GetFlushingMethodBin;
        end;
      ReqLine."Ref. Order Type"::Assembly:
        BinCode := Location."To-Assembly Bin Code";
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
    {
                   IF FindFirstRtngLine(PlanningRoutingLine,ReqLine) THEN
              BinCode := WMSManagement.GetProdCenterBinCode(
                  PlanningRoutingLine.Type,PlanningRoutingLine."No.","Location Code",TRUE,"Flushing Method");
                  }
    #8..14
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "LocationCodeMustBeBlankErr(Variable 1010)".

    //var
    //>>>> ORIGINAL VALUE:
    //LocationCodeMustBeBlankErr : ENU=The Location Code field must be blank for items of type Non-Inventory.;ESP=El campo Código de ubicación debe estar en blanco para productos de tipo Fuera de inventario.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LocationCodeMustBeBlankErr : ENU=The Location Code field must be blank for items of type Non-Inventory.;ESP=El campo Código de ubicación debe estar en blanco para productos de tipo Fuera de inventario.;
    //Variable type has not been exported.
}

