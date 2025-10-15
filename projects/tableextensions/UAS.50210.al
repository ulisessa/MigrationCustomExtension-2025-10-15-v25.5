tableextension 50210 "My Notifications Ext." extends "My Notifications"
{
    fields
    {
        modify("Notification Id")
        {
            Caption = 'Notification Id';
        }
        modify(Name)
        {
            Caption = 'Notification';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
    }
}

