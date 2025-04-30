tableextension 50717 tableextension50717 extends "Integration Synch. Job"
{
    Caption = 'Integration Synch. Job';
    fields
    {
        modify("Finish Date/Time")
        {
            Caption = 'Finish Date/Time';
        }
        modify("Integration Table Mapping Name")
        {
            Caption = 'Integration Table Mapping Name';
        }
        modify("Synch. Direction")
        {
            Caption = 'Synch. Direction';
            OptionCaption = 'Bidirectional,ToIntegrationTable,FromIntegrationTable';
        }
        modify("Job Queue Log Entry No.")
        {
            Caption = 'Job Queue Log Entry No.';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "DeleteEntriesQst(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //DeleteEntriesQst : @@@="%1 = Integration Synch. Job caption";ENU=Are you sure that you want to delete the %1 entries?;ESP=¿Está seguro de que desea eliminar las %1 entradas?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DeleteEntriesQst : @@@="%1 = Integration Synch. Job caption";ENU=Are you sure that you want to delete the %1 entries?;ESP=?está seguro de que desea eliminar las %1 entradas?;
    //Variable type has not been exported.
}

