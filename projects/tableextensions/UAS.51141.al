tableextension 51141 tableextension51141 extends "Analysis Report Chart Setup"
{
    Caption = 'Analysis Report Chart Setup';
    fields
    {
        modify("Analysis Area")
        {
            Caption = 'Analysis Area';
        }
        modify("Analysis Report Name")
        {
            Caption = 'Analysis Report Name';
        }
        modify("Analysis Line Template Name")
        {
            Caption = 'Analysis Line Template Name';
        }
        modify("Analysis Column Template Name")
        {
            Caption = 'Analysis Column Template Name';
        }
        modify("Base X-Axis on")
        {
            OptionCaption = 'Period,Line,Column';
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
    }
}

