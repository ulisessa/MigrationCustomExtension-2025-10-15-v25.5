report 50680 "H.Liquidación pago proveedores"
{
    // IBdos Argentina - USS - 180603 - Modificación Arbumasa
    //  a) Ver importe de IVA por movimiento
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Administración/Proveedores/Liquidaciones/reports/HLiquidaciónpagoproveedores.rdlc';

    EnableExternalImages = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem("Hist. cab. liquidacion pagos"; "Hist. cab. liquidacion pagos")
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
            column(Hist__cab__liquidacion_pagos__No__Liquidacion_; "No. Liquidacion")
            {
            }
            column("Hist__cab__liquidacion_pagos__Fecha_creación_"; "Fecha creación")
            {
            }
            column(Hist__cab__liquidacion_pagos_Usuario; Usuario)
            {
            }
            column(Hist__cab__liquidacion_pagos_Estado; Estado)
            {
            }
            column(Hist__cab__liquidacion_pagos__Pago_mediante_; "Pago mediante")
            {
            }
            column("Hist__cab__liquidacion_pagos__Cód__medio_de_pago_"; "Cód. medio de pago")
            {
            }
            column(Hist__cab__liquidacion_pagos__Fecha_pago_; "Fecha pago")
            {
            }
            column(Hist__cab__liquidacion_pagos__Nombre_Libro_Diario_; "Nombre Libro Diario")
            {
            }
            column("Hist__cab__liquidacion_pagos__Nombre_Sección_Diario_"; "Nombre Sección Diario")
            {
            }
            column(Hist__cab__liquidacion_pagos__Primer_n__cheque_; "Primer No. cheque")
            {
            }
            column("Liquidación_de_Pagos_a_Proveedores___Caption"; Liquidación_de_Pagos_a_Proveedores___CaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Hist__cab__liquidacion_pagos__No__Liquidacion_Caption; FieldCaption("No. Liquidacion"))
            {
            }
            column("Hist__cab__liquidacion_pagos__Fecha_creación_Caption"; FieldCaption("Fecha creación"))
            {
            }
            column(Hist__cab__liquidacion_pagos_UsuarioCaption; FieldCaption(Usuario))
            {
            }
            column(Hist__cab__liquidacion_pagos_EstadoCaption; FieldCaption(Estado))
            {
            }
            column("Lín__Liquidacion_Pagos__No__proveedor_Caption"; "Lín. Liquidacion Pagos".FieldCaption("No. proveedor"))
            {
            }
            column("DescripciónCaption"; DescripciónCaptionLbl)
            {
            }
            column("Lín__Liquidacion_Pagos__No__documento_externo_Caption"; "Lín. Liquidacion Pagos".FieldCaption("No. documento externo"))
            {
            }
            column("Lín__Liquidacion_Pagos__Fecha_registro_Caption"; "Lín. Liquidacion Pagos".FieldCaption("Fecha registro"))
            {
            }
            column("Lín__Liquidacion_Pagos__Fecha_vencimiento_Caption"; "Lín. Liquidacion Pagos".FieldCaption("Fecha vencimiento"))
            {
            }
            column("Lín__Liquidacion_Pagos__Cód__divisa_Caption"; "Lín. Liquidacion Pagos".FieldCaption("Cód. divisa"))
            {
            }
            column("Lín__Liquidacion_Pagos_ImporteCaption"; "Lín. Liquidacion Pagos".FieldCaption(Importe))
            {
            }
            column("Lín__Liquidacion_Pagos__Importe_a_pagar_Caption"; "Lín. Liquidacion Pagos".FieldCaption("Importe a pagar"))
            {
            }
            column("Lín__Liquidacion_Pagos__Importe_pendiente_Caption"; "Lín. Liquidacion Pagos".FieldCaption("Importe pendiente"))
            {
            }
            column(Hist__cab__liquidacion_pagos__Pago_mediante_Caption; FieldCaption("Pago mediante"))
            {
            }
            column("Hist__cab__liquidacion_pagos__Cód__medio_de_pago_Caption"; FieldCaption("Cód. medio de pago"))
            {
            }
            column(Hist__cab__liquidacion_pagos__Fecha_pago_Caption; FieldCaption("Fecha pago"))
            {
            }
            column(Hist__cab__liquidacion_pagos__Nombre_Libro_Diario_Caption; FieldCaption("Nombre Libro Diario"))
            {
            }
            column("Hist__cab__liquidacion_pagos__Nombre_Sección_Diario_Caption"; FieldCaption("Nombre Sección Diario"))
            {
            }
            column(Hist__cab__liquidacion_pagos__Primer_n__cheque_Caption; FieldCaption("Primer No. cheque"))
            {
            }
            dataitem("Lín. Liquidacion Pagos"; "Lín. Liquidacion Pagos")
            {
                DataItemLink = "No. Liquidacion" = FIELD("No. Liquidacion");
                DataItemTableView = SORTING("No. Liquidacion", "No. proveedor");
                column("Lín__Liquidacion_Pagos__No__proveedor_"; "No. proveedor")
                {
                }
                column(rstProv_Name; rstProv.Name)
                {
                }
                column("Lín__Liquidacion_Pagos__No__documento_externo_"; "No. documento externo")
                {
                }
                column("Lín__Liquidacion_Pagos__Fecha_registro_"; "Fecha registro")
                {
                }
                column("Lín__Liquidacion_Pagos__Fecha_vencimiento_"; "Fecha vencimiento")
                {
                }
                column("Lín__Liquidacion_Pagos__Cód__divisa_"; "Cód. divisa")
                {
                }
                column("Lín__Liquidacion_Pagos_Importe"; Importe)
                {
                }
                column("Lín__Liquidacion_Pagos__Importe_a_pagar_"; "Importe a pagar")
                {
                }
                column("Lín__Liquidacion_Pagos__Importe_pendiente_"; "Importe pendiente")
                {
                }
                column("Lín__Liquidacion_Pagos_Importe_Control1000000037"; Importe)
                {
                }
                column("Lín__Liquidacion_Pagos__Importe_a_pagar__Control1000000039"; "Importe a pagar")
                {
                }
                column("Lín__Liquidacion_Pagos__Importe_pendiente__Control1000000041"; "Importe pendiente")
                {
                }
                column(Total___rstProv_Name; 'Total ' + rstProv.Name)
                {
                }
                column("Lín__Liquidacion_Pagos_No__Liquidacion"; "No. Liquidacion")
                {
                }
                column("Lín__Liquidacion_Pagos_No__mov_"; "No. mov.")
                {
                }
                column(FechaEmisionDocumento; rstMovProv."Document Date")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    Clear(rstProv);
                    rstProv.Get("Lín. Liquidacion Pagos"."No. proveedor");

                    rstMovProv.Get("Lín. Liquidacion Pagos"."No. mov.");
                end;
            }
            dataitem(TotalDivisa; "Lín. Liquidacion Pagos")
            {
                DataItemLink = "No. Liquidacion" = FIELD("No. Liquidacion");
                DataItemTableView = SORTING("Cód. divisa");
                column(Total_en___rstDivisa_Description; 'Total en ' + rstDivisa.Description)
                {
                }
                column(TotalDivisa_Importe; Importe)
                {
                }
                column(TotalDivisa__Importe_a_pagar_; "Importe a pagar")
                {
                }
                column(TotalDivisa__Importe_pendiente_; "Importe pendiente")
                {
                }
                column(TotalDivisa_No__Liquidacion; "No. Liquidacion")
                {
                }
                column(TotalDivisa_Fecha_vencimiento; "Fecha vencimiento")
                {
                }
                column(TotalDivisa_No__mov_; "No. mov.")
                {
                }
                column("TotalDivisa_Cód__divisa"; "Cód. divisa")
                {
                }
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
}

