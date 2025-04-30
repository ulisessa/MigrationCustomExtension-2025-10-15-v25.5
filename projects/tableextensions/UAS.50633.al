tableextension 50633 tableextension50633 extends "Sales Cycle"
{
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
        modify("Probability Calculation")
        {
            Caption = 'Probability Calculation';
            OptionCaption = 'Multiply,Add,Chances of Success %,Completed %';
        }
        modify("No. of Opportunities")
        {
            Caption = 'No. of Opportunities';
        }
    }
}

