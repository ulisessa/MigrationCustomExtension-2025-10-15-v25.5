tableextension 51356 tableextension51356 extends "Planning Routing Line"
{
    Caption = 'Planning Routing Line';
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
        modify("Operation No.")
        {
            Caption = 'Operation No.';
        }
        modify("Next Operation No.")
        {
            Caption = 'Next Operation No.';
        }
        modify("Previous Operation No.")
        {
            Caption = 'Previous Operation No.';
        }
        modify("Work Center No.")
        {
            Caption = 'Work Center No.';
        }
        modify("Work Center Group Code")
        {
            Caption = 'Work Center Group Code';
        }
        modify(Description)
        {

            //Unsupported feature: Property Modification (Data type) on "Description(Field 11)".

            Caption = 'Description';
        }
        modify("Setup Time")
        {
            Caption = 'Setup Time';
        }
        modify("Run Time")
        {
            Caption = 'Run Time';
        }
        modify("Lot Size")
        {
            Caption = 'Lot Size';
        }
        modify("Setup Time Unit of Meas. Code")
        {
            Caption = 'Setup Time Unit of Meas. Code';
        }
        modify("Run Time Unit of Meas. Code")
        {
            Caption = 'Run Time Unit of Meas. Code';
        }
        modify("Wait Time Unit of Meas. Code")
        {
            Caption = 'Wait Time Unit of Meas. Code';
        }
        modify("Move Time Unit of Meas. Code")
        {
            Caption = 'Move Time Unit of Meas. Code';
        }
        modify("Minimum Process Time")
        {
            Caption = 'Minimum Process Time';
        }
        modify("Maximum Process Time")
        {
            Caption = 'Maximum Process Time';
        }
        modify("Routing Link Code")
        {
            Caption = 'Routing Link Code';
        }
        modify("Standard Task Code")
        {
            Caption = 'Standard Task Code';
        }
        modify("Sequence No.(Forward)")
        {
            Caption = 'Sequence No.(Forward)';
        }
        modify("Sequence No.(Backward)")
        {
            Caption = 'Sequence No.(Backward)';
        }
        modify("Sequence No. (Actual)")
        {
            Caption = 'Sequence No. (Actual)';
        }
        modify("Unit Cost Calculation")
        {
            Caption = 'Unit Cost Calculation';
        }
        modify("Critical Path")
        {
            Caption = 'Critical Path';
        }
        modify("Expected Operation Cost Amt.")
        {
            Caption = 'Expected Operation Cost Amt.';
        }

        //Unsupported feature: Code Modification on ""Starting Time"(Field 70).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        Modify;

        PlanningRtngLine.Get(
          "Worksheet Template Name",
          "Worksheet Batch Name","Worksheet Line No.","Operation No.");

        PlanningRoutingMgt.CalcSequenceFromActual(PlanningRtngLine,0,ReqLine);
        PlanningRtngLine.SetCurrentKey(
          "Worksheet Template Name",
          "Worksheet Batch Name",
        #11..19
          "Worksheet Batch Name","Worksheet Line No.","Operation No.");

        UpdateDatetime;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..6
        //++ARbu PlanningRoutingMgt.CalcSequenceFromActual(PlanningRtngLine,0,ReqLine);
        #8..22
        */
        //end;


        //Unsupported feature: Code Modification on ""Ending Time"(Field 72).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        Modify;

        PlanningRtngLine.Get(
          "Worksheet Template Name",
          "Worksheet Batch Name","Worksheet Line No.","Operation No.");

        PlanningRoutingMgt.CalcSequenceFromActual(PlanningRtngLine,1,ReqLine);
        PlanningRtngLine.SetCurrentKey(
          "Worksheet Template Name",
          "Worksheet Batch Name",
        #11..16
        Get(
          "Worksheet Template Name",
          "Worksheet Batch Name","Worksheet Line No.","Operation No.");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..6
        //++Arbu PlanningRoutingMgt.CalcSequenceFromActual(PlanningRtngLine,1,ReqLine);
        #8..19
        */
        //end;
    }


    //Unsupported feature: Code Modification on "RunTimePer(PROCEDURE 7)".

    //procedure RunTimePer();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if "Lot Size" = 0 then
      "Lot Size" := 1;

    exit(Round("Run Time" / "Lot Size",UOMMgt.TimeRndPrecision));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
    //++Arbu EXIT(ROUND("Run Time" / "Lot Size",UOMMgt.TimeRndPrecision));
    */
    //end;


    //Unsupported feature: Code Modification on "CalcStartingEndingDates(PROCEDURE 17)".

    //procedure CalcStartingEndingDates();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    Modify;

    PlanningRtngLine.Get(
      "Worksheet Template Name",
      "Worksheet Batch Name","Worksheet Line No.","Operation No.");

    PlanningRoutingMgt.CalcSequenceFromActual(PlanningRtngLine,0,ReqLine);
    PlanningRtngLine.SetCurrentKey(
      "Worksheet Template Name",
      "Worksheet Batch Name",
    #11..17
    Get(
      "Worksheet Template Name",
      "Worksheet Batch Name","Worksheet Line No.","Operation No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6
    //++Arbu PlanningRoutingMgt.CalcSequenceFromActual(PlanningRtngLine,0,ReqLine);
    #8..20
    */
    //end;


    //Unsupported feature: Code Modification on "CalculateRoutingBack(PROCEDURE 10)".

    //procedure CalculateRoutingBack();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GetLine;

    if "Previous Operation No." <> '' then begin
    #4..17
          case WorkCenter."Simulation Type" of
            WorkCenter."Simulation Type"::Moves:
              begin
                PlanningRoutingMgt.CalcSequenceFromActual(PlanningRtngLine,1,ReqLine);
                PlngLnMgt.CalculateRoutingFromActual(PlanningRtngLine,1,true);
              end;
            WorkCenter."Simulation Type"::"Moves When Necessary":
              begin
                if (PlanningRtngLine."Ending Date" > "Starting Date") or
                   ((PlanningRtngLine."Ending Date" = "Starting Date") and
                    (PlanningRtngLine."Ending Time" > "Starting Time"))
                then begin
                  PlanningRoutingMgt.CalcSequenceFromActual(PlanningRtngLine,1,ReqLine);
                  PlngLnMgt.CalculateRoutingFromActual(PlanningRtngLine,1,true);
                end;
              end;
    #34..47

    PlngLnMgt.CalculatePlanningLineDates(ReqLine);
    AdjustComponents(ReqLine);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..20
                //++Arbu PlanningRoutingMgt.CalcSequenceFromActual(PlanningRtngLine,1,ReqLine);
    #22..29
                  //++Arbu PlanningRoutingMgt.CalcSequenceFromActual(PlanningRtngLine,1,ReqLine);
    #31..50
    */
    //end;


    //Unsupported feature: Code Modification on "CalculateRoutingForward(PROCEDURE 9)".

    //procedure CalculateRoutingForward();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GetLine;

    if "Next Operation No." <> '' then begin
    #4..16
          case WorkCenter."Simulation Type" of
            WorkCenter."Simulation Type"::Moves:
              begin
                PlanningRoutingMgt.CalcSequenceFromActual(PlanningRtngLine,0,ReqLine);
                PlngLnMgt.CalculateRoutingFromActual(PlanningRtngLine,0,true);
              end;
            WorkCenter."Simulation Type"::"Moves When Necessary":
              begin
                if (PlanningRtngLine."Starting Date" < "Ending Date") or
                   ((PlanningRtngLine."Starting Date" = "Ending Date") and
                    (PlanningRtngLine."Starting Time" < "Ending Time"))
                then begin
                  PlanningRoutingMgt.CalcSequenceFromActual(PlanningRtngLine,0,ReqLine);
                  PlngLnMgt.CalculateRoutingFromActual(PlanningRtngLine,0,true);
                end;
              end;
    #33..46

    PlngLnMgt.CalculatePlanningLineDates(ReqLine);
    AdjustComponents(ReqLine);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..19
                //++Arbu PlanningRoutingMgt.CalcSequenceFromActual(PlanningRtngLine,0,ReqLine);
    #21..28
                  //++Arbu PlanningRoutingMgt.CalcSequenceFromActual(PlanningRtngLine,0,ReqLine);
    #30..49
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=This routing line cannot be moved because of critical work centers in previous operations;ESP=Esta línea de ruta no puede moverse debido a los centros de trabajo críticos en operaciones anteriores;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=This routing line cannot be moved because of critical work centers in previous operations;ESP=Esta línea de ruta no puede moverse debido a los centros de trabajo críticos en operaciones anteriores;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=This routing line cannot be moved because of critical work centers in next operations;ESP=Esta línea de ruta no puede moverse debido a los centros de trabajo críticos en operaciones posteriores.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=This routing line cannot be moved because of critical work centers in next operations;ESP=Esta línea de ruta no puede moverse debido a los centros de trabajo críticos en operaciones posteriores.;
    //Variable type has not been exported.
}

