tableextension 50411 tableextension50411 extends "Reminder Level"
{
    fields
    {
        modify("Reminder Terms Code")
        {
            Caption = 'Reminder Terms Code';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Calculate Interest")
        {
            Caption = 'Calculate Interest';
        }
        modify("Due Date Calculation")
        {
            Caption = 'Due Date Calculation';
        }
        modify("Add. Fee per Line Amount (LCY)")
        {
            Caption = 'Add. Fee per Line Amount (LCY)';
        }
        modify("Add. Fee per Line Description")
        {
            Caption = 'Add. Fee per Line Description';
        }
        modify("Add. Fee Calculation Type")
        {
            Caption = 'Add. Fee Calculation Type';
            OptionCaption = 'Fixed,Single Dynamic,Accumulated Dynamic';
        }
    }
}

