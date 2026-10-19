tableextension 50433 tableextension50433 extends "Purchases & Payables Setup"
{
    fields
    {
        modify("Discount Posting")
        {
            OptionCaption = 'No Discounts,Invoice Discounts,Line Discounts,All Discounts';
        }
        modify("Receipt on Invoice")
        {
            Caption = 'Receipt on Invoice';
        }
        modify("Ext. Doc. No. Mandatory")
        {
            Caption = 'Ext. Doc. No. Mandatory';
        }
        modify("Vendor Nos.")
        {
            Caption = 'Vendor Nos.';
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
        modify("Posted Receipt Nos.")
        {
            Caption = 'Posted Receipt Nos.';
        }
        modify("Blanket Order Nos.")
        {
            Caption = 'Blanket Order Nos.';
        }
        modify("Appln. between Currencies")
        {
            Caption = 'Appln. between Currencies';
        }
        modify("Copy Comments Order to Receipt")
        {
            Caption = 'Copy Comments Order to Receipt';
        }
        modify("Posted Prepmt. Inv. Nos.")
        {
            Caption = 'Posted Prepmt. Inv. Nos.';
        }
        modify("Posted Prepmt. Cr. Memo Nos.")
        {
            Caption = 'Posted Prepmt. Cr. Memo Nos.';
        }
        modify("Prepmt. Auto Update Frequency")
        {
            Caption = 'Prepmt. Auto Update Frequency';
        }
        modify("Default Qty. to Receive")
        {
            Caption = 'Default Qty. to Receive';
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
        modify("Ignore Updated Addresses")
        {
            Caption = 'Ignore Updated Addresses';
        }
        modify("Create Item from Item No.")
        {
            Caption = 'Create Item from Item No.';
        }
        modify("Debit Acc. for Non-Item Lines")
        {
            Caption = 'Debit Acc. for Non-Item Lines';
        }
        modify("Credit Acc. for Non-Item Lines")
        {
            Caption = 'Credit Acc. for Non-Item Lines';
        }
        modify("Posted Return Shpt. Nos.")
        {
            Caption = 'Posted Return Shpt. Nos.';
        }
        modify("Copy Cmts Ret.Ord. to Ret.Shpt")
        {
            Caption = 'Copy Cmts Ret.Ord. to Ret.Shpt';
        }
        modify("Return Order Nos.")
        {
            Caption = 'Return Order Nos.';
        }
        modify("Return Shipment on Credit Memo")
        {
            Caption = 'Return Shipment on Credit Memo';
        }
        modify("Post Line Discount")
        {
            Caption = 'Post Line Discount';
        }
        modify("Correct. Doc. No. Mandatory")
        {
            Caption = 'Correct. Doc. No. Mandatory';
        }
        modify("Same Ext. Doc. No. in Diff. FY")
        {
            Caption = 'Same Ext. Doc. No. in Diff. FY';
        }
        field(50000; "Cód. término pago por defecto"; Code[10])
        {
            Caption = 'Cód. término pago por defecto';
            ToolTip = 'Specifies the value of the Cód. término pago por defecto field.';
            TableRelation = "Payment Terms".Code;
        }
        field(50001; "Cód. forma pago por defecto"; Code[10])
        {
            Caption = 'Cód. forma pago por defecto';
            ToolTip = 'Specifies the value of the Cód. forma pago por defecto field.';
        }
        field(50002; "Grupo contable neg. por defect"; Code[10])
        {
            Caption = 'Grupo contable neg. por defect';
            ToolTip = 'Specifies the value of the Grupo contable neg. por defect field.';
        }
        field(50003; "No serie solicitud"; Code[10])
        {
            Caption = 'No serie solicitud';
            ToolTip = 'Specifies the value of the No serie solicitud field.';
        }
        field(50004; "Grupo Contable Importaciones"; Code[10])
        {
            Caption = 'Grupo Contable Importaciones';
            ToolTip = 'Specifies the value of the Grupo Contable Importaciones field.';
            TableRelation = "Vendor Posting Group";
        }
        field(50005; "Provisiones compras"; Boolean)
        {
            Caption = 'Provisiones compras';
            ToolTip = 'Specifies the value of the Provisiones compras field.';
            DataClassification = ToBeClassified;
        }
        field(50500; "Ruta CUIT Proveedores"; Code[250])
        {
            Caption = 'Ruta CUIT Proveedores';
            ToolTip = 'Specifies the value of the Ruta CUIT Proveedores field.';
        }
        field(50501; "Proveedor Aduana Exterior"; Code[20])
        {
            Caption = 'Proveedor Aduana Exterior';
            ToolTip = 'Specifies the value of the Proveedor Aduana Exterior field.';
            TableRelation = Vendor;
        }
        field(50502; "No. serie liquidación pagos"; Code[20])
        {
            Caption = 'No. serie liquidación pagos';
            ToolTip = 'Specifies the value of the No. serie liquidación pagos field.';
            TableRelation = "No. Series";
        }
        field(50503; "No. serie ddjj combustible"; Code[20])
        {
            Caption = 'No. serie ddjj combustible';
            ToolTip = 'Specifies the value of the No. serie ddjj combustible field.';
            TableRelation = "No. Series";
        }
        field(50504; "Application formula"; DateFormula)
        {
            Caption = 'Application formula';
            ToolTip = 'Specifies the value of the Application formula field.';
        }
        field(50505; "Proveedor Aduana Local"; Code[20])
        {
            Caption = 'Proveedor Aduana Local';
            ToolTip = 'Specifies the value of the Proveedor Aduana Local field.';
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(50506; "Rounding VAT withholdings"; Decimal)
        {
            Caption = 'Redondeo retenciones IVA';
            ToolTip = 'Specifies the value of the Redondeo retenciones IVA field.';
            DataClassification = ToBeClassified;
        }
        field(50507; "Rounding VAT withholdings dir."; Code[1])
        {
            Caption = 'Dirección redondeo retenciones IVA';
            ToolTip = 'Specifies the value of the Dirección redondeo retenciones IVA field.';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if not ("Rounding VAT withholdings dir." in ['<', '>', '=', '']) then
                    Error('El valor de ' + FieldCaption("Rounding VAT withholdings dir.") + ' debe estar entre los valoes <, >, =');
            end;
        }
        field(50700; "Cta. prevision derechos"; Code[10])
        {
            Caption = 'Cta. prevision derechos';
            ToolTip = 'Specifies the value of the Cta. prevision derechos field.';
            Description = 'Rel. tabla cuenta';
            TableRelation = "G/L Account"."No.";
        }
        field(50701; "Cta. prevision flete int."; Code[10])
        {
            Caption = 'Cta. prevision flete int.';
            ToolTip = 'Specifies the value of the Cta. prevision flete int field.';
            Description = 'Rel. tabla cuenta';
            TableRelation = "G/L Account"."No.";
        }
        field(50702; "Cta. prevision honorarios desp"; Code[10])
        {
            Caption = 'Cta. prevision honorarios desp';
            ToolTip = 'Specifies the value of the Cta. prevision honorarios desp field.';
            Description = 'Rel. tabla cuenta';
            TableRelation = "G/L Account"."No.";
        }
        field(50703; "Cta. prevision gastos puerto"; Code[10])
        {
            Caption = 'Cta. prevision gastos puerto';
            ToolTip = 'Specifies the value of the Cta. prevision gastos puerto field.';
            Description = 'Rel. tabla cuenta';
            TableRelation = "G/L Account"."No.";
        }
        field(50704; "Cta. prevision transp. interno"; Code[10])
        {
            Caption = 'Cta. prevision transp. interno';
            ToolTip = 'Specifies the value of the Cta. prevision transp. interno field.';
            Description = 'Rel. tabla cuenta';
            TableRelation = "G/L Account"."No.";
        }
        field(50705; "Cta. prevision otros gastos"; Code[10])
        {
            Caption = 'Cta. prevision otros gastos';
            ToolTip = 'Specifies the value of the Cta. prevision otros gastos field.';
            Description = 'Rel. tabla cuenta';
            TableRelation = "G/L Account"."No.";
        }
        field(50706; "No serie ret. ganancias"; Code[20])
        {
            Caption = 'No serie ret. ganancias';
            ToolTip = 'Specifies the value of the No serie ret. ganancias field.';
            Description = 'Rel. tabla no serie';
            TableRelation = "No. Series";
        }
        field(50707; "No serie ret. ingresos brutos"; Code[20])
        {
            Caption = 'No serie ret. ingresos brutos';
            ToolTip = 'Specifies the value of the No serie ret. ingresos brutos field.';
            Description = 'Rel. tabla no serie';
            TableRelation = "No. Series";
        }
        field(50708; "No serie nota de debito"; Code[20])
        {
            Caption = 'No serie nota de debito';
            ToolTip = 'Specifies the value of the No serie nota de debito field.';
            Description = 'Rel. tabla no serie';
            TableRelation = "No. Series";
        }
        field(50709; "No serie retencion IVA"; Code[20])
        {
            Caption = 'No serie retencion IVA';
            ToolTip = 'Specifies the value of the No serie retencion IVA field.';
            Description = 'Rel. tabla no serie';
            TableRelation = "No. Series";
        }
        field(50710; "Allow posting to G/L Accounts"; Boolean)
        {
            Caption = 'Permitir registrar a cuentas';
            ToolTip = 'Specifies the value of the Permitir registrar a cuentas field.';
            DataClassification = ToBeClassified;
        }
        field(50711; "Payment dept. non mandatory"; Boolean)
        {
            Caption = 'Depto. pago no obligatorio';
            ToolTip = 'Specifies the value of the Depto. pago no obligatorio field.';
            DataClassification = ToBeClassified;
        }
        field(50712; "Shipment code non mandatory"; Boolean)
        {
            Caption = 'Cód. envío no obligatorio';
            ToolTip = 'Specifies the value of the Cód. envío no obligatorio field.';
            DataClassification = ToBeClassified;
        }
        field(50713; "Cantidad OP a imprimir"; Integer)
        {
            Caption = 'Cantidad OP a imprimir';
            ToolTip = 'Specifies the value of the Cantidad OP a imprimir field.';
            DataClassification = ToBeClassified;
            InitValue = 1;
        }
        field(50714; "Cantidad impresos retenciones"; Integer)
        {
            Caption = 'Cantidad impresos retenciones';
            ToolTip = 'Specifies the value of the Cantidad impresos retenciones field.';
            DataClassification = ToBeClassified;
        }
        field(55000; "No ser. liquidación pagaré"; Code[10])
        {
            Caption = 'No ser. liquidación pagaré';
            ToolTip = 'Specifies the value of the No ser. liquidación pagaré field.';
            TableRelation = "No. Series";
        }
        field(55001; "No ser. anulación pagaré"; Code[10])
        {
            Caption = 'No ser. anulación pagaré';
            ToolTip = 'Specifies the value of the No ser. anulación pagaré field.';
            TableRelation = "No. Series";
        }
        field(60001; "Código prov. = CIF/NIF"; Boolean)
        {
            Caption = 'Código prov. = CIF/NIF';
            ToolTip = 'Specifies the value of the Código prov. = CIF/NIF field.';
        }
        field(60003; "No proyecto cabecera"; Option)
        {
            Caption = 'No proyecto cabecera';
            ToolTip = 'Specifies the value of the No proyecto cabecera field.';
            OptionMembers = Libre,Obligatorio,"Obligatorio proyecto o almacén";
        }
        field(60004; "No proyecto Líneas"; Option)
        {
            Caption = 'No proyecto Líneas';
            ToolTip = 'Specifies the value of the No proyecto Líneas field.';
            OptionMembers = Libre,Obligatorio,"Obligatorio proyecto o almacén","Igual que cabecera";
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
        field(60011; "No Comprador Obligatorio"; Boolean)
        {
            Caption = 'No Comprador Obligatorio';
            ToolTip = 'Specifies the value of the No Comprador Obligatorio field.';
        }
        field(60015; "No remito obligatorio"; Boolean)
        {
            Caption = 'No remito obligatorio';
            ToolTip = 'Specifies the value of the No remito obligatorio field.';
        }
        field(70000; "Correo-e envío hojas demanda"; Text[100])
        {
            Caption = 'Correo-e envío hojas demanda';
            ToolTip = 'Specifies the value of the Correo-e envío hojas demanda field.';
        }
        field(90000; "No serie anulaciones"; Code[10])
        {
            Caption = 'No serie anulaciones';
            ToolTip = 'Specifies the value of the No serie anulaciones field.';
            TableRelation = "No. Series";
        }
    }
}

