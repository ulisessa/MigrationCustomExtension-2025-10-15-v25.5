tableextension 51331 tableextension51331 extends "Production BOM Header"
{
    Caption = 'Production BOM Header';
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
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Low-Level Code")
        {
            Caption = 'Low-Level Code';
        }
        modify("Creation Date")
        {
            Caption = 'Creation Date';
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
    //Text000 : ENU=This Production BOM is being used on Items.;ESP=Esta L.M. producción se utiliza en productos.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=This Production BOM is being used on Items.;ESP=Esta L.M. producción se utiliza en productos.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=All versions attached to the BOM will be closed. Close BOM?;ESP=Se cerrarán todas las versiones asociadas con la L.M. ¿Se cierra la L.M.?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=All versions attached to the BOM will be closed. Close BOM?;ESP=Se cerrarán todas las versiones asociadas con la L.M. ?Se cierra la L.M.?;
    //Variable type has not been exported.
}

