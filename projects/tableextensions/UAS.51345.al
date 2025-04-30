tableextension 51345 tableextension51345 extends "Quality Measure"
{
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "CannotDeleteRecProdOrderErr(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotDeleteRecProdOrderErr : ENU=You cannot delete the Quality Measure because it is being used on one or more active Production Orders.;ESP=No puede eliminar la medida de calidad porque está en uso en una o varias órdenes de producción activas.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotDeleteRecProdOrderErr : ENU=You cannot delete the Quality Measure because it is being used on one or more active Production Orders.;ESP=No puede eliminar la medida de calidad porque está en uso en una o varias órdenes de producción activas.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CannotDeleteRecActRoutingErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotDeleteRecActRoutingErr : ENU=You cannot delete the Quality Measure because it is being used on one or more active Routings.;ESP=No puede eliminar la medida de calidad porque está en uso en una o varias rutas activas.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotDeleteRecActRoutingErr : ENU=You cannot delete the Quality Measure because it is being used on one or more active Routings.;ESP=No puede eliminar la medida de calidad porque está en uso en una o varias rutas activas.;
    //Variable type has not been exported.
}

