query 50029 "DCL por actividad"
{

    elements
    {
        dataitem(Sales_Receivables_Setup; "Sales & Receivables Setup")
        {
            dataitem("Lín_DCL"; "Lín. DCL")
            {
                DataItemLink = Cliente = Sales_Receivables_Setup."DCL local customer";
                DataItemTableFilter = Registrado = FILTER(true);
                filter(Filtro_Fecha; "Fecha DCL")
                {
                }
                filter(Filtro_Actividad; Actividad)
                {
                }
                filter(Filtro_Clasificacion; "Clasificación")
                {
                }
                filter(Kilos_netos; "Kilos netos")
                {
                    ColumnFilter = Kilos_netos = FILTER(> 0);
                }
                filter(Registrado; Registrado)
                {
                    ColumnFilter = Registrado = FILTER(true);
                }
                column(Actividad; Actividad)
                {
                }
                column(N_proyecto; "No. proyecto")
                {
                }
                column(Sum_Cantidad; Cantidad)
                {
                    Method = Sum;
                }
                column(KN_originales; "Kilos netos")
                {
                    Method = Sum;
                }
            }
        }
    }
}

