tableextension 51089 tableextension51089 extends "Whse. Internal Put-away Line"
{
    Caption = 'Whse. Internal Put-away Line';
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Shelf No.")
        {
            Caption = 'Shelf No.';
        }
        modify("From Bin Code")
        {
            Caption = 'From Bin Code';
        }
        modify("From Zone Code")
        {
            Caption = 'From Zone Code';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Put-away Qty.")
        {
            Caption = 'Put-away Qty.';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Description 2")
        {
            Caption = 'Description 2';
        }
        modify("Sorting Sequence No.")
        {
            Caption = 'Sorting Sequence No.';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text004(Variable 1009)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text004 : ENU="%1 = %2 is less than the %3 = %4.\Do you really want to delete the %5?";ESP="%1 = %2 es menor que el %3 = %4.\¿Desea eliminar el %5?";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text004 : ENU="%1 = %2 is less than the %3 = %4.\Do you really want to delete the %5?";ESP="%1 = %2 es menor que el %3 = %4.\?Desea eliminar el %5?";
    //Variable type has not been exported.
}

