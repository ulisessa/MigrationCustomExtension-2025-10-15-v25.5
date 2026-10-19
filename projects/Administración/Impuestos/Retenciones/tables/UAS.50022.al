table 50022 "Invoice Withholding Buffer"
{

    fields
    {
        field(1; "Tipo registro"; Option)
        {
            Caption = 'Tipo registro';
            ToolTip = 'Specifies the value of the Tipo registro field.';
            OptionMembers = Compra,Venta;
        }
        field(2; "Cliente/Proveedor"; Code[20])
        {
            Caption = 'Cliente/Proveedor';
            ToolTip = 'Specifies the value of the Cliente/Proveedor field.';
            TableRelation = IF ("Tipo registro" = CONST(Compra)) Vendor
            ELSE
            IF ("Tipo registro" = CONST(Venta)) Customer;
        }
        field(3; "No. Factura"; Code[30])
        {
            Caption = 'No. Factura';
            ToolTip = 'Specifies the value of the No. Factura field.';
            TableRelation = IF ("Tipo registro" = FILTER(Compra)) "Vendor Ledger Entry" WHERE("Vendor No." = FIELD("Cliente/Proveedor"),
                                                                                             "Document Type" = FILTER(Invoice | "Credit Memo"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(4; "Tipo retencion"; Option)
        {
            Caption = 'Tipo retencion';
            ToolTip = 'Specifies the value of the Tipo retencion field.';
            OptionMembers = IVA,"Ingresos Brutos",Ganancias,,,,,,"Seguridad Social";
        }
        field(5; "Cod. retencion"; Code[20])
        {
            Caption = 'Cod. retencion';
            ToolTip = 'Specifies the value of the Cod. retencion field.';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FIELD("Tipo retencion"));
        }
        field(6; "Tipo fiscal"; Code[10])
        {
            Caption = 'Fiscal Type';
            ToolTip = 'Specifies the value of the Fiscal Type field.';
            TableRelation = "VAT Business Posting Group".Code;
        }
        field(7; "Fecha pago"; Date)
        {
            Caption = 'Fecha pago';
            ToolTip = 'Specifies the value of the Fecha pago field.';
        }
        field(8; "Base pago retencion"; Decimal)
        {
            Caption = 'Base pago retencion';
            ToolTip = 'Specifies the value of the Base pago retencion field.';
        }
        field(9; "No. documento"; Code[30])
        {
            Caption = 'Document No.';
            ToolTip = 'Specifies the value of the Document No field.';
        }
        field(10; "Pagos anteriores"; Decimal)
        {
            Caption = 'Pagos anteriores';
            ToolTip = 'Specifies the value of the Pagos anteriores field.';
        }
        field(11; "Importe retencion"; Decimal)
        {
            Caption = 'Importe retencion';
            ToolTip = 'Specifies the value of the Importe retencion field.';
        }
        field(12; "% retencion"; Decimal)
        {
            Caption = '% retencion';
            ToolTip = 'Specifies the value of the % retencion field.';
        }
        field(13; Provincia; Code[10])
        {
            Caption = 'Provincia';
            ToolTip = 'Specifies the value of the Provincia field.';
        }
        field(14; "No. serie ganancias"; Code[20])
        {
            Caption = 'No. serie ganancias';
            ToolTip = 'Specifies the value of the No. serie ganancias field.';
        }
        field(15; "No. serie IVA"; Code[20])
        {
            Caption = 'No. serie IVA';
            ToolTip = 'Specifies the value of the No. serie IVA field.';
        }
        field(50000; "No. serie Ingresos Brutos"; Code[20])
        {
            Caption = 'No. serie Ingresos Brutos';
            ToolTip = 'Specifies the value of the No. serie Ingresos Brutos field.';
            Description = 'Agregado 17-09-01';
        }
        field(50001; Nombre; Text[100])
        {
            Caption = 'Name';
            ToolTip = 'Specifies the value of the Name field.';
            CalcFormula = Lookup(Vendor.Name WHERE("No." = FIELD("Cliente/Proveedor")));
            FieldClass = FlowField;
        }
        field(50002; "Fecha factura"; Date)
        {
            Caption = 'Fecha factura';
            ToolTip = 'Specifies the value of the Fecha factura field.';
        }
        field(50003; Excluido; Integer)
        {
            Caption = 'Excluido';
            ToolTip = 'Specifies the value of the Excluido field.';
        }
        field(50004; "% Exclusion"; Decimal)
        {
            Caption = '% Exclusion';
            ToolTip = 'Specifies the value of the % Exclusion field.';
        }
        field(50005; "Fecha documento exclusion"; Date)
        {
            Caption = 'Fecha documento exclusion';
            ToolTip = 'Specifies the value of the Fecha documento exclusion field.';
        }
        field(50006; "Importe retencion total"; Decimal)
        {
            Caption = 'Importe retencion total';
            ToolTip = 'Specifies the value of the Importe retencion total field.';
            CalcFormula = Sum("Invoice Withholding Buffer"."Importe retencion" WHERE("No. documento" = FIELD("No. documento"),
                                                                                      "No. Factura" = FIELD("No. Factura"),
                                                                                      "Tipo retencion" = FIELD("Tipo retencion")));
            FieldClass = FlowField;
        }
        field(50007; "Importe neto factura"; Decimal)
        {
            Caption = 'Importe neto factura';
            ToolTip = 'Specifies the value of the Importe neto factura field.';
        }
        field(50008; "Importe retenciones anteriores"; Decimal)
        {
            Caption = 'Importe retenciones anteriores';
            ToolTip = 'Specifies the value of the Importe retenciones anteriores field.';
        }
        field(50009; "Tipo factura"; Option)
        {
            Caption = 'Tipo factura';
            ToolTip = 'Specifies the value of the Tipo factura field.';
            OptionMembers = Factura,"Nota d/c";
        }
        field(50010; "Factura Prov"; Code[35])
        {
            Caption = 'Factura Prov';
            ToolTip = 'Specifies the value of the Factura Prov field.';
            CalcFormula = Lookup("Purch. Inv. Header"."Vendor Invoice No." WHERE("No." = FIELD("No. Factura")));
            FieldClass = FlowField;
        }
        field(50011; "Serie retención"; Code[20])
        {
            Caption = 'Serie retención';
            ToolTip = 'Specifies the value of the Serie retención field.';
        }
        field(50012; Retenido; Boolean)
        {
            Caption = 'Retenido';
            ToolTip = 'Specifies the value of the Retenido field.';
        }
        field(50013; "Factura liquidada"; Code[30])
        {
            Caption = 'Factura liquidada';
            ToolTip = 'Specifies the value of the Factura liquidada field.';
        }
        field(50014; "Importe retenido real"; Decimal)
        {
            Caption = 'Importe retenido real';
            ToolTip = 'Specifies the value of the Importe retenido real field.';
            CalcFormula = Sum("Invoice Withholding Buffer"."Importe retencion" WHERE("Cliente/Proveedor" = FIELD("Cliente/Proveedor"),
                                                                                      "Factura liquidada" = FIELD("Factura liquidada"),
                                                                                      "Tipo retencion" = FIELD("Tipo retencion"),
                                                                                      "Cod. retencion" = FIELD("Cod. retencion"),
                                                                                      "Tipo fiscal" = FIELD("Tipo fiscal"),
                                                                                      "No. documento" = FIELD("No. documento")));
            FieldClass = FlowField;
        }
        field(50015; "Importe minimo pago"; Decimal)
        {
            Caption = 'Importe minimo pago';
            ToolTip = 'Specifies the value of the Importe minimo pago field.';
            CalcFormula = Lookup("Withholding setup"."Importe pago minimo" WHERE("Tipo retenciones" = FIELD("Tipo retencion"),
                                                                                  "Tipo fiscal" = FIELD("Tipo fiscal"),
                                                                                  "Cod. retencion" = FIELD("Cod. retencion"),
                                                                                  "Importe minimo Stepwise" = CONST(0)));
            FieldClass = FlowField;
        }
        field(50016; "Importe minimo retención"; Decimal)
        {
            Caption = 'Importe minimo retención';
            ToolTip = 'Specifies the value of the Importe minimo retención field.';
            CalcFormula = Lookup("Withholding setup"."Importe min. retencion" WHERE("Tipo retenciones" = FIELD("Tipo retencion"),
                                                                                     "Tipo fiscal" = FIELD("Tipo fiscal"),
                                                                                     "Cod. retencion" = FIELD("Cod. retencion"),
                                                                                     "Importe minimo Stepwise" = CONST(0)));
            FieldClass = FlowField;
        }
        field(50017; "Facturacion anterior 12M"; Decimal)
        {
            Caption = 'Facturacion anterior 12M';
            ToolTip = 'Specifies the value of the Facturacion anterior 12M field.';
        }
        field(50018; "Precio unitario maximo fac."; Decimal)
        {
            Caption = 'Precio unitario maximo fac.';
            ToolTip = 'Specifies the value of the Precio unitario maximo fac field.';
        }
        field(50019; "Cod. sicore"; Integer)
        {
            Caption = 'Cod. sicore';
            ToolTip = 'Specifies the value of the Cod. sicore field.';
        }
        field(50020; "NC Prov"; Code[35])
        {
            Caption = 'NC Prov';
            ToolTip = 'Specifies the value of the NC Prov field.';
            CalcFormula = Lookup("Purch. Cr. Memo Hdr."."Vendor Cr. Memo No." WHERE("No." = FIELD("No. Factura")));
            FieldClass = FlowField;
        }
        field(50021; "Importe total comprobante"; Decimal)
        {
            Caption = 'Importe total comprobante';
            ToolTip = 'Specifies the value of the Importe total comprobante field.';
            DataClassification = ToBeClassified;
        }
        field(50022; "Numero de Certificado"; Code[14])
        {
            Caption = 'Numero de Certificado';
            ToolTip = 'Specifies the value of the Numero de Certificado field.';
            DataClassification = ToBeClassified;
        }
        field(50023; "Estado de situación fiscal"; Code[10])
        {
            Caption = 'Estado de situación fiscal';
            ToolTip = 'Specifies the value of the Estado de situación fiscal field.';
            DataClassification = ToBeClassified;
            TableRelation = "Acción estado sit. fiscal";
        }
        field(50024; "Comentario exclusion"; Text[50])
        {
            Caption = 'Comentario exclusion';
            ToolTip = 'Specifies the value of the Comentario exclusion field.';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Tipo registro", "Cliente/Proveedor", "No. Factura", "Tipo retencion", "Cod. retencion", "No. documento", "Tipo fiscal")
        {
            Clustered = true;
            SumIndexFields = "Importe retencion";
        }
        key(Key2; "No. documento", "Cod. retencion")
        {
        }
        key(Key3; "Cod. retencion", "No. documento")
        {
        }
        key(Key4; "No. serie ganancias")
        {
        }
        key(Key5; "No. serie IVA")
        {
        }
        key(Key6; "Fecha pago", "No. documento")
        {
        }
        key(Key7; "Fecha pago", "Cliente/Proveedor", "No. Factura")
        {
        }
        key(Key8; "Fecha factura")
        {
        }
        key(Key9; "No. Factura")
        {
        }
        key(Key10; "Cliente/Proveedor", "No. Factura", "Tipo retencion", "Cod. retencion", "Tipo fiscal")
        {
        }
        key(Key11; "No. documento")
        {
        }
        key(Key12; "Serie retención", "Cod. retencion")
        {
        }
        key(Key13; "Cliente/Proveedor", "Factura liquidada", "Tipo retencion", "Cod. retencion", "Tipo fiscal", "No. documento")
        {
            SumIndexFields = "Importe retencion";
        }
    }

    fieldgroups
    {
    }
}

