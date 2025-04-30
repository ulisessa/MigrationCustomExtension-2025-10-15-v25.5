tableextension 51075 tableextension51075 extends "Warehouse Receipt Line"
{
    Caption = 'Warehouse Receipt Line';
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
        modify("Qty. to Cross-Dock")
        {
            Caption = 'Qty. to Cross-Dock';
        }
        modify("Qty. to Cross-Dock (Base)")
        {
            Caption = 'Qty. to Cross-Dock (Base)';
        }
        modify("Cross-Dock Zone Code")
        {
            Caption = 'Cross-Dock Zone Code';
        }
        modify("Cross-Dock Bin Code")
        {
            Caption = 'Cross-Dock Bin Code';
        }
        field(50000; "Net kilos"; Decimal)
        {
            Caption = 'Net kilos';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50001; "Gross kilos"; Decimal)
        {
            Caption = 'Gross kilos';
            DecimalPlaces = 0 : 5;
            Editable = false;
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
        field(50020; "Net kilos to Receive"; Decimal)
        {
            Caption = 'Net kilos to Receive';
            DecimalPlaces = 0 : 5;
            MinValue = 0;

        }
        field(50021; "Net kilos to Receive (Base)"; Decimal)
        {
            Caption = 'Net kilos to Receive (Base)';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                TestField("Qty. per Unit of Measure", 1);
                Validate("Qty. to Receive", "Qty. to Receive (Base)");
            end;
        }
        field(50022; "Net kilos Received"; Decimal)
        {
            Caption = 'Net kilos Received';
            DecimalPlaces = 0 : 5;
            Editable = false;

        }
        field(50023; "Net kilos Received (Base)"; Decimal)
        {
            Caption = 'Net kilos Received (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50024; "Gross kilos to Receive"; Decimal)
        {
            Caption = 'Gross kilos to Receive';
            DecimalPlaces = 0 : 5;
            MinValue = 0;

        }
        field(50025; "Gross kilos to Receive (Base)"; Decimal)
        {
            Caption = 'Gross kilos to Receive (Base)';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                TestField("Qty. per Unit of Measure", 1);
                Validate("Qty. to Receive", "Qty. to Receive (Base)");
            end;
        }
        field(50026; "Gross kilos Received"; Decimal)
        {
            Caption = 'Gross kilos Received';
            DecimalPlaces = 0 : 5;
            Editable = false;

        }
        field(50027; "Gross kilos Received (Base)"; Decimal)
        {
            Caption = 'Gross kilos Received (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
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
        field(50040; "Net kilos Outstanding"; Decimal)
        {
            Caption = 'Qty. Outstanding';
            DecimalPlaces = 0 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                "Net kilos Outstanding (Base)" := "Net kilos Outstanding";
                Validate("Net kilos to Receive", "Net kilos Outstanding");
            end;
        }
        field(50041; "Net kilos Outstanding (Base)"; Decimal)
        {
            Caption = 'Qty. Outstanding (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50042; "Gross kilos Outstanding"; Decimal)
        {
            Caption = 'Qty. Outstanding';
            DecimalPlaces = 0 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                "Gross kilos Outstanding (Base)" := "Gross kilos Outstanding";
                Validate("Gross kilos to Receive", "Gross kilos Outstanding");
            end;
        }
        field(50043; "Gross kilos Outstanding (Base)"; Decimal)
        {
            Caption = 'Qty. Outstanding (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
    }


    //Unsupported feature: Code Modification on "CheckBin(PROCEDURE 3)".

    //procedure CheckBin();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if CalledFromQtytoReceive then begin
      DeductCubage := xRec.Cubage;
      DeductWeight := xRec.Weight;
    #4..8
    then begin
      if not BinContent.CheckIncreaseBinContent(
           "Qty. to Receive",xRec."Qty. to Receive",
           DeductCubage,DeductWeight,Cubage,Weight,false,IgnoreErrors)
      then
        ErrorOccured := true;
    end else begin
    #16..21
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
           "Net kilos to Receive",xRec."Net kilos to Receive",
           "Gross kilos to Receive",xRec."Gross kilos to Receive")
           //--Arbu
    #13..24
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
    #4..11
    SecondSourceQtyArray[1] := DATABASE::"Warehouse Receipt Line";
    SecondSourceQtyArray[2] := "Qty. to Receive (Base)";
    SecondSourceQtyArray[3] := 0;

    case "Source Type" of
      DATABASE::"Purchase Line":
        begin
    #19..32
    end;

    OnAfterOpenItemTrackingLines(Rec,SecondSourceQtyArray);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..14
    //++Arbu
    SecondSourceQtyArray[4] := "Net kilos to Receive (Base)";
    SecondSourceQtyArray[5] := 0;
    SecondSourceQtyArray[6] := "Gross kilos to Receive (Base)";
    SecondSourceQtyArray[7] := 0;
    //--Arbu
    #16..35
    */
    //end;


    //Unsupported feature: Code Modification on "SetSourceFilter(PROCEDURE 42)".

    //procedure SetSourceFilter();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    WhseManagement.SetSourceFilterForWhseRcptLine(Rec,SourceType,SourceSubType,SourceNo,SourceLineNo,SetKey);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //WhseManagement.SetSourceFilterForWhseRcptLine(Rec,SourceType,SourceSubType,SourceNo,SourceLineNo,SetKey);
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1021)".

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
    //Text004 : ENU=%1 %2 is not completely received.\Do you really want to delete the %1?;ESP=%1 %2 no se ha recibido completamente.\¿Desea eliminar el %1?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text004 : ENU=%1 %2 is not completely received.\Do you really want to delete the %1?;ESP=%1 %2 no se ha recibido completamente.\?Desea eliminar el %1?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text005(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text005 : ENU=You cannot Cross-Dock  more than the %1 units to be received.;ESP=No puede realizar tráns. directo de más de %1 unidades a recibir.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text005 : ENU=You cannot Cross-Dock  more than the %1 units to be received.;ESP=No puede realizar tráns. directo de más de %1 unidades a recibir.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text006(Variable 1007)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text006 : ENU=Cross-Docking is disabled for this %1 and/or %2;ESP=Está deshabilitado Tránsito directo para este %1 y/o %2;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text006 : ENU=Cross-Docking is disabled for this %1 and/or %2;ESP=está deshabilitado Tránsito directo para este %1 y/o %2;
    //Variable type has not been exported.
}

