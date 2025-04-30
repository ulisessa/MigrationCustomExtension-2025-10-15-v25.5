tableextension 50828 tableextension50828 extends "Item Substitution"
{
    Caption = 'Item Substitution';
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Substitute No.")
        {
            Caption = 'Substitute No.';
        }
        modify("Substitute Variant Code")
        {
            Caption = 'Substitute Variant Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify(Condition)
        {
            Caption = 'Condition';
        }
        modify("Location Filter")
        {
            Caption = 'Location Filter';
        }
        modify("Sub. Item No.")
        {
            Caption = 'Sub. Item No.';
        }
        modify("Quantity Avail. on Shpt. Date")
        {
            Caption = 'Quantity Avail. on Shpt. Date';
        }
        modify("Shipment Date")
        {
            Caption = 'Shipment Date';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=You can not set up an item to be substituted by itself.;ESP=Un producto no puede ser sustituido por él mismo.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=You can not set up an item to be substituted by itself.;ESP=Un producto no puede ser sustituido por él mismo.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=Do you want to delete the corresponding substitute?;ESP=¿Confirma que desea borrar el sustitutivo correspondiente?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=Do you want to delete the corresponding substitute?;ESP=?Confirma que desea borrar el sustitutivo correspondiente?;
    //Variable type has not been exported.
}

