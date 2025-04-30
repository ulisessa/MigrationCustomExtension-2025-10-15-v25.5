tableextension 50651 tableextension50651 extends "Sales Line Archive"
{
    Caption = 'Sales Line Archive';
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
        modify("Quantity Disc. Code")
        {
            Caption = 'Quantity Disc. Code';
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
        modify("Price Group Code")
        {
            Caption = 'Price Group Code';
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
        modify("Profit %")
        {
            Caption = 'Profit %';
        }
        modify("Bill-to Customer No.")
        {
            Caption = 'Bill-to Customer No.';
        }
        modify("Purchase Order No.")
        {
            Caption = 'Purchase Order No.';
        }
        modify("Purch. Order Line No.")
        {
            Caption = 'Purch. Order Line No.';
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
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
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
        modify("Prepmt. Line Amount")
        {
            Caption = 'Prepmt. Line Amount';
        }
        modify("Prepayment Tax Area Code")
        {
            Caption = 'Prepayment Tax Area Code';
        }
        modify("Prepayment Tax Group Code")
        {
            Caption = 'Prepayment Tax Group Code';
        }
        modify("Prepayment Line")
        {
            Caption = 'Prepayment Line';
        }
        modify("IC Partner Code")
        {
            Caption = 'IC Partner Code';
        }
        modify("Deferral Code")
        {
            Caption = 'Deferral Code';
        }
        modify("Version No.")
        {
            Caption = 'Version No.';
        }
        modify("Doc. No. Occurrence")
        {
            Caption = 'Doc. No. Occurrence';
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
        modify("Substitution Available")
        {
            Caption = 'Substitution Available';
        }
        modify("Originally Ordered No.")
        {
            Caption = 'Originally Ordered No.';
        }
        modify("Originally Ordered Var. Code")
        {
            Caption = 'Originally Ordered Var. Code';
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
        modify("Special Order Purchase No.")
        {
            Caption = 'Special Order Purchase No.';
        }
        modify("Special Order Purch. Line No.")
        {
            Caption = 'Special Order Purch. Line No.';
        }
        modify("Shipping Time")
        {
            Caption = 'Shipping Time';
        }
        modify("Planned Shipment Date")
        {
            Caption = 'Planned Shipment Date';
        }
        modify("Shipping Agent Code")
        {
            Caption = 'Shipping Agent Code';
        }
        modify("Shipping Agent Service Code")
        {
            Caption = 'Shipping Agent Service Code';
        }
        modify("Service Contract No.")
        {
            Caption = 'Service Contract No.';
        }
        modify("Service Order No.")
        {
            Caption = 'Service Order No.';
        }
        modify("Service Item No.")
        {
            Caption = 'Service Item No.';
        }
        modify("Service Item Line No.")
        {
            Caption = 'Service Item Line No.';
        }
        modify("Serv. Price Adjmt. Gr. Code")
        {
            Caption = 'Serv. Price Adjmt. Gr. Code';
        }
        modify("BOM Item No.")
        {
            Caption = 'BOM Item No.';
        }
        modify("Return Receipt No.")
        {
            Caption = 'Return Receipt No.';
        }
        modify("Return Receipt Line No.")
        {
            Caption = 'Return Receipt Line No.';
        }
        modify("Return Reason Code")
        {
            Caption = 'Return Reason Code';
        }
        modify("Allow Line Disc.")
        {
            Caption = 'Allow Line Disc.';
        }
        field(50000; "Global Dimension 3 Code"; Code[10])
        {
            CaptionClass = '1,1,3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                //IBdos Argentina - USS - 281102 - Inicio Modificación Arbumasa
            end;
        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            CaptionClass = '1,1,4';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            CaptionClass = '1,1,5';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));
        }
        field(50003; "Global Dimension 6 Code"; Code[10])
        {
            CaptionClass = '1,1,6';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));
        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,1,7';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));
        }
        field(50006; "Precio x Kilo"; Decimal)
        {
            DecimalPlaces = 2 : 4;
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
        field(50010; "Kilos Brutos"; Decimal)
        {
        }
        field(50011; Usuario; Code[20])
        {
            TableRelation = User;
        }
        field(50012; Rechazada; Boolean)
        {
        }
        field(50013; "Kilos netos"; Decimal)
        {
        }
        field(50014; "% Precio Kilo"; Decimal)
        {
            DecimalPlaces = 2 : 4;
        }
        field(50015; "Cdad kilos netos pendiente"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50016; "Cdad kilos netos a facturar"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50017; "Cdad kilos netos a enviar"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50018; "Cdad kilos brutos pendiente"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50019; "Cdad kilos brutos a facturar"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50020; "Cdad kilos brutos a enviar"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50021; "Cdad kilos netos (b)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50022; "Cdad k.n. pendiente (b)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50023; "Cdad k.n. a facturar (b)"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50024; "xCod. IVA Prod."; Code[10])
        {
        }
        field(50025; "Cdad k.n. a enviar (b)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50026; "Cdad k.n. enviada no fact. (b)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50027; "Cdad. k.n. enviada (b)"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50028; "Cdad. k.n. facturada (b)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50029; "Cdad. k.n. reservada (base)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50030; "Cdad kilos brutos (b)"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50031; "Cdad k.b. pendiente (b)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50032; "Cdad k.b. a facturar (b)"; Decimal)
        {
            BlankZero = false;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50033; "Cdad k.b. a enviar (b)"; Decimal)
        {
            BlankZero = false;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50034; "Cdad k.b. enviada no fact. (b)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50035; "Cdad. k.b. enviada (b)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50036; "Cdad. k.b. facturada (b)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50037; "Cdad. k.b. reservada (base)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50038; "Cdad k.n. enviada no facturada"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50040; "Cdad k.n. enviada"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50041; "Cdad k.n. facturada"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50042; "Cdad k.b. enviada no facturada"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50044; "Cdad k.b. enviada"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50045; "Cdad k.b. facturada"; Decimal)
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
        field(50051; "KN sin ajuste"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(50052; "KB sin ajuste"; Decimal)
        {
        }
        field(50053; "Ajuste KN"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(50054; "Ajuste KB"; Decimal)
        {
        }
        field(50055; "Cód. concepto ajuste"; Code[10])
        {
            TableRelation = "AFIP Interface Register";
        }
        field(50056; "Cód. arancelario"; Code[20])
        {
            TableRelation = "AFIP Interface Register";
            ValidateTableRelation = false;
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
        field(50067; "x% Bo Bruto"; Decimal)
        {
            BlankZero = true;
            Editable = false;
        }
        field(50068; "Fecha registro"; Date)
        {
        }
        field(50069; "Importe USD"; Decimal)
        {
        }
        field(50070; "Puerto destino"; Code[10])
        {
            TableRelation = "Entry/Exit Point";
        }
        field(50071; "Cód. categorización"; Code[4])
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
        field(50100; "Tipo factura"; Option)
        {
            OptionMembers = Venta,Servicios,"Disminución coste",Anticipo;
        }
        field(50101; "xDto. Factura"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 2;
            Editable = false;
        }
        field(50102; "xDto. P.P."; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 2;
            Editable = false;
        }
        field(50104; "x% I.V.A."; Decimal)
        {
            BlankZero = true;
            Editable = false;
            MaxValue = 100;
            MinValue = 0;
        }
        field(50105; "x% R.E."; Decimal)
        {
            BlankZero = true;
            Editable = false;
            MaxValue = 100;
            MinValue = 0;
        }
        field(50106; "xImporte Bruto"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 2;
            Editable = false;
        }
        field(50108; "xNat. Transacción"; Code[2])
        {
            TableRelation = "Categorizacion productos";
        }
        field(50109; "xModo Transporte"; Code[10])
        {
            TableRelation = "Categorizacion productos";
        }
        field(50110; "xPuerto Carga"; Code[4])
        {
        }
        field(50111; "xProvincia Origen"; Code[2])
        {
            TableRelation = "Concepto proyecto";
        }
        field(50190; "xCod. Subprograma"; Code[10])
        {
            TableRelation = "Employee entry";
        }
        field(50503; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(50504; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
        }
        field(50505; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));
        }
        field(50506; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));
        }
        field(50507; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));
        }
        field(50598; "Usuario Anulación"; Code[20])
        {
        }
        field(50599; Anulado; Boolean)
        {
        }
        field(62340; Subdepartamento; Code[20])
        {
        }
    }
}

