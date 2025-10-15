tableextension 50206 "Notification Schedule Ext." extends "Notification Schedule"
{
    Caption = 'Notification Schedule';
    fields
    {
        modify("Notification Type")
        {
            Caption = 'Notification Type';
        }
        modify(Wednesday)
        {
            Caption = 'Wednesday';
        }
        modify(Saturday)
        {
            Caption = 'Saturday';
        }
        modify("Monthly Notification Date")
        {
            Caption = 'Monthly Notification Date';
            OptionCaption = 'First Workday,Last Workday,Custom';
        }
        modify("Last Scheduled Job")
        {
            Caption = 'Last Scheduled Job';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "NotifyNowDescriptionTxt(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //NotifyNowDescriptionTxt : ENU=Instant Notification Job;ESP=Proyecto de notif. instantánea;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NotifyNowDescriptionTxt : ENU=Instant Notification Job;ESP=Proyecto de notif. instantánea;
    //Variable type has not been exported.
}

