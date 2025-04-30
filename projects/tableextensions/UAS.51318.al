tableextension 51318 tableextension51318 extends "Shop Calendar Working Days"
{
    Caption = 'Shop Calendar Working Days';
    fields
    {
        modify("Shop Calendar Code")
        {
            Caption = 'Shop Calendar Code';
        }
        modify(Day)
        {
            Caption = 'Day';
            OptionCaption = 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday';
        }
        modify("Work Shift Code")
        {
            Caption = 'Work Shift Code';
        }
    }
}

