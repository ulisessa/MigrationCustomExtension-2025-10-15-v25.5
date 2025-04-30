query 50042 "Reparto detalle"
{

    elements
    {
        dataitem(Cab_Reparto; "Cab. Reparto")
        {
            DataItemTableFilter = "Fecha cumplido" = FILTER (>= 20240101D);
            filter(Filt_No_Documento; "No. Documento")
            {
            }
            column(No_Documento; "No. Documento")
            {
            }
            column(Fecha_oficializacion; "Fecha oficializacion")
            {
            }
            column(Fecha_cumplido; "Fecha cumplido")
            {
            }
            dataitem(Item_Ledger_Entry; "Item Ledger Entry")
            {
                DataItemLink = "Global dimension 6 Code" = Cab_Reparto."No. Documento";
                SqlJoinType = InnerJoin;
                column(Document_No; "Document No.")
                {
                }
                column(Job_No; "Job No.")
                {
                }
                column(Global_Dimension_1_Code; "Global Dimension 1 Code")
                {
                }
                column(Global_Dimension_2_Code; "Global Dimension 2 Code")
                {
                }
                column(Global_dimension_3_Code; "Global dimension 3 Code")
                {
                }
                column(Global_Dimension_4_Code; "Global Dimension 4 Code")
                {
                }
                column(Global_Dimension_5_Code; "Global Dimension 5 Code")
                {
                }
                column(Global_dimension_6_Code; "Global dimension 6 Code")
                {
                }
                column(Global_Dimension_7_Code; "Global Dimension 7 Code")
                {
                }
                column(Sum_Net_kilos; "Net kilos")
                {
                    ColumnFilter = Sum_Net_kilos = FILTER (<> 0);
                    Method = Sum;
                }
                column(Lote_origen; "Lote origen")
                {
                }
                dataitem(Job; Job)
                {
                    DataItemLink = "Lote origen" = Item_Ledger_Entry."Lote origen";
                    column(ProyOrigen; "No.")
                    {
                    }
                    column(Fecha_fin; "Ending Date")
                    {
                    }
                }
            }
        }
    }
}

