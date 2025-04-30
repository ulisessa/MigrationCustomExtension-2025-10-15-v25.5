table 50085 "MEP Ledger Entry"
{
    Caption = 'MEP Ledger Entry';

    fields
    {
        field(1; "Entry no."; Integer)
        {
            Caption = 'No.';
        }
        field(2; "Registro ID"; Code[2])
        {
            Caption = 'Registro ID';
            DataClassification = ToBeClassified;
            Description = 'Siempre es PO';
            InitValue = 'PO';
        }
        field(3; "PO Reference"; Text[25])
        {
            Caption = 'Referencia de la orden de pago';
            DataClassification = ToBeClassified;
            Description = 'Expediente?';
        }
        field(4; "Payment reason"; Text[105])
        {
            Caption = 'Motivo del pago';
            DataClassification = ToBeClassified;
            Description = 'Autos?';
        }
        field(5; "Order execution date"; Date)
        {
            Caption = 'Fecha ejecución OP';
            DataClassification = ToBeClassified;
            Description = 'Día de hoy?';
        }
        field(6; "Payment type"; Code[3])
        {
            Caption = 'Tipo de pago';
            DataClassification = ToBeClassified;
            Description = 'Siempre es 020';
            InitValue = '020';
        }
        field(7; "Payment amount"; Decimal)
        {
            Caption = 'Importe a pagar';
            DataClassification = ToBeClassified;
            Description = 'Importe a pagar 15:2';
        }
        field(8; "Payment currency"; Code[3])
        {
            Caption = 'Moneda del pago';
            DataClassification = ToBeClassified;
            Description = 'Siempre es ARS';
            InitValue = 'ARS';
        }
        field(9; "CHPD due date"; Date)
        {
            Caption = 'Fecha de vencimiento de CHPD';
            DataClassification = ToBeClassified;
            Description = 'Sólo para cheques de pago diferido';
        }
        field(10; "Request official recipt"; Boolean)
        {
            Caption = 'Requerir Recibo oficial del Be';
            DataClassification = ToBeClassified;
            Description = 'Es sí?';
            InitValue = true;
        }
        field(11; "No a la orden"; Boolean)
        {
            Caption = 'Cláusula no a la orden';
            DataClassification = ToBeClassified;
            Description = 'Lleva o no leyenda "No a la orden"?';
            InitValue = true;
        }
        field(12; "Include signature in cheques"; Boolean)
        {
            Caption = 'Incluir firma en la impresión';
            DataClassification = ToBeClassified;
            Description = 'Requiere la firma de la empresa';
            InitValue = true;
        }
        field(13; "Attachment accompanies"; Code[3])
        {
            Caption = 'Acompañamiento de Comprobantes';
            DataClassification = ToBeClassified;
            Description = 'Puse NEC pero ni idea';
            InitValue = 'NEC';
        }
        field(14; "Referral text #1"; Text[80])
        {
            Caption = 'Texto referencial #1 asociado';
            DataClassification = ToBeClassified;
            Description = 'Datos legales';
        }
        field(15; "Referral text #2"; Text[80])
        {
            Caption = 'Texto referencial #2 asociado';
            DataClassification = ToBeClassified;
        }
        field(16; "Referral text #3"; Text[80])
        {
            Caption = 'Texto referencial #3 asociado';
            DataClassification = ToBeClassified;
        }
        field(17; "Instructions for Bank CS"; Text[160])
        {
            Caption = 'Instrucciones para el CSB';
            DataClassification = ToBeClassified;
            Description = 'Cuenta acreedora???';
        }
        field(18; "Beneficiary No."; Code[25])
        {
            Caption = 'Nro. de Beneficiario';
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
            DataClassification = ToBeClassified;
            Description = 'Si tiene algún dato, se utiliza para ejecutar la orden de pago';
        }
        field(20; "Beneficiary document type"; Code[3])
        {
            Caption = 'Tipo de documento';
            DataClassification = ToBeClassified;
            Description = '010: CUIL; 011: CUIT; 014: CDI';
        }
        field(21; "Beneficiary document no."; Code[11])
        {
            Caption = 'Nro. de CUIT/CUIL/CDI';
            DataClassification = ToBeClassified;
        }
        field(22; "Beneficiary address"; Text[120])
        {
            Caption = 'Domicilio del Beneficiario';
            DataClassification = ToBeClassified;
        }
        field(23; "Beneficiary PC"; Code[15])
        {
            Caption = 'Código postal';
            DataClassification = ToBeClassified;
        }
        field(24; "Beneficiary email"; Text[70])
        {
            Caption = 'Email del Beneficiario';
            DataClassification = ToBeClassified;
        }
        field(25; "Beneficiary fax"; Text[25])
        {
            Caption = 'Fax del Beneficiario';
            DataClassification = ToBeClassified;
        }
        field(26; "Beneficiary communication form"; Code[3])
        {
            Caption = 'Medios de comunicación';
            DataClassification = ToBeClassified;
        }
        field(27; "Beneficiary CBU"; Code[22])
        {
            Caption = 'CBU de la cuenta a acreditar';
            DataClassification = ToBeClassified;
            Description = 'Obligatorio';
        }
        field(28; "Beneficiary account system"; Code[2])
        {
            Caption = 'Sistema de la cta a acreditar';
            DataClassification = ToBeClassified;
            Description = 'Si es CC o CA';
        }
        field(29; "Beneficiary account currency"; Code[3])
        {
            Caption = 'Moneda';
            DataClassification = ToBeClassified;
            InitValue = 'ARS';
        }
        field(30; "Cheque delivery method"; Code[3])
        {
            Caption = 'Canal de pagos en cheques';
            DataClassification = ToBeClassified;
        }
        field(31; Sucursal; Code[8])
        {
            Caption = 'Sucursal enviar cheque';
            DataClassification = ToBeClassified;
        }
        field(32; "Bank Code"; Code[10])
        {
            Caption = 'Cód. banco';
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
            DataClassification = ToBeClassified;
            Description = 'Si es CC o CA';
        }
        field(35; "Adherent account currency"; Code[3])
        {
            Caption = 'Moneda de la cuenta a debitar';
            DataClassification = ToBeClassified;
            InitValue = 'ARS';
        }
        field(36; "Operating type"; Code[1])
        {
            Caption = 'Tipo de operatoria';
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

