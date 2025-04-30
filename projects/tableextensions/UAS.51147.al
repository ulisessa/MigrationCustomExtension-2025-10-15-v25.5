tableextension 51147 tableextension51147 extends "Analysis Report Chart Line"
{
    Caption = 'Analysis Report Chart Line';
    fields
    {
        modify("Analysis Line Line No.")
        {
            Caption = 'Analysis Line Line No.';
        }
        modify("Analysis Column Line No.")
        {
            Caption = 'Analysis Column Line No.';
        }
        modify("Analysis Area")
        {
            Caption = 'Analysis Area';
        }
        modify("Analysis Line Template Name")
        {
            Caption = 'Analysis Line Template Name';
        }
        modify("Analysis Column Template Name")
        {
            Caption = 'Analysis Column Template Name';
        }
        modify("Chart Type")
        {
            Caption = 'Chart Type';
            OptionCaption = ' ,Line,StepLine,Column,StackedColumn';
        }
    }
}

