tableextension 50843 tableextension50843 extends "Transfer Receipt Header"
{
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Transfer-from Code")
        {
            Caption = 'Transfer-from Code';
        }
        modify("Transfer-from Address")
        {
            Caption = 'Transfer-from Address';
        }
        modify("Transfer-from Address 2")
        {
            Caption = 'Transfer-from Address 2';
        }
        modify("Transfer-from City")
        {
            Caption = 'Transfer-from City';
        }
        modify("Trsf.-from Country/Region Code")
        {
            Caption = 'Trsf.-from Country/Region Code';
        }
        modify("Transfer-to Code")
        {
            Caption = 'Transfer-to Code';
        }
        modify("Transfer-to Address")
        {
            Caption = 'Transfer-to Address';
        }
        modify("Transfer-to Address 2")
        {
            Caption = 'Transfer-to Address 2';
        }
        modify("Trsf.-to Country/Region Code")
        {
            Caption = 'Trsf.-to Country/Region Code';
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        modify("Shortcut Dimension 2 Code")
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        modify("Transfer Order No.")
        {
            Caption = 'Transfer Order No.';
        }
        modify("Shipment Date")
        {
            Caption = 'Shipment Date';
        }
        modify("Receipt Date")
        {
            Caption = 'Receipt Date';
        }
        modify("In-Transit Code")
        {
            Caption = 'In-Transit Code';
        }
        modify("External Document No.")
        {
            Caption = 'External Document No.';
        }
        modify("Shipping Agent Code")
        {
            Caption = 'Shipping Agent Code';
        }
        modify("Shipping Agent Service Code")
        {
            Caption = 'Shipping Agent Service Code';
        }
        modify("Shipment Method Code")
        {
            Caption = 'Shipment Method Code';
        }
        modify("Transaction Type")
        {
            Caption = 'Transaction Type';
        }
        modify("Area")
        {
            Caption = 'Area';
        }
        modify("Transaction Specification")
        {
            Caption = 'Transaction Specification';
        }
        field(50505; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (3));
        }
        field(50506; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (4));
        }
        field(50507; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (5));
        }
        field(50508; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (6));
        }
        field(50509; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (7));
        }
    }
}

