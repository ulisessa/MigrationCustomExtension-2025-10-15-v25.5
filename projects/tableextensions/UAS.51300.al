tableextension 51300 tableextension51300 extends "Report Layout Selection"
{
    Caption = 'Report Layout Selection';
    fields
    {
        modify(Type)
        {
            OptionCaption = 'RDLC (built-in),Word (built-in),Custom Layout';
        }
        modify("Custom Report Layout Code")
        {
            Caption = 'Custom Report Layout Code';
        }
        modify("Report Layout Description")
        {
            Caption = 'Report Layout Description';
        }
        modify("Report Caption")
        {
            Caption = 'Report Caption';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "NoRdlcLayoutErr(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //NoRdlcLayoutErr : @@@="%1=a report name";ENU=Report '%1' has no built-in RDLC layout.;ESP=El informe '%1' no tiene ningún diseño de RDLC integrado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NoRdlcLayoutErr : @@@="%1=a report name";ENU=Report '%1' has no built-in RDLC layout.;ESP=El informe '%1' no tiene ningún diseño de RDLC integrado.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "NoWordLayoutErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //NoWordLayoutErr : @@@="%1=a report name";ENU=Report '%1' has no built-in Word layout.;ESP=El informe '%1' no tiene un diseño de Word integrado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NoWordLayoutErr : @@@="%1=a report name";ENU=Report '%1' has no built-in Word layout.;ESP=El informe '%1' no tiene un diseño de Word integrado.;
    //Variable type has not been exported.
}

