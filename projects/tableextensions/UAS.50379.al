tableextension 50379 tableextension50379 extends "Customer Amount"
{
    fields
    {
        modify("Customer No.")
        {
            Caption = 'Customer No.';
        }
        field(50000; Cantidad; Decimal)
        {
            Caption = 'Quantity';
            ToolTip = 'Specifies the value of the Quantity field.';
        }
    }
}

