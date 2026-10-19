tableextension 51079 tableextension51079 extends "Warehouse Shipment Line"
{
    Caption = 'Warehouse Shipment Line';
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
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Shelf No.")
        {
            Caption = 'Shelf No.';
        }
        modify("Bin Code")
        {
            Caption = 'Bin Code';
        }
        modify("Zone Code")
        {
            Caption = 'Zone Code';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
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
        modify("Destination No.")
        {
            Caption = 'Destination No.';
        }
        modify("Shipping Advice")
        {
            Caption = 'Shipping Advice';
        }
        modify("Shipment Date")
        {
            Caption = 'Shipment Date';
        }
        field(50510; "Net kilos"; Decimal)
        {
            Caption = 'Net kilos';
            ToolTip = 'Specifies the value of the Net kilos field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            MinValue = 0;

        }
        field(50511; "Gross kilos"; Decimal)
        {
            Caption = 'Gross kilos';
            ToolTip = 'Specifies the value of the Gross kilos field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            MinValue = 0;

        }
        field(50512; "Net kilos (Base)"; Decimal)
        {
            Caption = 'Net kilos (Base)';
            ToolTip = 'Specifies the value of the Net kilos (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50513; "Gross kilos (Base)"; Decimal)
        {
            Caption = 'Gross kilos (Base)';
            ToolTip = 'Specifies the value of the Gross kilos (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50514; "Net kilos Outstanding"; Decimal)
        {
            Caption = 'Net kilos Outstanding';
            ToolTip = 'Specifies the value of the Net kilos Outstanding field.';
            DecimalPlaces = 0 : 5;
            Editable = false;

        }
        field(50515; "Gross kilos Outstanding"; Decimal)
        {
            Caption = 'Gross kilos Outstanding';
            ToolTip = 'Specifies the value of the Gross kilos Outstanding field.';
            DecimalPlaces = 0 : 5;
            Editable = false;

        }
        field(50516; "Net kilos Outstanding (Base)"; Decimal)
        {
            Caption = 'Net kilos Outstanding (Base)';
            ToolTip = 'Specifies the value of the Net kilos Outstanding (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50517; "Gross kilos Outstanding (Base)"; Decimal)
        {
            Caption = 'Gross kilos Outstanding (Base)';
            ToolTip = 'Specifies the value of the Gross kilos Outstanding (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50518; "Net kilos to Ship"; Decimal)
        {
            Caption = 'Net kilos to Ship';
            ToolTip = 'Specifies the value of the Net kilos to Ship field.';
            DecimalPlaces = 0 : 5;
            MinValue = 0;

        }
        field(50519; "Gross kilos to Ship"; Decimal)
        {
            Caption = 'Gross kilos to Ship';
            ToolTip = 'Specifies the value of the Gross kilos to Ship field.';
            DecimalPlaces = 0 : 5;
            MinValue = 0;

        }
        field(50520; "Net kilos to Ship (Base)"; Decimal)
        {
            Caption = 'Net kilos to Ship (Base)';
            ToolTip = 'Specifies the value of the Net kilos to Ship (Base) field.';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                Validate("Qty. to Ship", CalcQty("Qty. to Ship (Base)"));
            end;
        }
        field(50521; "Gross kilos to Ship (Base)"; Decimal)
        {
            Caption = 'Gross kilos to Ship (Base)';
            ToolTip = 'Specifies the value of the Gross kilos to Ship (Base) field.';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                Validate("Qty. to Ship", CalcQty("Qty. to Ship (Base)"));
            end;
        }
        field(50522; "Net kilos Picked"; Decimal)
        {
            Caption = 'Net kilos Picked';
            ToolTip = 'Specifies the value of the Net kilos Picked field.';
            DecimalPlaces = 0 : 5;
            Editable = false;

        }
        field(50523; "Gross kilos Picked"; Decimal)
        {
            Caption = 'Gross kilos Picked';
            ToolTip = 'Specifies the value of the Gross kilos Picked field.';
            DecimalPlaces = 0 : 5;
            Editable = false;

        }
        field(50524; "Net kilos Picked (Base)"; Decimal)
        {
            Caption = 'Net kilos Picked (Base)';
            ToolTip = 'Specifies the value of the Net kilos Picked (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50525; "Gross kilos Picked (Base)"; Decimal)
        {
            Caption = 'Gross kilos Picked (Base)';
            ToolTip = 'Specifies the value of the Gross kilos Picked (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50526; "Net kilos Shipped"; Decimal)
        {
            Caption = 'Net kilos Shipped';
            ToolTip = 'Specifies the value of the Net kilos Shipped field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50527; "Gross kilos Shipped"; Decimal)
        {
            Caption = 'Gross kilos Shipped';
            ToolTip = 'Specifies the value of the Gross kilos Shipped field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50528; "Net kilos Shipped (Base)"; Decimal)
        {
            Caption = 'Net kilos Shipped (Base)';
            ToolTip = 'Specifies the value of the Net kilos Shipped (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50529; "Gross kilos Shipped (Base)"; Decimal)
        {
            Caption = 'Gross kilos Shipped (Base)';
            ToolTip = 'Specifies the value of the Gross kilos Shipped (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50530; "Pick net kilos"; Decimal)
        {
            CalcFormula = Sum("Warehouse Activity Line"."Qty. Outstanding" WHERE("Activity Type" = CONST(Pick),
                                                                                  "Whse. Document Type" = CONST(Shipment),
                                                                                  "Whse. Document No." = FIELD("No."),
                                                                                  "Whse. Document Line No." = FIELD("Line No."),
                                                                                  "Unit of Measure Code" = FIELD("Unit of Measure Code"),
                                                                                  "Action Type" = FILTER(" " | Place),
                                                                                  "Original Breakbulk" = CONST(false),
                                                                                  "Breakbulk No." = CONST(0)));
            Caption = 'Pick net kilos';
            ToolTip = 'Specifies the value of the Pick net kilos field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50531; "Pick gross kilos"; Decimal)
        {
            CalcFormula = Sum("Warehouse Activity Line"."Qty. Outstanding" WHERE("Activity Type" = CONST(Pick),
                                                                                  "Whse. Document Type" = CONST(Shipment),
                                                                                  "Whse. Document No." = FIELD("No."),
                                                                                  "Whse. Document Line No." = FIELD("Line No."),
                                                                                  "Unit of Measure Code" = FIELD("Unit of Measure Code"),
                                                                                  "Action Type" = FILTER(" " | Place),
                                                                                  "Original Breakbulk" = CONST(false),
                                                                                  "Breakbulk No." = CONST(0)));
            Caption = 'Pick gross kilos';
            ToolTip = 'Specifies the value of the Pick gross kilos field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50532; "Pick net kilos (Base)"; Decimal)
        {
            CalcFormula = Sum("Warehouse Activity Line"."Qty. Outstanding (Base)" WHERE("Activity Type" = CONST(Pick),
                                                                                         "Whse. Document Type" = CONST(Shipment),
                                                                                         "Whse. Document No." = FIELD("No."),
                                                                                         "Whse. Document Line No." = FIELD("Line No."),
                                                                                         "Action Type" = FILTER(" " | Place),
                                                                                         "Original Breakbulk" = CONST(false),
                                                                                         "Breakbulk No." = CONST(0)));
            Caption = 'Pick net kilos (Base)';
            ToolTip = 'Specifies the value of the Pick net kilos (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50533; "Pick gross kilos (Base)"; Decimal)
        {
            CalcFormula = Sum("Warehouse Activity Line"."Qty. Outstanding (Base)" WHERE("Activity Type" = CONST(Pick),
                                                                                         "Whse. Document Type" = CONST(Shipment),
                                                                                         "Whse. Document No." = FIELD("No."),
                                                                                         "Whse. Document Line No." = FIELD("Line No."),
                                                                                         "Action Type" = FILTER(" " | Place),
                                                                                         "Original Breakbulk" = CONST(false),
                                                                                         "Breakbulk No." = CONST(0)));
            Caption = 'Pick gross kilos (Base)';
            ToolTip = 'Specifies the value of the Pick gross kilos (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
    }


    //Unsupported feature: Code Modification on "CheckBin(PROCEDURE 9)".

    //procedure CheckBin();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if "Bin Code" <> '' then begin
      GetLocation("Location Code");
      if not Location."Directed Put-away and Pick" then
    #4..8
      then begin
        if not BinContent.CheckIncreaseBinContent(
             "Qty. Outstanding","Qty. Outstanding",
             DeductCubage,DeductWeight,Cubage,Weight,false,IgnoreErrors)
        then
          ErrorOccured := true;
      end else begin
    #16..22
    end;
    if ErrorOccured then
      "Bin Code" := '';
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..11
             DeductCubage,DeductWeight,Cubage,Weight,false,IgnoreErrors,
          //++Arbu
          "Net kilos Outstanding","Net kilos Outstanding",
          "Gross kilos Outstanding","Gross kilos Outstanding")
          //--Arbu
    #13..25
    */
    //end;


    //Unsupported feature: Code Modification on "OpenItemTrackingLines(PROCEDURE 6500)".

    //procedure OpenItemTrackingLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IsHandled := false;
    OnBeforeOpenItemTrackingLines(Rec,IsHandled);
    if IsHandled then
      exit;

    TestField("No.");
    TestField("Qty. (Base)");

    GetItem;
    Item.TestField("Item Tracking Code");

    SecondSourceQtyArray[1] := DATABASE::"Warehouse Shipment Line";
    SecondSourceQtyArray[2] := "Qty. to Ship (Base)";
    SecondSourceQtyArray[3] := 0;

    case "Source Type" of
      DATABASE::"Sales Line":
        begin
          if SalesLine.Get("Source Subtype","Source No.","Source Line No.") then
            ReserveSalesLine.CallItemTrackingSecondSource(SalesLine,SecondSourceQtyArray,"Assemble to Order");
        end;
      DATABASE::"Service Line":
        begin
          if ServiceLine.Get("Source Subtype","Source No.","Source Line No.") then
            ServiceLineReserve.CallItemTracking(ServiceLine);
        end;
      DATABASE::"Purchase Line":
        begin
          if PurchaseLine.Get("Source Subtype","Source No.","Source Line No.") then
            ReservePurchLine.CallItemTracking2(PurchaseLine,SecondSourceQtyArray);
        end;
      DATABASE::"Transfer Line":
        begin
          Direction := Direction::Outbound;
          if TransferLine.Get("Source No.","Source Line No.") then
            ReserveTransferLine.CallItemTracking2(TransferLine,Direction,SecondSourceQtyArray);
        end
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..14
    {
    CASE "Source Type" OF
      DATABASE::"Sales Line":
        BEGIN
          IF SalesLine.GET("Source Subtype","Source No.","Source Line No.") THEN
            ReserveSalesLine.CallItemTrackingSecondSource(SalesLine,SecondSourceQtyArray,"Assemble to Order");
        END;
      DATABASE::"Service Line":
        BEGIN
          IF ServiceLine.GET("Source Subtype","Source No.","Source Line No.") THEN
            ServiceLineReserve.CallItemTracking(ServiceLine);
        END;
      DATABASE::"Purchase Line":
        BEGIN
          IF PurchaseLine.GET("Source Subtype","Source No.","Source Line No.") THEN
            ReservePurchLine.CallItemTracking2(PurchaseLine,SecondSourceQtyArray);
        END;
      DATABASE::"Transfer Line":
        BEGIN
          Direction := Direction::Outbound;
          IF TransferLine.GET("Source No.","Source Line No.") THEN
            ReserveTransferLine.CallItemTracking2(TransferLine,Direction,SecondSourceQtyArray);
        END
    END;
    }
    */
    //end;


    //Unsupported feature: Code Modification on "DeleteWhseItemTrackingLines(PROCEDURE 33)".

    //procedure DeleteWhseItemTrackingLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ItemTrackingMgt.DeleteWhseItemTrkgLinesWithRunDeleteTrigger(
      DATABASE::"Warehouse Shipment Line",0,"No.",'',0,"Line No.","Location Code",true,true);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    {ItemTrackingMgt.DeleteWhseItemTrkgLinesWithRunDeleteTrigger(
      DATABASE::"Warehouse Shipment Line",0,"No.",'',0,"Line No.","Location Code",TRUE,TRUE);
      }
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=You cannot handle more than the outstanding %1 units.;ESP=No puede manipular más de %1 unidades pendientes.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=You cannot handle more than the outstanding %1 units.;ESP=No puede manipular más de %1 unidades pendientes.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text005(Variable 1007)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text005 : ENU=The picked quantity is not enough to ship all lines.;ESP=La cant. preparada pedido no es suficiente para enviar todas las líneas.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text005 : ENU=The picked quantity is not enough to ship all lines.;ESP=La cant. preparada pedido no es suficiente para enviar todas las líneas.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text007(Variable 1010)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text007 : @@@="Qty. Picked = 2 is greater than Qty. Shipped = 0. If you delete the Warehouse Shipment Line, the items will remain in the shipping area until you put them away.\Related Item Tracking information defined during pick will be deleted.\Do you still want to delete the Warehouse Shipment Line?";ENU="%1 = %2 is greater than %3 = %4. If you delete the %5, the items will remain in the shipping area until you put them away.\Related Item Tracking information defined during pick will be deleted.\Do you still want to delete the %5?";ESP="%1 = %2 es mayor que %3 = %4. Si elimina el %5, los productos permanecerán en el área de envío hasta que los ubique.\Se eliminará la información de seguim. prod. definida durante la preparación.\¿Todavía desea eliminar el %5?";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text007 : @@@="Qty. Picked = 2 is greater than Qty. Shipped = 0. If you delete the Warehouse Shipment Line, the items will remain in the shipping area until you put them away.\Related Item Tracking information defined during pick will be deleted.\Do you still want to delete the Warehouse Shipment Line?";ENU="%1 = %2 is greater than %3 = %4. If you delete the %5, the items will remain in the shipping area until you put them away.\Related Item Tracking information defined during pick will be deleted.\Do you still want to delete the %5?";ESP="%1 = %2 es mayor que %3 = %4. Si elimina el %5, los productos permanecerán en el área de envío hasta que los ubique.\Se eliminará la información de seguim. prod. definida durante la preparación.\?Todavía desea eliminar el %5?";
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text009(Variable 1013)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text009 : ENU=%1 is set to %2. %3 should be %4.\\;ESP=%1 se fija a %2. %3 debería ser %4.\\;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text009 : ENU=%1 is set to %2. %3 should be %4.\\;ESP=%1 se fija a %2. %3 debería ser %4.\\;
    //Variable type has not been exported.
}

