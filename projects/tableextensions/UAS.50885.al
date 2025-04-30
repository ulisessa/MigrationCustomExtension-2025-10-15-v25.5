tableextension 50885 tableextension50885 extends "Phys. Invt. Record Line"
{
    Caption = 'Phys. Invt. Record Line';
    fields
    {
        modify("Order No.")
        {
            Caption = 'Order No.';
        }
        modify("Recording No.")
        {
            Caption = 'Recording No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Order Line No.")
        {
            Caption = 'Order Line No.';
        }
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
        modify("Bin Code")
        {
            Caption = 'Bin Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Description 2")
        {
            Caption = 'Description 2';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Shelf No.")
        {
            Caption = 'Shelf No.';
        }
        modify("Person Recorded")
        {
            Caption = 'Person Recorded';
        }
        modify("Serial No.")
        {
            Caption = 'Serial No.';
        }
        modify("Lot No.")
        {
            Caption = 'Lot No.';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "SerialNoAlreadyExistErr(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //SerialNoAlreadyExistErr : @@@="%1 = serial no. %2 = item no.";ENU=Serial No. %1 for item %2 already exists.;ESP=El N.º serie %1 para el producto %2 ya existe.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SerialNoAlreadyExistErr : @@@="%1 = serial no. %2 = item no.";ENU=Serial No. %1 for item %2 already exists.;ESP=El No. serie %1 para el producto %2 ya existe.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "QuantityCannotBeErr(Variable 1009)".

    //var
    //>>>> ORIGINAL VALUE:
    //QuantityCannotBeErr : ENU=Quantity cannot be larger than 1 when Serial No. is assigned.;ESP=La cantidad no puede ser mayor que 1 cuando se asigna el N.º serie.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //QuantityCannotBeErr : ENU=Quantity cannot be larger than 1 when Serial No. is assigned.;ESP=La cantidad no puede ser mayor que 1 cuando se asigna el No. serie.;
    //Variable type has not been exported.
}

