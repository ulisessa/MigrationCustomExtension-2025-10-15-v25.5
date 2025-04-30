page 50771 "Lista insumos fact proyecto"
{
    PageType = List;
    SourceTable = "Insumos fact proyecto";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field(Factura; Factura)
                {
                }
                field("Posición arancelaria"; "Posición arancelaria")
                {
                }
                field(Insumos; Insumos)
                {
                }
            }
        }
    }

    actions
    {
    }
}

