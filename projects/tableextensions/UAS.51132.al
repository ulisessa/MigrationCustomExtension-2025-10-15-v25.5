tableextension 51132 tableextension51132 extends "Trailing Sales Orders Setup"
{
    fields
    {
        modify("Period Length")
        {
            OptionCaption = 'Day,Week,Month,Quarter,Year';
        }
        modify("Value to Calculate")
        {
            Caption = 'Value to Calculate';
            OptionCaption = 'Amount Excl. VAT,No. of Orders';
        }
        modify("Chart Type")
        {
            Caption = 'Chart Type';
            OptionCaption = 'Stacked Area,Stacked Area (%),Stacked Column,Stacked Column (%)';
        }
        modify("Latest Order Document Date")
        {
            Caption = 'Latest Order Document Date';
        }
    }
}

