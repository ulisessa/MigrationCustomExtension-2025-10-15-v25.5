table 50546 "Recupero IVA Rubro 7"
{
    fields
    {
        field(1; "No. mov."; Integer)
        {
            Caption = 'No. mov.';
            ToolTip = 'Specifies the value of the No. mov field.';
            DataClassification = ToBeClassified;
        }
        field(2; "Tipo de comprobante"; Code[3])
        {
            Caption = 'Tipo de comprobante';
            ToolTip = 'Specifies the value of the Tipo de comprobante field.';
            DataClassification = ToBeClassified;
        }
        field(3; "Fecha de comprobante"; Date)
        {
            Caption = 'Fecha de comprobante';
            ToolTip = 'Specifies the value of the Fecha de comprobante field.';
            DataClassification = ToBeClassified;
        }
        field(4; "Punto de venta"; Code[5])
        {
            Caption = 'Punto de venta';
            ToolTip = 'Specifies the value of the Punto de venta field.';
            DataClassification = ToBeClassified;
        }
        field(5; "Número de comprobante"; Code[16])
        {
            Caption = 'Número de comprobante';
            ToolTip = 'Specifies the value of the Número de comprobante field.';
            DataClassification = ToBeClassified;
        }
        field(6; "CUIT Emisor"; Code[11])
        {
            Caption = 'CUIT Emisor';
            ToolTip = 'Specifies the value of the CUIT Emisor field.';
            DataClassification = ToBeClassified;
        }
        field(7; "Denominación emisor"; Text[40])
        {
            Caption = 'Denominación emisor';
            ToolTip = 'Specifies the value of the Denominación emisor field.';
            DataClassification = ToBeClassified;
        }
        field(8; "CUIT Vendedor"; Code[11])
        {
            Caption = 'CUIT Vendedor';
            ToolTip = 'Specifies the value of the CUIT Vendedor field.';
            DataClassification = ToBeClassified;
        }
        field(9; "Denominación vendedor"; Text[40])
        {
            Caption = 'Denominación vendedor';
            ToolTip = 'Specifies the value of the Denominación vendedor field.';
            DataClassification = ToBeClassified;
        }
        field(10; "Importe Neto en $"; Decimal)
        {
            Caption = 'Importe Neto en $';
            ToolTip = 'Specifies the value of the Importe Neto en $ field.';
            DataClassification = ToBeClassified;
        }
        field(11; "Importe IVA Facturado en $"; Decimal)
        {
            Caption = 'Importe IVA Facturado en $';
            ToolTip = 'Specifies the value of the Importe IVA Facturado en $ field.';
            DataClassification = ToBeClassified;
        }
        field(12; "Importe IVA Computable vinc. a"; Decimal)
        {
            Caption = 'Importe IVA Computable vinc. a';
            ToolTip = 'Specifies the value of the Importe IVA Computable vinc. a field.';
            DataClassification = ToBeClassified;
            Description = 'siempre en cero';
        }
        field(13; "Importe IVA Computable"; Decimal)
        {
            Caption = 'Importe IVA Computable';
            ToolTip = 'Specifies the value of the Importe IVA Computable field.';
            DataClassification = ToBeClassified;
        }
        field(14; "Monto IVA Retenido"; Decimal)
        {
            Caption = 'Monto IVA Retenido';
            ToolTip = 'Specifies the value of the Monto IVA Retenido field.';
            DataClassification = ToBeClassified;
        }
        field(15; "Período de Pago"; Date)
        {
            Caption = 'Período de Pago';
            ToolTip = 'Specifies the value of the Período de Pago field.';
            DataClassification = ToBeClassified;
        }
        field(16; "Período DDJJ"; Date)
        {
            Caption = 'Período DDJJ';
            ToolTip = 'Specifies the value of the Período DDJJ field.';
            DataClassification = ToBeClassified;
        }
        field(17; "Descripción del Bien"; Text[50])
        {
            Caption = 'Descripción del Bien';
            ToolTip = 'Specifies the value of the Descripción del Bien field.';
            DataClassification = ToBeClassified;
        }
        field(18; "IVA Depositado en CBU"; Decimal)
        {
            Caption = 'IVA Depositado en CBU';
            ToolTip = 'Specifies the value of the IVA Depositado en CBU field.';
            DataClassification = ToBeClassified;
        }
        field(19; "Código de Régimen"; Code[3])
        {
            Caption = 'Código de Régimen';
            ToolTip = 'Specifies the value of the Código de Régimen field.';
            DataClassification = ToBeClassified;
        }
        field(20; "Número de Certificado"; Code[18])
        {
            Caption = 'Número de Certificado';
            ToolTip = 'Specifies the value of the Número de Certificado field.';
            DataClassification = ToBeClassified;
        }
        field(21; "Motivo de no retención"; Code[1])
        {
            Caption = 'Motivo de no retención';
            ToolTip = 'Specifies the value of the Motivo de no retención field.';
            DataClassification = ToBeClassified;
        }
        field(22; "R.G. Certificado de exclusión"; Code[2])
        {
            Caption = 'R.G. Certificado de exclusión';
            ToolTip = 'Specifies the value of the R.G. Certificado de exclusión field.';
            DataClassification = ToBeClassified;
        }
        field(23; "Medios de Pago"; Text[20])
        {
            Caption = 'Medios de Pago';
            ToolTip = 'Specifies the value of the Medios de Pago field.';
            DataClassification = ToBeClassified;
        }
        field(24; "Tipo de Rubro 7"; Code[3])
        {
            Caption = 'Tipo de Rubro 7';
            ToolTip = 'Specifies the value of the Tipo de Rubro 7 field.';
            DataClassification = ToBeClassified;
        }
        field(25; "Tipo de afectacion"; Option)
        {
            Caption = 'Tipo de afectacion';
            ToolTip = 'Specifies the value of the Tipo de afectacion field.';
            DataClassification = ToBeClassified;
            OptionMembers = " ",Directa,Indirecta;
        }
        field(26; "IVA para recupero"; Decimal)
        {
            Caption = 'IVA para recupero';
            ToolTip = 'Specifies the value of the IVA para recupero field.';
            DataClassification = ToBeClassified;
        }
        field(27; "IVA recuperado"; Decimal)
        {
            Caption = 'IVA recuperado';
            ToolTip = 'Specifies the value of the IVA recuperado field.';
            DataClassification = ToBeClassified;
        }
        field(28; "Coeficiente aplicado"; Decimal)
        {
            Caption = 'Coeficiente aplicado';
            ToolTip = 'Specifies the value of the Coeficiente aplicado field.';
            DataClassification = ToBeClassified;
        }
        field(46; "No. documento interno"; Code[20])
        {
            Caption = 'No. documento interno';
            ToolTip = 'Specifies the value of the No. documento interno field.';
            DataClassification = ToBeClassified;
        }
        field(47; "Orden pago"; Code[20])
        {
            Caption = 'Orden pago';
            ToolTip = 'Specifies the value of the Orden pago field.';
            DataClassification = ToBeClassified;
        }
        field(48; "Lote origen"; Code[10])
        {
            Caption = 'Lote origen';
            ToolTip = 'Specifies the value of the Lote origen field.';
            DataClassification = ToBeClassified;
        }
        field(50; "Documento expo relacionado"; Code[20])
        {
            Caption = 'Documento expo relacionado';
            ToolTip = 'Specifies the value of the Documento expo relacionado field.';
            DataClassification = ToBeClassified;
        }
        field(51; "Posicion Arancelaria"; Code[12])
        {
            Caption = 'Posición Arancelaria';
            ToolTip = 'Specifies the value of the Posición Arancelaria field.';
            DataClassification = ToBeClassified;
        }
        field(52; Proyecto; Code[20])
        {
            Caption = 'Proyecto';
            ToolTip = 'Specifies the value of the Proyecto field.';
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(53; "No. linea"; Integer)
        {
            Caption = 'No. linea';
            ToolTip = 'Specifies the value of the No. linea field.';
            DataClassification = ToBeClassified;
        }
        field(54; Tipo; Option)
        {
            Caption = 'Tipo';
            ToolTip = 'Specifies the value of the Tipo field.';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,G/L Account,Item,Resource,Fixed Asset,Charge (Item)';
            OptionMembers = " ","G/L Account",Item,Resource,"Fixed Asset","Charge (Item)";
        }
        field(55; "No."; Code[20])
        {
            Caption = 'No.';
            ToolTip = 'Specifies the value of the No field.';
            DataClassification = ToBeClassified;
            TableRelation = IF (Tipo = CONST(Resource)) Resource."No." WHERE("No." = FIELD("No."))
            ELSE
            IF (Tipo = CONST(Item)) Item."No." WHERE("No." = FIELD("No."));
        }
        field(56; "No. mov. relacionado"; Integer)
        {
            Caption = 'No. mov. relacionado';
            ToolTip = 'Specifies the value of the No. mov. relacionado field.';
            DataClassification = ToBeClassified;
            TableRelation = IF (Tipo = CONST(Item)) "Item Ledger Entry"."Entry No." WHERE("Entry No." = FIELD("No. mov. relacionado"));
        }
        field(57; "Cantidad mov. relacionado"; Decimal)
        {
            Caption = 'Cantidad mov. relacionado';
            ToolTip = 'Specifies the value of the Cantidad mov. relacionado field.';
        }
        field(58; "Cantidad mov. compra"; Decimal)
        {
            Caption = 'Cantidad mov. compra';
            ToolTip = 'Specifies the value of the Cantidad mov. compra field.';
            DataClassification = ToBeClassified;
        }
        field(59; "Porcentaje aplicado"; Decimal)
        {
            Caption = 'Porcentaje aplicado';
            ToolTip = 'Specifies the value of the Porcentaje aplicado field.';
            DataClassification = ToBeClassified;
        }
        field(60; "Fecha mov. relacionado"; Date)
        {
            Caption = 'Fecha mov. relacionado';
            ToolTip = 'Specifies the value of the Fecha mov. relacionado field.';
        }
        field(61; "Descripción contable"; Text[30])
        {
            Caption = 'Descripción contable';
            ToolTip = 'Specifies the value of the Descripción contable field.';
            DataClassification = ToBeClassified;
        }
        field(62; "TOTAL Facturado en $"; Decimal)
        {
            Caption = 'TOTAL Facturado en $';
            ToolTip = 'Specifies the value of the TOTAL Facturado en $ field.';
            CalcFormula = - Sum("Vendor Ledger Entry"."Purchase (LCY)" WHERE("Document No." = FIELD("No. documento interno")));
            FieldClass = FlowField;
        }
        field(63; "TOTAL IVA Facturado en $"; Decimal)
        {
            Caption = 'TOTAL IVA Facturado en $';
            ToolTip = 'Specifies the value of the TOTAL IVA Facturado en $ field.';
            CalcFormula = Sum("VAT Entry".Amount WHERE("Document No." = FIELD("No. documento interno"),
                                                        "VAT %" = FILTER(<> 0)));
            FieldClass = FlowField;
        }
        field(64; "TOTAL neto Facturado en $"; Decimal)
        {
            Caption = 'TOTAL neto Facturado en $';
            ToolTip = 'Specifies the value of the TOTAL neto Facturado en $ field.';
            CalcFormula = Sum("VAT Entry".Base WHERE("Document No." = FIELD("No. documento interno"),
                                                      Reversed = FILTER(false),
                                                      "Tax Group Code" = FILTER(<> 'PER_IIBB' & <> 'PER_IVA' & <> 'EXENTO')));
            FieldClass = FlowField;

            trigger OnLookup()
            var
                l_rstVE: Record "VAT Entry";
                l_pgeVE: Page "VAT Entries";
            begin
                Clear(l_rstVE);
                l_rstVE.SetRange("Document No.", "No. documento interno");
                l_rstVE.SetRange(Reversed, false);
                l_rstVE.SetFilter("Tax Group Code", '<>%1&<>%2', 'PER_IIBB', 'PER_IVA');
                Clear(l_pgeVE);
                l_pgeVE.SetTableView(l_rstVE);
                l_pgeVE.LookupMode(true);
                l_pgeVE.Run;
            end;
        }
        field(100; "No. registro recupero IVA"; Integer)
        {
            Caption = 'No. registro recupero IVA';
            ToolTip = 'Specifies the value of the No. registro recupero IVA field.';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No. mov.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

