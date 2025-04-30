tableextension 50165 tableextension50165 extends "Top Customers By Sales Buffer"
{
    Caption = 'Top Customers By Sales Buffer';
    fields
    {
        modify(LastCustLedgerEntryNo)
        {
            Caption = 'LastCustLedgerEntryNo';
        }
        modify(CustomerNo)
        {
            Caption = 'CustomerNo';
        }
        modify(DateTimeUpdated)
        {
            Caption = 'DateTimeUpdated';
        }
    }
}

