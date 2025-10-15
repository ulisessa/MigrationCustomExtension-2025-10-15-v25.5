tableextension 123 PurchInvLine extends "Purch. Inv. Line"
{
    fields
    {
        field(50000; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';

        }
        field(50001; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';

        }
        field(50002; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 1 Code';

        }
        field(50003; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 2 Code';

        }
        field(50004; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 1 Code';

        }
        field(50005; "Concepto proyecto"; Code[10])
        {
            TableRelation = "Concepto proyecto";
        }
        field(50006; "No. Cab. Solicitud"; Code[30])
        {
        }
        field(50007; "No. Linea Solicitud"; Integer)
        {
        }
        field(50008; "No. Documento Compra"; Code[10])
        {
        }
        field(50009; "No. Linea Documento Compra"; Integer)
        {
        }
        field(50010; "Plazo a Transferir"; Integer)
        {
        }
        field(50011; "No. Oferta"; Code[10])
        {
        }
        field(50012; "No. Linea Oferta"; Integer)
        {
        }
        field(50013; "Cód. arancelario"; Code[20])
        {
            TableRelation = "Tariff Number";
        }
        field(50014; Usuario; Code[20])
        {
            TableRelation = User;
        }
        field(50015; "Gross kilos"; Decimal)
        {
        }
        field(50016; "Net kilos"; Decimal)
        {
        }
        field(50017; "Gross kilos to receive"; Decimal)
        {
        }
        field(50018; "Net kilos to receive"; Decimal)
        {
        }
        field(50019; "Gross kilos received"; Decimal)
        {
        }
        field(50020; "Net kilos received"; Decimal)
        {
        }
        field(50021; "Carpeta de Importación"; Code[20])
        {
        }
        field(50022; "Outstanding net kilos"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50023; "Net kilos to invoice"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50025; "Net kilos to receive (b)"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50026; "Outstanding gross kilos"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50027; "Gross kilos to invoice"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50028; "Gross kilos to receive (b)"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50029; "Net kilos (Base)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
        }
        field(50030; "Outstanding net kilos (base)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50031; "Net kilos to invoice (base)"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50033; "NK received not invoiced (b)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50034; "Net kilos received (b)"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50035; "Net kilos invoiced (b)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50036; "Reserved net kilos (B)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50037; "Gross kilos (Base)"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50038; "Outstanding gross kilos (b)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50039; "Gross kilos to invoice (base)"; Decimal)
        {
            BlankZero = false;
            DecimalPlaces = 0 : 5;
        }
        field(50041; "GK received not invoiced (b)"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = false;
            MinValue = 0;
        }
        field(50042; "Gross kilos received (b)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50043; "Gross kilos invoiced (b)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50044; "Reserved gross kilos (base)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50045; "NK received not invoiced"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50046; "Net kilos received (basdf)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50047; "Net kilos invoiced"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50048; "GK received not invoiced"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50049; "Gross kilos invoiced"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50050; "Cdad k.b. facturada"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50051; "Cdad k.n. rec. no fact. (base)"; Decimal)
        {
        }
        field(50052; "Cdad k.b. rec. no fact. (base)"; Decimal)
        {
        }
        field(50061; "Lote origen"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50069; "Importe DA"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50070; "Importe DL"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50093; "Importe provisión (DL)"; Decimal)
        {
            CalcFormula = Sum("G/L Entry".Amount WHERE("No. documento relacionado" = FIELD("Receipt No."),
                                                        "No. línea doc. relacionado" = FIELD("Receipt Line No."),
                                                        "G/L Account No." = FILTER('2114003' | '2114004'),
                                                        Description = FILTER('Deshacer Provisin compra')));
            FieldClass = FlowField;
        }
        field(50405; "No. remito proveedor"; Code[30])
        {
        }
        field(50501; Flete; Decimal)
        {
        }
        field(50502; "Fecha recepción proveedor"; Date)
        {
        }
        field(50507; "Actividad AFIP"; Code[10])
        {
            TableRelation = "Actividad proveedor"."No. actividad" WHERE("No. proveedor" = FIELD("Buy-from Vendor No."));
        }
        field(50508; Region; Option)
        {
            Caption = 'Región';
            DataClassification = ToBeClassified;
            OptionMembers = "901 - CABA","902 - Buenos Aires","903 - Catamarca","904 - Córdoba","905 - Corrientes","906 - Chaco","907 - Chubut","908 - Entre Ríos","909 - Formosa","910 - Jujuy","911 - La Pampa","912 - La Rioja","913 - Mendoza","914 - Misiones","915 - Neuquén","916 - Río Negro","917 - Salta","918 - San Juan","919 - San Luis","920 - Santa Cruz","921 - Santa Fe","922 - Santiago del Estero","923 - Tierra del Fuego","924 -Tucumán";
        }
        field(50510; "Descripción cód. arancelario"; Text[250])
        {
            CalcFormula = Lookup("Tariff Number".Description WHERE("No." = FIELD("Cód. arancelario")));
            FieldClass = FlowField;
        }
        field(50511; "Consumir automáticamente"; Boolean)
        {
        }
        field(50512; "Net kilos per UOM"; Decimal)
        {
            Caption = 'Net kilos per UOM';
        }
        field(50513; "Gross kilos per UOM"; Decimal)
        {
            Caption = 'Gross kilos per UOM';
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
        field(50700; "Cód. retención IVA"; Code[20])
        {
            Description = 'Editable-rel.tabla retenciones filtrado tipo IVA';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER(IVA));
        }
        field(50701; "Cód. retención SS"; Code[20])
        {
            Description = 'Editable-rel.tabla retenciones filtrado tipo IB';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER("Seguridad Social"));
        }
        field(50702; "Cód. retención ganancias"; Code[20])
        {
            Description = 'Editable-rel.tabla retenciones filtrado tipo GANANCIAS';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER(Ganancias));
        }
        field(50703; Provincia; Code[10])
        {
            Description = 'Rel. tabla provincia';
        }
        field(50704; "No. Despacho"; Code[20])
        {
            Description = 'No despacho importación';
        }
        field(50707; "Cód. retención IIBB"; Code[20])
        {
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER("Ingresos Brutos"));
        }
    }
}