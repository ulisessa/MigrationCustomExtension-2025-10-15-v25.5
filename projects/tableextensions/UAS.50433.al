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
            TableRelation = "Payment Terms".Code;
        }
        field(50001; "Cód. forma pago por defecto"; Code[10])
        {
        }
        field(50002; "Grupo contable neg. por defect"; Code[10])
        {
        }
        field(50003; "No serie solicitud"; Code[10])
        {
        }
        field(50004; "Grupo Contable Importaciones"; Code[10])
        {
            TableRelation = "Vendor Posting Group";
        }
        field(50005; "Provisiones compras"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50500; "Ruta CUIT Proveedores"; Code[250])
        {
        }
        field(50501; "Proveedor Aduana Exterior"; Code[20])
        {
            TableRelation = Vendor;
        }
        field(50502; "No. serie liquidación pagos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50503; "No. serie ddjj combustible"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50504; "Application formula"; DateFormula)
        {
            CaptionML = ENU = 'Application formula', ESP = 'Fórmula de aplicación';
        }
        field(50505; "Proveedor Aduana Local"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(50506; "Rounding VAT withholdings"; Decimal)
        {
            Caption = 'Redondeo retenciones IVA';
            DataClassification = ToBeClassified;
        }
        field(50507; "Rounding VAT withholdings dir."; Code[1])
        {
            Caption = 'Dirección redondeo retenciones IVA';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if not ("Rounding VAT withholdings dir." in ['<', '>', '=', '']) then
                    Error('El valor de ' + FieldCaption("Rounding VAT withholdings dir.") + ' debe estar entre los valoes <, >, =');
            end;
        }
        field(50700; "Cta. prevision derechos"; Code[10])
        {
            Description = 'Rel. tabla cuenta';
            TableRelation = "G/L Account"."No.";
        }
        field(50701; "Cta. prevision flete int."; Code[10])
        {
            Description = 'Rel. tabla cuenta';
            TableRelation = "G/L Account"."No.";
        }
        field(50702; "Cta. prevision honorarios desp"; Code[10])
        {
            Description = 'Rel. tabla cuenta';
            TableRelation = "G/L Account"."No.";
        }
        field(50703; "Cta. prevision gastos puerto"; Code[10])
        {
            Description = 'Rel. tabla cuenta';
            TableRelation = "G/L Account"."No.";
        }
        field(50704; "Cta. prevision transp. interno"; Code[10])
        {
            Description = 'Rel. tabla cuenta';
            TableRelation = "G/L Account"."No.";
        }
        field(50705; "Cta. prevision otros gastos"; Code[10])
        {
            Description = 'Rel. tabla cuenta';
            TableRelation = "G/L Account"."No.";
        }
        field(50706; "No serie ret. ganancias"; Code[20])
        {
            Description = 'Rel. tabla no serie';
            TableRelation = "No. Series";
        }
        field(50707; "No serie ret. ingresos brutos"; Code[20])
        {
            Description = 'Rel. tabla no serie';
            TableRelation = "No. Series";
        }
        field(50708; "No serie nota de debito"; Code[20])
        {
            Description = 'Rel. tabla no serie';
            TableRelation = "No. Series";
        }
        field(50709; "No serie retencion IVA"; Code[20])
        {
            Description = 'Rel. tabla no serie';
            TableRelation = "No. Series";
        }
        field(50710; "Allow posting to G/L Accounts"; Boolean)
        {
            Caption = 'Permitir registrar a cuentas';
            DataClassification = ToBeClassified;
        }
        field(50711; "Payment dept. non mandatory"; Boolean)
        {
            Caption = 'Depto. pago no obligatorio';
            DataClassification = ToBeClassified;
        }
        field(50712; "Shipment code non mandatory"; Boolean)
        {
            Caption = 'Cód. envío no obligatorio';
            DataClassification = ToBeClassified;
        }
        field(50713; "Cantidad OP a imprimir"; Integer)
        {
            DataClassification = ToBeClassified;
            InitValue = 1;
        }
        field(50714; "Cantidad impresos retenciones"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(55000; "No ser. liquidación pagaré"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(55001; "No ser. anulación pagaré"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(60001; "Código prov. = CIF/NIF"; Boolean)
        {
        }
        field(60003; "No proyecto cabecera"; Option)
        {
            OptionMembers = Libre,Obligatorio,"Obligatorio proyecto o almacén";
        }
        field(60004; "No proyecto Líneas"; Option)
        {
            OptionMembers = Libre,Obligatorio,"Obligatorio proyecto o almacén","Igual que cabecera";
        }
        field(60006; "Cód. departamento cabecera"; Option)
        {
            OptionMembers = Libre,Obligatorio,"Traer del proyecto";
        }
        field(60007; "Cód. departamento Líneas"; Option)
        {
            OptionMembers = Libre,Obligatorio,"Traer del proyecto","Igual a cabecera";
        }
        field(60008; "Cód. programa cabecera"; Option)
        {
            OptionMembers = Libre,Obligatorio,"Traer del proyecto";
        }
        field(60009; "Cód. programa Líneas"; Option)
        {
            OptionMembers = Libre,Obligatorio,"Traer del proyecto","Igual a cabecera";
        }
        field(60010; "Corrección en abonos"; Boolean)
        {
        }
        field(60011; "No Comprador Obligatorio"; Boolean)
        {
        }
        field(60015; "No remito obligatorio"; Boolean)
        {
            Caption = 'No remito obligatorio';
        }
        field(70000; "Correo-e envío hojas demanda"; Text[100])
        {
        }
        field(90000; "No serie anulaciones"; Code[10])
        {
            TableRelation = "No. Series";
        }
    }
}

