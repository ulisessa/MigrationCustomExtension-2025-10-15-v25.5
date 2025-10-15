tableextension 50247 "Job Ledger Entry Ext." extends "Job Ledger Entry"
{
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Job No.")
        {
            Caption = 'Job No.';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Resource Group No.")
        {
            Caption = 'Resource Group No.';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
        }
        modify("Work Type Code")
        {
            Caption = 'Work Type Code';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("Shpt. Method Code")
        {
            Caption = 'Shpt. Method Code';
        }
        modify("Journal Batch Name")
        {
            Caption = 'Journal Batch Name';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("Transaction Type")
        {
            Caption = 'Transaction Type';
        }
        modify("Country/Region Code")
        {
            Caption = 'Country/Region Code';
        }
        modify("Document Date")
        {
            Caption = 'Document Date';
        }
        modify("External Document No.")
        {
            Caption = 'External Document No.';
        }
        modify("Area")
        {
            Caption = 'Area';
        }
        modify("Transaction Specification")
        {
            Caption = 'Transaction Specification';
        }
        modify("Add.-Currency Line Amount")
        {
            Caption = 'Add.-Currency Line Amount';
        }
        modify("Job Task No.")
        {
            Caption = 'Job Task No.';
        }
        modify("Line Amount (LCY)")
        {
            Caption = 'Line Amount (LCY)';
        }
        modify("Line Amount")
        {
            Caption = 'Line Amount';
        }
        modify("Line Discount Amount")
        {
            Caption = 'Line Discount Amount';
        }
        modify("Line Discount Amount (LCY)")
        {
            Caption = 'Line Discount Amount (LCY)';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("Description 2")
        {
            Caption = 'Description 2';
        }
        modify("Ledger Entry No.")
        {
            Caption = 'Ledger Entry No.';
        }
        modify("Serial No.")
        {
            Caption = 'Serial No.';
        }
        modify("Lot No.")
        {
            Caption = 'Lot No.';
        }
        modify("Line Discount %")
        {
            Caption = 'Line Discount %';
        }
        modify("Line Type")
        {
            Caption = 'Line Type';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Bin Code")
        {
            Caption = 'Bin Code';
        }
        modify("Service Order No.")
        {
            Caption = 'Service Order No.';
        }
        modify("Posted Service Shipment No.")
        {
            Caption = 'Posted Service Shipment No.';
        }
        modify("Shipment Method Code")
        {
            Caption = 'Shipment Method Code';
        }
        field(50000; "Global Dimension 3 Code"; Code[10])
        {
            CaptionClass = '1,2,3';

        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            CaptionClass = '1,2,4';

        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            CaptionClass = '1,2,5';

        }
        field(50003; "Global Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';

        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';

        }
        field(50005; Contrapartida; Code[20])
        {
            Editable = false;
            TableRelation = Job;
        }
        field(50006; "Kilos brutos"; Decimal)
        {
        }
        field(50007; "Kilos netos"; Decimal)
        {
        }
        field(50008; "Coste actualizado"; Boolean)
        {
            Editable = false;
        }
        field(50009; "Registro div.-adic."; Option)
        {
            Editable = true;
            OptionCaption = 'None,Only local currency,Only additional currency';
            OptionMembers = Ninguno,"Sólo importe","Sólo importe div.-adic.";
        }
        field(50010; "Concepto proyecto"; Code[10])
        {
            TableRelation = "Concepto proyecto";
        }
        field(50300; "Origen del registro"; Option)
        {
            Editable = false;
            OptionMembers = " ",Compras,Ventas,,,,"Reparto GG";
        }
        field(50301; "Importe factura (DL)"; Decimal)
        {
            AutoFormatType = 1;
        }
        field(50302; "Importe factura IVA inc. (DL)"; Decimal)
        {
            AutoFormatType = 1;
        }
        field(50305; "Customer/vendor invoice code"; Code[20])
        {
            Caption = 'Customer/vendor invoice code';
            TableRelation = IF ("Origen del registro" = CONST(Compras)) Vendor
            ELSE
            IF ("Origen del registro" = CONST(Ventas)) Customer;
        }
        field(50306; "Customer/vendor sale code"; Code[20])
        {
            Caption = 'Customer/vendor sale code';
            TableRelation = IF ("Origen del registro" = CONST(Compras)) Vendor
            ELSE
            IF ("Origen del registro" = CONST(Ventas)) Customer;
        }
        field(50402; "Centro coste"; Text[1])
        {
        }
        field(50403; "No pedido compras"; Code[30])
        {
        }
        field(50500; "No. documento ajuste"; Code[30])
        {
        }
        field(50501; "A cobrar"; Boolean)
        {
        }
        field(50502; "Importe a liquidar"; Decimal)
        {
        }
        field(50505; "Nombre libro diario"; Code[10])
        {
        }
        field(50510; "Id. Sociedad"; Code[10])
        {
        }
        field(50511; "Id. Empleado"; Code[20])
        {
        }
        field(50512; "Cód. cuenta"; Code[20])
        {
        }
        field(50513; Proyecto; Code[20])
        {
        }
        field(50514; "Id. Empresa"; Code[10])
        {
        }
        field(50515; "Fecha pago"; Date)
        {
        }
        field(50516; "Fecha imputación"; Date)
        {
        }
        field(50517; "Tipo imputación"; Code[10])
        {
        }
        field(50518; "Id. Categoría"; Code[10])
        {
        }
        field(50519; "Nombre Categoría"; Text[100])
        {
        }
        field(50520; "Id. puesto"; Code[10])
        {
        }
        field(50521; "Nombre puesto"; Text[100])
        {
        }
        field(50522; "Id. nacionalidad"; Code[10])
        {
        }
        field(50523; "Fecha sicore"; Date)
        {
        }
        field(50524; Importe; Decimal)
        {
        }
        field(50525; "Fecha de importación"; DateTime)
        {
        }
        field(50526; Buque; Code[10])
        {
        }
        field(50527; Marea; Code[10])
        {
        }
        field(50528; Costo; Code[10])
        {
        }
        field(50597; "Fecha anulación"; Date)
        {
        }
        field(50598; "Usuario anulación"; Code[20])
        {
        }
        field(50599; Anulado; Boolean)
        {
        }
        field(60000; Horas; Decimal)
        {
        }
        field(60001; Kilos; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 3;
        }
        field(60002; "Precio kilo"; Decimal)
        {
            AutoFormatType = 2;
            BlankZero = true;
        }
        field(60003; "Importe bruto pesca"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
        }
        field(60004; "Precio kilo tripulación"; Decimal)
        {
            AutoFormatType = 2;
        }
        field(60005; "Valor captura tripulación"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Editable = false;
        }
    }
}

