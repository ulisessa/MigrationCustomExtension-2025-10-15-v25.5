tableextension 50840 tableextension50840 extends "Transfer Route"
{
    fields
    {
        modify("Transfer-from Code")
        {
            Caption = 'Transfer-from Code';
        }
        modify("Transfer-to Code")
        {
            Caption = 'Transfer-to Code';
        }
        modify("In-Transit Code")
        {
            Caption = 'In-Transit Code';
        }
        modify("Shipping Agent Code")
        {
            Caption = 'Shipping Agent Code';
        }
        modify("Shipping Agent Service Code")
        {
            Caption = 'Shipping Agent Service Code';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text003 : ENU=The receipt date must be greater or equal to the shipment date.;ESP=La fecha de recepción debe ser igual o posterior a la fecha de envío.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : ENU=The receipt date must be greater or equal to the shipment date.;ESP=La fecha de recepción debe ser igual o posterior a la fecha de envío.;
    //Variable type has not been exported.
}

