table 50599 "IVA Recuperado"
{

    fields
    {
        field(1; "Tipo de comprobante"; Code[3])
        {
            Caption = 'Tipo de comprobante';
            ToolTip = 'Specifies the value of the Tipo de comprobante field.';
            DataClassification = ToBeClassified;
        }
        field(2; "Fecha de comprobante"; Date)
        {
            Caption = 'Fecha de comprobante';
            ToolTip = 'Specifies the value of the Fecha de comprobante field.';
            DataClassification = ToBeClassified;
        }
        field(3; "Punto de venta"; Code[5])
        {
            Caption = 'Punto de venta';
            ToolTip = 'Specifies the value of the Punto de venta field.';
            DataClassification = ToBeClassified;
        }
        field(4; "Número de comprobante"; Code[16])
        {
            Caption = 'Número de comprobante';
            ToolTip = 'Specifies the value of the Número de comprobante field.';
            DataClassification = ToBeClassified;
        }
        field(5; "CUIT Emisor"; Code[11])
        {
            Caption = 'CUIT Emisor';
            ToolTip = 'Specifies the value of the CUIT Emisor field.';
            DataClassification = ToBeClassified;
        }
        field(6; "Denominación emisor"; Text[40])
        {
            Caption = 'Denominación emisor';
            ToolTip = 'Specifies the value of the Denominación emisor field.';
            DataClassification = ToBeClassified;
        }
        field(7; "CUIT Vendedor"; Code[11])
        {
            Caption = 'CUIT Vendedor';
            ToolTip = 'Specifies the value of the CUIT Vendedor field.';
            DataClassification = ToBeClassified;
        }
        field(8; "Denominación vendedor"; Text[40])
        {
            Caption = 'Denominación vendedor';
            ToolTip = 'Specifies the value of the Denominación vendedor field.';
            DataClassification = ToBeClassified;
        }
        field(9; "Importe Neto en $"; Decimal)
        {
            Caption = 'Importe Neto en $';
            ToolTip = 'Specifies the value of the Importe Neto en $ field.';
            DataClassification = ToBeClassified;
        }
        field(10; "Importe IVA Facturado en $"; Decimal)
        {
            Caption = 'Importe IVA Facturado en $';
            ToolTip = 'Specifies the value of the Importe IVA Facturado en $ field.';
            DataClassification = ToBeClassified;
        }
        field(11; "Importe IVA Computable vinc. a"; Decimal)
        {
            Caption = 'Importe IVA Computable vinc. a';
            ToolTip = 'Specifies the value of the Importe IVA Computable vinc. a field.';
            DataClassification = ToBeClassified;
            Description = 'siempre en cero';
        }
        field(12; "Importe IVA Computable"; Decimal)
        {
            Caption = 'Importe IVA Computable';
            ToolTip = 'Specifies the value of the Importe IVA Computable field.';
            DataClassification = ToBeClassified;
        }
        field(13; "Monto IVA Retenido"; Decimal)
        {
            Caption = 'Monto IVA Retenido';
            ToolTip = 'Specifies the value of the Monto IVA Retenido field.';
            DataClassification = ToBeClassified;
        }
        field(14; "Período de Pago"; Code[6])
        {
            Caption = 'Período de Pago';
            ToolTip = 'Specifies the value of the Período de Pago field.';
            DataClassification = ToBeClassified;
        }
        field(15; "Período DDJJ"; Code[6])
        {
            Caption = 'Período DDJJ';
            ToolTip = 'Specifies the value of the Período DDJJ field.';
            DataClassification = ToBeClassified;
        }
        field(16; "Descripción del Bien"; Text[40])
        {
            Caption = 'Descripción del Bien';
            ToolTip = 'Specifies the value of the Descripción del Bien field.';
            DataClassification = ToBeClassified;
        }
        field(17; "IVA Depositado en CBU"; Decimal)
        {
            Caption = 'IVA Depositado en CBU';
            ToolTip = 'Specifies the value of the IVA Depositado en CBU field.';
            DataClassification = ToBeClassified;
        }
        field(18; "Código de Régimen"; Code[3])
        {
            Caption = 'Código de Régimen';
            ToolTip = 'Specifies the value of the Código de Régimen field.';
            DataClassification = ToBeClassified;
        }
        field(19; "Número de Certificado"; Code[14])
        {
            Caption = 'Número de Certificado';
            ToolTip = 'Specifies the value of the Número de Certificado field.';
            DataClassification = ToBeClassified;
        }
        field(20; "Motivo de no retención"; Code[1])
        {
            Caption = 'Motivo de no retención';
            ToolTip = 'Specifies the value of the Motivo de no retención field.';
            DataClassification = ToBeClassified;
        }
        field(21; "R.G. Certificado de exclusión"; Code[2])
        {
            Caption = 'R.G. Certificado de exclusión';
            ToolTip = 'Specifies the value of the R.G. Certificado de exclusión field.';
            DataClassification = ToBeClassified;
        }
        field(22; "Medios de Pago"; Text[20])
        {
            Caption = 'Medios de Pago';
            ToolTip = 'Specifies the value of the Medios de Pago field.';
            DataClassification = ToBeClassified;
        }
        field(23; "Tipo de Rubro 7"; Code[3])
        {
            Caption = 'Tipo de Rubro 7';
            ToolTip = 'Specifies the value of the Tipo de Rubro 7 field.';
            DataClassification = ToBeClassified;
        }
        field(24; "Ident. tipo de CF"; Code[10])
        {
            Caption = 'Ident. tipo de CF';
            ToolTip = 'Specifies the value of the Ident. tipo de CF field.';
            DataClassification = ToBeClassified;
            Description = 'D: Directo; I: Indirecto';
        }
    }

    keys
    {
        key(Key1; "Medios de Pago", "Número de comprobante", "Denominación emisor")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

