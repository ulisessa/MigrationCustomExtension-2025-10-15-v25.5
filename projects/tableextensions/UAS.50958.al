tableextension 50958 tableextension50958 extends "Standard Service Code"
{
    Caption = 'Standard Service Code';
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
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=If you change the %1, the %2 will be rounded according to the new %3.;ESP=Si cambia el %1, el %2 será redondeado con el nuevo %3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=If you change the %1, the %2 will be rounded according to the new %3.;ESP=Si cambia el %1, el %2 será redondeado con el nuevo %3.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=The update has been interrupted to respect the warning.;ESP=Se ha interrumpido la actualización para respetar la advertencia.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=The update has been interrupted to respect the warning.;ESP=Se ha interrumpido la actualización para respetar la advertencia.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text003 : ENU=%1 of the standard service code must be equal to %2 on the %3.;ESP=%1 del código servicio estándar debe ser igual a %2 en %3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : ENU=%1 of the standard service code must be equal to %2 on the %3.;ESP=%1 del código servicio estándar debe ser igual a %2 en %3.;
    //Variable type has not been exported.
}

