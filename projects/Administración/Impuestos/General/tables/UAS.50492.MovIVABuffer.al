table 50492 "Mov. IVA Buffer"
{
    LookupPageID = "VAT Entries";

    fields
    {
        field(1; "Fecha documento"; Date)
        {
        }
        field(2; "Tipo comprobante"; Text[30])
        {
        }
        field(3; "Número comprobante"; Text[30])
        {
        }
        field(4; "Nombre proveedor"; Text[200])
        {
        }
        field(5; CUIT; Code[20])
        {
        }
        field(6; "Importe total operación"; Decimal)
        {
        }
        field(7; Gravado; Decimal)
        {
        }
        field(8; "Exentos y no gravados"; Decimal)
        {
        }
        field(9; "Importaciones/Exportaciones"; Decimal)
        {
        }
        field(10; "Crédito fiscal 21%"; Decimal)
        {
        }
        field(11; "Crédito fiscal 27%"; Decimal)
        {
        }
        field(12; "Crédito fiscal 10,5%"; Decimal)
        {
        }
        field(13; "No computable 10,5"; Decimal)
        {
        }
        field(14; "No computable 21"; Decimal)
        {
        }
        field(15; Otros; Decimal)
        {
        }
        field(16; Cerrado; Boolean)
        {
        }
        field(17; "Mes DDJJ"; Text[30])
        {
        }
        field(18; "No. despacho"; Text[30])
        {
        }
        field(19; Computable; Boolean)
        {
        }
        field(20; "Saldo a favor IVA"; Decimal)
        {
            Caption = 'Saldo a favor IVA';
        }
        field(21; "Per IIBB"; Decimal)
        {
            Caption = 'Per IIBB';
        }
        field(22; "Tasa GasOil"; Decimal)
        {
            Caption = 'Tasa GasOil';
        }
        field(23; "Documento original"; Code[20])
        {
        }
        field(24; Divisa; Code[10])
        {
        }
        field(25; "Tipo cambio"; Decimal)
        {
        }
        field(26; "IVA Pagado"; Boolean)
        {
        }
        field(27; "Fecha contable"; Date)
        {
        }
        field(28; "Fecha pago"; Date)
        {
        }
        field(29; "Importe retención"; Decimal)
        {
        }
        field(30; "Motivo no retención"; Code[10])
        {
        }
        field(31; Actividad; Text[50])
        {
        }
        field(32; "Importe pendiente Pesos"; Decimal)
        {
        }
        field(33; "IVA Recuperado"; Boolean)
        {
        }
        field(34; "Crédito fiscal 2,5%"; Decimal)
        {
        }
        field(35; "Código documento"; Code[10])
        {
        }
        field(36; "Tipo retención"; Code[10])
        {
        }
        field(37; "CAE/CAI"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(38; "Fecha vencimiento pago"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(39; "Tipo documento interno"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(40; "VAT Prod. Posting Group"; Code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            DataClassification = ToBeClassified;
            Editable = true;
            TableRelation = "VAT Product Posting Group";
        }
    }

    keys
    {
        key(Key1; "Fecha documento", CUIT, "Tipo comprobante", "Número comprobante")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Clie: Record Customer;
        Prov: Record Vendor;
        ConfCG: Record "General Ledger Setup";
        LeeConfCG: Boolean;
        ConfRegistroIVA: Record "VAT Posting Setup";

    [Scope('OnPrem')]
    procedure Navigate()
    var
        NavForm: Page Navigate;
    begin
        NavForm.SetDoc("Fecha contable", "Documento original");
        NavForm.Run;
    end;
}

