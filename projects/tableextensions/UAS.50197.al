tableextension 50197 tableextension50197 extends "Workflow Step"
{
    fields
    {
        modify("Workflow Code")
        {
            Caption = 'Workflow Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Function Name")
        {
            Caption = 'Function Name';
        }
        modify("Sequence No.")
        {
            Caption = 'Sequence No.';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "ConfirmDeleteLinksQst(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //ConfirmDeleteLinksQst : ENU=If you delete this workflow response, one or more other, linked workflow responses may stop working.\\Do you want to continue?;ESP=Si elimina esta respuesta de flujo de trabajo, una o varias respuestas de flujo de trabajo distintas vinculadas podrían dejar de funcionar.\\¿Quiere continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ConfirmDeleteLinksQst : ENU=If you delete this workflow response, one or more other, linked workflow responses may stop working.\\Do you want to continue?;ESP=Si elimina esta respuesta de flujo de trabajo, una o varias respuestas de flujo de trabajo distintas vinculadas podrían dejar de funcionar.\\?Quiere continuar?;
    //Variable type has not been exported.
}

