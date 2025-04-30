tableextension 51016 tableextension51016 extends "Posted Bill Group"
{
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Bank Account No.")
        {
            Caption = 'Bank Account No.';
        }
        modify("Dealing Type")
        {
            Caption = 'Dealing Type';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("No. Printed")
        {
            Caption = 'No. Printed';
        }
        modify("Category Filter")
        {
            Caption = 'Category Filter';
        }
        modify("Global Dimension 1 Filter")
        {
            Caption = 'Global Dimension 1 Filter';
        }
        modify("Global Dimension 2 Filter")
        {
            Caption = 'Global Dimension 2 Filter';
        }
        modify("Collection Expenses Amt.")
        {
            Caption = 'Collection Expenses Amt.';
        }
        modify("Discount Expenses Amt.")
        {
            Caption = 'Discount Expenses Amt.';
        }
        modify("Discount Interests Amt.")
        {
            Caption = 'Discount Interests Amt.';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
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

