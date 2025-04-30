report 50532 "Estadística Producción Cal."
{
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Producción/PlantaProceso/reports/EstadísticaProducciónCal.50532.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem("Produccion Planta"; "Produccion Planta")
        {
            DataItemTableView = SORTING ("Nombre seccion diario", "Fecha produccion", "No. documento") ORDER(Ascending) WHERE (Registrado = CONST (true), "Global Dimension 2" = FILTER ('CAL'));
            RequestFilterFields = "Fecha produccion", "No. documento", "No. OP";
            column("Estadística_Producción_Calamar_"; 'Estadística Producción Calamar')
            {
            }
            column(TODAY; Today)
            {
            }
            column("Página____FORMAT_CurrReport_PAGENO_"; 'Página #')
            {
            }
            column(infoempre_Picture; infoempre.Picture)
            {
            }
            column(rstSecc_Description; rstSecc.Description)
            {
            }
            column(COPYSTR__N__OP__1_3_; CopyStr("No. OP", 1, 3))
            {
            }
            column(Produccion_Planta__OP1___Entrada_; "OP1 - Entrada")
            {
            }
            column(Produccion_Planta__OP1___Salida_MP2_; "OP1 - Salida MP2")
            {
            }
            column(Produccion_Planta__OP1___Salida_MP3_; "OP1 - Salida MP3")
            {
            }
            column(OP2___Salida___OP1___Entrada__100; "OP2 - Salida" / "OP1 - Entrada" * 100)
            {
                DecimalPlaces = 2 : 2;
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
                DecimalPlaces = 2 : 2;
            }
            column(Produccion_Planta__OP3___Entrada_; "OP3 - Entrada")
            {
            }
            column("Produccion_Planta__Fecha_producción_"; "Fecha produccion")
            {
            }
            column(Produccion_Planta__OP2___Salida_; "OP2 - Salida")
            {
            }
            column(Produccion_Planta__OP1___Entrada__Control44; "OP1 - Entrada")
            {
            }
            column(Produccion_Planta__OP3___Entrada__Control45; "OP3 - Entrada")
            {
            }
            column(Total_de___rstSecc_Description; 'Total de ' + rstSecc.Description)
            {
            }
            column(Depto_Caption; Depto_CaptionLbl)
            {
            }
            column(Calamar_Elaborado_RejosCaption; Calamar_Elaborado_RejosCaptionLbl)
            {
            }
            column(Calamar_Elaborado_AletasCaption; Calamar_Elaborado_AletasCaptionLbl)
            {
            }
            column(Rendimiento_VainasCaption; Rendimiento_VainasCaptionLbl)
            {
            }
            column(Rendimiento_RejosCaption; Rendimiento_RejosCaptionLbl)
            {
            }
            column(Rendimiento_AletasCaption; Rendimiento_AletasCaptionLbl)
            {
            }
            column(Produccion_Planta__Merma_DyP_Caption; FieldCaption("Merma DyP"))
            {
            }
            column(Materia_PrimaCaption; Materia_PrimaCaptionLbl)
            {
            }
            column(Calamar_Elaborado_VainaCaption; Calamar_Elaborado_VainaCaptionLbl)
            {
            }
            column(Producto_TerminadoCaption; Producto_TerminadoCaptionLbl)
            {
            }
            column(FechaCaption; FechaCaptionLbl)
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
            column(A_B_CCaption; A_B_CCaptionLbl)
            {
            }
            column(A___MPCaption; A___MPCaptionLbl)
            {
            }
            column(B___MPCaption; B___MPCaptionLbl)
            {
            }
            column(C___MPCaption; C___MPCaptionLbl)
            {
            }
            column(PT___MP__1Caption; PT___MP__1CaptionLbl)
            {
            }
            column(MPCaption; MPCaptionLbl)
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
        Calamar_Elaborado_RejosCaptionLbl: Label 'Calamar Elaborado Rejos';
        Calamar_Elaborado_AletasCaptionLbl: Label 'Calamar Elaborado Aletas';
        Rendimiento_VainasCaptionLbl: Label 'Rendimiento Vainas';
        Rendimiento_RejosCaptionLbl: Label 'Rendimiento Rejos';
        Rendimiento_AletasCaptionLbl: Label 'Rendimiento Aletas';
        Materia_PrimaCaptionLbl: Label 'Materia Prima';
        Calamar_Elaborado_VainaCaptionLbl: Label 'Calamar Elaborado Vaina';
        Producto_TerminadoCaptionLbl: Label 'Producto Terminado';
        FechaCaptionLbl: Label 'Fecha';
        BCaptionLbl: Label 'B';
        CCaptionLbl: Label 'C';
        ACaptionLbl: Label 'A';
        A_B_CCaptionLbl: Label 'A+B+C';
        A___MPCaptionLbl: Label 'A / MP';
        B___MPCaptionLbl: Label 'B / MP';
        C___MPCaptionLbl: Label 'C / MP';
        PT___MP__1CaptionLbl: Label '(PT / MP)-1';
        MPCaptionLbl: Label ' MP';
}

