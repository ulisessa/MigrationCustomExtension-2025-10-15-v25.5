tableextension 50071 tableextension50071 extends "Cost Center"
{
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("Sorting Order")
        {
            Caption = 'Sorting Order';
        }
        modify("Line Type")
        {
            Caption = 'Line Type';
        }
        modify("New Page")
        {
            Caption = 'New Page';
        }
        modify("Blank Line")
        {
            Caption = 'Blank Line';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=There are general ledger entries, cost entries, or cost budget entries that are posted to the selected cost center. Are you sure that you want to delete the cost center?;ESP=Hay movimientos de contabilidad, movimientos de coste o movimientos de presupuesto de costes registrados en el centro de coste seleccionado. ¿Está seguro de que desea eliminar el centro de coste?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=There are general ledger entries, cost entries, or cost budget entries that are posted to the selected cost center. Are you sure that you want to delete the cost center?;ESP=Hay movimientos de contabilidad, movimientos de coste o movimientos de presupuesto de costes registrados en el centro de coste seleccionado. ?está seguro de que desea eliminar el centro de coste?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=There are general ledger entries, cost entries, or cost budget entries that are posted to the selected cost center. Are you sure that you want to modify the cost center?;ESP=Hay movimientos de contabilidad, movimientos de coste o movimientos de presupuesto de costes registrados en el centro de coste seleccionado. ¿Está seguro de que desea modificar el centro de coste?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=There are general ledger entries, cost entries, or cost budget entries that are posted to the selected cost center. Are you sure that you want to modify the cost center?;ESP=Hay movimientos de contabilidad, movimientos de coste o movimientos de presupuesto de costes registrados en el centro de coste seleccionado. ?está seguro de que desea modificar el centro de coste?;
    //Variable type has not been exported.
}

