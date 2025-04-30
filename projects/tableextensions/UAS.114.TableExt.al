tableextension 114 "Sales Cr.MemoHeader" extends "Sales Cr.Memo Header"
{
    fields
    {
        field(50000; "Shortcut Dimension 3 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(50001; "Shortcut Dimension 4 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
        }
        field(50002; "Shortcut Dimension 5 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));
        }
        field(50003; "Shortcut Dimension 6 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));
        }
        field(50004; "Shortcut Dimension 7 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));
        }
        field(50005; "No. certificación"; Code[10])
        {
            Editable = false;
        }
        field(50006; "Orden Encargo"; Code[10])
        {
        }
        field(50007; "Carpeta de Exportación"; Text[10])
        {
        }
        field(50008; "Permiso de embarque"; Code[30])
        {
        }
        field(50009; Marcas; Code[20])
        {
        }
        field(50010; "Banco Interviniente"; Code[30])
        {
            Enabled = false;
        }
        field(50011; "Producido en"; Code[100])
        {
            Enabled = false;
        }
        field(50012; "Puerto carga"; Code[10])
        {
        }
        field(50013; "Puerto destino"; Code[10])
        {
        }
        field(50014; "Cód. Contenedor"; Code[20])
        {
        }
        field(50015; "Precinto DGA"; Code[20])
        {
        }
        field(50016; Precinto; Code[20])
        {
        }
        field(50018; Aprobado; Boolean)
        {
        }
        field(50019; Usuario; Code[20])
        {
            TableRelation = User;
        }
        field(50020; "Importe sujeto retencion"; Decimal)
        {
        }
        field(50021; "Porcentaje de retencion"; Decimal)
        {
        }
        field(50022; "Importe sujeto reembolso"; Decimal)
        {
        }
        field(50023; "Porcentaje reembolso"; Decimal)
        {
        }
        field(50024; "Importe sujeto reintegro"; Decimal)
        {
        }
        field(50025; "% reintegro"; Decimal)
        {
        }
        field(50026; Procesado; Boolean)
        {
        }
        field(50027; "Tipo de Contenedor"; Option)
        {
            OptionMembers = " ","20","40",BODEGA,CAMION,OTRO;
        }
        field(50029; "Transporte matrícula"; Code[10])
        {
        }
        field(50030; Temperatura; Decimal)
        {
        }
        field(50031; Hora; Time)
        {
        }
        field(50032; "Tipo de amparo sanitario"; Option)
        {
            BlankZero = true;
            OptionMembers = ,"P.T.","P.T.R.","C.S.E.P.","Guía de tránsito";
        }
        field(50033; "No. amparo sanitario"; Code[30])
        {
        }
        field(50034; Destino; Code[30])
        {
        }
        field(50035; Conductor; Text[50])
        {
        }
        field(50036; Insumos; Decimal)
        {
            CalcFormula = Sum("Insumos fact proyecto".Insumos WHERE(Factura = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(50037; "Old Job No."; Code[20])
        {
            Caption = 'Job No.';
            TableRelation = Job;
        }
        field(50038; "Seguimiento para trazabilidad"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Post-Expo - Controlar contra DCL","No controlar contra DCL","Pre-Expo - Controlar contra DCL";
        }
        field(50500; Observaciones; Text[30])
        {
        }
        field(50501; Estado; Text[50])
        {
            CalcFormula = Lookup(Mensajeria.Estado WHERE("No. documento" = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(50502; "Archivo vinculado"; Text[25])
        {
        }
        field(50595; "Tipo documento mensajeria"; Text[40])
        {
            CalcFormula = Lookup(Mensajeria."Tipo Documento" WHERE("No. documento" = FIELD("Pre-Assigned No.")));
            FieldClass = FlowField;
        }
        field(50596; "Estado mensajería"; Text[50])
        {
            CalcFormula = Lookup(Mensajeria.Estado WHERE("No. documento" = FIELD("Pre-Assigned No.")));
            FieldClass = FlowField;
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
        field(50702; Province; Code[10])
        {
            TableRelation = Area;
        }
        field(50703; "Tipo Fiscal"; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('TIPO FISCAL'));
        }
        field(50704; "Punto Venta"; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('PUNTO VENTA'));
        }
        field(50705; "Tipo Factura"; Option)
        {
            OptionMembers = Factura,"Nota Debito","Nota Crédito";
        }
        field(50706; "No. Factura"; Code[30])
        {
            TableRelation = "xCost Entry";
        }
        field(50707; "CAI-CAE"; Code[14])
        {
            DataClassification = ToBeClassified;
        }
        field(50708; "Tipo documento AFIP"; Code[3])
        {
            DataClassification = ToBeClassified;
        }
    }
}
