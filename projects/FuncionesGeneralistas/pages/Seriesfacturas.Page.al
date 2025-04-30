page 50731 "Series facturas"
{
    PageType = List;
    SourceTable = "Invoice no. setup";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Tipo factura"; "Tipo factura")
                {
                }
                field("Actividad comercial"; "Actividad comercial")
                {
                }
                field("Tipo impuesto"; "Tipo impuesto")
                {
                }
                field("No. serie"; "No. serie")
                {
                }
                field(Letra; Letra)
                {
                }
            }
        }
    }

    actions
    {
    }
}

