query 50020 "Trazabilidad+doc"
{
    OrderBy = Ascending (Lote_origen), Ascending (Entry_Type), Ascending (Family), Ascending (Subfamily);

    elements
    {
        dataitem(Item_Ledger_Entry; "Item Ledger Entry")
        {
            DataItemTableFilter = "Lote origen" = FILTER (<> '');
            filter(Posting_Date; "Posting Date")
            {
            }
            filter(strLote; "Lote origen")
            {
            }
            column(Lote_origen; "Lote origen")
            {
            }
            column(Entry_Type; "Entry Type")
            {
            }
            column(Family; Family)
            {
            }
            column(Subfamily; Subfamily)
            {
            }
            column(Nombre_libro_diario; "Nombre libro diario")
            {
            }
            column(Item_No; "Item No.")
            {
            }
            column(Document_No; "Document No.")
            {
            }
            column(Sum_Quantity; Quantity)
            {
                ColumnFilter = Sum_Quantity = FILTER (<> 0);
                Method = Sum;
            }
            column(Sum_Net_kilos; "Net kilos")
            {
                Method = Sum;
            }
        }
    }
}

