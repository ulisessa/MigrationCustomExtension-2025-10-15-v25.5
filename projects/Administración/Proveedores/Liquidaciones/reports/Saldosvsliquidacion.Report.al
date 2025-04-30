report 50007 "Saldos vs liquidacion"
{
    // IBdos Argentina - USS - 180603 - Modificación Arbumasa
    //  a) Ver importe de IVA por movimiento
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Administración/Proveedores/Liquidaciones/reports/Saldosvsliquidacion.rdlc';

    EnableExternalImages = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem("Cab. Liquidacion Pagos"; "Cab. Liquidacion Pagos")
        {
            column(USERID; UserId)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(infoempresa_Picture; infoempresa.Picture)
            {
            }
            column(Cab__Liquidacion_Pagos__No__Liquidacion_; "No. Liquidacion")
            {
            }
            column("Cab__Liquidacion_Pagos__Fecha_creación_"; "Fecha creación")
            {
            }
            column(Cab__Liquidacion_Pagos_Usuario; Usuario)
            {
            }
            column(Cab__Liquidacion_Pagos_Estado; Estado)
            {
            }
            column(Cab__Liquidacion_Pagos__Pago_mediante_; "Pago mediante")
            {
            }
            column("Cab__Liquidacion_Pagos__Cód__medio_de_pago_"; "Cód. medio de pago")
            {
            }
            column(Cab__Liquidacion_Pagos__Fecha_pago_; "Fecha pago")
            {
            }
            column(Cab__Liquidacion_Pagos__Nombre_Libro_Diario_; "Nombre Libro Diario")
            {
            }
            column("Cab__Liquidacion_Pagos__Nombre_Sección_Diario_"; "Nombre Sección Diario")
            {
            }
            column(Cab__Liquidacion_Pagos__Primer_n__cheque_; "Primer No. cheque")
            {
            }
            column("Liquidación_de_Pagos_a_Proveedores___Caption"; Liquidación_de_Pagos_a_Proveedores___CaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Cab__Liquidacion_Pagos__No__Liquidacion_Caption; FieldCaption("No. Liquidacion"))
            {
            }
            column("Cab__Liquidacion_Pagos__Fecha_creación_Caption"; FieldCaption("Fecha creación"))
            {
            }
            column(Cab__Liquidacion_Pagos_UsuarioCaption; FieldCaption(Usuario))
            {
            }
            column(Cab__Liquidacion_Pagos_EstadoCaption; FieldCaption(Estado))
            {
            }
            column("DescripciónCaption"; DescripciónCaptionLbl)
            {
            }
            column(Cab__Liquidacion_Pagos__Pago_mediante_Caption; FieldCaption("Pago mediante"))
            {
            }
            column("Cab__Liquidacion_Pagos__Cód__medio_de_pago_Caption"; FieldCaption("Cód. medio de pago"))
            {
            }
            column(Cab__Liquidacion_Pagos__Fecha_pago_Caption; FieldCaption("Fecha pago"))
            {
            }
            column(Cab__Liquidacion_Pagos__Nombre_Libro_Diario_Caption; FieldCaption("Nombre Libro Diario"))
            {
            }
            column("Cab__Liquidacion_Pagos__Nombre_Sección_Diario_Caption"; FieldCaption("Nombre Sección Diario"))
            {
            }
            column(Cab__Liquidacion_Pagos__Primer_n__cheque_Caption; FieldCaption("Primer No. cheque"))
            {
            }
            dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
            {
                DataItemTableView = SORTING("Vendor No.", "Document Date", Open) WHERE(Open = CONST(true), Positive = CONST(false));
                RequestFilterFields = "Lugar de Pago";
                column(RemainingAmtLCY_VendorLedgerEntry; "Vendor Ledger Entry"."Remaining Amt. (LCY)")
                {
                }
                column(PostingDate_VendorLedgerEntry; "Vendor Ledger Entry"."Document Date")
                {
                }
                column(DocumentType_VendorLedgerEntry; "Vendor Ledger Entry"."Document Type")
                {
                }
                column(DocumentNo_VendorLedgerEntry; "Vendor Ledger Entry"."Document No.")
                {
                }
                column(VendorNo_VendorLedgerEntry; "Vendor Ledger Entry"."Vendor No.")
                {
                }
                column(ExternalDocumentNo_VendorLedgerEntry; "Vendor Ledger Entry"."External Document No.")
                {
                }
                column(DueDate_VendorLedgerEntry; "Vendor Ledger Entry"."Due Date")
                {
                }
                column(decALiq; decALiq)
                {
                }
                column(strNombre; strNombre)
                {
                }

                trigger OnAfterGetRecord()
                var
                    rstLiq: Record "Lín. Liquidacion Pagos";
                begin
                    Clear(rstLiq);
                    rstLiq.SetRange("No. Liquidacion", "Cab. Liquidacion Pagos"."No. Liquidacion");
                    rstLiq.SetRange("No. mov.", "Vendor Ledger Entry"."Entry No.");
                    if rstLiq.FindFirst then begin

                        if rstLiq."Importe a pagar" <> 0 then
                            decALiq := rstLiq."Importe a pagar"
                        else
                            decALiq := 0;

                    end
                    else
                        decALiq := 0;


                    Clear(rst23);
                    rst23.Get("Vendor Ledger Entry"."Vendor No.");
                    strNombre := rst23.Name;
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        infoempresa: Record "Company Information";
        rstMovProv: Record "Vendor Ledger Entry";
        rstProv: Record Vendor;
        rstDivisa: Record Currency;
        "Liquidación_de_Pagos_a_Proveedores___CaptionLbl": Label '- Liquidación de Pagos a Proveedores - ';
        CurrReport_PAGENOCaptionLbl: Label 'página';
        "DescripciónCaptionLbl": Label 'Descripción';
        decALiq: Decimal;
        strNombre: Text[100];
        rst23: Record Vendor;
}

