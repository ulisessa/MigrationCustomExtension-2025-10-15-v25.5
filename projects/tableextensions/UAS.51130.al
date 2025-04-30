tableextension 51130 tableextension51130 extends "Standard Item Journal"
{
    Caption = 'Standard Item Journal';
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

    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=Getting Standard Item Journal Lines @1@@@@@@@;ESP=Obteniendo líneas diario productos estándar @1@@@@@@@;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=Getting Standard Item Journal Lines @1@@@@@@@;ESP=Obteniendo líneas diario productos estándar @1@@@@@@@;
    //Variable type has not been exported.
}

