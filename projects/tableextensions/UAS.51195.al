tableextension 51195 tableextension51195 extends "Config. Questionnaire"
{
    Caption = 'Config. Questionnaire';
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
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=You cannot rename a configuration questionnaire.;ESP=No puede cambiar el nombre de un cuestionario de configuración.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=You cannot rename a configuration questionnaire.;ESP=No puede cambiar el nombre de un cuestionario de configuración.;
    //Variable type has not been exported.
}

