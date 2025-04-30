tableextension 51362 tableextension51362 extends "Production Forecast Name"
{
    Caption = 'Demand Forecast Name';
    fields
    {
        modify(Description)
        {
            Caption = 'Description';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Confirm001Qst(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Confirm001Qst : @@@="%1 = forecast name";ENU=Demand forecast %1 has entries. Do you want to delete it anyway?;ESP=La previsión de la demanda %1 tiene entradas. ¿Desea eliminarlo de todas maneras?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Confirm001Qst : @@@="%1 = forecast name";ENU=Demand forecast %1 has entries. Do you want to delete it anyway?;ESP=La previsión de la demanda %1 tiene entradas. ?Desea eliminarlo de todas maneras?;
    //Variable type has not been exported.
}

