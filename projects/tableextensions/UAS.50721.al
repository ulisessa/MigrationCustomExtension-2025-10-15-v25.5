tableextension 50721 tableextension50721 extends "CRM Full Synch. Review Line"
{
    Caption = 'CRM Full Synch. Review Line';
    fields
    {
        modify("Session ID")
        {
            Caption = 'Session ID';
        }
        modify(Direction)
        {
            Caption = 'Direction';
            OptionCaption = 'Bidirectional,To Integration Table,From Integration Table';
        }
    }
}

