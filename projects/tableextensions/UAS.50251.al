tableextension 50251 tableextension50251 extends "Deferral Header"
{
    fields
    {
        modify("Gen. Jnl. Batch Name")
        {
            Caption = 'Gen. Jnl. Batch Name';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Deferral Code")
        {
            Caption = 'Deferral Code';
        }
        modify("Calc. Method")
        {
            Caption = 'Calc. Method';
        }
        modify("No. of Periods")
        {
            Caption = 'No. of Periods';
        }
        modify("Schedule Description")
        {
            Caption = 'Schedule Description';
        }
        modify("Currency Code")
        {
            Caption = 'Currency Code';
        }
        modify("Schedule Line Total")
        {
            Caption = 'Schedule Line Total';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "AmountToDeferErr(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //AmountToDeferErr : ENU=The deferred amount cannot be greater than the document line amount.;ESP=El importe fraccionado no puede ser mayor que el importe de línea de documento.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AmountToDeferErr : ENU=The deferred amount cannot be greater than the document line amount.;ESP=El importe fraccionado no puede ser mayor que el importe de línea de documento.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "InvalidPostingDateErr(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //InvalidPostingDateErr : @@@="%1=The date passed in for the posting date.";ENU=%1 is not within the range of posting dates for your company.;ESP=%1 no está dentro del intervalo de fechas de registro de la empresa.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //InvalidPostingDateErr : @@@="%1=The date passed in for the posting date.";ENU=%1 is not within the range of posting dates for your company.;ESP=%1 no está dentro del intervalo de fechas de registro de la empresa.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "DeferSchedOutOfBoundsErr(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //DeferSchedOutOfBoundsErr : ENU=The deferral schedule falls outside the accounting periods that have been set up for the company.;ESP=La previsión de fraccionamiento está fuera de los períodos de contabilidad configurados para la empresa.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DeferSchedOutOfBoundsErr : ENU=The deferral schedule falls outside the accounting periods that have been set up for the company.;ESP=La previsión de fraccionamiento está fuera de los períodos de contabilidad configurados para la empresa.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "SelectionMsg(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //SelectionMsg : ENU=You must specify a deferral code for this line before you can view the deferral schedule.;ESP=Debe especificar un código de fraccionamiento para esta línea para poder ver la previsión de fraccionamiento.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SelectionMsg : ENU=You must specify a deferral code for this line before you can view the deferral schedule.;ESP=Debe especificar un código de fraccionamiento para esta línea para poder ver la previsión de fraccionamiento.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "NumberofPeriodsErr(Variable 1007)".

    //var
    //>>>> ORIGINAL VALUE:
    //NumberofPeriodsErr : ENU=You must specify one or more periods.;ESP=Debe especificar uno o más periodos.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NumberofPeriodsErr : ENU=You must specify one or more periods.;ESP=Debe especificar uno o más periodos.;
    //Variable type has not been exported.
}

