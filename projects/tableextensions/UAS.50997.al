tableextension 50997 tableextension50997 extends "Return Receipt Header"
{
    Caption = 'Return Receipt Header';
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
        modify("No. Printed")
        {
            Caption = 'No. Printed';
        }
        modify("Applies-to Doc. No.")
        {
            Caption = 'Applies-to Doc. No.';
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
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("Tax Area Code")
        {
            Caption = 'Tax Area Code';
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
        modify("Warehouse Handling Time")
        {
            Caption = 'Warehouse Handling Time';
        }
        modify("Late Order Shipping")
        {
            Caption = 'Late Order Shipping';
        }
        modify("Return Order No.")
        {
            Caption = 'Return Order No.';
        }
        modify("Return Order No. Series")
        {
            Caption = 'Return Order No. Series';
        }
        modify("Allow Line Disc.")
        {
            Caption = 'Allow Line Disc.';
        }
        field(50000; "Global dimension 3 Code"; Code[10])
        {
            CaptionClass = '1,2,3';

        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            CaptionClass = '1,2,4';

        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            CaptionClass = '1,2,5';

        }
        field(50003; "Global dimension 6 Code"; Code[10])
        {
            CaptionClass = '1,2,6';

        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';

        }
        field(50005; "No. certificación"; Code[10])
        {
        }
        field(50006; "Orden Encargo"; Code[10])
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
            TableRelation = "Permisos Embarque";
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                //IBdos Argentina - USS - 250203 - Inicio Modificación Arbumasa
                //Se creó una tabla para almacenar los permisos

                PunPermisos."Permiso embarque" := "Permiso de embarque";
                if not PunPermisos.Insert then
                    PunPermisos.Modify;

                //IBdos Argentina - USS - 250203 - Fin Modificación Arbumasa

                //US.ARBU - 20040519 - Modificación para actualizar datos en las Líneas de ventas
                LinVtas.Reset;
                LinVtas.SetRange(LinVtas."Document No.", "No.");
                if LinVtas.Find('-') then
                    repeat
                        LinVtas."Permiso de embarque" := "Permiso de embarque";
                        LinVtas.Modify;
                    until LinVtas.Next = 0;
                //US.ARBU - 20040519 - Modificación para actualizar datos en las Líneas de ventas
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
            TableRelation = "Bank Account"."No.";

            trigger OnLookup()
            begin
                Clear(PunFBanco);
                PunFBanco.LookupMode := true;
                PunFBanco.SetTableView(PunBanco);
                if PunFBanco.RunModal = ACTION::LookupOK then begin
                    PunFBanco.GetRecord(PunBanco);
                    "Banco Interviniente" := PunBanco."Search Name";
                end;
            end;
        }
        field(50011; "Producido en"; Code[100])
        {
        }
        field(50012; "Puerto embarque"; Code[30])
        {
            TableRelation = "Entry/Exit Point";
        }
        field(50013; "Puerto destino"; Code[30])
        {
            TableRelation = "Entry/Exit Point";
            ValidateTableRelation = false;
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
        field(50018; Aprobar; Boolean)
        {

            trigger OnValidate()
            begin
                //IBdos Argentina - USS - 281102 - Inicio Modificación Arbumasa
                //Verifico que el usuario tenga permisos para aprobar pedidos

                if not rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Aprobar Pedidos")) then
                    Error('Usted no está autorizado para Aprobar pedidos');

                //IBdos Argentina - USS - 281102 - Fin Modificación Arbumasa
            end;
        }
        field(50019; Usuario; Code[20])
        {
            TableRelation = User;
        }
        field(50020; "Importe sujeto retencion"; Decimal)
        {
        }
        field(50021; "% retención"; Decimal)
        {
        }
        field(50022; "Importe sujeto reembolso"; Decimal)
        {
        }
        field(50023; "% reembolso"; Decimal)
        {
        }
        field(50024; "Importe sujeto reintegro"; Decimal)
        {
        }
        field(50025; "% reintegro"; Decimal)
        {
        }
        field(50027; "Tipo de Contenedor"; Code[10])
        {
            TableRelation = "xCost Entry";
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
        field(50100; "Tipo factura"; Option)
        {
            OptionMembers = Venta,Servicios,"Disminución coste",Anticipo;
        }
        field(50110; "xNo Entrega Pedido"; Code[10])
        {
            Editable = false;
            InitValue = '1';
        }
        field(50300; "Su pedido"; Text[30])
        {
        }
        field(50301; "Cód. responsable"; Code[20])
        {
        }
        field(50302; "Ntro. no cuenta"; Text[20])
        {
        }
        field(50500; Observaciones; Text[30])
        {
        }
        field(50501; Estado; Text[50])
        {
            CalcFormula = Lookup(Mensajeria.Estado WHERE("No. documento" = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(50502; "Archivo vinculado"; Text[250])
        {

            trigger OnLookup()
            begin
                Clear(rstInfoEmpresa);
                rstInfoEmpresa.Get();
                HyperLink(rstInfoEmpresa."Ruta Intranet" + (ConvertStr(CopyStr("Archivo vinculado", 4, 250), '\', '/')));
            end;
        }
        field(50503; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';

        }
        field(50504; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';

        }
        field(50505; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 1 Code';

        }
        field(50506; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 2 Code';

        }
        field(50507; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 1 Code';

        }
        field(50598; "Usuario Anulación"; Code[20])
        {
        }
        field(50599; Anulado; Boolean)
        {
        }
        field(50700; "Nota Créd. Correc. Precio"; Boolean)
        {
        }
        field(50701; "Nota Deb. Correc. Precio"; Boolean)
        {
        }
        field(50702; Province; Code[10])
        {
            TableRelation = Area;
        }
        field(50703; "Tipo Fiscal"; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('TIPO FISCAL'));
            ObsoleteTag = '12/2025';
            ObsoleteState = Pending;
            ObsoleteReason = 'Reemplazado por campo Grupo Registro IVA Negocio';
        }
        field(50704; "Punto Venta"; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('PUNTO VENTA'));
        }
        field(50805; "Iva no realizado"; Option)
        {
            OptionMembers = " ","Sí",Proyecto;
        }
    }


    //Unsupported feature: Code Modification on "EmailRecords(PROCEDURE 17)".

    //procedure EmailRecords();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DocumentSendingProfile.TrySendToEMail(
      DummyReportSelections.Usage::"S.Ret.Rcpt.",Rec,FieldNo("No."),
      ReportDistributionMgt.GetFullDocumentTypeText(Rec),FieldNo("Bill-to Customer No."),ShowDialog);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    {DocumentSendingProfile.TrySendToEMail(
      DummyReportSelections.Usage::"S.Ret.Rcpt.",Rec,FIELDNO("No."),
      ReportDistributionMgt.GetFullDocumentTypeText(Rec),FIELDNO("Bill-to Customer No."),ShowDialog);
      }
    */
    //end;

    var
        "---ARBUMASA---": Integer;
        PunPermisos: Record "Permisos Embarque";
        LinVtas: Record "Return Receipt Line";
        PunFBanco: Page "Bank Account List";
        PunBanco: Record "Bank Account";
        PunFPuerto: Page "Entry/Exit Points";
        rstSeguridadUsuario: Record "Seguridad por usuario";
        rstSeguridad: Record Seguridad;
        rstInfoEmpresa: Record "Company Information";
}

