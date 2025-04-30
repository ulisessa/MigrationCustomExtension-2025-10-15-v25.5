tableextension 50993 tableextension50993 extends "Whse. Item Tracking Line"
{
    Caption = 'Whse. Item Tracking Line';
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

            //Unsupported feature: Property Modification (Data type) on "Description(Field 7)".

            Caption = 'Description';
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
        modify("Serial No.")
        {
            Caption = 'Serial No.';
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
        modify("Source Type Filter")
        {
            OptionCaption = ' ,Receipt,Shipment,Internal Put-away,Internal Pick,Production,Movement Worksheet,Assembly';
        }
        modify("Created by Whse. Activity Line")
        {
            Caption = 'Created by Whse. Activity Line';
        }
        modify("Lot No.")
        {
            Caption = 'Lot No.';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
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
    }

    //Unsupported feature: Parameter Insertion (Parameter: MaxKN) (ParameterCollection) on "LookUpTrackingSummary(PROCEDURE 50)".


    //Unsupported feature: Parameter Insertion (Parameter: MaxKB) (ParameterCollection) on "LookUpTrackingSummary(PROCEDURE 50)".



    //Unsupported feature: Code Modification on "LookUpTrackingSummary(PROCEDURE 50)".

    //procedure LookUpTrackingSummary();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IsHandled := false;
    OnBeforeLookUpTrackingSummary(WhseItemTrackingLine,TrackingType,MaxQuantity,SignFactor,true,IsHandled);
    if IsHandled then
    #4..34
      TempTrackingSpecification.SetSource(
        "Source Type","Source Subtype","Source ID","Source Ref. No.","Source Batch Name","Source Prod. Order Line");
      TempTrackingSpecification."Quantity (Base)" := "Quantity (Base)";
      TempTrackingSpecification."Qty. to Handle" := "Qty. to Handle";
      TempTrackingSpecification."Qty. to Handle (Base)" := "Qty. to Handle (Base)";
      Clear(ItemTrackingDataCollection);
      ItemTrackingDataCollection.AssistEditTrackingNo(
        TempTrackingSpecification,SearchForSupply,SignFactor,TrackingType,MaxQuantity);
      Validate("Quantity (Base)",TempTrackingSpecification."Quantity (Base)");
      case TrackingType of
        TrackingType::SerialNo:
          if TempTrackingSpecification."Serial No." <> '' then
    #47..51
    end;

    OnAfterLookUpTrackingSummary(WhseItemTrackingLine,TrackingType,TempTrackingSpecification);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..37
      //++Arbu
      TempTrackingSpecification."Net kilos (Base)" := "Net kilos (Base)";
      TempTrackingSpecification."Gross kilos (Base)" := "Gross kilos (Base)";
      //--Arbu
      TempTrackingSpecification."Qty. to Handle" := "Qty. to Handle";
      //++Arbu
      TempTrackingSpecification."Net kilos to Handle" := "Net kilos to Handle";
      TempTrackingSpecification."Gross kilos to Handle" := "Gross kilos to Handle";
      //--Arbu
      TempTrackingSpecification."Qty. to Handle (Base)" := "Qty. to Handle (Base)";
      //++Arbu
      TempTrackingSpecification."Net kilos to handle (Base)" := "Net kilos to handle (Base)";
      TempTrackingSpecification."Gross kilos to handle (Base)" := "Gross kilos to handle (Base)";
      //--Arbu
      Clear(ItemTrackingDataCollection);
      ItemTrackingDataCollection.AssistEditLotSerialNo(
        TempTrackingSpecification,SearchForSupply,SignFactor,TrackingType,MaxQuantity,
        //++Arbu
        MaxKN,MaxKB
        //--Arbu
        );
      Validate("Quantity (Base)",TempTrackingSpecification."Quantity (Base)");

      //++Arbu
      Validate("Net kilos (Base)",TempTrackingSpecification."Net kilos (Base)");
      Validate("Gross kilos (Base)",TempTrackingSpecification."Gross kilos (Base)");
      //--Arbu

    #44..54
    */
    //end;


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
    //Text003 : ENU=%1 must be 0 or 1 when %2 is stated.;ESP=%1 debe ser 0 o 1 cuando está definido %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : ENU=%1 must be 0 or 1 when %2 is stated.;ESP=%1 debe ser 0 o 1 cuando está definido %2.;
    //Variable type has not been exported.
}

