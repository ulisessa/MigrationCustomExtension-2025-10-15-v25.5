tableextension 50201 tableextension50201 extends "Workflow Step Buffer"
{
    Caption = 'Workflow Step Buffer';
    fields
    {
        modify(Indent)
        {
            Caption = 'Indent';
        }
        modify("Event Description")
        {
            Caption = 'Event Description';
        }
        modify(Condition)
        {
            Caption = 'Condition';
        }
        modify("Response Description")
        {
            Caption = 'Response Description';
        }
        modify("Workflow Code")
        {
            Caption = 'Workflow Code';
        }
        modify("Response Description Style")
        {
            Caption = 'Response Description Style';
        }
        modify("Sequence No.")
        {
            Caption = 'Sequence No.';
        }
        modify("Next Step Description")
        {
            Caption = 'Next Step Description';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "WhenMissingErr(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //WhenMissingErr : ENU=You must select a When statement first.;ESP=Debe seleccionar primero una instrucción When.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //WhenMissingErr : ENU=You must select a When statement first.;ESP=Debe seleccionar primero una instrucción When.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ThenNextStepDescTxt(Variable 1007)".

    //var
    //>>>> ORIGINAL VALUE:
    //ThenNextStepDescTxt : ENU=Next then "%1";ESP=Siguiente después de "%1";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ThenNextStepDescTxt : ENU=Next then "%1";ESP=Siguiente después de "%1";
    //Variable type has not been exported.
}

