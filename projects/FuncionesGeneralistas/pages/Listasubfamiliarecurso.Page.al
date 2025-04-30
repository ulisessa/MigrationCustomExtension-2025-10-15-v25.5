page 50069 "Lista subfamilia recurso"
{
    DelayedInsert = true;
    PageType = List;
    SourceTable = "Subfamilia recurso";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Familia recurso"; "Familia recurso")
                {
                }
                field("Cód. subfamilia recurso"; "Cód. subfamilia recurso")
                {
                }
                field("Nombre subfamilia recurso"; "Nombre subfamilia recurso")
                {
                }
            }
        }
    }

    actions
    {
    }
}

