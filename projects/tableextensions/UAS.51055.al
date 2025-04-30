tableextension 51055 tableextension51055 extends "Analysis Dim. Selection Buffer"
{
    Caption = 'Analysis Dim. Selection Buffer';
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
    //Text002 : ENU="Enter your changes again in the Dimension Selection window by clicking the AssistButton in the %1 field. ";ESP="Haga clic en el botón AssistButton del campo %1 para introducir de nuevo las modificaciones en la ventana Selección de dimensión. ";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU="Enter your changes again in the Dimension Selection window by clicking the AssistButton in the %1 field. ";ESP="Haga clic en el botón AssistButton del campo %1 para introducir de nuevo las modificaciones en la ventana Selección de dimensión. ";
    //Variable type has not been exported.
}

