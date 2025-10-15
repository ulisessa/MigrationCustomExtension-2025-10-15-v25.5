table 50022 "Invoice Withholding Buffer"
{

    fields
    {
        field(1; "Tipo registro"; Option)
        {
            OptionMembers = Compra,Venta;
        }
        field(2; "Cliente/Proveedor"; Code[20])
        {
            TableRelation = IF ("Tipo registro" = CONST(Compra)) Vendor
            ELSE
            IF ("Tipo registro" = CONST(Venta)) Customer;
        }
        field(3; "No. Factura"; Code[30])
        {
            TableRelation = IF ("Tipo registro" = FILTER(Compra)) "Vendor Ledger Entry" WHERE("Vendor No." = FIELD("Cliente/Proveedor"),
                                                                                             "Document Type" = FILTER(Invoice | "Credit Memo"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(4; "Tipo retencion"; Option)
        {
            OptionMembers = IVA,"Ingresos Brutos",Ganancias,,,,,,"Seguridad Social";
        }
        field(5; "Cod. retencion"; Code[20])
        {
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FIELD("Tipo retencion"));
        }
        field(6; "Tipo fiscal"; Code[10])
        {
            TableRelation = "VAT Business Posting Group".Code;
        }
        field(7; "Fecha pago"; Date)
        {
        }
        field(8; "Base pago retencion"; Decimal)
        {
        }
        field(9; "No. documento"; Code[30])
        {
        }
        field(10; "Pagos anteriores"; Decimal)
        {
        }
        field(11; "Importe retencion"; Decimal)
        {
        }
        field(12; "% retencion"; Decimal)
        {
        }
        field(13; Provincia; Code[10])
        {
        }
        field(14; "No. serie ganancias"; Code[20])
        {
        }
        field(15; "No. serie IVA"; Code[20])
        {
        }
        field(50000; "No. serie Ingresos Brutos"; Code[20])
        {
            Description = 'Agregado 17-09-01';
        }
        field(50001; Nombre; Text[100])
        {
            CalcFormula = Lookup(Vendor.Name WHERE("No." = FIELD("Cliente/Proveedor")));
            FieldClass = FlowField;
        }
        field(50002; "Fecha factura"; Date)
        {
        }
        field(50003; Excluido; Integer)
        {
        }
        field(50004; "% Exclusion"; Decimal)
        {
        }
        field(50005; "Fecha documento exclusion"; Date)
        {
        }
        field(50006; "Importe retencion total"; Decimal)
        {
            CalcFormula = Sum("Invoice Withholding Buffer"."Importe retencion" WHERE("No. documento" = FIELD("No. documento"),
                                                                                      "No. Factura" = FIELD("No. Factura"),
                                                                                      "Tipo retencion" = FIELD("Tipo retencion")));
            FieldClass = FlowField;
        }
        field(50007; "Importe neto factura"; Decimal)
        {
        }
        field(50008; "Importe retenciones anteriores"; Decimal)
        {
        }
        field(50009; "Tipo factura"; Option)
        {
            OptionMembers = Factura,"Nota d/c";
        }
        field(50010; "Factura Prov"; Code[35])
        {
            CalcFormula = Lookup("Purch. Inv. Header"."Vendor Invoice No." WHERE("No." = FIELD("No. Factura")));
            FieldClass = FlowField;
        }
        field(50011; "Serie retención"; Code[20])
        {
        }
        field(50012; Retenido; Boolean)
        {
        }
        field(50013; "Factura liquidada"; Code[30])
        {
        }
        field(50014; "Importe retenido real"; Decimal)
        {
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
            CalcFormula = Lookup("Withholding setup"."Importe pago minimo" WHERE("Tipo retenciones" = FIELD("Tipo retencion"),
                                                                                  "Tipo fiscal" = FIELD("Tipo fiscal"),
                                                                                  "Cod. retencion" = FIELD("Cod. retencion"),
                                                                                  "Importe minimo Stepwise" = CONST(0)));
            FieldClass = FlowField;
        }
        field(50016; "Importe minimo retención"; Decimal)
        {
            CalcFormula = Lookup("Withholding setup"."Importe min. retencion" WHERE("Tipo retenciones" = FIELD("Tipo retencion"),
                                                                                     "Tipo fiscal" = FIELD("Tipo fiscal"),
                                                                                     "Cod. retencion" = FIELD("Cod. retencion"),
                                                                                     "Importe minimo Stepwise" = CONST(0)));
            FieldClass = FlowField;
        }
        field(50017; "Facturacion anterior 12M"; Decimal)
        {
        }
        field(50018; "Precio unitario maximo fac."; Decimal)
        {
        }
        field(50019; "Cod. sicore"; Integer)
        {
        }
        field(50020; "NC Prov"; Code[35])
        {
            CalcFormula = Lookup("Purch. Cr. Memo Hdr."."Vendor Cr. Memo No." WHERE("No." = FIELD("No. Factura")));
            FieldClass = FlowField;
        }
        field(50021; "Importe total comprobante"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50022; "Numero de Certificado"; Code[14])
        {
            DataClassification = ToBeClassified;
        }
        field(50023; "Estado de situación fiscal"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Acción estado sit. fiscal";
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

