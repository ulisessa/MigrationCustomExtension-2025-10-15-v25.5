tableextension 50977 tableextension50977 extends "Power BI Chart Buffer"
{
    Caption = 'Power BI Chart Buffer';
    fields
    {
        modify("Row No.")
        {
            Caption = 'Row No.';
        }
        modify("Period Type")
        {
            OptionCaption = 'Day,Week,Month,Quarter,Year,Accounting Period';
        }
        modify("Date Sorting")
        {
            Caption = 'Date Sorting';
        }
        modify("Chart Type")
        {
            Caption = 'Chart Type';
            OptionCaption = ' ,Line,StepLine,Column,StackedColumn';
        }
        modify("Measure No.")
        {
            Caption = 'Measure No.';
        }
        modify("Period Type Sorting")
        {
            Caption = 'Period Type Sorting';
        }
    }
}

