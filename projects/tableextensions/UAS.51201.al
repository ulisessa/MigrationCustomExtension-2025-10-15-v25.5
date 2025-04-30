tableextension 51201 tableextension51201 extends "Config. Package Field"
{
    Caption = 'Config. Package Field';
    fields
    {
        modify("Package Code")
        {
            Caption = 'Package Code';
        }
        modify("Field Caption")
        {
            Caption = 'Field Caption';
        }
        modify("Relation Table Caption")
        {
            Caption = 'Relation Table Caption';
        }
        modify(Dimension)
        {
            Caption = 'Dimension';
        }
        modify("Create Missing Codes")
        {
            Caption = 'Create Missing Codes';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=Updating validation errors;ESP=Actualizando errores de validación;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=Updating validation errors;ESP=Actualizando errores de validación;
    //Variable type has not been exported.
}

