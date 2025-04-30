report 50635 "Descargas x Lote origen"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Producción/Descargas/reports/DescargasxLoteorigen.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem(Item; Item)
        {
            DataItemTableView = SORTING("Inventory Posting Group") WHERE("Inventory Posting Group" = CONST('LANG MP'), Blocked = CONST(false));

            trigger OnPreDataItem()
            begin
                PunConfEx.Get();
                PunProd.Reset;
                if PunProd.Get(PunConfEx."L-Producto 1") then begin
                    MatrProd[1, 1] := PunProd.Description;
                    MatrProd[2, 1] := PunConfEx."L-Producto 1";
                end;

                PunProd.Reset;
                if PunProd.Get(PunConfEx."L-Producto 2") then begin
                    MatrProd[1, 2] := PunProd.Description;
                    MatrProd[2, 2] := PunConfEx."L-Producto 2";
                end;

                PunProd.Reset;
                if PunProd.Get(PunConfEx."L-Producto 3") then begin
                    MatrProd[1, 3] := PunProd.Description;
                    MatrProd[2, 3] := PunConfEx."L-Producto 3";
                end;

                PunProd.Reset;
                if PunProd.Get(PunConfEx."L-Producto 4") then begin
                    MatrProd[1, 4] := PunProd.Description;
                    MatrProd[2, 4] := PunConfEx."L-Producto 4";
                end;

                PunProd.Reset;
                if PunProd.Get(PunConfEx."L-Producto 5") then begin
                    MatrProd[1, 5] := PunProd.Description;
                    MatrProd[2, 5] := PunConfEx."L-Producto 5";
                end;

                PunProd.Reset;
                if PunProd.Get(PunConfEx."L-Producto 6") then begin
                    MatrProd[1, 6] := PunProd.Description;
                    MatrProd[2, 6] := PunConfEx."L-Producto 6";
                end;

                PunProd.Reset;
                if PunProd.Get(PunConfEx."L-Producto 7") then begin
                    MatrProd[1, 7] := PunProd.Description;
                    MatrProd[2, 7] := PunConfEx."L-Producto 7";
                end;

                PunProd.Reset;
                if PunProd.Get(PunConfEx."L-Producto 8") then begin
                    MatrProd[1, 8] := PunProd.Description;
                    MatrProd[2, 8] := PunConfEx."L-Producto 8";
                end;

                PunProd.Reset;
                if PunProd.Get(PunConfEx."L-Producto 9") then begin
                    MatrProd[1, 9] := PunProd.Description;
                    MatrProd[2, 9] := PunConfEx."L-Producto 9";
                end;

                PunProd.Reset;
                if PunProd.Get(PunConfEx."L-Producto 10") then begin
                    MatrProd[1, 10] := PunProd.Description;
                    MatrProd[2, 10] := PunConfEx."L-Producto 10";
                end;

                PunProd.Reset;
                if PunProd.Get(PunConfEx."L-Producto 11") then begin
                    MatrProd[1, 11] := PunProd.Description;
                    MatrProd[2, 11] := PunConfEx."L-Producto 11";
                end;

                PunProd.Reset;
                if PunProd.Get(PunConfEx."L-Producto 12") then begin
                    MatrProd[1, 12] := PunProd.Description;
                    MatrProd[2, 12] := PunConfEx."L-Producto 12";
                end;

                if PunConfEx."L-Producto 1" <> '' then
                    VarFiltro += PunConfEx."L-Producto 1" + '|';
                if PunConfEx."L-Producto 2" <> '' then
                    VarFiltro += PunConfEx."L-Producto 2" + '|';
                if PunConfEx."L-Producto 3" <> '' then
                    VarFiltro += PunConfEx."L-Producto 3" + '|';
                if PunConfEx."L-Producto 4" <> '' then
                    VarFiltro += PunConfEx."L-Producto 4" + '|';
                if PunConfEx."L-Producto 5" <> '' then
                    VarFiltro += PunConfEx."L-Producto 5" + '|';
                if PunConfEx."L-Producto 6" <> '' then
                    VarFiltro += PunConfEx."L-Producto 6" + '|';
                if PunConfEx."L-Producto 7" <> '' then
                    VarFiltro += PunConfEx."L-Producto 7" + '|';
                if PunConfEx."L-Producto 8" <> '' then
                    VarFiltro += PunConfEx."L-Producto 8" + '|';
                if PunConfEx."L-Producto 9" <> '' then
                    VarFiltro += PunConfEx."L-Producto 9" + '|';
                if PunConfEx."L-Producto 10" <> '' then
                    VarFiltro += PunConfEx."L-Producto 10" + '|';
                if PunConfEx."L-Producto 11" <> '' then
                    VarFiltro += PunConfEx."L-Producto 11" + '|';
                if PunConfEx."L-Producto 12" <> '' then
                    VarFiltro += PunConfEx."L-Producto 12" + '|';

                VarFiltro := CopyStr(VarFiltro, 1, StrLen(VarFiltro) - 1);
            end;
        }
        dataitem("Mov. producto2"; "Item Ledger Entry")
        {
            DataItemTableView = WHERE("Entry Type" = FILTER(Sale), "Invoiced Quantity" = FILTER(<> 0));
            RequestFilterFields = "Item No.", "Posting Date", "Location Code", "Lote origen", "Global Dimension 2 Code";
            column(TODAY; Today)
            {
            }
            column("Página____FORMAT_CurrReport_PAGENO_"; 'Página #' )
            {
            }
            column(Descargas______en___FORMAT_VarTipoVista_____; 'Descargas ' + ' (en ' + Format(VarTipoVista) + ')')
            {
            }
            column(MatrProd_1_6_; MatrProd[1, 6])
            {
            }
            column(MatrProd_1_7_; MatrProd[1, 7])
            {
            }
            column(MatrProd_1_8_; MatrProd[1, 8])
            {
            }
            column(MatrProd_1_9_; MatrProd[1, 9])
            {
            }
            column(MatrProd_1_10_; MatrProd[1, 10])
            {
            }
            column(MatrProd_1_11_; MatrProd[1, 11])
            {
            }
            column(MatrProd_1_12_; MatrProd[1, 12])
            {
            }
            column(MatrProd_1_5_; MatrProd[1, 5])
            {
            }
            column(MatrProd_1_2_; MatrProd[1, 2])
            {
            }
            column(MatrProd_1_4_; MatrProd[1, 4])
            {
            }
            column(MatrProd_1_3_; MatrProd[1, 3])
            {
            }
            column(MatrProd_1_1_; MatrProd[1, 1])
            {
            }
            column(infoempresa_Picture; infoempresa.Picture)
            {
            }
            column(Filtro____Item_GETFILTERS__Mov__producto2__GETFILTERS; 'Filtro: ' + Item.GetFilters + "Mov. producto2".GetFilters)
            {
            }
            column(Mov__producto2__Lote_origen_; "Lote origen")
            {
            }
            column(Mov__producto2__Entry_Exit_Point_; "Entry/Exit Point")
            {
            }
            column(MatrCantidad_1_1_; MatrCantidad[1, 1])
            {
            }
            column(MatrCantidad_1_2_; MatrCantidad[1, 2])
            {
            }
            column(MatrCantidad_1_3_; MatrCantidad[1, 3])
            {
            }
            column(MatrCantidad_1_4_; MatrCantidad[1, 4])
            {
            }
            column(MatrCantidad_1_5_; MatrCantidad[1, 5])
            {
            }
            column(MatrCantidad_1_6_; MatrCantidad[1, 6])
            {
            }
            column(MatrCantidad_1_7_; MatrCantidad[1, 7])
            {
            }
            column(MatrCantidad_1_8_; MatrCantidad[1, 8])
            {
            }
            column(MatrCantidad_1_9_; MatrCantidad[1, 9])
            {
            }
            column(MatrCantidad_1_10_; MatrCantidad[1, 10])
            {
            }
            column(MatrCantidad_1_11_; MatrCantidad[1, 11])
            {
            }
            column(MatrCantidad_1_12_; MatrCantidad[1, 12])
            {
            }
            column(DataItem47; MatrCantidad[1, 1] + MatrCantidad[1, 2] + MatrCantidad[1, 3] + MatrCantidad[1, 4] + MatrCantidad[1, 5] + MatrCantidad[1, 6] + MatrCantidad[1, 7] + MatrCantidad[1, 8] + MatrCantidad[1, 9] + MatrCantidad[1, 10] + MatrCantidad[1, 11] + MatrCantidad[1, 12])
            {
            }
            column(MatrCantidad_1_1__Control54; MatrCantidad[1, 1])
            {
            }
            column(MatrCantidad_1_2__Control55; MatrCantidad[1, 2])
            {
            }
            column(MatrCantidad_1_3__Control56; MatrCantidad[1, 3])
            {
            }
            column(MatrCantidad_1_4__Control57; MatrCantidad[1, 4])
            {
            }
            column(MatrCantidad_1_5__Control58; MatrCantidad[1, 5])
            {
            }
            column(MatrCantidad_1_6__Control59; MatrCantidad[1, 6])
            {
            }
            column(MatrCantidad_1_7__Control60; MatrCantidad[1, 7])
            {
            }
            column(MatrCantidad_1_8__Control61; MatrCantidad[1, 8])
            {
            }
            column(MatrCantidad_1_9__Control62; MatrCantidad[1, 9])
            {
            }
            column(MatrCantidad_1_10__Control63; MatrCantidad[1, 10])
            {
            }
            column(MatrCantidad_1_11__Control64; MatrCantidad[1, 11])
            {
            }
            column(MatrCantidad_1_12__Control65; MatrCantidad[1, 12])
            {
            }
            column(DataItem66; MatrCantidad[1, 1] + MatrCantidad[1, 2] + MatrCantidad[1, 3] + MatrCantidad[1, 4] + MatrCantidad[1, 5] + MatrCantidad[1, 6] + MatrCantidad[1, 7] + MatrCantidad[1, 8] + MatrCantidad[1, 9] + MatrCantidad[1, 10] + MatrCantidad[1, 11] + MatrCantidad[1, 12])
            {
            }
            column(Mov__producto2__Global_Dimension_1_Code_; "Global Dimension 1 Code")
            {
            }
            column(MatrCantidadTotal_1_2_; MatrCantidadTotal[1, 2])
            {
            }
            column(MatrCantidadTotal_1_3_; MatrCantidadTotal[1, 3])
            {
            }
            column(MatrCantidadTotal_1_4_; MatrCantidadTotal[1, 4])
            {
            }
            column(MatrCantidadTotal_1_5_; MatrCantidadTotal[1, 5])
            {
            }
            column(MatrCantidadTotal_1_6_; MatrCantidadTotal[1, 6])
            {
            }
            column(MatrCantidadTotal_1_7_; MatrCantidadTotal[1, 7])
            {
            }
            column(MatrCantidadTotal_1_8_; MatrCantidadTotal[1, 8])
            {
            }
            column(MatrCantidadTotal_1_9_; MatrCantidadTotal[1, 9])
            {
            }
            column(MatrCantidadTotal_1_10_; MatrCantidadTotal[1, 10])
            {
            }
            column(MatrCantidadTotal_1_11_; MatrCantidadTotal[1, 11])
            {
            }
            column(MatrCantidadTotal_1_12_; MatrCantidadTotal[1, 12])
            {
            }
            column(DataItem48; MatrCantidadTotal[1, 1] + MatrCantidadTotal[1, 2] + MatrCantidadTotal[1, 3] + MatrCantidadTotal[1, 4] + MatrCantidadTotal[1, 5] + MatrCantidadTotal[1, 6] + MatrCantidadTotal[1, 7] + MatrCantidadTotal[1, 8] + MatrCantidadTotal[1, 9] + MatrCantidadTotal[1, 10] + MatrCantidadTotal[1, 11])
            {
            }
            column(MatrCantidadTotal_1_1_; MatrCantidadTotal[1, 1])
            {
            }
            column(TOTALCaption; TOTALCaptionLbl)
            {
            }
            column(TOTALESCaption; TOTALESCaptionLbl)
            {
            }
            column(Mov__producto2_Entry_No_; "Entry No.")
            {
            }

            trigger OnPreDataItem()
            begin
                //"Mov. producto2".SETCURRENTKEY("No. producto");
                "Mov. producto2".SetFilter("Item No.", VarFiltro);
                //CurrReport.CREATETOTALS(MatrCantidadtotal[1,1]);
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
        VarTipoVista := VarTipoVista::Kilos;
    end;

    var
        MatrProd: array[2, 12] of Code[20];
        PunConfEx: Record "Inventory Setup";
        PunProd: Record Item;
        MatrCantidad: array[1, 12] of Decimal;
        PunMovProd: Record "Item Ledger Entry";
        i: Integer;
        VarDep: Code[20];
        MatrCantidadTotal: array[1, 12] of Decimal;
        infoempresa: Record "Company Information";
        VarTipoVista: Option Kilos,Masters;
        VarFiltro: Text[250];
        TOTALCaptionLbl: Label 'TOTAL';
        TOTALESCaptionLbl: Label 'TOTALES';
}

