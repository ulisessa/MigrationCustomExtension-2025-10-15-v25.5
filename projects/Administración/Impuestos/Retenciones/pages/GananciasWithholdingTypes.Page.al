page 50720 "Ganancias Withholding Types"
{
    PageType = List;
    SourceTable = "Withholding codes";
    SourceTableView = WHERE ("Tipo impuesto retencion" = FILTER (Ganancias));
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Tipo impuesto retencion"; "Tipo impuesto retencion")
                {
                }
                field("Cod. retencion"; "Cod. retencion")
                {
                }
            }
        }
    }

    actions
    {
    }
}

