table 50508 Seguridad
{

    fields
    {
        field(1; Grupo; Code[10])
        {
        }
        field(2; "Modificar Líneas Ajenas"; Boolean)
        {
        }
        field(4; "Aprobar Pedidos"; Boolean)
        {
        }
        field(5; "Registrar - Enviar Pedidos"; Boolean)
        {
        }
        field(6; "Facturación Automática"; Boolean)
        {
        }
        field(7; "Factura Venta - Registrar"; Boolean)
        {
        }
        field(8; "Confirmar Líneas"; Boolean)
        {
        }
        field(9; "Eliminar Líneas"; Boolean)
        {
        }
        field(10; "Aprobar solicitudes"; Boolean)
        {
        }
        field(11; "Facturas vencidas"; Boolean)
        {
        }
        field(12; "Grupo Planilleras"; Boolean)
        {
        }
        field(13; "Imputar a Proyectos Cerrados"; Boolean)
        {
        }
        field(14; "Anular remitos de Compra"; Boolean)
        {
        }
        field(15; "Anular mov. producto"; Boolean)
        {
        }
        field(16; "Modificar solicitudes ajenas"; Boolean)
        {
        }
        field(17; "Anular producción"; Boolean)
        {
        }
        field(18; "Anular remito de venta"; Boolean)
        {
        }
        field(19; "Anular factura de venta"; Boolean)
        {
        }
        field(20; "Anular Vales de consumo"; Boolean)
        {
        }
        field(21; "Anular factura de compra"; Boolean)
        {
        }
        field(22; "Modificar rango registro"; Boolean)
        {
        }
        field(23; "Anular solicitud"; Boolean)
        {
        }
        field(24; "Aprobar OC para recepción"; Boolean)
        {
        }
        field(25; "Anular reparto de venta"; Boolean)
        {
        }
        field(26; "Autorizar pago"; Boolean)
        {
        }
        field(27; "Aprobar factura"; Boolean)
        {
        }
        field(28; "Autorizar factura"; Boolean)
        {
        }
        field(29; "Cambiar estado"; Boolean)
        {
        }
        field(30; "Anular n/c de compra"; Boolean)
        {
        }
        field(31; "Anular documentos digitales"; Boolean)
        {
        }
        field(32; "Anular Descargas"; Boolean)
        {
        }
        field(33; "Anular asientos contables"; Boolean)
        {
        }
        field(34; "Anular asientos proyecto"; Boolean)
        {
        }
        field(35; "Admite factura directa"; Boolean)
        {
        }
        field(36; "Recurso de facturación directa"; Boolean)
        {
        }
        field(37; "Consumos sin stock"; Boolean)
        {
        }
        field(38; "Liquidación pagos en lote"; Boolean)
        {
        }
        field(39; "Habilitar anticipos"; Boolean)
        {
        }
        field(40; "Anular liquidación pagos"; Boolean)
        {
        }
        field(41; "Registrar liquidación pagos"; Boolean)
        {
            Description = 'Habilita el registro de liquidaciones de pago sin autorizar';
        }
        field(42; "Aprobar pago sin vincular"; Boolean)
        {
        }
        field(43; Flota; Boolean)
        {
        }
        field(44; "Anular pase nómina"; Boolean)
        {
        }
        field(45; Editar; Boolean)
        {
        }
        field(46; "Revertir mov. contabilidad"; Boolean)
        {
        }
        field(47; "Revertir lote movs. contab."; Boolean)
        {
        }
        field(48; "Revertir movs. remitos consum."; Boolean)
        {
        }
        field(49; "Eliminar lotes de facturas"; Boolean)
        {
        }
        field(50; "Omitir controles de fecha"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(51; "Alterar Recupero IVA"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(52; "Bloquear pago"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(53; "Omitir controles dimensiones"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(54; "Omitir validaciones WS-AFIP"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(55; "Ignorar validación período inv"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(56; "Omitir controles impositivos"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(100; Contabilidad; Boolean)
        {
        }
        field(101; "Ventas/Cobros"; Boolean)
        {
        }
        field(102; "Compras/Pagos"; Boolean)
        {
        }
        field(103; Existencias; Boolean)
        {
        }
        field(104; "Producción"; Boolean)
        {
        }
        field(105; Proyectos; Boolean)
        {
        }
        field(106; Gerencia; Boolean)
        {
        }
        field(107; Recursos; Boolean)
        {
        }
        field(108; "Activos fijos"; Boolean)
        {
        }
        field(109; "Documentación"; Boolean)
        {
        }
        field(110; Asistencia; Boolean)
        {
        }
        field(111; Meta4; Boolean)
        {
        }
        field(50000; "Es lugar de Pago"; Option)
        {
            OptionMembers = " ",BUE,CRV,PD;
        }
    }

    keys
    {
        key(Key1; Grupo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

