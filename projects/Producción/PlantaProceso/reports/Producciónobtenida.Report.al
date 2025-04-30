report 50589 "Producción obtenida"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Producción/PlantaProceso/reports/Producciónobtenida.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem(Job; Job)
        {
            RequestFilterFields = "No.", "Posting Date Filter";
            column("Producción_obtenida_"; 'Producción obtenida')
            {
            }
            column(TODAY; Today)
            {
            }
            column("Página____FORMAT_CurrReport_PAGENO_"; 'Página #')
            {
            }
            column(infoempresa_Picture; infoempresa.Picture)
            {
            }
            column(Job_Description; Description)
            {
            }
            column(Job_GETFILTERS________Item_Ledger_Entry__GETFILTERS__; Job.GetFilters() + ' ' + "Item Ledger Entry".GetFilters())
            {
            }
            column(Item_Ledger_Entry_DescriptionCaption; "Item Ledger Entry".FieldCaption(Description))
            {
            }
            column(Item_Ledger_Entry_QuantityCaption; "Item Ledger Entry".FieldCaption(Quantity))
            {
            }
            column(Item_Ledger_Entry__Gross_kilos_Caption; "Item Ledger Entry".FieldCaption("Gross kilos"))
            {
            }
            column(Item_Ledger_Entry__Net_kilos_Caption; "Item Ledger Entry".FieldCaption("Net kilos"))
            {
            }
            column(Filtro_Caption; Filtro_CaptionLbl)
            {
            }
            column(Job_No_; "No.")
            {
            }
            column(Job_Posting_Date_Filter; "Posting Date Filter")
            {
            }
            dataitem("Item Ledger Entry"; "Item Ledger Entry")
            {
                DataItemLink = "No. proyecto" = FIELD("No."), "Posting Date" = FIELD("Posting Date Filter");
                DataItemTableView = SORTING("Item No.") WHERE(Family = FILTER('PT' | 'PT3'), "Item type" = FILTER(Pesca), "Entry Type" = FILTER("Positive Adjmt."), "Production date" = FILTER(<> 0D));
                column(Item_Ledger_Entry_Description; Description)
                {
                }
                column(Item_Ledger_Entry_Quantity; Quantity)
                {
                }
                column(Item_Ledger_Entry__Gross_kilos_; "Gross kilos")
                {
                }
                column(Item_Ledger_Entry__Net_kilos_; "Net kilos")
                {
                }
                column(Item_Ledger_Entry__Gross_kilos__Control6; "Gross kilos")
                {
                }
                column(Item_Ledger_Entry__Net_kilos__Control7; "Net kilos")
                {
                }
                column(Item_Ledger_Entry_Quantity_Control17; Quantity)
                {
                }
                column(Total_General_Caption; Total_General_CaptionLbl)
                {
                }
                column(Item_Ledger_Entry_Entry_No_; "Entry No.")
                {
                }
                column(Item_Ledger_Entry_Item_No_; "Item No.")
                {
                }
                column(Item_Ledger_Entry_No__proyecto; "No. proyecto")
                {
                }
                column(Item_Ledger_Entry_Posting_Date; "Posting Date")
                {
                }
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
        infoempresa: Record "Company Information";
        rstSubfam: Record "Subfamilia producto";
        Filtro_CaptionLbl: Label 'Filtro:';
        Total_General_CaptionLbl: Label 'Total General:';
}

