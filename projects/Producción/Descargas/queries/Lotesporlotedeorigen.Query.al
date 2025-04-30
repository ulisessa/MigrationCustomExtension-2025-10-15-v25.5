query 50024 "Lotes por lote de origen"
{

    elements
    {
        dataitem(Item_Ledger_Entry; "Item Ledger Entry")
        {
            DataItemTableFilter = Open = FILTER (true);
            filter(Item_type; "Item type")
            {
                ColumnFilter = Item_type = CONST (Pesca);
            }
            filter(Item_No_f; "Item No.")
            {
            }
            filter(Global_Dimension_1_Code; "Global Dimension 1 Code")
            {
            }
            filter(Pallet_no; "Pallet no.")
            {
            }
            column(Lote_origen; "Lote origen")
            {
            }
            column(Count_)
            {
                Method = Count;
            }
        }
    }
}

