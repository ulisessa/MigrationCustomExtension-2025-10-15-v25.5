tableextension 51327 tableextension51327 extends "Routing Header"
{
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Description 2")
        {
            Caption = 'Description 2';
        }
        modify("Search Description")
        {
            Caption = 'Search Description';
        }
        modify("Last Date Modified")
        {
            Caption = 'Last Date Modified';
        }
        modify("Version Nos.")
        {
            Caption = 'Version Nos.';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=This Routing is being used on Items.;ESP=Esta ruta se está utilizando con productos.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=This Routing is being used on Items.;ESP=Esta ruta se está utilizando con productos.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=All versions attached to the routing will be closed. Close routing?;ESP=Se cerrarán todas las versiones asociadas con la ruta. ¿Se cierra la ruta?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=All versions attached to the routing will be closed. Close routing?;ESP=Se cerrarán todas las versiones asociadas con la ruta. ?Se cierra la ruta?;
    //Variable type has not been exported.
}

