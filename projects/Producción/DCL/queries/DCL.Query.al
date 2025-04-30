query 50026 DCL
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
                dataitem(Item; Item)
                {
                    DataItemLink = "No." = Lín_DCL."Clasificación";
                    SqlJoinType = InnerJoin;
                    column(Actividad; "Global Dimension 2 Code")
                    {
                        ColumnFilter = Actividad = FILTER(<> '');
                    }
                    column(Clasificacion; "No.")
                    {
                    }
                    column(Description; Description)
                    {
                    }
                    column(Familia; Familia)
                    {
                    }
                    column(Subfamilia; Subfamilia)
                    {
                    }
                }
            }
        }
    }
}

