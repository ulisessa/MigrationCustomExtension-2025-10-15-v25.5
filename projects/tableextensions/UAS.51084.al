tableextension 51084 tableextension51084 extends "Whse. Worksheet Line"
{
    Caption = 'Whse. Worksheet Line';
    fields
    {
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
        modify("From Zone Code")
        {
            Caption = 'From Zone Code';
        }
        modify("From Bin Code")
        {
            Caption = 'From Bin Code';
        }
        modify("To Bin Code")
        {
            Caption = 'To Bin Code';
        }
        modify("To Zone Code")
        {
            Caption = 'To Zone Code';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("From Unit of Measure Code")
        {
            Caption = 'From Unit of Measure Code';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Description 2")
        {
            Caption = 'Description 2';
        }
        modify("Sorting Sequence No.")
        {
            Caption = 'Sorting Sequence No.';
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
        modify("Shipping Advice")
        {
            Caption = 'Shipping Advice';
        }
        modify("Shipment Date")
        {
            Caption = 'Shipment Date';
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

        //Unsupported feature: Code Modification on ""Qty. to Handle"(Field 21).OnValidate".

        //trigger  to Handle"(Field 21)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "Qty. to Handle" > "Qty. Outstanding" then
          Error(
            Text000,
        #4..26
            GetLocation("Location Code");
            if Location."Bin Mandatory" then begin
              if CurrFieldNo <> FieldNo("Qty. to Handle") then begin
                AvailableQty := CalcAvailableQtyBase;
                if not Location."Always Create Pick Line" then
                  if "Qty. to Handle (Base)" > AvailableQty then begin
                    if ("Shipping Advice" = "Shipping Advice"::Complete) or
                       (AvailableQty < 0)
                    then
                      "Qty. to Handle (Base)" := 0
                    else
                      "Qty. to Handle (Base)" := AvailableQty;
                  end;
              end
            end else begin
              AvailableQty := CalcAvailableQtyBase;
              if "Qty. to Handle (Base)" > AvailableQty then begin
                if ("Shipping Advice" = "Shipping Advice"::Complete) or
                   (AvailableQty < 0)
                then
                  "Qty. to Handle (Base)" := 0
                else
                  "Qty. to Handle (Base)" := AvailableQty;

                if (not HideValidationDialog) and (CurrFieldNo = FieldNo("Qty. to Handle")) then
                  Error(
                    Text004,
                    AvailableQty);
              end;
            end;
          end else
            if WhseWkshTemplate.Type = WhseWkshTemplate.Type::Movement then
              if CurrFieldNo <> FieldNo("Qty. to Handle") then begin
                AvailableQty := CheckAvailQtytoMove;
                if AvailableQty < 0 then
                  "Qty. to Handle (Base)" := 0
                else
                  if "Qty. to Handle (Base)" > AvailableQty then
                    "Qty. to Handle (Base)" := AvailableQty;
              end;

          CheckBin("Location Code","From Bin Code",false);
          CheckBin("Location Code","To Bin Code",true);
        #70..73
          "Qty. to Handle" := "Qty. Outstanding"
        else
          "Qty. to Handle" := Round("Qty. to Handle (Base)" / "Qty. per Unit of Measure",UOMMgt.QtyRndPrecision);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..29
                //++Arbu
                //AvailableQty :=
                CheckAvailableQtyBase(AvailableQty);
                //--Arbu
                if not Location."Always Create Pick Line" then
                  //++Arbu
                  if "Qty. to Handle (Base)" > AvailableQty[1] then begin
                  //--Arbu
                    if ("Shipping Advice" = "Shipping Advice"::Complete) or
                       //++Arbu
                       (AvailableQty[1] < 0)
                       //--Arbu
        #35..37
                      //++Arbu
                      "Qty. to Handle (Base)" := AvailableQty[1];
                      //--Arbu
        #39..41
              //++Arbu
              //AvailableQty :=
              CheckAvailableQtyBase(AvailableQty);
              //AvailableQty +=
              {A revisar  WhseAvailMgt.CalcLineReservedQtyOnInvt(
                  "Source Type","Source Subtype",
                  "Source No.","Source Line No.",
                  "Source Subline No.",
                  TRUE,'','',TempWhseActivLine,AvailableQty);
                  //--Arbu
                  }
              if "Qty. to Handle (Base)" > AvailableQty[1] then begin
                if ("Shipping Advice" = "Shipping Advice"::Complete) or
                   (AvailableQty[1] < 0)
        #46..48
                  //--Arbu"Qty. to Handle (Base)" := AvailableQty;
                  "Qty. to Handle (Base)" := AvailableQty[1];
                //--Arbu
        #50..53
                    //++Arbu
                    AvailableQty[1]);
                    //--Arbu
        #55..59
                //++Arbu
                AvailableQty[1] := CheckAvailQtytoMove;
                if AvailableQty[1] < 0 then
                  "Qty. to Handle (Base)" := 0
                else
                  if "Qty. to Handle (Base)" > AvailableQty[1] then
                    "Qty. to Handle (Base)" := AvailableQty[1];
              end;
                //--Arbu
        #67..76
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
        field(50012; "Net kilos"; Decimal)
        {
            Caption = 'Net kilos (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(50013; "Gross kilos"; Decimal)
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
        }
        field(50027; "Gk actual handled (Base)"; Decimal)
        {
            Caption = 'Gk actual handled (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(50038; "Net kilos handled (Base)"; Decimal)
        {
            Caption = 'Net kilos handled (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(50039; "Gross kilos handled (Base)"; Decimal)
        {
            Caption = 'Gross kilos handled (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(50040; "Net kilos handled"; Decimal)
        {
            Caption = 'Net kilos handled (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(50041; "Gross kilos handled"; Decimal)
        {
            Caption = 'Gross kilos handled (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(50042; "Net kilos Outstanding"; Decimal)
        {
            Caption = 'Qty. Outstanding';
            DecimalPlaces = 0 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                "Qty. Outstanding (Base)" := CalcBaseQty("Qty. Outstanding");
                Validate("Qty. to Handle", "Qty. Outstanding");
            end;
        }
        field(50043; "Gross kilos Outstanding"; Decimal)
        {
            Caption = 'Qty. Outstanding';
            DecimalPlaces = 0 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                "Qty. Outstanding (Base)" := CalcBaseQty("Qty. Outstanding");
                Validate("Qty. to Handle", "Qty. Outstanding");
            end;
        }
        field(50044; "Net kilos Outstanding (Base)"; Decimal)
        {
            Caption = 'Qty. Outstanding (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50045; "Gross kilos Outstanding (Base)"; Decimal)
        {
            Caption = 'Qty. Outstanding (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
    }

    //Unsupported feature: Parameter Insertion (Parameter: TotalReservedAndAssignedBase) (ParameterCollection) on "AssignedQtyOnReservedLines(PROCEDURE 29)".


    //Unsupported feature: Parameter Insertion (Parameter: TotalReservedAndAssignedBaseKN) (ParameterCollection) on "AssignedQtyOnReservedLines(PROCEDURE 29)".


    //Unsupported feature: Parameter Insertion (Parameter: TotalReservedAndAssignedBaseKB) (ParameterCollection) on "AssignedQtyOnReservedLines(PROCEDURE 29)".


    //Unsupported feature: Variable Insertion (Variable: exTotalReservedAndAssignedBase) (VariableCollection) on "AssignedQtyOnReservedLines(PROCEDURE 29)".


    //Unsupported feature: Variable Insertion (Variable: ---ARBUMASA---) (VariableCollection) on "AssignedQtyOnReservedLines(PROCEDURE 29)".


    //Unsupported feature: Variable Insertion (Variable: LineReservedQtyBaseKN) (VariableCollection) on "AssignedQtyOnReservedLines(PROCEDURE 29)".


    //Unsupported feature: Variable Insertion (Variable: LineReservedQtyBaseKB) (VariableCollection) on "AssignedQtyOnReservedLines(PROCEDURE 29)".


    //Unsupported feature: Variable Insertion (Variable: ReservedAndAssignedBaseKN) (VariableCollection) on "AssignedQtyOnReservedLines(PROCEDURE 29)".


    //Unsupported feature: Variable Insertion (Variable: ReservedAndAssignedBaseKB) (VariableCollection) on "AssignedQtyOnReservedLines(PROCEDURE 29)".



    //Unsupported feature: Code Modification on "AssignedQtyOnReservedLines(PROCEDURE 29)".

    //procedure AssignedQtyOnReservedLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    WhseWkshLine.SetCurrentKey(
      "Item No.","Location Code","Worksheet Template Name","Variant Code");
    WhseWkshLine.SetRange("Item No.","Item No.");
    #4..6
    if WhseWkshLine.Find('-') then
      repeat
        if RecordId <> WhseWkshLine.RecordId then begin
          LineReservedQtyBase :=
            Abs(
              WhseAvailMgt.CalcLineReservedQtyOnInvt(
                WhseWkshLine."Source Type",WhseWkshLine."Source Subtype",
                WhseWkshLine."Source No.",WhseWkshLine."Source Line No.",
                WhseWkshLine."Source Subline No.",
                true,'','',TempWhseActivLine));
          if LineReservedQtyBase > 0 then begin
            if LineReservedQtyBase <= WhseWkshLine."Qty. to Handle (Base)" then
              ReservedAndAssignedBase := LineReservedQtyBase
    #20..22
          end;
        end;
      until WhseWkshLine.Next = 0;
    exit(TotalReservedAndAssignedBase);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..9
      //++Arbu
        {LineReservedQtyBase :=

            ABS(
    #12..15
              TRUE,'','',WhseActivLine));
        }
            WhseAvailMgt.CalcLineReservedQtyonInvt(
              WhseWkshLine."Source Type",WhseWkshLine."Source Subtype",
              WhseWkshLine."Source No.",WhseWkshLine."Source Line No.",
              WhseWkshLine."Source Subline No.",
              true,'','',TempWhseActivLine,
              LineReservedQtyBase,LineReservedQtyBaseKN,LineReservedQtyBaseKB);
            LineReservedQtyBase := Abs(LineReservedQtyBase);
          LineReservedQtyBaseKN := Abs(LineReservedQtyBaseKN);
          LineReservedQtyBaseKB := Abs(LineReservedQtyBaseKB);

        if LineReservedQtyBaseKN > 0 then begin
          if LineReservedQtyBaseKN <= WhseWkshLine."Net kilos to handle (Base)" then
            ReservedAndAssignedBaseKN := LineReservedQtyBaseKN
          else
            ReservedAndAssignedBaseKN := WhseWkshLine."Net kilos to handle (Base)";
          TotalReservedAndAssignedBaseKN := TotalReservedAndAssignedBaseKN + ReservedAndAssignedBaseKN;
        end;

        if LineReservedQtyBaseKB > 0 then begin
          if LineReservedQtyBaseKB <= WhseWkshLine."Gross kilos to handle (Base)" then
            ReservedAndAssignedBaseKB := LineReservedQtyBaseKB
          else
            ReservedAndAssignedBaseKB := WhseWkshLine."Gross kilos to handle (Base)";
          TotalReservedAndAssignedBaseKB := TotalReservedAndAssignedBaseKB + ReservedAndAssignedBaseKB;
        end;

      //--Arbu
    #17..25
    //++Arbu
    //EXIT(TotalReservedAndAssignedBase);
    //--Arbu
    */
    //end;

    //Unsupported feature: Parameter Insertion (Parameter: AvailQty) (ParameterCollection) on "CalcAvailableQtyBase(PROCEDURE 1)".


    //Unsupported feature: Parameter Insertion (Parameter: AvailQtyKN) (ParameterCollection) on "CalcAvailableQtyBase(PROCEDURE 1)".


    //Unsupported feature: Parameter Insertion (Parameter: AvailQtyKB) (ParameterCollection) on "CalcAvailableQtyBase(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: ---ARBUMASA---) (VariableCollection) on "CalcAvailableQtyBase(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: QtyAssgndOnWkshBaseKN) (VariableCollection) on "CalcAvailableQtyBase(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: QtyAssgndOnWkshBaseKB) (VariableCollection) on "CalcAvailableQtyBase(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: QtyReservedOnPickShipKN) (VariableCollection) on "CalcAvailableQtyBase(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: QtyReservedOnPickShipKB) (VariableCollection) on "CalcAvailableQtyBase(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: AssignedQtyOnRvdLines) (VariableCollection) on "CalcAvailableQtyBase(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: AssignedQtyOnRvdLinesKN) (VariableCollection) on "CalcAvailableQtyBase(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: AssignedQtyOnRvdLinesKB) (VariableCollection) on "CalcAvailableQtyBase(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: QtyReservedForCurrLineKN) (VariableCollection) on "CalcAvailableQtyBase(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: QtyReservedForCurrLineKB) (VariableCollection) on "CalcAvailableQtyBase(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: QtyOnDedicatedBinsKN) (VariableCollection) on "CalcAvailableQtyBase(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: QtyOnDedicatedBinsKB) (VariableCollection) on "CalcAvailableQtyBase(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: AvailQtyBaseKN) (VariableCollection) on "CalcAvailableQtyBase(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: AvailQtyBaseKB) (VariableCollection) on "CalcAvailableQtyBase(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: decQty) (VariableCollection) on "CalcAvailableQtyBase(PROCEDURE 1)".



    //Unsupported feature: Code Modification on "CalcAvailableQtyBase(PROCEDURE 1)".

    //procedure CalcAvailableQtyBase();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GetItem("Item No.",Description);
    GetLocation("Location Code");

    if Location."Directed Put-away and Pick" then begin
      QtyAssgndOnWkshBase := WhseAvailMgt.CalcQtyAssgndOnWksh(Rec,not Location."Allow Breakbulk",true);

      AvailQtyBase :=
        CreatePick.CalcTotalAvailQtyToPick(
          "Location Code","Item No.","Variant Code",'','',"Source Type","Source Subtype","Source No.","Source Line No.",
          "Source Subline No.","Qty. to Handle (Base)",false);
    end else begin
      QtyAssgndOnWkshBase := WhseAvailMgt.CalcQtyAssgndOnWksh(Rec,true,true);

      if Location."Require Pick" then
        QtyReservedOnPickShip :=
          WhseAvailMgt.CalcReservQtyOnPicksShips("Location Code","Item No.","Variant Code",TempWhseActivLine);

      QtyReservedForCurrLine :=
        Abs(
          WhseAvailMgt.CalcLineReservedQtyOnInvt(
            "Source Type","Source Subtype","Source No.","Source Line No.","Source Subline No.",true,'','',TempWhseActivLine));

      QtyOnDedicatedBins := WhseAvailMgt.CalcQtyOnDedicatedBins("Location Code","Item No.","Variant Code",'','');

      AvailQtyBase :=
        WhseAvailMgt.CalcInvtAvailQty(Item,Location,"Variant Code",TempWhseActivLine) +
        QtyReservedOnPickShip + QtyReservedForCurrLine - QtyOnDedicatedBins;
    end;

    AvailableQty := AvailQtyBase - QtyAssgndOnWkshBase + AssignedQtyOnReservedLines;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
      //++Arbu
      //QtyAssgndOnWkshBase := WhseAvailMgt.CalcQtyAssgndOnWksh(Rec,NOT Location."Allow Breakbulk",TRUE);
      WhseAvailMgt.CalcQtyAssgndOnWksh(Rec,not Location."Allow Breakbulk",true,
      QtyAssgndOnWkshBase,QtyAssgndOnWkshBaseKN,QtyAssgndOnWkshBaseKB);
      CreatePick.CalcTotalAvailQtyToPick(
        "Location Code","Item No.","Variant Code",'','',"Source Type","Source Subtype","Source No.","Source Line No.",
        "Source Subline No.","Qty. to Handle (Base)",
        //++Arbu
        0,0);
        //--Arbu
    end else begin
      //++Arbu
      //QtyAssgndOnWkshBase := WhseAvailMgt.CalcQtyAssgndOnWksh(Rec,TRUE,TRUE);
      WhseAvailMgt.CalcQtyAssgndOnWksh(Rec,true,true,QtyAssgndOnWkshBase,QtyAssgndOnWkshBaseKN,QtyAssgndOnWkshBaseKB);
      //--Arbu
    #14..17
      //++Arbu
      {
      QtyReservedForCurrLine :=
        ABS(
          WhseAvailMgt.CalcLineReservedQtyOnInvt(
            "Source Type","Source Subtype","Source No.","Source Line No.","Source Subline No.",TRUE,'','',TempWhseActivLine));
        }
          WhseAvailMgt.CalcLineReservedQtyonInvt(
            "Source Type","Source Subtype","Source No.","Source Line No.","Source Subline No.",true,'','',TempWhseActivLine,
            QtyReservedForCurrLine,QtyReservedForCurrLineKN,QtyReservedForCurrLineKB
            );
      //--Arbu

      QtyOnDedicatedBins := WhseAvailMgt.CalcQtyOnDedicatedBins("Location Code","Item No.","Variant Code",'','');
      //++Arbu
      {
    #25..27
      }
      WhseAvailMgt.CalcInvtAvailQty(Item,Location,"Variant Code",TempWhseActivLine,AvailQtyBase,AvailQtyBaseKN,AvailQtyBaseKB);
    end;
    //++Arbu
    //AvailableQty := AvailQtyBase - QtyAssgndOnWkshBase + AssignedQtyOnReservedLines;
    decQty[1]:= 0;
    decQty[2]:= 0;
    decQty[3]:= 0;
    AssignedQtyOnReservedLines(decQty[1],decQty[2],decQty[3]);
    AvailQty := AvailQtyBase - QtyAssgndOnWkshBase + decQty[1];
    AvailQtyKN := AvailQtyBaseKN - QtyAssgndOnWkshBaseKN + decQty[2];
    AvailQtyKB := AvailQtyBaseKB - QtyAssgndOnWkshBaseKB + decQty[3];
    //--Arbu
    */
    //end;


    //Unsupported feature: Code Modification on "CalcReservedNotFromILEQty(PROCEDURE 41)".

    //procedure CalcReservedNotFromILEQty();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CreatePick.CheckReservation(
      QtyBaseAvailToPick,"Source Type","Source Subtype","Source No.","Source Line No.","Source Subline No.",false,
      "Qty. per Unit of Measure",QtyToPick,QtyToPickBase);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    {CreatePick.CheckReservation(
      QtyBaseAvailToPick,"Source Type","Source Subtype","Source No.","Source Line No.","Source Subline No.",FALSE,
      "Qty. per Unit of Measure",QtyToPick,QtyToPickBase);
      }
    */
    //end;


    //Unsupported feature: Code Modification on "CheckBin(PROCEDURE 17)".

    //procedure CheckBin();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IsHandled := false;
    OnBeforeCheckBin(Rec,LocationCode,BinCode,Inbound,IsHandled);
    if IsHandled then
    #4..25
             "Location Code",BinCode,"Item No.","Variant Code","Unit of Measure Code")
        then
          BinContent.CheckIncreaseBinContent(
            "Qty. to Handle (Base)",0,0,0,Cubage,Weight,false,false)
        else
          Bin.CheckIncreaseBin(BinCode,"Item No.","Qty. to Handle",0,0,Cubage,Weight,false,false);
      end else begin
    #33..37
          BinContent.FieldError("Block Movement");
      end;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..28
            "Qty. to Handle (Base)",0,0,0,Cubage,Weight,false,false,
            //++Arbu
            "Net kilos to handle (Base)",0,"Gross kilos to handle (Base)",0)
            //--Arbu
    #30..40
    */
    //end;

    //Unsupported feature: Variable Insertion (Variable: decQty) (VariableCollection) on "AvailableQtyToPick(PROCEDURE 38)".



    //Unsupported feature: Code Modification on "AvailableQtyToPick(PROCEDURE 38)".

    //procedure AvailableQtyToPick();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if "Qty. per Unit of Measure" <> 0 then
      exit(Round(CalcAvailableQtyBase / "Qty. per Unit of Measure",UOMMgt.QtyRndPrecision));
    exit(0);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if "Qty. per Unit of Measure" <> 0 then
    //++Arbu
    begin
      //EXIT(ROUND(CalcAvailableQtyBase / "Qty. per Unit of Measure",UOMMgt.QtyRndPrecision));
      decQty[1]:=0;
      decQty[2]:=0;
      decQty[3]:=0;
      CalcAvailableQtyBase(decQty[1],decQty[2],decQty[3]);
      exit(Round(decQty[1] / "Qty. per Unit of Measure",UOMMgt.QtyRndPrecision));
    end;
    //--Arbu
    exit(0);
    */
    //end;

    //Unsupported feature: Variable Insertion (Variable: decQty) (VariableCollection) on "AvailableQtyToPickExcludingQCBins(PROCEDURE 46)".



    //Unsupported feature: Code Modification on "AvailableQtyToPickExcludingQCBins(PROCEDURE 46)".

    //procedure AvailableQtyToPickExcludingQCBins();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if "Qty. per Unit of Measure" <> 0 then
      exit(UnitOfMeasureManagement.CalcQtyFromBase(
          TypeHelper.Maximum(0,CalcAvailableQtyBase - QtyOnQCBins),"Qty. per Unit of Measure"));
    exit(0);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if "Qty. per Unit of Measure" <> 0 then
    //++Arbu
    begin
      decQty[1] := 0;
      decQty[2] := 0;
      decQty[3] := 0;
      CalcAvailableQtyBase(decQty[1],decQty[2],decQty[3]);
      //EXIT(UnitOfMeasureManagement.CalcQtyFromBase(
        //  TypeHelper.Maximum(0,CalcAvailableQtyBase - QtyOnQCBins),"Qty. per Unit of Measure"));
      exit(UnitOfMeasureManagement.CalcQtyFromBase(
          TypeHelper.Maximum(0,decQty[1] - QtyOnQCBins),"Qty. per Unit of Measure"));
    end;
    //--Arbu
    exit(0);
    */
    //end;

    //Unsupported feature: Parameter Insertion (Parameter: AvailableQtyToPickBase) (ParameterCollection) on "CheckAvailableQtyBase(PROCEDURE 2)".


    //Unsupported feature: Variable Insertion (Variable: WhseActivLine) (VariableCollection) on "CheckAvailableQtyBase(PROCEDURE 2)".


    //Unsupported feature: Variable Insertion (Variable: AvailableQtyBase) (VariableCollection) on "CheckAvailableQtyBase(PROCEDURE 2)".


    //Unsupported feature: Variable Insertion (Variable: LineReservedQtyBase) (VariableCollection) on "CheckAvailableQtyBase(PROCEDURE 2)".


    //Unsupported feature: Variable Insertion (Variable: ---ARBUMASA----) (VariableCollection) on "CheckAvailableQtyBase(PROCEDURE 2)".


    //Unsupported feature: Variable Insertion (Variable: LineReservedQtyBaseKN) (VariableCollection) on "CheckAvailableQtyBase(PROCEDURE 2)".


    //Unsupported feature: Variable Insertion (Variable: LineReservedQtyBaseKB) (VariableCollection) on "CheckAvailableQtyBase(PROCEDURE 2)".


    //Unsupported feature: Property Modification (Attributes) on "OnAfterAutofillQtyToHandle(PROCEDURE 2)".


    //Unsupported feature: Property Modification (Name) on "OnAfterAutofillQtyToHandle(PROCEDURE 2)".



    //Unsupported feature: Code Modification on "OnAfterAutofillQtyToHandle(PROCEDURE 2)".

    //procedure OnAfterAutofillQtyToHandle();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //++Arbu
    //AvailableQtyBase :=
    WhseAvailMgt.CalcLineReservedQtyonInvt(
      "Source Type","Source Subtype","Source No.",
      "Source Line No.","Source Subline No.",
      true,'','',WhseActivLine,
      LineReservedQtyBase,LineReservedQtyBaseKN,
      LineReservedQtyBaseKB);
    CalcAvailableQtyBase(AvailableQtyBase[1],AvailableQtyBase[2],AvailableQtyBase[3]);
    AvailableQtyToPickBase[1] := AvailableQtyBase[1] + LineReservedQtyBase + xRec."Qty. to Handle (Base)";
    AvailableQtyToPickBase[2] := AvailableQtyBase[2] + LineReservedQtyBaseKN + xRec."Net kilos to handle (Base)";
    AvailableQtyToPickBase[3] := AvailableQtyBase[3] + LineReservedQtyBaseKB + xRec."Gross kilos to handle (Base)";
    //--Arbu

    {IF FIELDNO("Qty. to Handle") IN [CurrFieldNo,CurrentFieldNo] THEN
      AvailableQtyToPickBase += xRec."Qty. to Handle (Base)";
      }
    */
    //end;



    //Unsupported feature: Deletion (VariableCollection) on "AssignedQtyOnReservedLines(PROCEDURE 29).TotalReservedAndAssignedBase(Variable 1003)".


    //Unsupported feature: Deletion (ReturnValueCollection) on "CalcAvailableQtyBase(PROCEDURE 1).AvailableQty(ReturnValue 1000)".


    //Unsupported feature: Property Modification (Id) on "CalcAvailableQtyBase(PROCEDURE 1).AvailQtyBase(Variable 1003)".


    //Unsupported feature: Property Modification (Id) on "CalcAvailableQtyBase(PROCEDURE 1).QtyReservedForCurrLine(Variable 1004)".


    //Unsupported feature: Property Modification (Id) on "CalcAvailableQtyBase(PROCEDURE 1).QtyOnDedicatedBins(Variable 1002)".


    //Unsupported feature: Move on "CalcAvailableQtyBase(PROCEDURE 1).QtyAssgndOnWkshBase(Variable 1006)".


    //Unsupported feature: Deletion (ParameterCollection) on "OnAfterAutofillQtyToHandle(PROCEDURE 2).WhseWorksheetLine(Parameter 1000)".



    //Unsupported feature: Property Modification (Id) on ""Qty. to Handle"(Field 21).OnValidate.AvailableQty(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //"Qty. to Handle" : 1001;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //"Qty. to Handle" : 1000000000;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=You cannot handle more than the outstanding %1 units.;ESP=No puede manipular más de %1 unidades pendientes.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=You cannot handle more than the outstanding %1 units.;ESP=No puede manipular más de %1 unidades pendientes.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=%1 is set to %2. %3 should be %4.\\;ESP=%1 se fija a %2. %3 debería ser %4.\\;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=%1 is set to %2. %3 should be %4.\\;ESP=%1 se fija a %2. %3 debería ser %4.\\;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text004(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text004 : ENU=You cannot handle more than the available %1 units.;ESP=No puede manipular más de %1 unidades disponibles.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text004 : ENU=You cannot handle more than the available %1 units.;ESP=No puede manipular más de %1 unidades disponibles.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text006(Variable 1007)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text006 : ENU=Default %1 Worksheet;ESP=%1 hoja trabajo genérica;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text006 : ENU=Default %1 Worksheet;ESP=%1 hoja trabajo genérica;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text007(Variable 1009)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text007 : ENU=You must first set up user %1 as a warehouse employee.;ESP=Primero debe configurar usuario %1 como empleado almacén.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text007 : ENU=You must first set up user %1 as a warehouse employee.;ESP=Primero debe configurar usuario %1 como empleado almacén.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text009(Variable 1012)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text009 : ENU=The location %1 of %2 %3 is not enabled for user %4.;ESP=El almacén %1 de %2 %3 no está habilitado para usuario %4.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text009 : ENU=The location %1 of %2 %3 is not enabled for user %4.;ESP=El almacén %1 de %2 %3 no está habilitado para usuario %4.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text011(Variable 1016)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text011 : ENU=Quantity available to pick is not enough to fill in all the lines.;ESP=Cant. disp. para picking no es suficiente para cubrir todas las líneas.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text011 : ENU=Quantity available to pick is not enough to fill in all the lines.;ESP=Cant. disp. para picking no es suficiente para cubrir todas las líneas.;
    //Variable type has not been exported.
}

