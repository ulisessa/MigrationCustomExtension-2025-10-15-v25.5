tableextension 51218 tableextension51218 extends "Cash Flow Chart Setup"
{
    Caption = 'Cash Flow Chart Setup';
    fields
    {
        modify("Period Length")
        {
            OptionCaption = 'Day,Week,Month,Quarter,Year';
        }
        modify("Group By")
        {
            OptionCaption = 'Positive/Negative,Account No.,Source Type';
        }
        modify("Chart Type")
        {
            Caption = 'Chart Type';
            OptionCaption = 'Step Line,Stacked Area (%),Stacked Column,Stacked Column (%)';
        }
    }
}

