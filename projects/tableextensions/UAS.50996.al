tableextension 50996 tableextension50996 extends "Return Shipment Line"
{
    Caption = 'Return Shipment Line';
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
        modify("Job No.")
        {
            Caption = 'Job No.';
        }
        modify("Pay-to Vendor No.")
        {
            Caption = 'Pay-to Vendor No.';
        }
        modify("Vendor Item No.")
        {
            Caption = 'Vendor Item No.';
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
        modify("Job Task No.")
        {
            Caption = 'Job Task No.';
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
        field(50015; "Gross kilos"; Decimal)
        {
            Caption = 'Gross kilos';
            ToolTip = 'Specifies the value of the Gross kilos field.';
        }
        field(50016; "Net kilos"; Decimal)
        {
            Caption = 'Net kilos';
            ToolTip = 'Specifies the value of the Net kilos field.';
        }
        field(50017; "Gross kilos to receive"; Decimal)
        {
            Caption = 'Gross kilos to receive';
            ToolTip = 'Specifies the value of the Gross kilos to receive field.';
        }
        field(50018; "Net kilos to receive"; Decimal)
        {
            Caption = 'Net kilos to receive';
            ToolTip = 'Specifies the value of the Net kilos to receive field.';
        }
        field(50019; "Gross kilos received"; Decimal)
        {
            Caption = 'Gross kilos received';
            ToolTip = 'Specifies the value of the Gross kilos received field.';
        }
        field(50020; "Net kilos received"; Decimal)
        {
            Caption = 'Net kilos received';
            ToolTip = 'Specifies the value of the Net kilos received field.';
        }
        field(50021; "Carpeta de Importación"; Code[20])
        {
            Caption = 'Carpeta de Importación';
            ToolTip = 'Specifies the value of the Carpeta de Importación field.';
        }
        field(50022; "Outstanding net kilos"; Decimal)
        {
            Caption = 'Outstanding net kilos';
            ToolTip = 'Specifies the value of the Outstanding net kilos field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50023; "Net kilos to invoice"; Decimal)
        {
            Caption = 'Net kilos to invoice';
            ToolTip = 'Specifies the value of the Net kilos to invoice field.';
            DecimalPlaces = 0 : 5;
        }
        field(50026; "Outstanding gross kilos"; Decimal)
        {
            Caption = 'Outstanding gross kilos';
            ToolTip = 'Specifies the value of the Outstanding gross kilos field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50027; "Gross kilos to invoice"; Decimal)
        {
            Caption = 'Gross kilos to invoice';
            ToolTip = 'Specifies the value of the Gross kilos to invoice field.';
            DecimalPlaces = 0 : 5;
        }
        field(50029; "Net kilos (Base)"; Decimal)
        {
            Caption = 'Net kilos (Base)';
            ToolTip = 'Specifies the value of the Net kilos (Base) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
        }
        field(50030; "Outstanding net kilos (base)"; Decimal)
        {
            Caption = 'Outstanding net kilos (base)';
            ToolTip = 'Specifies the value of the Outstanding net kilos (base) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50031; "Net kilos to invoice (base)"; Decimal)
        {
            Caption = 'Net kilos to invoice (base)';
            ToolTip = 'Specifies the value of the Net kilos to invoice (base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50032; "Net kilos to receive (base)"; Decimal)
        {
            Caption = 'Net kilos to receive (base)';
            ToolTip = 'Specifies the value of the Net kilos to receive (base) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
        }
        field(50033; "NK received not invoiced (b)"; Decimal)
        {
            Caption = 'NK received not invoiced (b)';
            ToolTip = 'Specifies the value of the NK received not invoiced (b) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50034; "Net kilos received (b)"; Decimal)
        {
            Caption = 'Net kilos received (b)';
            ToolTip = 'Specifies the value of the Net kilos received (b) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50035; "Net kilos invoiced (b)"; Decimal)
        {
            Caption = 'Net kilos invoiced (b)';
            ToolTip = 'Specifies the value of the Net kilos invoiced (b) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50037; "Gross kilos (Base)"; Decimal)
        {
            Caption = 'Gross kilos (Base)';
            ToolTip = 'Specifies the value of the Gross kilos (Base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50038; "Outstanding gross kilos (b)"; Decimal)
        {
            Caption = 'Outstanding gross kilos (b)';
            ToolTip = 'Specifies the value of the Outstanding gross kilos (b) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50039; "Gross kilos to invoice (base)"; Decimal)
        {
            Caption = 'Gross kilos to invoice (base)';
            ToolTip = 'Specifies the value of the Gross kilos to invoice (base) field.';
            BlankZero = false;
            DecimalPlaces = 0 : 5;
        }
        field(50040; "Gross kilos to receive (base)"; Decimal)
        {
            Caption = 'Gross kilos to receive (base)';
            ToolTip = 'Specifies the value of the Gross kilos to receive (base) field.';
            BlankZero = false;
            DecimalPlaces = 0 : 5;
        }
        field(50041; "GK received not invoiced (b)"; Decimal)
        {
            Caption = 'GK received not invoiced (b)';
            ToolTip = 'Specifies the value of the GK received not invoiced (b) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            MinValue = 0;
        }
        field(50042; "Gross kilos received (b)"; Decimal)
        {
            Caption = 'Gross kilos received (b)';
            ToolTip = 'Specifies the value of the Gross kilos received (b) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50043; "Gross kilos invoiced (b)"; Decimal)
        {
            Caption = 'Gross kilos invoiced (b)';
            ToolTip = 'Specifies the value of the Gross kilos invoiced (b) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50044; "Reserved gross kilos (base)"; Decimal)
        {
            Caption = 'Reserved gross kilos (base)';
            ToolTip = 'Specifies the value of the Reserved gross kilos (base) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50045; "NK received not invoiced"; Decimal)
        {
            Caption = 'NK received not invoiced';
            ToolTip = 'Specifies the value of the NK received not invoiced field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50047; "Net kilos invoiced"; Decimal)
        {
            Caption = 'Net kilos invoiced';
            ToolTip = 'Specifies the value of the Net kilos invoiced field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50048; "GK received not invoiced"; Decimal)
        {
            Caption = 'GK received not invoiced';
            ToolTip = 'Specifies the value of the GK received not invoiced field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50049; "Gross kilos invoiced"; Decimal)
        {
            Caption = 'Gross kilos invoiced';
            ToolTip = 'Specifies the value of the Gross kilos invoiced field.';
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
            Caption = 'Reserved net kilos (Base)';
            ToolTip = 'Specifies the value of the Reserved net kilos (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = Normal;
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
        field(60004; "Nombre familia"; Text[250])
        {
            Caption = 'Nombre familia';
            ToolTip = 'Specifies the value of the Nombre familia field.';
            CalcFormula = Lookup("Familia producto".Description WHERE(Code = FIELD(Familia)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(60005; "Nombre subfamilia"; Text[250])
        {
            Caption = 'Nombre subfamilia';
            ToolTip = 'Specifies the value of the Nombre subfamilia field.';
            CalcFormula = Lookup("Subfamilia producto".Description WHERE("Family code" = FIELD(Familia),
                                                                          Code = FIELD(Subfamilia)));
            Editable = false;
            FieldClass = FlowField;
            TableRelation = "Subfamilia producto".Description WHERE("Family code" = FIELD(Familia),
                                                                     Code = FIELD(Subfamilia));
        }
    }


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=Return Shipment No. %1:;ESP=No. envío dev. %1:;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=Return Shipment No. %1:;ESP=No.envío dev. %1:;
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

