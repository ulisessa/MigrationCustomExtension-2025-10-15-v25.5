report 50073 "Solicitudes Seguimiento"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Administración/Solicitudes/reports/SolicitudesSeguimiento.rdlc';
    ShowPrintStatus = false;
    UseRequestPage = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem(Cab; Solicitud)
        {
            DataItemTableView = SORTING ("Nombre Libro Solicitud", "No. documento") ORDER(Ascending) WHERE (Aprobado = FILTER (true));
            RequestFilterFields = "Nombre Libro Solicitud", "No. documento";
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(USERID; UserId)
            {
            }
            column(COMPANYNAME; CompanyName)
            {
            }
            column(Cab__Nombre_libro_Solicitud_; "Nombre Libro Solicitud")
            {
            }
            column("Cab_Descripción"; Descripción)
            {
            }
            column(Cab__N__Documento_; "No. documento")
            {
            }
            column(Cab_Aprobado; Aprobado)
            {
            }
            column(Cab__Fecha_registro_; "Fecha registro")
            {
            }
            column(Cab_Usuario; Usuario)
            {
            }
            column("Cab__Usuario_Aprobación_"; "Usuario Aprobacion")
            {
            }
            column(Cab_Importancia; Importancia)
            {
            }
            column(Cab_Procedencia; Procedencia)
            {
            }
            column(Informe_de_Seguimiento_de_SolicitudesCaption; Informe_de_Seguimiento_de_SolicitudesCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column("Lin__N__línea_Caption"; Lin.FieldCaption("No. linea"))
            {
            }
            column(Lin__N__Caption; Lin.FieldCaption("No."))
            {
            }
            column(Cab__Nombre_libro_Solicitud_Caption; FieldCaption("Nombre Libro Solicitud"))
            {
            }
            column("Cab_DescripciónCaption"; FieldCaption(Descripción))
            {
            }
            column(Cab__N__Documento_Caption; FieldCaption("No. documento"))
            {
            }
            column(Un_MedidaCaption; Un_MedidaCaptionLbl)
            {
            }
            column(Lin_CantidadCaption; Lin.FieldCaption(Cantidad))
            {
            }
            column(Cab_AprobadoCaption; FieldCaption(Aprobado))
            {
            }
            column("Lin__Fecha_recepción_esperada_Caption"; Lin.FieldCaption("Fecha recepcion esperada"))
            {
            }
            column(Cab__Fecha_registro_Caption; FieldCaption("Fecha registro"))
            {
            }
            column(Lin__Global_Dimension_1_Caption; Lin.FieldCaption("Global Dimension 1"))
            {
            }
            column(Cab_UsuarioCaption; FieldCaption(Usuario))
            {
            }
            column("Cab__Usuario_Aprobación_Caption"; FieldCaption("Usuario Aprobacion"))
            {
            }
            column(Lin__Global_Dimension_3_Caption; Lin.FieldCaption("Global Dimension 3"))
            {
            }
            column(OC_NumCaption; OC_NumCaptionLbl)
            {
            }
            column(Lin_OC_NumCaption; Lin_OC_NumCaptionLbl)
            {
            }
            column(Cab_ImportanciaCaption; FieldCaption(Importancia))
            {
            }
            column(Cab_ProcedenciaCaption; FieldCaption(Procedencia))
            {
            }
            column(Lin_EstadoCaption; Lin.FieldCaption(Estado))
            {
            }
            dataitem(Lin; "Lín. solicitud")
            {
                DataItemLink = "Nombre libro Solicitud" = FIELD ("Nombre Libro Solicitud"), "No. Documento" = FIELD ("No. documento");
                DataItemTableView = SORTING ("Nombre libro Solicitud", "No. Documento", "No. linea") ORDER(Ascending);
                column("Lin__N__línea_"; "No. linea")
                {
                }
                column(Lin__N__; "No.")
                {
                }
                column(Lin_Cantidad; Cantidad)
                {
                }
                column("Lin__Fecha_recepción_esperada_"; "Fecha recepcion esperada")
                {
                }
                column(Lin__Global_Dimension_1_; "Global Dimension 1")
                {
                }
                column(Lin__N__documento_compras_; "No. documento compras")
                {
                }
                column("Lin__N__línea_documento_compras_"; "No. linea documento compras")
                {
                }
                column("Lin__Cód__unidad_medida_"; "Cod. unidad medida")
                {
                }
                column(Lin__Global_Dimension_3_; "Global Dimension 3")
                {
                }
                column(Lin_Estado; Estado)
                {
                }
                column(Lin_Nombre_libro_Solicitud; "Nombre libro Solicitud")
                {
                }
                column(Lin_N__Documento; "No. Documento")
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
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        Informe_de_Seguimiento_de_SolicitudesCaptionLbl: Label 'Informe de Seguimiento de Solicitudes';
        CurrReport_PAGENOCaptionLbl: Label 'página';
        Un_MedidaCaptionLbl: Label 'Un.Medida';
        OC_NumCaptionLbl: Label 'OC Num';
        Lin_OC_NumCaptionLbl: Label 'Lin OC Num';
}

