tableextension 124 "Puch. Cr. Memo Header" extends "Purch. Cr. Memo Hdr." //OriginalId
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
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
        }
        field(50002; "Shortcut Dimension 5 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));
        }
        field(50003; "Shortcut Dimension 6 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 6 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));
        }
        field(50004; "Shortcut Dimension 7 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 7 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));
        }
        field(50005; "Concepto proyecto"; Code[10])
        {
            TableRelation = "Concepto proyecto";
        }
        field(50006; "Fecha Embarque"; Date)
        {
        }
        field(50007; "Carpeta de Importación"; Code[20])
        {
        }
        field(50008; "Lugar de Pago"; Option)
        {
            OptionMembers = " ",BUE,CRV,PD,MDQ;
        }
        field(50011; Usuario; Code[20])
        {
        }
        field(50012; "Cód. confirmación compra prov."; Code[20])
        {
        }
        field(50013; "No. Despacho Importación"; Code[30])
        {
        }
        field(50014; "Fecha Oficialización"; Date)
        {
        }
        field(50037; "Old Job No."; Code[20])
        {
            Caption = 'Job No.';
            TableRelation = Job;
        }
        field(50305; "Fecha recepción fra."; Date)
        {
        }
        field(50503; "Archivo vinculado"; Text[250])
        {
            CalcFormula = Lookup("Documentos digitalizados".Archivo WHERE("Nivel 8" = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(50504; "Departamento de pago"; Code[10])
        {
            TableRelation = Seguridad;
        }
        field(50505; "CAI-CAE"; Code[14])
        {
        }
        field(50506; "Tipo documento AFIP"; Code[3])
        {
        }
        field(50510; "Solicitud vinculada"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Solicitud."No. documento" WHERE("Currency Code" = FIELD("Currency Code"),
                                                             Estado = FILTER(<> 'Abierto' | <> 'A aprobar' | <> 'Aprobado' | <> 'Rechazado' | <> 'Anulado'),
                                                             "Tipo documento" = FILTER('Solicitud abierta (compras)'));
        }
        field(50511; "Importe segun solicitud"; Decimal)
        {
            CalcFormula = Sum("Lín. solicitud"."Importe neto" WHERE("No. Documento" = FIELD("Solicitud vinculada"),
                                                                     Revertido = CONST(false),
                                                                     Aprobado = CONST(true)));
            FieldClass = FlowField;
        }
        field(50514; "AFIP currency code"; Code[10])
        {
            Caption = 'Currency Code';
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;
        }
        field(50595; "Tipo documento mensajeria"; Text[40])
        {
            CalcFormula = Lookup(Mensajeria."Tipo Documento" WHERE("No. documento" = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(50596; Estado; Text[50])
        {
            CalcFormula = Lookup(Mensajeria.Estado WHERE("No. documento" = FIELD("No.")));
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
        field(50702; "Tipo Fiscal"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('TIPO FISCAL'));
        }
        field(50703; Province; Code[20])
        {
            TableRelation = Area;
        }
        field(50704; "Tipo factura"; Option)
        {
            OptionMembers = Factura,"Nota Débito";
        }
    }
}