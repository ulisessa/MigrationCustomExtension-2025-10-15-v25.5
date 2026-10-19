tableextension 123 PurchInvLine extends "Purch. Inv. Line"
{
    fields
    {
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
        field(50093; "Importe provisión (DL)"; Decimal)
        {
            Caption = 'Importe provisión (DL)';
            ToolTip = 'Specifies the value of the Importe provisión (DL) field.';
            CalcFormula = Sum("G/L Entry".Amount WHERE("No. documento relacionado" = FIELD("Receipt No."),
                                                        "No. línea doc. relacionado" = FIELD("Receipt Line No."),
                                                        "G/L Account No." = FILTER('2114003' | '2114004'),
                                                        Description = FILTER('Deshacer Provisin compra')));
            FieldClass = FlowField;
        }
        field(50405; "No. remito proveedor"; Code[30])
        {
            Caption = 'No. remito proveedor';
            ToolTip = 'Specifies the value of the No. remito proveedor field.';
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
        field(50507; "Actividad AFIP"; Code[10])
        {
            Caption = 'Actividad AFIP';
            ToolTip = 'Specifies the value of the Actividad AFIP field.';
            TableRelation = "Actividad proveedor"."No. actividad" WHERE("No. proveedor" = FIELD("Buy-from Vendor No."));
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
            Description = 'Editable-rel.tabla retenciones filtrado tipo IVA';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER(IVA));
        }
        field(50701; "Cód. retención SS"; Code[20])
        {
            Caption = 'Cód. retención SS';
            ToolTip = 'Specifies the value of the Cód. retención SS field.';
            Description = 'Editable-rel.tabla retenciones filtrado tipo IB';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER("Seguridad Social"));
        }
        field(50702; "Cód. retención ganancias"; Code[20])
        {
            Caption = 'Cód. retención ganancias';
            ToolTip = 'Specifies the value of the Cód. retención ganancias field.';
            Description = 'Editable-rel.tabla retenciones filtrado tipo GANANCIAS';
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
            Description = 'No despacho importación';
        }
        field(50707; "Cód. retención IIBB"; Code[20])
        {
            Caption = 'Cód. retención IIBB';
            ToolTip = 'Specifies the value of the Cód. retención IIBB field.';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER("Ingresos Brutos"));
        }
    }
}