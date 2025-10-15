tableextension 50246 "Option Lookup Buffer Ext." extends "Option Lookup Buffer"
{
    Caption = 'Option Lookup Buffer';
    fields
    {
        modify("Option Caption")
        {
            Caption = 'Option Values';
        }
        modify("Lookup Type")
        {
            Caption = 'Lookup Type';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "UnsupportedTypeErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //UnsupportedTypeErr : ENU=Unsupported Lookup Type.;ESP=Tipo de búsqueda no admitida.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UnsupportedTypeErr : ENU=Unsupported Lookup Type.;ESP=Tipo de búsqueda no admitida.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "InvalidTypeErr(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //InvalidTypeErr : @@@="%1 = Type caption. Fx. Item";ENU='%1' is not a valid type for this document.;ESP="""%1"" no es un tipo válido para este documento.";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //InvalidTypeErr : @@@="%1 = Type caption. Fx. Item";ENU='%1' is not a valid type for this document.;ESP="""%1"" no es un tipo válido para este documento.";
    //Variable type has not been exported.
}

