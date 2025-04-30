tableextension 50252 tableextension50252 extends "Deferral Line"
{
    Caption = 'Deferral Line';
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
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Currency Code")
        {
            Caption = 'Currency Code';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "InvalidPostingDateErr(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //InvalidPostingDateErr : @@@="%1=The date passed in for the posting date.";ENU=%1 is not within the range of posting dates for your company.;ESP=%1 no está dentro del intervalo de fechas de registro de la empresa.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //InvalidPostingDateErr : @@@="%1=The date passed in for the posting date.";ENU=%1 is not within the range of posting dates for your company.;ESP=%1 no está dentro del intervalo de fechas de registro de la empresa.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "DeferSchedOutOfBoundsErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //DeferSchedOutOfBoundsErr : ENU=The deferral schedule falls outside the accounting periods that have been set up for the company.;ESP=La previsión de fraccionamiento está fuera de los períodos de contabilidad configurados para la empresa.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DeferSchedOutOfBoundsErr : ENU=The deferral schedule falls outside the accounting periods that have been set up for the company.;ESP=La previsión de fraccionamiento está fuera de los períodos de contabilidad configurados para la empresa.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "InvalidDeferralLineDateErr(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //InvalidDeferralLineDateErr : ENU=The posting date for this deferral schedule line is not valid.;ESP=La fecha de registro de esta línea de previsión de fraccionamiento no es válido.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //InvalidDeferralLineDateErr : ENU=The posting date for this deferral schedule line is not valid.;ESP=La fecha de registro de esta línea de previsión de fraccionamiento no es válido.;
    //Variable type has not been exported.
}

