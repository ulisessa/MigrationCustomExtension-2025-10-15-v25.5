page 60004 "Lista conceptos meta4"
{
    PageType = List;
    SourceTable = "Meta4 concept";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Concept code"; "Concept code")
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
    }
}

