enum 50102 "Booking Status"
{
    Extensible = true;
    
    value(0; "")
    {
        Caption = '';
    }
    value(1; Draft)
    {
        Caption = 'Draft';
    }
    value(2; Submitted)
    {
        Caption = 'Submitted';
    }
    value(3; Confirmed)
    {
        Caption = 'Confirmed';
    }
    value(4; Cancelled)
    {
        Caption = 'Cancelled';
    }
    value(5; Rejected)
    {
        Caption = 'Rejected';
    }
    value(6; "Amend Requested")
    {
        Caption = 'Amend Requested';
    }
}
