tableextension 50030 "AEAT Transference Format Ext." extends "AEAT Transference Format"
{
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify(Position)
        {
            Caption = 'Position';
        }
        modify(Type)
        {
            OptionCaption = 'Alphanumerical,Numerical,Fix,Ask,Currency';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text1100001(Variable 1100002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text1100001 : ENU=The value typed is longer than the maximum length allowed;ESP=El valor especificado supera la longitud máxima permitida;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text1100001 : ENU=The value typed is longer than the maximum length allowed;ESP=El valor especificado supera la longitud máxima permitida;
    //Variable type has not been exported.
}

