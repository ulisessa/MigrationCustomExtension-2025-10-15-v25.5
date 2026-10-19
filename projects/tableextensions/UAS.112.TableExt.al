tableextension 115 tableextension115 extends "Sales Cr.Memo Line"
{
    fields
    {
        field(50000; "Shortcut Dimension 3 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 3 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';

        }
        field(50001; "Shortcut Dimension 4 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 3 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';

        }
        field(50002; "Shortcut Dimension 5 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 3 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';

        }
        field(50003; "Shortcut Dimension 6 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 3 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';

        }
        field(50004; "Shortcut Dimension 7 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 3 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';

        }
        field(50005; Facturado; Boolean)
        {
            Caption = 'Facturado';
            ToolTip = 'Specifies the value of the Facturado field.';
        }
        field(50006; "Precio x Kilo"; Decimal)
        {
            Caption = 'Precio x Kilo';
            ToolTip = 'Specifies the value of the Precio x Kilo field.';
        }
        field(50007; "No. Pallet"; Code[10])
        {
            Caption = 'Pallet no.';
            ToolTip = 'Specifies the value of the Pallet no field.';
        }
        field(50008; Confirmada; Boolean)
        {
            Caption = 'Confirmada';
            ToolTip = 'Specifies the value of the Confirmada field.';
        }
        field(50009; "Descripción Interna"; Text[250])
        {
            Caption = 'Descripción Interna';
            ToolTip = 'Specifies the value of the Descripción Interna field.';
        }
        field(50010; "Kilos Brutos"; Decimal)
        {
            Caption = 'Kilos Brutos';
            ToolTip = 'Specifies the value of the Kilos Brutos field.';
        }
        field(50011; Usuario; Code[20])
        {
            Caption = 'User ID';
            ToolTip = 'Specifies the value of the User ID field.';
            TableRelation = User;
        }
        field(50012; Rechazada; Boolean)
        {
            Caption = 'Rechazada';
            ToolTip = 'Specifies the value of the Rechazada field.';
        }
        field(50013; "Kilos netos"; Decimal)
        {
            Caption = 'Kilos netos';
            ToolTip = 'Specifies the value of the Kilos netos field.';
        }
        field(50014; "% Precio Kilo"; Decimal)
        {
            Caption = '% price per kilo';
            ToolTip = 'Specifies the value of the % price per kilo field.';
        }
        field(50015; "Outstanding Net Kilos"; Decimal)
        {
            Caption = 'Outstanding Net Kilos';
            ToolTip = 'Specifies the value of the Outstanding Net Kilos field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50016; "Net kilos to Invoice"; Decimal)
        {
            Caption = 'Net kilos to Invoice';
            ToolTip = 'Specifies the value of the Net kilos to Invoice field.';
            DecimalPlaces = 0 : 5;
        }
        field(50017; "Net kilos to Ship"; Decimal)
        {
            Caption = 'Net kilos to Ship';
            ToolTip = 'Specifies the value of the Net kilos to Ship field.';
            DecimalPlaces = 0 : 5;
        }
        field(50018; "Outstanding Gross Kilos"; Decimal)
        {
            Caption = 'Outstanding Gross Kilos';
            ToolTip = 'Specifies the value of the Outstanding Gross Kilos field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50019; "Gross kilos to Invoice"; Decimal)
        {
            Caption = 'Gross kilos to Invoice';
            ToolTip = 'Specifies the value of the Gross kilos to Invoice field.';
            DecimalPlaces = 0 : 5;
        }
        field(50020; "Gross kilos to Ship"; Decimal)
        {
            Caption = 'Gross kilos to Ship';
            ToolTip = 'Specifies the value of the Gross kilos to Ship field.';
            DecimalPlaces = 0 : 5;
        }
        field(50021; "Net kilos (Base)"; Decimal)
        {
            Caption = 'Net kilos (Base)';
            ToolTip = 'Specifies the value of the Net kilos (Base) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
        }
        field(50022; "Outstanding Net Kilos (Base)"; Decimal)
        {
            Caption = 'Outstanding Net Kilos (Base)';
            ToolTip = 'Specifies the value of the Outstanding Net Kilos (Base) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50023; "Net kilos to Invoice (Base)"; Decimal)
        {
            Caption = 'Net kilos to Invoice (Base)';
            ToolTip = 'Specifies the value of the Net kilos to Invoice (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50024; "xCod. IVA Prod."; Code[10])
        {
            Caption = 'xCod. IVA Prod.';
            ToolTip = 'Specifies the value of the xCod. IVA Prod field.';
        }
        field(50025; "Net kilos to Ship (Base)"; Decimal)
        {
            Caption = 'Net kilos to Ship (Base)';
            ToolTip = 'Specifies the value of the Net kilos to Ship (Base) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50026; "NK Shipped Not Invd. (Base)"; Decimal)
        {
            Caption = 'NK Shipped Not Invd. (Base)';
            ToolTip = 'Specifies the value of the NK Shipped Not Invd. (Base) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50027; "Net Kilos Shipped (Base)"; Decimal)
        {
            Caption = 'Net Kilos Shipped (Base)';
            ToolTip = 'Specifies the value of the Net Kilos Shipped (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50028; "Net Kilos Invoiced (Base)"; Decimal)
        {
            Caption = 'Net Kilos Invoiced (Base)';
            ToolTip = 'Specifies the value of the Net Kilos Invoiced (Base) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50029; "Reserved net kilos (Base)"; Decimal)
        {
            Caption = 'Reserved net kilos (Base)';
            ToolTip = 'Specifies the value of the Reserved net kilos (Base) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50030; "Gross kilos (Base)"; Decimal)
        {
            Caption = 'Gross kilos (Base)';
            ToolTip = 'Specifies the value of the Gross kilos (Base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50031; "Outstanding Gross Kilos (Base)"; Decimal)
        {
            Caption = 'Outstanding Gross Kilos (Base)';
            ToolTip = 'Specifies the value of the Outstanding Gross Kilos (Base) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50032; "Gross Kilos to Invoice (Base)"; Decimal)
        {
            Caption = 'Gross Kilos to Invoice (Base)';
            ToolTip = 'Specifies the value of the Gross Kilos to Invoice (Base) field.';
            BlankZero = false;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50033; "Gross Kilos to Ship (Base)"; Decimal)
        {
            Caption = 'Gross Kilos to Ship (Base)';
            ToolTip = 'Specifies the value of the Gross Kilos to Ship (Base) field.';
            BlankZero = false;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50034; "GK Shipped Not Invd. (Base)"; Decimal)
        {
            Caption = 'GK Shipped Not Invd. (Base)';
            ToolTip = 'Specifies the value of the GK Shipped Not Invd. (Base) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50035; "Gross Kilos Shipped (Base)"; Decimal)
        {
            Caption = 'Gross Kilos Shipped (Base)';
            ToolTip = 'Specifies the value of the Gross Kilos Shipped (Base) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50036; "Gross kilos Invoiced (Base)"; Decimal)
        {
            Caption = 'Gross kilos Invoiced (Base)';
            ToolTip = 'Specifies the value of the Gross kilos Invoiced (Base) field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50037; "Reserved Gross kilos (Base)"; Decimal)
        {
            Caption = 'Reserved Gross kilos (Base)';
            ToolTip = 'Specifies the value of the Reserved Gross kilos (Base) field.';
        }
        field(50038; "NK Shipped Not Invoiced"; Decimal)
        {
            Caption = 'NK Shipped Not Invoiced';
            ToolTip = 'Specifies the value of the NK Shipped Not Invoiced field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50040; "Net Kilos Shipped"; Decimal)
        {
            Caption = 'Net Kilos Shipped';
            ToolTip = 'Specifies the value of the Net Kilos Shipped field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50041; "Net Kilos Invoiced"; Decimal)
        {
            Caption = 'Net Kilos Invoiced';
            ToolTip = 'Specifies the value of the Net Kilos Invoiced field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50042; "GK Shipped Not Invoiced"; Decimal)
        {
            Caption = 'GK Shipped Not Invoiced';
            ToolTip = 'Specifies the value of the GK Shipped Not Invoiced field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50044; "Gross Kilos Shipped"; Decimal)
        {
            Caption = 'Gross Kilos Shipped';
            ToolTip = 'Specifies the value of the Gross Kilos Shipped field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50045; "Gross Kilos Invoiced"; Decimal)
        {
            Caption = 'Gross Kilos Invoiced';
            ToolTip = 'Specifies the value of the Gross Kilos Invoiced field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50046; "Permiso de embarque"; Code[30])
        {
            Caption = 'Boarding permission';
            ToolTip = 'Specifies the value of the Boarding permission field.';
        }
        field(50047; "Cód. transportista"; Code[10])
        {
            Caption = 'Shipping Agent Code';
            ToolTip = 'Specifies the value of the Shipping Agent Code field.';
            TableRelation = "Shipping Agent";
        }
        field(50048; "Cód. contenedor"; Code[20])
        {
            Caption = 'Cód. contenedor';
            ToolTip = 'Specifies the value of the Cód. contenedor field.';
        }
        field(50049; Familia; Code[3])
        {
            Caption = 'Family';
            ToolTip = 'Specifies the value of the Family field.';
            TableRelation = "Familia producto";
        }
        field(50050; Subfamilia; Code[20])
        {
            Caption = 'Subfamily';
            ToolTip = 'Specifies the value of the Subfamily field.';
            TableRelation = "Subfamilia producto" WHERE("Family code" = FIELD(Familia));
        }
        field(50051; "% Dto. KN"; Decimal)
        {
            Caption = '% Dto. KN';
            ToolTip = 'Specifies the value of the % Dto. KN field.';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(50052; "% Dto. KB"; Decimal)
        {
            Caption = '% Dto. KB';
            ToolTip = 'Specifies the value of the % Dto. KB field.';
        }
        field(50053; "KN ajuste"; Decimal)
        {
            Caption = 'KN ajuste';
            ToolTip = 'Specifies the value of the KN ajuste field.';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(50054; "KB ajuste"; Decimal)
        {
            Caption = 'KB ajuste';
            ToolTip = 'Specifies the value of the KB ajuste field.';
        }
        field(50055; "Cód. concepto ajuste"; Code[10])
        {
            Caption = 'Cód. concepto ajuste';
            ToolTip = 'Specifies the value of the Cód. concepto ajuste field.';
            TableRelation = "AFIP Interface Register";
        }
        field(50056; "Cód. arancelario"; Code[20])
        {
            Caption = 'Tariff No.';
            ToolTip = 'Specifies the value of the Tariff No field.';
        }
        field(50059; "Número de Item"; Code[20])
        {
            Caption = 'Número de Item';
            ToolTip = 'Specifies the value of the Número de Item field.';
        }
        field(50060; "Número de Subitem"; Code[20])
        {
            Caption = 'Número de Subitem';
            ToolTip = 'Specifies the value of the Número de Subitem field.';
        }
        field(50061; "Lote origen"; Code[20])
        {
            Caption = 'Lote origen';
            ToolTip = 'Specifies the value of the Lote origen field.';
        }
        field(50062; "Línea ajustada"; Integer)
        {
            Caption = 'Línea ajustada';
            ToolTip = 'Specifies the value of the Línea ajustada field.';
        }
        field(50063; "KN Originales"; Decimal)
        {
            Caption = 'KN Originales';
            ToolTip = 'Specifies the value of the KN Originales field.';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(50064; "KB Originales"; Decimal)
        {
            Caption = 'KB Originales';
            ToolTip = 'Specifies the value of the KB Originales field.';
        }
        field(50065; "No. remito oficial"; Code[20])
        {
            Caption = 'No. remito oficial';
            ToolTip = 'Specifies the value of the No. remito oficial field.';
        }
        field(50066; "No. lín. remito oficial"; Integer)
        {
            Caption = 'No. lín. remito oficial';
            ToolTip = 'Specifies the value of the No. lín. remito oficial field.';
            BlankZero = true;
        }
        field(50069; "Importe USD"; Decimal)
        {
            Caption = 'Importe USD';
            ToolTip = 'Specifies the value of the Importe USD field.';
        }
        field(50070; "Puerto destino"; Code[10])
        {
            Caption = 'Puerto destino';
            ToolTip = 'Specifies the value of the Puerto destino field.';
            TableRelation = "Entry/Exit Point";
        }
        field(50071; "Cód. categorización"; Code[10])
        {
            Caption = 'Cód. categorización';
            ToolTip = 'Specifies the value of the Cód. categorización field.';
            TableRelation = "Categorizacion productos";
        }
        field(50076; "Cód. ingresos brutos"; Code[10])
        {
            Caption = 'Cód. ingresos brutos';
            ToolTip = 'Specifies the value of the Cód. ingresos brutos field.';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER("Ingresos Brutos"));
        }
        field(50077; "Seguimiento para trazabilidad"; Option)
        {
            Caption = 'Seguimiento para trazabilidad';
            ToolTip = 'Specifies the value of the Seguimiento para trazabilidad field.';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Post-Expo - Controlar contra DCL","No controlar contra DCL","Pre-Expo - Controlar contra DCL";
        }
        field(50079; "DCL application date formula"; Text[30])
        {
            Caption = 'Fórmula de aplicación de fechas de DCL';
            ToolTip = 'Specifies the value of the Fórmula de aplicación de fechas de DCL field.';
            DataClassification = ToBeClassified;
        }
        field(50080; "Importe DL"; Decimal)
        {
            Caption = 'Importe DL';
            ToolTip = 'Specifies the value of the Importe DL field.';
            DataClassification = ToBeClassified;
        }
        field(50081; "Sello Argentino"; Boolean)
        {
            Caption = 'Sello Argentino';
            ToolTip = 'Specifies the value of the Sello Argentino field.';
            DataClassification = ToBeClassified;
        }
        field(50082; "MSC"; Boolean)
        {
            Caption = 'MSC';
            ToolTip = 'Specifies the value of the MSC field.';
            DataClassification = ToBeClassified;
        }

        field(50140; "No. reparto"; Code[20])
        {
            Caption = 'No. reparto';
            ToolTip = 'Specifies the value of the No. reparto field.';
            DataClassification = ToBeClassified;
        }
        field(50141; "Linea reparto"; Integer)
        {
            Caption = 'Linea reparto';
            ToolTip = 'Specifies the value of the Linea reparto field.';
            DataClassification = ToBeClassified;
        }
        field(50142; "Ommit position validation"; Boolean)
        {
            Caption = 'Omitir validación de posición';
            ToolTip = 'Specifies the value of the Omitir validación de posición field.';
            DataClassification = ToBeClassified;
        }
        field(50508; Region; Option)
        {
            Caption = 'Region';
            ToolTip = 'Specifies the value of the Region field.';
            DataClassification = ToBeClassified;
            OptionMembers = "901 - CABA","902 - Buenos Aires","903 - Catamarca","904 - Córdoba","905 - Corrientes","906 - Chaco","907 - Chubut","908 - Entre Ríos","909 - Formosa","910 - Jujuy","911 - La Pampa","912 - La Rioja","913 - Mendoza","914 - Misiones","915 - Neuquén","916 - Río Negro","917 - Salta","918 - San Juan","919 - San Luis","920 - Santa Cruz","921 - Santa Fe","922 - Santiago del Estero","923 - Tierra del Fuego","924 -Tucumán";
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
        field(50600; "Source Document Type"; Option)
        {
            Caption = 'Source Document Type';
            ToolTip = 'Specifies the value of the Source Document Type field.';
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order";
        }
        field(50601; "Source No."; Code[20])
        {
            Caption = 'Source No.';
            ToolTip = 'Specifies the value of the Source No field.';
        }
        field(50700; "Old job no."; Code[20])
        {
            Caption = 'Old job no.';
            ToolTip = 'Specifies the value of the Old job no field.';
            TableRelation = Job;
        }
        field(50701; Provincia; Code[10])
        {
            Caption = 'Provincia';
            ToolTip = 'Specifies the value of the Provincia field.';
            TableRelation = Area;
        }
        field(50702; "No. despacho"; Code[10])
        {
            Caption = 'No. despacho';
            ToolTip = 'Specifies the value of the No. despacho field.';
        }
        field(50705; "Tipo Factura"; Option)
        {
            Caption = 'Tipo Factura';
            ToolTip = 'Specifies the value of the Tipo Factura field.';
            OptionMembers = Factura,"Nota Debito";
        }
    }
}
