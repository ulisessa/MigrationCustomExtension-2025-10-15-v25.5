tableextension 51064 tableextension51064 extends "Bin Type"
{
    Caption = 'Bin Type';
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
        modify(Receive)
        {
            Caption = 'Receive';
        }
        modify(Ship)
        {
            Caption = 'Ship';
        }
        modify("Put Away")
        {
            Caption = 'Put Away';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=This combination already exists for %1 %2.;ESP=Ya existe esta combinación para %1 %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=This combination already exists for %1 %2.;ESP=Ya existe esta combinación para %1 %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text003 : ENU=The %1 filter expression is too long.\Please use less Bin Types or shorter %1 Codes.;ESP=La expresión filtro %1 es demasiado larga.\Utilice menos tipos de ubicación o reduzca %1 códigos.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : ENU=The %1 filter expression is too long.\Please use less Bin Types or shorter %1 Codes.;ESP=La expresión filtro %1 es demasiado larga.\Utilice menos tipos de ubicación o reduzca %1 Códigos.;
    //Variable type has not been exported.
}

