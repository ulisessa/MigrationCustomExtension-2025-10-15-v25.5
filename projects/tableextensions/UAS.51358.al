tableextension 51358 tableextension51358 extends "Planning Buffer"
{
    Caption = 'Planning Buffer';
    fields
    {
        modify("Buffer No.")
        {
            Caption = 'Buffer No.';
        }
        modify("Document Type")
        {
            OptionCaption = 'Requisition Line,Planned Prod. Order Comp.,Firm Planned Prod. Order Comp.,Released Prod. Order Comp.,Planning Comp.,Sales Order,Planned Prod. Order,Planning Line,Req. Worksheet Line,Firm Planned Prod. Order,Released Prod. Order,Purchase Order,Quantity at Inventory,Service Order,Transfer,Job Order,Assembly Order,Assembly Order Line,Production Forecast-Sales,Production Forecast-Component';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
    }
}

