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
            CaptionClass = '1,2,3';
            FieldClass = FlowFilter;

        }
        field(50001; "Global Dimension 4 filter"; Code[10])
        {
            CaptionClass = '1,2,4';
            FieldClass = FlowFilter;

        }
        field(50002; "Global Dimension 5 filter"; Code[10])
        {
            CaptionClass = '1,2,5';
            FieldClass = FlowFilter;

        }
        field(50003; "Global Dimension 6 filter"; Code[10])
        {
            CaptionClass = '1,2,6';
            FieldClass = FlowFilter;

        }
        field(50004; "Global Dimension 7 filter"; Code[10])
        {
            CaptionClass = '1,2,7';
            FieldClass = FlowFilter;

        }
    }
}

