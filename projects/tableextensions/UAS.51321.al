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
            CaptionClass = '1,1,3';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (3));
        }
        field(50001; "Global Dimension 4 filter"; Code[10])
        {
            CaptionClass = '1,1,4';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (4));
        }
        field(50002; "Global Dimension 5 filter"; Code[10])
        {
            CaptionClass = '1,1,5';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (5));
        }
        field(50003; "Global Dimension 6 filter"; Code[10])
        {
            CaptionClass = '1,1,6';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (6));
        }
        field(50004; "Global Dimension 7 filter"; Code[10])
        {
            CaptionClass = '1,1,7';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (7));
        }
    }
}

