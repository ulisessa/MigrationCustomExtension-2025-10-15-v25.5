tableextension 50483 tableextension50483 extends "Dimension Selection Buffer"
{
    Caption = 'Dimension Selection Buffer';
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("New Dimension Value Code")
        {
            Caption = 'New Dimension Value Code';
        }
        modify("Dimension Value Filter")
        {
            Caption = 'Dimension Value Filter';
        }
        modify("Filter Lookup Table No.")
        {
            Caption = 'Filter Lookup Table No.';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=Another user has modified the selected dimensions for the %1 field after you retrieved it from the database.\;ESP=Otro usuario ha modificado las dimensiones seleccionadas para el campo %1 después de que usted las sacara .\;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=Another user has modified the selected dimensions for the %1 field after you retrieved it from the database.\;ESP=Otro usuario ha modificado las dimensiones seleccionadas para el campo %1 después de que usted las sacara .\;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU="Enter your changes again in the Dimension Selection window by clicking the AssistButton on the %1 field. ";ESP="Introd. de nuevo sus cambios en ventana Selección dimensión haciendo clic en el AssistButton en el campo %1. ";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU="Enter your changes again in the Dimension Selection window by clicking the AssistButton on the %1 field. ";ESP="Introd. de nuevo sus cambios en ventana Selección dimensión haciendo clic en el AssistButton en el campo %1. ";
    //Variable type has not been exported.
}

