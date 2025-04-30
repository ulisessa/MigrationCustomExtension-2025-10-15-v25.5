page 50509 "Lista Grupos Seguridad"
{
    // IBdos Argentina - USS - 281102 - Adición Arbumasa

    Editable = true;
    PageType = List;
    SourceTable = Seguridad;
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Grupo; Grupo)
                {
                }
                field("Modificar Líneas Ajenas"; "Modificar Líneas Ajenas")
                {
                }
                field("Aprobar Pedidos"; "Aprobar Pedidos")
                {
                }
                field("Registrar - Enviar Pedidos"; "Registrar - Enviar Pedidos")
                {
                }
                field("Facturación Automática"; "Facturación Automática")
                {
                }
                field("Factura Venta - Registrar"; "Factura Venta - Registrar")
                {
                }
                field("Confirmar Líneas"; "Confirmar Líneas")
                {
                }
                field("Eliminar Líneas"; "Eliminar Líneas")
                {
                }
                field("Aprobar solicitudes"; "Aprobar solicitudes")
                {
                }
                field("Facturas vencidas"; "Facturas vencidas")
                {
                }
                field("Grupo Planilleras"; "Grupo Planilleras")
                {
                }
                field("Imputar a Proyectos Cerrados"; "Imputar a Proyectos Cerrados")
                {
                }
                field("Omitir controles de fecha"; "Omitir controles de fecha")
                {
                }
                field("Anular remitos de Compra"; "Anular remitos de Compra")
                {
                }
                field("Anular mov. producto"; "Anular mov. producto")
                {
                }
                field("Modificar solicitudes ajenas"; "Modificar solicitudes ajenas")
                {
                }
                field("Anular producción"; "Anular producción")
                {
                }
                field("Anular remito de venta"; "Anular remito de venta")
                {
                }
                field("Anular factura de venta"; "Anular factura de venta")
                {
                }
                field("Anular Vales de consumo"; "Anular Vales de consumo")
                {
                }
                field("Anular factura de compra"; "Anular factura de compra")
                {
                }
                field("Modificar rango registro"; "Modificar rango registro")
                {
                }
                field("Anular solicitud"; "Anular solicitud")
                {
                }
                field("Aprobar OC para recepción"; "Aprobar OC para recepción")
                {
                }
                field("Anular reparto de venta"; "Anular reparto de venta")
                {
                }
                field("Autorizar pago"; "Autorizar pago")
                {
                }
                field("Aprobar factura"; "Aprobar factura")
                {
                }
                field("Autorizar factura"; "Autorizar factura")
                {
                }
                field("Aprobar pago sin vincular"; "Aprobar pago sin vincular")
                {
                }
                field("Cambiar estado"; "Cambiar estado")
                {
                }
                field("Anular n/c de compra"; "Anular n/c de compra")
                {
                }
                field("Anular documentos digitales"; "Anular documentos digitales")
                {
                }
                field("Anular Descargas"; "Anular Descargas")
                {
                }
                field("Anular asientos contables"; "Anular asientos contables")
                {
                }
                field("Anular asientos proyecto"; "Anular asientos proyecto")
                {
                }
                field("Alterar Recupero IVA"; "Alterar Recupero IVA")
                {
                }
                field("Ignorar validación período inv"; "Ignorar validación período inv")
                {
                }
                field("Bloquear pago"; "Bloquear pago")
                {
                }
                field(Flota; Flota)
                {
                }
                field("Revertir mov. contabilidad"; "Revertir mov. contabilidad")
                {
                }
                field("Revertir lote movs. contab."; "Revertir lote movs. contab.")
                {
                }
                field("Revertir movs. remitos consum."; "Revertir movs. remitos consum.")
                {
                }
                field("Admite factura directa"; "Admite factura directa")
                {
                }
                field("Recurso de facturación directa"; "Recurso de facturación directa")
                {
                }
                field("Consumos sin stock"; "Consumos sin stock")
                {
                }
                field("Liquidación pagos en lote"; "Liquidación pagos en lote")
                {
                }
                field("Habilitar anticipos"; "Habilitar anticipos")
                {
                }
                field("Eliminar lotes de facturas"; "Eliminar lotes de facturas")
                {
                }
                field("Anular liquidación pagos"; "Anular liquidación pagos")
                {
                }
                field("Registrar liquidación pagos"; "Registrar liquidación pagos")
                {
                }
                field(Contabilidad; Contabilidad)
                {
                }
                field("Ventas/Cobros"; "Ventas/Cobros")
                {
                }
                field("Compras/Pagos"; "Compras/Pagos")
                {
                }
                field(Existencias; Existencias)
                {
                }
                field("Producción"; Producción)
                {
                }
                field(Proyectos; Proyectos)
                {
                }
                field(Gerencia; Gerencia)
                {
                }
                field(Recursos; Recursos)
                {
                }
                field("Activos fijos"; "Activos fijos")
                {
                }
                field("Documentación"; Documentación)
                {
                }
                field(Asistencia; Asistencia)
                {
                }
                field(Meta4; Meta4)
                {
                }
                field("Es lugar de Pago"; "Es lugar de Pago")
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            group(Navegar)
            {
                action("Relación seguridad")
                {
                    Caption = 'Relación seguridad';
                    RunObject = Page "Lista relación grupo seguridad";
                }
                action("Documentos por grupo")
                {
                    Caption = 'Documentos por grupo';
                    RunObject = Page "Lista documentos por grupo";
                    RunPageLink = Grupo = FIELD (Grupo);
                }
                action("Ficha Grupo Seguridad")
                {
                    Caption = 'Ficha Grupo Seguridad';
                    RunObject = Page "Grupos Seguridad";
                    RunPageLink = Grupo = FIELD (Grupo);
                    RunPageOnRec = true;
                    ShortCutKey = 'Shift+F5';
                }
            }
        }
    }
}

