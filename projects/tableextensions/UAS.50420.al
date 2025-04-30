tableextension 50420 tableextension50420 extends "Reminder/Fin. Charge Entry"
{
    Caption = 'Reminder/Fin. Charge Entry';
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify(Type)
        {
            OptionCaption = 'Reminder,Finance Charge Memo';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Document Date")
        {
            Caption = 'Document Date';
        }
        modify("Interest Posted")
        {
            Caption = 'Interest Posted';
        }
        modify("Interest Amount")
        {
            Caption = 'Interest Amount';
        }
        modify("Customer Entry No.")
        {
            Caption = 'Customer Entry No.';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("Customer No.")
        {
            Caption = 'Customer No.';
        }
    }
}

