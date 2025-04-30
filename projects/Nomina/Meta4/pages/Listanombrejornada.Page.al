page 60002 "Lista nombre jornada"
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
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Detalle jornada")
            {
                RunObject = Page "Lista jornadas";
                RunPageLink = "Workday code" = FIELD ("Workday code");
            }
        }
    }
}

