tableextension 50734 tableextension50734 extends "Prod. Order Line"
{
    Caption = 'Prod. Order Line';
    fields
    {
        modify("Prod. Order No.")
        {
            Caption = 'Prod. Order No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify(Description)
        {

            //Unsupported feature: Property Modification (Data type) on "Description(Field 13)".

            Caption = 'Description';
        }
        modify("Description 2")
        {
            Caption = 'Description 2';
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
        modify("Planning Level Code")
        {
            Caption = 'Planning Level Code';
        }
        modify("Production BOM No.")
        {
            Caption = 'Production BOM No.';
        }
        modify("Routing No.")
        {
            Caption = 'Routing No.';
        }
        modify("Routing Reference No.")
        {
            Caption = 'Routing Reference No.';
        }
        modify("Capacity No. Filter")
        {
            Caption = 'Capacity No. Filter';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Expected Operation Cost Amt.")
        {
            Caption = 'Expected Operation Cost Amt.';
        }
        modify("Production BOM Version Code")
        {
            Caption = 'Production BOM Version Code';
        }
        modify("Routing Version Code")
        {
            Caption = 'Routing Version Code';
        }
        modify("Planning Flexibility")
        {
            Caption = 'Planning Flexibility';
        }

        //Unsupported feature: Code Modification on ""Item No."(Field 11).OnValidate".

        //trigger "(Field 11)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ReserveProdOrderLine.VerifyChange(Rec,xRec);
        TestField("Finished Quantity",0);
        CalcFields("Reserved Quantity");
        #4..52
        GetUpdateFromSKU;

        CreateDim(DATABASE::Item,"Item No.");
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..55
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
                                                              //++Arbu
                                                              "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
                                                              "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
                                                              "Shortcut Dimension 7 Code");
                                                              //--Arbu
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
        //++ARbu DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */
        //end;
        field(50000; "Global Dimension 3 Code"; Code[10])
        {
            CaptionClass = '1,2,3';

        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            CaptionClass = '1,2,4';

        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            CaptionClass = '1,2,5';

        }
        field(50003; "Global Dimension 6 Code"; Code[10])
        {
            CaptionClass = '1,2,6';

        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';

        }
        field(50010; "Net kilos"; Decimal)
        {
            Caption = 'Net kilos';
            DecimalPlaces = 0 : 5;
            MinValue = 0;

        }
        field(50011; "Finished net kilos"; Decimal)
        {
            Caption = 'Finished net kilos';
            DecimalPlaces = 0 : 5;
            Editable = false;
            MinValue = 0;
        }
        field(50012; "Remaining net kilos"; Decimal)
        {
            Caption = 'Remaining net kilos';
            DecimalPlaces = 0 : 5;
            Editable = false;
            MinValue = 0;
        }
        field(50013; "Gross kilos"; Decimal)
        {
            Caption = 'Gross kilos';
            DecimalPlaces = 0 : 5;
            MinValue = 0;

        }
        field(50014; "Finished gross kilos"; Decimal)
        {
            Caption = 'Finished gross kilos';
            DecimalPlaces = 0 : 5;
            Editable = false;
            MinValue = 0;
        }
        field(50015; "Remaining gross kilos"; Decimal)
        {
            Caption = 'Remaining gross kilos';
            DecimalPlaces = 0 : 5;
            Editable = false;
            MinValue = 0;
        }
        field(50016; "Reserved net kilos"; Decimal)
        {
            CalcFormula = Sum("Reservation Entry"."Net kilos" WHERE("Source ID" = FIELD("Prod. Order No."),
                                                                     "Source Ref. No." = CONST(0),
                                                                     "Source Type" = CONST(5406),

                                                                     "Source Batch Name" = CONST(''),
                                                                     "Source Prod. Order Line" = FIELD("Line No."),
                                                                     "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved net kilos';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50017; "Reserved gross kilos"; Decimal)
        {
            CalcFormula = Sum("Reservation Entry"."Gross kilos" WHERE("Source ID" = FIELD("Prod. Order No."),
                                                                       "Source Ref. No." = CONST(0),
                                                                       "Source Type" = CONST(5406),
                                                                       "Source Batch Name" = CONST(''),
                                                                       "Source Prod. Order Line" = FIELD("Line No."),
                                                                       "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved gross kilos';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50018; "Net kilos (Base)"; Decimal)
        {
            Caption = 'Net kilos (Base)';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                Validate("Net kilos", "Net kilos (Base)");
                "Remaining net kilos" := "Net kilos" - "Finished net kilos";

                Validate("Ending Time");
            end;
        }
        field(50019; "Gross kilos (Base)"; Decimal)
        {
            Caption = 'Gross kilos (Base)';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                Validate("Gross kilos", "Gross kilos (Base)");
                "Remaining gross kilos" := "Gross kilos" - "Finished gross kilos";

                Validate("Ending Time");
            end;
        }
        field(50020; "Finished net kilos (Base)"; Decimal)
        {
            Caption = 'Finished net kilos (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50021; "Finished gross kilos (Base)"; Decimal)
        {
            Caption = 'Finished gross kilos (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50022; "Remaining net kilos (Base)"; Decimal)
        {
            Caption = 'Remaining net kilos (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50023; "Remaining gross kilos (Base)"; Decimal)
        {
            Caption = 'Remaining gross kilos (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50024; "Reserved net kilos (Base)"; Decimal)
        {
            CalcFormula = Sum("Reservation Entry"."Net kilos (Base)" WHERE("Source ID" = FIELD("Prod. Order No."),
                                                                            "Source Ref. No." = CONST(0),
                                                                            "Source Type" = CONST(5406),
                                                                            "Source Batch Name" = CONST(''),
                                                                            "Source Prod. Order Line" = FIELD("Line No."),
                                                                            "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved net kilos (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50025; "Reserved gross kilos (Base)"; Decimal)
        {
            CalcFormula = Sum("Reservation Entry"."Gross kilos (Base)" WHERE("Source ID" = FIELD("Prod. Order No."),
                                                                              "Source Ref. No." = CONST(0),
                                                                              "Source Type" = CONST(5406),
                                                                              "Source Batch Name" = CONST(''),
                                                                              "Source Prod. Order Line" = FIELD("Line No."),
                                                                              "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved gross kilos (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50026; "Total Exp. Oper. Output (Kn)"; Decimal)
        {
            CalcFormula = Sum("Prod. Order Line"."Net kilos" WHERE(Status = FIELD(Status),
                                                                    "Prod. Order No." = FIELD("Prod. Order No."),
                                                                    "Routing No." = FIELD("Routing No."),
                                                                    "Routing Reference No." = FIELD("Routing Reference No."),
                                                                    "Ending Date" = FIELD("Date Filter")));
            Caption = 'Total Exp. Oper. Output (Nk)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50027; "Total Exp. Oper. Output (Kb)"; Decimal)
        {
            CalcFormula = Sum("Prod. Order Line"."Gross kilos" WHERE(Status = FIELD(Status),
                                                                      "Prod. Order No." = FIELD("Prod. Order No."),
                                                                      "Routing No." = FIELD("Routing No."),
                                                                      "Routing Reference No." = FIELD("Routing Reference No."),
                                                                      "Ending Date" = FIELD("Date Filter")));
            Caption = 'Total Exp. Oper. Output (Gk)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50503; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
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
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
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
                ValidateShortcutDimCode(7, "Shortcut Dimension 7 Code");
            end;
        }
    }


    //Unsupported feature: Code Modification on "CreateDim(PROCEDURE 6)".

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
    "Dimension Set ID" :=
      DimMgt.GetRecDefaultDimID(
        Rec,CurrFieldNo,TableID,No,'',
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",ProdOrder."Dimension Set ID",DATABASE::Item);
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
    #7..9
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
      //++Arbu
      "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
      "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
      "Shortcut Dimension 7 Code",
      //--Arbu
      ProdOrder."Dimension Set ID",DATABASE::Item);
    */
    //end;


    //Unsupported feature: Code Modification on "ShowDimensions(PROCEDURE 25)".

    //procedure ShowDimensions();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    OldDimSetID := "Dimension Set ID";
    "Dimension Set ID" :=
      DimMgt.EditDimensionSet2(
        "Dimension Set ID",StrSubstNo('%1 %2 %3',Status,"Prod. Order No.","Line No."),
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    if OldDimSetID <> "Dimension Set ID" then begin
      Modify;
      if ProdOrderCompExist then
        UpdateProdOrderCompDim("Dimension Set ID",OldDimSetID);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++Arbu
        "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
        "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
        "Shortcut Dimension 7 Code"
        //--Arbu
        );
    #6..10
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateProdOrderCompDim(PROCEDURE 26)".

    //procedure UpdateProdOrderCompDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if NewDimSetID = OldDimSetID then
      exit;

    #4..11
        if ProdOrderComp."Dimension Set ID" <> NewCompDimSetID then begin
          ProdOrderComp."Dimension Set ID" := NewCompDimSetID;
          DimMgt.UpdateGlobalDimFromDimSetID(
            ProdOrderComp."Dimension Set ID",ProdOrderComp."Shortcut Dimension 1 Code",ProdOrderComp."Shortcut Dimension 2 Code");
          ProdOrderComp.Modify;
        end;
      until ProdOrderComp.Next = 0;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..14
            ProdOrderComp."Dimension Set ID",ProdOrderComp."Shortcut Dimension 1 Code",ProdOrderComp."Shortcut Dimension 2 Code",
                                             //++Arbu
                                             ProdOrderComp."Shortcut Dimension 3 Code",ProdOrderComp."Shortcut Dimension 4 Code",
                                             ProdOrderComp."Shortcut Dimension 5 Code",ProdOrderComp."Shortcut Dimension 6 Code",
                                             ProdOrderComp."Shortcut Dimension 7 Code"
                                             //--Arbu
                                             );
    #16..18
    */
    //end;


    //Unsupported feature: Code Modification on "ShowRouting(PROCEDURE 20)".

    //procedure ShowRouting();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ProdOrderRtngLine.SetRange(Status,Status);
    ProdOrderRtngLine.SetRange("Prod. Order No.","Prod. Order No.");
    ProdOrderRtngLine.SetRange("Routing Reference No.","Routing Reference No.");
    ProdOrderRtngLine.SetRange("Routing No.","Routing No.");

    PAGE.RunModal(PAGE::"Prod. Order Routing",ProdOrderRtngLine);
    CalcProdOrder.FindAndSetProdOrderLineBinCodeFromProdRtngLines(Status,"Prod. Order No.","Line No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6
    //++ARbu CalcProdOrder.FindAndSetProdOrderLineBinCodeFromProdRtngLines(Status,"Prod. Order No.","Line No.");
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text99000000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text99000000 : @@@="%1 = Table Caption; %2 = Field Value; %3 = Table Caption";ENU=You cannot delete %1 %2 because there is at least one %3 associated with it.;ESP=No puede eliminar %1 %2 porque existe al menos un %3 asociado a él.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text99000000 : @@@="%1 = Table Caption; %2 = Field Value; %3 = Table Caption";ENU=You cannot delete %1 %2 because there is at least one %3 associated with it.;ESP=No puede eliminar %1 %2 porque existe al menos un %3 asociado a él.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text99000004Err(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text99000004Err : @@@="%1 = Field Caption; %2 = Field Value; %3 = Table Caption";ENU=You cannot modify %1 %2 because there is at least one %3 associated with it.;ESP=No puede modificar %1 %2 porque existe al menos un %3 asociado a él.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text99000004Err : @@@="%1 = Field Caption; %2 = Field Value; %3 = Table Caption";ENU=You cannot modify %1 %2 because there is at least one %3 associated with it.;ESP=No puede modificar %1 %2 porque existe al menos un %3 asociado a él.;
    //Variable type has not been exported.
}

