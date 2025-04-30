tableextension 51121 tableextension51121 extends "Standard General Journal"
{
    Caption = 'Standard General Journal';
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
    //Text000 : ENU=Getting Standard General Journal Lines @1@@@@@@@;ESP=Obteniendo líneas diario general estándar @1@@@@@@@;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=Getting Standard General Journal Lines @1@@@@@@@;ESP=Obteniendo líneas diario general estándar @1@@@@@@@;
    //Variable type has not been exported.
}

