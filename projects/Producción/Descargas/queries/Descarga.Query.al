query 50009 Descarga
{

    elements
    {
        dataitem(Cab_descarga; "Cab. descarga")
        {
            filter(FiltroProyecto; "No. proyecto")
            {
            }
            column(Proyecto; "No. proyecto")
            {
            }
            dataitem("Lín__descarga"; "Lín. descarga")
            {
                DataItemLink = "No. proyecto" = Cab_descarga."No. proyecto";
                DataItemTableFilter = "Item no." = FILTER(<> '');
                column(Item_no; "Item no.")
                {
                }
                column(Unidad_medida; "Unidad medida")
                {
                }
                column(Sum_Cantidad; Cantidad)
                {
                    Method = Sum;
                }
                column(Sum_Net_weight; "Net weight")
                {
                    Method = Sum;
                }
                column(Sum_Gross_weight; "Gross weight")
                {
                    Method = Sum;
                }
            }
        }
    }
}

