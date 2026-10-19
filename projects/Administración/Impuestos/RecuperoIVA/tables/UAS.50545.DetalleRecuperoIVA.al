table 50545 "Detalle Recupero IVA"
{

    fields
    {
        field(1; "No. mov."; Integer)
        {
            Caption = 'No. mov.';
            ToolTip = 'Specifies the value of the No. mov field.';
            DataClassification = ToBeClassified;
            Description = 'Según tabla de comprobantes';
        }
        field(2; "Tipo de comprobante"; Code[3])
        {
            Caption = 'Tipo de comprobante';
            ToolTip = 'Specifies the value of the Tipo de comprobante field.';
            DataClassification = ToBeClassified;
            Description = 'Fto: AAAAMMDD';
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
        field(10; "No. linea"; Integer)
        {
            Caption = 'No. linea';
            ToolTip = 'Specifies the value of the No. linea field.';
            DataClassification = ToBeClassified;
        }
        field(11; Tipo; Option)
        {
            Caption = 'Tipo';
            ToolTip = 'Specifies the value of the Tipo field.';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,G/L Account,Item,Resource,Fixed Asset,Charge (Item)';
            OptionMembers = " ","G/L Account",Item,Resource,"Fixed Asset","Charge (Item)";
        }
        field(12; "No."; Code[20])
        {
            Caption = 'No.';
            ToolTip = 'Specifies the value of the No field.';
            DataClassification = ToBeClassified;
            TableRelation = IF (Tipo = CONST(Resource)) Resource."No." WHERE("No." = FIELD("No."))
            ELSE
            IF (Tipo = CONST(Item)) Item."No." WHERE("No." = FIELD("No."))
            ELSE
            IF (Tipo = CONST("Fixed Asset")) "Fixed Asset"."No." WHERE("No." = FIELD("No."));
        }
        field(13; Descripcion; Text[50])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';
            DataClassification = ToBeClassified;
        }
        field(14; Cantidad; Decimal)
        {
            Caption = 'Quantity';
            ToolTip = 'Specifies the value of the Quantity field.';
            DataClassification = ToBeClassified;
        }
        field(15; "Tipo afectación"; Option)
        {
            Caption = 'Tipo afectación';
            ToolTip = 'Specifies the value of the Tipo afectación field.';
            DataClassification = ToBeClassified;
            OptionMembers = " ",Directa,Indirecta;
        }
        field(16; "No. proyecto"; Code[20])
        {
            Caption = 'Job No.';
            ToolTip = 'Specifies the value of the Job No field.';
            DataClassification = ToBeClassified;
            TableRelation = Job;
        }
        field(17; "No. mov. relacionado"; Integer)
        {
            Caption = 'No. mov. relacionado';
            ToolTip = 'Specifies the value of the No. mov. relacionado field.';
            DataClassification = ToBeClassified;
            TableRelation = IF (Tipo = CONST(Resource)) "Res. Ledger Entry"."Entry No." WHERE("Entry No." = FIELD("No. mov. relacionado"))
            ELSE
            IF (Tipo = CONST(Item)) "Item Ledger Entry"."Entry No." WHERE("Entry No." = FIELD("No. mov. relacionado"))
            ELSE
            IF (Tipo = CONST("G/L Account")) "G/L Entry"."Entry No." WHERE("Entry No." = FIELD("No. mov. relacionado"));
        }
        field(20; "Importe Neto en $"; Decimal)
        {
            Caption = 'Importe Neto en $';
            ToolTip = 'Specifies the value of the Importe Neto en $ field.';
            DataClassification = ToBeClassified;
        }
        field(21; "Importe IVA Facturado en $"; Decimal)
        {
            Caption = 'Importe IVA Facturado en $';
            ToolTip = 'Specifies the value of the Importe IVA Facturado en $ field.';
            DataClassification = ToBeClassified;
        }
        field(22; "Importe IVA Computable"; Decimal)
        {
            Caption = 'Importe IVA Computable';
            ToolTip = 'Specifies the value of the Importe IVA Computable field.';
            DataClassification = ToBeClassified;
        }
        field(23; "Monto IVA Retenido"; Decimal)
        {
            Caption = 'Monto IVA Retenido';
            ToolTip = 'Specifies the value of the Monto IVA Retenido field.';
            DataClassification = ToBeClassified;
        }
        field(24; "Período de Pago"; Date)
        {
            Caption = 'Período de Pago';
            ToolTip = 'Specifies the value of the Período de Pago field.';
            DataClassification = ToBeClassified;
        }
        field(25; "Período DDJJ"; Date)
        {
            Caption = 'Período DDJJ';
            ToolTip = 'Specifies the value of the Período DDJJ field.';
            DataClassification = ToBeClassified;
        }
        field(28; "Código de Régimen"; Code[3])
        {
            Caption = 'Código de Régimen';
            ToolTip = 'Specifies the value of the Código de Régimen field.';
            DataClassification = ToBeClassified;
            Description = '3 enteros';
        }
        field(29; "Número de Certificado"; Code[18])
        {
            Caption = 'Número de Certificado';
            ToolTip = 'Specifies the value of the Número de Certificado field.';
            DataClassification = ToBeClassified;
            Description = '14 enteros';
        }
        field(30; "Motivo de no retención"; Code[1])
        {
            Caption = 'Motivo de no retención';
            ToolTip = 'Specifies the value of the Motivo de no retención field.';
            DataClassification = ToBeClassified;
            Description = 'Según tabla Motivos de no Ret.';
        }
        field(31; "R.G. Certificado de exclusión"; Code[2])
        {
            Caption = 'R.G. Certificado de exclusión';
            ToolTip = 'Specifies the value of the R.G. Certificado de exclusión field.';
            DataClassification = ToBeClassified;
            Description = 'Según tabla RG Certif. de Exclusión';
        }
        field(32; "Medios de Pago"; Text[20])
        {
            Caption = 'Medios de Pago';
            ToolTip = 'Specifies the value of the Medios de Pago field.';
            DataClassification = ToBeClassified;
            Description = 'Según tabla Medios de pago (cod. separados por ;)';
        }
        field(33; "Tipo de Rubro 7"; Code[3])
        {
            Caption = 'Tipo de Rubro 7';
            ToolTip = 'Specifies the value of the Tipo de Rubro 7 field.';
            DataClassification = ToBeClassified;
            Description = 'Según tabla Tipo Rubro 7';
        }
        field(34; "Ident. tipo de CF"; Code[10])
        {
            Caption = 'Ident. tipo de CF';
            ToolTip = 'Specifies the value of the Ident. tipo de CF field.';
            DataClassification = ToBeClassified;
            Description = 'D: Directo; I: Indirecto';
        }
        field(35; "Fecha pago IVA"; Date)
        {
            Caption = 'Fecha pago IVA';
            ToolTip = 'Specifies the value of the Fecha pago IVA field.';
            DataClassification = ToBeClassified;
        }
        field(36; "IVA para recupero"; Decimal)
        {
            Caption = 'IVA para recupero';
            ToolTip = 'Specifies the value of the IVA para recupero field.';
        }
        field(37; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(38; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(39; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';

        }
        field(40; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';

        }
        field(41; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 5 Code field.';

        }
        field(42; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 6 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 6 Code field.';

        }
        field(43; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 7 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 7 Code field.';

        }
        field(44; "Forma de reparto"; Option)
        {
            Caption = 'Forma de reparto';
            ToolTip = 'Specifies the value of the Forma de reparto field.';
            OptionMembers = " ",Estructura,"Por departamento","Por actividad";
        }
        field(45; "Criterio de reparto"; Option)
        {
            Caption = 'Criterio de reparto';
            ToolTip = 'Specifies the value of the Criterio de reparto field.';
            OptionMembers = " ","Por Dias marea","Por kilos","Por Importe";
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
        field(48; "Cod. ret. IVA"; Code[20])
        {
            Caption = 'Cod. ret. IVA';
            ToolTip = 'Specifies the value of the Cod. ret. IVA field.';
            DataClassification = ToBeClassified;
        }
        field(49; "Fecha ingreso stock"; Date)
        {
            Caption = 'Fecha ingreso stock';
            ToolTip = 'Specifies the value of the Fecha ingreso stock field.';
            DataClassification = ToBeClassified;
        }
        field(50; "IVA recuperado"; Decimal)
        {
            Caption = 'IVA recuperado';
            ToolTip = 'Specifies the value of the IVA recuperado field.';
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
            ToolTip = 'Specifies the value of the Posición Arancelaria field.';
            DataClassification = ToBeClassified;
        }
        field(52; "Lote origen"; Code[10])
        {
            Caption = 'Lote origen';
            ToolTip = 'Specifies the value of the Lote origen field.';
            DataClassification = ToBeClassified;
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
            DataClassification = ToBeClassified;
        }
        field(63; "TOTAL IVA Facturado en $"; Decimal)
        {
            Caption = 'TOTAL IVA Facturado en $';
            ToolTip = 'Specifies the value of the TOTAL IVA Facturado en $ field.';
            DataClassification = ToBeClassified;
        }
        field(64; "TOTAL neto Facturado en $"; Decimal)
        {
            Caption = 'TOTAL neto Facturado en $';
            ToolTip = 'Specifies the value of the TOTAL neto Facturado en $ field.';
            CalcFormula = Sum("VAT Entry".Base WHERE("Document No." = FIELD("No. documento interno"),
                                                      Reversed = FILTER(false),
                                                      "Tax Group Code" = FILTER(<> 'PER_IIBB' & <> 'PER_IVA' & <> 'EXENTO')));
            FieldClass = FlowField;
        }
        field(100; "No. registro recupero IVA"; Integer)
        {
            Caption = 'No. registro recupero IVA';
            ToolTip = 'Specifies the value of the No. registro recupero IVA field.';
            DataClassification = ToBeClassified;
        }
        field(101; "Cantidad recuperada"; Decimal)
        {
            Caption = 'Cantidad recuperada';
            ToolTip = 'Specifies the value of the Cantidad recuperada field.';
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
            Caption = 'Filtro No. mov. relacionado';
            ToolTip = 'Specifies the value of the Filtro No. mov. relacionado field.';
            FieldClass = FlowFilter;
        }
        field(103; "No computable"; Boolean)
        {
            Caption = 'No computable';
            ToolTip = 'Specifies the value of the No computable field.';
            CalcFormula = Lookup("Vendor Ledger Entry"."No computable" WHERE("Document No." = FIELD("No. documento interno")));
            FieldClass = FlowField;
        }
        field(104; "No. recupero IVA"; Integer)
        {
            Caption = 'No. recupero IVA';
            ToolTip = 'Specifies the value of the No. recupero IVA field.';
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

