tableextension 51244 tableextension51244 extends "Administration Cue"
{
    Caption = 'Administration Cue';
    fields
    {
        modify("No. Series Period")
        {
            Caption = 'No. Series Period';
        }
        modify("CDS Integration Errors")
        {
            Caption = 'CDS Integration Errors';
        }
        modify("Coupled Data Synch Errors")
        {
            Caption = 'Coupled Data Synch Errors';
        }
        field(50000; "Producción planta"; Integer)
        {
            CalcFormula = Count("Produccion Planta" WHERE("Fecha registro" = FIELD("Date Filter")));
            FieldClass = FlowField;
        }
        field(50001; "Digitalizadas - Facturas"; Integer)
        {
            CalcFormula = Count(Mensajeria WHERE("Destinatario/Grupo" = FIELD("Filtro grupo destino"),
                                                  Remitente = FIELD("Filtro grupo origen"),
                                                  "Tipo Documento" = FILTER('Factura (compras)'),
                                                  Estado = CONST('Digitalizado'),
                                                  "Tipo movimiento" = FILTER("Mensaje con Seguimiento" | Alerta | "Flujo documentos")));
            Caption = 'Digitalizadas - Facturas';
            FieldClass = FlowField;
        }
        field(50002; "Preaprobadas - Facturas"; Integer)
        {
            CalcFormula = Count(Mensajeria WHERE("Destinatario/Grupo" = FIELD("Filtro grupo destino"),
                                                  Remitente = FIELD("Filtro grupo origen"),
                                                  "Tipo Documento" = FILTER('Factura (compras)'),
                                                  Estado = CONST('Preaprobado'),
                                                  "Tipo movimiento" = FILTER("Mensaje con Seguimiento" | Alerta | "Flujo documentos")));
            Caption = 'Preaprobadas - Facturas';
            FieldClass = FlowField;
        }
        field(50003; "Aprobadas - Facturas"; Integer)
        {
            CalcFormula = Count(Mensajeria WHERE("Destinatario/Grupo" = FIELD("Filtro grupo destino"),
                                                  Remitente = FIELD("Filtro grupo origen"),
                                                  "Tipo Documento" = FILTER('Factura (compras)'),
                                                  Estado = CONST('Aprobado'),
                                                  "Tipo movimiento" = FILTER("Mensaje con Seguimiento" | Alerta | "Flujo documentos")));
            Caption = 'Aprobadas - Facturas';
            FieldClass = FlowField;
        }
        field(50004; "Facturas a autorizar"; Integer)
        {
            CalcFormula = Count(Mensajeria WHERE("Destinatario/Grupo" = FIELD("Filtro grupo destino"),
                                                  Remitente = FIELD("Filtro grupo origen"),
                                                  "Tipo Documento" = FILTER('Factura (compras)'),
                                                  Estado = CONST('A autorizar'),
                                                  "Tipo movimiento" = FILTER("Mensaje con Seguimiento" | Alerta | "Flujo documentos")));
            Caption = 'A autorizar - Facturas';
            FieldClass = FlowField;
        }
        field(50005; "Facturas autorizadas"; Integer)
        {
            CalcFormula = Count(Mensajeria WHERE("Destinatario/Grupo" = FIELD("Filtro grupo destino"),
                                                  Remitente = FIELD("Filtro grupo origen"),
                                                  "Tipo Documento" = FILTER('Factura (compras)'),
                                                  Estado = CONST('Autorizado'),
                                                  "Tipo movimiento" = FILTER("Mensaje con Seguimiento" | Alerta | "Flujo documentos")));
            Caption = 'Autorizadas - Facturas';
            FieldClass = FlowField;
        }
        field(50006; "Facturas registradas"; Integer)
        {
            CalcFormula = Count(Mensajeria WHERE(Remitente = FIELD("Filtro grupo origen"),
                                                  "Tipo Documento" = FILTER('Factura (compras)'),
                                                  Estado = CONST('Registrado'),
                                                  "Tipo movimiento" = FILTER("Mensaje con Seguimiento" | Alerta | "Flujo documentos")));
            Caption = 'Registradas - Facturas';
            FieldClass = FlowField;
        }
        field(50007; "Facturas liquidadas"; Integer)
        {
            CalcFormula = Count(Mensajeria WHERE("Destinatario/Grupo" = FIELD("Filtro grupo destino"),
                                                  Remitente = FIELD("Filtro grupo origen"),
                                                  "Tipo Documento" = FILTER('Factura (compras)'),
                                                  Estado = CONST('Factura liquidada'),
                                                  "Tipo movimiento" = FILTER("Mensaje con Seguimiento" | Alerta | "Flujo documentos")));
            Caption = 'Liquidadas - Facturas';
            FieldClass = FlowField;
        }
        field(50008; "Solicitudes abiertas"; Integer)
        {
            CalcFormula = Count(Mensajeria WHERE(Remitente = FIELD("Filtro grupo origen"),
                                                  "Tipo Documento" = FILTER('Solicitud (compras)'),
                                                  Estado = CONST('Abierto'),
                                                  "Tipo movimiento" = FILTER("Mensaje con Seguimiento" | Alerta | "Flujo documentos"),
                                                  "Destinatario/Grupo" = FIELD("Filtro grupo destino")));
            Caption = 'Abiertas - Solicitudes';
            FieldClass = FlowField;
        }
        field(50009; "Solicitudes a aprobar"; Integer)
        {
            CalcFormula = Count(Mensajeria WHERE(Remitente = FIELD("Filtro grupo origen"),
                                                  "Tipo Documento" = FILTER('Solicitud (compras)'),
                                                  Estado = CONST('A aprobar'),
                                                  "Tipo movimiento" = FILTER("Mensaje con Seguimiento" | Alerta | "Flujo documentos"),
                                                  "Destinatario/Grupo" = FIELD("Filtro grupo destino")));
            Caption = 'A aprobar - Solicitudes';
            FieldClass = FlowField;
        }
        field(50010; "Solicitudes aprobado"; Integer)
        {
            CalcFormula = Count(Mensajeria WHERE(Remitente = FIELD("Filtro grupo origen"),
                                                  "Tipo Documento" = FILTER('Solicitud (compras)'),
                                                  Estado = CONST('Aprobado'),
                                                  "Tipo movimiento" = FILTER("Mensaje con Seguimiento" | Alerta | "Flujo documentos"),
                                                  "Destinatario/Grupo" = FIELD("Filtro grupo destino")));
            Caption = 'Aprobado - Solicitudes';
            FieldClass = FlowField;
        }
        field(50011; "Solicitudes en cotización"; Integer)
        {
            CalcFormula = Count(Mensajeria WHERE(Remitente = FIELD("Filtro grupo origen"),
                                                  "Tipo Documento" = FILTER('Solicitud (compras)'),
                                                  Estado = CONST('En cotización'),
                                                  "Tipo movimiento" = FILTER("Mensaje con Seguimiento" | Alerta | "Flujo documentos"),
                                                  "Destinatario/Grupo" = FIELD("Filtro grupo destino")));
            Caption = 'En cotización - Solicitudes';
            FieldClass = FlowField;
        }
        field(50012; "Solicitudes en pedido"; Integer)
        {
            CalcFormula = Count(Mensajeria WHERE(Remitente = FIELD("Filtro grupo origen"),
                                                  "Tipo Documento" = FILTER('Solicitud (compras)'),
                                                  Estado = CONST('En pedido'),
                                                  "Tipo movimiento" = FILTER("Mensaje con Seguimiento" | Alerta | "Flujo documentos"),
                                                  "Destinatario/Grupo" = FIELD("Filtro grupo destino")));
            Caption = 'En pedido - Solicitudes';
            FieldClass = FlowField;
        }
        field(50013; "Solicitudes en factura"; Integer)
        {
            CalcFormula = Count(Mensajeria WHERE(Remitente = FIELD("Filtro grupo origen"),
                                                  "Tipo Documento" = FILTER('Solicitud (compras)'),
                                                  Estado = CONST('En factura'),
                                                  "Tipo movimiento" = FILTER("Mensaje con Seguimiento" | Alerta | "Flujo documentos"),
                                                  "Destinatario/Grupo" = FIELD("Filtro grupo destino")));
            Caption = 'En factura - Solicitudes';
            FieldClass = FlowField;
        }
        field(50014; "Solicitudes registradas"; Integer)
        {
            CalcFormula = Count(Mensajeria WHERE("Tipo Documento" = FILTER('Solicitud (compras)'),
                                                  Estado = CONST('Aprobado y registrado'),
                                                  "Tipo movimiento" = FILTER("Mensaje con Seguimiento" | Alerta | "Flujo documentos")));
            Caption = 'Completadas - Solicitudes';
            FieldClass = FlowField;
        }
        field(50015; "Producción merluza"; Integer)
        {
            CalcFormula = Count("Produccion Planta" WHERE("Fecha registro" = FIELD("Date Filter"),
                                                           "Global Dimension 2" = CONST('MER')));
            Caption = 'Merluza - Producción';
            FieldClass = FlowField;
        }
        field(50016; "Producción calamar"; Integer)
        {
            CalcFormula = Count("Produccion Planta" WHERE("Fecha registro" = FIELD("Date Filter"),
                                                           "Global Dimension 2" = CONST('CAL')));
            Caption = 'Calamar - Producción';
            FieldClass = FlowField;
        }
        field(50017; "Producción langostino fresco"; Integer)
        {
            CalcFormula = Count("Produccion Planta" WHERE("Fecha registro" = FIELD("Date Filter"),
                                                           "Global Dimension 2" = CONST('FRE')));
            Caption = 'Langostino fresco - Producción';
            FieldClass = FlowField;
        }
        field(50018; "Ordenes de compra abiertas"; Integer)
        {
            CalcFormula = Count(Mensajeria WHERE(Remitente = FIELD("Filtro grupo origen"),
                                                  "Tipo Documento" = FILTER('Pedido (compras)'),
                                                  Estado = CONST('Abierto'),
                                                  "Tipo movimiento" = FILTER("Mensaje con Seguimiento" | Alerta | "Flujo documentos")));
            Caption = 'Abiertas - OC';
            FieldClass = FlowField;
        }
        field(50019; "Ordenes de compra a recibir"; Integer)
        {
            CalcFormula = Count(Mensajeria WHERE(Remitente = FIELD("Filtro grupo origen"),
                                                  "Tipo Documento" = FILTER('Pedido (compras)'),
                                                  Estado = CONST('A recibir'),
                                                  "Tipo movimiento" = FILTER("Mensaje con Seguimiento" | Alerta | "Flujo documentos")));
            Caption = 'A recibir - OC';
            FieldClass = FlowField;
        }
        field(50020; "Ordenes de compra recibidas"; Integer)
        {
            CalcFormula = Count(Mensajeria WHERE(Remitente = FIELD("Filtro grupo origen"),
                                                  "Tipo Documento" = FILTER('Pedido (compras)'),
                                                  Estado = CONST('Recibido'),
                                                  "Tipo movimiento" = FILTER("Mensaje con Seguimiento" | Alerta | "Flujo documentos")));
            Caption = 'Recibidas - OC';
            FieldClass = FlowField;
        }
        field(50021; "Pedido abierto - Ventas"; Integer)
        {
            CalcFormula = Count(Mensajeria WHERE("Tipo Documento" = FILTER('Pedido (ventas)'),
                                                  Estado = CONST('Abierto'),
                                                  "Tipo movimiento" = FILTER("Mensaje con Seguimiento" | Alerta | "Flujo documentos")));
            FieldClass = FlowField;
        }
        field(50022; "Pedido enviado - Ventas"; Integer)
        {
            CalcFormula = Count(Mensajeria WHERE("Tipo Documento" = FILTER('Pedido (ventas)'),
                                                  Estado = CONST('Enviado'),
                                                  "Tipo movimiento" = FILTER("Mensaje con Seguimiento" | Alerta | "Flujo documentos")));
            FieldClass = FlowField;
        }
        field(50023; "Reparto abierto - Ventas"; Integer)
        {
            CalcFormula = Count(Mensajeria WHERE("Tipo Documento" = FILTER('Reparto (ventas)'),
                                                  Estado = CONST('Abierto'),
                                                  "Tipo movimiento" = FILTER("Mensaje con Seguimiento" | Alerta | "Flujo documentos")));
            FieldClass = FlowField;
        }
        field(50024; "Reparto registrado - Ventas"; Integer)
        {
            CalcFormula = Count(Mensajeria WHERE("Tipo Documento" = FILTER('Reparto (ventas)'),
                                                  Estado = CONST('Registrado'),
                                                  "Tipo movimiento" = FILTER("Mensaje con Seguimiento" | Alerta | "Flujo documentos")));
            FieldClass = FlowField;
        }
        field(50500; Grupo; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Seguridad;
        }
        field(50501; "Tipo documento"; Text[40])
        {
            FieldClass = FlowFilter;
            TableRelation = "Tipos documento";
        }
        field(50502; "Estado documento"; Text[50])
        {
            FieldClass = FlowFilter;
            TableRelation = Estados;
        }
        field(50503; "No. form"; Integer)
        {
            FieldClass = FlowFilter;
            TableRelation = Object.ID WHERE(Type = CONST(Page));
        }
        field(50504; "Filtro grupo origen"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Seguridad;
        }
        field(50505; "Filtro grupo destino"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Seguridad;
        }
    }
}

