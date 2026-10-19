tableextension 50068 "Sales Shipment Line Ext." extends "Sales Shipment Line"
{
    Caption = 'Sales Shipment Line';
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
        modify("Job No.")
        {
            Caption = 'Job No.';
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
        modify("Exit Point")
        {
            Caption = 'Exit Point';
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
        modify("Authorized for Credit Card")
        {
            Caption = 'Authorized for Credit Card';
        }
        modify("Job Task No.")
        {
            Caption = 'Job Task No.';
        }
        modify("Job Contract Entry No.")
        {
            Caption = 'Job Contract Entry No.';
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
        modify("Shipping Time")
        {
            Caption = 'Shipping Time';
        }
        modify("Planned Shipment Date")
        {
            Caption = 'Planned Shipment Date';
        }
        modify(Correction)
        {
            Caption = 'Correction';
        }
        modify("Return Reason Code")
        {
            Caption = 'Return Reason Code';
        }
        modify("Allow Line Disc.")
        {
            Caption = 'Allow Line Disc.';
        }
        field(50000; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';

        }
        field(50001; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';

        }
        field(50002; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';

        }
        field(50003; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';

        }
        field(50004; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';

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
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50019; "Gross kilos to Invoice"; Decimal)
        {
            Caption = 'Gross kilos to Invoice';
            ToolTip = 'Specifies the value of the Gross kilos to Invoice field.';
            DecimalPlaces = 0 : 5;
            Editable = true;
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
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50022; "Outstanding Net Kilos (Base)"; Decimal)
        {
            Caption = 'Outstanding Net Kilos (Base)';
            ToolTip = 'Specifies the value of the Outstanding Net Kilos (Base) field.';
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
        field(50025; "Net kilos to Ship (Base)"; Decimal)
        {
            Caption = 'Net kilos to Ship (Base)';
            ToolTip = 'Specifies the value of the Net kilos to Ship (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50026; "NK Shipped Not Invd. (Base)"; Decimal)
        {
            Caption = 'NK Shipped Not Invd. (Base)';
            ToolTip = 'Specifies the value of the NK Shipped Not Invd. (Base) field.';
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
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50029; "Reserved net kilos (Base)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Reserved net kilos (Base)';
            ToolTip = 'Specifies the value of the Reserved net kilos (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50030; "Gross kilos (Base)"; Decimal)
        {
            Caption = 'Gross kilos (Base)';
            ToolTip = 'Specifies the value of the Gross kilos (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50031; "Outstanding Gross Kilos (Base)"; Decimal)
        {
            Caption = 'Outstanding Gross Kilos (Base)';
            ToolTip = 'Specifies the value of the Outstanding Gross Kilos (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50032; "Gross Kilos to Invoice (Base)"; Decimal)
        {
            Caption = 'Gross Kilos to Invoice (Base)';
            ToolTip = 'Specifies the value of the Gross Kilos to Invoice (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50033; "Gross Kilos to Ship (Base)"; Decimal)
        {
            Caption = 'Gross Kilos to Ship (Base)';
            ToolTip = 'Specifies the value of the Gross Kilos to Ship (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50034; "GK Shipped Not Invd. (Base)"; Decimal)
        {
            Caption = 'GK Shipped Not Invd. (Base)';
            ToolTip = 'Specifies the value of the GK Shipped Not Invd. (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50035; "Gross Kilos Shipped (Base)"; Decimal)
        {
            Caption = 'Gross Kilos Shipped (Base)';
            ToolTip = 'Specifies the value of the Gross Kilos Shipped (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50036; "Gross kilos Invoiced (Base)"; Decimal)
        {
            Caption = 'Gross kilos Invoiced (Base)';
            ToolTip = 'Specifies the value of the Gross kilos Invoiced (Base) field.';
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
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50040; "Net Kilos Shipped"; Decimal)
        {
            Caption = 'Net Kilos Shipped';
            ToolTip = 'Specifies the value of the Net Kilos Shipped field.';
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50041; "Net Kilos Invoiced"; Decimal)
        {
            Caption = 'Net Kilos Invoiced';
            ToolTip = 'Specifies the value of the Net Kilos Invoiced field.';
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50042; "GK Shipped Not Invoiced"; Decimal)
        {
            Caption = 'GK Shipped Not Invoiced';
            ToolTip = 'Specifies the value of the GK Shipped Not Invoiced field.';
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50044; "Gross Kilos Shipped"; Decimal)
        {
            Caption = 'Gross Kilos Shipped';
            ToolTip = 'Specifies the value of the Gross Kilos Shipped field.';
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50045; "Gross Kilos Invoiced"; Decimal)
        {
            Caption = 'Gross Kilos Invoiced';
            ToolTip = 'Specifies the value of the Gross Kilos Invoiced field.';
            DecimalPlaces = 0 : 5;
            Editable = true;
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
        field(50078; Revertido; Boolean)
        {
            Caption = 'Reversed';
            ToolTip = 'Specifies the value of the Reversed field.';
            DataClassification = ToBeClassified;
        }
        field(50079; "DCL application date formula"; Text[30])
        {
            Caption = 'Fórmula de aplicación de fechas de DCL';
            ToolTip = 'Specifies the value of the Fórmula de aplicación de fechas de DCL field.';
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


    //Unsupported feature: Code Modification on "InsertInvLineFromShptLine(PROCEDURE 2)".

    //procedure InsertInvLineFromShptLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IsHandled := false;
    OnBeforeCodeInsertInvLineFromShptLine(Rec,SalesLine,IsHandled);
    if IsHandled then
    #4..78
      SalesLine."Drop Shipment" := "Drop Shipment";
      SalesLine."Shipment No." := "Document No.";
      SalesLine."Shipment Line No." := "Line No.";
      ClearSalesLineValues(SalesLine);
      if not ExtTextLine and (SalesLine.Type <> 0) then begin
        IsHandled := false;
        OnInsertInvLineFromShptLineOnBeforeValidateQuantity(Rec,SalesLine,IsHandled);
        if SalesLine."Deferral Code" <> '' then
          SalesLine.Validate("Deferral Code");
        if not IsHandled then
          SalesLine.Validate(Quantity,Quantity - "Quantity Invoiced");
        CalcBaseQuantities(SalesLine,"Quantity (Base)" / Quantity);

        OnInsertInvLineFromShptLineOnAfterCalcQuantities(SalesLine,SalesOrderLine);
    #93..132
          "Attached to Line No.");
      SalesLine."Shortcut Dimension 1 Code" := "Shortcut Dimension 1 Code";
      SalesLine."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
      SalesLine."Dimension Set ID" := "Dimension Set ID";
      OnBeforeInsertInvLineFromShptLine(Rec,SalesLine,SalesOrderLine);
      SalesLine.Insert;
    #139..148
      SalesOrderHeader."Get Shipment Used" := true;
      SalesOrderHeader.Modify;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..81
      //++Arbu
      SalesLine."Tax Area Code" := SalesInvHeader."Tax Area Code";
      SalesLine."Prepayment Tax Area Code" := SalesInvHeader."Tax Area Code";
      SalesLine.Validate("Shortcut Dimension 3 Code","Shortcut Dimension 3 Code");
      SalesLine.Validate("Shortcut Dimension 4 Code","Shortcut Dimension 4 Code");
      SalesLine.Validate("Shortcut Dimension 5 Code","Shortcut Dimension 5 Code");
      SalesLine.Validate("Shortcut Dimension 6 Code","Shortcut Dimension 6 Code");
      SalesLine.Validate("Shortcut Dimension 7 Code","Shortcut Dimension 7 Code");
      SalesLine."No. Pallet" := "No. Pallet";
      SalesLine."Descripción Interna" := "Descripción Interna";
      SalesLine."Permiso de embarque" :="Permiso de embarque";
      SalesLine."Cód. transportista":="Cód. transportista";
      SalesLine."Cód. contenedor" :="Cód. contenedor";
      SalesLine.Familia :=Familia;
      SalesLine.Subfamilia :=Subfamilia;
      SalesLine."Cód. arancelario" :="Cód. arancelario";
      SalesLine."Remito origen" :="Remito origen";
      SalesLine."Línea remito origen" :="Línea remito origen";
      SalesLine."Número de Item":="Número de Item";
      SalesLine."Número de Subitem":="Número de Subitem";
      SalesLine."Lote origen" :="Lote origen";
      SalesLine."No. remito oficial":= "No. remito oficial";
      SalesLine."No. lín. remito oficial":= "Line No.";
      SalesLine."Posting Date" :="Posting Date";
      SalesLine."Puerto destino" :="Puerto destino";
      SalesLine."Cód. categorización":="Cód. categorización";
      SalesLine."Especie de productos" :="Especie de productos";
      SalesLine."Nivel de producción" :="Nivel de producción";
      SalesLine.Procedencia :=Procedencia;
      SalesLine."Propiedad producto" :="Propiedad producto";
      SalesLine."Shortcut Dimension 3 Code" := "Shortcut Dimension 3 Code";
      SalesLine."Shortcut Dimension 4 Code" := "Shortcut Dimension 4 Code";
      SalesLine."Shortcut Dimension 5 Code" := "Shortcut Dimension 5 Code";
      SalesLine."Shortcut Dimension 6 Code" := "Shortcut Dimension 6 Code";
      SalesLine."Shortcut Dimension 7 Code" := "Shortcut Dimension 7 Code";
      SalesLine."Job No." := "Job No.";
      //--Arbu
    #82..88
        begin
          SalesLine.Validate(Quantity,Quantity - "Quantity Invoiced");
          //++Arbu
          SalesLine.Validate("Net kilos","Net kilos" - "Net Kilos Invoiced");
          SalesLine.Validate("Net kilos","Net kilos" - "Net Kilos Invoiced");
          SalesLine.Validate("Gross kilos","Gross kilos" - "Gross Kilos Invoiced");
          SalesLine.Validate("Gross kilos","Gross kilos" - "Gross Kilos Invoiced");
        end;
          //--Arbu
    #90..135
      SalesLine."Shortcut Dimension 3 Code" := "Shortcut Dimension 3 Code";
      SalesLine."Shortcut Dimension 4 Code" := "Shortcut Dimension 4 Code";
      SalesLine."Shortcut Dimension 5 Code" := "Shortcut Dimension 5 Code";
      SalesLine."Shortcut Dimension 6 Code" := "Shortcut Dimension 6 Code";
      SalesLine."Shortcut Dimension 7 Code" := "Shortcut Dimension 7 Code";
    #136..151
    */
    //end;


    //Unsupported feature: Code Modification on "ClearSalesLineValues(PROCEDURE 16)".

    //procedure ClearSalesLineValues();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SalesLine."Quantity (Base)" := 0;
    SalesLine.Quantity := 0;
    SalesLine."Outstanding Qty. (Base)" := 0;
    SalesLine."Outstanding Quantity" := 0;
    SalesLine."Quantity Shipped" := 0;
    SalesLine."Qty. Shipped (Base)" := 0;
    SalesLine."Quantity Invoiced" := 0;
    SalesLine."Qty. Invoiced (Base)" := 0;
    SalesLine.Amount := 0;
    SalesLine."Amount Including VAT" := 0;
    SalesLine."Purchase Order No." := '';
    #12..16
    SalesLine."Appl.-from Item Entry" := 0;

    OnAfterClearSalesLineValues(Rec,SalesLine);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..8
    //++Arbu
    SalesLine."Net kilos (Base)" := 0;
    SalesLine."Net kilos" := 0;
    SalesLine."Outstanding Net Kilos (Base)" := 0;
    SalesLine."Outstanding Net Kilos" := 0;
    SalesLine."Net Kilos Shipped" := 0;
    SalesLine."Net Kilos Shipped (Base)" := 0;
    SalesLine."Net Kilos Invoiced" := 0;
    SalesLine."Net Kilos Invoiced (Base)" := 0;
    SalesLine."Gross kilos (Base)" := 0;
    SalesLine."Gross kilos" := 0;
    SalesLine."Outstanding Gross Kilos (Base)" := 0;
    SalesLine."Outstanding Gross Kilos" := 0;
    SalesLine."Gross Kilos Shipped" := 0;
    SalesLine."Gross Kilos Shipped (Base)" := 0;
    SalesLine."Gross Kilos Invoiced" := 0;
    SalesLine."Gross kilos Invoiced (Base)" := 0;
    //--Arbu
    #9..19
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=Shipment No. %1:;ESP=No. albarán %1:;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=Shipment No. %1:;ESP=No.Remito %1:;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=The program cannot find this Sales line.;ESP=El prog. no puede encontrar esta lín. vta.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=The program cannot find this Sales line.;ESP=El prog. no puede encontrar esta lín. vta.;
    //Variable type has not been exported.
}

