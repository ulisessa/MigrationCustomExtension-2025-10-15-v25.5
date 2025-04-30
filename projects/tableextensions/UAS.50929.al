tableextension 50929 tableextension50929 extends "Service Item Component"
{
    fields
    {
        modify("Parent Service Item No.")
        {
            Caption = 'Parent Service Item No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Date Installed")
        {
            Caption = 'Date Installed';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Serial No.")
        {
            Caption = 'Serial No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Description 2")
        {
            Caption = 'Description 2';
        }
        modify("Service Order No.")
        {
            Caption = 'Service Order No.';
        }
        modify("From Line No.")
        {
            Caption = 'From Line No.';
        }
        modify("Last Date Modified")
        {
            Caption = 'Last Date Modified';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1009)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=Component %1 has replacements\Do you want to delete this Component?;ESP=Componente %1 tiene reposiciónes\¿Quiere borrar este componente?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=Component %1 has replacements\Do you want to delete this Component?;ESP=Componente %1 tiene reposiciónes\?Quiere borrar este componente?;
    //Variable type has not been exported.
}

