tableextension 124 "Puch. Cr. Memo Header" extends "Purch. Cr. Memo Hdr." //OriginalId
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
            Caption = 'Shortcut Dimension 4 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';

        }
        field(50002; "Shortcut Dimension 5 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 5 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 5 Code field.';

        }
        field(50003; "Shortcut Dimension 6 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 6 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 6 Code field.';

        }
        field(50004; "Shortcut Dimension 7 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 7 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 7 Code field.';

        }
        field(50005; "Concepto proyecto"; Code[10])
        {
            Caption = 'Job concept';
            ToolTip = 'Specifies the value of the Job concept field.';
            TableRelation = "Concepto proyecto";
        }
        field(50006; "Fecha Embarque"; Date)
        {
            Caption = 'Fecha Embarque';
            ToolTip = 'Specifies the value of the Fecha Embarque field.';
        }
        field(50007; "Carpeta de Importación"; Code[20])
        {
            Caption = 'Carpeta de Importación';
            ToolTip = 'Specifies the value of the Carpeta de Importación field.';
        }
        field(50008; "Lugar de Pago"; Option)
        {
            Caption = 'Lugar de Pago';
            ToolTip = 'Specifies the value of the Lugar de Pago field.';
            OptionMembers = " ",BUE,CRV,PD,MDQ;
        }
        field(50011; Usuario; Code[50])
        {
            Caption = 'User ID';
            ToolTip = 'Specifies the value of the User ID field.';
        }
        field(50012; "Cód. confirmación compra prov."; Code[20])
        {
            Caption = 'Cód. confirmación compra prov.';
            ToolTip = 'Specifies the value of the Cód. confirmación compra prov field.';
        }
        field(50013; "No. Despacho Importación"; Code[30])
        {
            Caption = 'No. Despacho Importación';
            ToolTip = 'Specifies the value of the No. Despacho Importación field.';
        }
        field(50014; "Fecha Oficialización"; Date)
        {
            Caption = 'Fecha Oficialización';
            ToolTip = 'Specifies the value of the Fecha Oficialización field.';
        }
        field(50037; "Old Job No."; Code[20])
        {
            Caption = 'Job No.';
            ToolTip = 'Specifies the value of the Job No field.';
            TableRelation = Job;
        }
        field(50305; "Fecha recepción fra."; Date)
        {
            Caption = 'Fecha recepción fra.';
            ToolTip = 'Specifies the value of the Fecha recepción fra field.';
        }
        field(50503; "Archivo vinculado"; Text[250])
        {
            Caption = 'Archivo vinculado';
            ToolTip = 'Specifies the value of the Archivo vinculado field.';
            CalcFormula = Lookup("Documentos digitalizados".Archivo WHERE("Nivel 8" = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(50504; "Departamento de pago"; Code[10])
        {
            Caption = 'Departamento de pago';
            ToolTip = 'Specifies the value of the Departamento de pago field.';
            TableRelation = Seguridad;
        }
        field(50505; "CAI-CAE"; Code[14])
        {
            Caption = 'CAI-CAE';
            ToolTip = 'Specifies the value of the CAI-CAE field.';
        }
        field(50506; "Tipo documento AFIP"; Code[3])
        {
            Caption = 'Tipo documento AFIP';
            ToolTip = 'Specifies the value of the Tipo documento AFIP field.';
        }
        field(50510; "Solicitud vinculada"; Code[30])
        {
            Caption = 'Solicitud vinculada';
            ToolTip = 'Specifies the value of the Solicitud vinculada field.';
            DataClassification = ToBeClassified;
            TableRelation = Solicitud."No. documento" WHERE("Currency Code" = FIELD("Currency Code"),
                                                             Estado = FILTER(<> 'Abierto' | <> 'A aprobar' | <> 'Aprobado' | <> 'Rechazado' | <> 'Anulado'),
                                                             "Tipo documento" = FILTER('Solicitud abierta (compras)'));
        }
        field(50511; "Importe segun solicitud"; Decimal)
        {
            Caption = 'Importe segun solicitud';
            ToolTip = 'Specifies the value of the Importe segun solicitud field.';
            CalcFormula = Sum("Lín. solicitud"."Importe neto" WHERE("No. Documento" = FIELD("Solicitud vinculada"),
                                                                     Revertido = CONST(false),
                                                                     Aprobado = CONST(true)));
            FieldClass = FlowField;
        }
        field(50514; "AFIP currency code"; Code[10])
        {
            Caption = 'Currency Code';
            ToolTip = 'Specifies the value of the Currency Code field.';
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;
        }
        field(50595; "Tipo documento mensajeria"; Text[40])
        {
            Caption = 'Tipo documento mensajeria';
            ToolTip = 'Specifies the value of the Tipo documento mensajeria field.';
            CalcFormula = Lookup(Mensajeria."Tipo Documento" WHERE("No. documento" = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(50596; Estado; Text[50])
        {
            Caption = 'Estado';
            ToolTip = 'Specifies the value of the Estado field.';
            CalcFormula = Lookup(Mensajeria.Estado WHERE("No. documento" = FIELD("No.")));
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
        field(50702; "Tipo Fiscal"; Code[20])
        {
            Caption = 'Fiscal Type';
            ToolTip = 'Specifies the value of the Fiscal Type field.';
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('TIPO FISCAL'));
            ObsoleteTag = '12/2025';
            ObsoleteState = Pending;
            ObsoleteReason = 'Reemplazado por campo Grupo Registro IVA Negocio';
        }
        field(50703; Province; Code[20])
        {
            Caption = 'Province';
            ToolTip = 'Specifies the value of the Province field.';
            TableRelation = Area;
        }
        field(50704; "Tipo factura"; Option)
        {
            Caption = 'Tipo factura';
            ToolTip = 'Specifies the value of the Tipo factura field.';
            OptionMembers = Factura,"Nota Débito";
        }
    }
}