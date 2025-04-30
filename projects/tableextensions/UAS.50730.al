tableextension 50730 tableextension50730 extends "Item Variant"
{
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Description 2")
        {
            Caption = 'Description 2';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=You cannot delete item variant %1 because there is at least one %2 that includes this Variant Code.;ESP=No puede eliminar la variante de producto %1 porque hay al menos una %2 que incluye este Cód. variante.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=You cannot delete item variant %1 because there is at least one %2 that includes this Variant Code.;ESP=No puede eliminar la variante de producto %1 porque hay al menos una %2 que incluye este Cód. variante.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=You cannot delete item variant %1 because there are one or more outstanding production orders that include this item.;ESP=No puede eliminar la variante de producto %1 porque hay órdenes de producción pendientes que incluyen este producto.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=You cannot delete item variant %1 because there are one or more outstanding production orders that include this item.;ESP=No puede eliminar la variante de producto %1 porque hay órdenes de producción pendientes que incluyen este producto.;
    //Variable type has not been exported.
}

