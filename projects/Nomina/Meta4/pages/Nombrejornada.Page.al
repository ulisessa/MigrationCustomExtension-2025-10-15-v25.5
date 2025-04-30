page 50071 "Nombre jornada"
{
    PageType = List;
    SourceTable = Workday;
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Workday code"; "Workday code")
                {
                }
                field(Description; Description)
                {
                }
                field("Workday usual limit"; "Workday usual limit")
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Detalle jornada")
            {
                RunObject = Page Jornada;
                RunPageLink = "Workday code" = FIELD ("Workday code");
                RunPageView = SORTING ("Workday code", "Flexible o restricto", "Starting day", "Ending day", "Starting time", "Ending time", Nivel, "Enabled since");
            }
        }
    }
}

