page 50040 "Lista línea reparto"
{
    PageType = List;
    SourceTable = "Lín. reparto";
    SourceTableView = WHERE ("Envío realizado - UMB" = CONST (0));
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. Documento"; "No. Documento")
                {
                }
                field("No. línea"; "No. línea")
                {
                }
                field("No. Producto"; "No. Producto")
                {
                }
                field(Descripcion; Descripcion)
                {
                }
                field("Cantidad a enviar"; "Cantidad a enviar")
                {
                }
                field("Fecha ingreso"; "Fecha ingreso")
                {
                }
                field("Cod. unidad medida"; "Cod. unidad medida")
                {
                }
                field(Puerto; Puerto)
                {
                }
                field(Actividad; Actividad)
                {
                }
                field("Cod. deposito"; "Cod. deposito")
                {
                }
                field("Cantidad x Unidad Medida"; "Cantidad x Unidad Medida")
                {
                }
                field("Tipo movimiento"; "Tipo movimiento")
                {
                }
                field("Cantidad para Venta"; "Cantidad para Venta")
                {
                }
                field("Total a enviar"; "Total a enviar")
                {
                }
                field(Proyecto; Proyecto)
                {
                }
                field(Buque; Buque)
                {
                }
                field(Marea; Marea)
                {
                }
                field("Lote origen"; "Lote origen")
                {
                }
                field("Existencias - KN"; "Existencias - KN")
                {
                }
                field("Existencias - UMB"; "Existencias - UMB")
                {
                }
                field("Comprometido - UMB"; "Comprometido - UMB")
                {
                }
                field("Reservar - UMB"; "Reservar - UMB")
                {
                }
                field("Reservar - KN"; "Reservar - KN")
                {
                }
                field("Reservar - KB"; "Reservar - KB")
                {
                }
                field("Comprometido calculado - UMB"; "Comprometido calculado - UMB")
                {
                }
                field("Comprometido calculado - KN"; "Comprometido calculado - KN")
                {
                }
                field("Comprometido calculado - KB"; "Comprometido calculado - KB")
                {
                }
                field("Envío realizado - UMB"; "Envío realizado - UMB")
                {
                }
                field("Envío realizado - KN"; "Envío realizado - KN")
                {
                }
                field("Envío realizado - KB"; "Envío realizado - KB")
                {
                }
                field(Registrado; Registrado)
                {
                }
            }
        }
    }

    actions
    {
    }
}

