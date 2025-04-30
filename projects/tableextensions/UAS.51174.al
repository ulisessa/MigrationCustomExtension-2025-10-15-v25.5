tableextension 51174 tableextension51174 extends "Workflows Entries Buffer"
{
    Caption = 'Workflows Entries Buffer';
    fields
    {
        modify("Created by Application")
        {
            Caption = 'Created by Application';
        }
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("To Be Approved By User ID")
        {
            Caption = 'To Be Approved By User ID';
        }
        modify("Last Date-Time Modified")
        {
            Caption = 'Last Date-Time Modified';
        }
        modify("Last Modified By User ID")
        {
            Caption = 'Last Modified By User ID';
        }
    }

    //Unsupported feature: Property Modification (Subtype) on "RunWorkflowEntriesPage(PROCEDURE 1).WorkflowWebhookEntries(Variable 1003)".

}

