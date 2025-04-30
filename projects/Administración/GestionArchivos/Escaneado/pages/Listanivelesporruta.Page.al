page 50615 "Lista niveles por ruta"
{
    PageType = List;
    SourceTable = "Niveles de archivo";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Cód. Nivel"; "Cód. Nivel")
                {
                }
                field("Descripción Nivel"; "Descripción Nivel")
                {
                }
                field(Requerido; Requerido)
                {
                }
                field("Cantidad máx. caracteres"; "Cantidad máx. caracteres")
                {
                }
            }
        }
    }

    actions
    {
    }
}

