table 50546 "Recupero IVA Rubro 7"
{
    fields
    {
        field(1; "No. mov."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Tipo de comprobante"; Code[3])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Fecha de comprobante"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Punto de venta"; Code[5])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Número de comprobante"; Code[16])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "CUIT Emisor"; Code[11])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Denominación emisor"; Text[40])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "CUIT Vendedor"; Code[11])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Denominación vendedor"; Text[40])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Importe Neto en $"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Importe IVA Facturado en $"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Importe IVA Computable vinc. a"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'siempre en cero';
        }
        field(13; "Importe IVA Computable"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Monto IVA Retenido"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Período de Pago"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Período DDJJ"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Descripción del Bien"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "IVA Depositado en CBU"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Código de Régimen"; Code[3])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Número de Certificado"; Code[18])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Motivo de no retención"; Code[1])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "R.G. Certificado de exclusión"; Code[2])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Medios de Pago"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Tipo de Rubro 7"; Code[3])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Tipo de afectacion"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Directa,Indirecta;
        }
        field(26; "IVA para recupero"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "IVA recuperado"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Coeficiente aplicado"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(46; "No. documento interno"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(47; "Orden pago"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(48; "Lote origen"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50; "Documento expo relacionado"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(51; "Posicion Arancelaria"; Code[12])
        {
            Caption = 'Posición Arancelaria';
            DataClassification = ToBeClassified;
        }
        field(52; Proyecto; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(53; "No. linea"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(54; Tipo; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,G/L Account,Item,Resource,Fixed Asset,Charge (Item)';
            OptionMembers = " ","G/L Account",Item,Resource,"Fixed Asset","Charge (Item)";
        }
        field(55; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = IF (Tipo = CONST(Resource)) Resource."No." WHERE("No." = FIELD("No."))
            ELSE
            IF (Tipo = CONST(Item)) Item."No." WHERE("No." = FIELD("No."));
        }
        field(56; "No. mov. relacionado"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = IF (Tipo = CONST(Item)) "Item Ledger Entry"."Entry No." WHERE("Entry No." = FIELD("No. mov. relacionado"));
        }
        field(57; "Cantidad mov. relacionado"; Decimal)
        {
        }
        field(58; "Cantidad mov. compra"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(59; "Porcentaje aplicado"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(60; "Fecha mov. relacionado"; Date)
        {
        }
        field(61; "Descripción contable"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(62; "TOTAL Facturado en $"; Decimal)
        {
            CalcFormula = - Sum("Vendor Ledger Entry"."Purchase (LCY)" WHERE("Document No." = FIELD("No. documento interno")));
            FieldClass = FlowField;
        }
        field(63; "TOTAL IVA Facturado en $"; Decimal)
        {
            CalcFormula = Sum("VAT Entry".Amount WHERE("Document No." = FIELD("No. documento interno"),
                                                        "VAT %" = FILTER(<> 0)));
            FieldClass = FlowField;
        }
        field(64; "TOTAL neto Facturado en $"; Decimal)
        {
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

