tableextension 50983 tableextension50983 extends "Item Tracking Code"
{
    Caption = 'Item Tracking Code';
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
        modify("Warranty Date Formula")
        {
            Caption = 'Warranty Date Formula';
        }
        modify("Man. Warranty Date Entry Reqd.")
        {
            Caption = 'Man. Warranty Date Entry Reqd.';
        }
        modify("SN Specific Tracking")
        {
            Caption = 'SN Specific Tracking';
        }
        modify("SN Warehouse Tracking")
        {
            Caption = 'SN Warehouse Tracking';
        }
        modify("SN Transfer Tracking")
        {
            Caption = 'SN Transfer Tracking';
        }
        modify("Lot Specific Tracking")
        {
            Caption = 'Lot Specific Tracking';
        }
        modify("Lot Warehouse Tracking")
        {
            Caption = 'Lot Warehouse Tracking';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=You cannot delete %1 %2 because it is used on one or more items.;ESP=No puede eliminar %1 %2 porque se usa en uno o más elementos.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=You cannot delete %1 %2 because it is used on one or more items.;ESP=No puede eliminar %1 %2 porque se usa en uno o más elementos.;
    //Variable type has not been exported.
}

