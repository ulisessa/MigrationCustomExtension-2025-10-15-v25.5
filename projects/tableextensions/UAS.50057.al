tableextension 50057 "Sales Shipment Header Ext." extends "Sales Shipment Header"
{
    Caption = 'Sales Shipment Header';
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
        modify("Order No. Series")
        {
            Caption = 'Order No. Series';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("Tax Area Code")
        {
            Caption = 'Tax Area Code';
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
        modify("Shipping Time")
        {
            Caption = 'Shipping Time';
        }
        modify("Shipping Agent Service Code")
        {
            Caption = 'Shipping Agent Service Code';
        }
        modify("Allow Line Disc.")
        {
            Caption = 'Allow Line Disc.';
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
            ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';

        }
        field(50001; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';

        }
        field(50002; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';

        }
        field(50003; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';

        }
        field(50004; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';

        }
        field(50005; "No. certificación"; Code[10])
        {
            Caption = 'No. certificación';
            ToolTip = 'Specifies the value of the No. certificación field.';
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

            trigger OnValidate()
            begin
                //testfield(strlen("Carpeta de exportación") = 10);
            end;
        }
        field(50008; "Permiso de embarque"; Code[30])
        {
            Caption = 'Boarding permission';
            ToolTip = 'Specifies the value of the Boarding permission field.';
            TableRelation = "Permisos Embarque";
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                //IBdos Argentina - USS - 151102 - Inicio Modificación Arbumasa
                //Comento el código y lo hago por propiedad, agregando el campo a la clave principal
                /*//IBdos Argentina - USS - 141102 - Inicio Modificación Arbumasa
                //Agrego lookup al Permiso de embarque
                
                CLEAR(FHisCabRem);
                PunHisCabRem.SETRANGE(PunHisCabRem.Facturado,FALSE);
                PunHisCabRem.SETFILTER(PunHisCabRem."Permiso de embarque",'<>""');
                FHisCabRem.LOOKUPMODE := TRUE;
                FHisCabRem.SETTABLEVIEW(PunHisCabRem);
                IF FHisCabRem.RUNMODAL = ACTION::LookupOK THEN
                BEGIN
                  FHisCabRem.GETRECORD(PunHisCabRem);
                  "Permiso de embarque" := PunHisCabRem."Permiso de embarque";
                END;
                
                //IBdos Argentina - USS - 141102 - Fin Modificación Arbumasa*/
                //IBdos Argentina - USS - 151102 - Fin Modificación Arbumasa

            end;
        }
        field(50009; Marcas; Code[20])
        {
            Caption = 'Marcas';
            ToolTip = 'Specifies the value of the Marcas field.';

            trigger OnValidate()
            begin
                //testfield(strlen("Marcas") = 20);
            end;
        }
        field(50010; "Banco Interviniente"; Code[30])
        {
            Caption = 'Banco Interviniente';
            ToolTip = 'Specifies the value of the Banco Interviniente field.';
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
            TableRelation = "Entry/Exit Point";

            trigger OnLookup()
            begin
                Clear(PunFPuerto);
                PunFPuerto.LookupMode := true;
                PunFPuerto.SetTableView(PunPuerto);
                if PunFPuerto.RunModal = ACTION::LookupOK then begin
                    PunFPuerto.GetRecord(PunPuerto);
                    "Puerto carga" := PunPuerto.Description;
                end;
            end;
        }
        field(50013; "Puerto destino"; Code[10])
        {
            Caption = 'Puerto destino';
            ToolTip = 'Specifies the value of the Puerto destino field.';
            TableRelation = "Entry/Exit Point";
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
        field(50017; Facturado; Boolean)
        {
            Caption = 'Facturado';
            ToolTip = 'Specifies the value of the Facturado field.';
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

            trigger OnLookup()
            begin
                Clear(rstInfoEmpresa);
                rstInfoEmpresa.Get();
                HyperLink(rstInfoEmpresa."Ruta Intranet" + (ConvertStr(CopyStr("Archivo vinculado", 4, 250), '\', '/')));
            end;
        }
        field(50595; "Tipo documento mensajeria"; Text[40])
        {
            Caption = 'Tipo documento mensajeria';
            ToolTip = 'Specifies the value of the Tipo documento mensajeria field.';
            CalcFormula = Lookup(Mensajeria."Tipo Documento" WHERE("No. documento" = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(50596; "Estado mensajería"; Text[50])
        {
            Caption = 'Estado mensajería';
            ToolTip = 'Specifies the value of the Estado mensajería field.';
            CalcFormula = Lookup(Mensajeria.Estado WHERE("No. documento" = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(50597; "Fecha anulación"; Date)
        {
            Caption = 'Fecha anulación';
            ToolTip = 'Specifies the value of the Fecha anulación field.';
        }
        field(50598; "Usuario Anulación"; Code[20])
        {
            Caption = 'Usuario Anulación';
            ToolTip = 'Specifies the value of the Usuario Anulación field.';
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
            OptionMembers = Factura,"Nota Debito";
        }
        field(50706; "No. Factura"; Code[10])
        {
            Caption = 'No. Factura';
            ToolTip = 'Specifies the value of the No. Factura field.';
        }
    }


    //Unsupported feature: Code Modification on "SendProfile(PROCEDURE 12)".

    //procedure SendProfile();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IsHandled := false;
    OnBeforeSendProfile(DocumentSendingProfile,Rec,IsHandled);
    if IsHandled then
      exit;

    DocumentSendingProfile.Send(
      DummyReportSelections.Usage::"S.Shipment",Rec,"No.","Sell-to Customer No.",
      ReportDistributionMgt.GetFullDocumentTypeText(Rec),FieldNo("Sell-to Customer No."),FieldNo("No."));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
    {
    DocumentSendingProfile.Send(
      DummyReportSelections.Usage::"S.Shipment",Rec,"No.","Sell-to Customer No.",
      ReportDistributionMgt.GetFullDocumentTypeText(Rec),FIELDNO("Sell-to Customer No."),FIELDNO("No."));
      }
    */
    //end;


    //Unsupported feature: Code Modification on "EmailRecords(PROCEDURE 17)".

    //procedure EmailRecords();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    OnBeforeEmailRecords(Rec,ShowDialog,IsHandled);
    if IsHandled then
      exit;

    DocumentSendingProfile.TrySendToEMail(
      DummyReportSelections.Usage::"S.Shipment",Rec,FieldNo("No."),
      ReportDistributionMgt.GetFullDocumentTypeText(Rec),FieldNo("Bill-to Customer No."),ShowDialog);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
    {
    DocumentSendingProfile.TrySendToEMail(
      DummyReportSelections.Usage::"S.Shipment",Rec,FIELDNO("No."),
      ReportDistributionMgt.GetFullDocumentTypeText(Rec),FIELDNO("Bill-to Customer No."),ShowDialog);
      }
    */
    //end;

    var
        PunFBanco: Page "Bank Account List";
        PunBanco: Record "Bank Account";
        PunFPuerto: Page "Entry/Exit Points";
        PunPuerto: Record "Entry/Exit Point";
        FHisCabRem: Page "Posted Sales Shipments";
        PunHisCabRem: Record "Sales Shipment Header";
        rstInfoEmpresa: Record "Company Information";
        DocTxt: Label 'Shipment';
}

