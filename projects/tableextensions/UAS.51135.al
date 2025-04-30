tableextension 51135 tableextension51135 extends "Customized Calendar Change"
{
    fields
    {
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("Additional Source Code")
        {
            Caption = 'Additional Source Code';
        }
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
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
    }
}

