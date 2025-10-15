tableextension 50075 "Sales Invoice Line Ext." extends "Sales Invoice Line"
{
    Caption = 'Sales Invoice Line';
    fields
    {
        modify("Sell-to Customer No.")
        {
            Caption = 'Sell-to Customer No.';
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
        modify("Shipment Date")
        {
            Caption = 'Shipment Date';
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
        modify("Line Discount Amount")
        {
            Caption = 'Line Discount Amount';
        }
        modify("Appl.-to Item Entry")
        {
            Caption = 'Appl.-to Item Entry';
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        modify("Shortcut Dimension 2 Code")
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        modify("Job No.")
        {
            Caption = 'Job No.';
        }
        modify("Work Type Code")
        {
            Caption = 'Work Type Code';
        }
        modify("Shipment No.")
        {
            Caption = 'Shipment No.';
        }
        modify("Shipment Line No.")
        {
            Caption = 'Shipment Line No.';
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
        modify("Drop Shipment")
        {
            Caption = 'Drop Shipment';
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
        modify("Tax Category")
        {
            Caption = 'Tax Category';
        }
        modify("Tax Area Code")
        {
            Caption = 'Tax Area Code';
        }
        modify("Tax Group Code")
        {
            Caption = 'Tax Group Code';
        }
        modify("VAT Clause Code")
        {
            Caption = 'VAT Clause Code';
        }
        modify("Blanket Order No.")
        {
            Caption = 'Blanket Order No.';
        }
        modify("Blanket Order Line No.")
        {
            Caption = 'Blanket Order Line No.';
        }
        modify("System-Created Entry")
        {
            Caption = 'System-Created Entry';
        }
        modify("Line Amount")
        {
            Caption = 'Line Amount';
        }
        modify("Prepayment Line")
        {
            Caption = 'Prepayment Line';
        }
        modify("IC Partner Code")
        {
            Caption = 'IC Partner Code';
        }
        modify("Line Discount Calculation")
        {
            Caption = 'Line Discount Calculation';
        }
        modify("Job Task No.")
        {
            Caption = 'Job Task No.';
        }
        modify("Job Contract Entry No.")
        {
            Caption = 'Job Contract Entry No.';
        }
        modify("Deferral Code")
        {
            Caption = 'Deferral Code';
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
        modify("Depreciation Book Code")
        {
            Caption = 'Depreciation Book Code';
        }
        modify("Item Category Code")
        {
            Caption = 'Item Category Code';
        }
        modify(Nonstock)
        {
            Caption = 'Catalog';
        }
        modify("Purchasing Code")
        {
            Caption = 'Purchasing Code';
        }
        modify("Return Reason Code")
        {
            Caption = 'Return Reason Code';
        }
        modify("Allow Line Disc.")
        {
            Caption = 'Allow Line Disc.';
        }
        modify("Price description")
        {
            Caption = 'Price description';
        }
        field(50000; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';

        }
        field(50001; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 3 Code';

        }
        field(50002; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 3 Code';

        }
        field(50003; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 3 Code';

        }
        field(50004; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 3 Code';

        }
        field(50005; Facturado; Boolean)
        {
        }
        field(50006; "Precio x Kilo"; Decimal)
        {
        }
        field(50007; "No. Pallet"; Code[10])
        {
        }
        field(50008; Confirmada; Boolean)
        {
        }
        field(50009; "Descripción Interna"; Text[250])
        {
        }
        field(50010; "Gross kilos"; Decimal)
        {
        }
        field(50011; Usuario; Code[20])
        {
        }
        field(50012; Rechazada; Boolean)
        {
        }
        field(50013; "Net kilos"; Decimal)
        {
        }
        field(50014; "% Precio Kilo"; Decimal)
        {
        }
        field(50015; "Outstanding Net Kilos"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50016; "Net kilos to Invoice"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50017; "Net kilos to Ship"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50018; "Outstanding Gross Kilos"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50019; "Gross kilos to Invoice"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50020; "Gross kilos to Ship"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50021; "Net kilos (Base)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
        }
        field(50022; "Outstanding Net Kilos (Base)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50023; "Net kilos to Invoice (Base)"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50024; "xCod. IVA Prod."; Code[10])
        {
        }
        field(50025; "Net kilos to Ship (Base)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50026; "NK Shipped Not Invd. (Base)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50027; "Net Kilos Shipped (Base)"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50028; "Net Kilos Invoiced (Base)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50029; "Reserved net kilos (Base)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50030; "Gross kilos (Base)"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50031; "Outstanding Gross Kilos (Base)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50032; "Gross Kilos to Invoice (Base)"; Decimal)
        {
            BlankZero = false;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50033; "Gross Kilos to Ship (Base)"; Decimal)
        {
            BlankZero = false;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50034; "GK Shipped Not Invd. (Base)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50035; "Gross Kilos Shipped (Base)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50036; "Gross kilos Invoiced (Base)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50037; "Reserved Gross kilos (Base)"; Decimal)
        {
            Caption = 'Reserved Gross kilos (Base)';
        }
        field(50038; "NK Shipped Not Invoiced"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50040; "Net Kilos Shipped"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50041; "Net Kilos Invoiced"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50042; "GK Shipped Not Invoiced"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50044; "Gross Kilos Shipped"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50045; "Gross Kilos Invoiced"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50046; "Permiso de embarque"; Code[30])
        {
        }
        field(50047; "Cód. transportista"; Code[20])
        {
            TableRelation = "Shipping Agent";
        }
        field(50048; "Cód. contenedor"; Code[20])
        {
        }
        field(50049; Familia; Code[3])
        {
            TableRelation = "Familia producto";
        }
        field(50050; Subfamilia; Code[20])
        {
            TableRelation = "Subfamilia producto" WHERE("Family code" = FIELD(Familia));
        }
        field(50051; "% Dto. KN"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(50052; "% Dto. KB"; Decimal)
        {
        }
        field(50053; "KN ajuste"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(50054; "KB ajuste"; Decimal)
        {
        }
        field(50055; "Cód. concepto ajuste"; Code[10])
        {
            TableRelation = "AFIP Interface Register";
        }
        field(50056; "Cód. arancelario"; Code[20])
        {
        }
        field(50057; "Remito origen"; Code[20])
        {
        }
        field(50058; "Línea remito origen"; Integer)
        {
        }
        field(50059; "Número de Item"; Code[20])
        {
        }
        field(50060; "Número de Subitem"; Code[20])
        {
        }
        field(50061; "Lote origen"; Code[20])
        {
        }
        field(50062; "Línea ajustada"; Integer)
        {
        }
        field(50063; "KN Originales"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(50064; "KB Originales"; Decimal)
        {
        }
        field(50065; "No. remito oficial"; Code[20])
        {
        }
        field(50066; "No. lín. remito oficial"; Integer)
        {
            BlankZero = true;
        }
        field(50069; "Importe USD"; Decimal)
        {
        }
        field(50070; "Puerto destino"; Code[10])
        {
            TableRelation = "Entry/Exit Point";
        }
        field(50071; "Cód. categorización"; Code[10])
        {
            TableRelation = "Categorizacion productos";
        }
        field(50072; "Especie de productos"; Option)
        {
            OptionMembers = " ","L{Langostino}","C{Calamar}","M{Merluza}","Z{Centolla}";
        }
        field(50073; "Nivel de producción"; Option)
        {
            OptionMembers = " ","Materia Prima",Semielaborado,"Producto Terminado",Residuos;
        }
        field(50074; Procedencia; Option)
        {
            OptionMembers = " ",Buques,Planta;
        }
        field(50075; "Propiedad producto"; Option)
        {
            OptionMembers = " ",Propio,Tercero,Comprado;
        }
        field(50076; "Cód. ingresos brutos"; Code[10])
        {
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER("Ingresos Brutos"));
        }
        field(50077; "Seguimiento para trazabilidad"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Post-Expo - Controlar contra DCL","No controlar contra DCL","Pre-Expo - Controlar contra DCL";
        }
        field(50079; "DCL application date formula"; Text[30])
        {
            Caption = 'Fórmula de aplicación de fechas de DCL';
            DataClassification = ToBeClassified;
        }
        field(50080; "Importe DL"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50081; "Sello Argentino"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50100; "Tipo factura"; Option)
        {
            OptionMembers = Venta,Servicios,"Disminución coste",Anticipo;
        }
        field(50140; "No. reparto"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50141; "Linea reparto"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50142; "Ommit position validation"; Boolean)
        {
            Caption = 'Omitir validación de posición';
            DataClassification = ToBeClassified;
        }
        field(50500; "No. remito"; Code[30])
        {
            Editable = true;
        }
        field(50501; "No. línea remito"; Integer)
        {
            Editable = false;
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
        field(50700; "Old job no."; Code[20])
        {
            TableRelation = Job;
        }
        field(50701; Provincia; Code[10])
        {
        }
        field(50702; "No. despacho"; Code[10])
        {
        }
    }
}

