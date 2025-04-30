tableextension 50736 tableextension50736 extends "Prod. Order Routing Line"
{
    Caption = 'Prod. Order Routing Line';
    fields
    {
        modify("Routing No.")
        {
            Caption = 'Routing No.';
        }
        modify("Routing Reference No.")
        {
            Caption = 'Routing Reference No.';
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
        modify("No.")
        {
            Caption = 'No.';
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
        modify("Sequence No. (Forward)")
        {
            Caption = 'Sequence No. (Forward)';
        }
        modify("Sequence No. (Backward)")
        {
            Caption = 'Sequence No. (Backward)';
        }
        modify("Sequence No. (Actual)")
        {
            Caption = 'Sequence No. (Actual)';
        }
        modify("Prod. Order No.")
        {
            Caption = 'Prod. Order No.';
        }
        modify("Unit Cost Calculation")
        {
            Caption = 'Unit Cost Calculation';
        }
        modify("Critical Path")
        {
            Caption = 'Critical Path';
        }
        modify("Flushing Method")
        {
            Caption = 'Flushing Method';
        }
        modify("Expected Operation Cost Amt.")
        {
            Caption = 'Expected Operation Cost Amt.';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("To-Production Bin Code")
        {
            Caption = 'To-Production Bin Code';
        }
        modify("From-Production Bin Code")
        {
            Caption = 'From-Production Bin Code';
        }
    }

    //Unsupported feature: Code Modification on "CheckPreviousAndNext(PROCEDURE 18)".

    //procedure CheckPreviousAndNext();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if IsSerial then
      SetPreviousAndNext
    else begin
    #4..37
             true)
        then
          exit;
        ProdOrderRoutingForm.Initialize(StrSubstNo(Text005,"Operation No."));
        repeat
          TempRemainingProdOrderRtngLine.Mark(true);
        until TempRemainingProdOrderRtngLine.Next = 0;
        TempRemainingProdOrderRtngLine.MarkedOnly(true);
        ProdOrderRoutingForm.SetTableView(TempRemainingProdOrderRtngLine);
        ProdOrderRoutingForm.RunModal;
      end;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..40
    //++ARbu    ProdOrderRoutingForm.Initialize(STRSUBSTNO(Text005,"Operation No."));
    #42..49
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : @@@="%1 = Document status; %2 = Table Caption; %3 = Field Value; %4 = Table Caption";ENU=You cannot delete %1 %2 %3 because there is at least one %4 associated with it.;ESP=No puede eliminar %1 %2 %3 porque existe al menos un %4 asociado a él.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : @@@="%1 = Document status; %2 = Table Caption; %3 = Field Value; %4 = Table Caption";ENU=You cannot delete %1 %2 %3 because there is at least one %4 associated with it.;ESP=No puede eliminar %1 %2 %3 porque existe al menos un %4 asociado a él.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=This routing line cannot be moved because of critical work centers in previous operations;ESP=Esta línea de ruta no puede moverse debido a los centros de trabajo críticos en operaciones anteriores;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=This routing line cannot be moved because of critical work centers in previous operations;ESP=Esta línea de ruta no puede moverse debido a los centros de trabajo críticos en operaciones anteriores;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text003 : ENU=This routing line cannot be moved because of critical work centers in next operations;ESP=Esta línea de ruta no puede moverse debido a los centros de trabajo críticos en operaciones posteriores.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : ENU=This routing line cannot be moved because of critical work centers in next operations;ESP=Esta línea de ruta no puede moverse debido a los centros de trabajo críticos en operaciones posteriores.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text004(Variable 1019)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text004 : ENU=Some routing lines are referring to the operation just deleted. The references are\in the fields %1 and %2.\\This may have to be corrected as a routing line referring to a non-existent\operation will lead to serious errors in capacity planning.\\Do you want to see a list of the lines in question?\(Access the columns Next Operation No. and Previous Operation No.);ESP=Algunas lín. ruta se refieren a la operación borrada. Las referencias estan\en los campos %1 y %2.\\Esto quizás deba corregirse como línea ruta referida a una operación\ no existente, lo que llevará a errores serios en la planificación de la capacidad.\\¿Quiere ver una lista de las líneas?\(Acceda a las columnas No. operación siguiente y No. operación anterior);
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text004 : ENU=Some routing lines are referring to the operation just deleted. The references are\in the fields %1 and %2.\\This may have to be corrected as a routing line referring to a non-existent\operation will lead to serious errors in capacity planning.\\Do you want to see a list of the lines in question?\(Access the columns Next Operation No. and Previous Operation No.);ESP=Algunas lín. ruta se refieren a la operación borrada. Las referencias estan\en los campos %1 y %2.\\Esto quiz?s deba corregirse como línea ruta referida a una operación\ no existente, lo que llevar? a errores serios en la planificación de la capacidad.\\?Quiere ver una lista de las líneas?\(Acceda a las columnas No.operación siguiente y No.operación anterior);
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text005(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text005 : ENU=Routing Lines referring to deleted Operation No. %1;ESP=Líneas ruta referidas a la operación borrada No. %1;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text005 : ENU=Routing Lines referring to deleted Operation No. %1;ESP=Líneas ruta referidas a la operación borrada No.%1;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text009(Variable 1024)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text009 : ENU=If you change the %1 to %2, then all related allocated capacity will be deleted, and you will not be able to change the %1 of the operation again.\\Are you sure that you want to continue?;ESP=Si cambia %1 por %2, se eliminará toda la capacidad asignada relacionada y no podrá volver a cambiar el %1 de la operación.\\¿Está seguro de que desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text009 : ENU=If you change the %1 to %2, then all related allocated capacity will be deleted, and you will not be able to change the %1 of the operation again.\\Are you sure that you want to continue?;ESP=Si cambia %1 por %2, se eliminará toda la capacidad asignada relacionada y no podrá volver a cambiar el %1 de la operación.\\?está seguro de que desea continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "TimeShiftedOnParentLineMsg(Variable 1025)".

    //var
    //>>>> ORIGINAL VALUE:
    //TimeShiftedOnParentLineMsg : ENU=The production starting date-time of the end item has been moved forward because a subassembly is taking longer than planned.;ESP=La fecha y hora iniciales de producción del artículo final se han desplazado hacia delante porque un subensamblado está tardando más de lo planeado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TimeShiftedOnParentLineMsg : ENU=The production starting date-time of the end item has been moved forward because a subassembly is taking longer than planned.;ESP=La fecha y hora iniciales de producción del artículo final se han desplazado hacia delante porque un subensamblado está tardando más de lo planeado.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "NoTerminationProcessesErr(Variable 1028)".

    //var
    //>>>> ORIGINAL VALUE:
    //NoTerminationProcessesErr : ENU=On the last operation, the Next Operation No. field must be empty.;ESP=En la última operación, el campo No. operación siguiente debe estar vacío.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NoTerminationProcessesErr : ENU=On the last operation, the Next Operation No. field must be empty.;ESP=En la última operación, el campo No.operación siguiente debe estar vacío.;
    //Variable type has not been exported.
}

