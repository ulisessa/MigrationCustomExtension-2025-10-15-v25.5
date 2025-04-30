pageextension 50030 "Item Extension fields" extends "Item Card"
{
    layout
    {
        addafter(ItemTracking)
        {
            group(ItemFishing)
            {
                CaptionML = ENU = 'Fishing', ESP = 'Pesca';
                group(Weighingh)
                {
                    CaptionML = ENU = 'Weighing', ESP = 'Pesaje';
                    field("Cantidad de bultos por pallet"; "Cantidad de bultos por pallet")
                    {
                        ToolTipML = ENU = 'Number of packages per pallet', ESP = 'Cantidad máxima de bultos por pallet, este valor es utilizado únicamente si el producto es pesado en pallets y no hay determinación particular por ubicación';
                    }
                    field("% Max Min permitido Neto"; "Porcentaje Max Min permitido N")
                    {
                        ToolTipML = ENU = 'Percentage of the maximum and minimum range allowed for net weight', ESP = 'Porcentaje del rango de peso neto máximo y mínimo permitido';
                    }
                    field("% Max Min permitido Bruto"; "Porcentaje Max Min permitido B")
                    {
                        ToolTipML = ENU = 'Percentage of the maximum and minimum range allowed for gross weight', ESP = 'Porcentaje del rango de peso bruto máximo y mínimo permitido';
                    }
                    field("Relación directa Peso vs UMB"; "Utiliza Tarifario")
                    {
                        CaptionML = ENU = 'Direct relation between weight and UMB', ESP = 'Relación directa entre peso y UMB';
                        ToolTipML = ENU = 'If checked, this kind of item will presume that exists a direct relation between the specified net and gross weights and the base unit of measure and the system will calculate automatically the corresponding weight in positive and negative adjustments. If it''s not checked, it will assume there is no direct relation, therefore it won''t perform the corresponding calculation and will expect the user to fill the data.', ESP = 'Si está marcado, este tipo de ítem presumirá que existe una relación directa entre los pesos neto y bruto especificados y la unidad de medida base y el sistema calculará automáticamente el peso correspondiente en ajustes positivos y negativos. Si no está marcado, asumirá que no hay relación directa, por lo tanto no realizará el cálculo correspondiente y esperará que el usuario complete los datos.';
                    }
                    field("Unidad medida Diario Abordo"; "Unidad medida Diario Abordo")
                    {
                    }
                    field("Cantidad descarga"; "Cantidad descarga")
                    {
                    }
                    field("Kilos netos descarga"; "Kilos netos descarga")
                    {
                    }
                    field("Kilos brutos descarga"; "Kilos brutos descarga")
                    {
                    }
                    field("Cantidad captura abordo"; "Cantidad captura abordo")
                    {
                    }
                }
                group(General)
                {
                    field("A proyecto desde buque"; "A proyecto desde buque")
                    {
                        ToolTipML = ENU = 'If checked, this kind of item must be consumed only from the location code related to a ship', ESP = 'Si está marcado, este tipo de ítem debe ser consumido únicamente desde el depósito relacionado con un buque';
                    }
                    field("Exportación"; Exportación)
                    {
                        ToolTipML = ENU = 'If checked, this kind of item is for export and will be available for Repartos', ESP = 'Si está marcado, este tipo de ítem es para exportación y estará disponible para Repartos';
                    }
                    field(Captura; Captura)
                    {
                        ToolTipML = ENU = 'If checked, this kind of item is for capture and will be available for Capture page', ESP = 'Si está marcado, este tipo de ítem es para captura y estará disponible para Diario de a bordo y descargas';
                    }
                    field("Lleva No. Lote"; "Lleva No. Lote")
                    {
                        CaptionML= ENU= 'Lot number required', ESP= 'Número de lote requerido';
                        ToolTipML = ENU = 'If checked, the lot code will be calculated using the format specified in "Dimension Value" table, "Lot Code Format" parameter.', ESP = 'Si está marcado, el código de lote se calculará utilizando el formato especificado en la tabla "Valor de dimensión", parámetro "Formato de codificación de lote".';
                    }
                    field("Lleva No. Pallet"; "Lleva No. Pallet")
                    {
                        ToolTipML = ENU = 'If checked, this kind of item will presume that the pallet number is mandatory', ESP = 'Si está marcado, este tipo de ítem presumirá que el número de pallet es obligatorio';
                    }
                    field("Invisible pedido flota"; "Invisible pedido flota")
                    {
                    }
                    field("Enviar a flota"; "Enviar a flota")
                    {
                    }
                    field("Producto venta referencia"; "Producto venta referencia")
                    {
                    }
                    field("Nombre producto venta"; "Nombre producto venta")
                    {
                    }
                    field("Especie de productos"; "Especie de productos")
                    {
                    }
                    field("Nivel de producción"; "Nivel de producción")
                    {
                    }
                    field(Procedencia; Procedencia)
                    {
                    }
                    field("Propiedad producto"; "Propiedad producto")
                    {
                    }
                    field("Número de Item"; "Número de Item")
                    {
                    }
                    field("Número de Subitem"; "Número de Subitem")
                    {
                    }
                    field("Familia origen"; "Familia origen")
                    {
                    }
                    field("Subfamilia origen"; "Subfamilia origen")
                    {
                    }
                    field(Rendimiento; Rendimiento)
                    {
                    }
                    field("Seguimiento para trazabilidad"; "Seguimiento para trazabilidad")
                    {
                    }
                }
                group(Impuestos)
                {
                    CaptionML =ENU= 'Taxes', ESP = 'Impuestos';
                    field("Tipo retención"; "Tipo retención")
                    {
                    }
                    field("Cód. retención IVA"; "Cód. retención IVA")
                    {
                    }
                    field("Cód. retención SS"; "Cód. retención SS")
                    {
                    }
                    field("Cód. retención ganancias"; "Cód. retención ganancias")
                    {
                    }
                }
            }
        }
        movefirst(ItemFishing; "Net Weight", "Gross Weight")

    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}