report 50066 "produccion estadistica calamar"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Producción/PlantaProceso/reports/produccionestadisticacalamar.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem("Produccion Planta"; "Produccion Planta")
        {
            DataItemTableView = ORDER(Ascending) WHERE (Registrado = CONST (true), "Global Dimension 2" = FILTER ('CAL'), "Produccion terminada" = FILTER (true), Anulado = CONST (false));
            RequestFilterFields = "Fecha produccion", "No. documento", "Global Dimension 1", "Lote origen", "Proyecto Origen";
            column(COMPANYNAME; CompanyName)
            {
            }
            column(FILTRO___________Produccion_Planta__GETFILTERS__; 'FILTRO : .....' + "Produccion Planta".GetFilters())
            {
            }
            column("Página_____FORMAT_CurrReport_PAGENO_"; 'Página:  ')
            {
            }
            column(strNombre; strNombre)
            {
            }
            column(Logo; rstCI."Logo path")
            {
            }
            column("Produccion_Planta__Fecha_producción_"; "Fecha produccion")
            {
            }
            column(Produccion_Planta__CAL_Vaina_MP_; "CAL Vaina MP")
            {
            }
            column(Produccion_Planta__CAL_Entero_MP_; "CAL Entero MP")
            {
            }
            column(Produccion_Planta__CAL_Engorde_Salida_KG_; "CAL Engorde Salida KG")
            {
            }
            column(Produccion_Planta__CAL_Pelado_Vaina_KG_; "CAL Pelado Vaina KG")
            {
            }
            column(Produccion_Planta__CAL_Pelado_Rejos_KG_; "CAL Pelado Rejos KG")
            {
            }
            column(Produccion_Planta__CAL_Pelado_Aletas_KG_; "CAL Pelado Aletas KG")
            {
            }
            column(Produccion_Planta__CAL_Vaina_Sin_Engorde_KN_; "CAL Vaina Sin Engorde KN")
            {
            }
            column(Produccion_Planta__CAL_Rejo_Sin_Engorde_KN_; "CAL Rejo Sin Engorde KN")
            {
            }
            column(Produccion_Planta__CAL_Envasado_Salida_KG_; "CAL Envasado Salida KG")
            {
            }
            column(Produccion_Planta__CAL_Residuos_KG_; "CAL Residuos KG")
            {
            }
            column(Produccion_Planta__CAL_Engorde_RE_____; "CAL Engorde RE (%)")
            {
                DecimalPlaces = 2 : 2;
            }
            column(Produccion_Planta__CAL_Pelado_Vaina_RE_____; "CAL Pelado Vaina RE (%)")
            {
                DecimalPlaces = 2 : 2;
            }
            column(Produccion_Planta__CAL_Pelado_Rejos_RE_____; "CAL Pelado Rejos RE (%)")
            {
                DecimalPlaces = 2 : 2;
            }
            column(Produccion_Planta__CAL_Pelado_Aletas_RE_____; "CAL Pelado Aletas RE (%)")
            {
                DecimalPlaces = 2 : 2;
            }
            column("Produccion_Planta__CAL_Producción_RE_____"; "CAL Produccion RE (%)")
            {
                DecimalPlaces = 2 : 2;
            }
            column(Produccion_Planta__CAL_Merma_Pelado_____; "CAL Merma Pelado (%)")
            {
                DecimalPlaces = 2 : 2;
            }
            column(strNombre_Control2; strNombre)
            {
            }
            column(Produccion_Planta__CAL_Vaina_MP__Control7; "CAL Vaina MP")
            {
            }
            column(Produccion_Planta__CAL_Pelado_Rejos_KG__Control13; "CAL Pelado Rejos KG")
            {
            }
            column(Produccion_Planta__CAL_Engorde_Salida_KG__Control19; "CAL Engorde Salida KG")
            {
            }
            column(Produccion_Planta__CAL_Pelado_Vaina_KG__Control25; "CAL Pelado Vaina KG")
            {
            }
            column(Produccion_Planta__CAL_Envasado_Salida_KG__Control29; "CAL Envasado Salida KG")
            {
            }
            column(Produccion_Planta__CAL_Pelado_Aletas_KG__Control23; "CAL Pelado Aletas KG")
            {
            }
            column("Produccion_Planta__Fecha_producción__Control12"; "Fecha produccion")
            {
            }
            column(Produccion_Planta__CAL_Pelado_Vaina_RE______Control5; "CAL Pelado Vaina RE (%)")
            {
                DecimalPlaces = 2 : 2;
            }
            column(Produccion_Planta__CAL_Pelado_Rejos_RE______Control15; "CAL Pelado Rejos RE (%)")
            {
                DecimalPlaces = 2 : 2;
            }
            column(Produccion_Planta__CAL_Pelado_Aletas_RE______Control18; "CAL Pelado Aletas RE (%)")
            {
                DecimalPlaces = 2 : 2;
            }
            column("Produccion_Planta__CAL_Producción_RE______Control22"; "CAL Produccion RE (%)")
            {
                DecimalPlaces = 2 : 2;
            }
            column(Produccion_Planta__CAL_Merma_Pelado______Control31; "CAL Merma Pelado (%)")
            {
                DecimalPlaces = 2 : 2;
            }
            column(Produccion_Planta__CAL_Residuos_KG__Control58; "CAL Residuos KG")
            {
            }
            column(Produccion_Planta__CAL_Vaina_Sin_Engorde_KN__Control8; "CAL Vaina Sin Engorde KN")
            {
            }
            column(Produccion_Planta__CAL_Rejo_Sin_Engorde_KN__Control41; "CAL Rejo Sin Engorde KN")
            {
            }
            column(Produccion_Planta__CAL_Engorde_RE______Control27; "CAL Engorde RE (%)")
            {
                DecimalPlaces = 2 : 2;
            }
            column(Produccion_Planta__CAL_Entero_MP__Control1000000001; "CAL Entero MP")
            {
            }
            column(strNombre_Control39; strNombre)
            {
            }
            column(Produccion_Planta__CAL_Pelado_Vaina_KG__Control36; "CAL Pelado Vaina KG")
            {
            }
            column(Produccion_Planta__CAL_Pelado_Rejos_KG__Control43; "CAL Pelado Rejos KG")
            {
            }
            column(Produccion_Planta__CAL_Pelado_Aletas_KG__Control47; "CAL Pelado Aletas KG")
            {
            }
            column(Produccion_Planta__CAL_Vaina_Sin_Engorde_KN__Control48; "CAL Vaina Sin Engorde KN")
            {
            }
            column(Produccion_Planta__CAL_Rejo_Sin_Engorde_KN__Control49; "CAL Rejo Sin Engorde KN")
            {
            }
            column(Produccion_Planta__CAL_Residuos_KG__Control50; "CAL Residuos KG")
            {
            }
            column(Produccion_Planta__CAL_Envasado_Salida_KG__Control51; "CAL Envasado Salida KG")
            {
            }
            column(Produccion_Planta__CAL_Engorde_Salida_KG__Control40; "CAL Engorde Salida KG")
            {
            }
            column(Produccion_Planta__CAL_Entero_MP__Control1000000002; "CAL Entero MP")
            {
            }
            column(Produccion_Planta__CAL_Vaina_MP__Control1000000003; "CAL Vaina MP")
            {
            }
            column(Produccion_Planta__Proyecto_Origen_; "Proyecto Origen")
            {
            }
            column(Produccion_Planta__CAL_Pelado_Vaina_KG__Control53; "CAL Pelado Vaina KG")
            {
            }
            column(Produccion_Planta__CAL_Pelado_Rejos_KG__Control55; "CAL Pelado Rejos KG")
            {
            }
            column(Produccion_Planta__CAL_Pelado_Aletas_KG__Control56; "CAL Pelado Aletas KG")
            {
            }
            column(Produccion_Planta__CAL_Vaina_Sin_Engorde_KN__Control57; "CAL Vaina Sin Engorde KN")
            {
            }
            column(Produccion_Planta__CAL_Rejo_Sin_Engorde_KN__Control60; "CAL Rejo Sin Engorde KN")
            {
            }
            column(Produccion_Planta__CAL_Residuos_KG__Control61; "CAL Residuos KG")
            {
            }
            column(Produccion_Planta__CAL_Envasado_Salida_KG__Control62; "CAL Envasado Salida KG")
            {
            }
            column(Produccion_Planta__CAL_Engorde_Salida_KG__Control54; "CAL Engorde Salida KG")
            {
            }
            column(Produccion_Planta__CAL_Entero_MP__Control1000000004; "CAL Entero MP")
            {
            }
            column(Produccion_Planta__CAL_Vaina_MP__Control1000000005; "CAL Vaina MP")
            {
            }
            column(Produccion_Planta__CAL_Pelado_Vaina_KG__Control64; "CAL Pelado Vaina KG")
            {
            }
            column(Produccion_Planta__CAL_Pelado_Rejos_KG__Control66; "CAL Pelado Rejos KG")
            {
            }
            column(Produccion_Planta__CAL_Pelado_Aletas_KG__Control67; "CAL Pelado Aletas KG")
            {
            }
            column(Produccion_Planta__CAL_Vaina_Sin_Engorde_KN__Control68; "CAL Vaina Sin Engorde KN")
            {
            }
            column(Produccion_Planta__CAL_Rejo_Sin_Engorde_KN__Control69; "CAL Rejo Sin Engorde KN")
            {
            }
            column(Produccion_Planta__CAL_Residuos_KG__Control70; "CAL Residuos KG")
            {
            }
            column(Produccion_Planta__CAL_Envasado_Salida_KG__Control71; "CAL Envasado Salida KG")
            {
            }
            column(Produccion_Planta__CAL_Engorde_Salida_KG__Control65; "CAL Engorde Salida KG")
            {
            }
            column(Produccion_Planta__CAL_Entero_MP__Control1000000006; "CAL Entero MP")
            {
            }
            column(Produccion_Planta__CAL_Vaina_MP__Control1000000007; "CAL Vaina MP")
            {
            }
            column("Producción_Planta_CalamarCaption"; Producción_Planta_CalamarCaptionLbl)
            {
            }
            column(Buque___ClienteCaption; Buque___ClienteCaptionLbl)
            {
            }
            column(Calamar_Elaborado_Rejos_KGNCaption; Calamar_Elaborado_Rejos_KGNCaptionLbl)
            {
            }
            column(Calamar_Elaborado_Aletas_KGNCaption; Calamar_Elaborado_Aletas_KGNCaptionLbl)
            {
            }
            column(Engorde_Vaina__RE_Caption; Engorde_Vaina__RE_CaptionLbl)
            {
            }
            column(Materia_Prima_Vaina_KGBCaption; Materia_Prima_Vaina_KGBCaptionLbl)
            {
            }
            column(Vainas_Engordadas_KGNCaption; Vainas_Engordadas_KGNCaptionLbl)
            {
            }
            column(Vainas_para_EngordeCaption; Vainas_para_EngordeCaptionLbl)
            {
            }
            column(Producto_Terminado_KGN_S_ResiduosCaption; Producto_Terminado_KGN_S_ResiduosCaptionLbl)
            {
            }
            column(Fecha_prod_Caption; Fecha_prod_CaptionLbl)
            {
            }
            column(Produccion_Planta__CAL_Pelado_Aletas_RE______Control18Caption; FieldCaption("CAL Pelado Aletas RE (%)"))
            {
            }
            column(Produccion_Planta__CAL_Pelado_Rejos_RE______Control15Caption; FieldCaption("CAL Pelado Rejos RE (%)"))
            {
            }
            column(Produccion_Planta__CAL_Pelado_Vaina_RE______Control5Caption; FieldCaption("CAL Pelado Vaina RE (%)"))
            {
            }
            column("Produccion_Planta__CAL_Producción_RE______Control22Caption"; FieldCaption("CAL Produccion RE (%)"))
            {
            }
            column(Produccion_Planta__CAL_Merma_Pelado______Control31Caption; FieldCaption("CAL Merma Pelado (%)"))
            {
            }
            column(Produccion_Planta__CAL_Residuos_KG__Control58Caption; FieldCaption("CAL Residuos KG"))
            {
            }
            column(Produccion_Planta__CAL_Vaina_Sin_Engorde_KN__Control8Caption; FieldCaption("CAL Vaina Sin Engorde KN"))
            {
            }
            column(Produccion_Planta__CAL_Rejo_Sin_Engorde_KN__Control41Caption; FieldCaption("CAL Rejo Sin Engorde KN"))
            {
            }
            column(Materia_Prima_Entero_KGBCaption; Materia_Prima_Entero_KGBCaptionLbl)
            {
            }
            column(Total_General_Caption; Total_General_CaptionLbl)
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
            column(Produccion_Planta_Lote_origen; "Lote origen")
            {
            }

            trigger OnPreDataItem()
            begin
                if blnOrdenaBuque then
                    "Produccion Planta".SetCurrentKey("Produccion Planta"."Lote origen", "Produccion Planta"."Fecha produccion");
                if blnOrdenaProy then
                    "Produccion Planta".SetCurrentKey("Produccion Planta"."Proyecto Origen");
            end;
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

    trigger OnInitReport()
    begin
        blnDetalle := true;
        blnOrdenaBuque := true;
    end;

    var
        VarMPPT: Code[10];
        rstDep: Record "Country/Region Translation";
        blnDetalle: Boolean;
        strNombre: Text[250];
        blnOrdenaBuque: Boolean;
        blnOrdenaProy: Boolean;
        "Producción_Planta_CalamarCaptionLbl": Label 'Producción Planta Calamar';
        Buque___ClienteCaptionLbl: Label 'Buque / Cliente';
        Calamar_Elaborado_Rejos_KGNCaptionLbl: Label 'Calamar Elaborado Rejos KGN';
        Calamar_Elaborado_Aletas_KGNCaptionLbl: Label 'Calamar Elaborado Aletas KGN';
        Engorde_Vaina__RE_CaptionLbl: Label 'Engorde Vaina (RE)';
        Materia_Prima_Vaina_KGBCaptionLbl: Label 'Materia Prima Vaina KGB';
        Vainas_Engordadas_KGNCaptionLbl: Label 'Vainas Engordadas KGN';
        Vainas_para_EngordeCaptionLbl: Label 'Vainas para Engorde';
        Producto_Terminado_KGN_S_ResiduosCaptionLbl: Label 'Producto Terminado KGN S/Residuos';
        Fecha_prod_CaptionLbl: Label 'Fecha prod.';
        Materia_Prima_Entero_KGBCaptionLbl: Label 'Materia Prima Entero KGB';
        Total_General_CaptionLbl: Label 'Total General:';
        rstCI: Record "Company Information";
}

