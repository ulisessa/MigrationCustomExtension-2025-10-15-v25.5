report 50067 "Orden de produccion calamar"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Producción/PlantaProceso/reports/Ordendeproduccioncalamar.rdlc';
    EnableExternalImages = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem("Produccion Planta"; "Produccion Planta")
        {
            DataItemTableView = SORTING ("Fecha produccion", "No. documento") WHERE ("Global Dimension 2" = CONST ('CAL'), "Produccion terminada" = FILTER (true));
            RequestFilterFields = "Fecha produccion", "No. documento", "No. OP", "Puerto/Aeropuerto";
            column("Produccion_Planta__Fecha_producción_"; "Fecha produccion")
            {
            }
            column("Produccion_Planta__Nombre_sección_diario_"; "Nombre seccion diario")
            {
            }
            column(Produccion_Planta__Nombre_libro_diario_; "Nombre libro diario")
            {
            }
            column(infoempresa_Picture; infoempresa.Picture)
            {
            }
            column(Logo; infoempresa."Logo path")
            {
            }
            column(Produccion_Planta__N__documento_; "No. documento")
            {
            }
            column(Filtros___________Produccion_Planta__GETFILTERS__; 'Filtros:       ' + "Produccion Planta".GetFilters())
            {
            }
            column(Produccion_Planta__Lote_origen_; "Lote origen")
            {
            }
            column(Produccion_Planta__CAL_Pelado_Entrada_KG_; "CAL Pelado Entrada KG")
            {
            }
            column(Produccion_Planta__CAL_Engorde_Entrada_KG_; "CAL Engorde Entrada KG")
            {
            }
            column(Produccion_Planta__CAL_Envasado_Entrada_KG_; "CAL Envasado Entrada KG")
            {
            }
            column(Produccion_Planta__CAL_Pelado_Vaina_KG_; "CAL Pelado Vaina KG")
            {
            }
            column(Produccion_Planta__CAL_Engorde_Salida_KG_; "CAL Engorde Salida KG")
            {
            }
            column(Produccion_Planta__CAL_Envasado_Salida_KG_; "CAL Envasado Salida KG")
            {
            }
            column(Produccion_Planta__CAL_Pelado_Vaina_RE_____; "CAL Pelado Vaina RE (%)")
            {
            }
            column(Produccion_Planta__CAL_Pelado_Rejos_KG_; "CAL Pelado Rejos KG")
            {
            }
            column(Produccion_Planta__CAL_Pelado_Rejos_RE_____; "CAL Pelado Rejos RE (%)")
            {
            }
            column(Produccion_Planta__CAL_Pelado_Aletas_KG_; "CAL Pelado Aletas KG")
            {
            }
            column(Produccion_Planta__CAL_Pelado_Aletas_RE_____; "CAL Pelado Aletas RE (%)")
            {
            }
            column(Produccion_Planta__CAL_Merma_Pelado_____; "CAL Merma Pelado (%)")
            {
            }
            column(Produccion_Planta__CAL_Engorde_RE_____; "CAL Engorde RE (%)")
            {
            }
            column(Produccion_Planta__CAL_Vaina_Sin_Engorde_KN_; "CAL Vaina Sin Engorde KN")
            {
            }
            column(Produccion_Planta__CAL_Rejo_Sin_Engorde_KN_; "CAL Rejo Sin Engorde KN")
            {
            }
            column(Produccion_Planta__CAL_Entero_Sin_Clasificar_KN_; "CAL Entero Sin Clasificar KN")
            {
            }
            column(Produccion_Planta__CAL_Residuos_KG_; "CAL Residuos KG")
            {
            }
            column(Produccion_Planta__CAL_Rejo_Sucio_MP_; "CAL Rejo Sucio MP")
            {
            }
            column("Producción_PlantaCaption"; Producción_PlantaCaptionLbl)
            {
            }
            column("Fecha_producciónCaption"; Fecha_producciónCaptionLbl)
            {
            }
            column("Produccion_Planta__Nombre_sección_diario_Caption"; FieldCaption("Nombre seccion diario"))
            {
            }
            column(Produccion_Planta__Nombre_libro_diario_Caption; FieldCaption("Nombre libro diario"))
            {
            }
            column(N__documentoCaption; N__documentoCaptionLbl)
            {
            }
            column(Produccion_Planta__Lote_origen_Caption; FieldCaption("Lote origen"))
            {
            }
            column(Descongelado_y_PeladoCaption; Descongelado_y_PeladoCaptionLbl)
            {
            }
            column(EngordeCaption; EngordeCaptionLbl)
            {
            }
            column(Entrada_MPCaption; Entrada_MPCaptionLbl)
            {
            }
            column(Entrada_VainasCaption; Entrada_VainasCaptionLbl)
            {
            }
            column(Kgs_Caption; Kgs_CaptionLbl)
            {
            }
            column(Kgs_Caption_Control70; Kgs_Caption_Control70Lbl)
            {
            }
            column(Registrado_ProduccionPlanta; "Produccion Planta".Registrado)
            {
            }
            column(EntradaCaption; EntradaCaptionLbl)
            {
            }
            column(EnvasadoCaption; EnvasadoCaptionLbl)
            {
            }
            column(Vaina_a_EngordeCaption; Vaina_a_EngordeCaptionLbl)
            {
            }
            column(Salida_Vainas_Eng_Caption; Salida_Vainas_Eng_CaptionLbl)
            {
            }
            column(SalidaCaption; SalidaCaptionLbl)
            {
            }
            column(Rend__VainaCaption; Rend__VainaCaptionLbl)
            {
            }
            column(EmptyStringCaption; EmptyStringCaptionLbl)
            {
            }
            column(Kgs_Caption_Control45; Kgs_Caption_Control45Lbl)
            {
            }
            column(Kgs_Caption_Control71; Kgs_Caption_Control71Lbl)
            {
            }
            column(Kgs_Caption_Control72; Kgs_Caption_Control72Lbl)
            {
            }
            column(Kgs_Caption_Control73; Kgs_Caption_Control73Lbl)
            {
            }
            column(RejosCaption; RejosCaptionLbl)
            {
            }
            column(Rend__RejosCaption; Rend__RejosCaptionLbl)
            {
            }
            column(EmptyStringCaption_Control65; EmptyStringCaption_Control65Lbl)
            {
            }
            column(Kgs_Caption_Control69; Kgs_Caption_Control69Lbl)
            {
            }
            column(AletasCaption; AletasCaptionLbl)
            {
            }
            column(Rend__AletasCaption; Rend__AletasCaptionLbl)
            {
            }
            column(EmptyStringCaption_Control66; EmptyStringCaption_Control66Lbl)
            {
            }
            column(Kgs_Caption_Control63; Kgs_Caption_Control63Lbl)
            {
            }
            column(Produccion_Planta__CAL_Merma_Pelado_____Caption; FieldCaption("CAL Merma Pelado (%)"))
            {
            }
            column(Rend__EngordeCaption; Rend__EngordeCaptionLbl)
            {
            }
            column(EmptyStringCaption_Control67; EmptyStringCaption_Control67Lbl)
            {
            }
            column(EmptyStringCaption_Control68; EmptyStringCaption_Control68Lbl)
            {
            }
            column(Sin_EngordeCaption; Sin_EngordeCaptionLbl)
            {
            }
            column(Vaina_Sin_EngordeCaption; Vaina_Sin_EngordeCaptionLbl)
            {
            }
            column(Rejo_Sin_EngordeCaption; Rejo_Sin_EngordeCaptionLbl)
            {
            }
            column(Entero_Sin_ClasificarCaption; Entero_Sin_ClasificarCaptionLbl)
            {
            }
            column(ResiduosCaption; ResiduosCaptionLbl)
            {
            }
            column(Rejo_SucioCaption; Rejo_SucioCaptionLbl)
            {
            }
            column(Kgs_Caption_Control1000000002; Kgs_Caption_Control1000000002Lbl)
            {
            }
            column(DescongeladoCaption; DescongeladoCaptionLbl)
            {
            }
            dataitem("Lin. produccion planta"; "Lin. produccion planta")
            {
                DataItemLink = "No. documento" = FIELD ("No. documento");
                DataItemTableView = SORTING ("Nombre libro diario", "Nombre seccion diario", "No. documento", "No. línea");
                column("Lín__produccion_planta__Kilos_netos_"; "Kilos netos")
                {
                }
                column("Lín__produccion_planta__Kilos_brutos_"; "Kilos brutos")
                {
                }
                column("Lín__produccion_planta__Lín__produccion_planta___Lote_origen_"; "Lin. produccion planta"."Lote origen")
                {
                }
                column("Lín__produccion_planta_Cantidad"; Cantidad)
                {
                }
                column("Lín__produccion_planta_Descripción"; Descripcion)
                {
                }
                column("Lín__produccion_planta__Lín__produccion_planta__Clasificación"; "Lin. produccion planta".Clasificacion)
                {
                }
                column(VarMPPT; VarMPPT)
                {
                }
                column(Kilos_brutosCaption; Kilos_brutosCaptionLbl)
                {
                }
                column(Kilos_netosCaption; Kilos_netosCaptionLbl)
                {
                }
                column(LoteCaption; LoteCaptionLbl)
                {
                }
                column(CantidadCaption; CantidadCaptionLbl)
                {
                }
                column("DescripciónCaption"; DescripciónCaptionLbl)
                {
                }
                column("ClasificaciónCaption"; ClasificaciónCaptionLbl)
                {
                }
                column(MP_PTCaption; MP_PTCaptionLbl)
                {
                }
                column("Lín__produccion_planta_Nombre_libro_diario"; "Nombre libro diario")
                {
                }
                column("Lín__produccion_planta_Nombre_sección_diario"; "Nombre seccion diario")
                {
                }
                column("Lín__produccion_planta_No__documento"; "No. documento")
                {
                }
                column("Lín__produccion_planta_N__línea"; "No. línea")
                {
                }

                trigger OnAfterGetRecord()
                begin

                    if Tipo = Tipo::Entrada then
                        VarMPPT := 'PT'
                    else
                        VarMPPT := 'MP';
                end;
            }
            dataitem("Item Ledger Entry"; "Item Ledger Entry")
            {
                DataItemLink = "Document No." = FIELD ("No. documento");
                DataItemTableView = SORTING ("Document No.", "Document Type", "Document Line No.") WHERE (Revertido = CONST (false));
                column(Netkilos_ItemLedgerEntry; "Item Ledger Entry"."Net kilos")
                {
                }
                column(EntryType_ItemLedgerEntry; "Item Ledger Entry"."Entry Type")
                {
                }
                column(DocumentNo_ItemLedgerEntry; "Item Ledger Entry"."Document No.")
                {
                }
                column(Description_ItemLedgerEntry; "Item Ledger Entry".Description)
                {
                }
                column(LocationCode_ItemLedgerEntry; "Item Ledger Entry"."Location Code")
                {
                }
                column(Quantity_ItemLedgerEntry; "Item Ledger Entry".Quantity)
                {
                }
                column(ItemNo_ItemLedgerEntry; "Item Ledger Entry"."Item No.")
                {
                }
                column(Grosskilos_ItemLedgerEntry; "Item Ledger Entry"."Gross kilos")
                {
                }
                column(Palletno_ItemLedgerEntry; "Item Ledger Entry"."Pallet no.")
                {
                }
                column(Noproyecto_ItemLedgerEntry; "Item Ledger Entry"."No. proyecto")
                {
                }
                column(Loteorigen_ItemLedgerEntry; "Item Ledger Entry"."Lote origen")
                {
                }
            }

            trigger OnPreDataItem()
            begin
                Clear(infoempresa);
                infoempresa.Get;
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

    var
        VarMPPT: Code[10];
        infoempresa: Record "Company Information";
        "Producción_PlantaCaptionLbl": Label 'Producción Planta';
        "Fecha_producciónCaptionLbl": Label 'Fecha producción';
        N__documentoCaptionLbl: Label 'Nº documento';
        Descongelado_y_PeladoCaptionLbl: Label 'Descongelado y Pelado';
        EngordeCaptionLbl: Label 'Engorde';
        Entrada_MPCaptionLbl: Label 'Entrada MP';
        Entrada_VainasCaptionLbl: Label 'Entrada Vainas';
        Kgs_CaptionLbl: Label 'Kgs.';
        Kgs_Caption_Control70Lbl: Label 'Kgs.';
        EntradaCaptionLbl: Label 'Entrada';
        EnvasadoCaptionLbl: Label 'Envasado';
        Vaina_a_EngordeCaptionLbl: Label 'Vaina a Engorde';
        Salida_Vainas_Eng_CaptionLbl: Label 'Salida Vainas Eng.';
        SalidaCaptionLbl: Label 'Salida';
        Rend__VainaCaptionLbl: Label 'Rend. Vaina';
        EmptyStringCaptionLbl: Label '%';
        Kgs_Caption_Control45Lbl: Label 'Kgs.';
        Kgs_Caption_Control71Lbl: Label 'Kgs.';
        Kgs_Caption_Control72Lbl: Label 'Kgs.';
        Kgs_Caption_Control73Lbl: Label 'Kgs.';
        RejosCaptionLbl: Label 'Rejos';
        Rend__RejosCaptionLbl: Label 'Rend. Rejos';
        EmptyStringCaption_Control65Lbl: Label '%';
        Kgs_Caption_Control69Lbl: Label 'Kgs.';
        AletasCaptionLbl: Label 'Aletas';
        Rend__AletasCaptionLbl: Label 'Rend. Aletas';
        EmptyStringCaption_Control66Lbl: Label '%';
        Kgs_Caption_Control63Lbl: Label 'Kgs.';
        Rend__EngordeCaptionLbl: Label 'Rend. Engorde';
        EmptyStringCaption_Control67Lbl: Label '%';
        EmptyStringCaption_Control68Lbl: Label '%';
        Sin_EngordeCaptionLbl: Label 'Sin Engorde';
        Vaina_Sin_EngordeCaptionLbl: Label 'Vaina Sin Engorde';
        Rejo_Sin_EngordeCaptionLbl: Label 'Rejo Sin Engorde';
        Entero_Sin_ClasificarCaptionLbl: Label 'Entero Sin Clasificar';
        ResiduosCaptionLbl: Label 'Residuos';
        Rejo_SucioCaptionLbl: Label 'Rejo Sucio';
        Kgs_Caption_Control1000000002Lbl: Label 'Kgs.';
        DescongeladoCaptionLbl: Label 'Descongelado';
        Kilos_brutosCaptionLbl: Label 'Kilos brutos';
        Kilos_netosCaptionLbl: Label 'Kilos netos';
        LoteCaptionLbl: Label 'Lote';
        CantidadCaptionLbl: Label 'Cantidad';
        "DescripciónCaptionLbl": Label 'Descripción';
        "ClasificaciónCaptionLbl": Label 'Clasificación';
        MP_PTCaptionLbl: Label 'MP/PT';
}

