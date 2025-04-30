report 50512 "produccion estadistica meruza"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Producción/PlantaProceso/reports/produccionestadisticameruza.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem("Produccion Planta"; "Produccion Planta")
        {
            DataItemTableView = SORTING ("Fecha produccion", "No. documento") ORDER(Ascending) WHERE (Registrado = CONST (true), "Global Dimension 2" = FILTER ('MER'), "Produccion terminada" = CONST (true));
            RequestFilterFields = "Fecha produccion", "No. documento";
            column(COMPANYNAME; CompanyName)
            {
            }
            column(FILTRO___________Produccion_Planta__GETFILTERS__; 'FILTRO : .....' + "Produccion Planta".GetFilters())
            {
            }
            column(Produccion_Planta__Lote_origen_; "Lote origen")
            {
            }
            column(Produccion_Planta__MER_Filete_C_E_Residuos_; "PES Filete C/E Residuos")
            {
            }
            column(Produccion_Planta__MER_Entera_Entrada_KG_; "PES Entera Entrada KG")
            {
            }
            column(Produccion_Planta__MER_Entera_Entrada_RE_____; "PES Entera Entrada RE (%)")
            {
            }
            column(Produccion_Planta__MER_Carioca_Entrada_KG_; "PES Carioca Entrada KG")
            {
            }
            column(Produccion_Planta__MER_Carioca_Entrada_RE_____; "PES Carioca Entrada RE (%)")
            {
            }
            column(Produccion_Planta__MER_Filete_C_E_Entrada_KG_; "PES Filete C/E Entrada KG")
            {
            }
            column(Produccion_Planta__MER_Filete_C_E_Residuos__Control122; "PES Filete C/E Residuos")
            {
            }
            column(Produccion_Planta__MER_Filete_C_E_RE_____; "PES Filete C/E RE (%)")
            {
            }
            column(Produccion_Planta__MER_Filete_C_E_Salida_KG__; "PES Filete C/E Salida KG")
            {
            }
            column(Produccion_Planta__MER_Filete_C_E_Merma__; "PES Filete C/E Merma")
            {
            }
            column(Produccion_Planta__MER_Filete_S_E_Entrada_KG_; "PES Filete S/E Entrada KG")
            {
            }
            column(Produccion_Planta__MER_Filete_S_E_Residuos_; "PES Filete S/E Residuos")
            {
            }
            column(Produccion_Planta__MER_Filete_S_E_Salida_KG_; "PES Filete S/E Salida KG")
            {
            }
            column(Produccion_Planta__MER_Filete_S_E_RE_____; "PES Filete S/E RE (%)")
            {
            }
            column(Produccion_Planta__MER_Filete_S_E_Merma_; "PES Filete S/E Merma")
            {
            }
            column(Produccion_Planta__MER_Carioca_Entrada_KG__Control19; "PES Carioca Entrada KG")
            {
            }
            column(Produccion_Planta__MER_Carioca_Descarte_; "PES Carioca Descarte")
            {
            }
            column(Produccion_Planta__MER_Carioca_Proceso_Out_KG_; "PES Carioca Proceso-Out KG")
            {
            }
            column(Produccion_Planta__MER_Carioca_Proceso_RE_____; "PES Carioca Proceso RE (%)")
            {
            }
            column(Produccion_Planta__MER_Carioca_Merma_____; "PES Carioca Merma (%)")
            {
            }
            column(Produccion_Planta__MER_Envasado_Entrada_KG__; "PES Envasado Entrada KG")
            {
            }
            column(Produccion_Planta__MER_Envasado_Salida_KG__; "PES Envasado Salida KG")
            {
            }
            column("Produccion_Planta__MER_Producción_RE______"; "PES Produccion RE (%)")
            {
            }
            column("Produccion_Planta__MER_Producción_Merma__"; "PES Produccion Merma")
            {
            }
            column(Produccion_Planta__MER_MP_Entrada_KG_; "PES MP Entrada KG")
            {
            }
            column(Produccion_Planta__Fecha_registro_; "Fecha registro")
            {
            }
            column(Produccion_Planta__Buque_Tercero_; "Buque Tercero")
            {
            }
            column("Producción_Planta_MerluzaCaption"; Producción_Planta_MerluzaCaptionLbl)
            {
            }
            column(Buque___ClienteCaption; Buque___ClienteCaptionLbl)
            {
            }
            column(Entrada_de_MPCaption; Entrada_de_MPCaptionLbl)
            {
            }
            column(RE____Caption; RE____CaptionLbl)
            {
            }
            column(DescarteCaption; DescarteCaptionLbl)
            {
            }
            column(EnteraCaption; EnteraCaptionLbl)
            {
            }
            column(CariocaCaption; CariocaCaptionLbl)
            {
            }
            column(RE____Caption_Control117; RE____Caption_Control117Lbl)
            {
            }
            column(Entrada_P_ECaption; Entrada_P_ECaptionLbl)
            {
            }
            column(DescarteCaption_Control121; DescarteCaption_Control121Lbl)
            {
            }
            column(Salida_KGCaption; Salida_KGCaptionLbl)
            {
            }
            column(RE____Caption_Control127; RE____Caption_Control127Lbl)
            {
            }
            column(MermaCaption; MermaCaptionLbl)
            {
            }
            column(Entrada_S_ECaption; Entrada_S_ECaptionLbl)
            {
            }
            column(DescarteCaption_Control10; DescarteCaption_Control10Lbl)
            {
            }
            column(Salida_KGCaption_Control12; Salida_KGCaption_Control12Lbl)
            {
            }
            column(RE____Caption_Control13; RE____Caption_Control13Lbl)
            {
            }
            column(MermaCaption_Control16; MermaCaption_Control16Lbl)
            {
            }
            column(Entrada_CariocaCaption; Entrada_CariocaCaptionLbl)
            {
            }
            column(DescarteCaption_Control22; DescarteCaption_Control22Lbl)
            {
            }
            column(Salida_HG_HGTCaption; Salida_HG_HGTCaptionLbl)
            {
            }
            column(RE____MermaCaption; RE____MermaCaptionLbl)
            {
            }
            column(Entrada_KGCaption; Entrada_KGCaptionLbl)
            {
            }
            column(Salida_KGCaption_Control31; Salida_KGCaption_Control31Lbl)
            {
            }
            column(RE_TotalCaption; RE_TotalCaptionLbl)
            {
            }
            column(Merma_TotalCaption; Merma_TotalCaptionLbl)
            {
            }
            column(Filete_Poca_EspinaCaption; Filete_Poca_EspinaCaptionLbl)
            {
            }
            column(Filete_Sin_EspinaCaption; Filete_Sin_EspinaCaptionLbl)
            {
            }
            column(EnvasadoCaption; EnvasadoCaptionLbl)
            {
            }
            column(Merluza_CariocaCaption; Merluza_CariocaCaptionLbl)
            {
            }
            column("ClasificaciónCaption"; ClasificaciónCaptionLbl)
            {
            }
            column(Produccion_Planta__Fecha_registro_Caption; FieldCaption("Fecha registro"))
            {
            }
            column(Produccion_Planta__Buque_Tercero_Caption; FieldCaption("Buque Tercero"))
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
        rstDep: Record "Country/Region Translation";
        "Producción_Planta_MerluzaCaptionLbl": Label 'Producción Planta Merluza';
        Buque___ClienteCaptionLbl: Label 'Buque / Cliente';
        Entrada_de_MPCaptionLbl: Label 'Entrada de MP';
        RE____CaptionLbl: Label 'RE (%)';
        DescarteCaptionLbl: Label 'Descarte';
        EnteraCaptionLbl: Label 'Entera';
        CariocaCaptionLbl: Label 'Carioca';
        RE____Caption_Control117Lbl: Label 'RE (%)';
        Entrada_P_ECaptionLbl: Label 'Entrada P/E';
        DescarteCaption_Control121Lbl: Label 'Descarte';
        Salida_KGCaptionLbl: Label 'Salida KG';
        RE____Caption_Control127Lbl: Label 'RE (%)';
        MermaCaptionLbl: Label 'Merma';
        Entrada_S_ECaptionLbl: Label 'Entrada S/E';
        DescarteCaption_Control10Lbl: Label 'Descarte';
        Salida_KGCaption_Control12Lbl: Label 'Salida KG';
        RE____Caption_Control13Lbl: Label 'RE (%)';
        MermaCaption_Control16Lbl: Label 'Merma';
        Entrada_CariocaCaptionLbl: Label 'Entrada Carioca';
        DescarteCaption_Control22Lbl: Label 'Descarte';
        Salida_HG_HGTCaptionLbl: Label 'Salida HG/HGT';
        RE____MermaCaptionLbl: Label 'RE(%)/Merma';
        Entrada_KGCaptionLbl: Label 'Entrada KG';
        Salida_KGCaption_Control31Lbl: Label 'Salida KG';
        RE_TotalCaptionLbl: Label 'RE Total';
        Merma_TotalCaptionLbl: Label 'Merma Total';
        Filete_Poca_EspinaCaptionLbl: Label 'Filete Poca Espina';
        Filete_Sin_EspinaCaptionLbl: Label 'Filete Sin Espina';
        EnvasadoCaptionLbl: Label 'Envasado';
        Merluza_CariocaCaptionLbl: Label 'Merluza Carioca';
        "ClasificaciónCaptionLbl": Label 'Clasificación';
}

