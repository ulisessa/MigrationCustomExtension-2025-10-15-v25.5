tableextension 50074 tableextension50074 extends "Sales Invoice Header"
{
    Caption = 'Sales Invoice Header';
    fields
    {
        modify("Sell-to Customer No.")
        {
            Caption = 'Sell-to Customer No.';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Bill-to Customer No.")
        {
            Caption = 'Bill-to Customer No.';
        }
        modify("Bill-to Address")
        {
            Caption = 'Bill-to Address';
        }
        modify("Bill-to Address 2")
        {
            Caption = 'Bill-to Address 2';
        }
        modify("Bill-to City")
        {
            Caption = 'Bill-to City';
        }
        modify("Bill-to Contact")
        {
            Caption = 'Bill-to Contact';
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
        modify("Shipment Date")
        {
            Caption = 'Shipment Date';
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
        modify("Salesperson Code")
        {
            Caption = 'Salesperson Code';
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
        modify("VAT Registration No.")
        {
            Caption = 'VAT Registration No.';
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
        modify("Sell-to Address")
        {
            Caption = 'Sell-to Address';
        }
        modify("Sell-to Address 2")
        {
            Caption = 'Sell-to Address 2';
        }
        modify("Sell-to City")
        {
            Caption = 'Sell-to City';
        }
        modify("Sell-to Contact")
        {
            Caption = 'Sell-to Contact';
        }
        modify("Bill-to Country/Region Code")
        {
            Caption = 'Bill-to Country/Region Code';
        }
        modify("Sell-to Country/Region Code")
        {
            Caption = 'Sell-to Country/Region Code';
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
        modify("Exit Point")
        {
            Caption = 'Exit Point';
        }
        modify(Correction)
        {
            Caption = 'Correction';
        }
        modify("Document Date")
        {
            Caption = 'Document Date';
        }
        modify("External Document No.")
        {
            Caption = 'External Document No.';
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
        modify("Shipping Agent Code")
        {
            Caption = 'Shipping Agent Code';
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
        modify("Invoice Discount Calculation")
        {
            Caption = 'Invoice Discount Calculation';
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
        modify("Sell-to Phone No.")
        {
            Caption = 'Sell-to Phone No.';
        }
        modify("Sell-to E-Mail")
        {
            Caption = 'Email';
        }
        modify("Work Description")
        {
            Caption = 'Work Description';
        }
        modify("Direct Debit Mandate ID")
        {
            Caption = 'Direct Debit Mandate ID';
        }
        modify("Cust. Ledger Entry No.")
        {
            Caption = 'Cust. Ledger Entry No.';
        }
        modify("Campaign No.")
        {
            Caption = 'Campaign No.';
        }
        modify("Sell-to Contact No.")
        {
            Caption = 'Sell-to Contact No.';
        }
        modify("Bill-to Contact No.")
        {
            Caption = 'Bill-to Contact No.';
        }
        modify("Opportunity No.")
        {
            Caption = 'Opportunity No.';
        }
        modify("Allow Line Disc.")
        {
            Caption = 'Allow Line Disc.';
        }
        modify("Get Shipment Used")
        {
            Caption = 'Get Shipment Used';
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
        modify("SII First Summary Doc. No.")
        {
            Caption = 'First Summary Doc. No.';
        }
        modify("SII Last Summary Doc. No.")
        {
            Caption = 'Last Summary Doc. No.';
        }
        modify("Applies-to Bill No.")
        {
            Caption = 'Applies-to Bill No.';
        }
        modify("Cust. Bank Acc. Code")
        {
            Caption = 'Cust. Bank Acc. Code';
        }
        field(50000; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(50001; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
        }
        field(50002; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));
        }
        field(50003; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));
        }
        field(50004; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));
        }
        field(50005; "No. certificación"; Code[1])
        {
            Editable = false;
        }
        field(50006; "Orden Encargo"; Code[1])
        {
        }
        field(50007; "Carpeta de Exportación"; Text[10])
        {

            trigger OnValidate()
            begin
                //testfield(strlen("Carpeta de exportación") = 10);
            end;
        }
        field(50008; "Permiso de embarque"; Code[30])
        {

            trigger OnValidate()
            begin
                //testfield(strlen("Permiso de embarque") = 11);
            end;
        }
        field(50009; Marcas; Code[20])
        {

            trigger OnValidate()
            begin
                //testfield(strlen("Marcas") = 20);
            end;
        }
        field(50010; "Banco Interviniente"; Code[30])
        {
            Enabled = false;

            trigger OnLookup()
            begin
                Clear(PunFBanco);
                PunFBanco.LookupMode := true;
                PunFBanco.SetTableView(PunBanco);
                if PunFBanco.RunModal = ACTION::LookupOK then begin
                    PunFBanco.GetRecord(PunBanco);
                    "Banco Interviniente" := PunBanco.Name;
                end;
            end;
        }
        field(50011; "Producido en"; Code[1])
        {
            Enabled = false;
        }
        field(50012; "Puerto carga"; Code[10])
        {
            TableRelation = "Entry/Exit Point";
        }
        field(50013; "Puerto destino"; Code[10])
        {
            TableRelation = "Entry/Exit Point";
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
        field(50033; "No. amparo sanitario"; Code[10])
        {
        }
        field(50034; Destino; Code[10])
        {
        }
        field(50035; Conductor; Text[20])
        {
        }
        field(50036; Insumos; Decimal)
        {
            CalcFormula = Sum("Insumos fact proyecto".Insumos WHERE(Factura = FIELD("Pre-Assigned No.")));
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
        field(50100; "Tipo factura Arbu"; Option)
        {
            OptionMembers = Factura,"Nota Debito";
        }
        field(50500; Observaciones; Text[30])
        {
        }
        field(50501; Estado; Text[50])
        {
            CalcFormula = Lookup(Mensajeria.Estado WHERE("No. documento" = FIELD("Pre-Assigned No.")));
            FieldClass = FlowField;
        }
        field(50502; "Archivo vinculado"; Text[25])
        {

            trigger OnLookup()
            begin
                Clear(rstInfoEmpresa);
                rstInfoEmpresa.Get();
                HyperLink(rstInfoEmpresa."Ruta Intranet" + (ConvertStr(CopyStr("Archivo vinculado", 4, 250), '\', '/')));
            end;
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
        field(50702; Province; Code[10])
        {
        }
        field(50703; "Tipo fiscal"; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('TIPO FISCAL'));
        }
        field(50704; "Punto Venta"; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('PUNTO VENTA'));
        }
        field(50705; "Tipo Factura"; Option)
        {
            OptionMembers = Factura,"Nota Debito";
        }
        field(50706; "No. remito"; Code[30])
        {
        }
        field(50707; "CAI-CAE"; Code[14])
        {
        }
        field(50708; "Tipo documento AFIP"; Code[3])
        {
        }
    }


    //Unsupported feature: Code Modification on "SendRecords(PROCEDURE 12)".

    //procedure SendRecords();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DocumentTypeTxt := ReportDistributionMgt.GetFullDocumentTypeText(Rec);

    IsHandled := false;
    OnBeforeSendRecords(DummyReportSelections,Rec,DocumentTypeTxt,IsHandled);
    if not IsHandled then
      DocumentSendingProfile.SendCustomerRecords(
        DummyReportSelections.Usage::"S.Invoice",Rec,DocumentTypeTxt,"Bill-to Customer No.","No.",
        FieldNo("Bill-to Customer No."),FieldNo("No."));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //DocumentTypeTxt := ReportDistributionMgt.GetFullDocumentTypeText(Rec);
    #2..8
    */
    //end;


    //Unsupported feature: Code Modification on "SendProfile(PROCEDURE 72)".

    //procedure SendProfile();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DocumentTypeTxt := ReportDistributionMgt.GetFullDocumentTypeText(Rec);

    IsHandled := false;
    OnBeforeSendProfile(DummyReportSelections,Rec,DocumentTypeTxt,IsHandled,DocumentSendingProfile);
    if not IsHandled then
      DocumentSendingProfile.Send(
        DummyReportSelections.Usage::"S.Invoice",Rec,"No.","Bill-to Customer No.",
        DocumentTypeTxt,FieldNo("Bill-to Customer No."),FieldNo("No."));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //DocumentTypeTxt := ReportDistributionMgt.GetFullDocumentTypeText(Rec);
    #2..8
    */
    //end;


    //Unsupported feature: Code Modification on "EmailRecords(PROCEDURE 17)".

    //procedure EmailRecords();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DocumentTypeTxt := ReportDistributionMgt.GetFullDocumentTypeText(Rec);

    IsHandled := false;
    OnBeforeEmailRecords(DummyReportSelections,Rec,DocumentTypeTxt,ShowDialog,IsHandled);
    if not IsHandled then
      DocumentSendingProfile.TrySendToEMail(
        DummyReportSelections.Usage::"S.Invoice",Rec,FieldNo("No."),DocumentTypeTxt,
        FieldNo("Bill-to Customer No."),ShowDialog);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //sDocumentTypeTxt := ReportDistributionMgt.GetFullDocumentTypeText(Rec);
    #2..8
    */
    //end;


    //Unsupported feature: Code Modification on "GetDocTypeTxt(PROCEDURE 140)".

    //procedure GetDocTypeTxt();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    exit(ReportDistributionMgt.GetFullDocumentTypeText(Rec));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //EXIT(ReportDistributionMgt.GetFullDocumentTypeText(Rec));
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "CorrInvDoesNotExistErr(Variable 1100000)".

    //var
    //>>>> ORIGINAL VALUE:
    //CorrInvDoesNotExistErr : @@@="%1 = number of document";ENU="The Corrected Invoice No. does not exist. \Identification fields and values:\Corrected Invoice No. = %1.";ESP="El No. de factura corregida no existe. \Campos y valores identificativos:\No. factura corregida = %1.";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CorrInvDoesNotExistErr : @@@="%1 = number of document";ENU="The Corrected Invoice No. does not exist. \Identification fields and values:\Corrected Invoice No. = %1.";ESP="El No.de factura corregida no existe. \Campos y valores identificativos:\No.factura corregida = %1.";
    //Variable type has not been exported.

    var
        PunFBanco: Page "Bank Account List";
        PunBanco: Record "Bank Account";
        PunFPuerto: Page "Entry/Exit Points";
        PunPuerto: Record "Entry/Exit Point";
        rstInfoEmpresa: Record "Company Information";
}

