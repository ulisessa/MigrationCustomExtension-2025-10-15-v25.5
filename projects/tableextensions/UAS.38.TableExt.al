tableextension 38 "ExtensionName" extends "Purchase Header" //OriginalId
{
    fields
    {
        field(50000; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                //++Arbu
                //IF "Shortcut Dimension 3 Code" <> xRec."Shortcut Dimension 3 Code" THEN
                //UpdatePurchLines(FIELDCAPTION("Shortcut Dimension 3 Code"));
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
                //++Arbu
            end;
        }
        field(50001; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));

            trigger OnValidate()
            begin
                //++Arbu
                //IF "Shortcut Dimension 4 Code" <> xRec."Shortcut Dimension 4 Code" THEN
                //UpdatePurchLines(FIELDCAPTION("Shortcut Dimension 4 Code"));
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
                //++Arbu
            end;
        }
        field(50002; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));

            trigger OnValidate()
            begin
                //++Arbu
                //IF "Shortcut Dimension 5 Code" <> xRec."Shortcut Dimension 5 Code" THEN
                //UpdatePurchLines(FIELDCAPTION("Shortcut Dimension 5 Code"));
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
                //++Arbu
            end;
        }
        field(50003; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));

            trigger OnValidate()
            begin
                //++Arbu
                //IF "Shortcut Dimension 6 Code" <> xRec."Shortcut Dimension 6 Code" THEN
                //UpdatePurchLines(FIELDCAPTION("Shortcut Dimension 6 Code"));
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
                //++Arbu
            end;
        }
        field(50004; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));

            trigger OnValidate()
            begin
                //++Arbu
                //IF "Shortcut Dimension 7 Code" <> xRec."Shortcut Dimension 7 Code" THEN
                //UpdatePurchLines(FIELDCAPTION("Shortcut Dimension 7 Code"));
                ValidateShortcutDimCode(7, "Shortcut Dimension 7 Code");
                //++Arbu
            end;
        }
        field(50005; "Concepto proyecto"; Code[10])
        {
            Caption = 'Concepto proyecto compra';
            TableRelation = "Concepto proyecto";

            trigger OnValidate()
            begin
                UpdatePurchLines(FieldName("Concepto proyecto"), true);
            end;
        }
        field(50006; "Fecha Embarque"; Date)
        {

            trigger OnValidate()
            var
                rstSeguridadUsuario: Record "Seguridad por usuario";
            begin
                //IBdos Argentina - USS - 240603 - Inicio Modificación Arbumasa
                //Sólo puede modificar un usuario del mismo grupo de seguridad

                if "Document Type" = "Document Type"::Order then begin

                    if not rstSeguridadUsuario.fntSeguridadComparada(UserId, Usuario) then
                        Error('Usted no está habilitado para modificar este Pedido');

                end;

                //IBdos Argentina - USS - 240603 - Fin Modificación Arbumasa
            end;
        }
        field(50007; "Carpeta de Importación"; Code[20])
        {
            TableRelation = "Carpeta por OC" WHERE("No. documento" = FIELD("No."));
            ValidateTableRelation = false;

        }
        field(50008; "Lugar de Pago"; Option)
        {
            OptionMembers = " ",BUE,CRV,PD,MDQ;

        }
        field(50009; "Payment block"; Boolean)
        {
            Caption = 'Pago bloqueado';
            DataClassification = ToBeClassified;

        }
        field(50010; "Payment blocked by"; Code[10])
        {
            Caption = 'Pago bloqueado por';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Seguridad.Grupo;
        }
        field(50011; Usuario; Code[20])
        {
            TableRelation = "User Setup";

        }
        field(50013; "No. Despacho Importación"; Code[30])
        {

        }
        field(50014; "Officialization date"; Date)
        {
            Caption = 'Fecha oficialización';
        }
        field(50015; "GI withholding code"; Code[10])
        {
            Caption = 'GI retention code';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER("Ingresos Brutos"));

        }
        field(50016; "Winnings withholding code"; Code[10])
        {
            Caption = 'Cód. retención Ganancias';
            FieldClass = FlowFilter;
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER(Ganancias));
        }
        field(50017; "Documento aduanero SIM"; Code[30])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                PunPermisos: Record "Permisos Embarque";
            begin
                PunPermisos."Permiso embarque" := "Documento aduanero SIM";
                IF NOT PunPermisos.INSERT THEN
                    PunPermisos.MODIFY;
            end;
        }
        field(50500; "Aprobada p/ Sector Solicitante"; Boolean)
        {

        }
        field(50501; "Autorizada p/ Gerencia"; Boolean)
        {

        }
        field(50502; "Lleva remitos"; Boolean)
        {
        }
        field(50503; "Archivo vinculado"; Text[250])
        {
            CalcFormula = Lookup("Documentos digitalizados".Archivo WHERE("Nivel 8" = FIELD("No."),
                                                                           "Nivel 4" = FIELD("Buy-from Vendor No.")));
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

            trigger OnLookup()
            var
                l_rstGLS: Record "General Ledger Setup";
                l_rstDV: Record "Dimension Value";
                l_pgeDV: Page "Dimension Values";
            begin
                //++Arbu 2021
                Clear(l_rstGLS);
                l_rstGLS.Get();
                l_rstGLS.TestField("AFIP Doc Type Dimension");
                Clear(l_rstDV);
                l_rstDV.SetRange("Dimension Code", l_rstGLS."AFIP Doc Type Dimension");
                if "Tipo documento AFIP" <> '' then
                    l_rstDV.SetRange(Code, "Tipo documento AFIP");

                Clear(l_pgeDV);
                l_pgeDV.SetTableView(l_rstDV);
                l_pgeDV.LookupMode(true);
                if l_pgeDV.RunModal = ACTION::LookupOK then begin

                    l_pgeDV.GetRecord(l_rstDV);
                    "Tipo documento AFIP" := l_rstDV.Code;

                end;
                //--Arbu 2021
            end;
        }
        field(50507; "Completely Invoiced"; Boolean)
        {
            CalcFormula = Min("Purchase Line"."Completely Invoiced" WHERE("Document Type" = FIELD("Document Type"),
                                                                           "Document No." = FIELD("No."),
                                                                           Type = FILTER(<> " "),
                                                                           "Location Code" = FIELD("Location Filter")));
            Caption = 'Completely Invoiced';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50508; "Actividad AFIP"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Actividad proveedor"."No. actividad" WHERE("No. proveedor" = FIELD("Buy-from Vendor No."));

            trigger OnValidate()
            begin
                UpdatePurchLines(FieldCaption("Actividad AFIP"), true);
            end;
        }
        field(50510; "Solicitud vinculada"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Solicitud."No. documento" WHERE("Currency Code" = FIELD("Currency Code"),
                                                             Estado = FILTER(<> 'Abierto' | <> 'A aprobar' | <> 'Aprobado' | <> 'Rechazado' | <> 'Anulado'),
                                                             "Tipo documento" = FILTER('Solicitud abierta (compras)'));

            trigger OnValidate()
            begin
                CalcFields("Importe segun solicitud");
            end;
        }
        field(50511; "Importe segun solicitud"; Decimal)
        {
            CalcFormula = Sum("Lín. solicitud"."Importe neto" WHERE("No. Documento" = FIELD("Solicitud vinculada"),
                                                                     Revertido = CONST(false),
                                                                     Aprobado = CONST(true)));
            FieldClass = FlowField;
        }
        field(50512; "Divisa solicitud"; Code[10])
        {
            CalcFormula = Lookup(Solicitud."Currency Code" WHERE("No. documento" = FIELD("Solicitud vinculada")));
            FieldClass = FlowField;
        }
        field(50513; "Importe en OC"; Decimal)
        {
            CalcFormula = Sum("Purchase Line".Amount WHERE("Document Type" = FIELD("Document Type"),
                                                            "Document No." = FIELD("No."),
                                                            "No. Cab. Solicitud" = FIELD("Solicitud vinculada")));
            FieldClass = FlowField;
        }
        field(50514; "AFIP currency code"; Code[10])
        {
            Caption = 'Currency Code';
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;
        }
        field(50594; "Current security group"; Code[10])
        {
            Caption = 'Grupo seguridad actual';
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
        field(50597; "Fecha ultimo seguimiento"; Date)
        {
            CalcFormula = Max("Seguimiento Documentos".Fecha WHERE("No. documento" = FIELD("No."),
                                                                    "Tipo Documento" = Field("Tipo documento mensajeria")));
            FieldClass = FlowField;
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
    procedure fntVendDoc(l_strDoc: Option " ",Remito,Factura,"Débito","Crédito",Recibo,"Factura pronto vencimiento","Déb.Vto.")
    begin
        g_strDoc := l_strDoc;
    end;

    procedure ValidateCompanyandVendorStatus(l_codVendor: Code[10])
    var
        l_rstVendor: Record Vendor;
        rstP: Record "Purchases & Payables Setup";
        rstGLS: Record "General Ledger Setup";
        rstCI: Record "Company Information";
    begin
        Clear(rstP);
        rstP.Get();
        Clear(rstCI);
        rstCI.Get();
        Clear(l_rstVendor);
        l_rstVendor.Get(l_codVendor);
        if (rstP."Grupo Contable Importaciones" <> l_rstVendor."Vendor Posting Group") and not (rstCI."Omitir controles impositivos") then begin

            if l_rstVendor."Fecha Consulta" <> 0D then begin

                if (CalcDate('+30D', l_rstVendor."Fecha Consulta") < (Today)) then
                    Error('Debe digitalizar una nueva consulta de inscripción para realizar esta operación y contrastar la información de la ficha del proveedor. La actual tiene fecha ' + Format(l_rstVendor."Fecha Consulta"));

            end
            else
                Error('Debe digitalizar una nueva consulta de inscripción para realizar esta operación y contrastar la información de la ficha del proveedor.');

            Clear(rstGLS);
            rstGLS.Get;
            if rstGLS."Last apochryphal update" <> 0D then begin

                if (CalcDate('+30D', rstGLS."Last apochryphal update") < (Today)) then
                    Error('Debe realizar la consulta de facturas apócrifas. La actual tiene fecha ' + Format(rstGLS."Last apochryphal update"));

            end
            else
                Error('Debe realizar la consulta de facturas apócrifas.');

        end;
    end;

    local procedure fntAplicadoADocInterno(l_rst25: Record "Vendor Ledger Entry"): Boolean
    var
        rst50519: Record "Tipos documento";
        rstMens: Record Mensajeria;
        rstVLE: Record "Vendor Ledger Entry";
    begin
        if l_rst25."Document Type" in [l_rst25."Document Type"::Invoice, l_rst25."Document Type"::"Credit Memo"] then begin

            if l_rst25."Closed by Entry No." <> 0 then begin

                Clear(rstVLE);
                rstVLE.Get(l_rst25."Closed by Entry No.");
                Clear(rstMens);
                rstMens.SetRange("No. documento", rstVLE."Document No.");
                if rstMens.FindFirst then begin

                    //IF rstMens."Tipo Documento" IN['Nota crédito interna (compras)','Factura interna (compras)'] THEN
                    //CurrReport.SKIP;
                    Clear(rst50519);
                    rst50519.SetRange("Tipos documento", rstMens."Tipo Documento");
                    rst50519.FindFirst;
                    //IF rstMens."Tipo Documento" IN['Nota crédito interna (compras)','Factura interna (compras)'] THEN
                    if rst50519."Documento interno" then
                        exit(true);

                end;

            end;

        end;

        if l_rst25."Document Type" in [l_rst25."Document Type"::Invoice, l_rst25."Document Type"::"Credit Memo"] then begin

            Clear(rstVLE);
            rstVLE.SetRange("Closed by Entry No.", l_rst25."Entry No.");
            if rstVLE.FindSet then begin

                Clear(rstMens);
                rstMens.SetRange("No. documento", rstVLE."Document No.");
                if rstMens.FindFirst then begin

                    //IF rstMens."Tipo Documento" IN['Nota crédito interna (compras)','Factura interna (compras)'] THEN
                    //CurrReport.SKIP;
                    Clear(rst50519);
                    rst50519.SetRange("Tipos documento", rstMens."Tipo Documento");
                    rst50519.FindFirst;
                    //IF rstMens."Tipo Documento" IN['Nota crédito interna (compras)','Factura interna (compras)'] THEN
                    if rst50519."Documento interno" then
                        exit(true);
                    ;

                end;

            end;

        end;

        Clear(rstMens);
        rstMens.SetRange("No. documento", l_rst25."Document No.");
        if rstMens.FindFirst then begin

            Clear(rst50519);
            rst50519.SetRange("Tipos documento", rstMens."Tipo Documento");
            rst50519.FindFirst;
            //IF rstMens."Tipo Documento" IN['Nota crédito interna (compras)','Factura interna (compras)'] THEN
            if rst50519."Documento interno" then
                exit(true);

        end;

        exit(false);
    end;

    var
        rstSeguridadUsuario: Record "Seguridad por usuario";
        LinCompra: Record "Purchase Line";
        rstImpoporOC: Record "Carpeta por OC";
        frmImpoporOC: Page "Lista Carpetas Impo por OC";
        rstCarpImpo: Record "Dimension Value";
        rstConfCompras: Record "Purchases & Payables Setup";
        rstSeguridad: Record Seguridad;
        ConfUsu: Record "User Setup";
        CodeMens: Codeunit "Mensajería";
        PunMensajeria: Record Mensajeria;
        rstInfoempresa: Record "Company Information";
        rstMsj: Record Mensajeria;
        g_strDoc: Option " ",Remito,Factura,"Débito","Crédito",Recibo,"Factura pronto vencimiento","Déb.Vto.";
}