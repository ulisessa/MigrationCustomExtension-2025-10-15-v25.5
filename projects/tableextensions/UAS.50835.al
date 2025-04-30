tableextension 50835 tableextension50835 extends Purchasing
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
        modify("Drop Shipment")
        {
            Caption = 'Drop Shipment';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=This purchasing code may be either a Drop Ship, or a Special Order.;ESP=Este cód. compra puede ser o un envío directo, o un ped. especial.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=This purchasing code may be either a Drop Ship, or a Special Order.;ESP=Este Cód. compra puede ser o un envío directo, o un ped. especial.;
    //Variable type has not been exported.
}

