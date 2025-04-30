tableextension 51134 tableextension51134 extends "Base Calendar Change"
{
    fields
    {
        modify("Base Calendar Code")
        {
            Caption = 'Base Calendar Code';
        }
        modify("Recurring System")
        {
            Caption = 'Recurring System';
            OptionCaption = ' ,Annual Recurring,Weekly Recurring';
        }
        modify(Day)
        {
            Caption = 'Day';
            OptionCaption = ' ,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
    }
}

