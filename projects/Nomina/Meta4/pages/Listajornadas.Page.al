page 60003 "Lista jornadas"
{
    PageType = List;
    SourceTable = "Workday detail";
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
                field("Starting day"; "Starting day")
                {
                }
                field("Ending day"; "Ending day")
                {
                }
                field("Starting time"; "Starting time")
                {
                }
                field("Ending time"; "Ending time")
                {
                }
                field("Additional percentage value"; "Additional percentage value")
                {
                }
                field("Enabled since"; "Enabled since")
                {
                }
                field("Enabled until"; "Enabled until")
                {
                }
                field("Flexible o restricto"; "Flexible o restricto")
                {
                }
                field("Meta4 code"; "Meta4 code")
                {
                }
                field("Cantidad horas"; "Cantidad horas")
                {
                }
                field(Nivel; Nivel)
                {
                }
            }
        }
    }

    actions
    {
    }
}

