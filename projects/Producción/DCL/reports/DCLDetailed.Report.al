report 50034 "DCL Detailed"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Producción/DCL/reports/DCLDetailed.rdlc';
    Caption = 'Saldos de DCL';
    EnableExternalImages = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem("Sales & Receivables Setup"; "Sales & Receivables Setup")
        {
            DataItemTableView = SORTING("Primary Key");
            PrintOnlyIfDetail = true;
        }
        dataitem("Dimension Value"; "Dimension Value")
        {
            DataItemTableView = WHERE("Global Dimension No." = CONST(2));
            PrintOnlyIfDetail = true;
            RequestFilterFields = "Code", "Filtro fecha";

            trigger OnPreDataItem()
            var
                rst27: Record Item;
            begin
            end;
        }
        dataitem(Item; "Integer")
        {
            column(Filtro; strFiltro)
            {
            }
            column(ConSaldo; blnSaldo)
            {
            }
            column(PorItem; blnDetalladoItem)
            {
            }
            column(Logo; rstCI."Logo path")
            {
            }
            column(Actividad; codAct)
            {
            }
            column(LocationName; codJob)
            {
            }
            column(ItemDesc; l_rst27.Description)
            {
            }
            column(ItemNo; l_rst27."No.")
            {
            }
            column(Quant; decQty)
            {
            }
            column(KN; decKN)
            {
            }
            column(KNDescontados; decDescontados)
            {
            }
            column(KNAplicados; -decAplicados)
            {
            }
            column(KNSaldo; decSaldo)
            {
            }

            trigger OnAfterGetRecord()
            var
                l_rstLDCL: Record "Lín. DCL";
                l_rstDCLAplicados: Record "DCL Application Lines";
            begin
                if blnDetalladoItem then begin
                    if not qryItemLE.Read then
                        CurrReport.Break;
                    decQty := 0;
                    decKN := 0;
                    codAct := '';
                    codJob := '';

                    decQty := qryItemLE.Sum_Cantidad;
                    decKN := qryItemLE.KN_originales;

                    codAct := qryItemLE.Actividad;
                    codJob := qryItemLE.N_proyecto;
                    Clear(l_rst27);
                    if l_rst27.Get(qryItemLE.Clasificacion) then;
                    decAplicados := 0;

                    Clear(l_rstDCLAplicados);
                    l_rstDCLAplicados.SetRange("DCL Job no.", qryItemLE.N_proyecto);
                    l_rstDCLAplicados.SetRange(Activity, qryItemLE.Actividad);
                    //l_rstDCLLine.CALCSUMS("Origin kilos");

                    if (l_rst27."Seguimiento para trazabilidad" = l_rst27."Seguimiento para trazabilidad"::"Forzar uso de L.M.") and (blnDetalladoItem) then
                        l_rstDCLAplicados.SetRange("Original Item no.", qryItemLE.Clasificacion);
                    if l_rstDCLAplicados.FindSet then begin
                        l_rstDCLAplicados.CalcSums("Origin kilos");
                        decAplicados := l_rstDCLAplicados."Origin kilos";
                    end;

                    decDescontados := 0;

                    Clear(l_rstLDCL);
                    l_rstLDCL.SetRange("No. proyecto", qryItemLE.N_proyecto);
                    l_rstLDCL.SetRange(Actividad, qryItemLE.Actividad);
                    l_rstLDCL.SetFilter("Kilos netos", '<%1', 0);
                    if (l_rst27."Seguimiento para trazabilidad" = l_rst27."Seguimiento para trazabilidad"::"Forzar uso de L.M.") and (blnDetalladoItem) then
                        l_rstLDCL.SetRange(Clasificación, qryItemLE.Clasificacion);
                    if l_rstLDCL.FindSet then
                        repeat
                            l_rstLDCL.CalcSums("Kilos netos");
                            decDescontados := l_rstLDCL."Kilos netos";
                        until l_rstLDCL.Next = 0;


                    Clear(l_rstLDCL);
                    l_rstLDCL.SetRange("No. proyecto", qryItemLE.N_proyecto);
                    l_rstLDCL.SetRange(Actividad, qryItemLE.Actividad);
                    l_rstLDCL.SetFilter("Kilos netos", '>%1', 0);
                    if (l_rst27."Seguimiento para trazabilidad" = l_rst27."Seguimiento para trazabilidad"::"Forzar uso de L.M.") and (blnDetalladoItem) then
                        l_rstLDCL.SetRange(Clasificación, qryItemLE.Clasificacion);

                    if l_rstLDCL.FindSet then
                        repeat
                            l_rstLDCL.CalcSums("Kilos netos");
                            decKN := l_rstLDCL."Kilos netos";
                        until l_rstLDCL.Next = 0;
                end
                else begin
                    if not qryItemAC.Read then
                        CurrReport.Break;
                    decQty := 0;
                    decKN := 0;

                    decQty := qryItemAC.Sum_Cantidad;
                    decKN := qryItemAC.KN_originales;
                    codAct := qryItemAC.Actividad;
                    codJob := qryItemAC.N_proyecto;
                    decAplicados := 0;

                    Clear(l_rstDCLAplicados);
                    l_rstDCLAplicados.SetRange("DCL Job no.", qryItemAC.N_proyecto);
                    l_rstDCLAplicados.SetRange(Activity, qryItemAC.Actividad);
                    if l_rstDCLAplicados.FindSet then begin
                        l_rstDCLAplicados.CalcSums("Origin kilos");
                        decAplicados := l_rstDCLAplicados."Origin kilos";
                    end;

                    decDescontados := 0;

                    Clear(l_rstLDCL);
                    l_rstLDCL.SetRange("No. proyecto", qryItemAC.N_proyecto);
                    l_rstLDCL.SetRange(Actividad, qryItemAC.Actividad);
                    l_rstLDCL.SetFilter("Kilos netos", '<%1', 0);
                    if l_rstLDCL.FindSet then
                        repeat
                            l_rstLDCL.CalcSums("Kilos netos");
                            decDescontados := l_rstLDCL."Kilos netos";
                        until l_rstLDCL.Next = 0;


                    Clear(l_rstLDCL);
                    l_rstLDCL.SetRange("No. proyecto", qryItemAC.N_proyecto);
                    l_rstLDCL.SetRange(Actividad, qryItemAC.Actividad);
                    l_rstLDCL.SetFilter("Kilos netos", '>%1', 0);
                    if l_rstLDCL.FindSet then
                        repeat
                            l_rstLDCL.CalcSums("Kilos netos");
                            decKN := l_rstLDCL."Kilos netos";
                        until l_rstLDCL.Next = 0;
                end;
                decSaldo := 0;
                decSaldo := decKN + decDescontados - decAplicados;

                if blnSaldo and (decSaldo = 0) then
                    CurrReport.Skip;
            end;

            trigger OnPostDataItem()
            begin
                if blnDetalladoItem then
                    qryItemLE.Close
                else
                    qryItemAC.Close;
            end;

            trigger OnPreDataItem()
            begin
                Clear(rstCI);
                rstCI.Get;
                if blnDetalladoItem then begin
                    if "Dimension Value".GetFilter("Filtro fecha") <> '' then
                        qryItemLE.SetFilter(Filtro_Fecha, "Dimension Value".GetFilter("Filtro fecha"));
                    if "Dimension Value".GetFilter(Code) <> '' then
                        qryItemLE.SetFilter(Filtro_Actividad, "Dimension Value".GetFilter(Code));
                    if "Dimension Value".GetFilter(Code) = '' then
                        qryItemLE.SetFilter(Filtro_Actividad, '<>%1', '');

                    strFiltro := qryItemLE.GetFilters;
                    qryItemLE.Open;
                end
                else begin
                    if "Dimension Value".GetFilter("Filtro fecha") <> '' then
                        qryItemAC.SetFilter(Filtro_Fecha, "Dimension Value".GetFilter("Filtro fecha"));
                    if "Dimension Value".GetFilter(Code) <> '' then
                        qryItemAC.SetFilter(Filtro_Actividad, "Dimension Value".GetFilter(Code));
                    if "Dimension Value".GetFilter(Code) = '' then
                        qryItemAC.SetFilter(Filtro_Actividad, '<>%1', '');

                    strFiltro := qryItemAC.GetFilters;
                    qryItemAC.Open;
                end;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                field("Mostrar DCL con saldo"; blnSaldo)
                {
                }
                field("Detallar por clasificación"; blnDetalladoItem)
                {
                }
            }
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
        StartDate := 0D;
        EndDate := Today;
        blnSaldo := true;
        blnDetalladoItem := false;
    end;

    var
        StartDate: Date;
        EndDate: Date;
        ActivFilt: Text;
        LotFilt: Text;
        ItemFilt: Text;
        rstCI: Record "Company Information";
        strFiltro: Text;
        datFiltro: Text;
        decQty: Decimal;
        decKN: Decimal;
        decKB: Decimal;
        qryItemLE: Query DCL;
        decAplicados: Decimal;
        decSaldo: Decimal;
        decDescontados: Decimal;
        blnSaldo: Boolean;
        blnDetalladoItem: Boolean;
        qryItemAC: Query "DCL por actividad";
        codJob: Code[20];
        codAct: Code[10];
        l_rst27: Record Item;
}

