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
            CaptionClass = '1,2,4';
            DataClassification = ToBeClassified;

        }
        field(50002; "Budget Dimension 5 Code"; Code[10])
        {
            CaptionClass = '1,2,5';
            DataClassification = ToBeClassified;

        }
        field(50003; "Budget Dimension 6 Code"; Code[10])
        {
            CaptionClass = '1,2,6';
            DataClassification = ToBeClassified;

        }
        field(50004; "Budget Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            DataClassification = ToBeClassified;

        }
    }
}

