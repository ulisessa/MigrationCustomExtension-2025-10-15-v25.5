tableextension 50771 tableextension50771 extends "VAT Rate Change Conversion"
{
    Caption = 'VAT Rate Change Conversion';
    fields
    {
        modify("From Code")
        {
            Caption = 'From Code';
        }
        modify("To Code")
        {
            Caption = 'To Code';
        }
        modify("Converted Date")
        {
            Caption = 'Converted Date';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text0001(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text0001 : ENU=This entry will create a loop with the entry where the %1 field is set to %2.;ESP=Este movimiento creará un bucle con el movimiento en el que el campo %1 se establece en %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text0001 : ENU=This entry will create a loop with the entry where the %1 field is set to %2.;ESP=Este movimiento creará un bucle con el movimiento en el que el campo %1 se establece en %2.;
    //Variable type has not been exported.
}

