tableextension 50094 "Purch. Rcpt. Line Ext." extends "Purch. Rcpt. Line"
{
    Caption = 'Purch. Rcpt. Line';
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

        //Unsupported feature: Property Modification (OptionString) on "Type(Field 5)".

        modify("No.")
        {
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
        modify("Order No.")
        {
            Caption = 'Order No.';
        }
        modify("Order Line No.")
        {
            Caption = 'Order Line No.';
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
        modify("Job Line Type")
        {
            Caption = 'Job Line Type';
        }
        modify("Job Line Amount")
        {
            Caption = 'Job Line Amount';
        }
        modify("Job Line Discount Amount")
        {
            Caption = 'Job Line Discount Amount';
        }
        modify("Job Line Discount %")
        {
            Caption = 'Job Line Discount %';
        }
        modify("Job Line Amount (LCY)")
        {
            Caption = 'Job Line Amount (LCY)';
        }
        modify("Job Line Disc. Amount (LCY)")
        {
            Caption = 'Job Line Disc. Amount (LCY)';
        }
        modify("Job Currency Code")
        {
            Caption = 'Job Currency Code';
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
        modify(Correction)
        {
            Caption = 'Correction';
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
        }
        field(50007; "No. Linea Solicitud"; Integer)
        {
            Caption = 'No. Linea Solicitud';
            ToolTip = 'Specifies the value of the No. Linea Solicitud field.';
        }
        field(50008; "No. Documento Compra"; Code[10])
        {
            Caption = 'No. Documento Compra';
            ToolTip = 'Specifies the value of the No. Documento Compra field.';
        }
        field(50009; "No. Linea Documento Compra"; Integer)
        {
            Caption = 'No. Linea Documento Compra';
            ToolTip = 'Specifies the value of the No. Linea Documento Compra field.';
        }
        field(50010; "Plazo a Transferir"; Integer)
        {
            Caption = 'Plazo a Transferir';
            ToolTip = 'Specifies the value of the Plazo a Transferir field.';
        }
        field(50011; "No. Oferta"; Code[10])
        {
            Caption = 'No. Oferta';
            ToolTip = 'Specifies the value of the No. Oferta field.';
        }
        field(50012; "No. Linea Oferta"; Integer)
        {
            Caption = 'No. Linea Oferta';
            ToolTip = 'Specifies the value of the No. Linea Oferta field.';
        }
        field(50013; "Cód. arancelario"; Code[20])
        {
            Caption = 'Tariff No.';
            ToolTip = 'Specifies the value of the Tariff No field.';
            TableRelation = "Tariff Number";
        }
        field(50014; Usuario; Code[20])
        {
            Caption = 'User ID';
            ToolTip = 'Specifies the value of the User ID field.';
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
        field(50025; "Net kilos to receive (b)"; Decimal)
        {
            Caption = 'Net kilos to receive (b)';
            ToolTip = 'Specifies the value of the Net kilos to receive (b) field.';
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
        field(50028; "Gross kilos to receive (b)"; Decimal)
        {
            Caption = 'Gross kilos to receive (b)';
            ToolTip = 'Specifies the value of the Gross kilos to receive (b) field.';
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
        field(50036; "Reserved net kilos (B)"; Decimal)
        {
            Caption = 'Reserved net kilos (B)';
            ToolTip = 'Specifies the value of the Reserved net kilos (B) field.';
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
        field(50046; "Net kilos received (basdf)"; Decimal)
        {
            Caption = 'Net kilos received (basdf)';
            ToolTip = 'Specifies the value of the Net kilos received (basdf) field.';
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
        field(50061; "Lote origen"; Code[20])
        {
            Caption = 'Lote origen';
            ToolTip = 'Specifies the value of the Lote origen field.';
            DataClassification = ToBeClassified;
        }
        field(50069; "Importe DA"; Decimal)
        {
            Caption = 'Importe DA';
            ToolTip = 'Specifies the value of the Importe DA field.';
            DataClassification = ToBeClassified;
        }
        field(50070; "Importe DL"; Decimal)
        {
            Caption = 'Importe DL';
            ToolTip = 'Specifies the value of the Importe DL field.';
            DataClassification = ToBeClassified;
        }
        field(50078; Revertido; Boolean)
        {
            Caption = 'Reversed';
            ToolTip = 'Specifies the value of the Reversed field.';
            DataClassification = ToBeClassified;
        }
        field(50093; "Importe provisión (DL)"; Decimal)
        {
            Caption = 'Importe provisión (DL)';
            ToolTip = 'Specifies the value of the Importe provisión (DL) field.';
            CalcFormula = Sum("G/L Entry".Amount WHERE("No. documento relacionado" = FIELD("Document No."),
                                                        "No. línea doc. relacionado" = FIELD("Line No."),
                                                        "G/L Account No." = FILTER('2114003' | '2114004'),
                                                        Description = FILTER('Provisión compra')));
            FieldClass = FlowField;
        }
        field(50500; "No. Remito Proveedor"; Code[35])
        {
            Caption = 'No. Remito Proveedor';
            ToolTip = 'Specifies the value of the No. Remito Proveedor field.';
            CalcFormula = Lookup("Purch. Rcpt. Header"."Vendor Shipment No." WHERE("No." = FIELD("Document No.")));
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
        field(50504; "No remito compra"; Code[30])
        {
            Caption = 'No remito compra';
            ToolTip = 'Specifies the value of the No remito compra field.';
            Editable = true;
        }
        field(50505; "No Ln. remito compra"; Integer)
        {
            Caption = 'No Ln. remito compra';
            ToolTip = 'Specifies the value of the No Ln. remito compra field.';
            Editable = true;
        }
        field(50506; "Fecha a revisar"; Date)
        {
            Caption = 'Fecha a revisar';
            ToolTip = 'Specifies the value of the Fecha a revisar field.';
        }
        field(50507; "Actividad AFIP"; Code[10])
        {
            Caption = 'Actividad AFIP';
            ToolTip = 'Specifies the value of the Actividad AFIP field.';
        }
        field(50508; Region; Option)
        {
            Caption = 'Region';
            ToolTip = 'Specifies the value of the Region field.';
            DataClassification = ToBeClassified;
            OptionMembers = "901 - CABA","902 - Buenos Aires","903 - Catamarca","904 - Córdoba","905 - Corrientes","906 - Chaco","907 - Chubut","908 - Entre Ríos","909 - Formosa","910 - Jujuy","911 - La Pampa","912 - La Rioja","913 - Mendoza","914 - Misiones","915 - Neuquén","916 - Río Negro","917 - Salta","918 - San Juan","919 - San Luis","920 - Santa Cruz","921 - Santa Fe","922 - Santiago del Estero","923 - Tierra del Fuego","924 -Tucumán";
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
        field(50596; "Resource Rcpt. Entry No."; Integer)
        {
            Caption = 'Resource Rcpt. Entry No.';
            ToolTip = 'Specifies the value of the Resource Rcpt. Entry No field.';
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
        field(50700; "Cód. retención IVA"; Code[20])
        {
            Caption = 'Cód. retención IVA';
            ToolTip = 'Specifies the value of the Cód. retención IVA field.';
            Description = 'Rel. tabla 50007 filtrado tipo IVA';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = CONST(IVA));
        }
        field(50701; "Cód. retención SS"; Code[20])
        {
            Caption = 'Cód. retención SS';
            ToolTip = 'Specifies the value of the Cód. retención SS field.';
            Description = 'Rel. tabla 50007 filtrado tipo IB';
            TableRelation = "Withholding codes"."Tipo impuesto retencion" WHERE("Tipo impuesto retencion" = FILTER("Ingresos Brutos"));
        }
        field(50702; "Cód. retención ganancias"; Code[20])
        {
            Caption = 'Cód. retención ganancias';
            ToolTip = 'Specifies the value of the Cód. retención ganancias field.';
            Description = 'Rel. tabla 50007 filtrado tipo Ganancias';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER(Ganancias));
        }
        field(50703; Provincia; Code[10])
        {
            Caption = 'Provincia';
            ToolTip = 'Specifies the value of the Provincia field.';
            Description = 'Rel. tabla provincia';
        }
        field(50704; "No. Despacho"; Code[20])
        {
            Caption = 'No. Despacho';
            ToolTip = 'Specifies the value of the No. Despacho field.';
            Description = 'No del despacho de importación';
        }
        field(50707; "Cód. retención IIBB"; Code[20])
        {
            Caption = 'Cód. retención IIBB';
            ToolTip = 'Specifies the value of the Cód. retención IIBB field.';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER("Ingresos Brutos"));
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
        field(68202; "Cód. divisa"; Code[10])
        {
            Caption = 'Currency Code';
            ToolTip = 'Specifies the value of the Currency Code field.';
            TableRelation = Currency.Code;
        }
    }

    //Unsupported feature: Variable Insertion (Variable: rstJobTask) (VariableCollection) on "InsertInvLineFromRcptLine(PROCEDURE 2)".



    //Unsupported feature: Code Modification on "InsertInvLineFromRcptLine(PROCEDURE 2)".

    //procedure InsertInvLineFromRcptLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetRange("Document No.","Document No.");

    TempPurchLine := PurchLine;
    #4..76
      PurchLine."Qty. Received (Base)" := 0;
      PurchLine."Quantity Invoiced" := 0;
      PurchLine."Qty. Invoiced (Base)" := 0;
      PurchLine.Amount := 0;
      PurchLine."Amount Including VAT" := 0;
      PurchLine."Sales Order No." := '';
    #83..90
      OnAfterCopyFromPurchRcptLine(PurchLine,Rec);
      if not ExtTextLine then begin
        PurchLine.Validate(Quantity,Quantity - "Quantity Invoiced");
        CalcBaseQuantities(PurchLine,"Quantity (Base)" / Quantity);

        OnInsertInvLineFromRcptLineOnAfterCalcQuantities(PurchLine,PurchOrderLine);
    #97..132
          "Attached to Line No.");
      PurchLine."Shortcut Dimension 1 Code" := "Shortcut Dimension 1 Code";
      PurchLine."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
      PurchLine."Dimension Set ID" := "Dimension Set ID";

      if "Sales Order No." = '' then
    #139..149
      if "Attached to Line No." = 0 then
        SetRange("Attached to Line No.","Line No.");
    until (Next = 0) or ("Attached to Line No." = 0);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..79
      //++Arbu 2020
      PurchLine."Net kilos (Base)" := 0;
      PurchLine."Net kilos" := 0;
      PurchLine."Outstanding net kilos" := 0;
      PurchLine."Outstanding net kilos (base)" := 0;
      PurchLine."Net kilos received" := 0;
      PurchLine."Net kilos received (b)" := 0;
      PurchLine."Net kilos invoiced" := 0;
      PurchLine."Net kilos invoiced (b)" := 0;

      PurchLine."Gross kilos (Base)" := 0;
      PurchLine."Gross kilos" := 0;
      PurchLine."Outstanding gross kilos" := 0;
      PurchLine."Outstanding gross kilos (b)" := 0;
      PurchLine."Gross kilos received" := 0;
      PurchLine."Gross kilos received (b)" := 0;
      PurchLine."Gross kilos invoiced" := 0;
      PurchLine."Gross kilos invoiced (b)" := 0;
      //--Arbu 2020
    #80..93
        //++Arbu
        PurchLine.Validate("Net kilos","Net kilos"-"Net kilos invoiced");
        PurchLine.Validate("Gross kilos","Gross kilos"-"Gross kilos invoiced");
        //--Arbu
    #94..135
      //++Arbu
      PurchLine."Shortcut Dimension 3 Code" := "Shortcut Dimension 3 Code";
      PurchLine."Shortcut Dimension 4 Code" := "Shortcut Dimension 4 Code";
      PurchLine."Shortcut Dimension 5 Code" := "Shortcut Dimension 5 Code";
      PurchLine."Shortcut Dimension 6 Code" := "Shortcut Dimension 6 Code";
      PurchLine."Shortcut Dimension 7 Code" := "Shortcut Dimension 7 Code";
      PurchLine."Concepto proyecto" := "Concepto proyecto";
      PurchLine."No. Cab. Solicitud" := "No. Cab. Solicitud";
      PurchLine."No. Linea Solicitud" := "No. Linea Solicitud";
      PurchLine."No. Documento Compra" := "No. Documento Compra";
      PurchLine."Purch. doc. line no.":= "No. Linea Documento Compra";
      PurchLine."No. Oferta" := "No. Oferta";
      PurchLine."No. Ln. Oferta" := "No. Linea Oferta";
      PurchLine."Tariff code":= "Cód. arancelario";
      PurchLine.Flete := Flete;
      PurchLine."Fecha recepcin proveedor" := "Fecha recepción proveedor";
      PurchLine."Fecha a revisar" := "Fecha a revisar";
      PurchLine."Actividad AFIP" := "Actividad AFIP";
      PurchLine."Consumir automáticamente":= "Consumir automáticamente";
      PurchLine."VAT withholding code" := "Cód. retención IVA";
      PurchLine."SS withholding code" := "Cód. retención SS";
      PurchLine."Winnings withholding code" := "Cód. retención ganancias";
      PurchLine."VAT %" := "VAT %";
      PurchLine.Provincia := Provincia;
      PurchLine."No. Despacho" := "No. Despacho";
      PurchLine.Familia := Familia;
      PurchLine.Subfamilia := Subfamilia;
      PurchLine."Job No." := "Job No.";
      Clear(rstJobTask);
      rstJobTask.SetRange(rstJobTask."Job No.","Job No.");
      rstJobTask.SetRange("Job Task Type",rstJobTask."Job Task Type"::Posting);
      if rstJobTask.FindFirst then
        PurchLine."Job Task No." := rstJobTask."Job Task No.";

      //--Arbu

    #136..152
    */
    //end;


    //Unsupported feature: Code Modification on "GetPurchInvLines(PROCEDURE 4)".

    //procedure GetPurchInvLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TempPurchInvLine.Reset;
    TempPurchInvLine.DeleteAll;

    if Type <> Type::Item then
      exit;

    FilterPstdDocLnItemLedgEntries(ItemLedgEntry);
    ItemLedgEntry.SetFilter("Invoiced Quantity",'<>0');
    if ItemLedgEntry.FindSet then begin
    #10..22
          until ValueEntry.Next = 0;
      until ItemLedgEntry.Next = 0;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
    //++Arbu
    begin

      if Type = Type::Resource then
      begin

        Clear(PurchInvLine);
        PurchInvLine.SetRange("Receipt No.","Document No.");
        PurchInvLine.SetRange("Receipt Line No.","Line No.");
        if PurchInvLine.FindSet then
        repeat

          TempPurchInvLine.Init;
          TempPurchInvLine := PurchInvLine;
          if TempPurchInvLine.Insert then;
        until PurchInvLine.Next = 0;

      end;

      if Type = Type::"Fixed Asset" then
      begin

        Clear(PurchInvLine);
        PurchInvLine.SetRange("Receipt No.","Document No.");
        PurchInvLine.SetRange("Receipt Line No.","Line No.");
        if PurchInvLine.FindSet then
        repeat

          TempPurchInvLine.Init;
          TempPurchInvLine := PurchInvLine;
          if TempPurchInvLine.Insert then;
        until PurchInvLine.Next = 0;

      end
      else
      exit;

    end;
    #7..25
    */
    //end;


    //Unsupported feature: Code Modification on "CalcReceivedPurchNotReturned(PROCEDURE 6)".

    //procedure CalcReceivedPurchNotReturned();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    RemainingQty := 0;
    if (Type <> Type::Item) or (Quantity <= 0) then begin
      RevUnitCostLCY := "Unit Cost (LCY)";
      exit;
    #5..7
    FilterPstdDocLnItemLedgEntries(ItemLedgEntry);
    if ItemLedgEntry.FindSet then
      repeat
        RemainingQty := RemainingQty + ItemLedgEntry."Remaining Quantity";
        if ExactCostReverse then begin
          ItemLedgEntry.CalcFields("Cost Amount (Expected)","Cost Amount (Actual)");
          TotalCostLCY :=
            TotalCostLCY + ItemLedgEntry."Cost Amount (Expected)" + ItemLedgEntry."Cost Amount (Actual)";
          TotalQtyBase := TotalQtyBase + ItemLedgEntry.Quantity;
        end;
      until ItemLedgEntry.Next = 0;

    if ExactCostReverse and (RemainingQty <> 0) and (TotalQtyBase <> 0) then
      RevUnitCostLCY := Abs(TotalCostLCY / TotalQtyBase) * "Qty. per Unit of Measure"
    else
      RevUnitCostLCY := "Unit Cost (LCY)";

    RemainingQty := CalcQty(RemainingQty);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //++Arbu 2020
    //RemainingQty := 0;
    RemainingQty[1] := 0;
    RemainingQty[2] := 0;
    RemainingQty[3] := 0;
    //--Arbu 2020
    if (Type <> Type::Item) or (Quantity <= 0) then
    begin
      RemainingQty[1] := 0;
    #2..10
          //++Arbu 2020
          //RemainingQty := RemainingQty + ItemLedgEntry."Remaining Quantity";
          RemainingQty[1] := RemainingQty[1] + ItemLedgEntry."Remaining Quantity";
          RemainingQty[2] := RemainingQty[2] + ItemLedgEntry."Remaining net kilos";
          RemainingQty[3] := RemainingQty[3] + ItemLedgEntry."Remaining gross kilos";
          //--Arbu 2020
          if ExactCostReverse then
          begin
    #13..15
            //++Arbu 2020
            //TotalQtyBase := TotalQtyBase[1] + ItemLedgEntry.Quantity;
            TotalQtyBase[1] := TotalQtyBase[1] + ItemLedgEntry.Quantity;
            TotalQtyBase[2] := TotalQtyBase[2] + ItemLedgEntry."Net kilos";
            TotalQtyBase[3] := TotalQtyBase[3] + ItemLedgEntry."Gross kilos";
            //--Arbu 2020
    #17..19
      if ExactCostReverse and (RemainingQty[1] <> 0) and (TotalQtyBase[1] <> 0) then
        RevUnitCostLCY := Abs(TotalCostLCY / TotalQtyBase[1]) * "Qty. per Unit of Measure"
    #22..24
      RemainingQty[1] := CalcQty(RemainingQty[1]);
    end;
    */
    //end;

    //Unsupported feature: Property Insertion (Dimensions) on "CalcReceivedPurchNotReturned(PROCEDURE 6).RemainingQty(Parameter 1003)".


    //Unsupported feature: Property Insertion (Dimensions) on "CalcReceivedPurchNotReturned(PROCEDURE 6).TotalQtyBase(Variable 1002)".



    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=Receipt No. %1:;ESP=No. albarán %1:;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=Receipt No. %1:;ESP=No.Remito %1:;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=The program cannot find this purchase line.;ESP=El prog. no puede encontrar esta lín. compra.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=The program cannot find this purchase line.;ESP=El prog. no puede encontrar esta lín. compra.;
    //Variable type has not been exported.
}

