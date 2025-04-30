tableextension 51120 tableextension51120 extends "Date Lookup Buffer"
{
    Caption = 'Date Lookup Buffer';
    fields
    {
        modify("Period Type")
        {
            OptionCaption = 'Day,Week,Month,Quarter,Year';
        }
        modify("Period No.")
        {
            Caption = 'Period No.';
        }
    }
}

