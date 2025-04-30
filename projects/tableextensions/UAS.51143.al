tableextension 51143 tableextension51143 extends "Miniform Line"
{
    Caption = 'Miniform Line';
    fields
    {
        modify("Miniform Code")
        {
            Caption = 'Miniform Code';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Table No.")
        {
            Caption = 'Table No.';
        }
        modify("Field No.")
        {
            Caption = 'Field No.';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : @@@="%1 = Field type, %2= Form Type field caption, %3 = Form type";ENU=%1 not allowed for %2 %3.;ESP=%1 no está permitido para %2 %3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : @@@="%1 = Field type, %2= Form Type field caption, %3 = Form type";ENU=%1 not allowed for %2 %3.;ESP=%1 no está permitido para %2 %3.;
    //Variable type has not been exported.
}

