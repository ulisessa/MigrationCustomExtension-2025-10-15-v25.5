tableextension 50718 tableextension50718 extends "Integration Synch. Job Errors"
{
    Caption = 'Integration Synch. Job Errors';
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Integration Synch. Job ID")
        {
            Caption = 'Integration Synch. Job ID';
        }
        modify("Exception Detail")
        {
            Caption = 'Exception Detail';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "DeleteEntriesQst(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //DeleteEntriesQst : @@@="%1 = Integration Synch. Job Errors caption";ENU=Are you sure that you want to delete the %1 entries?;ESP=¿Está seguro de que desea eliminar las %1 entradas?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DeleteEntriesQst : @@@="%1 = Integration Synch. Job Errors caption";ENU=Are you sure that you want to delete the %1 entries?;ESP=?está seguro de que desea eliminar las %1 entradas?;
    //Variable type has not been exported.
}

