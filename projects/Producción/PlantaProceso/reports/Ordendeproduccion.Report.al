report 50069 "Orden de produccion"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Producción/PlantaProceso/reports/Ordendeproduccion.rdlc';
    EnableExternalImages = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem("Produccion Planta"; "Produccion Planta")
        {
            DataItemTableView = SORTING("Fecha produccion", "No. documento") WHERE("Produccion terminada" = FILTER(true));
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
            column(Nombrelibrodiario_ProduccionPlanta; "Produccion Planta"."Nombre libro diario")
            {
            }
            column(Nombresecciondiario_ProduccionPlanta; "Produccion Planta"."Nombre seccion diario")
            {
            }
            column(Produccion_Planta__Lote_origen_; "Lote origen")
            {
            }
            column(EntradaMP; decMP)
            {
            }
            column(SalidaPT; decPT)
            {
            }
            column(ProdRe; decProdRe)
            {
            }
            column(ProdMerm; decPT - decMP)
            {
            }
            column(Registrado_ProduccionPlanta; "Produccion Planta".Registrado)
            {
            }
            dataitem("Lin. produccion planta"; "Lin. produccion planta")
            {
                DataItemLink = "No. documento" = FIELD("No. documento");
                DataItemTableView = SORTING("Nombre libro diario", "Nombre seccion diario", "No. documento", "No. línea");
                column(KilosNetos; "Kilos netos")
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
                column(UnidadMedida; "Lin. produccion planta"."Unidad medida")
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
                column(Familia; rstFam.Code)
                {
                }
                column(Subfamilia; rstSubFam."Descripción mínima")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    Clear(rstItem);
                    rstItem.Get("Lin. produccion planta".Clasificacion);

                    Clear(rstFam);
                    rstFam.Get(Familia);

                    Clear(rstSubFam);
                    rstSubFam.Get(Familia, Subfamilia);

                    if Tipo = Tipo::Entrada then
                        VarMPPT := 'PT'
                    else
                        VarMPPT := 'MP';

                    if "Kilos netos" < 0 then
                        "Kilos netos" := "Kilos netos" * -1;
                end;
            }
            dataitem("Item Ledger Entry"; "Item Ledger Entry")
            {
                DataItemLink = "Document No." = FIELD("No. documento");
                DataItemTableView = SORTING("Document No.", "Document Type", "Document Line No.") WHERE(Revertido = CONST(false), "Item Category Code" = CONST('PESCA'));
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
                column(Categoria; "Item Ledger Entry"."Item Category Code")
                {
                }
                column(FamiliaR; rstFam.Code)
                {
                }
                column(SubfamiliaR; rstSubFam.Description)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    Clear(rstItem);
                    rstItem.Get("Item No.");

                    Clear(rstFam);
                    rstFam.Get(Family);

                    Clear(rstSubFam);
                    rstSubFam.Get(Family, Subfamily);
                end;
            }
            dataitem("Lín. vale consumo"; "Lín. vale consumo")
            {
                DataItemLink = "No. documento" = FIELD("No. documento");
                DataItemTableView = SORTING("No. documento", "No. línea") WHERE(Revertido = FILTER(false));
                column("N_Línvaleconsumo"; "Lín. vale consumo"."No.")
                {
                }
                column("Descripción_Línvaleconsumo"; "Lín. vale consumo".Descripción)
                {
                }
                column("Códunidadmedida_Línvaleconsumo"; "Lín. vale consumo"."Cód. unidad medida")
                {
                }
                column("Cantidad_Línvaleconsumo"; "Lín. vale consumo".Cantidad)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                Clear(infoempresa);
                infoempresa.Get;
                decClasifEntrada := "Produccion Planta"."PES Filete Clasif. Entrada KG";
                decClasifSalida := "Produccion Planta"."PES Filete Clasif. Salida KG";
                decClasifDEscarte := "Produccion Planta"."PES Clasificacion Descarte";
                decClasifRen := "Produccion Planta"."PES Clasificacion RE (%)";
                decEnvEntrada := "Produccion Planta"."PES Envasado Entrada KG";
                decEnvSalida := "Produccion Planta"."PES Envasado Salida KG";
                decProdRe := "Produccion Planta"."PES Produccion RE (%)";
                decProdMerm := "Produccion Planta"."PES Produccion Merma";
                decMP := Abs("Produccion Planta"."CAL Entrada MP" + "Produccion Planta"."FRE Entrada KG" + "Produccion Planta"."PES MP Entrada KG");
                decPT := Abs("Produccion Planta"."CAL Envasado Salida KG" + "Produccion Planta"."PES Envasado Salida KG" + "Produccion Planta"."FRE Envasado Salida KG");
                decProdRe := Round((decPT / decMP) * 100, 0.01);
                decProdMerm := decPT - decMP;
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
        decClasifEntrada: Decimal;
        decClasifSalida: Decimal;
        decClasifDEscarte: Decimal;
        decClasifRen: Decimal;
        decEnvEntrada: Decimal;
        decEnvSalida: Decimal;
        decProdRe: Decimal;
        decProdMerm: Decimal;
        rstItem: Record Item;
        rstFam: Record "Familia producto";
        rstSubFam: Record "Subfamilia producto";
        decMP: Decimal;
        decPT: Decimal;
}

