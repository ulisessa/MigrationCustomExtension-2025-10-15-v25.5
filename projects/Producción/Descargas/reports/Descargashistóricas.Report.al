report 50008 "Descargas históricas"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Producción/Descargas/reports/Descargashistóricas.rdlc';
    EnableExternalImages = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.", "Date Filter", "Global Dimension 2 Filter", "Lot No. Filter";
            column(Logo; rstCI."Logo path")
            {
            }

            trigger OnAfterGetRecord()
            begin
                Clear(rstCI);
                rstCI.Get;
            end;
        }
        dataitem("Integer"; "Integer")
        {
            column(LocationName; qryItemLE.Item_No)
            {
            }
            column(BuqueNom; qryItemLE.Global_Dimension_1_Code)
            {
            }
            column(ItemNo; qryItemLE.Item_No)
            {
            }
            column(ItemDesc; qryItemLE.Description)
            {
            }
            column(LoteOrig; qryItemLE.Lote_origen)
            {
            }
            column(Quant; qryItemLE.Sum_Quantity)
            {
            }
            column(KN; qryItemLE.Sum_Net_kilos)
            {
            }
            column(Filtro; strFiltro)
            {
            }

            trigger OnAfterGetRecord()
            begin
                if not qryItemLE.Read then
                    CurrReport.Break;
            end;

            trigger OnPostDataItem()
            begin
                qryItemLE.Close;
            end;

            trigger OnPreDataItem()
            begin
                strFiltro := Item.GetFilters;
                if Item.GetFilter("Date Filter") <> '' then
                    qryItemLE.SetFilter(Posting_Date, Item.GetFilter("Date Filter"));
                if Item.GetFilter("Global Dimension 2 Filter") <> '' then
                    qryItemLE.SetFilter(ActivFilt, Item.GetFilter("Global Dimension 2 Filter"));
                if Item.GetFilter("No.") <> '' then
                    qryItemLE.SetFilter(ItemFilter, '%1', Item.GetFilter("No."));
                if Item.GetFilter("Lot No. Filter") <> '' then
                    qryItemLE.SetFilter(LotNoFilter, Item.GetFilter("Lot No. Filter"));
                If Item.GetFilter("Filtro Lote Origen") <> '' then
                    qryItemLE.SetFilter(Lote_Origen_Filtro, Item.GetFilter("Filtro Lote Origen"));
                if Item.GetFilter("Location Filter") <> '' then
                    qryItemLE.SetFilter(qryItemLE.Filtro_camara, Item.GetFilter("Location Filter"));

                qryItemLE.Open;

                Clear(rstCI);
                rstCI.Get;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

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
        StartDate := 0D;
        EndDate := Today;
        ActivFilt := 'LAN';
        /*
        IF ActivFilt = 'LAN' then
        BEGIN
        
          clear(rstItemExpo);
          rstItemExpo.setrange(rstItemExpo.Actividad,ActivFilt);
          rstItemExpo.setfilter(Producto,'<>%1','');
          rstItemExpo.setrange(Activo,true);
          If rstItemExpo.findfirst then
            ItemFilter := rstItemExpo.Producto;
          If rstItemExpo.findlast then
            ItemFilter := ItemFilter+'..'+rstItemExpo.Producto;
        
        END;
        */

    end;

    var
        qryItemLE: Query "Descargas históricas";
        StartDate: Date;
        EndDate: Date;
        ActivFilt: Code[10];
        ItemFilter: Text;
        rstItemExpo: Record Item;
        strFiltro: Text;
        rstCI: Record "Company Information";
}

