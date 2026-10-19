tableextension 50432 tableextension50432 extends "Sales & Receivables Setup"
{
    fields
    {
        modify("Discount Posting")
        {
            OptionCaption = 'No Discounts,Invoice Discounts,Line Discounts,All Discounts';
        }
        modify("Credit Warnings")
        {
            Caption = 'Credit Warnings';
            OptionCaption = 'Both Warnings,Credit Limit,Overdue Balance,No Warning';
        }
        modify("Shipment on Invoice")
        {
            Caption = 'Shipment on Invoice';
        }
        modify("Ext. Doc. No. Mandatory")
        {
            Caption = 'Ext. Doc. No. Mandatory';
        }
        modify("Customer Nos.")
        {
            Caption = 'Customer Nos.';
        }
        modify("Quote Nos.")
        {
            Caption = 'Quote Nos.';
        }
        modify("Order Nos.")
        {
            Caption = 'Order Nos.';
        }
        modify("Invoice Nos.")
        {
            Caption = 'Invoice Nos.';
        }
        modify("Posted Invoice Nos.")
        {
            Caption = 'Posted Invoice Nos.';
        }
        modify("Credit Memo Nos.")
        {
            Caption = 'Credit Memo Nos.';
        }
        modify("Posted Credit Memo Nos.")
        {
            Caption = 'Posted Credit Memo Nos.';
        }
        modify("Posted Shipment Nos.")
        {
            Caption = 'Posted Shipment Nos.';
        }
        modify("Reminder Nos.")
        {
            Caption = 'Reminder Nos.';
        }
        modify("Issued Reminder Nos.")
        {
            Caption = 'Issued Reminder Nos.';
        }
        modify("Fin. Chrg. Memo Nos.")
        {
            Caption = 'Fin. Chrg. Memo Nos.';
        }
        modify("Issued Fin. Chrg. M. Nos.")
        {
            Caption = 'Issued Fin. Chrg. M. Nos.';
        }
        modify("Posted Prepmt. Inv. Nos.")
        {
            Caption = 'Posted Prepmt. Inv. Nos.';
        }
        modify("Posted Prepmt. Cr. Memo Nos.")
        {
            Caption = 'Posted Prepmt. Cr. Memo Nos.';
        }
        modify("Blanket Order Nos.")
        {
            Caption = 'Blanket Order Nos.';
        }
        modify("Appln. between Currencies")
        {
            Caption = 'Appln. between Currencies';
        }
        modify("Logo Position on Documents")
        {
            Caption = 'Logo Position on Documents';
        }
        modify("Prepmt. Auto Update Frequency")
        {
            Caption = 'Prepmt. Auto Update Frequency';
        }
        modify("Job Queue Category Code")
        {
            Caption = 'Job Queue Category Code';
        }
        modify("Job Q. Prio. for Post & Print")
        {
            Caption = 'Job Q. Prio. for Post & Print';
        }
        modify("Notify On Success")
        {
            Caption = 'Notify On Success';
        }
        modify("Direct Debit Mandate Nos.")
        {
            Caption = 'Direct Debit Mandate Nos.';
        }
        modify("Create Item from Description")
        {
            Caption = 'Create Item from Description';
        }
        modify("Create Item from Item No.")
        {
            Caption = 'Create Item from Item No.';
        }
        modify("Ignore Updated Addresses")
        {
            Caption = 'Ignore Updated Addresses';
        }
        modify("Quote Validity Calculation")
        {
            Caption = 'Quote Validity Calculation';
        }
        modify("Write-in Product Type")
        {
            Caption = 'Write-in Product Type';
        }
        modify("Write-in Product No.")
        {
            Caption = 'Write-in Product No.';
        }
        modify("Posted Return Receipt Nos.")
        {
            Caption = 'Posted Return Receipt Nos.';
        }
        modify("Return Order Nos.")
        {
            Caption = 'Return Order Nos.';
        }
        modify("Customer Group Dimension Code")
        {
            Caption = 'Customer Group Dimension Code';
        }
        modify("Salesperson Dimension Code")
        {
            Caption = 'Salesperson Dimension Code';
        }
        modify("Freight G/L Acc. No.")
        {
            Caption = 'Freight G/L Account No.';
        }
        modify("Post Line Discount")
        {
            Caption = 'Post Line Discount';
        }
        modify("Correct. Doc. No. Mandatory")
        {
            Caption = 'Correct. Doc. No. Mandatory';
        }

        //Unsupported feature: Code Modification on ""Copy Customer Name to Entries"(Field 58).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "Copy Customer Name to Entries" then
          CustEntryEdit.UpdateCustomerNamesInLedgerEntries;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        if "Copy Customer Name to Entries" then
        //  CustEntryEdit.UpdateCustomerNamesInLedgerEntries;
        */
        //end;
        field(50002; "Grupo contable Exportaciones"; Code[10])
        {
            Caption = 'Grupo contable Exportaciones';
            ToolTip = 'Specifies the value of the Grupo contable Exportaciones field.';
            TableRelation = "Customer Posting Group".Code;
        }
        field(50003; "Grupo Confirmaciones"; Code[10])
        {
            Caption = 'Grupo Confirmaciones';
            ToolTip = 'Specifies the value of the Grupo Confirmaciones field.';
        }
        field(50004; "Grupo Aprobaciones"; Code[10])
        {
            Caption = 'Grupo Aprobaciones';
            ToolTip = 'Specifies the value of the Grupo Aprobaciones field.';
        }
        field(50005; Retenciones; Code[10])
        {
            Caption = 'Retenciones';
            ToolTip = 'Specifies the value of the Retenciones field.';
            TableRelation = "G/L Account"."No.";
        }
        field(50006; "Reembolsos a cobrar"; Code[10])
        {
            Caption = 'Reembolsos a cobrar';
            ToolTip = 'Specifies the value of the Reembolsos a cobrar field.';
            TableRelation = "G/L Account"."No.";
        }
        field(50007; "Reintegros a cobrar"; Code[10])
        {
            Caption = 'Reintegros a cobrar';
            ToolTip = 'Specifies the value of the Reintegros a cobrar field.';
            TableRelation = "G/L Account"."No.";
        }
        field(50008; Reembolsos; Code[10])
        {
            Caption = 'Reembolsos';
            ToolTip = 'Specifies the value of the Reembolsos field.';
            TableRelation = "G/L Account"."No.";
        }
        field(50009; Reintegros; Code[10])
        {
            Caption = 'Reintegros';
            ToolTip = 'Specifies the value of the Reintegros field.';
            TableRelation = "G/L Account"."No.";
        }
        field(50010; "Retenciones a pagar"; Code[10])
        {
            Caption = 'Retenciones a pagar';
            ToolTip = 'Specifies the value of the Retenciones a pagar field.';
            TableRelation = "G/L Account"."No.";
        }
        field(50011; "Anticipos ganancias a pagar"; Code[10])
        {
            Caption = 'Anticipos ganancias a pagar';
            ToolTip = 'Specifies the value of the Anticipos ganancias a pagar field.';
            TableRelation = "G/L Account"."No.";
        }
        field(50012; "Anticipos ganancias"; Code[10])
        {
            Caption = 'Anticipos ganancias';
            ToolTip = 'Specifies the value of the Anticipos ganancias field.';
            TableRelation = "G/L Account"."No.";
        }
        field(50014; "No. serie repartos"; Code[20])
        {
            Caption = 'No. serie repartos';
            ToolTip = 'Specifies the value of the No. serie repartos field.';
        }
        field(50015; "Ruta repartos"; Text[250])
        {
            Caption = 'Ruta repartos';
            ToolTip = 'Specifies the value of the Ruta repartos field.';
        }
        field(50016; "Recurso redondeo"; Code[20])
        {
            Caption = 'Recurso redondeo';
            ToolTip = 'Specifies the value of the Recurso redondeo field.';
            TableRelation = Resource.Type WHERE(Type = CONST(Sale));
        }
        field(50017; "Generar Líneas pedido reparto"; Boolean)
        {
            Caption = 'Generar Líneas pedido reparto';
            ToolTip = 'Specifies the value of the Generar Líneas pedido reparto field.';
        }
        field(50018; "Coeficiente imp. expo"; Decimal)
        {
            Caption = 'Coeficiente imp. expo';
            ToolTip = 'Specifies the value of the Coeficiente imp. expo field.';
            DecimalPlaces = 5 : 5;
        }
        field(50019; "Proyecto Insumos"; Code[20])
        {
            Caption = 'Proyecto Insumos';
            ToolTip = 'Specifies the value of the Proyecto Insumos field.';
            TableRelation = Job;
        }
        field(50020; "DCL local customer"; Code[10])
        {
            Caption = 'Cliente local para DCL';
            ToolTip = 'Specifies the value of the Cliente local para DCL field.';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = FILTER(1));
        }
        field(50021; "NO verificar DCL específico"; Boolean)
        {
            Caption = 'NO verificar DCL específico';
            ToolTip = 'Specifies the value of the NO verificar DCL específico field.';
            DataClassification = ToBeClassified;
        }
        field(50022; "Controlar contra DCL"; Boolean)
        {
            Caption = 'Controlar contra DCL';
            ToolTip = 'Specifies the value of the Controlar contra DCL field.';
            DataClassification = ToBeClassified;
        }
        field(50023; "DCL tracking"; Option)
        {
            Caption = 'Rastreo de DCL';
            ToolTip = 'Specifies the value of the Rastreo de DCL field.';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Lote origen a DCL específico","Lote origen a DCL abierto";
        }
        field(50024; "No. COM"; Integer)
        {
            Caption = 'No. COM';
            ToolTip = 'Specifies the value of the No. COM field.';
            DataClassification = ToBeClassified;
        }
        field(50025; "Customer Group for DCL"; Code[10])
        {
            Caption = 'Grupo Clientes para DCL';
            ToolTip = 'Specifies the value of the Grupo Clientes para DCL field.';
            DataClassification = ToBeClassified;
            TableRelation = "Customer Posting Group".Code;
        }
        field(50026; "Dimension for sales"; Code[20])
        {
            Caption = 'Dimensión para repartos';
            ToolTip = 'Specifies the value of the Dimensión para repartos field.';
            DataClassification = ToBeClassified;
            TableRelation = Dimension;
        }
        field(50027; "Post accrued export benefits"; Option)
        {
            Caption = 'Post accrued export benefits and withholgings';
            ToolTip = 'Specifies the value of the Post accrued export benefits and withholgings field.';
            DataClassification = ToBeClassified;
            OptionCaption = 'On invoice posting,On periodic task execution';
            OptionMembers = "On invoice posting","On periodic task execution";
        }
        field(50028; "Nombre libro ByR"; Code[10])
        {
            Caption = 'Nombre libro ByR';
            ToolTip = 'Specifies the value of the Nombre libro ByR field.';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template".Name;
        }
        field(50029; "Nombre sección ByR"; Code[10])
        {
            Caption = 'Nombre sección ByR';
            ToolTip = 'Specifies the value of the Nombre sección ByR field.';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Nombre libro ByR"));
        }
        field(50030; "Gr. cont. IVA para flete y seg"; Code[10])
        {
            Caption = 'Gr. cont. IVA para flete y seg';
            ToolTip = 'Specifies the value of the Gr. cont. IVA para flete y seg field.';
            DataClassification = ToBeClassified;
            TableRelation = "VAT Product Posting Group";
        }
        field(50031; "Production date limit"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Production date limit';
            ToolTip = 'Specifies the value of the Production date limit field.';
        }
        field(50032; MaerskApiBaseUrl; Text[250])
        {
            Caption = 'MaerskApiBaseUrl';
            ToolTip = 'Specifies the value of the MaerskApiBaseUrl field.';
            DataClassification = ToBeClassified;
        }
        field(50033; AuthTokenUrl; Text[250])
        {
            Caption = 'AuthTokenUrl';
            ToolTip = 'Specifies the value of the AuthTokenUrl field.';
            DataClassification = ToBeClassified;
        }
        field(50034; ClientId; Text[100])
        {
            Caption = 'ClientId';
            ToolTip = 'Specifies the value of the ClientId field.';
            DataClassification = ToBeClassified;
        }
        field(50035; ClientSecret; Text[100])
        {
            Caption = 'ClientSecret';
            ToolTip = 'Specifies the value of the ClientSecret field.';
            DataClassification = ToBeClassified;
            ExtendedDatatype = Masked;
        }
        field(50700; "No. serie ND registrada"; Code[10])
        {
            Caption = 'No. serie ND registrada';
            ToolTip = 'Specifies the value of the No. serie ND registrada field.';
            TableRelation = "No. Series";
        }
        field(50805; "Iva no realizado"; Option)
        {
            Caption = 'Iva no realizado';
            ToolTip = 'Specifies the value of the Iva no realizado field.';
            OptionMembers = " ","Sí",Proyecto;
        }
        field(60001; "Código cliente = CIF/NIF"; Boolean)
        {
            Caption = 'Código cliente = CIF/NIF';
            ToolTip = 'Specifies the value of the Código cliente = CIF/NIF field.';
        }
        field(60003; "No. certificación"; Option)
        {
            Caption = 'No. certificación';
            ToolTip = 'Specifies the value of the No. certificación field.';
            OptionMembers = Libre,Obligatorio;
        }
        field(60004; "No proyecto cabecera"; Option)
        {
            Caption = 'No proyecto cabecera';
            ToolTip = 'Specifies the value of the No proyecto cabecera field.';
            OptionMembers = Libre,Obligatorio;
        }
        field(60005; "No proyecto Líneas"; Option)
        {
            Caption = 'No proyecto Líneas';
            ToolTip = 'Specifies the value of the No proyecto Líneas field.';
            OptionMembers = Libre,Obligatorio,,"Igual que cabecera";
        }
        field(60006; "Cód. departamento cabecera"; Option)
        {
            Caption = 'Cód. departamento cabecera';
            ToolTip = 'Specifies the value of the Cód. departamento cabecera field.';
            OptionMembers = Libre,Obligatorio,"Traer del proyecto";
        }
        field(60007; "Cód. departamento Líneas"; Option)
        {
            Caption = 'Cód. departamento Líneas';
            ToolTip = 'Specifies the value of the Cód. departamento Líneas field.';
            OptionMembers = Libre,Obligatorio,"Traer del proyecto","Igual a cabecera";
        }
        field(60008; "Cód. programa cabecera"; Option)
        {
            Caption = 'Cód. programa cabecera';
            ToolTip = 'Specifies the value of the Cód. programa cabecera field.';
            OptionMembers = Libre,Obligatorio,"Traer del proyecto";
        }
        field(60009; "Cód. programa Líneas"; Option)
        {
            Caption = 'Cód. programa Líneas';
            ToolTip = 'Specifies the value of the Cód. programa Líneas field.';
            OptionMembers = Libre,Obligatorio,"Traer del proyecto","Igual a cabecera";
        }
        field(60010; "Corrección en abonos"; Boolean)
        {
            Caption = 'Corrección en abonos';
            ToolTip = 'Specifies the value of the Corrección en abonos field.';
        }
        field(60020; "Deducc. certificación anterior"; Code[20])
        {
            Caption = 'Deducc. certificación anterior';
            ToolTip = 'Specifies the value of the Deducc. certificación anterior field.';
            TableRelation = Resource WHERE(Type = CONST(Sale));
        }
        field(90000; "No serie anulaciones"; Code[10])
        {
            Caption = 'No serie anulaciones';
            ToolTip = 'Specifies the value of the No serie anulaciones field.';
            TableRelation = "Inflation Adjustment Register";
        }
    }
}

