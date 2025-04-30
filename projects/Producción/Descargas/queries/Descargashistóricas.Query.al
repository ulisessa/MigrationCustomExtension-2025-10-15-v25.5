query 50005 "Descargas históricas"
{

    elements
    {
        dataitem(Item_Ledger_Entry; "Item Ledger Entry")
        {
            filter(Posting_Date; "Posting Date")
            {
            }
            filter(Nombre_libro_diario; "Nombre libro diario")
            {
                ColumnFilter = Nombre_libro_diario = CONST ('DESCARGA');
            }
            filter(ActivFilt; "Global Dimension 2 Code")
            {
            }
            filter(ItemFilter; "Item No.")
            {
            }
            filter(Filtro_camara; "Location Code")
            {
            }
            filter(LotNoFilter; "Lot No.")
            {
            }
            filter(Lote_Origen_Filtro; "Lote Origen")
            {
            }
            column(Global_Dimension_1_Code; "Global Dimension 1 Code")
            {
            }
            column(Lote_origen; "Lote origen")
            {
                ColumnFilter = Lote_origen = FILTER (<> '');
            }
            column(Item_No; "Item No.")
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
            column(Sum_Gross_kilos; "Gross kilos")
            {
                Method = Sum;
            }
            dataitem(Item; Item)
            {
                DataItemLink = "No." = Item_Ledger_Entry."Item No.";
                filter(Blocked; Blocked)
                {
                    ColumnFilter = Blocked = CONST (false);
                }
                column(Description; Description)
                {
                }
            }
        }
    }

    trigger OnBeforeOpen()
    var
        TextDiarioDescarga: Label 'DESCARGA';
    begin
    end;
}

