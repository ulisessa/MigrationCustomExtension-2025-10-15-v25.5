tableextension 51321 tableextension51321 extends "Work Center Group"
{
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        field(50000; "Global Dimension 3 filter"; Code[10])
        {
            Caption = 'Global Dimension 3 filter';
            ToolTip = 'Specifies the value of the Global Dimension 3 filter field.';
            CaptionClass = '1,2,3';
            FieldClass = FlowFilter;

        }
        field(50001; "Global Dimension 4 filter"; Code[10])
        {
            Caption = 'Global Dimension 4 filter';
            ToolTip = 'Specifies the value of the Global Dimension 4 filter field.';
            CaptionClass = '1,2,4';
            FieldClass = FlowFilter;

        }
        field(50002; "Global Dimension 5 filter"; Code[10])
        {
            Caption = 'Global Dimension 5 filter';
            ToolTip = 'Specifies the value of the Global Dimension 5 filter field.';
            CaptionClass = '1,2,5';
            FieldClass = FlowFilter;

        }
        field(50003; "Global Dimension 6 filter"; Code[10])
        {
            Caption = 'Global Dimension 6 filter';
            ToolTip = 'Specifies the value of the Global Dimension 6 filter field.';
            CaptionClass = '1,2,6';
            FieldClass = FlowFilter;

        }
        field(50004; "Global Dimension 7 filter"; Code[10])
        {
            Caption = 'Global Dimension 7 filter';
            ToolTip = 'Specifies the value of the Global Dimension 7 filter field.';
            CaptionClass = '1,2,7';
            FieldClass = FlowFilter;

        }
    }
}

