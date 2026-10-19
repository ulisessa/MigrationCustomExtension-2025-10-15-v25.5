tableextension 50653 tableextension50653 extends "Purchase Line Archive"
{
    Caption = 'Purchase Line Archive';
    fields
    {
        modify("Buy-from Vendor No.")
        {
            Caption = 'Buy-from Vendor No.';
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
            TableRelation = IF (Type = CONST(" ")) "Standard Text"
            ELSE
            IF (Type = CONST("G/L Account")) "G/L Account"
            ELSE
            IF (Type = CONST(Item)) Item
            ELSE
            IF (Type = CONST(Resource)) Resource
            ELSE
            IF (Type = CONST("Fixed Asset")) "Fixed Asset"
            ELSE
            IF (Type = CONST("Charge (Item)")) "Item Charge";
            Caption = 'No.';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Expected Receipt Date")
        {
            Caption = 'Expected Receipt Date';
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
        modify("Receipt No.")
        {
            Caption = 'Receipt No.';
        }
        modify("Receipt Line No.")
        {
            Caption = 'Receipt Line No.';
        }
        modify("Profit %")
        {
            Caption = 'Profit %';
        }
        modify("Pay-to Vendor No.")
        {
            Caption = 'Pay-to Vendor No.';
        }
        modify("Vendor Item No.")
        {
            Caption = 'Vendor Item No.';
        }
        modify("Sales Order No.")
        {
            Caption = 'Sales Order No.';
        }
        modify("Sales Order Line No.")
        {
            Caption = 'Sales Order Line No.';
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
        modify("Use Tax")
        {
            Caption = 'Use Tax';
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
        modify("Prod. Order No.")
        {
            Caption = 'Prod. Order No.';
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
        modify("Maintenance Code")
        {
            Caption = 'Maintenance Code';
        }
        modify("Insurance No.")
        {
            Caption = 'Insurance No.';
        }
        modify("Budgeted FA No.")
        {
            Caption = 'Budgeted FA No.';
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
        modify("Special Order Sales No.")
        {
            Caption = 'Special Order Sales No.';
        }
        modify("Special Order Sales Line No.")
        {
            Caption = 'Special Order Sales Line No.';
        }
        modify("Lead Time Calculation")
        {
            Caption = 'Lead Time Calculation';
        }
        modify("Return Shipment No.")
        {
            Caption = 'Return Shipment No.';
        }
        modify("Return Shipment Line No.")
        {
            Caption = 'Return Shipment Line No.';
        }
        modify("Return Reason Code")
        {
            Caption = 'Return Reason Code';
        }
        modify("Routing No.")
        {
            Caption = 'Routing No.';
        }
        modify("Operation No.")
        {
            Caption = 'Operation No.';
        }
        modify("Work Center No.")
        {
            Caption = 'Work Center No.';
        }
        modify("Prod. Order Line No.")
        {
            Caption = 'Prod. Order Line No.';
        }
        modify("Planning Flexibility")
        {
            Caption = 'Planning Flexibility';
        }
        modify("Routing Reference No.")
        {
            Caption = 'Routing Reference No.';
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
        field(50005; "Concepto proyecto"; Code[10])
        {
            Caption = 'Job concept';
            ToolTip = 'Specifies the value of the Job concept field.';
            TableRelation = "Concepto proyecto";
        }
        field(50006; "No. Cab. Solicitud"; Code[30])
        {
            Caption = 'Request header no.';
            ToolTip = 'Specifies the value of the Request header no field.';
            Editable = true;
        }
        field(50007; "No. línea Solicitud"; Integer)
        {
            Caption = 'No. línea Solicitud';
            ToolTip = 'Specifies the value of the No. línea Solicitud field.';
            Editable = true;
        }
        field(50008; "No. Documento Compra"; Code[10])
        {
            Caption = 'No. Documento Compra';
            ToolTip = 'Specifies the value of the No. Documento Compra field.';
            Editable = false;
        }
        field(50009; "No Ln. Documento Compra"; Integer)
        {
            Caption = 'No Ln. Documento Compra';
            ToolTip = 'Specifies the value of the No Ln. Documento Compra field.';
            Editable = false;
        }
        field(50010; "Plazo a Transferir"; Integer)
        {
            Caption = 'Plazo a Transferir';
            ToolTip = 'Specifies the value of the Plazo a Transferir field.';
        }
        field(50011; "No Oferta"; Code[10])
        {
            Caption = 'No Oferta';
            ToolTip = 'Specifies the value of the No Oferta field.';
            Editable = false;
        }
        field(50012; "No Ln. Oferta"; Integer)
        {
            Caption = 'No Ln. Oferta';
            ToolTip = 'Specifies the value of the No Ln. Oferta field.';
            Editable = false;
        }
        field(50013; "Cód. arancelario"; Code[20])
        {
            Caption = 'Tariff No.';
            ToolTip = 'Specifies the value of the Tariff No field.';
            TableRelation = "Concepto proyecto";
            ValidateTableRelation = false;
        }
        field(50014; Usuario; Code[20])
        {
            Caption = 'User ID';
            ToolTip = 'Specifies the value of the User ID field.';
            TableRelation = User;
        }
        field(50015; "Kilos brutos"; Decimal)
        {
            Caption = 'Kilos brutos';
            ToolTip = 'Specifies the value of the Kilos brutos field.';
        }
        field(50016; "Kilos netos"; Decimal)
        {
            Caption = 'Kilos netos';
            ToolTip = 'Specifies the value of the Kilos netos field.';
        }
        field(50017; "Kilos brutos a recibir"; Decimal)
        {
            Caption = 'Gross kilos to Receive';
            ToolTip = 'Specifies the value of the Gross kilos to Receive field.';
        }
        field(50018; "Kilos netos a recibir"; Decimal)
        {
            Caption = 'Net kilos to Receive';
            ToolTip = 'Specifies the value of the Net kilos to Receive field.';
        }
        field(50019; "Kilos brutos recibidos"; Decimal)
        {
            Caption = 'Gross kilos Received';
            ToolTip = 'Specifies the value of the Gross kilos Received field.';
        }
        field(50020; "Kilos netos recibidos"; Decimal)
        {
            Caption = 'Net kilos Received';
            ToolTip = 'Specifies the value of the Net kilos Received field.';
        }
        field(50021; "Carpeta de Importación"; Code[20])
        {
            Caption = 'Carpeta de Importación';
            ToolTip = 'Specifies the value of the Carpeta de Importación field.';
        }
        field(50022; "Cdad kilos netos pendiente"; Decimal)
        {
            Caption = 'Cdad kilos netos pendiente';
            ToolTip = 'Specifies the value of the Cdad kilos netos pendiente field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50023; "Cdad kilos netos a facturar"; Decimal)
        {
            Caption = 'Cdad kilos netos a facturar';
            ToolTip = 'Specifies the value of the Cdad kilos netos a facturar field.';
            DecimalPlaces = 0 : 5;
        }
        field(50025; "Cdad kilos netos a recibir"; Decimal)
        {
            Caption = 'Cdad kilos netos a recibir';
            ToolTip = 'Specifies the value of the Cdad kilos netos a recibir field.';
            DecimalPlaces = 0 : 5;
        }
        field(50026; "Cdad kilos brutos pendiente"; Decimal)
        {
            Caption = 'Cdad kilos brutos pendiente';
            ToolTip = 'Specifies the value of the Cdad kilos brutos pendiente field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50027; "Cdad kilos brutos a facturar"; Decimal)
        {
            Caption = 'Cdad kilos brutos a facturar';
            ToolTip = 'Specifies the value of the Cdad kilos brutos a facturar field.';
            DecimalPlaces = 0 : 5;
        }
        field(50028; "Cdad kilos brutos a recibir"; Decimal)
        {
            Caption = 'Cdad kilos brutos a recibir';
            ToolTip = 'Specifies the value of the Cdad kilos brutos a recibir field.';
            DecimalPlaces = 0 : 5;
        }
        field(50029; "Cdad kilos netos (b)"; Decimal)
        {
            Caption = 'Cdad kilos netos (b)';
            ToolTip = 'Specifies the value of the Cdad kilos netos (b) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
        }
        field(50030; "Cdad k.n. pendiente (b)"; Decimal)
        {
            Caption = 'Cdad k.n. pendiente (b)';
            ToolTip = 'Specifies the value of the Cdad k.n. pendiente (b) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50031; "Cdad k.n. a facturar (b)"; Decimal)
        {
            Caption = 'Cdad k.n. a facturar (b)';
            ToolTip = 'Specifies the value of the Cdad k.n. a facturar (b) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50032; "Cdad k.n. a recibir (b)"; Decimal)
        {
            Caption = 'Cdad k.n. a recibir (b)';
            ToolTip = 'Specifies the value of the Cdad k.n. a recibir (b) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
        }
        field(50033; "Cdad k.n. enviada no fact. (b)"; Decimal)
        {
            Caption = 'Cdad k.n. enviada no fact. (b)';
            ToolTip = 'Specifies the value of the Cdad k.n. enviada no fact. (b) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50034; "Cdad. k.n. recibida (b)"; Decimal)
        {
            Caption = 'Cdad. k.n. recibida (b)';
            ToolTip = 'Specifies the value of the Cdad. k.n. recibida (b) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50035; "Cdad. k.n. facturada (b)"; Decimal)
        {
            Caption = 'Cdad. k.n. facturada (b)';
            ToolTip = 'Specifies the value of the Cdad. k.n. facturada (b) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50036; "Cdad. k.n. reservada (base)"; Decimal)
        {
            Caption = 'Cdad. k.n. reservada (base)';
            ToolTip = 'Specifies the value of the Cdad. k.n. reservada (base) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50037; "Cdad kilos brutos (b)"; Decimal)
        {
            Caption = 'Cdad kilos brutos (b)';
            ToolTip = 'Specifies the value of the Cdad kilos brutos (b) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50038; "Cdad k.b. pendiente (b)"; Decimal)
        {
            Caption = 'Cdad k.b. pendiente (b)';
            ToolTip = 'Specifies the value of the Cdad k.b. pendiente (b) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50039; "Cdad k.b. a facturar (b)"; Decimal)
        {
            Caption = 'Cdad k.b. a facturar (b)';
            ToolTip = 'Specifies the value of the Cdad k.b. a facturar (b) field.';
            BlankZero = false;
            DecimalPlaces = 0 : 5;
        }
        field(50040; "Cdad k.b. a recibir (b)"; Decimal)
        {
            Caption = 'Cdad k.b. a recibir (b)';
            ToolTip = 'Specifies the value of the Cdad k.b. a recibir (b) field.';
            BlankZero = false;
            DecimalPlaces = 0 : 5;
        }
        field(50041; "Cdad k.b. enviada no fact. (b)"; Decimal)
        {
            Caption = 'Cdad k.b. enviada no fact. (b)';
            ToolTip = 'Specifies the value of the Cdad k.b. enviada no fact. (b) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            MinValue = 0;
        }
        field(50042; "Cdad. k.b. recibida (b)"; Decimal)
        {
            Caption = 'Cdad. k.b. recibida (b)';
            ToolTip = 'Specifies the value of the Cdad. k.b. recibida (b) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50043; "Cdad. k.b. facturada (b)"; Decimal)
        {
            Caption = 'Cdad. k.b. facturada (b)';
            ToolTip = 'Specifies the value of the Cdad. k.b. facturada (b) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50044; "Cdad. k.b. reservada (base)"; Decimal)
        {
            Caption = 'Cdad. k.b. reservada (base)';
            ToolTip = 'Specifies the value of the Cdad. k.b. reservada (base) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50045; "Cdad k.n. rec. no facturada"; Decimal)
        {
            Caption = 'Cdad k.n. rec. no facturada';
            ToolTip = 'Specifies the value of the Cdad k.n. rec. no facturada field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50046; "Cdad k.n. recibida"; Decimal)
        {
            Caption = 'Cdad k.n. recibida';
            ToolTip = 'Specifies the value of the Cdad k.n. recibida field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50047; "Cdad k.n. facturada"; Decimal)
        {
            Caption = 'Cdad k.n. facturada';
            ToolTip = 'Specifies the value of the Cdad k.n. facturada field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50048; "Cdad k.b. rec. no facturada"; Decimal)
        {
            Caption = 'Cdad k.b. rec. no facturada';
            ToolTip = 'Specifies the value of the Cdad k.b. rec. no facturada field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50049; "Cdad k.b. recibida"; Decimal)
        {
            Caption = 'Cdad k.b. recibida';
            ToolTip = 'Specifies the value of the Cdad k.b. recibida field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50050; "Cdad k.b. facturada"; Decimal)
        {
            Caption = 'Cdad k.b. facturada';
            ToolTip = 'Specifies the value of the Cdad k.b. facturada field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50051; "Cdad k.n. rec. no fact. (base)"; Decimal)
        {
            Caption = 'Cdad k.n. rec. no fact. (base)';
            ToolTip = 'Specifies the value of the Cdad k.n. rec. no fact. (base) field.';
        }
        field(50052; "Cdad k.b. rec. no fact. (base)"; Decimal)
        {
            Caption = 'Cdad k.b. rec. no fact. (base)';
            ToolTip = 'Specifies the value of the Cdad k.b. rec. no fact. (base) field.';
        }
        field(50404; "Nombre proveedor"; Text[100])
        {
            Caption = 'Nombre proveedor';
            ToolTip = 'Specifies the value of the Nombre proveedor field.';
            CalcFormula = Lookup(Vendor.Name WHERE("No." = FIELD("Buy-from Vendor No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50501; Flete; Decimal)
        {
            Caption = 'Flete';
            ToolTip = 'Specifies the value of the Flete field.';
        }
        field(50502; "Fecha recepción proveedor"; Date)
        {
            Caption = 'Fecha recepción proveedor';
            ToolTip = 'Specifies the value of the Fecha recepción proveedor field.';
        }
        field(50503; "Fecha registro"; Date)
        {
            Caption = 'Fecha registro';
            ToolTip = 'Specifies the value of the Fecha registro field.';
        }
        field(50510; "Descripción cód. arancelario"; Text[250])
        {
            Caption = 'Descripción cód. arancelario';
            ToolTip = 'Specifies the value of the Descripción cód. arancelario field.';
            CalcFormula = Lookup("Tariff Number".Description WHERE("No." = FIELD("Cód. arancelario")));
            FieldClass = FlowField;
        }
        field(50511; "Consumir automáticamente"; Boolean)
        {
            Caption = 'Consumir automáticamente';
            ToolTip = 'Specifies the value of the Consumir automáticamente field.';
        }
        field(50512; "Net kilos per UOM"; Decimal)
        {
            Caption = 'Net kilos per UOM';
            ToolTip = 'Specifies the value of the Net kilos per UOM field.';
        }
        field(50513; "Gross kilos per UOM"; Decimal)
        {
            Caption = 'Gross kilos per UOM';
            ToolTip = 'Specifies the value of the Gross kilos per UOM field.';
        }
        field(50530; "Return nk to Ship"; Decimal)
        {
            Caption = 'Return nk to Ship';
            ToolTip = 'Specifies the value of the Return nk to Ship field.';
            DecimalPlaces = 0 : 5;
        }
        field(50531; "Return nk to Ship (Base)"; Decimal)
        {
            Caption = 'Return nk to Ship (Base)';
            ToolTip = 'Specifies the value of the Return nk to Ship (Base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50532; "Return nk Shipped Not Invd."; Decimal)
        {
            Caption = 'Return nk Shipped Not Invd.';
            ToolTip = 'Specifies the value of the Return nk Shipped Not Invd field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50533; "Ret. nk Shpd Not Invd.(Base)"; Decimal)
        {
            Caption = 'Ret. nk Shpd Not Invd.(Base)';
            ToolTip = 'Specifies the value of the Ret. nk Shpd Not Invd.(Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50536; "Return nk Shipped"; Decimal)
        {
            Caption = 'Return nk Shipped';
            ToolTip = 'Specifies the value of the Return nk Shipped field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50537; "Return nk Shipped (Base)"; Decimal)
        {
            Caption = 'Return nk Shipped (Base)';
            ToolTip = 'Specifies the value of the Return nk Shipped (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50539; "Return gk to Ship"; Decimal)
        {
            Caption = 'Return gk to Ship';
            ToolTip = 'Specifies the value of the Return gk to Ship field.';
            DecimalPlaces = 0 : 5;
        }
        field(50540; "Return gk to Ship (Base)"; Decimal)
        {
            Caption = 'Return gk to Ship (Base)';
            ToolTip = 'Specifies the value of the Return gk to Ship (Base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50541; "Return gk Shipped Not Invd."; Decimal)
        {
            Caption = 'Return gk Shipped Not Invd.';
            ToolTip = 'Specifies the value of the Return gk Shipped Not Invd field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50542; "Ret. gk Shpd Not Invd.(Base)"; Decimal)
        {
            Caption = 'Ret. gk Shpd Not Invd.(Base)';
            ToolTip = 'Specifies the value of the Ret. gk Shpd Not Invd.(Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50543; "Return gk Shipped"; Decimal)
        {
            Caption = 'Return gk Shipped';
            ToolTip = 'Specifies the value of the Return gk Shipped field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50544; "Return gk Shipped (Base)"; Decimal)
        {
            Caption = 'Return gk Shipped (Base)';
            ToolTip = 'Specifies the value of the Return gk Shipped (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50545; "Reserved net kilos (Base)"; Decimal)
        {
            CalcFormula = Sum("Reservation Entry"."Net kilos (Base)" WHERE("Source Type" = CONST(39),
                                                                            "Source ID" = FIELD("Document No."),
                                                                            "Source Ref. No." = FIELD("Line No."),
                                                                            "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved net kilos (Base)';
            ToolTip = 'Specifies the value of the Reserved net kilos (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50546; "Reserved gross kilos (Base)"; Decimal)
        {
            CalcFormula = Sum("Reservation Entry"."Gross kilos (Base)" WHERE("Source Type" = CONST(39),
                                                                              "Source ID" = FIELD("Document No."),
                                                                              "Source Ref. No." = FIELD("Line No."),
                                                                              "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved gross kilos (Base)';
            ToolTip = 'Specifies the value of the Reserved gross kilos (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
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
        field(50700; "Cód. retención IVA"; Code[20])
        {
            Caption = 'Cód. retención IVA';
            ToolTip = 'Specifies the value of the Cód. retención IVA field.';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER(IVA));
        }
        field(50701; "Cód. retención SS"; Code[20])
        {
            Caption = 'Cód. retención SS';
            ToolTip = 'Specifies the value of the Cód. retención SS field.';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER("Ingresos Brutos"));
        }
        field(50702; "Cód. retención ganancias"; Code[20])
        {
            Caption = 'Cód. retención ganancias';
            ToolTip = 'Specifies the value of the Cód. retención ganancias field.';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER(Ganancias));
        }
        field(50703; Provincia; Code[10])
        {
            Caption = 'Provincia';
            ToolTip = 'Specifies the value of the Provincia field.';
        }
        field(50704; "No. Despacho"; Code[20])
        {
            Caption = 'No. Despacho';
            ToolTip = 'Specifies the value of the No. Despacho field.';
        }
        field(50706; "Old job no."; Code[20])
        {
            Caption = 'Old job no.';
            ToolTip = 'Specifies the value of the Old job no field.';
            TableRelation = Job;
        }
        field(60001; Familia; Code[3])
        {
            Caption = 'Family';
            ToolTip = 'Specifies the value of the Family field.';
            Editable = false;
            TableRelation = "Familia producto";
        }
        field(60002; Subfamilia; Code[20])
        {
            Caption = 'Subfamily';
            ToolTip = 'Specifies the value of the Subfamily field.';
            Editable = false;
            TableRelation = "Subfamilia producto".Code WHERE("Family code" = FIELD(Familia));
        }
        field(60006; "Pendiente no entregable"; Boolean)
        {
            Caption = 'Pendiente no entregable';
            ToolTip = 'Specifies the value of the Pendiente no entregable field.';
        }
        field(62340; Subdepartamento; Code[20])
        {
            Caption = 'Subdepartamento';
            ToolTip = 'Specifies the value of the Subdepartamento field.';
        }
        field(65000; "% IVA deducible"; Decimal)
        {
            Caption = '% IVA deducible';
            ToolTip = 'Specifies the value of the % IVA deducible field.';
            Description = 'IVA no deducible';
            Editable = false;
        }
        field(65001; "% IVA no deducible"; Decimal)
        {
            Caption = '% IVA no deducible';
            ToolTip = 'Specifies the value of the % IVA no deducible field.';
            Description = 'IVA no deducible';
            Editable = false;
        }
        field(70000; "Grupo IRPF"; Code[10])
        {
            Caption = 'Grupo IRPF';
            ToolTip = 'Specifies the value of the Grupo IRPF field.';
        }
        field(70001; "% IRPF"; Decimal)
        {
            Caption = '% IRPF';
            ToolTip = 'Specifies the value of the % IRPF field.';
            DecimalPlaces = 0 : 2;
            Editable = false;
        }
        field(79011; "Historico Pedido"; Boolean)
        {
            Caption = 'Historico Pedido';
            ToolTip = 'Specifies the value of the Historico Pedido field.';
            Editable = false;
        }
        field(88888; "No hoja demanda"; Integer)
        {
            Caption = 'No hoja demanda';
            ToolTip = 'Specifies the value of the No hoja demanda field.';
            BlankZero = true;
            Editable = false;
        }
        field(88889; "No lín. hoja demanda"; Integer)
        {
            Caption = 'No lín. hoja demanda';
            ToolTip = 'Specifies the value of the No lín. hoja demanda field.';
            BlankZero = true;
            Editable = false;
        }
    }
}

