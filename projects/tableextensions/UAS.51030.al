tableextension 51030 tableextension51030 extends "Posted Payment Order"
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
        modify("Payment Order Expenses Amt.")
        {
            Caption = 'Payment Order Expenses Amt.';
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

