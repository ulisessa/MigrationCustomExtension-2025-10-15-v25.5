page 50718 "IVA Withholding Types"
{
    PageType = List;
    SourceTable = "Withholding codes";
    SourceTableView = WHERE ("Tipo impuesto retencion" = FILTER (IVA));
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

