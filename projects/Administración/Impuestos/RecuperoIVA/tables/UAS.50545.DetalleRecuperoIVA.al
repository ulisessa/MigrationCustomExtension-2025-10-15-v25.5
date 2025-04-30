table 50545 "Detalle Recupero IVA"
{

    fields
    {
        field(1; "No. mov."; Integer)
        {
            Caption = 'No. mov.';
            DataClassification = ToBeClassified;
            Description = 'Según tabla de comprobantes';
        }
        field(2; "Tipo de comprobante"; Code[3])
        {
            DataClassification = ToBeClassified;
            Description = 'Fto: AAAAMMDD';
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
        field(10; "No. linea"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(11; Tipo; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,G/L Account,Item,Resource,Fixed Asset,Charge (Item)';
            OptionMembers = " ","G/L Account",Item,Resource,"Fixed Asset","Charge (Item)";
        }
        field(12; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = IF (Tipo = CONST(Resource)) Resource."No." WHERE("No." = FIELD("No."))
            ELSE
            IF (Tipo = CONST(Item)) Item."No." WHERE("No." = FIELD("No."))
            ELSE
            IF (Tipo = CONST("Fixed Asset")) "Fixed Asset"."No." WHERE("No." = FIELD("No."));
        }
        field(13; Descripcion; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(14; Cantidad; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Tipo afectación"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Directa,Indirecta;
        }
        field(16; "No. proyecto"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;
        }
        field(17; "No. mov. relacionado"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = IF (Tipo = CONST(Resource)) "Res. Ledger Entry"."Entry No." WHERE("Entry No." = FIELD("No. mov. relacionado"))
            ELSE
            IF (Tipo = CONST(Item)) "Item Ledger Entry"."Entry No." WHERE("Entry No." = FIELD("No. mov. relacionado"))
            ELSE
            IF (Tipo = CONST("G/L Account")) "G/L Entry"."Entry No." WHERE("Entry No." = FIELD("No. mov. relacionado"));
        }
        field(20; "Importe Neto en $"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Importe IVA Facturado en $"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Importe IVA Computable"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Monto IVA Retenido"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Período de Pago"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Período DDJJ"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Código de Régimen"; Code[3])
        {
            DataClassification = ToBeClassified;
            Description = '3 enteros';
        }
        field(29; "Número de Certificado"; Code[18])
        {
            DataClassification = ToBeClassified;
            Description = '14 enteros';
        }
        field(30; "Motivo de no retención"; Code[1])
        {
            DataClassification = ToBeClassified;
            Description = 'Según tabla Motivos de no Ret.';
        }
        field(31; "R.G. Certificado de exclusión"; Code[2])
        {
            DataClassification = ToBeClassified;
            Description = 'Según tabla RG Certif. de Exclusión';
        }
        field(32; "Medios de Pago"; Text[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Según tabla Medios de pago (cod. separados por ;)';
        }
        field(33; "Tipo de Rubro 7"; Code[3])
        {
            DataClassification = ToBeClassified;
            Description = 'Según tabla Tipo Rubro 7';
        }
        field(34; "Ident. tipo de CF"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'D: Directo; I: Indirecto';
        }
        field(35; "Fecha pago IVA"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(36; "IVA para recupero"; Decimal)
        {
        }
        field(37; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(38; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(39; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(40; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
        }
        field(41; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));
        }
        field(42; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 6 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));
        }
        field(43; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 7 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));
        }
        field(44; "Forma de reparto"; Option)
        {
            OptionMembers = " ",Estructura,"Por departamento","Por actividad";
        }
        field(45; "Criterio de reparto"; Option)
        {
            OptionMembers = " ","Por Dias marea","Por kilos","Por Importe";
        }
        field(46; "No. documento interno"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(47; "Orden pago"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(48; "Cod. ret. IVA"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(49; "Fecha ingreso stock"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50; "IVA recuperado"; Decimal)
        {
            CalcFormula = Sum("Recupero IVA Rubro 7"."IVA recuperado" WHERE("Número de comprobante" = FIELD("Número de comprobante"),
                                                                             "Tipo de comprobante" = FIELD("Tipo de comprobante"),
                                                                             "Punto de venta" = FIELD("Punto de venta"),
                                                                             "Código de Régimen" = FIELD("Código de Régimen"),
                                                                             "No. documento interno" = FIELD("No. documento interno"),
                                                                             "No. linea" = FIELD("No. linea"),
                                                                             "No. mov. relacionado" = FIELD("Filtro No. mov. relacionado")));
            FieldClass = FlowField;
        }
        field(51; "Posicion Arancelaria"; Code[12])
        {
            Caption = 'Posición Arancelaria';
            DataClassification = ToBeClassified;
        }
        field(52; "Lote origen"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(61; "Descripción contable"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(62; "TOTAL Facturado en $"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(63; "TOTAL IVA Facturado en $"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(64; "TOTAL neto Facturado en $"; Decimal)
        {
            CalcFormula = Sum("VAT Entry".Base WHERE("Document No." = FIELD("No. documento interno"),
                                                      Reversed = FILTER(false),
                                                      "Tax Group Code" = FILTER(<> 'PER_IIBB' & <> 'PER_IVA' & <> 'EXENTO')));
            FieldClass = FlowField;
        }
        field(100; "No. registro recupero IVA"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(101; "Cantidad recuperada"; Decimal)
        {
            CalcFormula = Sum("Recupero IVA Rubro 7"."Cantidad mov. relacionado" WHERE("Número de comprobante" = FIELD("Número de comprobante"),
                                                                                        "Tipo de comprobante" = FIELD("Tipo de comprobante"),
                                                                                        "Punto de venta" = FIELD("Punto de venta"),
                                                                                        "Código de Régimen" = FIELD("Código de Régimen"),
                                                                                        "No. documento interno" = FIELD("No. documento interno"),
                                                                                        "No. linea" = FIELD("No. linea")));
            FieldClass = FlowField;
        }
        field(102; "Filtro No. mov. relacionado"; Integer)
        {
            FieldClass = FlowFilter;
        }
        field(103; "No computable"; Boolean)
        {
            CalcFormula = Lookup("Vendor Ledger Entry"."No computable" WHERE("Document No." = FIELD("No. documento interno")));
            FieldClass = FlowField;
        }
        field(104; "No. recupero IVA"; Integer)
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

