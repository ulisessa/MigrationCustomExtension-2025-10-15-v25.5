tableextension 50877 tableextension50877 extends "Average Cost Calc. Overview"
{
    Caption = 'Average Cost Calc. Overview';
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify(Type)
        {
            OptionCaption = 'Closing Entry,Increase,Applied Increase,Applied Decrease,Decrease,Revaluation';
        }
        modify("Valuation Date")
        {
            Caption = 'Valuation Date';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Attached to Entry No.")
        {
            Caption = 'Attached to Entry No.';
        }
        modify("Attached to Valuation Date")
        {
            Caption = 'Attached to Valuation Date';
        }
        modify("Item Ledger Entry No.")
        {
            Caption = 'Item Ledger Entry No.';
        }
        modify("Document Type")
        {
            OptionCaption = ' ,Sales Shipment,Sales Invoice,Sales Return Receipt,Sales Credit Memo,Purchase Receipt,Purchase Invoice,Purchase Return Shipment,Purchase Credit Memo,Transfer Shipment,Transfer Receipt,Service Shipment,Service Invoice,Service Credit Memo';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("Document Line No.")
        {
            Caption = 'Document Line No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
    }
}

