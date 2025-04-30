tableextension 50916 tableextension50916 extends "Fault Reason Code"
{
    Caption = 'Fault Reason Code';
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Exclude Warranty Discount")
        {
            Caption = 'Exclude Warranty Discount';
        }
    }
}

