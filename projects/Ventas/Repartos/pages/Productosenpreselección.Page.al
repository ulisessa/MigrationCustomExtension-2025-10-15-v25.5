page 50605 "Productos en preselección"
{
    PageType = List;
    SourceTable = "Detalle Recupero IVA";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Fecha de comprobante"; "Fecha de comprobante")
                {
                    Editable = false;
                }
                field("Punto de venta"; "Punto de venta")
                {
                    Editable = false;
                }
                field("CUIT Vendedor"; "CUIT Vendedor")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        CurrPage.LookupMode := true;
    end;

    var
        rstHistLinReparto: Record "Detalle Recupero IVA";
}

