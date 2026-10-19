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
            Caption = 'Global Dimension 3 Code';
            ToolTip = 'Specifies the value of the Global Dimension 3 Code field.';
            CaptionClass = '1,2,3';

        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            Caption = 'Global Dimension 4 Code';
            ToolTip = 'Specifies the value of the Global Dimension 4 Code field.';
            CaptionClass = '1,2,4';

        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            Caption = 'Global Dimension 5 Code';
            ToolTip = 'Specifies the value of the Global Dimension 5 Code field.';
            CaptionClass = '1,2,5';

        }
        field(50003; "Global Dimension 6 Code"; Code[20])
        {
            Caption = 'Global Dimension 6 Code';
            ToolTip = 'Specifies the value of the Global Dimension 6 Code field.';
            CaptionClass = '1,2,6';

        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            Caption = 'Global Dimension 7 Code';
            ToolTip = 'Specifies the value of the Global Dimension 7 Code field.';
            CaptionClass = '1,2,7';

        }
        field(50005; Contrapartida; Code[20])
        {
            Caption = 'Contrapartida';
            ToolTip = 'Specifies the value of the Contrapartida field.';
            Editable = false;
            TableRelation = Job;
        }
        field(50006; "Kilos brutos"; Decimal)
        {
            Caption = 'Kilos brutos';
            ToolTip = 'Specifies the value of the Kilos brutos field.';
        }
        field(50007; "Kilos netos"; Decimal)
        {
            Caption = 'Kilos netos';
            ToolTip = 'Specifies the value of the Kilos netos field.';
        }
        field(50008; "Coste actualizado"; Boolean)
        {
            Caption = 'Coste actualizado';
            ToolTip = 'Specifies the value of the Coste actualizado field.';
            Editable = false;
        }
        field(50009; "Registro div.-adic."; Option)
        {
            Caption = 'Additional-Currency Posting';
            ToolTip = 'Specifies the value of the Additional-Currency Posting field.';
            Editable = true;
            OptionCaption = 'None,Only local currency,Only additional currency';
            OptionMembers = Ninguno,"Sólo importe","Sólo importe div.-adic.";
        }
        field(50010; "Concepto proyecto"; Code[10])
        {
            Caption = 'Job concept';
            ToolTip = 'Specifies the value of the Job concept field.';
            TableRelation = "Concepto proyecto";
        }
        field(50300; "Origen del registro"; Option)
        {
            Caption = 'Origen del registro';
            ToolTip = 'Specifies the value of the Origen del registro field.';
            Editable = false;
            OptionMembers = " ",Compras,Ventas,,,,"Reparto GG";
        }
        field(50301; "Importe factura (DL)"; Decimal)
        {
            Caption = 'Importe factura (DL)';
            ToolTip = 'Specifies the value of the Importe factura (DL) field.';
            AutoFormatType = 1;
        }
        field(50302; "Importe factura IVA inc. (DL)"; Decimal)
        {
            Caption = 'Importe factura IVA inc. (DL)';
            ToolTip = 'Specifies the value of the Importe factura IVA inc. (DL) field.';
            AutoFormatType = 1;
        }
        field(50305; "Customer/vendor invoice code"; Code[20])
        {
            Caption = 'Customer/vendor invoice code';
            ToolTip = 'Specifies the value of the Customer/vendor invoice code field.';
            TableRelation = IF ("Origen del registro" = CONST(Compras)) Vendor
            ELSE
            IF ("Origen del registro" = CONST(Ventas)) Customer;
        }
        field(50306; "Customer/vendor sale code"; Code[20])
        {
            Caption = 'Customer/vendor sale code';
            ToolTip = 'Specifies the value of the Customer/vendor sale code field.';
            TableRelation = IF ("Origen del registro" = CONST(Compras)) Vendor
            ELSE
            IF ("Origen del registro" = CONST(Ventas)) Customer;
        }
        field(50402; "Centro coste"; Text[1])
        {
            Caption = 'Cost Center';
            ToolTip = 'Specifies the value of the Cost Center field.';
        }
        field(50403; "No pedido compras"; Code[30])
        {
            Caption = 'No pedido compras';
            ToolTip = 'Specifies the value of the No pedido compras field.';
        }
        field(50500; "No. documento ajuste"; Code[30])
        {
            Caption = 'No. documento ajuste';
            ToolTip = 'Specifies the value of the No. documento ajuste field.';
        }
        field(50501; "A cobrar"; Boolean)
        {
            Caption = 'A cobrar';
            ToolTip = 'Specifies the value of the A cobrar field.';
        }
        field(50502; "Importe a liquidar"; Decimal)
        {
            Caption = 'Importe a liquidar';
            ToolTip = 'Specifies the value of the Importe a liquidar field.';
        }
        field(50505; "Nombre libro diario"; Code[10])
        {
            Caption = 'Nombre libro diario';
            ToolTip = 'Specifies the value of the Nombre libro diario field.';
        }
        field(50510; "Id. Sociedad"; Code[10])
        {
            Caption = 'Id. Sociedad';
            ToolTip = 'Specifies the value of the Id. Sociedad field.';
        }
        field(50511; "Id. Empleado"; Code[20])
        {
            Caption = 'Id. Empleado';
            ToolTip = 'Specifies the value of the Id. Empleado field.';
        }
        field(50512; "Cód. cuenta"; Code[20])
        {
            Caption = 'Cód. cuenta';
            ToolTip = 'Specifies the value of the Cód. cuenta field.';
        }
        field(50513; Proyecto; Code[20])
        {
            Caption = 'Proyecto';
            ToolTip = 'Specifies the value of the Proyecto field.';
        }
        field(50514; "Id. Empresa"; Code[10])
        {
            Caption = 'Id. Empresa';
            ToolTip = 'Specifies the value of the Id. Empresa field.';
        }
        field(50515; "Fecha pago"; Date)
        {
            Caption = 'Fecha pago';
            ToolTip = 'Specifies the value of the Fecha pago field.';
        }
        field(50516; "Fecha imputación"; Date)
        {
            Caption = 'Fecha imputación';
            ToolTip = 'Specifies the value of the Fecha imputación field.';
        }
        field(50517; "Tipo imputación"; Code[10])
        {
            Caption = 'Tipo imputación';
            ToolTip = 'Specifies the value of the Tipo imputación field.';
        }
        field(50518; "Id. Categoría"; Code[10])
        {
            Caption = 'Id. Categoría';
            ToolTip = 'Specifies the value of the Id. Categoría field.';
        }
        field(50519; "Nombre Categoría"; Text[100])
        {
            Caption = 'Nombre Categoría';
            ToolTip = 'Specifies the value of the Nombre Categoría field.';
        }
        field(50520; "Id. puesto"; Code[10])
        {
            Caption = 'Id. puesto';
            ToolTip = 'Specifies the value of the Id. puesto field.';
        }
        field(50521; "Nombre puesto"; Text[100])
        {
            Caption = 'Nombre puesto';
            ToolTip = 'Specifies the value of the Nombre puesto field.';
        }
        field(50522; "Id. nacionalidad"; Code[10])
        {
            Caption = 'Id. nacionalidad';
            ToolTip = 'Specifies the value of the Id. nacionalidad field.';
        }
        field(50523; "Fecha sicore"; Date)
        {
            Caption = 'Fecha sicore';
            ToolTip = 'Specifies the value of the Fecha sicore field.';
        }
        field(50524; Importe; Decimal)
        {
            Caption = 'Importe';
            ToolTip = 'Specifies the value of the Importe field.';
        }
        field(50525; "Fecha de importación"; DateTime)
        {
            Caption = 'Import date';
            ToolTip = 'Specifies the value of the Import date field.';
        }
        field(50526; Buque; Code[10])
        {
            Caption = 'Buque';
            ToolTip = 'Specifies the value of the Buque field.';
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(50527; Marea; Code[10])
        {
            Caption = 'Marea';
            ToolTip = 'Specifies the value of the Marea field.';
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(50528; Costo; Code[10])
        {
            Caption = 'Costo';
            ToolTip = 'Specifies the value of the Costo field.';
        }
        field(50597; "Fecha anulación"; Date)
        {
            Caption = 'Fecha anulación';
            ToolTip = 'Specifies the value of the Fecha anulación field.';
        }
        field(50598; "Usuario anulación"; Code[20])
        {
            Caption = 'Usuario anulación';
            ToolTip = 'Specifies the value of the Usuario anulación field.';
        }
        field(50599; Anulado; Boolean)
        {
            Caption = 'Anulado';
            ToolTip = 'Specifies the value of the Anulado field.';
        }
        field(60000; Horas; Decimal)
        {
            Caption = 'Horas';
            ToolTip = 'Specifies the value of the Horas field.';
        }
        field(60001; Kilos; Decimal)
        {
            Caption = 'Kilos';
            ToolTip = 'Specifies the value of the Kilos field.';
            BlankZero = true;
            DecimalPlaces = 0 : 3;
        }
        field(60002; "Precio kilo"; Decimal)
        {
            Caption = 'Precio kilo';
            ToolTip = 'Specifies the value of the Precio kilo field.';
            AutoFormatType = 2;
            BlankZero = true;
        }
        field(60003; "Importe bruto pesca"; Decimal)
        {
            Caption = 'Importe bruto pesca';
            ToolTip = 'Specifies the value of the Importe bruto pesca field.';
            AutoFormatType = 1;
            BlankZero = true;
        }
        field(60004; "Precio kilo tripulación"; Decimal)
        {
            Caption = 'Precio kilo tripulación';
            ToolTip = 'Specifies the value of the Precio kilo tripulación field.';
            AutoFormatType = 2;
        }
        field(60005; "Valor captura tripulación"; Decimal)
        {
            Caption = 'Valor captura tripulación';
            ToolTip = 'Specifies the value of the Valor captura tripulación field.';
            AutoFormatType = 1;
            BlankZero = true;
            Editable = false;
        }
    }
}

