tableextension 50825 tableextension50825 extends "Stockkeeping Unit"
{
    fields
    {
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Description 2")
        {
            Caption = 'Description 2';
        }
        modify("Shelf No.")
        {
            Caption = 'Shelf No.';
        }
        modify("Standard Cost")
        {
            Caption = 'Standard Cost';
        }
        modify("Last Direct Cost")
        {
            Caption = 'Last Direct Cost';
        }
        modify("Vendor No.")
        {
            Caption = 'Vendor No.';
        }
        modify("Vendor Item No.")
        {
            Caption = 'Vendor Item No.';
        }
        modify("Lead Time Calculation")
        {
            Caption = 'Lead Time Calculation';
        }
        modify("Maximum Inventory")
        {
            Caption = 'Maximum Inventory';
        }
        modify("Last Date Modified")
        {
            Caption = 'Last Date Modified';
        }
        modify("Global Dimension 1 Filter")
        {
            Caption = 'Global Dimension 1 Filter';
        }
        modify("Global Dimension 2 Filter")
        {
            Caption = 'Global Dimension 2 Filter';
        }
        modify("Drop Shipment Filter")
        {
            Caption = 'Drop Shipment Filter';
        }
        modify("Transfer-Level Code")
        {
            Caption = 'Transfer-Level Code';
        }
        modify("Lot Size")
        {
            Caption = 'Lot Size';
        }
        modify("Minimum Order Quantity")
        {
            Caption = 'Minimum Order Quantity';
        }
        modify("Maximum Order Quantity")
        {
            Caption = 'Maximum Order Quantity';
        }
        modify("Order Multiple")
        {
            Caption = 'Order Multiple';
        }
        modify("Flushing Method")
        {
            Caption = 'Flushing Method';
        }
        modify("Replenishment System")
        {
            Caption = 'Replenishment System';
        }
        modify("Scheduled Receipt (Qty.)")
        {
            Caption = 'Scheduled Receipt (Qty.)';
        }
        modify("Bin Filter")
        {
            Caption = 'Bin Filter';
        }
        modify("Manufacturing Policy")
        {
            Caption = 'Manufacturing Policy';
        }
        modify("Rescheduling Period")
        {
            Caption = 'Rescheduling Period';
        }
        modify("Lot Accumulation Period")
        {
            Caption = 'Lot Accumulation Period';
        }
        modify("Transfer-from Code")
        {
            Caption = 'Transfer-from Code';
        }
        modify("Qty. in Transit")
        {
            Caption = 'Qty. in Transit';
        }
        modify("Trans. Ord. Shipment (Qty.)")
        {
            Caption = 'Trans. Ord. Shipment (Qty.)';
        }
        modify("Special Equipment Code")
        {
            Caption = 'Special Equipment Code';
        }
        modify("Put-away Template Code")
        {
            Caption = 'Put-away Template Code';
        }
        modify("Put-away Unit of Measure Code")
        {
            Caption = 'Put-away Unit of Measure Code';
        }
        modify("Phys Invt Counting Period Code")
        {
            Caption = 'Phys Invt Counting Period Code';
        }
        modify("Last Counting Period Update")
        {
            Caption = 'Last Counting Period Update';
        }
        modify("Last Phys. Invt. Date")
        {
            Caption = 'Last Phys. Invt. Date';
        }
        modify("Use Cross-Docking")
        {
            Caption = 'Use Cross-Docking';
        }
        modify("Qty. on Component Lines")
        {
            Caption = 'Qty. on Component Lines';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text003 : ENU=Do you want to change %1?;ESP=¿Confirma que desea cambiar %1?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : ENU=Do you want to change %1?;ESP=?Confirma que desea cambiar %1?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text008(Variable 1013)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text008 : ENU=You cannot change %1 because there are one or more ledger entries for this SKU.;ESP=No puede cambiar %1 porque hay uno o más movs. para esta ud. de almacenam.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text008 : ENU=You cannot change %1 because there are one or more ledger entries for this SKU.;ESP=No puede cambiar %1 porque hay uno o más movs. para esta ud. de almacenam.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text7380(Variable 1015)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text7380 : @@@=If you change the Phys Invt Counting Period Code, the Next Counting Start Date and Next Counting End Date are calculated.\Do you still want to change the Phys Invt Counting Period Code?;ENU=If you change the %1, the %2 and %3 are calculated.\Do you still want to change the %1?;ESP=Si cambia el %1, se calculan el %2 y el %3.\¿Desea cambiar el %1?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text7380 : @@@=If you change the Phys Invt Counting Period Code, the Next Counting Start Date and Next Counting End Date are calculated.\Do you still want to change the Phys Invt Counting Period Code?;ENU=If you change the %1, the %2 and %3 are calculated.\Do you still want to change the %1?;ESP=Si cambia el %1, se calculan el %2 y el %3.\?Desea cambiar el %1?;
    //Variable type has not been exported.
}

