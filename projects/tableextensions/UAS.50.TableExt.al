tableextension 50 "Accounting Period fields" extends "Accounting Period"
{
    fields
    {
        field(50000; "VAT recovery"; Boolean)
        {
            Caption = 'VAT recovery';
            ToolTip = 'Specifies the value of the VAT recovery field.';
            DataClassification = CustomerContent;
        }
        field(50001; "Inflation adjustment"; Boolean)
        {
            Caption = 'Inflation adjustment';
            ToolTip = 'Specifies the value of the Inflation adjustment field.';
            DataClassification = CustomerContent;
        }
    }
}
