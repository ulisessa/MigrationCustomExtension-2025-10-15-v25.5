tableextension 50393 tableextension50393 extends "Extended Text Header"
{
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Language Code")
        {
            Caption = 'Language Code';
        }
        modify("Text No.")
        {
            Caption = 'Text No.';
        }
        modify("All Language Codes")
        {
            Caption = 'All Language Codes';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Finance Charge Memo")
        {
            Caption = 'Finance Charge Memo';
        }
        modify("Sales Return Order")
        {
            Caption = 'Sales Return Order';
        }
        modify("Purchase Return Order")
        {
            Caption = 'Purchase Return Order';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "UntitledMsg(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //UntitledMsg : ENU=untitled;ESP=SinTítulo;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UntitledMsg : ENU=untitled;ESP=SinT?tulo;
    //Variable type has not been exported.
}

