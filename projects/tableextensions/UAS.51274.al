tableextension 51274 tableextension51274 extends "Generic Chart Memo Buffer"
{
    Caption = 'Generic Chart Memo Buffer';
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("Language Code")
        {
            Caption = 'Language Code';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "TextMemoToBeTruncatedMsg(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //TextMemoToBeTruncatedMsg : ENU=The length of the text that you entered is %1. The maximum length is %2. The text has been truncated to this length.;ESP=La longitud del texto introducido es %1. La longitud máxima es %2. El texto se ha truncado a esa longitud.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TextMemoToBeTruncatedMsg : ENU=The length of the text that you entered is %1. The maximum length is %2. The text has been truncated to this length.;ESP=La longitud del texto introducido es %1. La longitud máxima es %2. El texto se ha truncado a esa longitud.;
    //Variable type has not been exported.
}

