tableextension 50380 tableextension50380 extends "Vendor Amount"
{
    fields
    {
        modify("Vendor No.")
        {
            Caption = 'Vendor No.';
        }
        field(50000; Cantidad; Decimal)
        {
            Caption = 'Quantity';
            ToolTip = 'Specifies the value of the Quantity field.';
        }
    }
}

