tableextension 51203 tableextension51203 extends "Config. Template Header"
{
    Caption = 'Config. Template Header';
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
        modify("Table Caption")
        {
            Caption = 'Table Caption';
        }
        modify("Used In Hierarchy")
        {
            Caption = 'Used In Hierarchy';
        }
        modify("Instance No. Series")
        {
            Caption = 'Instance No. Series';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=Template lines that relate to %1 exists. Delete the lines to change the Table ID.;ESP=Existen líneas plantilla relacionadas con %1. Elimine las líneas para cambiar el Id. de tabla.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=Template lines that relate to %1 exists. Delete the lines to change the Table ID.;ESP=Existen líneas plantilla relacionadas con %1. Elimine las líneas para cambiar el Id. de tabla.;
    //Variable type has not been exported.
}

