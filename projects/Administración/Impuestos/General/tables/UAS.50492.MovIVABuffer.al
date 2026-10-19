table 50492 "Mov. IVA Buffer"
{
    LookupPageID = "VAT Entries";

    fields
    {
        field(1; "Fecha documento"; Date)
        {
            Caption = 'Fecha documento';
            ToolTip = 'Specifies the value of the Fecha documento field.';
        }
        field(2; "Tipo comprobante"; Text[30])
        {
            Caption = 'Tipo comprobante';
            ToolTip = 'Specifies the value of the Tipo comprobante field.';
        }
        field(3; "Número comprobante"; Text[30])
        {
            Caption = 'Número comprobante';
            ToolTip = 'Specifies the value of the Número comprobante field.';
        }
        field(4; "Nombre proveedor"; Text[200])
        {
            Caption = 'Nombre proveedor';
            ToolTip = 'Specifies the value of the Nombre proveedor field.';
        }
        field(5; CUIT; Code[20])
        {
            Caption = 'VAT Registration No.';
            ToolTip = 'Specifies the value of the VAT Registration No field.';
        }
        field(6; "Importe total operación"; Decimal)
        {
            Caption = 'Importe total operación';
            ToolTip = 'Specifies the value of the Importe total operación field.';
        }
        field(7; Gravado; Decimal)
        {
            Caption = 'Gravado';
            ToolTip = 'Specifies the value of the Gravado field.';
        }
        field(8; "Exentos y no gravados"; Decimal)
        {
            Caption = 'Exentos y no gravados';
            ToolTip = 'Specifies the value of the Exentos y no gravados field.';
        }
        field(9; "Importaciones/Exportaciones"; Decimal)
        {
            Caption = 'Importaciones/Exportaciones';
            ToolTip = 'Specifies the value of the Importaciones/Exportaciones field.';
        }
        field(10; "Crédito fiscal 21%"; Decimal)
        {
            Caption = 'Crédito fiscal 21%';
            ToolTip = 'Specifies the value of the Crédito fiscal 21% field.';
        }
        field(11; "Crédito fiscal 27%"; Decimal)
        {
            Caption = 'Crédito fiscal 27%';
            ToolTip = 'Specifies the value of the Crédito fiscal 27% field.';
        }
        field(12; "Crédito fiscal 10,5%"; Decimal)
        {
            Caption = 'Crédito fiscal 10,5%';
            ToolTip = 'Specifies the value of the Crédito fiscal 10,5% field.';
        }
        field(13; "No computable 10,5"; Decimal)
        {
            Caption = 'No computable 10,5';
            ToolTip = 'Specifies the value of the No computable 10,5 field.';
        }
        field(14; "No computable 21"; Decimal)
        {
            Caption = 'No computable 21';
            ToolTip = 'Specifies the value of the No computable 21 field.';
        }
        field(15; Otros; Decimal)
        {
            Caption = 'Otros';
            ToolTip = 'Specifies the value of the Otros field.';
        }
        field(16; Cerrado; Boolean)
        {
            Caption = 'Cerrado';
            ToolTip = 'Specifies the value of the Cerrado field.';
        }
        field(17; "Mes DDJJ"; Text[30])
        {
            Caption = 'Mes DDJJ';
            ToolTip = 'Specifies the value of the Mes DDJJ field.';
        }
        field(18; "No. despacho"; Text[30])
        {
            Caption = 'No. despacho';
            ToolTip = 'Specifies the value of the No. despacho field.';
        }
        field(19; Computable; Boolean)
        {
            Caption = 'Computable';
            ToolTip = 'Specifies the value of the Computable field.';
        }
        field(20; "Saldo a favor IVA"; Decimal)
        {
            Caption = 'Saldo a favor IVA';
            ToolTip = 'Specifies the value of the Saldo a favor IVA field.';
        }
        field(21; "Per IIBB"; Decimal)
        {
            Caption = 'Per IIBB';
            ToolTip = 'Specifies the value of the Per IIBB field.';
        }
        field(22; "Tasa GasOil"; Decimal)
        {
            Caption = 'Tasa GasOil';
            ToolTip = 'Specifies the value of the Tasa GasOil field.';
        }
        field(23; "Documento original"; Code[20])
        {
            Caption = 'Documento original';
            ToolTip = 'Specifies the value of the Documento original field.';
        }
        field(24; Divisa; Code[10])
        {
            Caption = 'Divisa';
            ToolTip = 'Specifies the value of the Divisa field.';
        }
        field(25; "Tipo cambio"; Decimal)
        {
            Caption = 'Tipo cambio';
            ToolTip = 'Specifies the value of the Tipo cambio field.';
        }
        field(26; "IVA Pagado"; Boolean)
        {
            Caption = 'IVA Pagado';
            ToolTip = 'Specifies the value of the IVA Pagado field.';
        }
        field(27; "Fecha contable"; Date)
        {
            Caption = 'Fecha contable';
            ToolTip = 'Specifies the value of the Fecha contable field.';
        }
        field(28; "Fecha pago"; Date)
        {
            Caption = 'Fecha pago';
            ToolTip = 'Specifies the value of the Fecha pago field.';
        }
        field(29; "Importe retención"; Decimal)
        {
            Caption = 'Importe retención';
            ToolTip = 'Specifies the value of the Importe retención field.';
        }
        field(30; "Motivo no retención"; Code[10])
        {
            Caption = 'Motivo no retención';
            ToolTip = 'Specifies the value of the Motivo no retención field.';
        }
        field(31; Actividad; Text[50])
        {
            Caption = 'Actividad';
            ToolTip = 'Specifies the value of the Actividad field.';
        }
        field(32; "Importe pendiente Pesos"; Decimal)
        {
            Caption = 'Importe pendiente Pesos';
            ToolTip = 'Specifies the value of the Importe pendiente Pesos field.';
        }
        field(33; "IVA Recuperado"; Boolean)
        {
            Caption = 'IVA Recuperado';
            ToolTip = 'Specifies the value of the IVA Recuperado field.';
        }
        field(34; "Crédito fiscal 2,5%"; Decimal)
        {
            Caption = 'Crédito fiscal 2,5%';
            ToolTip = 'Specifies the value of the Crédito fiscal 2,5% field.';
        }
        field(35; "Código documento"; Code[10])
        {
            Caption = 'Código documento';
            ToolTip = 'Specifies the value of the Código documento field.';
        }
        field(36; "Tipo retención"; Code[10])
        {
            Caption = 'Tipo retención';
            ToolTip = 'Specifies the value of the Tipo retención field.';
        }
        field(37; "CAE/CAI"; Text[30])
        {
            Caption = 'CAE/CAI';
            ToolTip = 'Specifies the value of the CAE/CAI field.';
            DataClassification = ToBeClassified;
        }
        field(38; "Fecha vencimiento pago"; Date)
        {
            Caption = 'Fecha vencimiento pago';
            ToolTip = 'Specifies the value of the Fecha vencimiento pago field.';
            DataClassification = ToBeClassified;
        }
        field(39; "Tipo documento interno"; Text[50])
        {
            Caption = 'Tipo documento interno';
            ToolTip = 'Specifies the value of the Tipo documento interno field.';
            DataClassification = ToBeClassified;
        }
        field(40; "VAT Prod. Posting Group"; Code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            ToolTip = 'Specifies the value of the VAT Prod. Posting Group field.';
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

