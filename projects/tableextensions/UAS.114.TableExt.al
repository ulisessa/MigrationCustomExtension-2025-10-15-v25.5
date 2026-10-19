tableextension 114 "Sales Cr.MemoHeader" extends "Sales Cr.Memo Header"
{
    fields
    {
        field(50000; "Shortcut Dimension 3 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 3 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';

        }
        field(50001; "Shortcut Dimension 4 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 3 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';

        }
        field(50002; "Shortcut Dimension 5 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 3 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';

        }
        field(50003; "Shortcut Dimension 6 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 3 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';

        }
        field(50004; "Shortcut Dimension 7 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 3 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';

        }
        field(50005; "No. certificación"; Code[10])
        {
            Caption = 'No. certificación';
            ToolTip = 'Specifies the value of the No. certificación field.';
            Editable = false;
        }
        field(50006; "Orden Encargo"; Code[10])
        {
            Caption = 'Orden Encargo';
            ToolTip = 'Specifies the value of the Orden Encargo field.';
        }
        field(50007; "Carpeta de Exportación"; Text[10])
        {
            Caption = 'Carpeta de Exportación';
            ToolTip = 'Specifies the value of the Carpeta de Exportación field.';
        }
        field(50008; "Permiso de embarque"; Code[30])
        {
            Caption = 'Boarding permission';
            ToolTip = 'Specifies the value of the Boarding permission field.';
        }
        field(50009; Marcas; Code[20])
        {
            Caption = 'Marcas';
            ToolTip = 'Specifies the value of the Marcas field.';
        }
        field(50010; "Banco Interviniente"; Code[30])
        {
            Caption = 'Banco Interviniente';
            ToolTip = 'Specifies the value of the Banco Interviniente field.';
            Enabled = false;
        }
        field(50011; "Producido en"; Code[100])
        {
            Caption = 'Producido en';
            ToolTip = 'Specifies the value of the Producido en field.';
            Enabled = false;
        }
        field(50012; "Puerto carga"; Code[10])
        {
            Caption = 'Puerto carga';
            ToolTip = 'Specifies the value of the Puerto carga field.';
        }
        field(50013; "Puerto destino"; Code[10])
        {
            Caption = 'Puerto destino';
            ToolTip = 'Specifies the value of the Puerto destino field.';
        }
        field(50014; "Cód. Contenedor"; Code[20])
        {
            Caption = 'Cód. Contenedor';
            ToolTip = 'Specifies the value of the Cód. Contenedor field.';
        }
        field(50015; "Precinto DGA"; Code[20])
        {
            Caption = 'Precinto DGA';
            ToolTip = 'Specifies the value of the Precinto DGA field.';
        }
        field(50016; Precinto; Code[20])
        {
            Caption = 'Precinto';
            ToolTip = 'Specifies the value of the Precinto field.';
        }
        field(50018; Aprobado; Boolean)
        {
            Caption = 'Aprobado';
            ToolTip = 'Specifies the value of the Aprobado field.';
        }
        field(50019; Usuario; Code[50])
        {
            Caption = 'User ID';
            ToolTip = 'Specifies the value of the User ID field.';
            TableRelation = User;
        }
        field(50020; "Importe sujeto retencion"; Decimal)
        {
            Caption = 'Importe sujeto retencion';
            ToolTip = 'Specifies the value of the Importe sujeto retencion field.';
        }
        field(50021; "Porcentaje de retencion"; Decimal)
        {
            Caption = 'Porcentaje de retencion';
            ToolTip = 'Specifies the value of the Porcentaje de retencion field.';
        }
        field(50022; "Importe sujeto reembolso"; Decimal)
        {
            Caption = 'Importe sujeto reembolso';
            ToolTip = 'Specifies the value of the Importe sujeto reembolso field.';
        }
        field(50023; "Porcentaje reembolso"; Decimal)
        {
            Caption = 'Porcentaje reembolso';
            ToolTip = 'Specifies the value of the Porcentaje reembolso field.';
        }
        field(50024; "Importe sujeto reintegro"; Decimal)
        {
            Caption = 'Importe sujeto reintegro';
            ToolTip = 'Specifies the value of the Importe sujeto reintegro field.';
        }
        field(50025; "% reintegro"; Decimal)
        {
            Caption = '% reintegro';
            ToolTip = 'Specifies the value of the % reintegro field.';
        }
        field(50026; Procesado; Boolean)
        {
            Caption = 'Procesado';
            ToolTip = 'Specifies the value of the Procesado field.';
        }
        field(50027; "Tipo de Contenedor"; Option)
        {
            Caption = 'Tipo de Contenedor';
            ToolTip = 'Specifies the value of the Tipo de Contenedor field.';
            OptionMembers = " ","20","40",BODEGA,CAMION,OTRO;
        }
        field(50029; "Transporte matrícula"; Code[10])
        {
            Caption = 'Transport registration';
            ToolTip = 'Specifies the value of the Transport registration field.';
        }
        field(50030; Temperatura; Decimal)
        {
            Caption = 'Temperature';
            ToolTip = 'Specifies the value of the Temperature field.';
        }
        field(50031; Hora; Time)
        {
            Caption = 'Time';
            ToolTip = 'Specifies the value of the Time field.';
        }
        field(50032; "Tipo de amparo sanitario"; Option)
        {
            Caption = 'Sanitary protection type';
            ToolTip = 'Specifies the value of the Sanitary protection type field.';
            BlankZero = true;
            OptionMembers = ,"P.T.","P.T.R.","C.S.E.P.","Guía de tránsito";
        }
        field(50033; "No. amparo sanitario"; Code[30])
        {
            Caption = 'Sanitary protection no.';
            ToolTip = 'Specifies the value of the Sanitary protection no field.';
        }
        field(50034; Destino; Code[30])
        {
            Caption = 'Destination';
            ToolTip = 'Specifies the value of the Destination field.';
        }
        field(50035; Conductor; Text[50])
        {
            Caption = 'Conductor';
            ToolTip = 'Specifies the value of the Conductor field.';
        }
        field(50036; Insumos; Decimal)
        {
            Caption = 'Insumos';
            ToolTip = 'Specifies the value of the Insumos field.';
            CalcFormula = Sum("Insumos fact proyecto".Insumos WHERE(Factura = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(50037; "Old Job No."; Code[20])
        {
            Caption = 'Job No.';
            ToolTip = 'Specifies the value of the Job No field.';
            TableRelation = Job;
        }
        field(50038; "Seguimiento para trazabilidad"; Option)
        {
            Caption = 'Seguimiento para trazabilidad';
            ToolTip = 'Specifies the value of the Seguimiento para trazabilidad field.';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Post-Expo - Controlar contra DCL","No controlar contra DCL","Pre-Expo - Controlar contra DCL";
        }
        field(50500; Observaciones; Text[30])
        {
            Caption = 'Observaciones';
            ToolTip = 'Specifies the value of the Observaciones field.';
        }
        field(50501; Estado; Text[50])
        {
            Caption = 'Estado';
            ToolTip = 'Specifies the value of the Estado field.';
            CalcFormula = Lookup(Mensajeria.Estado WHERE("No. documento" = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(50502; "Archivo vinculado"; Text[25])
        {
            Caption = 'Archivo vinculado';
            ToolTip = 'Specifies the value of the Archivo vinculado field.';
        }
        field(50595; "Tipo documento mensajeria"; Text[40])
        {
            Caption = 'Tipo documento mensajeria';
            ToolTip = 'Specifies the value of the Tipo documento mensajeria field.';
            CalcFormula = Lookup(Mensajeria."Tipo Documento" WHERE("No. documento" = FIELD("Pre-Assigned No.")));
            FieldClass = FlowField;
        }
        field(50596; "Estado mensajería"; Text[50])
        {
            Caption = 'Estado mensajería';
            ToolTip = 'Specifies the value of the Estado mensajería field.';
            CalcFormula = Lookup(Mensajeria.Estado WHERE("No. documento" = FIELD("Pre-Assigned No.")));
            FieldClass = FlowField;
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
        field(50702; Province; Code[10])
        {
            Caption = 'Province';
            ToolTip = 'Specifies the value of the Province field.';
            TableRelation = Area;
        }
        field(50703; "Tipo Fiscal"; Code[10])
        {
            Caption = 'Fiscal Type';
            ToolTip = 'Specifies the value of the Fiscal Type field.';
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('TIPO FISCAL'));
            ObsoleteTag = '12/2025';
            ObsoleteState = Pending;
            ObsoleteReason = 'Reemplazado por campo Grupo Registro IVA Negocio';
        }
        field(50704; "Punto Venta"; Code[10])
        {
            Caption = 'Punto Venta';
            ToolTip = 'Specifies the value of the Punto Venta field.';
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('PUNTO VENTA'));
        }
        field(50705; "Tipo Factura"; Option)
        {
            Caption = 'Tipo Factura';
            ToolTip = 'Specifies the value of the Tipo Factura field.';
            OptionMembers = Factura,"Nota Debito","Nota Crédito";
        }
        field(50706; "No. Factura"; Code[30])
        {
            Caption = 'No. Factura';
            ToolTip = 'Specifies the value of the No. Factura field.';
            TableRelation = "xCost Entry";
        }
        field(50707; "CAI-CAE"; Code[14])
        {
            Caption = 'CAI-CAE';
            ToolTip = 'Specifies the value of the CAI-CAE field.';
            DataClassification = ToBeClassified;
        }
        field(50708; "Tipo documento AFIP"; Code[3])
        {
            Caption = 'Tipo documento AFIP';
            ToolTip = 'Specifies the value of the Tipo documento AFIP field.';
            DataClassification = ToBeClassified;
        }
    }
}
