query 50028 "DCL aplicados per Activity"
{

    elements
    {
        dataitem(Sales_Receivables_Setup; "Sales & Receivables Setup")
        {
            dataitem("Lín_DCL"; "Lín. DCL")
            {
                DataItemLink = Cliente = Sales_Receivables_Setup."DCL local customer";
                filter(Filtro_Fecha; "Fecha DCL")
                {
                }
                filter(Filtro_Actividad; Actividad)
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
                column(Actividad; Actividad)
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
                dataitem(DCL_Application_Lines; "DCL Application Lines")
                {
                    DataItemLink = "DCL Job no." = Lín_DCL."No. proyecto", Activity = Lín_DCL.Actividad;
                    SqlJoinType = InnerJoin;
                    column(Sum_Origin_kilos; "Origin kilos")
                    {
                        Method = Sum;
                    }
                }
            }
        }
    }
}

