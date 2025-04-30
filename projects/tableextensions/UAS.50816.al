tableextension 50816 tableextension50816 extends "Depreciation Table Header"
{
    Caption = 'Depreciation Table Header';
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Period Length")
        {
            OptionCaption = 'Month,Period,Quarter,Year';
        }
        modify("Total No. of Units")
        {
            Caption = 'Total No. of Units';
        }
    }
}

