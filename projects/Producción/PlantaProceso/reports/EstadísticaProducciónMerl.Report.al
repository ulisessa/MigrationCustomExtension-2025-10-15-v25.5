report 50533 "Estadística Producción Merl."
{
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Producción/PlantaProceso/reports/EstadísticaProducciónMerl.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem("Produccion Planta"; "Produccion Planta")
        {
            DataItemTableView = SORTING ("Nombre seccion diario", "Fecha produccion", "No. documento") ORDER(Ascending) WHERE (Registrado = CONST (true), "Global Dimension 2" = FILTER ('MER'));
            RequestFilterFields = "Fecha produccion", "No. documento", "No. OP";
            column(infoempre_Picture; infoempre.Picture)
            {
            }
            column("Estadística_Producción_Merluza_"; 'Estadística Producción Merluza')
            {
            }
            column(TODAY; Today)
            {
            }
            column("Página____FORMAT_CurrReport_PAGENO_"; 'Página #' )
            {
            }
            column(rstSecc_Description; rstSecc.Description)
            {
            }
            column(Produccion_Planta__Rendimiento_Engorde_; "Rendimiento Engorde")
            {
                DecimalPlaces = 2 : 2;
            }
            column(COPYSTR__N__OP__1_3_; CopyStr("No. OP", 1, 3))
            {
            }
            column(Produccion_Planta__OP1___Salida_MP1_; "OP1 - Salida MP1")
            {
            }
            column(Produccion_Planta__OP1___Entrada_; "OP1 - Entrada")
            {
            }
            column(Produccion_Planta__OP2___Salida_; "OP2 - Salida")
            {
            }
            column(Produccion_Planta__OP2___Entrada_; "OP2 - Entrada")
            {
            }
            column(Produccion_Planta__Rendimiento_PT1_; "Rendimiento PT1")
            {
            }
            column(Produccion_Planta__Rendimiento_PT2_; "Rendimiento PT2")
            {
                DecimalPlaces = 2 : 2;
            }
            column(Produccion_Planta__Rendimiento_PT3_; "Rendimiento PT3")
            {
                DecimalPlaces = 2 : 2;
            }
            column(Produccion_Planta__Merma_DyP_; "Merma DyP")
            {
            }
            column(Produccion_Planta__OP3___Entrada_; "OP3 - Entrada")
            {
                DecimalPlaces = 2 : 2;
            }
            column("Produccion_Planta__Fecha_producción_"; "Fecha produccion")
            {
            }
            column(Total_de___rstSecc_Description; 'Total de ' + rstSecc.Description)
            {
            }
            column(Produccion_Planta__OP1___Entrada__Control11; "OP1 - Entrada")
            {
            }
            column(Produccion_Planta__OP3___Entrada__Control8; "OP3 - Entrada")
            {
            }
            column(Depto_Caption; Depto_CaptionLbl)
            {
            }
            column(Salida_FiletesCaption; Salida_FiletesCaptionLbl)
            {
            }
            column(Rendimiento_FileteadoCaption; Rendimiento_FileteadoCaptionLbl)
            {
            }
            column(Rendimiento_DescarteCaption; Rendimiento_DescarteCaptionLbl)
            {
            }
            column(Rendimiento_TotalCaption; Rendimiento_TotalCaptionLbl)
            {
            }
            column(Merma_TotalCaption; Merma_TotalCaptionLbl)
            {
            }
            column(Merma_de_FileteadoCaption; Merma_de_FileteadoCaptionLbl)
            {
            }
            column(Materia_Prima_FileteadoCaption; Materia_Prima_FileteadoCaptionLbl)
            {
            }
            column(Descarte_KGCaption; Descarte_KGCaptionLbl)
            {
            }
            column(Producto_TerminadoCaption; Producto_TerminadoCaptionLbl)
            {
            }
            column("KG_a_ClasificaciónCaption"; KG_a_ClasificaciónCaptionLbl)
            {
            }
            column(BCaption; BCaptionLbl)
            {
            }
            column(CCaption; CCaptionLbl)
            {
            }
            column(ACaption; ACaptionLbl)
            {
            }
            column(ACaption_Control27; ACaption_Control27Lbl)
            {
            }
            column(PT___ACaption; PT___ACaptionLbl)
            {
            }
            column(PTCaption; PTCaptionLbl)
            {
            }
            column(PT___MPCaption; PT___MPCaptionLbl)
            {
            }
            column(PT___MP__1Caption; PT___MP__1CaptionLbl)
            {
            }
            column(MPCaption; MPCaptionLbl)
            {
            }
            column(Fecha_Caption; Fecha_CaptionLbl)
            {
            }
            column(Produccion_Planta_Nombre_libro_diario; "Nombre libro diario")
            {
            }
            column("Produccion_Planta_Nombre_sección_diario"; "Nombre seccion diario")
            {
            }
            column(Produccion_Planta_N__documento; "No. documento")
            {
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
        VarMPPT: Code[10];
        infoempre: Record "Company Information";
        rstSecc: Record "Item Journal Batch";
        cont: Integer;
        Depto_CaptionLbl: Label 'Depto.';
        Salida_FiletesCaptionLbl: Label 'Salida Filetes';
        Rendimiento_FileteadoCaptionLbl: Label 'Rendimiento Fileteado';
        Rendimiento_DescarteCaptionLbl: Label 'Rendimiento Descarte';
        Rendimiento_TotalCaptionLbl: Label 'Rendimiento Total';
        Merma_TotalCaptionLbl: Label 'Merma Total';
        Merma_de_FileteadoCaptionLbl: Label 'Merma de Fileteado';
        Materia_Prima_FileteadoCaptionLbl: Label 'Materia Prima Fileteado';
        Descarte_KGCaptionLbl: Label 'Descarte KG';
        Producto_TerminadoCaptionLbl: Label 'Producto Terminado';
        "KG_a_ClasificaciónCaptionLbl": Label 'KG a Clasificación';
        BCaptionLbl: Label 'B';
        CCaptionLbl: Label 'C';
        ACaptionLbl: Label 'A';
        ACaption_Control27Lbl: Label 'A';
        PT___ACaptionLbl: Label 'PT / A';
        PTCaptionLbl: Label 'PT';
        PT___MPCaptionLbl: Label 'PT / MP';
        PT___MP__1CaptionLbl: Label '(PT / MP)-1';
        MPCaptionLbl: Label ' MP';
        Fecha_CaptionLbl: Label 'Fecha ';
}

