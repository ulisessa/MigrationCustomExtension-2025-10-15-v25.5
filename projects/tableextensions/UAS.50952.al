tableextension 50952 tableextension50952 extends "Service Shipment Header"
{
    Caption = 'Service Shipment Header';
    fields
    {
        modify("Customer No.")
        {
            Caption = 'Customer No.';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Bill-to Customer No.")
        {
            Caption = 'Bill-to Customer No.';
        }
        modify("Bill-to Address")
        {
            Caption = 'Bill-to Address';
        }
        modify("Bill-to Address 2")
        {
            Caption = 'Bill-to Address 2';
        }
        modify("Bill-to City")
        {
            Caption = 'Bill-to City';
        }
        modify("Bill-to Contact")
        {
            Caption = 'Bill-to Contact';
        }
        modify("Ship-to Code")
        {
            Caption = 'Ship-to Code';
        }
        modify("Ship-to Name")
        {
            Caption = 'Ship-to Name';
        }
        modify("Ship-to Name 2")
        {
            Caption = 'Ship-to Name 2';
        }
        modify("Ship-to Address")
        {
            Caption = 'Ship-to Address';
        }
        modify("Ship-to Address 2")
        {
            Caption = 'Ship-to Address 2';
        }
        modify("Ship-to City")
        {
            Caption = 'Ship-to City';
        }
        modify("Ship-to Contact")
        {
            Caption = 'Ship-to Contact';
        }
        modify("Payment Terms Code")
        {
            Caption = 'Payment Terms Code';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        modify("Shortcut Dimension 2 Code")
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("Invoice Disc. Code")
        {
            Caption = 'Invoice Disc. Code';
        }
        modify("Language Code")
        {
            Caption = 'Language Code';
        }
        modify("Salesperson Code")
        {
            Caption = 'Salesperson Code';
        }
        modify("Order No.")
        {
            Caption = 'Order No.';
        }
        modify("No. Printed")
        {
            Caption = 'No. Printed';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("Transaction Type")
        {
            Caption = 'Transaction Type';
        }
        modify("VAT Country/Region Code")
        {
            Caption = 'VAT Country/Region Code';
        }
        modify(Address)
        {
            Caption = 'Address';
        }
        modify("Address 2")
        {
            Caption = 'Address 2';
        }
        modify(City)
        {
            Caption = 'City';
        }
        modify("Bill-to Country/Region Code")
        {
            Caption = 'Bill-to Country/Region Code';
        }
        modify("Post Code")
        {
            Caption = 'Post Code';
        }
        modify("Country/Region Code")
        {
            Caption = 'Country/Region Code';
        }
        modify("Ship-to Post Code")
        {
            Caption = 'Ship-to Post Code';
        }
        modify("Ship-to County")
        {
            Caption = 'Ship-to County';
        }
        modify("Ship-to Country/Region Code")
        {
            Caption = 'Ship-to Country/Region Code';
        }
        modify(Correction)
        {
            Caption = 'Correction';
        }
        modify("Document Date")
        {
            Caption = 'Document Date';
        }
        modify("Area")
        {
            Caption = 'Area';
        }
        modify("Transaction Specification")
        {
            Caption = 'Transaction Specification';
        }
        modify("Payment Method Code")
        {
            Caption = 'Payment Method Code';
        }
        modify("Order No. Series")
        {
            Caption = 'Order No. Series';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("Tax Area Code")
        {
            Caption = 'Tax Area Code';
        }
        modify("Contact No.")
        {
            Caption = 'Contact No.';
        }
        modify("Bill-to Contact No.")
        {
            Caption = 'Bill-to Contact No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Phone No.")
        {
            Caption = 'Phone No.';
        }
        modify("E-Mail")
        {
            Caption = 'Email';
        }
        modify("Phone No. 2")
        {
            Caption = 'Phone No. 2';
        }
        modify("Fax No.")
        {
            Caption = 'Fax No.';
        }
        modify("No. of Unallocated Items")
        {
            Caption = 'No. of Unallocated Items';
        }
        modify("Default Response Time (Hours)")
        {
            Caption = 'Default Response Time (Hours)';
        }
        modify("Finishing Date")
        {
            Caption = 'Finishing Date';
        }
        modify("Finishing Time")
        {
            Caption = 'Finishing Time';
        }
        modify("Reallocation Needed")
        {
            Caption = 'Reallocation Needed';
        }
        modify("Notify Customer")
        {
            Caption = 'Notify Customer';
            OptionCaption = 'No,By Phone 1,By Phone 2,By Fax,By Email';
        }
        modify("Max. Labor Unit Price")
        {
            Caption = 'Max. Labor Unit Price';
        }
        modify("No. of Allocations")
        {
            Caption = 'No. of Allocations';
        }
        modify("Contract No.")
        {
            Caption = 'Contract No.';
        }
        modify("Ship-to Fax No.")
        {
            Caption = 'Ship-to Fax No.';
        }
        modify("Ship-to E-Mail")
        {
            Caption = 'Ship-to Email';
        }
        modify("Ship-to Phone")
        {
            Caption = 'Ship-to Phone';
        }
        modify("Ship-to Phone 2")
        {
            Caption = 'Ship-to Phone 2';
        }
        modify("Service Zone Code")
        {
            Caption = 'Service Zone Code';
        }
        modify("Allow Line Disc.")
        {
            Caption = 'Allow Line Disc.';
        }
        modify("Applies-to Bill No.")
        {
            Caption = 'Applies-to Bill No.';
        }
        modify("Cust. Bank Acc. Code")
        {
            Caption = 'Cust. Bank Acc. Code';
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

