tableextension 51309 tableextension51309 extends "Recorded Event Buffer"
{
    fields
    {
        modify("Session ID")
        {
            Caption = 'Session ID';
        }
        modify("Object Type")
        {
            OptionCaption = 'Table Data,Table,,Report,,Codeunit,XMLport,MenuSuite,Page,Query,System';
        }
        modify("Calling Object Type")
        {
            OptionCaption = ',Table,,Report,,Codeunit,XMLport,MenuSuite,Page,Query,System';
        }
        modify("Calling Method")
        {
            Caption = 'Calling Method';
        }
    }
}

