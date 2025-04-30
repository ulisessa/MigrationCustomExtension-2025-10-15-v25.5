tableextension 50 "Accounting Period fields" extends "Accounting Period"
{
    fields
    {
        field(50000; "VAT recovery"; Boolean)
        {
            Caption = 'VAT recovery';
            DataClassification = CustomerContent;
        }
        field(50001; "Inflation adjustment"; Boolean)
        {
            Caption = 'Inflation adjustment';
            DataClassification = CustomerContent;
        }
    }
}
