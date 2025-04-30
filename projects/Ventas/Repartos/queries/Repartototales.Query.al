query 50043 "Reparto totales"
{

    elements
    {
        dataitem(Cab_Reparto; "Cab. Reparto")
        {
            filter(No_Documento; "No. Documento")
            {
            }
            dataitem(Item_Ledger_Entry; "Item Ledger Entry")
            {
                DataItemLink = "Global dimension 6 Code" = Cab_Reparto."No. Documento";
                SqlJoinType = InnerJoin;
                column(Sum_Net_kilos; "Net kilos")
                {
                    ColumnFilter = Sum_Net_kilos = FILTER (<> 0);
                    Method = Sum;
                }
            }
        }
    }
}

