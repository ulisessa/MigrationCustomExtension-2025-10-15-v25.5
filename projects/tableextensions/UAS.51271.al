tableextension 51271 tableextension51271 extends "Generic Chart Y-Axis"
{
    Caption = 'Generic Chart Y-Axis';
    fields
    {
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Y-Axis Measure Field Caption")
        {
            Caption = 'Y-Axis Measure Field Caption';
        }
        modify("Show Title")
        {
            Caption = 'Show Title';
        }
        modify(Aggregation)
        {
            Caption = 'Aggregation';
            OptionCaption = 'None,Count,Sum,Min,Max,Avg';
        }
        modify("Chart Type")
        {
            Caption = 'Chart Type';
            OptionCaption = 'Column,Point,Line,ColumnStacked,ColumnStacked100,Area,AreaStacked,AreaStacked100,StepLine,Pie,Doughnut,Range,Radar,Funnel';
        }
    }
}

