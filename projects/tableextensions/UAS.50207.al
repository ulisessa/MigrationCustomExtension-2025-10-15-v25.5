tableextension 50207 "Sent Notification Entry Ext." extends "Sent Notification Entry"
{
    Caption = 'Sent Notification Entry';
    fields
    {
        modify("Link Target Page")
        {
            Caption = 'Link Target Page';
        }
        modify("Custom Link")
        {
            Caption = 'Custom Link';
        }
        modify("Created Date-Time")
        {
            Caption = 'Created Date-Time';
        }
        modify("Sent Date-Time")
        {
            Caption = 'Sent Date-Time';
        }
        modify("Notification Content")
        {
            Caption = 'Notification Content';
        }
        modify("Notification Method")
        {
            Caption = 'Notification Method';
        }
    }
}

