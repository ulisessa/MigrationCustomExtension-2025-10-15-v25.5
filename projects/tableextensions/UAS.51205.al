tableextension 51205 tableextension51205 extends "Config. Tmpl. Selection Rules"
{
    Caption = 'Config. Tmpl. Selection Rules';
    fields
    {
        modify("Template Code")
        {
            Caption = 'Template Code';
        }
        modify("Selection Criteria")
        {
            Caption = 'Selection Criteria';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Page ID")
        {
            Caption = 'Page ID';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "DefineFiltersTxt(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //DefineFiltersTxt : ENU=Specify criteria for when the template will be applied.;ESP=Especificar criterios de cuándo se aplicará la plantilla.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DefineFiltersTxt : ENU=Specify criteria for when the template will be applied.;ESP=Especificar criterios de cuándo se aplicará la plantilla.;
    //Variable type has not been exported.
}

