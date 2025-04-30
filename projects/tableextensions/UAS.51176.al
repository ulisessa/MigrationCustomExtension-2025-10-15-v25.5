tableextension 51176 tableextension51176 extends "Acc. Schedule Name"
{
    fields
    {
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Analysis View Name")
        {
            Caption = 'Analysis View Name';
        }

    }

    //Unsupported feature: Property Modification (TextConstString) on "ClearDimensionTotalingConfirmTxt(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //ClearDimensionTotalingConfirmTxt : ENU=Changing Analysis View will clear differing dimension totaling columns of Account Schedule Lines. \Do you want to continue?;ESP=Al cambiar la vista de análisis se borrarán las diferentes columnas totales de dimensiones de las líneas del esquema de cuentas. \¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ClearDimensionTotalingConfirmTxt : ENU=Changing Analysis View will clear differing dimension totaling columns of Account Schedule Lines. \Do you want to continue?;ESP=Al cambiar la vista de análisis se borrarán las diferentes columnas totales de dimensiones de las líneas del esquema de cuentas. \?Desea continuar?;
    //Variable type has not been exported.
}

