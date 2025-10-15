tableextension 50164 "Sales Cust. Grp.Ch. Set. Ext." extends "Sales by Cust. Grp.Chart Setup"
{
    fields
    {
        modify("Period Length")
        {
            OptionCaption = 'Day,Week,Month,Quarter,Year';
        }
    }
}

