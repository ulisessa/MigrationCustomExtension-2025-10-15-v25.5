tableextension 50087 "Purch. Rcpt. Header Ext." extends "Purch. Rcpt. Header"
{
    Caption = 'Purch. Rcpt. Header';
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
        modify("Vendor Order No.")
        {
            Caption = 'Vendor Order No.';
        }
        modify("Vendor Shipment No.")
        {
            Caption = 'Vendor Shipment No.';
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
        modify("Campaign No.")
        {
            Caption = 'Campaign No.';
        }
        modify("Buy-from Contact No.")
        {
            Caption = 'Buy-from Contact No.';
        }
        modify("Pay-to Contact no.")
        {
            Caption = 'Pay-to Contact no.';
        }
        modify("Lead Time Calculation")
        {
            Caption = 'Lead Time Calculation';
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
        field(50038; "No. factura proveedor"; Code[30])
        {
            Caption = 'Vendor Invoice No.';
            ToolTip = 'Specifies the value of the Vendor Invoice No field.';
        }
        field(50093; "Importe provisión (DL)"; Decimal)
        {
            Caption = 'Importe provisión (DL)';
            ToolTip = 'Specifies the value of the Importe provisión (DL) field.';
            CalcFormula = Sum("G/L Entry".Amount WHERE("Document No." = FIELD("No."),
                                                        "G/L Account No." = FILTER('2114003' | '2114004')));
            FieldClass = FlowField;
        }
        field(50503; "Archivo vinculado"; Text[250])
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
        field(50504; "Departamento de pago"; Code[10])
        {
            Caption = 'Departamento de pago';
            ToolTip = 'Specifies the value of the Departamento de pago field.';
            TableRelation = Seguridad;
        }
        field(50510; "Solicitud vinculada"; Code[30])
        {
            Caption = 'Solicitud vinculada';
            ToolTip = 'Specifies the value of the Solicitud vinculada field.';
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
            Caption = 'Importe segun solicitud';
            ToolTip = 'Specifies the value of the Importe segun solicitud field.';
            CalcFormula = Sum("Lín. solicitud"."Importe neto" WHERE("No. Documento" = FIELD("Solicitud vinculada"),
                                                                     Revertido = CONST(false),
                                                                     Aprobado = CONST(true)));
            FieldClass = FlowField;
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
            CalcFormula = Lookup(Mensajeria.Estado WHERE("No. documento" = FIELD("Order No.")));
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
        field(50702; "Tipo fiscal"; Code[20])
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

    var
        rstInfoEmpresa: Record "Company Information";
}

