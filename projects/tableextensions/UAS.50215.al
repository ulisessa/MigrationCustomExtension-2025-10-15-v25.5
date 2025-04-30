tableextension 50215 tableextension50215 extends "Workflow Event Queue"
{
    fields
    {
        modify("Session ID")
        {
            Caption = 'Session ID';
        }
        modify(Status)
        {
            OptionCaption = 'Queued,Executing,Executed';
        }
        modify("Record Index")
        {
            Caption = 'Record Index';
        }
    }
}

