tableextension 50163 "Trial Balance Cache Ext." extends "Trial Balance Cache"
{
    Caption = 'Trial Balance Cache';
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Period 1 Amount")
        {
            Caption = 'Period 1 Amount';
        }
        modify("Period 2 Amount")
        {
            Caption = 'Period 2 Amount';
        }
        modify("Period 1 Caption")
        {
            Caption = 'Period 1 Caption';
        }
        modify("Period 2 Caption")
        {
            Caption = 'Period 2 Caption';
        }
    }
}

