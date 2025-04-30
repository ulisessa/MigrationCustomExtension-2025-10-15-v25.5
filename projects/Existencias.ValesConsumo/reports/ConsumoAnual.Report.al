report 50027 "Consumo Anual"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Existencias.ValesConsumo/reports/ConsumoAnual.rdlc';
    EnableExternalImages = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            DataItemTableView = SORTING ("Item No.", Open, Positive, "Location Code", "Posting Date", "Entry/Exit Point") WHERE ("Entry Type" = FILTER ("Negative Adjmt."), Quantity = FILTER (<> 0), "Item type" = CONST (Consumo));
            RequestFilterFields = "Item No.", "Posting Date";
            column(strFiltro; strFiltro)
            {
            }
            column(USERID; UserId)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(rstEmpres_Picture; rstEmpres.Picture)
            {
            }
            column(Item_Ledger_Entry__Item_No__; "Item No.")
            {
            }
            column(Item_Ledger_Entry_Description; Description)
            {
            }
            column(Item_Ledger_Entry_Quantity; Quantity)
            {
            }
            column(EmptyStringCaption; EmptyStringCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column("Código_de_Producto_Caption"; Código_de_Producto_CaptionLbl)
            {
            }
            column(NombreCaption; NombreCaptionLbl)
            {
            }
            column(Cantidad_ConsumidaCaption; Cantidad_ConsumidaCaptionLbl)
            {
            }
            column(Item_Ledger_Entry_Entry_No_; "Entry No.")
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
        strFiltro: Text[250];
        rstEmpres: Record "Company Information";
        EmptyStringCaptionLbl: Label 'Stock por fechas';
        CurrReport_PAGENOCaptionLbl: Label 'Página';
        "Código_de_Producto_CaptionLbl": Label 'Código de Producto ';
        NombreCaptionLbl: Label 'Nombre';
        Cantidad_ConsumidaCaptionLbl: Label 'Cantidad Consumida';
}

