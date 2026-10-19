table 50085 "MEP Ledger Entry"
{
    Caption = 'MEP Ledger Entry';

    fields
    {
        field(1; "Entry no."; Integer)
        {
            Caption = 'No.';
            ToolTip = 'Specifies the value of the No field.';
        }
        field(2; "Registro ID"; Code[2])
        {
            Caption = 'Registro ID';
            ToolTip = 'Specifies the value of the Registro ID field.';
            DataClassification = ToBeClassified;
            Description = 'Siempre es PO';
            InitValue = 'PO';
        }
        field(3; "PO Reference"; Text[25])
        {
            Caption = 'Referencia de la orden de pago';
            ToolTip = 'Specifies the value of the Referencia de la orden de pago field.';
            DataClassification = ToBeClassified;
            Description = 'Expediente?';
        }
        field(4; "Payment reason"; Text[105])
        {
            Caption = 'Motivo del pago';
            ToolTip = 'Specifies the value of the Motivo del pago field.';
            DataClassification = ToBeClassified;
            Description = 'Autos?';
        }
        field(5; "Order execution date"; Date)
        {
            Caption = 'Fecha ejecución OP';
            ToolTip = 'Specifies the value of the Fecha ejecución OP field.';
            DataClassification = ToBeClassified;
            Description = 'Día de hoy?';
        }
        field(6; "Payment type"; Code[3])
        {
            Caption = 'Tipo de pago';
            ToolTip = 'Specifies the value of the Tipo de pago field.';
            DataClassification = ToBeClassified;
            Description = 'Siempre es 020';
            InitValue = '020';
        }
        field(7; "Payment amount"; Decimal)
        {
            Caption = 'Importe a pagar';
            ToolTip = 'Specifies the value of the Importe a pagar field.';
            DataClassification = ToBeClassified;
            Description = 'Importe a pagar 15:2';
        }
        field(8; "Payment currency"; Code[3])
        {
            Caption = 'Moneda del pago';
            ToolTip = 'Specifies the value of the Moneda del pago field.';
            DataClassification = ToBeClassified;
            Description = 'Siempre es ARS';
            InitValue = 'ARS';
        }
        field(9; "CHPD due date"; Date)
        {
            Caption = 'Fecha de vencimiento de CHPD';
            ToolTip = 'Specifies the value of the Fecha de vencimiento de CHPD field.';
            DataClassification = ToBeClassified;
            Description = 'Sólo para cheques de pago diferido';
        }
        field(10; "Request official recipt"; Boolean)
        {
            Caption = 'Requerir Recibo oficial del Be';
            ToolTip = 'Specifies the value of the Requerir Recibo oficial del Be field.';
            DataClassification = ToBeClassified;
            Description = 'Es sí?';
            InitValue = true;
        }
        field(11; "No a la orden"; Boolean)
        {
            Caption = 'Cláusula no a la orden';
            ToolTip = 'Specifies the value of the Cláusula no a la orden field.';
            DataClassification = ToBeClassified;
            Description = 'Lleva o no leyenda "No a la orden"?';
            InitValue = true;
        }
        field(12; "Include signature in cheques"; Boolean)
        {
            Caption = 'Incluir firma en la impresión';
            ToolTip = 'Specifies the value of the Incluir firma en la impresión field.';
            DataClassification = ToBeClassified;
            Description = 'Requiere la firma de la empresa';
            InitValue = true;
        }
        field(13; "Attachment accompanies"; Code[3])
        {
            Caption = 'Acompañamiento de Comprobantes';
            ToolTip = 'Specifies the value of the Acompañamiento de Comprobantes field.';
            DataClassification = ToBeClassified;
            Description = 'Puse NEC pero ni idea';
            InitValue = 'NEC';
        }
        field(14; "Referral text #1"; Text[80])
        {
            Caption = 'Texto referencial #1 asociado';
            ToolTip = 'Specifies the value of the Texto referencial #1 asociado field.';
            DataClassification = ToBeClassified;
            Description = 'Datos legales';
        }
        field(15; "Referral text #2"; Text[80])
        {
            Caption = 'Texto referencial #2 asociado';
            ToolTip = 'Specifies the value of the Texto referencial #2 asociado field.';
            DataClassification = ToBeClassified;
        }
        field(16; "Referral text #3"; Text[80])
        {
            Caption = 'Texto referencial #3 asociado';
            ToolTip = 'Specifies the value of the Texto referencial #3 asociado field.';
            DataClassification = ToBeClassified;
        }
        field(17; "Instructions for Bank CS"; Text[160])
        {
            Caption = 'Instrucciones para el CSB';
            ToolTip = 'Specifies the value of the Instrucciones para el CSB field.';
            DataClassification = ToBeClassified;
            Description = 'Cuenta acreedora???';
        }
        field(18; "Beneficiary No."; Code[25])
        {
            Caption = 'Nro. de Beneficiario';
            ToolTip = 'Specifies the value of the Nro. de Beneficiario field.';
            DataClassification = ToBeClassified;
            Description = 'Si el beneficiario ya existe en el banco, se informa. Si no, va en blanco';
            TableRelation = Employee;

            trigger OnValidate()
            var
                rstEmployee: Record Employee;
                rstDD: Record "Default Dimension";
                rstDPE: Record "Employee payment data";
            begin
                Clear(rstEmployee);
                if rstEmployee.Get("Beneficiary No.") then begin

                    "Beneficiary name" := rstEmployee.Name;
                    //010: CUIL; 011: CUIT; 014: CDI
                    Clear(rstDD);
                    rstDD.SetRange("Dimension Code", 'CUIL');
                    rstDD.SetRange("Table ID", 5200);
                    rstDD.SetRange("No.", rstEmployee."No.");
                    if rstDD.FindFirst then begin

                        "Beneficiary document type" := '010';
                        "Beneficiary document no." := DelChr(rstDD."Dimension Value Code", '=', '-');

                    end;
                    "Beneficiary email" := rstEmployee."E-Mail";
                    Clear(rstDPE);
                    rstDPE.SetRange(rstDPE."Employee No.", rstEmployee."No.");
                    if rstDPE.FindFirst then begin

                        "Beneficiary CBU" := rstDPE."No. cuenta";
                        "Beneficiary account system" := Format(rstDPE."Tipo cuenta");

                    end;

                end;
            end;
        }
        field(19; "Beneficiary name"; Text[60])
        {
            Caption = 'Nombre del Beneficiario o prov';
            ToolTip = 'Specifies the value of the Nombre del Beneficiario o prov field.';
            DataClassification = ToBeClassified;
            Description = 'Si tiene algún dato, se utiliza para ejecutar la orden de pago';
        }
        field(20; "Beneficiary document type"; Code[3])
        {
            Caption = 'Tipo de documento';
            ToolTip = 'Specifies the value of the Tipo de documento field.';
            DataClassification = ToBeClassified;
            Description = '010: CUIL; 011: CUIT; 014: CDI';
        }
        field(21; "Beneficiary document no."; Code[11])
        {
            Caption = 'Nro. de CUIT/CUIL/CDI';
            ToolTip = 'Specifies the value of the Nro. de CUIT/CUIL/CDI field.';
            DataClassification = ToBeClassified;
        }
        field(22; "Beneficiary address"; Text[120])
        {
            Caption = 'Domicilio del Beneficiario';
            ToolTip = 'Specifies the value of the Domicilio del Beneficiario field.';
            DataClassification = ToBeClassified;
        }
        field(23; "Beneficiary PC"; Code[15])
        {
            Caption = 'Código postal';
            ToolTip = 'Specifies the value of the Código postal field.';
            DataClassification = ToBeClassified;
        }
        field(24; "Beneficiary email"; Text[70])
        {
            Caption = 'Email del Beneficiario';
            ToolTip = 'Specifies the value of the Email del Beneficiario field.';
            DataClassification = ToBeClassified;
        }
        field(25; "Beneficiary fax"; Text[25])
        {
            Caption = 'Fax del Beneficiario';
            ToolTip = 'Specifies the value of the Fax del Beneficiario field.';
            DataClassification = ToBeClassified;
        }
        field(26; "Beneficiary communication form"; Code[3])
        {
            Caption = 'Medios de comunicación';
            ToolTip = 'Specifies the value of the Medios de comunicación field.';
            DataClassification = ToBeClassified;
        }
        field(27; "Beneficiary CBU"; Code[22])
        {
            Caption = 'CBU de la cuenta a acreditar';
            ToolTip = 'Specifies the value of the CBU de la cuenta a acreditar field.';
            DataClassification = ToBeClassified;
            Description = 'Obligatorio';
        }
        field(28; "Beneficiary account system"; Code[2])
        {
            Caption = 'Sistema de la cta a acreditar';
            ToolTip = 'Specifies the value of the Sistema de la cta a acreditar field.';
            DataClassification = ToBeClassified;
            Description = 'Si es CC o CA';
        }
        field(29; "Beneficiary account currency"; Code[3])
        {
            Caption = 'Moneda';
            ToolTip = 'Specifies the value of the Moneda field.';
            DataClassification = ToBeClassified;
            InitValue = 'ARS';
        }
        field(30; "Cheque delivery method"; Code[3])
        {
            Caption = 'Canal de pagos en cheques';
            ToolTip = 'Specifies the value of the Canal de pagos en cheques field.';
            DataClassification = ToBeClassified;
        }
        field(31; Sucursal; Code[8])
        {
            Caption = 'Sucursal enviar cheque';
            ToolTip = 'Specifies the value of the Sucursal enviar cheque field.';
            DataClassification = ToBeClassified;
        }
        field(32; "Bank Code"; Code[10])
        {
            Caption = 'Bank Acc. Code';
            ToolTip = 'Specifies the value of the Bank Acc. Code field.';
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No.";

            trigger OnValidate()
            var
                rstBA: Record "Bank Account";
            begin
                Clear(rstBA);
                if rstBA.Get("Bank Code") then begin

                    "Adherent CBU to be debited" := rstBA."CCC No.";
                    "Adherent account system" := rstBA."CCC Control Digits";
                    "Adherent account currency" := rstBA."Currency Code";

                end;
            end;
        }
        field(33; "Adherent CBU to be debited"; Code[22])
        {
            Caption = 'CBU de cuenta a ser debitada';
            ToolTip = 'Specifies the value of the CBU de cuenta a ser debitada field.';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                rstBA: Record "Bank Account";
            begin
            end;
        }
        field(34; "Adherent account system"; Code[2])
        {
            Caption = 'Sistema de la cta a debitar';
            ToolTip = 'Specifies the value of the Sistema de la cta a debitar field.';
            DataClassification = ToBeClassified;
            Description = 'Si es CC o CA';
        }
        field(35; "Adherent account currency"; Code[3])
        {
            Caption = 'Moneda de la cuenta a debitar';
            ToolTip = 'Specifies the value of the Moneda de la cuenta a debitar field.';
            DataClassification = ToBeClassified;
            InitValue = 'ARS';
        }
        field(36; "Operating type"; Code[1])
        {
            Caption = 'Tipo de operatoria';
            ToolTip = 'Specifies the value of the Tipo de operatoria field.';
            DataClassification = ToBeClassified;
            InitValue = '2';
        }
    }

    keys
    {
        key(Key1; "Entry no.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Entry no.", "Registro ID", "PO Reference", "Payment reason", "Order execution date")
        {
        }
    }
}

