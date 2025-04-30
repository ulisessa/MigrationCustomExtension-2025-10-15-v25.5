tableextension 50831 tableextension50831 extends "Nonstock Item"
{

    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Manufacturer Code")
        {
            Caption = 'Manufacturer Code';
        }
        modify("Vendor No.")
        {
            Caption = 'Vendor No.';
        }
        modify("Vendor Item No.")
        {
            Caption = 'Vendor Item No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Last Date Modified")
        {
            Caption = 'Last Date Modified';
        }
        modify("Bar Code")
        {
            Caption = 'Bar Code';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=Modification not allowed, item record already exists.;ESP=Modificación no permitida, el producto ya existe.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=Modification not allowed, item record already exists.;ESP=Modificación no permitida, el producto ya existe.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1010)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU="No.=<%1> and Vendor Item No.=<%2> already exists.";ESP="Ya existen No.=<%1> y Cód. producto proveedor.=<%2>.";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU="No.=<%1> and Vendor Item No.=<%2> already exists.";ESP="Ya existen N?=<%1> y Cód. producto proveedor.=<%2>.";
    //Variable type has not been exported.
}

