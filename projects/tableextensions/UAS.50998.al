tableextension 50998 tableextension50998 extends "Return Receipt Line"
{
    Caption = 'Return Receipt Line';
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
        modify("Appl.-to Item Entry")
        {
            Caption = 'Appl.-to Item Entry';
        }
        modify("Item Rcpt. Entry No.")
        {
            Caption = 'Item Rcpt. Entry No.';
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
        modify(Correction)
        {
            Caption = 'Correction';
        }
        modify("Return Order No.")
        {
            Caption = 'Return Order No.';
        }
        modify("Return Order Line No.")
        {
            Caption = 'Return Order Line No.';
        }
        modify("Return Reason Code")
        {
            Caption = 'Return Reason Code';
        }
        modify("Allow Line Disc.")
        {
            Caption = 'Allow Line Disc.';
        }
        field(50000; "Global dimension 3 Code"; Code[10])
        {
            Caption = 'Global dimension 3 Code';
            ToolTip = 'Specifies the value of the Global dimension 3 Code field.';
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
        field(50003; "Global dimension 6 Code"; Code[10])
        {
            Caption = 'Global dimension 6 Code';
            ToolTip = 'Specifies the value of the Global dimension 6 Code field.';
            CaptionClass = '1,2,6';

        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            Caption = 'Global Dimension 7 Code';
            ToolTip = 'Specifies the value of the Global Dimension 7 Code field.';
            CaptionClass = '1,2,7';

        }
        field(50006; "Precio x Kilo"; Decimal)
        {
            Caption = 'Precio x Kilo';
            ToolTip = 'Specifies the value of the Precio x Kilo field.';
            DecimalPlaces = 2 : 4;
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

            trigger OnValidate()
            begin

                "Gross kilos (Base)" := CalcCdadBaseKB("Gross kilos");
                if ("Gross kilos" * "Gross Kilos Shipped" < 0) or (Abs("Gross kilos") < Abs("Gross Kilos Shipped")) then
                    FieldError("Gross kilos", StrSubstNo('No puede ser inferior a %1.', FieldName("Gross Kilos Shipped")));
                if ("Gross kilos (Base)" * "Gross Kilos Shipped (Base)" < 0) or (Abs("Gross kilos (Base)") < Abs("Gross Kilos Shipped (Base)")) then
                    FieldError("Gross kilos (Base)", StrSubstNo('No puede ser inferior a %1.', FieldName("Gross Kilos Shipped (Base)")));
                "Gross kilos (Base)" := "Gross kilos";

                InicPendienteKB;
                InicCdadAEnvKB;
            end;
        }
        field(50011; Usuario; Code[20])
        {
            Caption = 'User ID';
            ToolTip = 'Specifies the value of the User ID field.';
            TableRelation = User;
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
            DecimalPlaces = 2 : 4;
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
            Editable = false;
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
            Editable = false;
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
        field(50051; "KN sin ajuste"; Decimal)
        {
            Caption = 'KN sin ajuste';
            ToolTip = 'Specifies the value of the KN sin ajuste field.';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(50052; "KB sin ajuste"; Decimal)
        {
            Caption = 'KB sin ajuste';
            ToolTip = 'Specifies the value of the KB sin ajuste field.';
        }
        field(50053; "Ajuste KN"; Decimal)
        {
            Caption = 'Ajuste KN';
            ToolTip = 'Specifies the value of the Ajuste KN field.';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(50054; "Ajuste KB"; Decimal)
        {
            Caption = 'Ajuste KB';
            ToolTip = 'Specifies the value of the Ajuste KB field.';
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
            TableRelation = "AFIP Interface Register";
            ValidateTableRelation = false;
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
        field(50067; "x% Bo Bruto"; Decimal)
        {
            Caption = 'x% Bo Bruto';
            ToolTip = 'Specifies the value of the x% Bo Bruto field.';
            BlankZero = true;
            Editable = false;
        }
        field(50068; "Fecha registro"; Date)
        {
            Caption = 'Fecha registro';
            ToolTip = 'Specifies the value of the Fecha registro field.';
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
        field(50071; "Cód. categorización"; Code[4])
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
        field(50100; "Tipo factura"; Option)
        {
            Caption = 'Tipo factura';
            ToolTip = 'Specifies the value of the Tipo factura field.';
            OptionMembers = Venta,Servicios,"Disminución coste",Anticipo;
        }
        field(50110; "Net kilos to Assign"; Decimal)
        {
            Caption = 'Qty. to Assign';
            ToolTip = 'Specifies the value of the Qty. to Assign field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50111; "Net kilos Assigned"; Decimal)
        {
            Caption = 'Qty. Assigned';
            ToolTip = 'Specifies the value of the Qty. Assigned field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50112; "Return Net kilos to Receive"; Decimal)
        {
            Caption = 'Return Qty. to Receive';
            ToolTip = 'Specifies the value of the Return Qty. to Receive field.';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            var
                ItemLedgEntry: Record "Item Ledger Entry";
            begin
            end;
        }
        field(50113; "Return NK to Receive (Base)"; Decimal)
        {
            Caption = 'Return Qty. to Receive (Base)';
            ToolTip = 'Specifies the value of the Return Qty. to Receive (Base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50114; "Return NK Rcd. Not Invd."; Decimal)
        {
            Caption = 'Return Qty. Rcd. Not Invd.';
            ToolTip = 'Specifies the value of the Return Qty. Rcd. Not Invd field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50115; "Ret. NK Rcd. Not Invd.(Base)"; Decimal)
        {
            Caption = 'Ret. Qty. Rcd. Not Invd.(Base)';
            ToolTip = 'Specifies the value of the Ret. Qty. Rcd. Not Invd.(Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50116; "Return Rcd. Not Invd. NL"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Return Rcd. Not Invd.';
            ToolTip = 'Specifies the value of the Return Rcd. Not Invd field.';
            Editable = false;

            trigger OnValidate()
            var
                Currency2: Record Currency;
            begin
            end;
        }
        field(50117; "Return Rcd. Not Invd. (LCY) NK"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Return Rcd. Not Invd. (LCY)';
            ToolTip = 'Specifies the value of the Return Rcd. Not Invd. (LCY) field.';
            Editable = false;
        }
        field(50118; "Return Qty. Received Net kilos"; Decimal)
        {
            Caption = 'Return Qty. Received';
            ToolTip = 'Specifies the value of the Return Qty. Received field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50119; "Return Qty. Received (Base) NK"; Decimal)
        {
            Caption = 'Return Qty. Received (Base)';
            ToolTip = 'Specifies the value of the Return Qty. Received (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50120; "Gross kilos to Assign"; Decimal)
        {
            Caption = 'Qty. to Assign';
            ToolTip = 'Specifies the value of the Qty. to Assign field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = Normal;
        }
        field(50121; "Gross kilos Assigned"; Decimal)
        {
            Caption = 'Qty. Assigned';
            ToolTip = 'Specifies the value of the Qty. Assigned field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = Normal;
        }
        field(50122; "Return Gross kilos to Receive"; Decimal)
        {
            Caption = 'Return Qty. to Receive';
            ToolTip = 'Specifies the value of the Return Qty. to Receive field.';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            var
                ItemLedgEntry: Record "Item Ledger Entry";
            begin
            end;
        }
        field(50123; "Return GK to Receive (Base)"; Decimal)
        {
            Caption = 'Return Qty. to Receive (Base)';
            ToolTip = 'Specifies the value of the Return Qty. to Receive (Base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50124; "Return GK Rcd. Not Invd."; Decimal)
        {
            Caption = 'Return Qty. Rcd. Not Invd.';
            ToolTip = 'Specifies the value of the Return Qty. Rcd. Not Invd field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50125; "Ret. GK Rcd. Not Invd.(Base)"; Decimal)
        {
            Caption = 'Ret. Qty. Rcd. Not Invd.(Base)';
            ToolTip = 'Specifies the value of the Ret. Qty. Rcd. Not Invd.(Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50126; "Return Rcd. Not Invd. GK"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Return Rcd. Not Invd.';
            ToolTip = 'Specifies the value of the Return Rcd. Not Invd field.';
            Editable = false;

            trigger OnValidate()
            var
                Currency2: Record Currency;
            begin
            end;
        }
        field(50127; "Return Rcd. Not Invd. (LCY) GK"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Return Rcd. Not Invd. (LCY)';
            ToolTip = 'Specifies the value of the Return Rcd. Not Invd. (LCY) field.';
            Editable = false;
        }
        field(50128; "Return Gross kilos Received"; Decimal)
        {
            Caption = 'Return Qty. Received';
            ToolTip = 'Specifies the value of the Return Qty. Received field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50129; "Return GK Received (Base)"; Decimal)
        {
            Caption = 'Return Qty. Received (Base)';
            ToolTip = 'Specifies the value of the Return Qty. Received (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50503; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';

        }
        field(50504; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';

        }
        field(50505; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';

        }
        field(50506; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';

        }
        field(50507; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';

        }
        field(50598; "Usuario Anulación"; Code[20])
        {
            Caption = 'Usuario Anulación';
            ToolTip = 'Specifies the value of the Usuario Anulación field.';
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
    }

    procedure Seguridad(TipoVal: Option Modificar,Aprobar,"Registrar/Enviar Pedidos","Facturación Automática","Registrar Factura",Confirmar,Eliminar; FieldNME: Text[30])
    var
        rstCabVenta: Record "Return Receipt Header";
        rstSeguridadUsuario: Record "Seguridad por usuario";
        rstSeguridad: Record Seguridad;
        codUsuario: Code[50];
    begin
        Clear(rstSeguridadUsuario);
        Clear(rstSeguridad);
        Clear(rstCabVenta);
        codUsuario := '';
        rstCabVenta.Get("Document No.");

        if Usuario <> '' then
            codUsuario := Usuario
        else
            codUsuario := rstCabVenta.Usuario;

        if rstSeguridadUsuario.fntSeguridadComparada(codUsuario, UserId) then begin

            if TipoVal = TipoVal::Modificar then begin

                if rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Modificar Líneas Ajenas")) then
                    //No se puede modificar una Ln. confirmada

                    TestField(Confirmada, false);

                //IBdos Argentina - USS - 291102 - Fin Modificación Arbumasa

            end;

            if TipoVal = TipoVal::Confirmar then begin

                if not rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Confirmar Líneas")) then
                    Error('No tiene permisos para confirmar Líneas');

            end;

            if TipoVal = TipoVal::Aprobar then begin

                if not rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Aprobar Pedidos")) then
                    Error('No tiene permisos para aprobar pedidos');

            end;

            if TipoVal = TipoVal::Eliminar then begin

                //IBdos Argentina - USS - 291102 - Inicio Modificación Arbumasa
                //No se puede eliminar una Ln. confirmada

                TestField(Confirmada, false);

                //IBdos Argentina - USS - 291102 - Fin Modificación Arbumasa

            end;

        end
        else begin

            //IBdos Argentina - USS - 291102 - Inicio Modificación Arbumasa

            if (Usuario <> UserId) and (Usuario <> '') then begin

                case TipoVal of

                    TipoVal::Modificar:
                        begin

                            if rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Modificar Líneas Ajenas")) then
                                //No se puede modificar una Ln. confirmada

                                TestField(Confirmada, false);

                            //IBdos Argentina - USS - 291102 - Fin Modificación Arbumasa


                        end;

                    TipoVal::Confirmar:
                        begin

                            if not rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Confirmar Líneas")) then
                                Error('No tiene permisos para confirmar Líneas');

                        end;

                    TipoVal::Eliminar:
                        begin

                            if not rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Modificar Líneas Ajenas")) then
                                //No se puede modificar una Ln. confirmada

                                TestField(Confirmada, false);

                            //IBdos Argentina - USS - 291102 - Fin Modificación Arbumasa

                        end;


                    TipoVal::Aprobar:
                        begin

                            if not rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Confirmar Líneas")) then
                                Error('No tiene permisos para confirmar Líneas');

                        end;

                end;

            end
            else begin

                if (Usuario = UserId) then begin

                    case TipoVal of

                        TipoVal::Modificar:
                            begin

                                //No se puede modificar una Ln. confirmada

                                TestField(Confirmada, false);

                                //IBdos Argentina - USS - 291102 - Fin Modificación Arbumasa


                            end;

                        TipoVal::Eliminar:
                            begin

                                //No se puede modificar una Ln. confirmada

                                TestField(Confirmada, false);

                                //IBdos Argentina - USS - 291102 - Fin Modificación Arbumasa

                            end;


                    end;

                end;

            end;

        end;

        if TipoVal = TipoVal::Aprobar then begin

            if not rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Modificar Líneas Ajenas")) then
                Error('No tiene permisos para modificar Líneas ajenas');

        end;

        if TipoVal = TipoVal::"Registrar/Enviar Pedidos" then begin

            if not rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Registrar - Enviar Pedidos")) then
                Error('No tiene permisos para enviar pedidos');

        end;

        if TipoVal = TipoVal::"Facturación Automática" then begin

            if not rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Facturación Automática")) then
                Error('No tiene permisos para facturar automáticamente');

        end;
    end;

    procedure InicCdadAEnvKN()
    begin
        "Net kilos to Ship" := "Outstanding Net Kilos";
        "Net kilos to Ship (Base)" := "Outstanding Net Kilos (Base)";
        InicCdadAFactKN;
    end;

    procedure InicCdadAFactKN()
    begin
        "Net kilos to Invoice" := MaxCdadAFactKN;
        "Net kilos to Invoice (Base)" := MaxCdadBaseAFactKN;
    end;

    procedure InicCdadAEnvKB()
    begin
        "Gross kilos to Ship" := "Outstanding Gross Kilos";
        "Gross Kilos to Ship (Base)" := "Outstanding Gross Kilos (Base)";
        InicCdadAFactKB;
    end;

    procedure InicCdadAFactKB()
    begin
        "Gross kilos to Invoice" := MaxCdadAFactKB;
        "Gross Kilos to Invoice (Base)" := MaxCdadBaseAFactKB;
    end;

    procedure InicPendienteKN()
    begin
        "Outstanding Net Kilos" := "Net kilos" - "Net Kilos Shipped";
        "Outstanding Net Kilos (Base)" := "Net kilos (Base)" - "Net Kilos Shipped (Base)";

        /*IF ("Cdad k.n. enviada" - "Cdad k.n. facturada") >= 0 THEN*/
        "NK Shipped Not Invoiced" := "Net Kilos Shipped" - "Net Kilos Invoiced";
        /*ELSE
          "Cdad k.n. enviada no facturada" := 0;
         */

        /*IF ("Cdad. k.n. enviada (b)" - "Cdad. k.n. facturada (b)") >= 0 THEN*/
        "NK Shipped Not Invd. (Base)" := "Net Kilos Shipped (Base)" - "Net Kilos Invoiced (Base)"
        /*ELSE
          "Cdad k.n. enviada no fact. (b)" := 0;
         */

    end;

    procedure InicPendienteKB()
    begin
        "Outstanding Gross Kilos" := "Gross kilos" - "Gross Kilos Shipped";
        "Outstanding Gross Kilos (Base)" := "Gross kilos (Base)" - "Gross Kilos Shipped (Base)";

        /*IF ("Cdad k.b. enviada" - "Cdad k.b. facturada") >= 0 THEN*/
        "GK Shipped Not Invoiced" := "Gross Kilos Shipped" - "Gross Kilos Invoiced";
        /*ELSE
          "Cdad k.b. enviada no facturada" := 0;
        
        IF ("Cdad. k.b. enviada (b)" - "Cdad. k.b. facturada (b)") >= 0 THEN*/
        "GK Shipped Not Invd. (Base)" := "Gross Kilos Shipped (Base)" - "Gross kilos Invoiced (Base)";
        /*ELSE
          "Cdad k.b. enviada no fact. (b)" := 0;
         */

    end;

    procedure MaxCdadAFactKN(): Decimal
    begin
        /*IF ("Cdad k.n. enviada" + "Cdad kilos netos a enviar" - "Cdad k.n. facturada") >= 0 THEN*/
        exit("Net Kilos Shipped" + "Net kilos to Ship" - "Net Kilos Invoiced")
        /*ELSE
          EXIT(0);
         */

    end;

    procedure MaxCdadBaseAFactKN(): Decimal
    begin
        /*IF ("Cdad. k.n. enviada (b)" + "Cdad k.n. a enviar (b)" - "Cdad. k.n. facturada (b)") >0 THEN*/
        exit("Net Kilos Shipped (Base)" + "Net kilos to Ship (Base)" - "Net Kilos Invoiced (Base)")
        /*ELSE
          EXIT(0);
         */

    end;

    procedure MaxCdadAFactKB(): Decimal
    begin
        /*IF ("Cdad k.b. enviada" + "Cdad kilos brutos a enviar" - "Cdad k.b. facturada") >= 0 THEN*/
        exit("Gross Kilos Shipped" + "Gross kilos to Ship" - "Gross Kilos Invoiced")
        /*ELSE
          EXIT(0);
        */

    end;

    procedure MaxCdadBaseAFactKB(): Decimal
    begin
        /*IF ("Cdad. k.b. enviada (b)" + "Cdad k.b. a enviar (b)" - "Cdad. k.b. facturada (b)") >= 0 THEN*/
        exit("Gross Kilos Shipped (Base)" + "Gross Kilos to Ship (Base)" - "Gross kilos Invoiced (Base)")
        /*ELSE
          EXIT(0);
         */

    end;

    local procedure CalcCdadBaseKN(CdadKN: Decimal): Decimal
    begin
        //TESTFIELD("Peso neto");
        exit(Round(CdadKN /** "Cdad. por unidad medida"*/, 0.00001));

    end;

    local procedure CalcCdadBaseKB(CdadKB: Decimal): Decimal
    begin
        //TESTFIELD("Peso bruto");
        exit(Round(CdadKB /** "Cdad. por unidad medida"*/, 0.00001));

    end;


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=Return Receipt No. %1:;ESP=No. recep. devol. %1:;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=Return Receipt No. %1:;ESP=No.recep. devol. %1:;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=The program cannot find this purchase line.;ESP=El prog. no puede encontrar esta lín. compra.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=The program cannot find this purchase line.;ESP=El prog. no puede encontrar esta lín. compra.;
    //Variable type has not been exported.
}

