tableextension 50650 tableextension50650 extends "Sales Header Archive"
{
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
        modify("Price Group Code")
        {
            Caption = 'Price Group Code';
        }
        modify("Invoice Disc. Code")
        {
            Caption = 'Invoice Disc. Code';
        }
        modify("Cust./Item Disc. Gr.")
        {
            Caption = 'Cust./Item Disc. Gr.';
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
        modify(Ship)
        {
            Caption = 'Ship';
        }
        modify("Shipping No.")
        {
            Caption = 'Shipping No.';
        }
        modify("Posting No.")
        {
            Caption = 'Posting No.';
        }
        modify("Last Shipping No.")
        {
            Caption = 'Last Shipping No.';
        }
        modify("Last Posting No.")
        {
            Caption = 'Last Posting No.';
        }
        modify("Prepayment No.")
        {
            Caption = 'Prepayment No.';
        }
        modify("Last Prepayment No.")
        {
            Caption = 'Last Prepayment No.';
        }
        modify("Prepmt. Cr. Memo No.")
        {
            Caption = 'Prepmt. Cr. Memo No.';
        }
        modify("Last Prepmt. Cr. Memo No.")
        {
            Caption = 'Last Prepmt. Cr. Memo No.';
        }
        modify("Combine Shipments")
        {
            Caption = 'Combine Shipments';
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
        modify("Posting No. Series")
        {
            Caption = 'Posting No. Series';
        }
        modify("Shipping No. Series")
        {
            Caption = 'Shipping No. Series';
        }
        modify("Tax Area Code")
        {
            Caption = 'Tax Area Code';
        }
        modify("Invoice Discount Calculation")
        {
            Caption = 'Invoice Discount Calculation';
        }
        modify("Sell-to IC Partner Code")
        {
            Caption = 'Sell-to IC Partner Code';
        }
        modify("Bill-to IC Partner Code")
        {
            Caption = 'Bill-to IC Partner Code';
        }
        modify("IC Direction")
        {
            Caption = 'IC Direction';
        }
        modify("Prepayment No. Series")
        {
            Caption = 'Prepayment No. Series';
        }
        modify("Compress Prepayment")
        {
            Caption = 'Compress Prepayment';
        }
        modify("Prepmt. Cr. Memo No. Series")
        {
            Caption = 'Prepmt. Cr. Memo No. Series';
        }
        modify("Prepmt. Payment Terms Code")
        {
            Caption = 'Prepmt. Payment Terms Code';
        }
        modify("No. of Archived Versions")
        {
            Caption = 'No. of Archived Versions';
        }
        modify("Sales Quote No.")
        {
            Caption = 'Sales Quote No.';
        }
        modify("Quote Valid Until Date")
        {
            Caption = 'Quote Valid To Date';
        }
        modify("Sell-to Phone No.")
        {
            Caption = 'Sell-to Phone No.';
        }
        modify("Sell-to E-Mail")
        {
            Caption = 'Sell-to E-Mail';
        }
        modify("Work Description")
        {
            Caption = 'Work Description';
        }
        modify("Interaction Exist")
        {
            Caption = 'Interaction Exist';
        }
        modify("Version No.")
        {
            Caption = 'Version No.';
        }
        modify("Doc. No. Occurrence")
        {
            Caption = 'Doc. No. Occurrence';
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
        modify("Shipping Advice")
        {
            Caption = 'Shipping Advice';
        }
        modify("Location Filter")
        {
            Caption = 'Location Filter';
        }
        modify("Shipping Time")
        {
            Caption = 'Shipping Time';
        }
        modify("Shipping Agent Service Code")
        {
            Caption = 'Shipping Agent Service Code';
        }
        modify("Late Order Shipping")
        {
            Caption = 'Late Order Shipping';
        }
        modify(Receive)
        {
            Caption = 'Receive';
        }
        modify("Return Receipt No.")
        {
            Caption = 'Return Receipt No.';
        }
        modify("Return Receipt No. Series")
        {
            Caption = 'Return Receipt No. Series';
        }
        modify("Last Return Receipt No.")
        {
            Caption = 'Last Return Receipt No.';
        }
        modify("Allow Line Disc.")
        {
            Caption = 'Allow Line Disc.';
        }
        modify("Get Shipment Used")
        {
            Caption = 'Get Shipment Used';
        }
        field(50000; "Global Dimension 3 Code"; Code[10])
        {
            Caption = 'Global Dimension 3 Code';
            ToolTip = 'Specifies the value of the Global Dimension 3 Code field.';
            CaptionClass = '1,2,3';


            trigger OnValidate()
            begin
                //ActlzLinsVentas(FIELDNAME("Cód. 3oNivel"));
            end;
        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            Caption = 'Global Dimension 4 Code';
            ToolTip = 'Specifies the value of the Global Dimension 4 Code field.';
            CaptionClass = '1,2,4';

        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            Caption = 'Global Dimension 5 Code';
            ToolTip = 'Specifies the value of the Global Dimension 5 Code field.';
            CaptionClass = '1,2,5';

        }
        field(50003; "Global Dimension 6 Code"; Code[10])
        {
            Caption = 'Global Dimension 6 Code';
            ToolTip = 'Specifies the value of the Global Dimension 6 Code field.';
            CaptionClass = '1,2,6';

        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            Caption = 'Global Dimension 7 Code';
            ToolTip = 'Specifies the value of the Global Dimension 7 Code field.';
            CaptionClass = '1,2,7';

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
        }
        field(50008; "Permiso de embarque"; Code[30])
        {
            Caption = 'Boarding permission';
            ToolTip = 'Specifies the value of the Boarding permission field.';
            TableRelation = "Permisos Embarque";
            ValidateTableRelation = false;
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
            TableRelation = "Bank Account"."No.";
        }
        field(50011; "Producido en"; Code[100])
        {
            Caption = 'Producido en';
            ToolTip = 'Specifies the value of the Producido en field.';
        }
        field(50012; "Puerto embarque"; Code[30])
        {
            Caption = 'Puerto embarque';
            ToolTip = 'Specifies the value of the Puerto embarque field.';
            TableRelation = "Entry/Exit Point";
        }
        field(50013; "Puerto destino"; Code[30])
        {
            Caption = 'Puerto destino';
            ToolTip = 'Specifies the value of the Puerto destino field.';
            TableRelation = "Entry/Exit Point";
            ValidateTableRelation = false;
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
        field(50018; Aprobar; Boolean)
        {
            Caption = 'Aprobar';
            ToolTip = 'Specifies the value of the Aprobar field.';
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
        field(50021; "% retención"; Decimal)
        {
            Caption = '% retención';
            ToolTip = 'Specifies the value of the % retención field.';
        }
        field(50022; "Importe sujeto reembolso"; Decimal)
        {
            Caption = 'Importe sujeto reembolso';
            ToolTip = 'Specifies the value of the Importe sujeto reembolso field.';
        }
        field(50023; "% reembolso"; Decimal)
        {
            Caption = '% reembolso';
            ToolTip = 'Specifies the value of the % reembolso field.';
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
        field(50027; "Tipo de Contenedor"; Code[10])
        {
            Caption = 'Tipo de Contenedor';
            ToolTip = 'Specifies the value of the Tipo de Contenedor field.';
            TableRelation = "xCost Entry";
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
        field(50100; "Tipo factura"; Option)
        {
            Caption = 'Tipo factura';
            ToolTip = 'Specifies the value of the Tipo factura field.';
            OptionMembers = Venta,Servicios,"Disminución coste",Anticipo;
        }
        field(50110; "xNo Entrega Pedido"; Code[10])
        {
            Caption = 'xNo Entrega Pedido';
            ToolTip = 'Specifies the value of the xNo Entrega Pedido field.';
            Editable = false;
            InitValue = '1';
        }
        field(50300; "Su pedido"; Text[30])
        {
            Caption = 'Su pedido';
            ToolTip = 'Specifies the value of the Su pedido field.';
        }
        field(50301; "Cód. responsable"; Code[20])
        {
            Caption = 'Person Responsible';
            ToolTip = 'Specifies the value of the Person Responsible field.';
        }
        field(50302; "Ntro. no cuenta"; Text[20])
        {
            Caption = 'Ntro. no cuenta';
            ToolTip = 'Specifies the value of the Ntro. no cuenta field.';
        }
        field(50500; Observaciones; Text[50])
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
        field(50502; "Archivo vinculado"; Text[250])
        {
            Caption = 'Archivo vinculado';
            ToolTip = 'Specifies the value of the Archivo vinculado field.';
        }
        field(50503; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';

        }
        field(50504; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';

        }
        field(50505; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';

        }
        field(50506; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';

        }
        field(50507; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';

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
        field(50700; "Nota Créd. Correc. Precio"; Boolean)
        {
            Caption = 'Nota Créd. Correc. Precio';
            ToolTip = 'Specifies the value of the Nota Créd. Correc. Precio field.';
        }
        field(50701; "Nota Deb. Correc. Precio"; Boolean)
        {
            Caption = 'Nota Deb. Correc. Precio';
            ToolTip = 'Specifies the value of the Nota Deb. Correc. Precio field.';
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
        field(50805; "Iva no realizado"; Option)
        {
            Caption = 'Iva no realizado';
            ToolTip = 'Specifies the value of the Iva no realizado field.';
            OptionMembers = " ","Sí",Proyecto;
        }
    }


    //Unsupported feature: Property Modification (Subtype) on "OnDelete.CatalogItemMgt(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //OnDelete.CatalogItemMgt : "Catalog Item Management";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //OnDelete.CatalogItemMgt : "Nonstock Item Management";
    //Variable type has not been exported.
}

