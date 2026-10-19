tableextension 50953 tableextension50953 extends "Service Shipment Line"
{
    Caption = 'Service Shipment Line';
    fields
    {
        modify("Customer No.")
        {
            Caption = 'Customer No.';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Description 2")
        {
            Caption = 'Description 2';
        }
        modify("Line Discount %")
        {
            Caption = 'Line Discount %';
        }
        modify("Appl.-to Item Entry")
        {
            Caption = 'Appl.-to Item Entry';
        }
        modify("Item Shpt. Entry No.")
        {
            Caption = 'Item Shpt. Entry No.';
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        modify("Shortcut Dimension 2 Code")
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        modify("Work Type Code")
        {
            Caption = 'Work Type Code';
        }
        modify("Order No.")
        {
            Caption = 'Order No.';
        }
        modify("Order Line No.")
        {
            Caption = 'Order Line No.';
        }
        modify("Bill-to Customer No.")
        {
            Caption = 'Bill-to Customer No.';
        }
        modify("VAT Calculation Type")
        {
            Caption = 'VAT Calculation Type';
        }
        modify("Transaction Type")
        {
            Caption = 'Transaction Type';
        }
        modify("Attached to Line No.")
        {
            Caption = 'Attached to Line No.';
        }
        modify("Area")
        {
            Caption = 'Area';
        }
        modify("Transaction Specification")
        {
            Caption = 'Transaction Specification';
        }
        modify("Tax Area Code")
        {
            Caption = 'Tax Area Code';
        }
        modify("Tax Group Code")
        {
            Caption = 'Tax Group Code';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("Time Sheet No.")
        {
            Caption = 'Time Sheet No.';
        }
        modify("Time Sheet Line No.")
        {
            Caption = 'Time Sheet Line No.';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Bin Code")
        {
            Caption = 'Bin Code';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Item Category Code")
        {
            Caption = 'Item Category Code';
        }
        modify(Nonstock)
        {
            Caption = 'Catalog';
        }
        modify(Correction)
        {
            Caption = 'Correction';
        }
        modify("Appl.-to Warranty Entry")
        {
            Caption = 'Appl.-to Warranty Entry';
        }
        modify("Service Item No.")
        {
            Caption = 'Service Item No.';
        }
        modify("Service Item Line No.")
        {
            Caption = 'Service Item Line No.';
        }
        modify("Service Item Serial No.")
        {
            Caption = 'Service Item Serial No.';
        }
        modify("Service Item Line Description")
        {
            Caption = 'Service Item Line Description';
        }
        modify("Ship-to Code")
        {
            Caption = 'Ship-to Code';
        }
        modify("Service Price Group Code")
        {
            Caption = 'Service Price Group Code';
        }
        modify("Fault Area Code")
        {
            Caption = 'Fault Area Code';
        }
        modify("Symptom Code")
        {
            Caption = 'Symptom Code';
        }
        modify("Fault Code")
        {
            Caption = 'Fault Code';
        }
        modify("Resolution Code")
        {
            Caption = 'Resolution Code';
        }
        modify("Exclude Warranty")
        {
            Caption = 'Exclude Warranty';
        }
        modify(Warranty)
        {
            Caption = 'Warranty';
        }
        modify("Contract No.")
        {
            Caption = 'Contract No.';
        }
        modify("Warranty Disc. %")
        {
            Caption = 'Warranty Disc. %';
        }
        modify("Component Line No.")
        {
            Caption = 'Component Line No.';
        }
        modify("Spare Part Action")
        {
            Caption = 'Spare Part Action';
        }
        modify("Fault Reason Code")
        {
            Caption = 'Fault Reason Code';
        }
        modify("Replaced Item No.")
        {
            Caption = 'Replaced Item No.';
        }
        modify("Line Discount Type")
        {
            Caption = 'Line Discount Type';
            OptionCaption = ' ,Warranty Disc.,Contract Disc.,Line Disc.,Manual';
        }
        modify("Copy Components From")
        {
            OptionCaption = 'None,Item BOM,Old Service Item,Old Serv.Item w/o Serial No.';
        }
        modify("Return Reason Code")
        {
            Caption = 'Return Reason Code';
        }
        modify("Allow Line Disc.")
        {
            Caption = 'Allow Line Disc.';
        }
        field(50505; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';

        }
        field(50506; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';

        }
        field(50507; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';

        }
        field(50508; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';

        }
        field(50509; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';

        }
    }


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=Shipment No. %1:;ESP=No. albarán %1:;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=Shipment No. %1:;ESP=No.Remito %1:;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=The program cannot find this Service line.;ESP=El programa no puede encontrar esta línea de servicio.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=The program cannot find this Service line.;ESP=El programa no puede encontrar esta línea de servicio.;
    //Variable type has not been exported.
}

