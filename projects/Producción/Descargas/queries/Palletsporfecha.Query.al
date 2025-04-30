query 50025 "Pallets por fecha"
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
            filter(Global_Dimension_1_Code; "Global Dimension 1 Code")
            {
            }
            filter(Entry_Type; "Entry Type")
            {
                ColumnFilter = Entry_Type = CONST ("Positive Adjmt.");
            }
            filter(Posting_Date; "Posting Date")
            {
            }
            column(Pallet_no; "Pallet no.")
            {
                ColumnFilter = Pallet_no = FILTER (<> '');
            }
            column(Count_)
            {
                Method = Count;
            }
        }
    }
}

