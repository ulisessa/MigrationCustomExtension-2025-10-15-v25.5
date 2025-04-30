tableextension 51048 tableextension51048 extends "Item Budget Name"
{
    fields
    {
        modify("Analysis Area")
        {
            Caption = 'Analysis Area';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Budget Dimension 1 Code")
        {
            Caption = 'Budget Dimension 1 Code';
        }
        modify("Budget Dimension 2 Code")
        {
            Caption = 'Budget Dimension 2 Code';
        }
        modify("Budget Dimension 3 Code")
        {
            Caption = 'Budget Dimension 3 Code';
        }
        field(50001; "Budget Dimension 4 Code"; Code[10])
        {
            CaptionClass = '1,1,4';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (4));
        }
        field(50002; "Budget Dimension 5 Code"; Code[10])
        {
            CaptionClass = '1,1,5';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (5));
        }
        field(50003; "Budget Dimension 6 Code"; Code[10])
        {
            CaptionClass = '1,1,6';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (6));
        }
        field(50004; "Budget Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,1,7';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (7));
        }
    }
}

