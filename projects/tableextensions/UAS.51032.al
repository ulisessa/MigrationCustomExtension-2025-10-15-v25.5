tableextension 51032 tableextension51032 extends "Customer Rating"
{
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("Customer No.")
        {
            Caption = 'Customer No.';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text1100000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text1100000 : ENU=untitled;ESP=sin título;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text1100000 : ENU=untitled;ESP=sin título;
    //Variable type has not been exported.
}

