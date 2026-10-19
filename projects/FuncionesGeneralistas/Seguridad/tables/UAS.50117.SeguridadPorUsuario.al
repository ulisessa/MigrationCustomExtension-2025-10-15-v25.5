table 50117 "Seguridad por usuario"
{

    fields
    {
        field(1; Usuario; Code[50])
        {
            Caption = 'User ID';
            ToolTip = 'Specifies the value of the User ID field.';
        }
        field(2; Grupo; Code[20])
        {
            Caption = 'Grupo';
            ToolTip = 'Specifies the value of the Grupo field.';
            TableRelation = Seguridad.Grupo;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(3; "Mostrar documentación"; Boolean)
        {
            Caption = 'Mostrar documentación';
            ToolTip = 'Specifies the value of the Mostrar documentación field.';
        }
    }

    keys
    {
        key(Key1; Usuario, Grupo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    [Scope('OnPrem')]
    procedure fntSeguridadComparada(codUsuarioA: Code[50]; codUsuarioB: Code[50]): Boolean
    var
        rstSeguridadUsuarioA: Record "Seguridad por usuario";
        rstSeguridadA: Record Seguridad;
        rstSeguridadUsuarioB: Record "Seguridad por usuario";
        rstSeguridadB: Record Seguridad;
        blnmatch: Boolean;
        rstConfUsu: Record "User Setup";
    begin
        Clear(rstSeguridadA);
        Clear(rstSeguridadB);
        Clear(rstSeguridadUsuarioA);

        blnmatch := false;

        Clear(rstConfUsu);
        if not rstConfUsu.Get(codUsuarioB) then
            blnmatch := true;
        rstSeguridadUsuarioA.SetRange(Usuario, codUsuarioA);
        rstSeguridadUsuarioA.SetFilter(Grupo, '%1|%2', rstConfUsu.Grupo, 'SUPER');
        if rstSeguridadUsuarioA.Find('-') then
            blnmatch := true;

        if blnmatch then
            exit(true);
    end;

    [Scope('OnPrem')]
    procedure fntSeguridadPermiso(codUsuario: Code[50]; intCampo: Integer): Boolean
    var
        rstSeguridad: Record Seguridad;
        rstSeguridadUsuario: Record "Seguridad por usuario";
        rstSeguridadTemporal: Record Seguridad temporary;
    begin
        Clear(rstSeguridad);
        Clear(rstSeguridadUsuario);
        Clear(rstSeguridadTemporal);

        rstSeguridadUsuario.SetRange(Usuario, codUsuario);
        if rstSeguridadUsuario.Find('-') then
            repeat

                Clear(rstSeguridad);
                rstSeguridad.Get(rstSeguridadUsuario.Grupo);

                if rstSeguridad."Modificar Líneas Ajenas" then
                    rstSeguridadTemporal."Modificar Líneas Ajenas" := true;

                if rstSeguridad."Aprobar Pedidos" then
                    rstSeguridadTemporal."Aprobar Pedidos" := true;

                if rstSeguridad."Modificar rango registro" then
                    rstSeguridadTemporal."Modificar rango registro" := true;

                if rstSeguridad."Registrar - Enviar Pedidos" then
                    rstSeguridadTemporal."Registrar - Enviar Pedidos" := true;

                if rstSeguridad."Facturación Automática" then
                    rstSeguridadTemporal."Facturación Automática" := true;

                if rstSeguridad."Factura Venta - Registrar" then
                    rstSeguridadTemporal."Factura Venta - Registrar" := true;

                if rstSeguridad."Confirmar Líneas" then
                    rstSeguridadTemporal."Confirmar Líneas" := true;

                if rstSeguridad."Eliminar Líneas" then
                    rstSeguridadTemporal."Eliminar Líneas" := true;

                if rstSeguridad."Facturas vencidas" then
                    rstSeguridadTemporal."Facturas vencidas" := true;

                if rstSeguridad."Omitir controles de fecha" then
                    rstSeguridadTemporal."Omitir controles de fecha" := true;

                if rstSeguridad."Grupo Planilleras" then
                    rstSeguridadTemporal."Grupo Planilleras" := true;

                if rstSeguridad."Imputar a Proyectos Cerrados" then
                    rstSeguridadTemporal."Imputar a Proyectos Cerrados" := true;

                if rstSeguridad."Anular remitos de Compra" then
                    rstSeguridadTemporal."Anular remitos de Compra" := true;

                if rstSeguridad."Anular mov. producto" then
                    rstSeguridadTemporal."Anular mov. producto" := true;

                if rstSeguridad."Modificar solicitudes ajenas" then
                    rstSeguridadTemporal."Modificar solicitudes ajenas" := true;

                if rstSeguridad."Anular producción" then
                    rstSeguridadTemporal."Anular producción" := true;

                if rstSeguridad."Anular remito de venta" then
                    rstSeguridadTemporal."Anular remito de venta" := true;

                if rstSeguridad."Anular factura de venta" then
                    rstSeguridadTemporal."Anular factura de venta" := true;

                if rstSeguridad."Anular Vales de consumo" then
                    rstSeguridadTemporal."Anular Vales de consumo" := true;

                if rstSeguridad."Anular factura de compra" then
                    rstSeguridadTemporal."Anular factura de compra" := true;

                if rstSeguridad."Modificar rango registro" then
                    rstSeguridadTemporal."Modificar rango registro" := true;

                if rstSeguridad."Aprobar solicitudes" then
                    rstSeguridadTemporal."Aprobar solicitudes" := true;

                if rstSeguridad."Anular solicitud" then
                    rstSeguridadTemporal."Anular solicitud" := true;

                if rstSeguridad."Aprobar OC para recepción" then
                    rstSeguridadTemporal."Aprobar OC para recepción" := true;

                if rstSeguridad."Anular reparto de venta" then
                    rstSeguridadTemporal."Anular reparto de venta" := true;

                if rstSeguridad."Anular n/c de compra" then
                    rstSeguridadTemporal."Anular n/c de compra" := true;

                if rstSeguridad."Anular Descargas" then
                    rstSeguridadTemporal."Anular Descargas" := true;

                if rstSeguridad."Anular asientos contables" then
                    rstSeguridadTemporal."Anular asientos contables" := true;

                if rstSeguridad."Anular asientos proyecto" then
                    rstSeguridadTemporal."Anular asientos proyecto" := true;

                if rstSeguridad."Autorizar pago" then
                    rstSeguridadTemporal."Autorizar pago" := true;

                if rstSeguridad."Aprobar factura" then
                    rstSeguridadTemporal."Aprobar factura" := true;

                if rstSeguridad."Autorizar factura" then
                    rstSeguridadTemporal."Autorizar factura" := true;

                if rstSeguridad."Anular liquidación pagos" then
                    rstSeguridadTemporal."Anular liquidación pagos" := true;

                if rstSeguridad."Cambiar estado" then
                    rstSeguridadTemporal."Cambiar estado" := true;

                if rstSeguridad."Admite factura directa" then
                    rstSeguridadTemporal."Admite factura directa" := true;

                if rstSeguridad."Recurso de facturación directa" then
                    rstSeguridadTemporal."Recurso de facturación directa" := true;

                if rstSeguridad."Consumos sin stock" then
                    rstSeguridadTemporal."Consumos sin stock" := true;

                if rstSeguridad."Aprobar pago sin vincular" then
                    rstSeguridadTemporal."Aprobar pago sin vincular" := true;

                if rstSeguridad.Flota then
                    rstSeguridadTemporal.Flota := true;

                if rstSeguridad."Anular pase nómina" then
                    rstSeguridadTemporal."Anular pase nómina" := true;

                if rstSeguridad."Alterar Recupero IVA" then
                    rstSeguridadTemporal."Alterar Recupero IVA" := true;

                if rstSeguridad."Bloquear pago" then
                    rstSeguridadTemporal."Bloquear pago" := true;

                if rstSeguridad."Omitir controles dimensiones" then
                    rstSeguridadTemporal."Omitir controles dimensiones" := true;

                if rstSeguridad."Omitir validaciones WS-AFIP" then
                    rstSeguridadTemporal."Omitir validaciones WS-AFIP" := true;

                if rstSeguridad."Ignorar validación período inv" then
                    rstSeguridadTemporal."Ignorar validación período inv" := true;

                if rstSeguridad."Omitir controles impositivos" then
                    rstSeguridadTemporal."Omitir controles impositivos" := true;

                if not rstSeguridadTemporal.Insert then
                    rstSeguridadTemporal.Modify;


            until rstSeguridadUsuario.Next = 0;

        case intCampo of

            rstSeguridad.FieldNo(rstSeguridad."Modificar Líneas Ajenas"):
                begin

                    if rstSeguridadTemporal."Modificar Líneas Ajenas" then
                        exit(true);

                end;

            rstSeguridad.FieldNo(rstSeguridad."Omitir controles de fecha"):
                begin

                    if rstSeguridadTemporal."Omitir controles de fecha" then
                        exit(true);

                end;

            rstSeguridad.FieldNo(rstSeguridad."Aprobar Pedidos"):
                begin

                    if rstSeguridadTemporal."Aprobar Pedidos" then
                        exit(true);

                end;

            rstSeguridad.FieldNo(rstSeguridad."Registrar - Enviar Pedidos"):
                begin

                    if rstSeguridadTemporal."Registrar - Enviar Pedidos" then
                        exit(true);

                end;

            rstSeguridad.FieldNo(rstSeguridad."Facturación Automática"):
                begin

                    if rstSeguridadTemporal."Facturación Automática" then
                        exit(true);

                end;

            rstSeguridad.FieldNo(rstSeguridad."Factura Venta - Registrar"):
                begin

                    if rstSeguridadTemporal."Factura Venta - Registrar" then
                        exit(true);

                end;

            rstSeguridad.FieldNo(rstSeguridad."Confirmar Líneas"):
                begin

                    if rstSeguridadTemporal."Modificar Líneas Ajenas" then
                        exit(true);

                end;

            rstSeguridad.FieldNo(rstSeguridad."Modificar rango registro"):
                begin

                    if rstSeguridadTemporal."Modificar rango registro" then
                        exit(true);

                end;

            rstSeguridad.FieldNo(rstSeguridad."Eliminar Líneas"):
                begin

                    if rstSeguridadTemporal."Eliminar Líneas" then
                        exit(true);

                end;

            rstSeguridad.FieldNo(rstSeguridad."Aprobar solicitudes"):
                begin

                    if rstSeguridadTemporal."Aprobar solicitudes" then
                        exit(true);

                end;


            rstSeguridad.FieldNo(rstSeguridad."Facturas vencidas"):
                begin

                    if rstSeguridadTemporal."Facturas vencidas" then
                        exit(true);

                end;

            rstSeguridad.FieldNo(rstSeguridad."Grupo Planilleras"):
                begin

                    if rstSeguridadTemporal."Grupo Planilleras" then
                        exit(true);

                end;

            rstSeguridad.FieldNo(rstSeguridad."Imputar a Proyectos Cerrados"):
                begin

                    if rstSeguridadTemporal."Imputar a Proyectos Cerrados" then
                        exit(true);

                end;

            rstSeguridad.FieldNo(rstSeguridad."Anular remitos de Compra"):
                begin

                    if rstSeguridadTemporal."Anular remitos de Compra" then
                        exit(true);

                end;

            rstSeguridad.FieldNo(rstSeguridad."Anular mov. producto"):
                begin

                    if rstSeguridadTemporal."Anular mov. producto" then
                        exit(true);

                end;

            rstSeguridad.FieldNo(rstSeguridad."Modificar solicitudes ajenas"):
                begin

                    if rstSeguridadTemporal."Modificar solicitudes ajenas" then
                        exit(true);

                end;

            rstSeguridad.FieldNo(rstSeguridad."Anular producción"):
                begin

                    if rstSeguridadTemporal."Anular producción" then
                        exit(true);

                end;

            rstSeguridad.FieldNo(rstSeguridad."Anular remito de venta"):
                begin

                    if rstSeguridadTemporal."Anular remito de venta" then
                        exit(true);

                end;

            rstSeguridad.FieldNo(rstSeguridad."Anular factura de venta"):
                begin

                    if rstSeguridadTemporal."Anular factura de venta" then
                        exit(true);

                end;

            rstSeguridad.FieldNo(rstSeguridad."Anular Vales de consumo"):
                begin

                    if rstSeguridadTemporal."Anular Vales de consumo" then
                        exit(true);

                end;

            rstSeguridad.FieldNo(rstSeguridad."Anular factura de compra"):
                begin

                    if rstSeguridadTemporal."Anular factura de compra" then
                        exit(true);

                end;

            rstSeguridad.FieldNo(rstSeguridad."Anular solicitud"):
                begin

                    if rstSeguridadTemporal."Anular solicitud" then
                        exit(true);

                end;

            rstSeguridad.FieldNo(rstSeguridad."Aprobar OC para recepción"):
                begin

                    if rstSeguridadTemporal."Aprobar OC para recepción" then
                        exit(true);

                end;

            rstSeguridad.FieldNo(rstSeguridad."Anular reparto de venta"):
                begin

                    if rstSeguridadTemporal."Anular reparto de venta" then
                        exit(true);

                end;

            rstSeguridad.FieldNo(rstSeguridad."Anular n/c de compra"):
                begin

                    if rstSeguridadTemporal."Anular n/c de compra" then
                        exit(true);

                end;

            rstSeguridad.FieldNo(rstSeguridad."Autorizar pago"):
                begin

                    if rstSeguridadTemporal."Autorizar pago" then
                        exit(true);

                end;

            rstSeguridad.FieldNo("Anular Descargas"):
                begin

                    if rstSeguridadTemporal."Anular Descargas" then
                        exit(true);

                end;

            rstSeguridad.FieldNo("Anular asientos contables"):
                begin

                    if rstSeguridadTemporal."Anular asientos contables" = true then
                        exit(true);

                end;

            rstSeguridad.FieldNo("Anular asientos proyecto"):
                begin

                    if rstSeguridadTemporal."Anular asientos proyecto" = true then
                        exit(true);

                end;

            rstSeguridad.FieldNo(rstSeguridad."Aprobar factura"):
                begin

                    if rstSeguridadTemporal."Aprobar factura" then
                        exit(true);

                end;

            rstSeguridad.FieldNo(rstSeguridad."Autorizar factura"):
                begin

                    if rstSeguridadTemporal."Autorizar factura" then
                        exit(true);

                end;

            rstSeguridad.FieldNo(rstSeguridad."Cambiar estado"):
                begin

                    if rstSeguridadTemporal."Cambiar estado" then
                        exit(true);

                end;

            rstSeguridad.FieldNo(rstSeguridad."Admite factura directa"):
                begin

                    if rstSeguridadTemporal."Admite factura directa" then
                        exit(true);

                end;

            rstSeguridad.FieldNo("Recurso de facturación directa"):
                begin

                    if rstSeguridadTemporal."Recurso de facturación directa" then
                        exit(true);

                end;

            rstSeguridad.FieldNo("Consumos sin stock"):
                begin

                    if rstSeguridadTemporal."Consumos sin stock" then
                        exit(true);

                end;

            rstSeguridad.FieldNo("Anular liquidación pagos"):
                begin

                    if rstSeguridadTemporal."Anular liquidación pagos" then
                        exit(true);

                end;

            rstSeguridad.FieldNo("Aprobar pago sin vincular"):
                begin

                    if rstSeguridadTemporal."Aprobar pago sin vincular" then
                        exit(true);

                end;

            rstSeguridad.FieldNo("Alterar Recupero IVA"):
                begin

                    if rstSeguridadTemporal."Alterar Recupero IVA" then
                        exit(true);

                end;

            rstSeguridad.FieldNo(Flota):
                begin

                    if rstSeguridadTemporal.Flota then
                        exit(true);

                end;


            rstSeguridad.FieldNo("Anular pase nómina"):
                begin

                    if rstSeguridadTemporal."Anular pase nómina" then
                        exit(true);

                end;

            rstSeguridad.FieldNo("Bloquear pago"):
                begin

                    if rstSeguridadTemporal."Bloquear pago" then
                        exit(true);

                end;

            rstSeguridad.FieldNo("Omitir controles dimensiones"):
                begin

                    if rstSeguridadTemporal."Omitir controles dimensiones" then
                        exit(true);

                end;

            rstSeguridad.FieldNo("Omitir validaciones WS-AFIP"):
                begin

                    if rstSeguridadTemporal."Omitir validaciones WS-AFIP" then
                        exit(true);

                end;

            rstSeguridad.FieldNo("Omitir controles impositivos"):
                begin

                    if rstSeguridadTemporal."Omitir controles impositivos" then
                        exit(true);

                end;
            rstSeguridad.FieldNo("Ignorar validación período inv"):
                begin

                    if rstSeguridadTemporal."Ignorar validación período inv" then
                        exit(true);

                end;
        end;
    end;

    [Scope('OnPrem')]
    procedure fntEstaEnGrupoSeguridad(codUsuarioA: Code[50]; codGrupoSeguridadB: Code[10]): Boolean
    var
        rstSeguridadUsuarioA: Record "Seguridad por usuario";
        blnmatch: Boolean;
    begin
        blnmatch := false;
        Clear(rstSeguridadUsuarioA);
        rstSeguridadUsuarioA.SetRange(Usuario, codUsuarioA);
        rstSeguridadUsuarioA.SetRange(Grupo, codGrupoSeguridadB);
        if rstSeguridadUsuarioA.Find('-') then
            blnmatch := true;
        exit(blnmatch);
    end;
}

