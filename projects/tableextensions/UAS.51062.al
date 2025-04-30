tableextension 51062 tableextension51062 extends "Warehouse Employee"
{
    Caption = 'Warehouse Employee';
    fields
    {
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify(Default)
        {
            Caption = 'Default';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=You can only have one default location per user ID.;ESP=Solo puede tener un almacén genérico por id. de usuario.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=You can only have one default location per user ID.;ESP=Solo puede tener un almacén genérico por id. de usuario.;
    //Variable type has not been exported.
}

