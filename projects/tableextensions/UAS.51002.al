tableextension 51002 tableextension51002 extends "Booking Sync"
{
    Caption = 'Booking Sync';
    fields
    {
        modify("Booking Mailbox Address")
        {
            Caption = 'Booking Mailbox Address';
        }
        modify("Booking Mailbox Name")
        {
            Caption = 'Booking Mailbox Name';
        }
        modify("Last Customer Sync")
        {
            Caption = 'Last Customer Sync';
        }
        modify("Last Service Sync")
        {
            Caption = 'Last Service Sync';
        }
        modify("Item Template Code")
        {
            Caption = 'Item Template Code';
        }
    }
}

