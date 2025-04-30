tableextension 50768 tableextension50768 extends "Sales Quote Entity Buffer"
{
    Caption = 'Sales Quote Entity Buffer';
    fields
    {
        modify("Sell-to Customer No.")
        {
            Caption = 'Sell-to Customer No.';
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
        modify("Shipment Method Code")
        {
            Caption = 'Shipment Method Code';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("Salesperson Code")
        {
            Caption = 'Salesperson Code';
        }
        modify("Sell-to Address")
        {
            Caption = 'Sell-to Address';
        }
        modify("Sell-to Address 2")
        {
            Caption = 'Sell-to Address 2';
        }
        modify("Sell-to City")
        {
            Caption = 'Sell-to City';
        }
        modify("Bill-to Country/Region Code")
        {
            Caption = 'Bill-to Country/Region Code';
        }
        modify("Sell-to Country/Region Code")
        {
            Caption = 'Sell-to Country/Region Code';
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
        modify("External Document No.")
        {
            Caption = 'External Document No.';
        }
        modify("Tax Area Code")
        {
            Caption = 'Tax Area Code';
        }
        modify("Invoice Discount Calculation")
        {
            Caption = 'Invoice Discount Calculation';
        }
        modify("Quote Valid Until Date")
        {
            Caption = 'Quote Valid Until Date';
        }
        modify("Sell-to Phone No.")
        {
            Caption = 'Sell-to Phone No.';
        }
        modify("Sell-to E-Mail")
        {
            Caption = 'Email';
        }
        modify("Cust. Ledger Entry No.")
        {
            Caption = 'Cust. Ledger Entry No.';
        }
        modify("Sell-to Contact No.")
        {
            Caption = 'Sell-to Contact No.';
        }
        modify("Last Modified Date Time")
        {
            Caption = 'Last Modified Date Time';
        }
        modify("Shipment Method Id")
        {
            Caption = 'Shipment Method Id';
        }
        modify("Tax Area ID")
        {
            Caption = 'Tax Area ID';
        }
        modify("Bill-to Customer Id")
        {
            Caption = 'Bill-to Customer Id';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "SalesTaxOnlyFieldErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //SalesTaxOnlyFieldErr : @@@=%1 - Name of the field, e.g. Tax Liable, Tax Group Code, VAT Business posting group;ENU=Current Tax setup is set to VAT. Field %1 can only be used with Sales Tax.;ESP=La configuración de impuesto actual está establecida en IVA. El campo %1 solo puede utilizarse con Impuesto sobre las ventas.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SalesTaxOnlyFieldErr : @@@=%1 - Name of the field, e.g. Tax Liable, Tax Group Code, VAT Business posting group;ENU=Current Tax setup is set to VAT. Field %1 can only be used with Sales Tax.;ESP=La configuración de impuesto actual está establecida en IVA. El campo %1 solo puede utilizarse con Impuesto sobre las ventas.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "VATOnlyFieldErr(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //VATOnlyFieldErr : @@@=%1 - Name of the field, e.g. Tax Liable, Tax Group Code, VAT Business posting group;ENU=Current Tax setup is set to Sales Tax. Field %1 can only be used with VAT.;ESP=La configuración de impuesto actual está establecida en Impuesto sobre las ventas. El campo %1 solo puede utilizarse con IVA.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //VATOnlyFieldErr : @@@=%1 - Name of the field, e.g. Tax Liable, Tax Group Code, VAT Business posting group;ENU=Current Tax setup is set to Sales Tax. Field %1 can only be used with VAT.;ESP=La configuración de impuesto actual está establecida en Impuesto sobre las ventas. El campo %1 solo puede utilizarse con IVA.;
    //Variable type has not been exported.
}

