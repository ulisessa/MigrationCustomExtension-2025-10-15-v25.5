tableextension 284 "Area" extends "Area" //OriginalId
{
    fields
    {
        field(50000; "No. Patagonia"; Code[10])
        {
            Caption = 'No. Patagonia';
            ToolTip = 'Specifies the value of the No. Patagonia field.';
        }
        field(50001; "Jurisdiction code"; Code[10])
        {
            Caption = 'Jurisdiction code';
            ToolTip = 'Specifies the value of the Jurisdiction code field.';
            DataClassification = ToBeClassified;
        }
    }
}