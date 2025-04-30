page 50670 "Movs. liquidación pagos"
{
    DeleteAllowed = true;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = ListPart;
    SourceTable = "Lín. Liquidacion Pagos";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("No. Liquidacion"; "No. Liquidacion")
                {
                }
                field("No. mov."; "No. mov.")
                {
                }
                field("No. proveedor"; "No. proveedor")
                {
                }
                field("No. documento"; "No. documento")
                {
                }
                field("No. documento externo"; "No. documento externo")
                {
                }
                field("Fecha registro"; "Fecha registro")
                {
                }
                field("Fecha vencimiento"; "Fecha vencimiento")
                {
                }
                field("Cód. divisa"; "Cód. divisa")
                {
                }
                field(Importe; Importe)
                {
                }
                field("Importe a pagar"; "Importe a pagar")
                {
                }
                field("Importe pendiente"; "Importe pendiente")
                {
                }
                field("Fecha pago"; "Fecha pago")
                {
                }
            }
        }
    }

    actions
    {
    }
}

