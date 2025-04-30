tableextension 51028 tableextension51028 extends "Fee Range"
{
    Caption = 'Fee Range';
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
        modify("Type of Fee")
        {
            Caption = 'Type of Fee';
            OptionCaption = 'Collection Expenses,Discount Expenses,Discount Interests,Rejection Expenses,Payment Order Expenses,Unrisked Factoring Expenses,Risked Factoring Expenses ';
        }
        modify("From No. of Days")
        {
            Caption = 'From No. of Days';
        }
        modify("Minimum Amount")
        {
            Caption = 'Minimum Amount';
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

