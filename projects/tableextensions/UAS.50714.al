tableextension 50714 tableextension50714 extends "Integration Table Mapping"
{
    Caption = 'Integration Table Mapping';
    fields
    {
        modify("Integration Table ID")
        {
            Caption = 'Integration Table ID';
        }
        modify("Integration Table UID Fld. No.")
        {
            Caption = 'Integration Table UID Fld. No.';
        }
        modify("Int. Tbl. Modified On Fld. No.")
        {
            Caption = 'Int. Tbl. Modified On Fld. No.';
        }
        modify("Table Config Template Code")
        {
            Caption = 'Table Config Template Code';
        }
        modify("Int. Tbl. Config Template Code")
        {
            Caption = 'Int. Tbl. Config Template Code';
        }
        modify(Direction)
        {
            Caption = 'Direction';
            OptionCaption = 'Bidirectional,ToIntegrationTable,FromIntegrationTable';
        }
        modify("Int. Tbl. Caption Prefix")
        {
            Caption = 'Int. Tbl. Caption Prefix';
        }
        modify("Synch. Modified On Filter")
        {
            Caption = 'Synch. Modified On Filter';
        }
        modify("Integration Table Filter")
        {
            Caption = 'Integration Table Filter';
        }
        modify("Int. Tbl. Delta Token Fld. No.")
        {
            Caption = 'Int. Tbl. Delta Token Fld. No.';
        }
        modify("Int. Tbl. ChangeKey Fld. No.")
        {
            Caption = 'Int. Tbl. ChangeKey Fld. No.';
        }
        modify("Int. Tbl. State Fld. No.")
        {
            Caption = 'Int. Tbl. State Fld. No.';
        }
        modify("Delete After Synchronization")
        {
            Caption = 'Delete After Synchronization';
        }
        modify("Full Sync is Running")
        {
            Caption = 'Full Sync is Running';
        }
        modify("Full Sync Session ID")
        {
            Caption = 'Full Sync Session ID';
        }
        modify("Last Full Sync Start DateTime")
        {
            Caption = 'Last Full Sync Start DateTime';
        }
    }
}

