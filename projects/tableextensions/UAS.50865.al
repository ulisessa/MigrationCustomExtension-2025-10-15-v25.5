tableextension 50865 tableextension50865 extends "Inventory Period"
{

    //Unsupported feature: Variable Insertion (Variable: rstSeguridad) (VariableCollection) on "IsValidDate(PROCEDURE 56)".


    //Unsupported feature: Variable Insertion (Variable: rstSeguridadUsuario) (VariableCollection) on "IsValidDate(PROCEDURE 56)".


    //Unsupported feature: Code Modification on "IsValidDate(PROCEDURE 56)".

    //procedure IsValidDate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    InvtPeriod.SetFilter("Ending Date",'>=%1',EndingDate);
    InvtPeriod.SetRange(Closed,true);
    if InvtPeriod.FindLast then
      EndingDate := InvtPeriod."Ending Date"
    else
      exit(true);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //++Arbu
    if not (rstSeguridadUsuario.fntSeguridadPermiso(UserId,rstSeguridad.FieldNo(rstSeguridad."Ignorar validación período inv"))) then
    begin
    //--Arbu
    #1..6
    //++Arbu
    end
    else
      exit(true);
    //++Arbu
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text003 : ENU=You cannot post before %1 because the %2 is already closed. You must re-open the period first.;ESP=No puede realizar el registro antes del %1 porque el %2 ya está cerrado. Reabra primero el periodo.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : ENU=You cannot post before %1 because the %2 is already closed. You must re-open the period first.;ESP=No puede realizar el registro antes del %1 porque el %2 ya está cerrado. Reabra primero el periodo.;
    //Variable type has not been exported.
}

