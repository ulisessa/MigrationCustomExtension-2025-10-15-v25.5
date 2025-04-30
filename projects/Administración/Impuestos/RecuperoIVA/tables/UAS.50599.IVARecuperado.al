table 50599 "IVA Recuperado"
{

    fields
    {
        field(1; "Tipo de comprobante"; Code[3])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Fecha de comprobante"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Punto de venta"; Code[5])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Número de comprobante"; Code[16])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "CUIT Emisor"; Code[11])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Denominación emisor"; Text[40])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "CUIT Vendedor"; Code[11])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Denominación vendedor"; Text[40])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Importe Neto en $"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Importe IVA Facturado en $"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Importe IVA Computable vinc. a"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'siempre en cero';
        }
        field(12; "Importe IVA Computable"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Monto IVA Retenido"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Período de Pago"; Code[6])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Período DDJJ"; Code[6])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Descripción del Bien"; Text[40])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "IVA Depositado en CBU"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Código de Régimen"; Code[3])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Número de Certificado"; Code[14])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Motivo de no retención"; Code[1])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "R.G. Certificado de exclusión"; Code[2])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Medios de Pago"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Tipo de Rubro 7"; Code[3])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Ident. tipo de CF"; Code[10])
        {
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

