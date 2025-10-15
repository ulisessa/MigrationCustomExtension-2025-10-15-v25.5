tableextension 50839 tableextension50839 extends "Transfer Line"
{
    Caption = 'Transfer Line';
    fields
    {
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        modify("Shortcut Dimension 2 Code")
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Description 2")
        {
            Caption = 'Description 2';
        }
        modify("In-Transit Code")
        {
            Caption = 'In-Transit Code';
        }
        modify("Qty. in Transit")
        {
            Caption = 'Qty. in Transit';
        }
        modify("Qty. in Transit (Base)")
        {
            Caption = 'Qty. in Transit (Base)';
        }
        modify("Transfer-from Code")
        {
            Caption = 'Transfer-from Code';
        }
        modify("Transfer-to Code")
        {
            Caption = 'Transfer-to Code';
        }
        modify("Shipment Date")
        {
            Caption = 'Shipment Date';
        }
        modify("Receipt Date")
        {
            Caption = 'Receipt Date';
        }
        modify("Derived From Line No.")
        {
            Caption = 'Derived From Line No.';
        }
        modify("Shipping Agent Code")
        {
            Caption = 'Shipping Agent Code';
        }
        modify("Shipping Agent Service Code")
        {
            Caption = 'Shipping Agent Service Code';
        }
        modify("Appl.-to Item Entry")
        {
            Caption = 'Appl.-to Item Entry';
        }
        modify("Shipping Time")
        {
            Caption = 'Shipping Time';
        }
        modify("Reserved Quantity Shipped")
        {
            Caption = 'Reserved Quantity Shipped';
        }
        modify("Reserved Qty. Shipped (Base)")
        {
            Caption = 'Reserved Qty. Shipped (Base)';
        }
        modify("Item Category Code")
        {
            Caption = 'Item Category Code';
        }
        modify("Transfer-from Bin Code")
        {
            Caption = 'Transfer-from Bin Code';
        }
        modify("Transfer-To Bin Code")
        {
            Caption = 'Transfer-To Bin Code';
        }
        modify("Planning Flexibility")
        {
            Caption = 'Planning Flexibility';
        }

        //Unsupported feature: Code Modification on ""Item No."(Field 3).OnValidate".

        //trigger "(Field 3)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestField("Quantity Shipped",0);
        if CurrFieldNo <> 0 then
          TestStatusOpen;
        #4..38
        OnAfterAssignItemValues(Rec,Item);

        CreateDim(DATABASE::Item,"Item No.");
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..41
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
                                            //++Arbu
                                            "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
                                            "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
                                            "Shortcut Dimension 7 Code"
                                            //--Arbu
                                            );
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
        field(50010; "Net kilos"; Decimal)
        {
            Caption = 'Net kilos';
            DecimalPlaces = 0 : 5;
            MinValue = 0;

        }
        field(50011; "Gross kilos"; Decimal)
        {
            Caption = 'Gross kilos';
            DecimalPlaces = 0 : 5;
            MinValue = 0;

        }
        field(50012; "Net kilos to Ship"; Decimal)
        {
            Caption = 'Net kilos to Ship';
            DecimalPlaces = 0 : 5;
            MinValue = 0;

        }
        field(50013; "Gross kilos to Ship"; Decimal)
        {
            Caption = 'Gross kilos to Ship';
            DecimalPlaces = 0 : 5;
            MinValue = 0;

        }
        field(50014; "Net kilos to Receive"; Decimal)
        {
            Caption = 'Net kilos to Receive';
            DecimalPlaces = 0 : 5;
            MinValue = 0;

        }
        field(50015; "Gross kilos to Receive"; Decimal)
        {
            Caption = 'Gross kilos to Receive';
            DecimalPlaces = 0 : 5;
            MinValue = 0;

        }
        field(50016; "Net kilos Shipped"; Decimal)
        {
            Caption = 'Net kilos Shipped';
            DecimalPlaces = 0 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                "Net kilos Shipped (Base)" := "Net kilos Shipped";
                InitQtyInTransit;
                InitOutstandingQty;
                InitQtyToShip;
                InitQtyToReceive;
            end;
        }
        field(50017; "Gross kilos Shipped"; Decimal)
        {
            Caption = 'Gross kilos Shipped';
            DecimalPlaces = 0 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                "Gross kilos Shipped (Base)" := "Gross kilos Shipped";
                InitQtyInTransit;
                InitOutstandingQty;
                InitQtyToShip;
                InitQtyToReceive;
            end;
        }
        field(50018; "Net kilos Received"; Decimal)
        {
            Caption = 'Net kilos Received';
            DecimalPlaces = 0 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                "Net kilos Received (Base)" := "Net kilos Received";
                InitQtyInTransit;
                InitOutstandingQty;
                InitQtyToReceive;
            end;
        }
        field(50019; "Gross kilos Received"; Decimal)
        {
            Caption = 'Gross kilos Received';
            DecimalPlaces = 0 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                "Gross kilos Received (Base)" := "Gross kilos Received";
                InitQtyInTransit;
                InitOutstandingQty;
                InitQtyToReceive;
            end;
        }
        field(50020; "Net kilos (Base)"; Decimal)
        {
            Caption = 'Net kilos (Base)';
            DecimalPlaces = 0 : 5;
            MinValue = 0;

            trigger OnValidate()
            begin
                if (CurrFieldNo <> 0) then
                    TestStatusOpen;
                TestField("Qty. per Unit of Measure", 1);
                Validate("Net kilos", "Net kilos (Base)");
            end;
        }
        field(50021; "Gross kilos (Base)"; Decimal)
        {
            Caption = 'Gross kilos (Base)';
            DecimalPlaces = 0 : 5;
            MinValue = 0;

            trigger OnValidate()
            begin
                if (CurrFieldNo <> 0) then
                    TestStatusOpen;
                TestField("Qty. per Unit of Measure", 1);
                Validate("Gross kilos", "Gross kilos (Base)");
            end;
        }
        field(50022; "Outstanding net kilos (Base)"; Decimal)
        {
            Caption = 'Outstanding net kilos (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50023; "Outstanding gross kilos (Base)"; Decimal)
        {
            Caption = 'Outstanding gross kilos (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50024; "Net kilos to Ship (Base)"; Decimal)
        {
            Caption = 'Net kilos to Ship (Base)';
            DecimalPlaces = 0 : 5;
            MinValue = 0;

            trigger OnValidate()
            begin
                TestField("Qty. per Unit of Measure", 1);
                Validate("Net kilos to Ship", "Net kilos to Ship (Base)");
            end;
        }
        field(50025; "Gross kilos to Ship (Base)"; Decimal)
        {
            Caption = 'Gross kilos to Ship (Base)';
            DecimalPlaces = 0 : 5;
            MinValue = 0;

            trigger OnValidate()
            begin
                TestField("Qty. per Unit of Measure", 1);
                Validate("Gross kilos to Ship", "Gross kilos to Ship (Base)");
            end;
        }
        field(50026; "Net kilos Shipped (Base)"; Decimal)
        {
            Caption = 'Net kilos Shipped (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50027; "Gross kilos Shipped (Base)"; Decimal)
        {
            Caption = 'Gross kilos Shipped (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50028; "Net kilos to Receive (Base)"; Decimal)
        {
            Caption = 'Net kilos to Receive (Base)';
            DecimalPlaces = 0 : 5;
            MinValue = 0;

            trigger OnValidate()
            begin
                TestField("Qty. per Unit of Measure", 1);
                Validate("Net kilos to Receive", "Net kilos to Receive (Base)");
            end;
        }
        field(50029; "Gross kilos to Receive (Base)"; Decimal)
        {
            Caption = 'Gross kilos to Receive (Base)';
            DecimalPlaces = 0 : 5;
            MinValue = 0;

            trigger OnValidate()
            begin
                TestField("Qty. per Unit of Measure", 1);
                Validate("Gross kilos to Receive", "Gross kilos to Receive (Base)");
            end;
        }
        field(50030; "Net kilos Received (Base)"; Decimal)
        {
            Caption = 'Net kilos Received (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50031; "Gross kilos Received (Base)"; Decimal)
        {
            Caption = 'Gross kilos Received (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50032; "Outstanding net kilos"; Decimal)
        {
            Caption = 'Outstanding net kilos';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50033; "Outstanding gross kilos"; Decimal)
        {
            Caption = 'Outstanding gross kilos';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50034; "Net kilos in Transit"; Decimal)
        {
            Caption = 'Net kilos in Transit';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50035; "Gross kilos in Transit"; Decimal)
        {
            Caption = 'Gross kilos in Transit';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50036; "Net kilos in Transit (Base)"; Decimal)
        {
            Caption = 'Net kilos in Transit (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50037; "Gross kilos in Transit (Base)"; Decimal)
        {
            Caption = 'Gross kilos in Transit (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50038; "Reserved net kilos Inbnd."; Decimal)
        {
            CalcFormula = Sum("Reservation Entry"."Net kilos" WHERE("Source ID" = FIELD("Document No."),
                                                                     "Source Ref. No." = FIELD("Line No."),
                                                                     "Source Type" = CONST(5741),
                                                                     "Source Subtype" = CONST("1"),
                                                                     "Source Prod. Order Line" = FIELD("Derived From Line No."),
                                                                     "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved net kilos Inbnd.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50039; "Reserved gross kilos Inbnd."; Decimal)
        {
            CalcFormula = Sum("Reservation Entry"."Gross kilos" WHERE("Source ID" = FIELD("Document No."),
                                                                       "Source Ref. No." = FIELD("Line No."),
                                                                       "Source Type" = CONST(5741),
                                                                       "Source Subtype" = CONST("1"),
                                                                       "Source Prod. Order Line" = FIELD("Derived From Line No."),
                                                                       "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved gross kilos Inbnd.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50040; "Reserved net kilos Outbnd."; Decimal)
        {
            CalcFormula = - Sum("Reservation Entry"."Net kilos" WHERE("Source ID" = FIELD("Document No."),
                                                                      "Source Ref. No." = FIELD("Line No."),
                                                                      "Source Type" = CONST(5741),
                                                                      "Source Subtype" = CONST("0"),
                                                                      "Source Prod. Order Line" = FIELD("Derived From Line No."),
                                                                      "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved net kilos Outbnd.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50041; "Reserved gross kilos Outbnd."; Decimal)
        {
            CalcFormula = - Sum("Reservation Entry"."Gross kilos" WHERE("Source ID" = FIELD("Document No."),
                                                                        "Source Ref. No." = FIELD("Line No."),
                                                                        "Source Type" = CONST(5741),
                                                                        "Source Subtype" = CONST("0"),
                                                                        "Source Prod. Order Line" = FIELD("Derived From Line No."),
                                                                        "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved gross kilos Outbnd.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50042; "Reserved net kilos Inbnd. (B)"; Decimal)
        {
            CalcFormula = Sum("Reservation Entry"."Net kilos (Base)" WHERE("Source ID" = FIELD("Document No."),
                                                                            "Source Ref. No." = FIELD("Line No."),
                                                                            "Source Type" = CONST(5741),
                                                                            "Source Subtype" = CONST("1"),
                                                                            "Source Prod. Order Line" = FIELD("Derived From Line No."),
                                                                            "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved net kilos Inbnd. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50043; "Reserved gross kilos Inbnd.(B)"; Decimal)
        {
            CalcFormula = Sum("Reservation Entry"."Gross kilos (Base)" WHERE("Source ID" = FIELD("Document No."),
                                                                              "Source Ref. No." = FIELD("Line No."),
                                                                              "Source Type" = CONST(5741),
                                                                              "Source Subtype" = CONST("1"),
                                                                              "Source Prod. Order Line" = FIELD("Derived From Line No."),
                                                                              "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved gross kilos Inbnd. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50044; "Reserved net kilos Outbnd. (B)"; Decimal)
        {
            CalcFormula = - Sum("Reservation Entry"."Net kilos (Base)" WHERE("Source ID" = FIELD("Document No."),
                                                                             "Source Ref. No." = FIELD("Line No."),
                                                                             "Source Type" = CONST(5741),
                                                                             "Source Subtype" = CONST("0"),
                                                                             "Source Prod. Order Line" = FIELD("Derived From Line No."),
                                                                             "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved net kilos Outbnd. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50045; "Reserved gross kilos Outbnd(B)"; Decimal)
        {
            CalcFormula = - Sum("Reservation Entry"."Gross kilos (Base)" WHERE("Source ID" = FIELD("Document No."),
                                                                               "Source Ref. No." = FIELD("Line No."),
                                                                               "Source Type" = CONST(5741),
                                                                               "Source Subtype" = CONST("0"),
                                                                               "Source Prod. Order Line" = FIELD("Derived From Line No."),
                                                                               "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved gross kilos Outbnd. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50046; "Reserved net kilos Shipped"; Decimal)
        {
            CalcFormula = Sum("Reservation Entry"."Net kilos" WHERE("Source ID" = FIELD("Document No."),
                                                                     "Source Ref. No." = FILTER(<> 0),
                                                                     "Source Type" = CONST(5741),
                                                                     "Source Subtype" = CONST("1"),
                                                                     "Source Prod. Order Line" = FIELD("Line No."),
                                                                     "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved net kilos Shipped';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50047; "Reserved gross k. Shipped"; Decimal)
        {
            CalcFormula = Sum("Reservation Entry"."Gross kilos" WHERE("Source ID" = FIELD("Document No."),
                                                                       "Source Ref. No." = FILTER(<> 0),
                                                                       "Source Type" = CONST(5741),
                                                                       "Source Subtype" = CONST("1"),
                                                                       "Source Prod. Order Line" = FIELD("Line No."),
                                                                       "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved gross kilos Shipped';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50048; "Reserved net kilos Shipped (B)"; Decimal)
        {
            CalcFormula = Sum("Reservation Entry"."Net kilos (Base)" WHERE("Source ID" = FIELD("Document No."),
                                                                            "Source Ref. No." = FILTER(<> 0),
                                                                            "Source Type" = CONST(5741),
                                                                            "Source Subtype" = CONST("1"),
                                                                            "Source Prod. Order Line" = FIELD("Line No."),
                                                                            "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved net kilos Shipped (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50049; "Reserved gross k. Shipped(B)"; Decimal)
        {
            CalcFormula = Sum("Reservation Entry"."Gross kilos (Base)" WHERE("Source ID" = FIELD("Document No."),
                                                                              "Source Ref. No." = FILTER(<> 0),
                                                                              "Source Type" = CONST(5741),
                                                                              "Source Subtype" = CONST("1"),
                                                                              "Source Prod. Order Line" = FIELD("Line No."),
                                                                              "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved gross kilos Shipped (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50050; "Whse. Inbnd. Otsdg. NetK(Base)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Whse. Inbnd. Otsdg. Net kilos (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50051; "Whse. Inbnd. Otsdg. GssK(Base)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Whse. Inbnd. Otsdg. Gross kilos (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50052; "Whse Outbnd. Otsdg. NK (Base)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Whse Outbnd. Otsdg. Net kilos (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50053; "Whse Outbnd. Otsdg. GK (Base)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Whse Outbnd. Otsdg. Gross kilos (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50503; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';

        }
        field(50504; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';

        }
        field(50505; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 1 Code';

        }
        field(50506; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 2 Code';

        }
        field(50507; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 1 Code';

        }
    }


    //Unsupported feature: Code Modification on "InitOutstandingQty(PROCEDURE 16)".

    //procedure InitOutstandingQty();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Outstanding Quantity" := Quantity - "Quantity Shipped";
    "Outstanding Qty. (Base)" := "Quantity (Base)" - "Qty. Shipped (Base)";
    "Completely Shipped" := (Quantity <> 0) and ("Outstanding Quantity" = 0);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3

    //++Migración Arbumasa a 2009
    "Outstanding net kilos" := "Net kilos" - "Net kilos Shipped";
    "Outstanding net kilos (Base)" := "Net kilos (Base)" - "Net kilos Shipped (Base)";
    "Outstanding gross kilos" := "Gross kilos" - "Gross kilos Shipped";
    "Outstanding gross kilos (Base)" := "Gross kilos (Base)" - "Gross kilos Shipped (Base)";
    //--Migración Arbumasa a 2009
    */
    //end;


    //Unsupported feature: Code Modification on "InitQtyToShip(PROCEDURE 15)".

    //procedure InitQtyToShip();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Qty. to Ship" := "Outstanding Quantity";
    "Qty. to Ship (Base)" := "Outstanding Qty. (Base)";
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    "Qty. to Ship" := "Outstanding Quantity";
    "Qty. to Ship (Base)" := "Outstanding Qty. (Base)";

    //++Migración Arbumasa a 2009
    "Net kilos to Ship" := "Outstanding net kilos";
    "Net kilos to Ship (Base)" := "Outstanding net kilos (Base)";
    "Gross kilos to Ship" := "Outstanding gross kilos";
    "Gross kilos to Ship (Base)" := "Outstanding gross kilos (Base)";
    //--Migración Arbumasa a 2009
    */
    //end;


    //Unsupported feature: Code Modification on "InitQtyToReceive(PROCEDURE 2)".

    //procedure InitQtyToReceive();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if "In-Transit Code" <> '' then begin
      "Qty. to Receive" := "Qty. in Transit";
      "Qty. to Receive (Base)" := "Qty. in Transit (Base)";
    end;
    if ("In-Transit Code" = '') and ("Quantity Shipped" = "Quantity Received") then begin
      "Qty. to Receive" := "Qty. to Ship";
      "Qty. to Receive (Base)" := "Qty. to Ship (Base)";
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
      //++Migración Arbumasa a 2009
      "Net kilos to Receive" := "Net kilos in Transit";
      "Net kilos to Receive (Base)" := "Net kilos in Transit (Base)";
      "Gross kilos to Receive" := "Gross kilos in Transit";
      "Gross kilos to Receive (Base)" := "Gross kilos in Transit (Base)";
      //--Migración Arbumasa a 2009

    #4..8
    */
    //end;


    //Unsupported feature: Code Modification on "InitQtyInTransit(PROCEDURE 4)".

    //procedure InitQtyInTransit();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if "In-Transit Code" <> '' then begin
      "Qty. in Transit" := "Quantity Shipped" - "Quantity Received";
      "Qty. in Transit (Base)" := "Qty. Shipped (Base)" - "Qty. Received (Base)";
    end else begin
      "Qty. in Transit" := 0;
      "Qty. in Transit (Base)" := 0;
    end;
    "Completely Received" := (Quantity <> 0) and (Quantity = "Quantity Received");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..8
    //++Migración Arbumasa a 2009
    "Net kilos in Transit" := "Net kilos Shipped";
    "Net kilos in Transit (Base)" := "Net kilos Shipped (Base)" - "Net kilos Received (Base)";
    "Gross kilos in Transit" := "Gross kilos Shipped";
    "Gross kilos in Transit (Base)" := "Gross kilos Shipped (Base)" - "Gross kilos Received (Base)";
    //--Migración Arbumasa a 2009
    */
    //end;


    //Unsupported feature: Code Modification on "ShowDimensions(PROCEDURE 25)".

    //procedure ShowDimensions();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Dimension Set ID" :=
      DimMgt.EditDimensionSet("Dimension Set ID",StrSubstNo('%1 %2 %3',TableCaption,"Document No.","Line No."));
    VerifyItemLineDim;
    DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
    DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
                                      //++Arbu
                                      "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
                                      "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
                                      "Shortcut Dimension 7 Code"
                                      //--Arbu
                                      );
    */
    //end;


    //Unsupported feature: Code Modification on "CreateDim(PROCEDURE 26)".

    //procedure CreateDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SourceCodeSetup.Get;
    TableID[1] := Type1;
    No[1] := No1;
    OnAfterCreateDimTableIDs(Rec,CurrFieldNo,TableID,No);

    "Shortcut Dimension 1 Code" := '';
    "Shortcut Dimension 2 Code" := '';
    "Dimension Set ID" :=
      DimMgt.GetRecDefaultDimID(
        Rec,CurrFieldNo,TableID,No,SourceCodeSetup.Transfer,
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",TransHeader."Dimension Set ID",DATABASE::Item);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..7
    //++Arbu
    "Shortcut Dimension 3 Code" := '';
    "Shortcut Dimension 4 Code" := '';
    "Shortcut Dimension 5 Code" := '';
    "Shortcut Dimension 6 Code" := '';
    "Shortcut Dimension 7 Code" := '';
    //--Arbu

    #8..10
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
      //++Arbu
      "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
      "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
      "Shortcut Dimension 7 Code",
      //--Arbu
      TransHeader."Dimension Set ID",DATABASE::Item);
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateWithWarehouseShipReceive(PROCEDURE 41)".

    //procedure UpdateWithWarehouseShipReceive();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if Location.RequireShipment("Transfer-from Code") then
      Validate("Qty. to Ship",0)
    else
    #4..10
      if ("In-Transit Code" = '') and ("Quantity Shipped" = "Quantity Received") then
        Validate("Qty. to Receive","Qty. to Ship");
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..13
    //++Migración Arbumasa a 2009
    if Location.RequireShipment("Transfer-from Code") then
      Validate("Net kilos to Ship",0)
    else
      Validate("Net kilos to Ship","Outstanding net kilos");

    if Location.RequireReceive("Transfer-to Code") then
      Validate("Net kilos to Receive",0)
    else
      Validate("Net kilos to Receive","Net kilos in Transit");

    if Location.RequireShipment("Transfer-from Code") then
      Validate("Gross kilos to Ship",0)
    else
      Validate("Gross kilos to Ship","Outstanding gross kilos");

    if Location.RequireReceive("Transfer-to Code") then
      Validate("Gross kilos to Receive",0)
    else
      Validate("Gross kilos to Receive","Gross kilos in Transit");
    //--Migración Arbumasa a 2009
    */
    //end;


    //Unsupported feature: Code Modification on "DateConflictCheck(PROCEDURE 13)".

    //procedure DateConflictCheck();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if not TrackingBlocked then
      CheckDateConflict.TransferLineCheck(Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    {IF NOT TrackingBlocked THEN
      CheckDateConflict.TransferLineCheck(Rec);
      }
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text003 : ENU="Warehouse %1 is required for %2 = %3.";ESP="Se requiere almacén %1 para %2 = %3.";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : ENU="Warehouse %1 is required for %2 = %3.";ESP="Se requiere almacén %1 para %2 = %3.";
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text004(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text004 : ENU=\The entered information may be disregarded by warehouse operations.;ESP=\La información introducida puede ser ignorada por operaciones almacén.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text004 : ENU=\The entered information may be disregarded by warehouse operations.;ESP=\La información introducida puede ser ignorada por operaciones almacén.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text005(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text005 : ENU=You cannot ship more than %1 units.;ESP=No se pueden enviar más de %1 unidades.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text005 : ENU=You cannot ship more than %1 units.;ESP=No se pueden enviar más de %1 unidades.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text008(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text008 : ENU=You cannot receive more than %1 units.;ESP=No se pueden recibir más de %1 unidades.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text008 : ENU=You cannot receive more than %1 units.;ESP=No se pueden recibir más de %1 unidades.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text009(Variable 1009)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text009 : ENU=No items are currently in transit.;ESP=No hay productos en tránsito.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text009 : ENU=No items are currently in transit.;ESP=No hay productos en tránsito.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text012(Variable 1020)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text012 : ENU=You have changed one or more dimensions on the %1, which is already shipped. When you post the line with the changed dimension to General Ledger, amounts on the Inventory Interim account will be out of balance when reported per dimension.\\Do you want to keep the changed dimension?;ESP=Ha modificado una o varias dimensiones de %1, que ya se ha enviado. Al registrar la línea con la dimensión modificada en la contabilidad, los importes de la cuenta provisional de inventario no cuadrarán cuando se notifiquen por dimensión.\\¿Desea conservar la dimensión modificada?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text012 : ENU=You have changed one or more dimensions on the %1, which is already shipped. When you post the line with the changed dimension to General Ledger, amounts on the Inventory Interim account will be out of balance when reported per dimension.\\Do you want to keep the changed dimension?;ESP=Ha modificado una o varias dimensiones de %1, que ya se ha enviado. Al registrar la línea con la dimensión modificada en la contabilidad, los importes de la cuenta provisional de inventario no cuadrarán cuando se notifiquen por dimensión.\\?Desea conservar la dimensión modificada?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "MustUseTrackingErr(Variable 1023)".

    //var
    //>>>> ORIGINAL VALUE:
    //MustUseTrackingErr : @@@="%1 = Form Name, %2 = Value to Enter";ENU=You must use the %1 page to specify the %2, if you use item tracking.;ESP=Use la página %1 para especificar %2, si usa el seguimiento de productos.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //MustUseTrackingErr : @@@="%1 = Form Name, %2 = Value to Enter";ENU=You must use the %1 page to specify the %2, if you use item tracking.;ESP=Use la p?gina %1 para especificar %2, si usa el seguimiento de productos.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "LedgEntryWillBeOpenedMsg(Variable 1021)".

    //var
    //>>>> ORIGINAL VALUE:
    //LedgEntryWillBeOpenedMsg : @@@="%1 = Entry No.";ENU=When posting the Applied to Ledger Entry %1 will be opened first.;ESP=Al registrar, se abrirá primero Liq. por mov. producto %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LedgEntryWillBeOpenedMsg : @@@="%1 = Entry No.";ENU=When posting the Applied to Ledger Entry %1 will be opened first.;ESP=Al registrar, se abrirá primero Liq. por mov. producto %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ShippingMoreUnitsThanReceivedErr(Variable 1010)".

    //var
    //>>>> ORIGINAL VALUE:
    //ShippingMoreUnitsThanReceivedErr : @@@="%1 = Quantity Value, %2 = Document No.";ENU=You cannot ship more than the %1 units that you have received for document no. %2.;ESP=No se puede enviar más de %1 unidades que se hayan recibido para el documento No. %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ShippingMoreUnitsThanReceivedErr : @@@="%1 = Quantity Value, %2 = Document No.";ENU=You cannot ship more than the %1 units that you have received for document no. %2.;ESP=No se puede enviar más de %1 unidades que se hayan recibido para el documento No.%2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "AnotherItemWithSameDescrQst(Variable 1026)".

    //var
    //>>>> ORIGINAL VALUE:
    //AnotherItemWithSameDescrQst : @@@="%1=Item no., %2=item description";ENU=We found an item with the description "%2" (No. %1).\Did you mean to change the current item to %1?;ESP=Encontramos un producto con la descripción "%2" (N.º %1).\¿Desea cambiar el producto actual por %1?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AnotherItemWithSameDescrQst : @@@="%1=Item no., %2=item description";ENU=We found an item with the description "%2" (No. %1).\Did you mean to change the current item to %1?;ESP=Encontramos un producto con la descripción "%2" (No. %1).\?Desea cambiar el producto actual por %1?;
    //Variable type has not been exported.
}

