tableextension 50098 "Purch. Inv. Header Ext." extends "Purch. Inv. Header"
{
    Caption = 'Purch. Inv. Header';
    fields
    {
        modify("Buy-from Vendor No.")
        {
            Caption = 'Buy-from Vendor No.';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Pay-to Vendor No.")
        {
            Caption = 'Pay-to Vendor No.';
        }
        modify("Pay-to Address")
        {
            Caption = 'Pay-to Address';
        }
        modify("Pay-to Address 2")
        {
            Caption = 'Pay-to Address 2';
        }
        modify("Pay-to City")
        {
            Caption = 'Pay-to City';
        }
        modify("Pay-to Contact")
        {
            Caption = 'Pay-to Contact';
        }
        modify("Ship-to Code")
        {
            Caption = 'Ship-to Code';
        }
        modify("Ship-to Name")
        {
            Caption = 'Ship-to Name';
        }
        modify("Ship-to Name 2")
        {
            Caption = 'Ship-to Name 2';
        }
        modify("Ship-to Address")
        {
            Caption = 'Ship-to Address';
        }
        modify("Ship-to Address 2")
        {
            Caption = 'Ship-to Address 2';
        }
        modify("Ship-to City")
        {
            Caption = 'Ship-to City';
        }
        modify("Ship-to Contact")
        {
            Caption = 'Ship-to Contact';
        }
        modify("Expected Receipt Date")
        {
            Caption = 'Expected Receipt Date';
        }
        modify("Payment Terms Code")
        {
            Caption = 'Payment Terms Code';
        }
        modify("Shipment Method Code")
        {
            Caption = 'Shipment Method Code';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        modify("Shortcut Dimension 2 Code")
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("Invoice Disc. Code")
        {
            Caption = 'Invoice Disc. Code';
        }
        modify("Language Code")
        {
            Caption = 'Language Code';
        }
        modify("Purchaser Code")
        {
            Caption = 'Purchaser Code';
        }
        modify("Order No.")
        {
            Caption = 'Order No.';
        }
        modify("No. Printed")
        {
            Caption = 'No. Printed';
        }
        modify("Applies-to Doc. No.")
        {
            Caption = 'Applies-to Doc. No.';
        }

        //Unsupported feature: Property Modification (CalcFormula) on "Amount(Field 60)".


        //Unsupported feature: Property Modification (CalcFormula) on ""Amount Including VAT"(Field 61)".

        modify("Vendor Order No.")
        {
            Caption = 'Vendor Order No.';
        }
        modify("Vendor Invoice No.")
        {
            Caption = 'Vendor Invoice No.';
        }
        modify("VAT Registration No.")
        {
            Caption = 'VAT Registration No.';
        }
        modify("Sell-to Customer No.")
        {
            Caption = 'Sell-to Customer No.';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("Transaction Type")
        {
            Caption = 'Transaction Type';
        }
        modify("VAT Country/Region Code")
        {
            Caption = 'VAT Country/Region Code';
        }
        modify("Buy-from Address")
        {
            Caption = 'Buy-from Address';
        }
        modify("Buy-from Address 2")
        {
            Caption = 'Buy-from Address 2';
        }
        modify("Buy-from City")
        {
            Caption = 'Buy-from City';
        }
        modify("Pay-to Country/Region Code")
        {
            Caption = 'Pay-to Country/Region Code';
        }
        modify("Buy-from Country/Region Code")
        {
            Caption = 'Buy-from Country/Region Code';
        }
        modify("Ship-to Post Code")
        {
            Caption = 'Ship-to Post Code';
        }
        modify("Ship-to County")
        {
            Caption = 'Ship-to County';
        }
        modify("Ship-to Country/Region Code")
        {
            Caption = 'Ship-to Country/Region Code';
        }
        modify("Order Address Code")
        {
            Caption = 'Order Address Code';
        }
        modify(Correction)
        {
            Caption = 'Correction';
        }
        modify("Document Date")
        {
            Caption = 'Document Date';
        }
        modify("Area")
        {
            Caption = 'Area';
        }
        modify("Transaction Specification")
        {
            Caption = 'Transaction Specification';
        }
        modify("Payment Method Code")
        {
            Caption = 'Payment Method Code';
        }
        modify("Pre-Assigned No. Series")
        {
            Caption = 'Pre-Assigned No. Series';
        }
        modify("Order No. Series")
        {
            Caption = 'Order No. Series';
        }
        modify("Pre-Assigned No.")
        {
            Caption = 'Pre-Assigned No.';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("Tax Area Code")
        {
            Caption = 'Tax Area Code';
        }
        modify("Prepayment No. Series")
        {
            Caption = 'Prepayment No. Series';
        }
        modify("Prepayment Order No.")
        {
            Caption = 'Prepayment Order No.';
        }
        modify("Quote No.")
        {
            Caption = 'Quote No.';
        }
        modify("Creditor No.")
        {
            Caption = 'Creditor No.';
        }
        modify("Vendor Ledger Entry No.")
        {
            Caption = 'Vendor Ledger Entry No.';
        }
        modify("Campaign No.")
        {
            Caption = 'Campaign No.';
        }
        modify("Buy-from Contact No.")
        {
            Caption = 'Buy-from Contact No.';
        }
        modify("Pay-to Contact No.")
        {
            Caption = 'Pay-to Contact No.';
        }
        modify("Autoinvoice No.")
        {
            Caption = 'Autoinvoice No.';
        }
        modify("Special Scheme Code")
        {
            Caption = 'Special Scheme Code';
        }
        modify("Operation Description")
        {
            Caption = 'Operation Description';
        }
        modify("Operation Description 2")
        {
            Caption = 'Operation Description 2';
        }
        modify("Applies-to Bill No.")
        {
            Caption = 'Applies-to Bill No.';
        }
        modify("Vendor Bank Acc. Code")
        {
            Caption = 'Vendor Bank Acc. Code';
        }
        field(50000; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';

        }
        field(50001; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';

        }
        field(50002; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';

        }
        field(50003; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 6 Code';

        }
        field(50004; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 7 Code';

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
        field(50009; "Payment block"; Boolean)
        {
            Caption = 'Pago bloqueado';
            DataClassification = ToBeClassified;
        }
        field(50010; "Payment blocked by"; Code[10])
        {
            Caption = 'Pago bloqueado por';
            DataClassification = ToBeClassified;
            TableRelation = Seguridad.Grupo;
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
        field(50016; "Winnings retention code"; Code[10])
        {
            Caption = 'Cód. retención Ganancias';
            FieldClass = FlowFilter;
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER(Ganancias));
        }
        field(50017; "Documento aduanero SIM"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50037; "Old Job No."; Code[20])
        {
            Caption = 'Job No.';
            TableRelation = Job;
        }
        field(50093; "Importe provisión (DL)"; Decimal)
        {
            CalcFormula = - Sum("G/L Entry".Amount WHERE("Document No." = FIELD("No."),
                                                         "G/L Account No." = FILTER('2114003' | '2114004'),
                                                         "No. documento relacionado" = FILTER(<> '')));
            FieldClass = FlowField;
        }
        field(50305; "Fecha recepción fra."; Date)
        {
        }
        field(50500; "No. Remito"; Code[35])
        {
            CalcFormula = Lookup("Purch. Rcpt. Header"."Vendor Shipment No." WHERE("Buy-from Vendor No." = FIELD("Buy-from Vendor No."),
                                                                                    "No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(50503; "Archivo vinculado"; Text[250])
        {
            CalcFormula = Lookup("Documentos digitalizados".Archivo WHERE("Nivel 8" = FIELD("No.")));
            FieldClass = FlowField;

            trigger OnLookup()
            begin
                Clear(rstInfoEmpresa);
                rstInfoEmpresa.Get();
                if Exists("Archivo vinculado") then
                    HyperLink(rstInfoEmpresa."Ruta Intranet" + (ConvertStr(CopyStr("Archivo vinculado", 4, 250), '\', '/')))
                else begin

                    if Exists(rstInfoEmpresa."Ruta NavXtender" + (ConvertStr(CopyStr("Archivo vinculado", 4, 250), '\', '/'))) then
                        HyperLink(rstInfoEmpresa."Ruta NavXtender" + (ConvertStr(CopyStr("Archivo vinculado", 4, 250), '\', '/')))
                    else
                        HyperLink(rstInfoEmpresa."Ruta Intranet" + (ConvertStr(CopyStr("Archivo vinculado", 4, 250), '\', '/')))

                end;
            end;
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
        field(50507; "Fecha último seguimiento"; Date)
        {
            CalcFormula = Max("Seguimiento Documentos".Fecha WHERE("No. documento" = FIELD("No."),
                                                                    "Tipo Documento" = FIELD("Tipo documento mensajeria")));
            FieldClass = FlowField;
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
        field(50514; "AFIP currency code"; Code[10])
        {
            Caption = 'Currency Code';
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;
        }
        field(50594; "Current security group"; Code[40])
        {
            CalcFormula = Lookup(Mensajeria."Destinatario/Grupo" WHERE("No. documento" = FIELD("No.")));
            Caption = 'Grupo seguridad actual';
            FieldClass = FlowField;
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
        field(50702; "Tipo fiscal"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('TIPO FISCAL'));
            ObsoleteTag = '12/2025';
            ObsoleteState = Pending;
            ObsoleteReason = 'Reemplazado por campo Grupo Registro IVA Negocio';
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


    //Unsupported feature: Property Modification (TextConstString) on "CorrInvDoesNotExistErr(Variable 1100000)".

    //var
    //>>>> ORIGINAL VALUE:
    //CorrInvDoesNotExistErr : @@@="%1 = number of document";ENU="The Corrected Invoice No. does not exist. \Identification fields and values:\Corrected Invoice No. = %1.";ESP="El No. de factura corregida no existe. \Campos y valores identificativos:\No. factura corregida = %1.";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CorrInvDoesNotExistErr : @@@="%1 = number of document";ENU="The Corrected Invoice No. does not exist. \Identification fields and values:\Corrected Invoice No. = %1.";ESP="El No.de factura corregida no existe. \Campos y valores identificativos:\No.factura corregida = %1.";
    //Variable type has not been exported.

    var
        rstInfoEmpresa: Record "Company Information";
}

