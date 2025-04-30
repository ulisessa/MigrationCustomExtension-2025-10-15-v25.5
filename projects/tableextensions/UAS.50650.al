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
            CaptionClass = '1,1,3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                //ActlzLinsVentas(FIELDNAME("Cód. 3oNivel"));
            end;
        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            CaptionClass = '1,1,4';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            CaptionClass = '1,1,5';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));
        }
        field(50003; "Global Dimension 6 Code"; Code[10])
        {
            CaptionClass = '1,1,6';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));
        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,1,7';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));
        }
        field(50005; "No. certificación"; Code[10])
        {
        }
        field(50006; "Orden Encargo"; Code[10])
        {
        }
        field(50007; "Carpeta de Exportación"; Text[10])
        {
        }
        field(50008; "Permiso de embarque"; Code[30])
        {
            TableRelation = "Permisos Embarque";
            ValidateTableRelation = false;
        }
        field(50009; Marcas; Code[20])
        {
        }
        field(50010; "Banco Interviniente"; Code[30])
        {
            TableRelation = "Bank Account"."No.";
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
        field(50500; Observaciones; Text[50])
        {
        }
        field(50501; Estado; Text[50])
        {
            CalcFormula = Lookup(Mensajeria.Estado WHERE("No. documento" = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(50502; "Archivo vinculado"; Text[250])
        {
        }
        field(50503; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(50504; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
        }
        field(50505; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));
        }
        field(50506; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));
        }
        field(50507; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));
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


    //Unsupported feature: Property Modification (Subtype) on "OnDelete.CatalogItemMgt(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //OnDelete.CatalogItemMgt : "Catalog Item Management";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //OnDelete.CatalogItemMgt : "Nonstock Item Management";
    //Variable type has not been exported.
}

