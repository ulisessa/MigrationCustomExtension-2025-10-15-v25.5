tableextension 51138 tableextension51138 extends "Account Schedules Chart Setup"
{
    Caption = 'Account Schedules Chart Setup';
    fields
    {
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Base X-Axis on")
        {
            OptionCaption = 'Period,Acc. Sched. Line,Acc. Sched. Column';
        }
        modify("Period Length")
        {
            OptionCaption = 'Day,Week,Month,Quarter,Year';
        }
        modify("No. of Periods")
        {
            Caption = 'No. of Periods';
        }
        modify("Last Viewed")
        {
            Caption = 'Last Viewed';
        }
        modify("Look Ahead")
        {
            Caption = 'Look Ahead';
        }
    }
}

