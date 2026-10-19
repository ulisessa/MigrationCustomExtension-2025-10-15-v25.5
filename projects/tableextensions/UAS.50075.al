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
            ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';

        }
        field(50001; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 3 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';

        }
        field(50002; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 3 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';

        }
        field(50003; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 3 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';

        }
        field(50004; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 3 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';

        }
        field(50005; Facturado; Boolean)
        {
            Caption = 'Facturado';
            ToolTip = 'Specifies the value of the Facturado field.';
        }
        field(50006; "Precio x Kilo"; Decimal)
        {
            Caption = 'Precio x Kilo';
            ToolTip = 'Specifies the value of the Precio x Kilo field.';
        }
        field(50007; "No. Pallet"; Code[10])
        {
            Caption = 'Pallet no.';
            ToolTip = 'Specifies the value of the Pallet no field.';
        }
        field(50008; Confirmada; Boolean)
        {
            Caption = 'Confirmada';
            ToolTip = 'Specifies the value of the Confirmada field.';
        }
        field(50009; "Descripción Interna"; Text[250])
        {
            Caption = 'Descripción Interna';
            ToolTip = 'Specifies the value of the Descripción Interna field.';
        }
        field(50010; "Gross kilos"; Decimal)
        {
            Caption = 'Gross kilos';
            ToolTip = 'Specifies the value of the Gross kilos field.';
        }
        field(50011; Usuario; Code[20])
        {
            Caption = 'User ID';
            ToolTip = 'Specifies the value of the User ID field.';
        }
        field(50012; Rechazada; Boolean)
        {
            Caption = 'Rechazada';
            ToolTip = 'Specifies the value of the Rechazada field.';
        }
        field(50013; "Net kilos"; Decimal)
        {
            Caption = 'Net kilos';
            ToolTip = 'Specifies the value of the Net kilos field.';
        }
        field(50014; "% Precio Kilo"; Decimal)
        {
            Caption = '% price per kilo';
            ToolTip = 'Specifies the value of the % price per kilo field.';
        }
        field(50015; "Outstanding Net Kilos"; Decimal)
        {
            Caption = 'Outstanding Net Kilos';
            ToolTip = 'Specifies the value of the Outstanding Net Kilos field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50016; "Net kilos to Invoice"; Decimal)
        {
            Caption = 'Net kilos to Invoice';
            ToolTip = 'Specifies the value of the Net kilos to Invoice field.';
            DecimalPlaces = 0 : 5;
        }
        field(50017; "Net kilos to Ship"; Decimal)
        {
            Caption = 'Net kilos to Ship';
            ToolTip = 'Specifies the value of the Net kilos to Ship field.';
            DecimalPlaces = 0 : 5;
        }
        field(50018; "Outstanding Gross Kilos"; Decimal)
        {
            Caption = 'Outstanding Gross Kilos';
            ToolTip = 'Specifies the value of the Outstanding Gross Kilos field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50019; "Gross kilos to Invoice"; Decimal)
        {
            Caption = 'Gross kilos to Invoice';
            ToolTip = 'Specifies the value of the Gross kilos to Invoice field.';
            DecimalPlaces = 0 : 5;
        }
        field(50020; "Gross kilos to Ship"; Decimal)
        {
            Caption = 'Gross kilos to Ship';
            ToolTip = 'Specifies the value of the Gross kilos to Ship field.';
            DecimalPlaces = 0 : 5;
        }
        field(50021; "Net kilos (Base)"; Decimal)
        {
            Caption = 'Net kilos (Base)';
            ToolTip = 'Specifies the value of the Net kilos (Base) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
        }
        field(50022; "Outstanding Net Kilos (Base)"; Decimal)
        {
            Caption = 'Outstanding Net Kilos (Base)';
            ToolTip = 'Specifies the value of the Outstanding Net Kilos (Base) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50023; "Net kilos to Invoice (Base)"; Decimal)
        {
            Caption = 'Net kilos to Invoice (Base)';
            ToolTip = 'Specifies the value of the Net kilos to Invoice (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50024; "xCod. IVA Prod."; Code[10])
        {
            Caption = 'xCod. IVA Prod.';
            ToolTip = 'Specifies the value of the xCod. IVA Prod field.';
        }
        field(50025; "Net kilos to Ship (Base)"; Decimal)
        {
            Caption = 'Net kilos to Ship (Base)';
            ToolTip = 'Specifies the value of the Net kilos to Ship (Base) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50026; "NK Shipped Not Invd. (Base)"; Decimal)
        {
            Caption = 'NK Shipped Not Invd. (Base)';
            ToolTip = 'Specifies the value of the NK Shipped Not Invd. (Base) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50027; "Net Kilos Shipped (Base)"; Decimal)
        {
            Caption = 'Net Kilos Shipped (Base)';
            ToolTip = 'Specifies the value of the Net Kilos Shipped (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50028; "Net Kilos Invoiced (Base)"; Decimal)
        {
            Caption = 'Net Kilos Invoiced (Base)';
            ToolTip = 'Specifies the value of the Net Kilos Invoiced (Base) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50029; "Reserved net kilos (Base)"; Decimal)
        {
            Caption = 'Reserved net kilos (Base)';
            ToolTip = 'Specifies the value of the Reserved net kilos (Base) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50030; "Gross kilos (Base)"; Decimal)
        {
            Caption = 'Gross kilos (Base)';
            ToolTip = 'Specifies the value of the Gross kilos (Base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50031; "Outstanding Gross Kilos (Base)"; Decimal)
        {
            Caption = 'Outstanding Gross Kilos (Base)';
            ToolTip = 'Specifies the value of the Outstanding Gross Kilos (Base) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50032; "Gross Kilos to Invoice (Base)"; Decimal)
        {
            Caption = 'Gross Kilos to Invoice (Base)';
            ToolTip = 'Specifies the value of the Gross Kilos to Invoice (Base) field.';
            BlankZero = false;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50033; "Gross Kilos to Ship (Base)"; Decimal)
        {
            Caption = 'Gross Kilos to Ship (Base)';
            ToolTip = 'Specifies the value of the Gross Kilos to Ship (Base) field.';
            BlankZero = false;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50034; "GK Shipped Not Invd. (Base)"; Decimal)
        {
            Caption = 'GK Shipped Not Invd. (Base)';
            ToolTip = 'Specifies the value of the GK Shipped Not Invd. (Base) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50035; "Gross Kilos Shipped (Base)"; Decimal)
        {
            Caption = 'Gross Kilos Shipped (Base)';
            ToolTip = 'Specifies the value of the Gross Kilos Shipped (Base) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50036; "Gross kilos Invoiced (Base)"; Decimal)
        {
            Caption = 'Gross kilos Invoiced (Base)';
            ToolTip = 'Specifies the value of the Gross kilos Invoiced (Base) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50037; "Reserved Gross kilos (Base)"; Decimal)
        {
            Caption = 'Reserved Gross kilos (Base)';
            ToolTip = 'Specifies the value of the Reserved Gross kilos (Base) field.';
        }
        field(50038; "NK Shipped Not Invoiced"; Decimal)
        {
            Caption = 'NK Shipped Not Invoiced';
            ToolTip = 'Specifies the value of the NK Shipped Not Invoiced field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50040; "Net Kilos Shipped"; Decimal)
        {
            Caption = 'Net Kilos Shipped';
            ToolTip = 'Specifies the value of the Net Kilos Shipped field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50041; "Net Kilos Invoiced"; Decimal)
        {
            Caption = 'Net Kilos Invoiced';
            ToolTip = 'Specifies the value of the Net Kilos Invoiced field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50042; "GK Shipped Not Invoiced"; Decimal)
        {
            Caption = 'GK Shipped Not Invoiced';
            ToolTip = 'Specifies the value of the GK Shipped Not Invoiced field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50044; "Gross Kilos Shipped"; Decimal)
        {
            Caption = 'Gross Kilos Shipped';
            ToolTip = 'Specifies the value of the Gross Kilos Shipped field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50045; "Gross Kilos Invoiced"; Decimal)
        {
            Caption = 'Gross Kilos Invoiced';
            ToolTip = 'Specifies the value of the Gross Kilos Invoiced field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50046; "Permiso de embarque"; Code[30])
        {
            Caption = 'Boarding permission';
            ToolTip = 'Specifies the value of the Boarding permission field.';
        }
        field(50047; "Cód. transportista"; Code[20])
        {
            Caption = 'Shipping Agent Code';
            ToolTip = 'Specifies the value of the Shipping Agent Code field.';
            TableRelation = "Shipping Agent";
        }
        field(50048; "Cód. contenedor"; Code[20])
        {
            Caption = 'Cód. contenedor';
            ToolTip = 'Specifies the value of the Cód. contenedor field.';
        }
        field(50049; Familia; Code[3])
        {
            Caption = 'Family';
            ToolTip = 'Specifies the value of the Family field.';
            TableRelation = "Familia producto";
        }
        field(50050; Subfamilia; Code[20])
        {
            Caption = 'Subfamily';
            ToolTip = 'Specifies the value of the Subfamily field.';
            TableRelation = "Subfamilia producto" WHERE("Family code" = FIELD(Familia));
        }
        field(50051; "% Dto. KN"; Decimal)
        {
            Caption = '% Dto. KN';
            ToolTip = 'Specifies the value of the % Dto. KN field.';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(50052; "% Dto. KB"; Decimal)
        {
            Caption = '% Dto. KB';
            ToolTip = 'Specifies the value of the % Dto. KB field.';
        }
        field(50053; "KN ajuste"; Decimal)
        {
            Caption = 'KN ajuste';
            ToolTip = 'Specifies the value of the KN ajuste field.';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(50054; "KB ajuste"; Decimal)
        {
            Caption = 'KB ajuste';
            ToolTip = 'Specifies the value of the KB ajuste field.';
        }
        field(50055; "Cód. concepto ajuste"; Code[10])
        {
            Caption = 'Cód. concepto ajuste';
            ToolTip = 'Specifies the value of the Cód. concepto ajuste field.';
            TableRelation = "AFIP Interface Register";
        }
        field(50056; "Cód. arancelario"; Code[20])
        {
            Caption = 'Tariff No.';
            ToolTip = 'Specifies the value of the Tariff No field.';
        }
        field(50057; "Remito origen"; Code[20])
        {
            Caption = 'Remito origen';
            ToolTip = 'Specifies the value of the Remito origen field.';
        }
        field(50058; "Línea remito origen"; Integer)
        {
            Caption = 'Línea remito origen';
            ToolTip = 'Specifies the value of the Línea remito origen field.';
        }
        field(50059; "Número de Item"; Code[20])
        {
            Caption = 'Número de Item';
            ToolTip = 'Specifies the value of the Número de Item field.';
        }
        field(50060; "Número de Subitem"; Code[20])
        {
            Caption = 'Número de Subitem';
            ToolTip = 'Specifies the value of the Número de Subitem field.';
        }
        field(50061; "Lote origen"; Code[20])
        {
            Caption = 'Lote origen';
            ToolTip = 'Specifies the value of the Lote origen field.';
        }
        field(50062; "Línea ajustada"; Integer)
        {
            Caption = 'Línea ajustada';
            ToolTip = 'Specifies the value of the Línea ajustada field.';
        }
        field(50063; "KN Originales"; Decimal)
        {
            Caption = 'KN Originales';
            ToolTip = 'Specifies the value of the KN Originales field.';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(50064; "KB Originales"; Decimal)
        {
            Caption = 'KB Originales';
            ToolTip = 'Specifies the value of the KB Originales field.';
        }
        field(50065; "No. remito oficial"; Code[20])
        {
            Caption = 'No. remito oficial';
            ToolTip = 'Specifies the value of the No. remito oficial field.';
        }
        field(50066; "No. lín. remito oficial"; Integer)
        {
            Caption = 'No. lín. remito oficial';
            ToolTip = 'Specifies the value of the No. lín. remito oficial field.';
            BlankZero = true;
        }
        field(50069; "Importe USD"; Decimal)
        {
            Caption = 'Importe USD';
            ToolTip = 'Specifies the value of the Importe USD field.';
        }
        field(50070; "Puerto destino"; Code[10])
        {
            Caption = 'Puerto destino';
            ToolTip = 'Specifies the value of the Puerto destino field.';
            TableRelation = "Entry/Exit Point";
        }
        field(50071; "Cód. categorización"; Code[10])
        {
            Caption = 'Cód. categorización';
            ToolTip = 'Specifies the value of the Cód. categorización field.';
            TableRelation = "Categorizacion productos";
        }
        field(50072; "Especie de productos"; Option)
        {
            Caption = 'Especie de productos';
            ToolTip = 'Specifies the value of the Especie de productos field.';
            OptionMembers = " ","L{Langostino}","C{Calamar}","M{Merluza}","Z{Centolla}";
        }
        field(50073; "Nivel de producción"; Option)
        {
            Caption = 'Nivel de producción';
            ToolTip = 'Specifies the value of the Nivel de producción field.';
            OptionMembers = " ","Materia Prima",Semielaborado,"Producto Terminado",Residuos;
        }
        field(50074; Procedencia; Option)
        {
            Caption = 'Procedencia';
            ToolTip = 'Specifies the value of the Procedencia field.';
            OptionMembers = " ",Buques,Planta;
        }
        field(50075; "Propiedad producto"; Option)
        {
            Caption = 'Propiedad producto';
            ToolTip = 'Specifies the value of the Propiedad producto field.';
            OptionMembers = " ",Propio,Tercero,Comprado;
        }
        field(50076; "Cód. ingresos brutos"; Code[10])
        {
            Caption = 'Cód. ingresos brutos';
            ToolTip = 'Specifies the value of the Cód. ingresos brutos field.';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER("Ingresos Brutos"));
        }
        field(50077; "Seguimiento para trazabilidad"; Option)
        {
            Caption = 'Seguimiento para trazabilidad';
            ToolTip = 'Specifies the value of the Seguimiento para trazabilidad field.';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Post-Expo - Controlar contra DCL","No controlar contra DCL","Pre-Expo - Controlar contra DCL";
        }
        field(50079; "DCL application date formula"; Text[30])
        {
            Caption = 'Fórmula de aplicación de fechas de DCL';
            ToolTip = 'Specifies the value of the Fórmula de aplicación de fechas de DCL field.';
            DataClassification = ToBeClassified;
        }
        field(50080; "Importe DL"; Decimal)
        {
            Caption = 'Importe DL';
            ToolTip = 'Specifies the value of the Importe DL field.';
            DataClassification = ToBeClassified;
        }
        field(50081; "Sello Argentino"; Boolean)
        {
            Caption = 'Sello Argentino';
            ToolTip = 'Specifies the value of the Sello Argentino field.';
            DataClassification = ToBeClassified;
        }
        field(50082; "MSC"; Boolean)
        {
            Caption = 'MSC';
            ToolTip = 'Specifies the value of the MSC field.';
            DataClassification = ToBeClassified;
        }
        field(50100; "Tipo factura"; Option)
        {
            Caption = 'Tipo factura';
            ToolTip = 'Specifies the value of the Tipo factura field.';
            OptionMembers = Venta,Servicios,"Disminución coste",Anticipo;
        }
        field(50140; "No. reparto"; Code[20])
        {
            Caption = 'No. reparto';
            ToolTip = 'Specifies the value of the No. reparto field.';
            DataClassification = ToBeClassified;
        }
        field(50141; "Linea reparto"; Integer)
        {
            Caption = 'Linea reparto';
            ToolTip = 'Specifies the value of the Linea reparto field.';
            DataClassification = ToBeClassified;
        }
        field(50142; "Ommit position validation"; Boolean)
        {
            Caption = 'Omitir validación de posición';
            ToolTip = 'Specifies the value of the Omitir validación de posición field.';
            DataClassification = ToBeClassified;
        }
        field(50500; "No. remito"; Code[30])
        {
            Caption = 'No. remito';
            ToolTip = 'Specifies the value of the No. remito field.';
            Editable = true;
        }
        field(50501; "No. línea remito"; Integer)
        {
            Caption = 'No. línea remito';
            ToolTip = 'Specifies the value of the No. línea remito field.';
            Editable = false;
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
        field(50700; "Old job no."; Code[20])
        {
            Caption = 'Old job no.';
            ToolTip = 'Specifies the value of the Old job no field.';
            TableRelation = Job;
        }
        field(50701; Provincia; Code[10])
        {
            Caption = 'Provincia';
            ToolTip = 'Specifies the value of the Provincia field.';
        }
        field(50702; "No. despacho"; Code[10])
        {
            Caption = 'No. despacho';
            ToolTip = 'Specifies the value of the No. despacho field.';
        }
    }
}

