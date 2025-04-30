page 50655 "Modificador costo nomina"
{
    PageType = Worksheet;
    SourceTable = "Modificadores Costos";
    SourceTableView = WHERE ("Tipo registro" = CONST (Nomina));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Tipo registro"; "Tipo registro")
                {
                }
                field(Proyecto; Proyecto)
                {
                }
                field(Buque; Buque)
                {
                }
                field(Marea; Marea)
                {
                }
                field("Starting date"; "Starting date")
                {
                }
                field("Ending date"; "Ending date")
                {
                }
                field("No. cuenta"; "No. cuenta")
                {
                }
                field("No. documento"; "No. documento")
                {
                }
                field("USD registrados"; "USD registrados")
                {
                }
                field("Fecha modificada"; "Fecha modificada")
                {
                }
                field(Actividad; Actividad)
                {
                }
                field("$ registrados"; "$ registrados")
                {
                }
            }
        }
    }

    actions
    {
    }
}

