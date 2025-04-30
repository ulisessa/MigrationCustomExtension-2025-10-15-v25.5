codeunit 50006 RecuperoIVA
{
    trigger OnRun()
    begin
        
    end;


    var
        g_intRegistro: Integer;
        g_decCoeficiente: Decimal;
        g_intPeriodoAplicado: Integer;
        g_decPorcExportado: Decimal;
        g_decIVAMaxARecuperar: Decimal;
        g_decIVARecuperado: Decimal;
        g_decSaldoExpoMax: Decimal;
        k: Integer;
        g_decMPTotal: Decimal;
        g_decPTTotal: Decimal;
        l_intR7: Integer;


    [Scope('OnPrem')]
    procedure fntGenerarRecuperoIVA(p_rstAP: Record "Accounting Period")
    var
        l_rstAP: Record "Accounting Period";
        l_msg1: Text;
        i: Integer;
        l_cdu50501: Codeunit "Registro diarios";
        l_rstAP2: Record "Accounting Period";
        l_rst5814: Record "Inventory Period";
        l_rst50544b: Record "Recupero IVA";
        l_rstGLS: Record "General Ledger Setup";
        l_rstAP3: Record "Accounting Period";
        l_intMovComprasIn: Integer;
        l_intMovVentasIn: Integer;
        l_intMovComprasFin: Integer;
        l_intMovVentasFin: Integer;
        l_rst50544: Record "Recupero IVA";
        l_rst50545: Record "Detalle Recupero IVA";
        l_rst50546: Record "Recupero IVA Rubro 7";
        l_rst50547: Record "Recupero IVA Rubro 3";
        l_rst50544Actual: Record "Recupero IVA";
        l_dlg: Dialog;
        Error1: Label 'Ya se ha generado la presentación correspondiente al período contable iniciado el %1 y terminado el %2.';
        l_rst167: Record Job;
        l_rstFADepreciationBook: Record "FA Depreciation Book";
        l_rstFA: Record "Fixed Asset";
        l_rstIVLE: Record "Value Entry";
        l_rstIVLE2: Record "Value Entry";
        l_rstILE: Record "Item Ledger Entry";
        l_rstILE2: Record "Item Ledger Entry";
        l_rstIAE: Record "Item Application Entry";
        l_rstIAE2: Record "Item Application Entry";
        l_intSalida: Integer;
        l_blnTransfer: Boolean;
        l_rstJob: Record Job;
        j: Integer;
        l_rstCI: Record "Company Information";
        l_blnAvanzar: Boolean;
        l_intEntrada: Integer;
        l_rst156: Record Resource;
    begin
        with p_rstAP do begin

            TestField("VAT recovery", false);
            Clear(l_rst5814);
            l_rst5814.Get(CalcDate('<+CM>', "Starting Date"));
            if not l_rst5814.Closed then
                Error('Para ejecutar este proceso, debe haber cerrado todos los movimientos de inventario.');
            Clear(l_rstAP2);
            l_rstAP2.SetFilter("Starting Date", '<=%1', "Starting Date");
            l_rstAP2.SetRange("New Fiscal Year", true);
            l_rstAP2.FindLast;
            Clear(l_rstAP);
            l_rstAP.SetRange("VAT recovery", false);
            l_rstAP.SetRange("Starting Date", l_rstAP2."Starting Date", "Starting Date");
            if l_rstAP.FindSet then begin
                Clear(l_rst50544);
                l_rst50544.SetRange("Initial Accounting Period", l_rstAP."Starting Date");
                l_rst50544.SetRange("Final Accounting Period", CalcDate('<+CM>', "Starting Date"));
                if l_rst50544.FindFirst then
                    Error(Error1, l_rst50544."Initial Accounting Period", CalcDate('<+CM>', "Starting Date"))
                else begin
                    l_msg1 := 'Se va a generar la presentación correspondiente al período contable iniciado el ' + Format(l_rstAP."Starting Date") + ' y terminado el ' + Format(CalcDate('<+CM>', "Starting Date")) + ' ¿Desea continuar?';
                    if Confirm(l_msg1, true) then
                        repeat
                            Clear(l_rst50544);
                            if l_rst50544.FindLast then
                                i := l_rst50544."No." + 1
                            else
                                i := 1;
                            Clear(l_rst50544);
                            l_rst50544."No." := i;
                            l_rst50544."Creation Date" := Today;
                            l_rst50544."User ID" := UserId;
                            l_rst50544."Initial Accounting Period" := l_rstAP."Starting Date";
                            l_rst50544."Final Accounting Period" := CalcDate('<+CM>', l_rstAP."Starting Date");
                            l_intMovComprasIn := 0;
                            l_intMovVentasIn := 0;
                            Clear(l_rst50545);
                            if l_rst50545.FindLast then
                                l_intMovComprasIn := l_rst50545."No. mov.";
                            Clear(l_rst50547);
                            if l_rst50547.FindLast then
                                l_intMovVentasIn := l_rst50547."No. mov.";
                            Clear(l_cdu50501);
                            //Ejecutar el proceso de Ventas
                            //Ejecutar el proceso de Compras
                            l_intMovVentasFin := fntGenerarRecuperoIVAVentas(l_rstAP."Starting Date", CalcDate('<+CM>', l_rstAP."Starting Date"), l_rst50544."No.");
                            l_intMovComprasFin := fntGenerarRecuperoIVACompras(l_rstAP."Starting Date", CalcDate('<+CM>', l_rstAP."Starting Date"), l_rst50544."No.");
                            Clear(l_rst50545);
                            if l_rst50545.FindLast then begin
                                if l_intMovComprasIn <> l_intMovComprasFin then begin
                                    l_rst50544."From Entry No. Purch." := l_intMovComprasIn + 1;
                                    l_rst50544."To Entry No. Purch." := l_intMovComprasFin;
                                end;
                            end;
                            Clear(l_rst50547);
                            if l_rst50547.FindLast then begin
                                if l_intMovVentasIn <> l_intMovVentasFin then begin
                                    l_rst50544."From Entry No. Sales" := l_intMovVentasIn + 1;
                                    l_rst50544."To Entry No. Sales" := l_intMovVentasFin;
                                end;
                            end;
                            l_rst50544.Insert;

                            //Una vez insertado el registro de cabecera, calculo los totales
                            //Primero, identifico el inicio del año fiscal para calcular el coeficiente total
                            Clear(l_rstAP3);
                            l_rstAP3.SetFilter("Starting Date", '<=%1', l_rstAP."Starting Date");
                            l_rstAP3.SetRange("New Fiscal Year", true);
                            l_rstAP3.FindLast;
                            Clear(l_rstGLS);
                            l_rstGLS.Get();
                            l_rstGLS.TestField("General VAT rate for recovery");
                            l_rstGLS.TestField("Age recovery VAT formula");
                            l_rstGLS.TestField("VAT recovery end date margin");
                            Clear(l_rst50544b);
                            l_rst50544b.SetFilter("Initial Accounting Period", '>=%1', l_rstAP3."Starting Date");
                            l_rst50544b.SetFilter("Final Accounting Period", '<=%1', l_rst50544."Final Accounting Period");
                            if l_rst50544b.FindSet then
                                repeat
                                    l_rst50544b.CalcFields("FOB Invoicing", "Internal Commerce", "Insumos importados en $");
                                    l_rst50544."Saldo año fiscal MI" += l_rst50544b."Internal Commerce";
                                    l_rst50544."Saldo año fiscal Expo" += l_rst50544b."FOB Invoicing";
                                    //l_rst50544."MI gravadas" += l_rst50544
                                    if (l_rst50544."Saldo año fiscal Expo" - l_rst50544."Saldo año fiscal MI") <> 0 then
                                        l_rst50544."Coeficiente aplicable" := (l_rst50544."Saldo año fiscal Expo" - l_rst50544."Insumos importados en $") / (l_rst50544."Saldo año fiscal Expo" + l_rst50544."Saldo año fiscal MI" - l_rst50544."Insumos importados en $");
                                    l_rst50544."Saldo EXPO máximo a recuperar" := l_rst50544b."FOB Invoicing";
                                    l_rst50544."Saldo IVA máximo a recuperar" := l_rst50544b."FOB Invoicing" * l_rstGLS."General VAT rate for recovery" / 100;
                                    l_rst50544.Modify;
                                    g_intPeriodoAplicado := l_rst50544."No.";
                                until l_rst50544b.Next = 0;
                            //Marco que se ejecutó el proceso para el Período contable actual
                            Clear(l_rstAP3);
                            l_rstAP3.Get(l_rstAP."Starting Date");
                            l_rstAP3."VAT recovery" := true;
                            l_rstAP3.Modify;

                        until l_rstAP.Next = 0
                    else
                        Error('Proceso detenido');
                    g_decCoeficiente := l_rst50544."Coeficiente aplicable";
                end;
            end;

            //Una vez ejecutado, si se generó algún registro nuevo de Recupero, se ejecuta la aplicación de compras a ventas.
            Clear(l_dlg);
            l_dlg.Open('Compras entre #1## y #2##\' +
                       'Procesando doc:    #3###');
            Clear(l_rstAP);
            l_rstAP.SetFilter("Starting Date", '<=%1', "Starting Date");
            l_rstAP.SetRange("New Fiscal Year", true);
            l_rstAP.FindLast;
            i := 0;
            //Me quedo sólo con los recuperos de este ejercicio
            Clear(l_rst50544);
            l_rst50544.SetFilter("Initial Accounting Period", '>=%1', l_rstAP."Starting Date");
            l_rst50544.SetFilter("Final Accounting Period", '<=%1', CalcDate('<+CM>', "Starting Date"));
            l_dlg.Update(1, "Starting Date");
            l_dlg.Update(2, CalcDate('<+CM>', "Starting Date"));
            if l_rst50544.FindSet then
                repeat
                    //l_rst50544.CALCSUMS("Saldo IVA máximo a recuperar","Saldo EXPO  máximo a recuperar","Saldo IVA recuperado");
                    Clear(l_rst50546);
                    i := fntBuscarUltimoR7 + 1;
                    l_rst50544.CalcFields("IVA recuperado en esta DDJJ");
                    g_decIVAMaxARecuperar := l_rst50544."Saldo IVA máximo a recuperar";
                    g_decIVARecuperado := l_rst50544."IVA recuperado en esta DDJJ";
                    l_blnAvanzar := false;
                    if l_rst50544b."FOB Invoicing" = 0 then begin
                        if l_rstGLS."Omit in months with no exports" then
                            l_blnAvanzar := false
                        else
                            l_blnAvanzar := true;
                    end
                    else
                        l_blnAvanzar := true;
                    if (g_decIVARecuperado < g_decIVAMaxARecuperar) and l_blnAvanzar then begin
                        //Busco en toda la lista de recuperos armados los pendientes
                        //Iniciamos primero por los Recursos
                        Clear(l_rst50545);
                        //Filtro por el número de registro. En este item, sólo tomo lo que se haya pagado en esta época
                        //l_rst50545.SETRANGE("No. registro recupero IVA",l_rst50544."No.");
                        //Saco las líneas de redondeo!
                        //l_rstGLS.TESTFIELD("Recover VAT from");
                        //2024-11-19 Probar que primero ofrezca directos
                        l_rst50545.SetCurrentKey(l_rst50545."Tipo afectación");
                        l_rst50545.SetFilter("IVA para recupero", '>%1|<%2', l_rstGLS."Recover VAT from", l_rstGLS."Recover VAT from" * -1);
                        //Filtro la fecha de registro de acuerdo al margen de fecha final especificado en la configuración de contabilidad
                        l_rst50545.SetFilter("Fecha de comprobante", '>=%1&<=%2'
                                            , CalcDate(l_rstGLS."Age recovery VAT formula", CalcDate('<+CM>', l_rst50544."Final Accounting Period"))
                                            , CalcDate(l_rstGLS."VAT recovery end date margin", CalcDate('<+CM>', l_rst50544."Final Accounting Period")));
                        if l_rst50545.FindSet then
                            repeat
                                l_dlg.Update(3, l_rst50545."No. documento interno");
                                Clear(l_rst50546);
                                Clear(l_rstIAE);
                                l_intSalida := 0;
                                i += 1;
                                l_rst50545.SetRange("Filtro No. mov. relacionado");
                                l_rst50545.CalcFields("IVA recuperado", "Cantidad recuperada", "No computable");
                                //IF l_rst50545."IVA para recupero" <> l_rst50545."Importe IVA Computable" THEN
                                //El IVA para recupero es el total posible, sin aplicación de coeficiente. Se completa una vez presentado para recupero, pero no necesariamente ya recuperado
                                //Si la suma del IVA recuperado y el IVA para recupero de esta línea es menor o igual al IVA máximo a recuperar en este período, y el IVA máximo a recuperar es diferente a cero, y
                                //la cantidad es diferente a la cantidad recuperada, entonces inicio el recupero del IVA de esta línea
                                //IF ((l_decIVARecuperado+l_rst50545."IVA para recupero") <= l_decIVAMaxARecuperar) AND (l_decIVAMaxARecuperar <> 0) {AND (l_rst50545.Cantidad <> l_rst50545."Cantidad recuperada")} THEN
                                //Si la suma del IVA recuperado y el IVA para recupero de esta línea es menor o igual al IVA máximo a recuperar en este período, y el IVA máximo a recuperar es diferente a cero, y es computable
                                //entonces inicio el recupero del IVA de esta línea
                                //Sólo chequear lo recuperado contra el IVA a recuperar
                                //IF ((l_decIVARecuperado+l_rst50545."IVA para recupero"-l_rst50545."IVA recuperado") <= l_decIVAMaxARecuperar)
                                //  AND (l_decIVAMaxARecuperar <> 0) AND (NOT l_rst50545."No computable")
                                if (g_decIVARecuperado <= g_decIVAMaxARecuperar) and (not l_rst50545."No computable")
                                //AND (l_rst50545."IVA para recupero"<>l_rst50545."IVA recuperado")
                                then begin
                                    if not fntVerificarFiltroParciales(l_rst50545) then begin
                                        l_rst50546."No. mov." := fntBuscarUltimoR7 + 1;
                                        l_rst50546."Tipo de comprobante" := l_rst50545."Tipo de comprobante";
                                        l_rst50546."Fecha de comprobante" := l_rst50545."Fecha de comprobante";
                                        l_rst50546.Tipo := l_rst50545.Tipo;
                                        l_rst50546."No." := l_rst50545."No.";
                                        l_rst50546."Punto de venta" := l_rst50545."Punto de venta";
                                        l_rst50546."Número de comprobante" := l_rst50545."Número de comprobante";
                                        l_rst50546."CUIT Emisor" := l_rst50545."CUIT Emisor";
                                        l_rst50546."Denominación emisor" := l_rst50545."Denominación emisor";
                                        l_rst50546."CUIT Vendedor" := l_rst50545."CUIT Vendedor";
                                        l_rst50546."Denominación vendedor" := l_rst50545."Denominación vendedor";
                                        l_rst50546."No. mov. relacionado" := l_rstIAE."Outbound Item Entry No.";
                                        l_rst50546."Cantidad mov. compra" := l_rst50545.Cantidad;
                                        l_rst50546."Importe Neto en $" := l_rst50545."Importe Neto en $";
                                        l_rst50546."Importe IVA Facturado en $" := l_rst50545."Importe IVA Facturado en $";
                                        l_rst50546."Importe IVA Computable vinc. a" := 0;
                                        l_rst50546."Importe IVA Computable" := l_rst50545."Importe IVA Computable";
                                        l_rst50546."Monto IVA Retenido" := l_rst50545."Monto IVA Retenido";
                                        l_rst50546."Período de Pago" := l_rst50545."Período de Pago";
                                        l_rst50546."Período DDJJ" := l_rst50545."Período DDJJ";
                                        //l_rst50546."Período DDJJ" := l_rst50544."Final Accounting Period";
                                        l_rst50546."Descripción del Bien" := l_rst50545.Descripcion;
                                        l_rst50546."IVA Depositado en CBU" := 0;
                                        l_rst50546."Código de Régimen" := l_rst50545."Código de Régimen";
                                        l_rst50546."Número de Certificado" := l_rst50545."Número de Certificado";
                                        l_rst50546."Motivo de no retención" := l_rst50545."Motivo de no retención";
                                        l_rst50546."R.G. Certificado de exclusión" := l_rst50545."R.G. Certificado de exclusión";
                                        l_rst50546."Medios de Pago" := l_rst50545."Medios de Pago";
                                        l_rst50546."Tipo de Rubro 7" := l_rst50545."Tipo de Rubro 7";
                                        l_rst50546."Tipo de afectacion" := l_rst50545."Tipo afectación";
                                        l_rst50546."Descripción contable" := l_rst50545."Descripción contable";
                                        //Coeficiente aplicado
                                        l_rst50546."Coeficiente aplicado" := g_decCoeficiente;
                                        l_rst50546."Documento expo relacionado" := '';
                                        l_rst50546."Posicion Arancelaria" := l_rst50545."Posicion Arancelaria";
                                        l_rst50546."No. documento interno" := l_rst50545."No. documento interno";
                                        l_rst50546."No. linea" := l_rst50545."No. linea";
                                        l_rst50546."No. registro recupero IVA" := g_intPeriodoAplicado;
                                        g_decPorcExportado := 1;
                                        case l_rst50545.Tipo of
                                            l_rst50545.Tipo::Resource:
                                                begin
                                                    Clear(l_rst167);
                                                    if l_rst50545."No. proyecto" <> '' then begin
                                                        l_rst167.Get(l_rst50545."No. proyecto");
                                                        l_rst50546."No. mov. relacionado" := l_rst50545."No. mov. relacionado";
                                                        l_rst50546."Cantidad mov. relacionado" := l_rst50545.Cantidad;
                                                        l_rst50546.Proyecto := l_rst50545."No. proyecto";
                                                        l_rst50546."Tipo de afectacion" := fntTipoAfectacion(l_rst167, l_rst50545);
                                                        if l_rst167.Tipo = l_rst167.Tipo::Productivo then
                                                            g_decPorcExportado := fntPorcentajeExportado(l_rst50545."No. proyecto",/*l_rst50545."Fecha de comprobante"*/l_rst50544."Final Accounting Period", l_rst50545);
                                                        l_rst50546."Porcentaje aplicado" := g_decCoeficiente;
                                                        if l_rst50546."Tipo de afectacion" = l_rst50546."Tipo de afectacion"::Indirecta then
                                                            l_rst50546."IVA recuperado" := fntCalcularMonto(g_decIVARecuperado, l_rst50545."Importe IVA Computable"
                                                                                                            , g_decCoeficiente, l_rst50545."IVA recuperado"
                                                                                                            , g_decIVAMaxARecuperar, l_rst50545."Tipo afectación", 0, 0)
                                                        else begin
                                                            l_rst50546."IVA recuperado" := fntCalcularMonto(g_decIVARecuperado, l_rst50545."Importe IVA Computable"
                                                                                                            , g_decPorcExportado, l_rst50545."IVA recuperado"
                                                                                                            , g_decIVAMaxARecuperar, l_rst50545."Tipo afectación", 0, 0);
                                                            l_rst50546."Porcentaje aplicado" := g_decPorcExportado;
                                                        end;
                                                        l_rst50546."IVA para recupero" := l_rst50545."Importe IVA Computable";
                                                        if l_rstGLS."VAT recover quotient summarize" then begin
                                                            if (l_rst50546."IVA recuperado" <> 0) then begin
                                                                l_rst50546."Descripción contable" := l_rst50545."Descripción contable";

                                                                l_rst50546.Insert;
                                                                g_decIVARecuperado += l_rst50546."IVA recuperado";
                                                                Clear(l_rst50546);
                                                            end;
                                                        end
                                                        else begin
                                                            if ((l_rst50546."IVA recuperado" > 0)
                                                              and (l_rst50546."IVA para recupero" > 0))
                                                              or ((l_rst50546."IVA recuperado" < 0)
                                                              and (l_rst50546."IVA para recupero" < 0)) then begin
                                                                l_rst50546."Descripción contable" := l_rst50545."Descripción contable";
                                                                l_rst50546.Insert;
                                                                g_decIVARecuperado += l_rst50546."IVA recuperado";
                                                                //CLEAR(l_rst50546);
                                                            end;
                                                        end;
                                                    end;
                                                end;
                                            l_rst50545.Tipo::Item:
                                                begin
                                                    //Busco el movimiento de valor de la línea de factura
                                                    fntNuevaLineaRecuperoProducto(l_rst50545, l_rst50546, p_rstAP, l_rst50544);
                                                end;
                                            l_rst50545.Tipo::"Fixed Asset":
                                                begin
                                                    l_rst50546."Tipo de afectacion" := l_rst50546."Tipo de afectacion"::Indirecta;
                                                    Clear(l_rstFA);
                                                    l_rstFA.Get(l_rst50545."No.");
                                                    Clear(l_rstFADepreciationBook);
                                                    l_rstFADepreciationBook.SetRange("FA No.", l_rstFA."No.");
                                                    l_rstFADepreciationBook.SetFilter("Depreciation Starting Date", '<=%1', CalcDate('<+CM>', "Starting Date"));
                                                    if l_rstFADepreciationBook.FindFirst then begin
                                                        l_rst50546."Porcentaje aplicado" := g_decCoeficiente;
                                                        l_rst50546."Cantidad mov. relacionado" := l_rst50546."Cantidad mov. compra";
                                                        l_rst50546."IVA recuperado" := Round(fntCalcularMonto(g_decIVARecuperado, l_rst50545."Importe IVA Computable"
                                                                                                        , g_decCoeficiente, l_rst50545."IVA recuperado"
                                                                                                        , g_decIVAMaxARecuperar, l_rst50545."Tipo afectación", Abs(l_rst50546."Cantidad mov. compra"), Abs(l_rst50545.Cantidad))
                                                                                                        , 0.01);
                                                        //Primero, verificamos si el IVA a recuperar es superior a la diferencia entre lo ya recuperado y el máximo a recuperar en esta instancia por ventas al exterior
                                                        if (g_decIVARecuperado > g_decIVAMaxARecuperar) then
                                                            //Si el IVA a recuperar es mayor, entonces directamente descuento el faltante hasta alcanzar el máximo a recuperar en esta instancia
                                                            //En caso contrario, aplicamos el coeficiente que corresponda sobre el monto de IVA para recupero
                                                            l_rst50546."IVA recuperado" := g_decIVAMaxARecuperar - g_decIVARecuperado;
                                                    end;
                                                    //l_rst50546."IVA para recupero" := l_decARecuperar;
                                                    l_rst50546."IVA para recupero" := l_rst50546."Importe IVA Computable";
                                                    if l_rstGLS."VAT recover quotient summarize" then begin
                                                        if (l_rst50546."IVA recuperado" <> 0) then begin
                                                            l_rst50546.Insert;
                                                            g_decIVARecuperado += l_rst50546."IVA recuperado";
                                                            Clear(l_rst50546);
                                                        end;
                                                    end
                                                    else begin
                                                        //IF (l_rst50546."IVA recuperado" > 0) OR ((l_rst50546."IVA recuperado" < 0) AND (l_rst50546."IVA para recupero" < 0)) THEN
                                                        if ((l_rst50546."IVA recuperado" > 0) and (l_rst50546."IVA para recupero" > 0)) or ((l_rst50546."IVA recuperado" < 0) and (l_rst50546."IVA para recupero" < 0)) then begin
                                                            l_rst50546.Insert;
                                                            g_decIVARecuperado += l_rst50546."IVA recuperado";
                                                            Clear(l_rst50546);
                                                        end;
                                                    end;
                                                    /*
                                                    ELSE
                                                      IF l_rst50546.INSERT THEN;
                                                      //l_rst50546.DELETE;
                                                      */
                                                end;
                                        end;
                                        /*
                                                  IF l_rst50546."IVA recuperado" = 0 THEN
                                                    l_rst50546.DELETE;
                                        */
                                    end;
                                end;
                            until (l_rst50545.Next = 0) or (g_decIVARecuperado >= g_decIVAMaxARecuperar);
                    end;
                until l_rst50544.Next = 0;
        end;
        l_dlg.Close;
        Message('Recupero generado');
        /*
        CLEAR(l_rstAP);
        l_rstAP.SETFILTER("Starting Date",'<=%1',"Starting Date");
        l_rstAP.SETRANGE("New Fiscal Year",TRUE);
        l_rstAP.FINDLAST;
        CLEAR(l_rstGLS);
        l_rstGLS.GET();
        CLEAR(l_rst50544b);
        l_rst50544b.SETFILTER("Initial Accounting Period",'>=%1',l_rstAP."Starting Date");
        l_rst50544b.SETFILTER("Final Accounting Period",'<=%1',l_rst50544."Final Accounting Period");
        IF l_rst50544b.FINDSET THEN
        REPEAT
          l_rst50544b.CALCFIELDS("FOB Invoicing","Internal Commerce","Insumos importados en $");
          l_rst50544."Saldo año fiscal MI" += l_rst50544b."Internal Commerce";
          l_rst50544."Saldo año fiscal Expo" += l_rst50544b."FOB Invoicing";
          IF (l_rst50544."Saldo año fiscal Expo"-l_rst50544."Saldo año fiscal MI") <> 0 THEN
            l_rst50544."Coeficiente aplicable" := {l_rstGLS."Coeficiente IVA Computable"*}(l_rst50544."Saldo año fiscal Expo"-l_rst50544."Insumos importados en $")/(l_rst50544."Saldo año fiscal Expo"+l_rst50544."Saldo año fiscal MI"-l_rst50544."Insumos importados en $");
          l_rst50544."Monto máximo a recuperar" := l_rst50544."Saldo año fiscal Expo"*l_rst50544."Coeficiente aplicable";
          l_rst50544.MODIFY;
        UNTIL l_rst50544b.NEXT = 0;
        CLEAR(l_rstAP2);
        l_rstAP2.SETRANGE("Starting Date",l_rstAP."Starting Date","Starting Date");
        l_rstAP2.FINDSET;
        l_rstAP2.MODIFYALL("VAT recovery",TRUE);
        MESSAGE('Proceso finalizado.');
        */

    end;

    [Scope('OnPrem')]
    procedure fntGenerarRecuperoIVAVentas(l_datFI: Date; l_datFF: Date; l_intRegistro: Integer): Integer
    var
        rstMens: Record Mensajeria;
        rstNC: Record "Sales Cr.Memo Header";
        l_rstCLE: Record "Cust. Ledger Entry";
        l_rst50519: Record "Tipos documento";
        rstND: Record "Sales Invoice Header";
        rstCC: Record "Cust. Ledger Entry";
        rstCCL: Record "Cust. Ledger Entry";
        rstCI: Record "Company Information";
        rstLFC: Record "Sales Invoice Line";
        rstLNC: Record "Sales Cr.Memo Line";
        rstVE2: Record "VAT Entry";
        rstFC: Record "Sales Invoice Header";
        l_rstSS: Record "Sales & Receivables Setup";
        l_rst50547: Record "Recupero IVA Rubro 3";
        l_rstCR: Record "Cab. Reparto";
        l_rstGLS: Record "General Ledger Setup";
        l_blnInterno: Boolean;
        l_dlg: Dialog;
    begin
        //Crear registros de facturas de venta de exportación
        //Tengo que filtrarlo según la fecha de cumplido
        g_intRegistro := l_intRegistro;
        Clear(l_dlg);
        l_dlg.Open('Ventas entre #1## y #2##\' +
                   'Procesando doc:    #3###');
        l_dlg.Update(1, l_datFI);
        l_dlg.Update(2, l_datFF);
        Clear(l_rstCR);
        l_rstCR.SetRange("Fecha cumplido", l_datFI, l_datFF);
        if l_rstCR.FindSet then
            repeat

                Clear(l_rstCLE);
                Clear(l_rstSS);
                l_rstSS.Get();
                Clear(l_rstGLS);
                l_rstGLS.Get();
                case l_rstSS."Dimension for sales" of
                    l_rstGLS."Global Dimension 1 Code":
                        l_rstCLE.SetRange("Global Dimension 1 Code", l_rstCR."No. Documento");
                    l_rstGLS."Global Dimension 2 Code":
                        l_rstCLE.SetRange("Global Dimension 2 Code", l_rstCR."No. Documento");
                    l_rstGLS."Global Dimension 3 Code":
                        l_rstCLE.SetRange("Global dimension 3 Code", l_rstCR."No. Documento");
                    l_rstGLS."Global Dimension 4 Code":
                        l_rstCLE.SetRange("Global Dimension 4 Code", l_rstCR."No. Documento");
                    l_rstGLS."Global Dimension 5 Code":
                        l_rstCLE.SetRange("Global Dimension 5 Code", l_rstCR."No. Documento");
                    l_rstGLS."Global Dimension 6 Code":
                        l_rstCLE.SetRange("Global dimension 6 Code", l_rstCR."No. Documento");
                    l_rstGLS."Global Dimension 7 Code":
                        l_rstCLE.SetRange("Global Dimension 7 Code", l_rstCR."No. Documento");
                end;

                l_rstCLE.SetFilter("Document Type", '%1|%2', l_rstCLE."Document Type"::Invoice, l_rstCLE."Document Type"::"Credit Memo");
                Clear(l_rstSS);
                l_rstSS.Get();
                l_rstCLE.SetRange("Customer Posting Group", l_rstSS."Grupo contable Exportaciones");
                if l_rstCLE.FindSet then
                    repeat
                        l_blnInterno := false;
                        l_dlg.Update(3, l_rstCLE."Document No.");
                        with l_rstCLE do begin
                            case l_rstCLE."Document Type" of
                                l_rstCLE."Document Type"::Invoice:
                                    begin
                                        Clear(rstNC);
                                        rstNC.SetRange("Applies-to Doc. No.", "Document No.");
                                        if rstNC.FindFirst then begin
                                            Clear(rstMens);
                                            rstMens.SetRange("No. documento", rstNC."Pre-Assigned No.");
                                            if rstMens.FindFirst then begin
                                                Clear(l_rst50519);
                                                l_rst50519.SetRange("Tipos documento", rstMens."Tipo Documento");
                                                l_rst50519.FindFirst;
                                                if l_rst50519."Documento interno" = true then
                                                    l_blnInterno := true;
                                            end;
                                        end;
                                        Clear(rstMens);
                                        Clear(rstCCL);
                                        rstCCL.SetRange("Entry No.", "Closed by Entry No.");
                                        if rstCCL.FindFirst then begin
                                            case rstCCL."Document Type" of
                                                rstCCL."Document Type"::Invoice:
                                                    begin
                                                        Clear(rstND);
                                                        rstND.Get(rstCCL."Document No.");
                                                        rstMens.SetRange("No. documento", rstND."Pre-Assigned No.");
                                                        if rstMens.FindFirst then begin
                                                            Clear(l_rst50519);
                                                            l_rst50519.SetRange("Tipos documento", rstMens."Tipo Documento");
                                                            l_rst50519.FindFirst;
                                                            if l_rst50519."Documento interno" = true then
                                                                l_blnInterno := true;
                                                        end;
                                                    end;
                                                rstCCL."Document Type"::"Credit Memo":
                                                    begin
                                                        Clear(rstNC);
                                                        rstNC.Get(rstCCL."Document No.");
                                                        rstMens.SetRange("No. documento", rstNC."Pre-Assigned No.");
                                                        if rstMens.FindFirst then begin
                                                            Clear(l_rst50519);
                                                            l_rst50519.SetRange("Tipos documento", rstMens."Tipo Documento");
                                                            l_rst50519.FindFirst;
                                                            if l_rst50519."Documento interno" = true then
                                                                l_blnInterno := true;
                                                        end;
                                                    end;
                                            end;
                                        end;
                                    end;
                                l_rstCLE."Document Type"::"Credit Memo":
                                    begin
                                        Clear(rstNC);
                                        rstNC.SetRange("No.", "Document No.");
                                        if rstNC.FindFirst then begin
                                            Clear(rstMens);
                                            rstMens.SetRange("No. documento", rstNC."Pre-Assigned No.");
                                            if rstMens.FindFirst then begin
                                                Clear(l_rst50519);
                                                l_rst50519.SetRange("Tipos documento", rstMens."Tipo Documento");
                                                l_rst50519.FindFirst;
                                                if l_rst50519."Documento interno" = true then
                                                    l_blnInterno := true;
                                            end;
                                        end;
                                    end;
                            end;
                        end;
                        if not l_blnInterno then
                            fntInsertarLineaRecuperoVentas(l_rstCLE, l_intRegistro, l_rstCR);
                    until l_rstCLE.Next = 0;
            until l_rstCR.Next = 0;
        //Repetir el proceso, para las ventas de MI
        Clear(l_rstCR);
        Clear(l_rstSS);
        l_rstSS.Get();
        l_blnInterno := false;
        Clear(l_rstCLE);
        l_rstCLE.SetRange("Document Date", l_datFI, l_datFF);
        l_rstCLE.SetFilter("Document Type", '%1|%2', l_rstCLE."Document Type"::Invoice, l_rstCLE."Document Type"::"Credit Memo");
        l_rstCLE.SetFilter("Customer Posting Group", '<>%1', l_rstSS."Grupo contable Exportaciones");
        l_dlg.Update(3, l_rstCLE."Document No.");
        with l_rstCLE do begin
            if l_rstCLE.FindSet then
                repeat
                    l_blnInterno := false;
                    l_dlg.Update(3, l_rstCLE."Document No.");
                    case l_rstCLE."Document Type" of
                        l_rstCLE."Document Type"::Invoice:
                            begin
                                Clear(rstNC);
                                rstNC.SetRange("Applies-to Doc. No.", "Document No.");
                                if rstNC.FindFirst then begin
                                    Clear(rstMens);
                                    rstMens.SetRange("No. documento", rstNC."Pre-Assigned No.");
                                    if rstMens.FindFirst then begin
                                        Clear(l_rst50519);
                                        l_rst50519.SetRange("Tipos documento", rstMens."Tipo Documento");
                                        l_rst50519.FindFirst;
                                        if l_rst50519."Documento interno" = true then
                                            l_blnInterno := true;
                                    end;
                                end;
                                Clear(rstMens);
                                Clear(rstCCL);
                                rstCCL.SetRange("Entry No.", "Closed by Entry No.");
                                if rstCCL.FindFirst then begin
                                    case rstCCL."Document Type" of
                                        rstCCL."Document Type"::Invoice:
                                            begin
                                                Clear(rstND);
                                                rstND.Get(rstCCL."Document No.");
                                                rstMens.SetRange("No. documento", rstND."Pre-Assigned No.");
                                                if rstMens.FindFirst then begin
                                                    Clear(l_rst50519);
                                                    l_rst50519.SetRange("Tipos documento", rstMens."Tipo Documento");
                                                    l_rst50519.FindFirst;
                                                    if l_rst50519."Documento interno" = true then
                                                        l_blnInterno := true;
                                                end;
                                            end;
                                        rstCCL."Document Type"::"Credit Memo":
                                            begin
                                                Clear(rstNC);
                                                rstNC.Get(rstCCL."Document No.");
                                                rstMens.SetRange("No. documento", rstNC."Pre-Assigned No.");
                                                if rstMens.FindFirst then begin
                                                    Clear(l_rst50519);
                                                    l_rst50519.SetRange("Tipos documento", rstMens."Tipo Documento");
                                                    l_rst50519.FindFirst;
                                                    if l_rst50519."Documento interno" = true then
                                                        l_blnInterno := true;
                                                end;
                                            end;
                                    end;
                                end;
                                Clear(rstMens);
                                if l_rstCLE.Open and (l_rstCLE."Closed by Entry No." = 0) then begin
                                    Clear(rstND);
                                    rstND.Get(l_rstCLE."Document No.");
                                    rstMens.SetRange("No. documento", rstND."Pre-Assigned No.");
                                    if rstMens.FindFirst then begin
                                        Clear(l_rst50519);
                                        l_rst50519.SetRange("Tipos documento", rstMens."Tipo Documento");
                                        l_rst50519.FindFirst;
                                        if l_rst50519."Documento interno" = true then
                                            l_blnInterno := true;
                                    end;
                                end;
                            end;
                        l_rstCLE."Document Type"::"Credit Memo":
                            begin
                                Clear(rstNC);
                                rstNC.SetRange("No.", "Document No.");
                                if rstNC.FindFirst then begin
                                    Clear(rstMens);
                                    rstMens.SetRange("No. documento", rstNC."Pre-Assigned No.");
                                    if rstMens.FindFirst then begin
                                        Clear(l_rst50519);
                                        l_rst50519.SetRange("Tipos documento", rstMens."Tipo Documento");
                                        l_rst50519.FindFirst;
                                        if l_rst50519."Documento interno" = true then
                                            l_blnInterno := true;
                                    end;
                                end;
                            end;
                    end;
                    if not l_blnInterno then
                        fntInsertarLineaRecuperoVentas(l_rstCLE, l_intRegistro, l_rstCR);
                until l_rstCLE.Next = 0;
        end;
        Clear(l_rst50547);
        if l_rst50547.FindLast then
            exit(l_rst50547."No. mov.");

        l_dlg.Close;
    end;

    local procedure fntInsertarLineaRecuperoVentas(l_rstCLE: Record "Cust. Ledger Entry"; l_intRegistro: Integer; l_rstCR: Record "Cab. Reparto")
    var
        l_rst50547: Record "Recupero IVA Rubro 3";
        i: Integer;
        l_codTDoc: Code[3];
        strNroComp: Code[20];
        l_rst251: Record "Gen. Product Posting Group";
        qry50030: Query "Detalle ventas";
        l_rst113: Record "Sales Invoice Line";
        l_rst110: Record "Sales Shipment Header";
        l_codArancel: Code[12];
        l_rstSS: Record "Sales & Receivables Setup";
        l_rstSIH: Record "Sales Invoice Header";
        l_rstJob: Record Job;
        l_rstIAE: Record "Item Application Entry";
        l_rstILE: Record "Item Ledger Entry";
        l_rstGLS: Record "General Ledger Setup";
        l_rstExit: Record "Entry/Exit Point";
        qry50037: Query "Detalle ventas NC";
        l_rst114: Record "Sales Cr.Memo Header";
        l_rst115: Record "Sales Cr.Memo Line";
        l_cduRegistroDiarios: Codeunit "Registro diarios";
    begin
        case l_rstCLE."Document Type" of
            l_rstCLE."Document Type"::Invoice:
                l_codTDoc := '19';
        end;

        strNroComp := l_rstCLE."Document No.";
        Clear(l_rstSS);
        l_rstSS.Get();

        Clear(l_rst113);
        l_rst113.SetRange("Document No.", l_rstCLE."Document No.");
        l_rst113.SetFilter("Shipment No.", '<>%1', '');
        if l_rst113.FindFirst then begin
            //CLEAR(l_rstReparto);
            Clear(l_rst110);
            l_rst110.Get(l_rst113."Shipment No.");
            /*
            l_rstReparto.SETRANGE("No. Pedido",l_rst110."Order No.");
            l_rstReparto.FINDFIRST;
            l_rstReparto.SETRANGE("No. Documento",l_rstCR."No. Documento");
            l_rstReparto.FINDFIRST;
            */
        end;
        if l_rstSS."Grupo contable Exportaciones" = l_rstCLE."Customer Posting Group" then begin
            l_rstCR.TestField("Fecha cumplido");
            l_rstCR.TestField("Recovery Currency Factor");
        end
        else
            l_codTDoc := '01';
        Clear(qry50030);
        qry50030.SetRange(qry50030.Gross_winnings_perception_code, '');
        qry50030.SetRange(Document_No, l_rstCLE."Document No.");

        /*
        //Ya uso esto para filtrar los movimientos de una expo, porque necesito las ventas de servicios de flete y seguro
        //IF l_rstSS."Grupo contable Exportaciones" = l_rstCLE."Customer Posting Group" THEN
        //  qry50030.SETFILTER(qry50030.Filt_Cod_Arance,'<>%1','');
        */
        qry50030.Open;
        while qry50030.Read do begin
            /*
            //Ya uso esto para filtrar los movimientos de una expo, porque necesito las ventas de servicios de flete y seguro
            //IF ((l_rstSS."Grupo contable Exportaciones" <> l_rstCLE."Customer Posting Group") AND (qry50030.Sum_Amount <> qry50030.Sum_Amount_Including_VAT))
            // OR (l_rstSS."Grupo contable Exportaciones" = l_rstCLE."Customer Posting Group") THEN
            BEGIN
            */
            Clear(l_rst50547);
            if l_rst50547.FindLast then
                i := l_rst50547."No. mov." + 1
            else
                i := 1;
            Clear(l_rst251);
            l_rst251.Get(qry50030.Gen_Prod_Posting_Group);
            Clear(l_rst50547);
            l_rst50547."No. mov." += i;
            l_rst50547."Regimen informado" := 1; //Completar con "1"
            l_rst50547."Tipo de documento" := l_codTDoc;
            //l_rst50547."Numero de documento" := l_cduRegistroDiarios.fntNum(16,strNroComp);
            if qry50030.Permiso_de_embarque <> '' then
                l_rst50547."Numero de documento" := qry50030.Permiso_de_embarque
            else
                l_rst50547."Numero de documento" := strNroComp;
            l_rst50547."No. documento interno" := qry50030.Cod_Document_No;
            //l_rst50547.Item := l_rst251.Description;
            l_rst50547."Posicion Arancelaria" := l_cduRegistroDiarios.fntNum(12, DelChr(qry50030.Cód_arancelario, '=', DelChr(qry50030.Cód_arancelario, '=', 'ABCDEFGHIJKLMNOPQRSTUVXYWZ0123456789')));
            l_rst50547."Unidad de medida" := 'KN';
            l_rst50547.Cantidad := qry50030.Sum_Net_kilos;
            //Traer tipo de cambio del Reparto
            Clear(l_rstGLS);
            l_rstGLS.Get();
            //l_rst50547."Tipo de cambio" := ROUND(1/l_rstCLE."Original Currency Factor",l_rstGLS."Unit-Amount Rounding Precision");
            if l_rstCR."Recovery Currency Factor" <> 0 then
                l_rst50547."Tipo de cambio" := Round(1 / l_rstCR."Recovery Currency Factor", l_rstGLS."Unit-Amount Rounding Precision")
            else
                l_rst50547."Tipo de cambio" := 1;
            if (l_rstSS."Grupo contable Exportaciones" <> l_rstCLE."Customer Posting Group") and (l_rstCLE."Currency Code" <> '') then begin
                l_rstCLE.CalcFields("Amount (LCY)", l_rstCLE.Amount);
                l_rst50547."Tipo de cambio" := Round(l_rstCLE."Amount (LCY)" / l_rstCLE.Amount, l_rstGLS."Unit-Amount Rounding Precision");
            end;
            l_rst50547."Monto FOB en divisa origen" := qry50030.Sum_Amount;
            l_rst50547."Monto FOB en $" := Round(l_rst50547."Monto FOB en divisa origen" * l_rst50547."Tipo de cambio", 0.01);
            l_rst50547."Insumos importados" := Round(fntTraerMontoInsumos(l_rstCLE."Document No.", qry50030.Cód_arancelario, l_rst50547."Monto FOB en divisa origen") * l_rst50547."Tipo de cambio", 0.01);
            l_rst50547.Proyecto := qry50030.Job_No;
            Clear(l_rstJob);
            l_rstJob.Get(l_rst50547.Proyecto);
            l_rst50547."Shortcut Dimension 1 Code" := qry50030.Shortcut_Dimension_1_Code;
            l_rst50547."Shortcut Dimension 2 Code" := qry50030.Shortcut_Dimension_2_Code;
            l_rst50547."Shortcut Dimension 3 Code" := qry50030.Shortcut_Dimension_3_Code;
            l_rst50547."Shortcut Dimension 4 Code" := qry50030.Shortcut_Dimension_4_Code;
            l_rst50547."Shortcut Dimension 5 Code" := qry50030.Shortcut_Dimension_5_Code;
            l_rst50547."Shortcut Dimension 6 Code" := qry50030.Shortcut_Dimension_6_Code;
            l_rst50547."Shortcut Dimension 7 Code" := qry50030.Shortcut_Dimension_7_Code;
            if l_rstSS."Grupo contable Exportaciones" = l_rstCLE."Customer Posting Group" then begin
                Clear(l_rstExit);
                l_rstExit.SetRange(Code, l_rstCR."Loading port");
                l_rstExit.SetFilter("No. aduana", '<>%1', '');
                l_rstExit.FindFirst;
                //l_rst50547."Aduana de Registro" := '037';
                l_rst50547."Aduana de Registro" := l_rstExit."No. aduana";
                Clear(l_rstExit);
                l_rstExit.SetRange(Code, l_rstCR."Exit port");
                l_rstExit.SetFilter("No. aduana", '<>%1', '');
                l_rstExit.FindFirst;
                l_rst50547."Aduana de Salida" := l_rstExit."No. aduana";
                l_rst50547."Fecha Cumplido" := l_rstCR."Fecha cumplido";
                //Si es un recurso de ventas de Servicios, lo agrego a MI
                if l_rstSS."Gr. cont. IVA para flete y seg" = qry50030.VAT_Prod_Posting_Group then
                    l_rst50547."Expo o MI" := l_rst50547."Expo o MI"::MI
                else
                    l_rst50547."Expo o MI" := l_rst50547."Expo o MI"::Expo;
            end
            else begin
                l_rst50547."Fecha Cumplido" := l_rstCLE."Document Date";
                l_rst50547."Expo o MI" := l_rst50547."Expo o MI"::MI;
            end;
            if l_rst50547."Expo o MI" = l_rst50547."Expo o MI"::MI then begin
                if qry50030.Computable then
                    l_rst50547."MI gravadas" := l_rst50547."Monto FOB en $"
                else
                    l_rst50547."MI no gravadas&flet&segur" := l_rst50547."Monto FOB en $";
            end;
            //l_rst50547."No. registro recupero IVA" := g_intRegistro;
            l_rst50547."No. registro recupero IVA" := l_intRegistro;
            if ((l_rst50547."Expo o MI" = l_rst50547."Expo o MI"::Expo) and (l_rst50547.Cantidad <> 0) or (l_rst50547."Expo o MI" = l_rst50547."Expo o MI"::MI)) then
                l_rst50547.Insert
            else
                Clear(l_rst50547);
            //END;
        end;

        Clear(l_rst115);
        l_rst115.SetRange("Document No.", l_rstCLE."Document No.");
        if l_rst115.FindFirst then begin
            if l_rstSS."Grupo contable Exportaciones" = l_rstCLE."Customer Posting Group" then begin
                l_rstCR.TestField("Fecha cumplido");
                l_rstCR.TestField("Recovery Currency Factor");
                l_codTDoc := '21';
            end
            else
                l_codTDoc := '03';
        end;

        Clear(qry50037);
        qry50037.SetRange(qry50037.Gross_winnings_perception_code, '');
        qry50037.SetRange(Document_No, l_rstCLE."Document No.");
        qry50037.Open;
        while qry50037.Read do begin
            /*
            //Ya uso esto para filtrar los movimientos de una expo, porque necesito las ventas de servicios de flete y seguro
            //IF ((l_rstSS."Grupo contable Exportaciones" <> l_rstCLE."Customer Posting Group") AND (qry50037.Sum_Amount <> qry50037.Sum_Amount_Including_VAT))
            // OR (l_rstSS."Grupo contable Exportaciones" = l_rstCLE."Customer Posting Group") THEN
            //BEGIN
            */
            Clear(l_rst50547);
            if l_rst50547.FindLast then
                i := l_rst50547."No. mov." + 1
            else
                i := 1;
            Clear(l_rst251);
            l_rst251.Get(qry50037.Gen_Prod_Posting_Group);
            Clear(l_rst50547);
            l_rst50547."No. mov." += i;
            l_rst50547."Regimen informado" := 1; //Completar con "1"
            l_rst50547."Tipo de documento" := l_codTDoc;
            //l_rst50547."Numero de documento" := l_cduRegistroDiarios.fntNum(16,strNroComp);
            if qry50037.Permiso_de_embarque <> '' then
                l_rst50547."Numero de documento" := qry50037.Permiso_de_embarque
            else
                l_rst50547."Numero de documento" := strNroComp;
            l_rst50547."No. documento interno" := qry50037.Cod_Document_No;
            //l_rst50547.Item := l_rst251.Description;
            l_rst50547."Posicion Arancelaria" := l_cduRegistroDiarios.fntNum(12, DelChr(qry50037.Cód_arancelario, '=', DelChr(qry50037.Cód_arancelario, '=', 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789')));
            l_rst50547."Unidad de medida" := 'KN';
            l_rst50547.Cantidad := qry50037.Sum_Kilos_netos;
            //Traer tipo de cambio del Reparto
            Clear(l_rstGLS);
            l_rstGLS.Get();
            //l_rst50547."Tipo de cambio" := ROUND(1/l_rstCLE."Original Currency Factor",l_rstGLS."Unit-Amount Rounding Precision");
            if l_rstCR."Recovery Currency Factor" <> 0 then
                l_rst50547."Tipo de cambio" := Round(1 / l_rstCR."Recovery Currency Factor", l_rstGLS."Unit-Amount Rounding Precision")
            else
                l_rst50547."Tipo de cambio" := 1;
            if (l_rstSS."Grupo contable Exportaciones" <> l_rstCLE."Customer Posting Group") and (l_rstCLE."Currency Code" <> '') then begin
                l_rstCLE.CalcFields("Amount (LCY)", l_rstCLE.Amount);
                l_rst50547."Tipo de cambio" := Round(l_rstCLE."Amount (LCY)" / l_rstCLE.Amount, l_rstGLS."Unit-Amount Rounding Precision");
            end;
            l_rst50547."Monto FOB en divisa origen" := -qry50037.Sum_Amount;
            l_rst50547."Monto FOB en $" := Round(l_rst50547."Monto FOB en divisa origen" * l_rst50547."Tipo de cambio", 0.01);
            l_rst50547."Insumos importados" := Round(fntTraerMontoInsumos(l_rstCLE."Document No.", qry50037.Cód_arancelario, l_rst50547."Monto FOB en divisa origen") * l_rst50547."Tipo de cambio", 0.01);
            ;
            l_rst50547.Proyecto := qry50037.Job_No;
            Clear(l_rstJob);
            l_rstJob.Get(l_rst50547.Proyecto);
            l_rst50547."Shortcut Dimension 1 Code" := qry50037.Shortcut_Dimension_1_Code;
            l_rst50547."Shortcut Dimension 2 Code" := qry50037.Shortcut_Dimension_2_Code;
            l_rst50547."Shortcut Dimension 3 Code" := qry50037.Shortcut_Dimension_3_Code;
            l_rst50547."Shortcut Dimension 4 Code" := qry50037.Shortcut_Dimension_4_Code;
            l_rst50547."Shortcut Dimension 5 Code" := qry50037.Shortcut_Dimension_5_Code;
            l_rst50547."Shortcut Dimension 6 Code" := qry50037.Shortcut_Dimension_6_Code;
            l_rst50547."Shortcut Dimension 7 Code" := qry50037.Shortcut_Dimension_7_Code;
            if (l_rstSS."Grupo contable Exportaciones" = l_rstCLE."Customer Posting Group") then begin
                Clear(l_rstExit);
                l_rstExit.SetRange(Code, l_rstCR."Loading port");
                l_rstExit.SetFilter("No. aduana", '<>%1', '');
                l_rstExit.FindFirst;
                //l_rst50547."Aduana de Registro" := '037';
                l_rst50547."Aduana de Registro" := l_rstExit."No. aduana";
                Clear(l_rstExit);
                l_rstExit.SetRange(Code, l_rstCR."Exit port");
                l_rstExit.SetFilter("No. aduana", '<>%1', '');
                l_rstExit.FindFirst;
                //l_rst50547."Aduana de Salida" := '037';
                l_rst50547."Aduana de Salida" := l_rstExit."No. aduana";
                l_rst50547."Fecha Cumplido" := l_rstCR."Fecha cumplido";
                //Si es un recurso de ventas de Servicios, lo agrego a MI
                if l_rstSS."Gr. cont. IVA para flete y seg" = qry50037.VAT_Prod_Posting_Group then
                    l_rst50547."Expo o MI" := l_rst50547."Expo o MI"::MI
                else
                    l_rst50547."Expo o MI" := l_rst50547."Expo o MI"::Expo;
            end
            else begin
                l_rst50547."Fecha Cumplido" := l_rstCLE."Document Date";
                l_rst50547."Expo o MI" := l_rst50547."Expo o MI"::MI;
            end;
            if l_rst50547."Expo o MI" = l_rst50547."Expo o MI"::MI then begin
                if qry50037.Computable then
                    l_rst50547."MI gravadas" := l_rst50547."Monto FOB en $"
                else
                    l_rst50547."MI no gravadas&flet&segur" := l_rst50547."Monto FOB en $";
            end;
            //l_rst50547."No. registro recupero IVA" := g_intRegistro;
            l_rst50547."No. registro recupero IVA" := l_intRegistro;
            if ((l_rst50547."Expo o MI" = l_rst50547."Expo o MI"::Expo) and (l_rst50547.Cantidad <> 0) or (l_rst50547."Expo o MI" = l_rst50547."Expo o MI"::MI)) then
                l_rst50547.Insert
            else
                Clear(l_rst50547);
            //END;
        end;

    end;

    [Scope('OnPrem')]
    procedure fntGenerarRecuperoIVACompras(l_datFI: Date; l_datFF: Date; l_intRegistro: Integer): Integer
    var
        rstMens: Record Mensajeria;
        rstNC: Record "Purch. Cr. Memo Hdr.";
        l_rstVLE: Record "Vendor Ledger Entry";
        l_rst50519: Record "Tipos documento";
        rstND: Record "Purch. Inv. Header";
        rstCC: Record "Vendor Ledger Entry";
        rstCCL: Record "Vendor Ledger Entry";
        rstCI: Record "Company Information";
        rstLFC: Record "Purch. Inv. Line";
        rstLNC: Record "Purch. Cr. Memo Line";
        rstVE2: Record "VAT Entry";
        rstFC: Record "Purch. Inv. Header";
        l_rstSS: Record "Sales & Receivables Setup";
        l_rstCR: Record "Cab. Reparto";
        l_rstGLS: Record "General Ledger Setup";
        l_blnInterno: Boolean;
        l_dlg: Dialog;
        l_rst50545: Record "Detalle Recupero IVA";
        l_rst380: Record "Detailed Vendor Ledg. Entry";
        qry50032: Query "Detalle proveedores";
    begin
        //Crear registros de facturas de compra
        //Tengo que filtrarlo según la fecha de presentación
        //No tendremos en cuenta documentos que no estén relacionados a facturas
        g_intRegistro := l_intRegistro;
        Clear(l_dlg);
        l_dlg.Open('Compras entre #1## y #2##\' +
                   'Procesando doc:    #3###');
        l_dlg.Update(1, l_datFI);
        l_dlg.Update(2, l_datFF);

        Clear(l_rstGLS);
        l_rstGLS.Get();
        Clear(l_rstSS);
        l_rstSS.Get();
        l_blnInterno := false;
        /*
        CLEAR(l_rstVLE);
        l_rstVLE.SETRANGE("Document Date",l_datFI,l_datFF);
        l_rstVLE.SETFILTER("Document Type",'%1|%2',l_rstVLE."Document Type"::Invoice,l_rstVLE."Document Type"::"Credit Memo");
        IF l_rstVLE.FINDSET THEN
        REPEAT
        
        UNTIL l_rstVLE.NEXT = 0;
        */
        Clear(l_rstVLE);
        //Las facturas, con el rango de acuerdo a la antigüedad especificada en parametrización.
        l_rstVLE.SetRange("Estado recupero", l_rstVLE."Estado recupero"::" ");
        //El filtro de fecha para las facturas debe incluir todos los documentos hasta la última fecha del mes de la presentación, y todos los documentos de fechas anteriores
        //Esto permitirá que, facturas que se no se hayan presentado en períodos anteriores por no haber estado pagadas, aparezcan en esta nueva presentación.
        //l_rstVLE.SETRANGE("Document Date",l_datFI,l_datFF);
        //l_rstVLE.SETRANGE("Document Date",CALCDATE(l_rstGLS."Age recovery VAT formula",l_datFI),l_datFF);
        l_rstVLE.SetRange("Document Date", CalcDate(l_rstGLS."Age recovery VAT formula", l_datFI), l_datFF);
        l_rstVLE.SetFilter("Date Filter", '..%1', l_datFF);
        l_rstVLE.SetFilter("Document Type", '%1', l_rstVLE."Document Type"::Invoice);
        if l_rstVLE.FindSet then
            repeat
                l_blnInterno := false;
                with l_rstVLE do begin
                    l_dlg.Update(3, l_rstVLE."Document No.");
                    Clear(rstNC);
                    rstNC.SetRange("Applies-to Doc. No.", "Document No.");
                    if rstNC.FindFirst then begin
                        Clear(rstMens);
                        rstMens.SetRange("No. documento", rstNC."No.");
                        if rstMens.FindFirst then begin
                            Clear(l_rst50519);
                            l_rst50519.SetRange("Tipos documento", rstMens."Tipo Documento");
                            l_rst50519.FindFirst;
                            l_blnInterno := l_rst50519."Documento interno";
                        end;
                    end;
                    Clear(rstNC);
                    rstNC.SetRange("No.", "Document No.");
                    if rstNC.FindFirst then begin
                        Clear(rstMens);
                        rstMens.SetRange("No. documento", rstNC."No.");
                        if rstMens.FindFirst then begin
                            Clear(l_rst50519);
                            l_rst50519.SetRange("Tipos documento", rstMens."Tipo Documento");
                            l_rst50519.FindFirst;
                            l_blnInterno := l_rst50519."Documento interno";
                        end;
                    end;
                    l_dlg.Update(3, l_rstVLE."Document No.");
                    Clear(rstNC);
                    rstNC.SetRange("Corrected Invoice No.", "Document No.");
                    if rstNC.FindFirst then begin
                        Clear(rstMens);
                        rstMens.SetRange("No. documento", rstNC."No.");
                        if rstMens.FindFirst then begin
                            Clear(l_rst50519);
                            l_rst50519.SetRange("Tipos documento", rstMens."Tipo Documento");
                            l_rst50519.FindFirst;
                            l_blnInterno := l_rst50519."Documento interno";
                        end;
                    end;
                    Clear(rstCCL);
                    rstCCL.SetRange("Entry No.", "Closed by Entry No.");
                    if rstCCL.FindFirst then begin
                        Clear(rstMens);
                        rstMens.SetRange("No. documento", rstCCL."Document No.");
                        if rstMens.FindFirst then begin
                            Clear(l_rst50519);
                            l_rst50519.SetRange("Tipos documento", rstMens."Tipo Documento");
                            l_rst50519.FindFirst;
                            l_blnInterno := l_rst50519."Documento interno";
                        end;
                    end;
                    Clear(rstCCL);
                    rstCCL.SetRange("Closed by Entry No.", "Entry No.");
                    if rstCCL.FindFirst then begin
                        Clear(rstMens);
                        rstMens.SetRange("No. documento", rstCCL."Document No.");
                        if rstMens.FindFirst then begin
                            Clear(l_rst50519);
                            l_rst50519.SetRange("Tipos documento", rstMens."Tipo Documento");
                            l_rst50519.FindFirst;
                            l_blnInterno := l_rst50519."Documento interno";
                        end;
                    end;
                    /*
                    CLEAR(rstMens);
                    rstMens.SETRANGE("No. documento","Document No.");
                    IF rstMens.FINDFIRST THEN
                    BEGIN
                      CLEAR(l_rst50519);
                      l_rst50519.SETRANGE("Tipos documento",rstMens."Tipo Documento");
                      l_rst50519.FINDFIRST;
                      l_blnInterno := l_rst50519."Documento interno";
                    END;
                    */
                end;
                //Si a la fecha del recupero no está pendiente de pago
                l_rstVLE.CalcFields("Remaining Amount");
                if not l_blnInterno and (l_rstVLE."Remaining Amount" = 0) then begin
                    with l_rstVLE do begin
                        l_dlg.Update(3, l_rstVLE."Document No.");
                        Clear(qry50032);
                        qry50032.SetRange(qry50032.Filtro_Document_No, l_rstVLE."Document No.");
                        qry50032.SetRange(qry50032.Filtro_Posting_Date, l_datFI, l_datFF);
                        qry50032.Open;
                        while qry50032.Read do begin
                            if l_rstVLE."Estado recupero" = l_rstVLE."Estado recupero"::" " then begin
                                l_rstVLE."Estado recupero" := l_rstVLE."Estado recupero"::"Listo para solicitar";
                                l_rstVLE.Modify;
                                fntInsertarLineaRecuperoCompras(l_rstVLE, l_intRegistro, qry50032.Posting_Date, qry50032);
                            end;
                        end;
                    end;
                end;
            until l_rstVLE.Next = 0;

        Clear(l_rst50545);
        if l_rst50545.FindLast then
            exit(l_rst50545."No. mov.");

        l_dlg.Close;

    end;

    local procedure fntInsertarLineaRecuperoCompras(l_rstVLE: Record "Vendor Ledger Entry"; l_intRegistro: Integer; l_datPago: Date; qry50032: Query "Detalle proveedores"): Integer
    var
        l_rst50545: Record "Detalle Recupero IVA";
        l_rst50545b: Record "Detalle Recupero IVA";
        i: Integer;
        l_codTDoc: Code[3];
        strNroComp: Code[16];
        l_rst251: Record "Gen. Product Posting Group";
        l_rst123: Record "Purch. Inv. Line";
        l_rstReparto: Record "Cab. Reparto";
        l_rst120: Record "Purch. Rcpt. Header";
        l_rstSS: Record "Purchases & Payables Setup";
        l_rst122: Record "Purch. Inv. Header";
        l_strPtoVta: Code[20];
        l_rst23Fac: Record Vendor;
        l_rst23Ven: Record Vendor;
        l_rstJob: Record Job;
        l_rstTGC: Record "Tax Group";
        l_rstWIB: Record "Invoice Withholding Buffer";
        l_rstWD: Record "Withholding details";
        l_rstPay: Record "Bank Account Ledger Entry";
        l_rstGLS: Record "General Ledger Setup";
        l_rstIVLE: Record "Value Entry";
        l_rstILE: Record "Item Ledger Entry";
        l_rstIAE: Record "Item Application Entry";
        l_rstIAE2: Record "Item Application Entry";
        l_rst50020: Record "Withholding codes";
        l_rst32EntradaalStock: Record "Item Ledger Entry";
        l_rstRLE: Record "Res. Ledger Entry";
        l_rstCI: Record "Company Information";
        qry50031: Query "Detalle compras Recursos";
        qry50033: Query "Detalle compras Productos";
        qry50034: Query "Detalle compras AF";
        l_intMotivoNoRetencion: Integer;
        l_rst156: Record Resource;
        l_cduRegistroDiarios: Codeunit "Registro diarios";
        l_cduRetenciones: Codeunit Retenciones;
    begin
        case l_rstVLE."Document Type" of
            l_rstVLE."Document Type"::Invoice:
                l_codTDoc := '19';
        end;

        strNroComp := l_cduRegistroDiarios.fntNum(16, DelChr(l_rstVLE."Document No.", '=', DelChr(l_rstVLE."Document No.", '=', '0123456789')));
        Clear(l_rstSS);
        l_rstSS.Get();

        Clear(qry50031);
        qry50031.SetRange(Filt_Document_No, l_rstVLE."Document No.");
        qry50031.SetFilter(qry50031.Gen_Bus_Posting_Group, '<>%1', l_rstSS."Grupo Contable Importaciones");
        // Filtrar el número de orden de pago, sólo si es agente de retención de IVA
        if fntAgenteRetencionIVA then
            qry50031.SetFilter(qry50031.Filtro_Orden_Pago, qry50032.Document_No);
        qry50031.Open;
        while qry50031.Read do begin
            Clear(l_rst50545);
            if l_rst50545.FindLast then
                i := l_rst50545."No. mov." + 1
            else
                i := 1;
            Clear(l_rst122);
            l_rst122.Get(l_rstVLE."Document No.");
            Clear(l_rst251);
            l_rst251.Get(qry50031.Gen_Prod_Posting_Group);
            Clear(l_rst23Fac);
            l_rst23Fac.Get(l_rst122."Pay-to Vendor No.");
            Clear(l_rst23Ven);
            l_rst23Ven.Get(l_rst122."Buy-from Vendor No.");
            if not ((l_rst23Fac."No." = l_rstSS."Proveedor Aduana Local") or (l_rst23Fac."No." = l_rstSS."Proveedor Aduana Exterior")) then begin
                Clear(l_rst50545);
                l_rst50545."No. mov." += i;
                l_rst50545."Tipo de comprobante" := l_rst122."Tipo documento AFIP";
                l_rst50545."Fecha de comprobante" := l_rst122."Document Date";
                l_strPtoVta := DelChr(l_rst122."Vendor Invoice No.", '=', DelChr(l_rst122."Vendor Invoice No.", '=', '-0123456789'));
                l_rst50545."No. documento interno" := l_rst122."No.";
                if StrPos(l_strPtoVta, '-') <> 0 then begin
                    l_rst50545."Punto de venta" := l_cduRegistroDiarios.fntNum(5, CopyStr(l_strPtoVta, 1, StrPos(l_strPtoVta, '-') - 1));
                    l_rst50545."Número de comprobante" := l_rst122."Vendor Invoice No.";
                end
                else
                    l_rst50545."Número de comprobante" := l_rst122."Vendor Invoice No.";
                l_rst50545."CUIT Emisor" := DelChr(l_rst23Fac."VAT Registration No.", '=', '-');
                l_rst50545."Denominación emisor" := CopyStr(l_rst23Fac.Name, 1, 40);
                l_rst50545."CUIT Vendedor" := DelChr(l_rst23Ven."VAT Registration No.", '=', '-');
                l_rst50545."Denominación vendedor" := CopyStr(l_rst23Ven.Name, 1, 40);
                l_rst50545."No. linea" := qry50031.Line_No;
                l_rst50545.Tipo := l_rst50545.Tipo::Resource;
                l_rst50545."Posicion Arancelaria" := DelChr(qry50031.Cód_arancelario, '=', '.');
                l_rst50545."No." := qry50031.No;
                l_rst50545.Descripcion := CopyStr(qry50031.Name, 1, 50);
                l_rst50545.Cantidad := qry50031.Sum_Quantity;
                Clear(l_rstJob);
                l_rstJob.Get(qry50031.Job_No);
                case l_rstJob.Tipo of
                    l_rstJob.Tipo::Improductivo:
                        l_rst50545."Tipo afectación" := l_rst50545."Tipo afectación"::Indirecta;
                    l_rstJob.Tipo::Productivo:
                        l_rst50545."Tipo afectación" := l_rst50545."Tipo afectación"::Directa;
                end;
                l_rst50545."No. proyecto" := l_rstJob."No.";
                l_rst50545."Shortcut Dimension 1 Code" := qry50031.Shortcut_Dimension_1_Code;
                l_rst50545."Shortcut Dimension 2 Code" := qry50031.Shortcut_Dimension_2_Code;
                l_rst50545."Shortcut Dimension 3 Code" := qry50031.Shortcut_Dimension_3_Code;
                l_rst50545."Shortcut Dimension 4 Code" := qry50031.Shortcut_Dimension_4_Code;
                l_rst50545."Shortcut Dimension 5 Code" := qry50031.Shortcut_Dimension_5_Code;
                l_rst50545."Shortcut Dimension 6 Code" := qry50031.Shortcut_Dimension_6_Code;
                l_rst50545."Shortcut Dimension 7 Code" := qry50031.Shortcut_Dimension_7_Code;
                l_rst50545."Forma de reparto" := l_rstJob."Forma de reparto";
                l_rst50545."Criterio de reparto" := l_rstJob."Criterio de reparto";

                Clear(l_rstRLE);
                l_rstRLE.SetRange("Document No.", qry50031.Document_No);
                l_rstRLE.SetRange("Document line no.", qry50031.Line_No);
                l_rstRLE.SetRange("Resource No.", qry50031.No);
                l_rstRLE.SetRange("Posting Date", qry50031.Posting_Date);
                if l_rstRLE.FindFirst then
                    l_rst50545."No. mov. relacionado" := l_rstRLE."Entry No.";
                if l_rst122."Currency Factor" <> 0 then begin
                    l_rst50545."Importe Neto en $" := Round(qry50031.Sum_Amount / l_rst122."Currency Factor", 0.01);
                    l_rst50545."Importe IVA Facturado en $" := Round((qry50031.Sum_Amount_Including_VAT - qry50031.Sum_Amount) / l_rst122."Currency Factor", 0.01);
                end
                else begin
                    l_rst50545."Importe Neto en $" := Round(qry50031.Sum_Amount, 0.01);
                    l_rst50545."Importe IVA Facturado en $" := Round(qry50031.Sum_Amount_Including_VAT - qry50031.Sum_Amount, 0.01);
                end;

                Clear(l_rstTGC);
                l_rstTGC.Get(qry50031.Tax_Group_Code);
                if l_rstTGC.Computable then
                    l_rst50545."Importe IVA Computable" := l_rst50545."Importe IVA Facturado en $";
                l_rst50545."Monto IVA Retenido" := qry50031.Sum_Importe_retencion;
                l_rst50545."IVA para recupero" := l_rst50545."Importe IVA Computable";
                l_rst50545."Período DDJJ" := qry50031.Posting_Date;
                Clear(l_rst50020);
                l_rst50020.Get(l_rst50020."Tipo impuesto retencion"::IVA, qry50031.Cód_retención_IVA);
                l_rst50545."Cod. ret. IVA" := qry50031.Cód_retención_IVA;
                l_rst50545."Número de Certificado" := qry50031.Serie_retención;
                l_rst50545."Motivo de no retención" := Format(qry50031.Excluido);
                l_rst50545."R.G. Certificado de exclusión" := '';
                l_rst50545."Período de Pago" := qry50032.Posting_Date;
                l_rst50545."Orden pago" := qry50032.Document_No;
                Clear(l_rstPay);
                l_rstPay.SetRange(l_rstPay."Document Type", l_rstPay."Document Type"::Payment);
                l_rstPay.SetRange("Document No.", qry50032.Document_No);
                l_rstPay.SetRange("Source Code", l_rst122."Pay-to Vendor No.");
                if l_rstPay.FindFirst then
                    case l_rstPay."Bank Payment Type" of
                        l_rstPay."Bank Payment Type"::"Manual Check",
                      l_rstPay."Bank Payment Type"::"Computer Check":
                            l_rst50545."Medios de Pago" := '01';//Cheque nominativo a nombre del vendedor.
                        l_rstPay."Bank Payment Type"::"Electronic Payment":
                            l_rst50545."Medios de Pago" := '02';//Transferencia interbancaria
                    end;
                Clear(l_rstCI);
                l_rstCI.Get();
                if qry50031.Sum_Importe_retencion = 0 then begin
                    l_rst50545."Tipo de Rubro 7" := '000';//Si tiene retención, es por la 18. Si no tuvo retención, es 00.
                    l_rst50545."Código de Régimen" := '000';
                end
                else begin
                    l_rst50545."Código de Régimen" := l_cduRegistroDiarios.fntNum(3, Format(qry50031.Cod_sicore));
                    Clear(l_rst50020);
                    l_rst50020.SetRange("Tipo impuesto retencion", l_rst50020."Tipo impuesto retencion"::IVA);
                    l_rst50020.SetRange("Codigo SICORE", Format(qry50031.Cod_sicore));
                    l_rst50020.FindFirst;
                    l_rst50020.TestField("Tipo de regimen 7");
                    l_rst50545."Tipo de Rubro 7" := l_cduRegistroDiarios.fntNum(3, Format(l_rst50020."Tipo de regimen 7"));
                end;
                case l_rstJob.Tipo of
                    l_rstJob.Tipo::Improductivo: //D:directo, I:indirecto
                        l_rst50545."Ident. tipo de CF" := 'I';
                    l_rstJob.Tipo::Productivo:
                        l_rst50545."Ident. tipo de CF" := 'D';
                end;
                l_rst50545."Descripción contable" := qry50031.Gen_Prod_Posting_Group;
                l_rst50545."No. registro recupero IVA" := l_intRegistro;
                l_rst50545."Fecha pago IVA" := l_datPago;
                //Si está marcado "Exento retención en IVA" en el proveedor, tipo de exclusión 3
                Evaluate(l_intMotivoNoRetencion, l_rst50545."Motivo de no retención");
                if l_intMotivoNoRetencion = 0 then
                    l_cduRetenciones.fntTestExentoRetencionIVA(l_rst23Fac."No.", l_rst50545."Monto IVA Retenido", l_intMotivoNoRetencion);
                l_rst50545."Motivo de no retención" := Format(l_intMotivoNoRetencion);
                if l_rst50545."Motivo de no retención" = '2' then
                    l_rst50545."R.G. Certificado de exclusión" := '01';
                l_rst50545.Insert;
            end;
        end;

        Clear(qry50033);
        qry50033.SetRange(Filt_Document_No, l_rstVLE."Document No.");
        qry50033.SetFilter(qry50033.Gen_Bus_Posting_Group, '<>%1', l_rstSS."Grupo Contable Importaciones");
        // Filtrar el número de orden de pago, sólo si es agente de retención de IVA
        if fntAgenteRetencionIVA then
            qry50033.SetFilter(qry50033.Filtro_Orden_Pago, qry50032.Document_No);
        qry50033.Open;
        while qry50033.Read do begin
            Clear(l_rst50545);
            if l_rst50545.FindLast then
                i := l_rst50545."No. mov." + 1
            else
                i := 1;
            Clear(l_rst122);
            l_rst122.Get(l_rstVLE."Document No.");
            Clear(l_rst251);
            l_rst251.Get(qry50033.Gen_Prod_Posting_Group);
            Clear(l_rst23Fac);
            l_rst23Fac.Get(l_rst122."Pay-to Vendor No.");
            Clear(l_rst23Ven);
            l_rst23Ven.Get(l_rst122."Buy-from Vendor No.");
            Clear(l_rst50545);
            l_rst50545."No. mov." += i;
            l_rst50545."Tipo de comprobante" := l_rst122."Tipo documento AFIP";
            l_rst50545."Fecha de comprobante" := l_rst122."Document Date";
            l_strPtoVta := DelChr(l_rst122."Vendor Invoice No.", '=', DelChr(l_rst122."Vendor Invoice No.", '=', '-0123456789'));
            l_rst50545."No. documento interno" := l_rst122."No.";
            if StrPos(l_strPtoVta, '-') <> 0 then begin
                l_rst50545."Punto de venta" := l_cduRegistroDiarios.fntNum(5, CopyStr(l_strPtoVta, 1, StrPos(l_strPtoVta, '-') - 1));
                l_rst50545."Número de comprobante" := l_rst122."Vendor Invoice No.";
            end
            else
                l_rst50545."Número de comprobante" := l_rst122."Vendor Invoice No.";
            l_rst50545."CUIT Emisor" := DelChr(l_rst23Fac."VAT Registration No.", '=', '-');
            l_rst50545."Denominación emisor" := CopyStr(l_rst23Fac.Name, 1, 40);
            l_rst50545."CUIT Vendedor" := DelChr(l_rst23Ven."VAT Registration No.", '=', '-');
            l_rst50545."Denominación vendedor" := CopyStr(l_rst23Ven.Name, 1, 40);
            l_rst50545."No. linea" := qry50033.Line_No;
            l_rst50545.Tipo := l_rst50545.Tipo::Item;
            l_rst50545."No." := qry50033.No;
            l_rst50545."Posicion Arancelaria" := DelChr(qry50033.Cód_arancelario, '=', '.');
            l_rst50545.Descripcion := CopyStr(qry50033.Description, 1, 50);
            l_rst50545.Cantidad := qry50033.Sum_Quantity * qry50033.Qty_per_Unit_of_Measure;
            Clear(l_rstJob);
            if qry50033.Job_No <> '' then begin
                l_rstJob.Get(qry50033.Job_No);
                case l_rstJob.Tipo of
                    l_rstJob.Tipo::Improductivo:
                        l_rst50545."Tipo afectación" := l_rst50545."Tipo afectación"::Indirecta;
                    l_rstJob.Tipo::Productivo:
                        l_rst50545."Tipo afectación" := l_rst50545."Tipo afectación"::Directa;
                end;
                l_rst50545."No. proyecto" := l_rstJob."No.";
            end;
            l_rst50545."Shortcut Dimension 1 Code" := qry50033.Shortcut_Dimension_1_Code;
            l_rst50545."Shortcut Dimension 2 Code" := qry50033.Shortcut_Dimension_2_Code;
            l_rst50545."Shortcut Dimension 3 Code" := qry50033.Shortcut_Dimension_3_Code;
            l_rst50545."Shortcut Dimension 4 Code" := qry50033.Shortcut_Dimension_4_Code;
            l_rst50545."Shortcut Dimension 5 Code" := qry50033.Shortcut_Dimension_5_Code;
            l_rst50545."Shortcut Dimension 6 Code" := qry50033.Shortcut_Dimension_6_Code;
            l_rst50545."Shortcut Dimension 7 Code" := qry50033.Shortcut_Dimension_7_Code;
            l_rst50545."Lote origen" := qry50033.Lote_origen;
            l_rst50545."Forma de reparto" := l_rstJob."Forma de reparto";
            l_rst50545."Criterio de reparto" := l_rstJob."Criterio de reparto";
            //Busco el movimiento de valor de cada línea de factura
            Clear(l_rst32EntradaalStock);
            Clear(l_rstIVLE);
            l_rstIVLE.SetRange("Document No.", l_rst50545."No. documento interno");
            l_rstIVLE.SetRange("Document Line No.", l_rst50545."No. linea");
            l_rstIVLE.SetRange("Document Type", l_rstIVLE."Document Type"::"Purchase Invoice");
            l_rstIVLE.SetRange(l_rstIVLE."Item Ledger Entry Type", l_rstIVLE."Item Ledger Entry Type"::Purchase);
            l_rstIVLE.SetRange("Entry Type", l_rstIVLE."Entry Type"::"Direct Cost");
            if l_rstIVLE.FindSet then begin
                if l_rstIVLE.Count > 1 then
                    Error('Hay más de un registro para el documento %1 línea %2', l_rst50545."No. documento interno", l_rst50545."No. linea");
                //Busco el movimiento de producto relacionado
                Clear(l_rstILE);
                l_rstILE.Get(l_rstIVLE."Item Ledger Entry No.");
                if l_rstILE."Remaining Quantity" <> l_rstILE.Quantity then begin
                    //Encuentro los movimientos con origen en el movimiento de producto relacionado (salidas, transferencias, ventas) que tengan un movimiento de salida relacionado
                    Clear(l_rstIAE);
                    l_rstIAE.SetRange("Inbound Item Entry No.", l_rstILE."Entry No.");
                    l_rstIAE.SetFilter("Outbound Item Entry No.", '<>%1', 0);
                    if l_rstIAE.FindSet then
                        repeat
                            //¿Es una transferencia?
                            Clear(l_rstIAE2);
                            l_rstIAE2.SetRange("Transferred-from Entry No.", l_rstIAE."Item Ledger Entry No.");
                            if l_rstIAE."Transferred-from Entry No." <> 0 then begin
                                Error('Transfer1');
                            end
                            else begin
                                //ERROR('Transfer2');
                            end;
                        until l_rstIAE.Next = 0;
                end;
            end;

            l_rst50545."No. mov. relacionado" := l_rstILE."Entry No.";
            l_rst50545."Fecha ingreso stock" := l_rstILE."Posting Date";

            if l_rst122."Currency Factor" <> 0 then begin
                l_rst50545."Importe Neto en $" := Round(qry50033.Sum_Amount / l_rst122."Currency Factor", 0.01);
                l_rst50545."Importe IVA Facturado en $" := Round((qry50033.Sum_Amount_Including_VAT - qry50033.Sum_Amount) / l_rst122."Currency Factor", 0.01);
            end
            else begin
                l_rst50545."Importe Neto en $" := Round(qry50033.Sum_Amount, 0.01);
                l_rst50545."Importe IVA Facturado en $" := Round(qry50033.Sum_Amount_Including_VAT - qry50033.Sum_Amount, 0.01);
            end;
            Clear(l_rstTGC);
            l_rstTGC.Get(qry50033.Tax_Group_Code);
            if l_rstTGC.Computable then
                l_rst50545."Importe IVA Computable" := l_rst50545."Importe IVA Facturado en $";
            l_rst50545."Monto IVA Retenido" := qry50033.Sum_Importe_retencion;
            l_rst50545."IVA para recupero" := l_rst50545."Importe IVA Computable";
            l_rst50545."Período DDJJ" := qry50033.Posting_Date;
            Clear(l_rst50020);
            l_rst50020.Get(l_rst50020."Tipo impuesto retencion"::IVA, qry50033.Cód_retención_IVA);
            l_rst50545."Cod. ret. IVA" := qry50033.Cód_retención_IVA;
            //l_rst50545."Código de Régimen" := FORMAT(qry50031.Cod_sicore);
            l_rst50545."Número de Certificado" := qry50033.Serie_retención;
            l_rst50545."Motivo de no retención" := Format(qry50033.Excluido);
            l_rst50545."R.G. Certificado de exclusión" := '';
            l_rst50545."Período de Pago" := qry50032.Posting_Date;
            l_rst50545."Orden pago" := qry50032.Document_No;
            Clear(l_rstPay);
            l_rstPay.SetRange(l_rstPay."Document Type", l_rstPay."Document Type"::Payment);
            l_rstPay.SetRange("Document No.", qry50032.Document_No);
            l_rstPay.SetRange("Source Code", l_rst122."Pay-to Vendor No.");
            if l_rstPay.FindFirst then
                case l_rstPay."Bank Payment Type" of
                    l_rstPay."Bank Payment Type"::"Manual Check",
                  l_rstPay."Bank Payment Type"::"Computer Check":
                        l_rst50545."Medios de Pago" := '01';//Cheque nominativo a nombre del vendedor.
                    l_rstPay."Bank Payment Type"::"Electronic Payment":
                        l_rst50545."Medios de Pago" := '02';//Transferencia interbancaria
                end;
            if l_rst50545."Orden pago" = '' then
                l_rst50545."Orden pago" := l_rstPay."Document No.";
            if qry50033.Sum_Importe_retencion = 0 then begin
                l_rst50545."Tipo de Rubro 7" := '000';//Si tiene retención, es por la 18. Si no tuvo retención, es 00.
                l_rst50545."Código de Régimen" := '000';
            end
            else begin
                l_rst50545."Código de Régimen" := l_cduRegistroDiarios.fntNum(3, Format(qry50033.Cod_sicore));
                Clear(l_rst50020);
                l_rst50020.SetRange("Tipo impuesto retencion", l_rst50020."Tipo impuesto retencion"::IVA);
                l_rst50020.SetRange("Codigo SICORE", Format(qry50033.Cod_sicore));
                l_rst50020.FindFirst;
                l_rst50020.TestField("Tipo de regimen 7");
                l_rst50545."Tipo de Rubro 7" := l_cduRegistroDiarios.fntNum(3, Format(l_rst50020."Tipo de regimen 7"));
            end;
            case l_rstJob.Tipo of
                l_rstJob.Tipo::Improductivo: //D:directo, I:indirecto
                    l_rst50545."Ident. tipo de CF" := 'I';
                l_rstJob.Tipo::Productivo:
                    l_rst50545."Ident. tipo de CF" := 'D';
            end;
            l_rst50545."No. registro recupero IVA" := l_intRegistro;
            l_rst50545."Fecha pago IVA" := l_datPago;
            //Si está marcado "Exento retención en IVA" en el proveedor, tipo de exclusión 3
            Evaluate(l_intMotivoNoRetencion, l_rst50545."Motivo de no retención");
            if l_intMotivoNoRetencion = 0 then
                l_cduRetenciones.fntTestExentoRetencionIVA(l_rst23Fac."No.", l_rst50545."Monto IVA Retenido", l_intMotivoNoRetencion);
            l_rst50545."Motivo de no retención" := Format(l_intMotivoNoRetencion);
            l_rst50545."Descripción contable" := qry50033.Gen_Prod_Posting_Group;
            if l_rst50545."Motivo de no retención" = '2' then
                l_rst50545."R.G. Certificado de exclusión" := '01';
            l_rst50545.Insert;
        end;

        Clear(qry50034);
        qry50034.SetRange(Filt_Document_No, l_rstVLE."Document No.");
        qry50034.SetFilter(qry50034.Gen_Bus_Posting_Group, '<>%1', l_rstSS."Grupo Contable Importaciones");
        // Filtrar el número de orden de pago, sólo si es agente de retención de IVA
        if fntAgenteRetencionIVA then
            qry50034.SetFilter(qry50034.Filtro_Orden_Pago, qry50032.Document_No);
        qry50034.Open;
        while qry50034.Read do begin
            Clear(l_rst50545);
            if l_rst50545.FindLast then
                i := l_rst50545."No. mov." + 1
            else
                i := 1;
            Clear(l_rst122);
            l_rst122.Get(l_rstVLE."Document No.");
            Clear(l_rst251);
            l_rst251.Get(qry50034.Gen_Prod_Posting_Group);
            Clear(l_rst23Fac);
            l_rst23Fac.Get(l_rst122."Pay-to Vendor No.");
            Clear(l_rst23Ven);
            l_rst23Ven.Get(l_rst122."Buy-from Vendor No.");
            Clear(l_rst50545);
            l_rst50545."No. mov." += i;
            l_rst50545."Tipo de comprobante" := l_rst122."Tipo documento AFIP";
            l_rst50545."Fecha de comprobante" := l_rst122."Document Date";
            l_strPtoVta := DelChr(l_rst122."Vendor Invoice No.", '=', DelChr(l_rst122."Vendor Invoice No.", '=', '-0123456789'));
            l_rst50545."No. documento interno" := l_rst122."No.";
            if StrPos(l_strPtoVta, '-') <> 0 then begin
                l_rst50545."Punto de venta" := l_cduRegistroDiarios.fntNum(5, CopyStr(l_strPtoVta, 1, StrPos(l_strPtoVta, '-') - 1));
                l_rst50545."Número de comprobante" := l_rst122."Vendor Invoice No.";
            end
            else
                l_rst50545."Número de comprobante" := l_rst122."Vendor Invoice No.";
            l_rst50545."CUIT Emisor" := DelChr(l_rst23Fac."VAT Registration No.", '=', '-');
            l_rst50545."Denominación emisor" := CopyStr(l_rst23Fac.Name, 1, 40);
            l_rst50545."CUIT Vendedor" := DelChr(l_rst23Ven."VAT Registration No.", '=', '-');
            l_rst50545."Denominación vendedor" := CopyStr(l_rst23Ven.Name, 1, 40);
            l_rst50545."No. linea" := qry50034.Line_No;
            l_rst50545.Tipo := l_rst50545.Tipo::"Fixed Asset";
            l_rst50545."No." := qry50034.No;
            l_rst50545.Descripcion := CopyStr(qry50034.Description, 1, 50);
            l_rst50545."Posicion Arancelaria" := DelChr(qry50034.Cód_arancelario, '=', '.');
            l_rst50545.Cantidad := qry50034.Sum_Quantity;
            Clear(l_rstJob);
            if qry50034.Job_No <> '' then begin
                l_rstJob.Get(qry50034.Job_No);
                case l_rstJob.Tipo of
                    l_rstJob.Tipo::Improductivo:
                        l_rst50545."Tipo afectación" := l_rst50545."Tipo afectación"::Indirecta;
                    l_rstJob.Tipo::Productivo:
                        l_rst50545."Tipo afectación" := l_rst50545."Tipo afectación"::Directa;
                end;
                l_rst50545."No. proyecto" := l_rstJob."No.";
            end;
            l_rst50545."No. proyecto" := l_rstJob."No.";
            l_rst50545."Shortcut Dimension 1 Code" := qry50034.Shortcut_Dimension_1_Code;
            l_rst50545."Shortcut Dimension 2 Code" := qry50034.Shortcut_Dimension_2_Code;
            l_rst50545."Shortcut Dimension 3 Code" := qry50034.Shortcut_Dimension_3_Code;
            l_rst50545."Shortcut Dimension 4 Code" := qry50034.Shortcut_Dimension_4_Code;
            l_rst50545."Shortcut Dimension 5 Code" := qry50034.Shortcut_Dimension_5_Code;
            l_rst50545."Shortcut Dimension 6 Code" := qry50034.Shortcut_Dimension_6_Code;
            l_rst50545."Shortcut Dimension 7 Code" := qry50034.Shortcut_Dimension_7_Code;
            l_rst50545."Forma de reparto" := l_rstJob."Forma de reparto";
            l_rst50545."Criterio de reparto" := l_rstJob."Criterio de reparto";
            //l_rst50545."No. mov. relacionado" :=
            if l_rst122."Currency Factor" <> 0 then begin
                l_rst50545."Importe Neto en $" := Round(qry50034.Sum_Amount / l_rst122."Currency Factor", 0.01);
                l_rst50545."Importe IVA Facturado en $" := Round((qry50034.Sum_Amount_Including_VAT - qry50034.Sum_Amount) / l_rst122."Currency Factor", 0.01);
            end
            else begin
                l_rst50545."Importe Neto en $" := Round(qry50034.Sum_Amount, 0.01);
                l_rst50545."Importe IVA Facturado en $" := Round(qry50034.Sum_Amount_Including_VAT - qry50034.Sum_Amount, 0.01);
            end;
            Clear(l_rstTGC);
            l_rstTGC.Get(qry50034.Tax_Group_Code);
            if l_rstTGC.Computable then
                l_rst50545."Importe IVA Computable" := l_rst50545."Importe IVA Facturado en $";
            l_rst50545."Monto IVA Retenido" := qry50034.Sum_Importe_retencion;
            l_rst50545."IVA para recupero" := l_rst50545."Importe IVA Computable";
            l_rst50545."Período DDJJ" := qry50034.Posting_Date;
            Clear(l_rst50020);
            l_rst50020.Get(l_rst50020."Tipo impuesto retencion"::IVA, qry50034.Cód_retención_IVA);
            l_rst50545."Cod. ret. IVA" := qry50034.Cód_retención_IVA;
            //l_rst50545."Código de Régimen" := FORMAT(qry50031.Cod_sicore);
            //l_rst50545."Código de Régimen" := FORMAT(l_rst50020."Codigo SICORE");
            l_rst50545."Número de Certificado" := qry50034.Serie_retención;
            l_rst50545."Motivo de no retención" := Format(qry50034.Excluido);
            l_rst50545."R.G. Certificado de exclusión" := '';
            l_rst50545."Período de Pago" := qry50032.Posting_Date;
            l_rst50545."Orden pago" := qry50032.Document_No;

            Clear(l_rstPay);
            l_rstPay.SetRange(l_rstPay."Document Type", l_rstPay."Document Type"::Payment);
            l_rstPay.SetRange("Document No.", qry50032.Document_No);
            l_rstPay.SetRange("Source Code", l_rst122."Pay-to Vendor No.");
            if l_rstPay.FindFirst then
                case l_rstPay."Bank Payment Type" of
                    l_rstPay."Bank Payment Type"::"Manual Check",
                  l_rstPay."Bank Payment Type"::"Computer Check":
                        l_rst50545."Medios de Pago" := '01';//Cheque nominativo a nombre del vendedor.
                    l_rstPay."Bank Payment Type"::"Electronic Payment":
                        l_rst50545."Medios de Pago" := '02';//Transferencia interbancaria
                end;
            if l_rst50545."Orden pago" = '' then
                l_rst50545."Orden pago" := l_rstPay."Document No.";
            if qry50034.Sum_Importe_retencion = 0 then begin
                l_rst50545."Tipo de Rubro 7" := '000';//Si tiene retención, es por la 18. Si no tuvo retención, es 00.
                l_rst50545."Código de Régimen" := '000';
            end
            else begin
                l_rst50545."Código de Régimen" := l_cduRegistroDiarios.fntNum(3, Format(qry50034.Cod_sicore));
                Clear(l_rst50020);
                l_rst50020.SetRange("Tipo impuesto retencion", l_rst50020."Tipo impuesto retencion"::IVA);
                l_rst50020.SetRange("Codigo SICORE", Format(qry50034.Cod_sicore));
                l_rst50020.FindFirst;
                l_rst50020.TestField("Tipo de regimen 7");
                l_rst50545."Tipo de Rubro 7" := l_cduRegistroDiarios.fntNum(3, Format(l_rst50020."Tipo de regimen 7"));
            end;
            case l_rstJob.Tipo of
                l_rstJob.Tipo::Improductivo: //D:directo, I:indirecto
                    l_rst50545."Ident. tipo de CF" := 'I';
                l_rstJob.Tipo::Productivo:
                    l_rst50545."Ident. tipo de CF" := 'D';
            end;
            l_rst50545."No. registro recupero IVA" := l_intRegistro;
            l_rst50545."Fecha pago IVA" := l_datPago;
            //Si está marcado "Exento retención en IVA" en el proveedor, tipo de exclusión 3
            Evaluate(l_intMotivoNoRetencion, l_rst50545."Motivo de no retención");
            if l_intMotivoNoRetencion = 0 then
                l_cduRetenciones.fntTestExentoRetencionIVA(l_rst23Fac."No.", l_rst50545."Monto IVA Retenido", l_intMotivoNoRetencion);
            l_rst50545."Motivo de no retención" := Format(l_intMotivoNoRetencion);
            l_rst50545."Descripción contable" := qry50034.Gen_Prod_Posting_Group;
            if l_rst50545."Motivo de no retención" = '2' then
                l_rst50545."R.G. Certificado de exclusión" := '01';
            l_rst50545.Insert;
        end;
    end;

    local procedure fntPorcentajeExportado(l_codJob: Code[20]; l_datFechaFinal: Date; l_rst50545: Record "Detalle Recupero IVA"): Decimal
    var
        l_rst32: Record "Item Ledger Entry";
        l_rstSS: Record "Sales & Receivables Setup";
        l_decVentas: Decimal;
        l_decEntradas: Decimal;
        l_rst167: Record Job;
        l_rst50542: Record "Cab. Reparto";
        l_rstGLS: Record "General Ledger Setup";
        l_codReparto: Code[20];
        l_rst21: Record "Cust. Ledger Entry";
        l_rstCabDCL: Record "Cab. DCL";
        l_decVentasDCL: Decimal;
        l_decEntradasDCL: Decimal;
        l_decCalculoExpoDCL: Decimal;
        l_decCalculoExpoProd: Decimal;
        l_rstIS: Record "Inventory Setup";
        l_decPorcRendimiento: Decimal;
        l_cuFish: Codeunit Trazabilidad;
        l_rst27: Record Item;
    begin
        Clear(l_rst167);
        l_rst167.Get(l_codJob);
        if (l_rst167."Lote origen" = '') and (l_rst50545.Tipo = l_rst50545.Tipo::Item) then begin
            Clear(l_cuFish);
            //l_rst167."Lote origen" := l_rst167."Global Dimension 1 Code"+l_rst167."Global Dimension 3 Code";
            l_rst167."Lote origen" := l_cuFish.fntLoteOrigen(l_rst167."No.", l_rst50545."No.");
            l_rst167.Modify;
        end;


        //El siguiente cálculo es de acuerdo a los DCL aplicados
        Clear(l_rstCabDCL);
        l_rstCabDCL.SetRange(l_rstCabDCL."No. proyecto", l_rst167."No.");
        if l_rst50545."Shortcut Dimension 2 Code" <> '' then
            l_rstCabDCL.SetFilter("Filtro actividad", l_rst50545."Shortcut Dimension 2 Code");
        l_rstCabDCL.SetFilter("Filtro fecha", '<=%1', l_datFechaFinal);
        if l_rstCabDCL.FindFirst then;
        l_rstCabDCL.CalcFields("Kilos netos declarados", "KN aplicados");
        l_decVentasDCL := l_rstCabDCL."KN aplicados";
        l_decEntradasDCL := l_rstCabDCL."Kilos netos declarados";

        //Cálculo porcentaje rendimiento producción
        /*
        l_decPorcRendimiento := fntRendimientoLote(l_rst167,l_rst50545."Shortcut Dimension 2 Code",l_datFechaFinal);
        IF l_decPorcRendimiento = 0 THEN
          l_decPorcRendimiento := 1;
        */
        //Por el momento, no tiene sentido incorporar este concepto
        l_decPorcRendimiento := 1;

        Clear(l_rstSS);
        l_rstSS.Get();
        Clear(l_rstIS);
        l_rstIS.Get();
        //Primero, calculo los kilos exportados
        //El siguiente cálculo es de acuerdo a las exportaciones físicas de movimientos de producto
        Clear(l_rst27);
        if l_rst27.Get(l_rst50545."No.") then;
        if (l_rst50545."Lote origen" = '') and (l_rst27."Item Category Code" <> l_rstIS."Categoria productos pesca") then begin
            Clear(l_rst32);
            l_rst32.SetRange("Lote origen", l_rst167."Lote origen");
            if l_rst50545."Shortcut Dimension 2 Code" <> '' then
                l_rst32.SetRange("Global Dimension 2 Code", l_rst50545."Shortcut Dimension 2 Code");
            l_rst32.SetFilter("Posting Date", '<=%1', l_datFechaFinal);
            l_rst32.SetRange("Cust. post. group", l_rstSS."Grupo contable Exportaciones");
            l_rst32.SetRange("Entry Type", l_rst32."Entry Type"::Sale);
            l_rst32.CalcSums("Net kilos");
            l_decVentas := -l_rst32."Net kilos";
        end;
        //Después, calculo los kilos totales
        //El siguiente cálculo es de acuerdo a las exportaciones físicas de movimientos de producto
        Clear(l_rstIS);
        l_rstIS.Get();
        Clear(l_rst32);
        l_rst32.SetRange("Lote origen", l_rst167."Lote origen");
        if l_rst50545."Shortcut Dimension 2 Code" <> '' then
            l_rst32.SetRange("Global Dimension 2 Code", l_rst50545."Shortcut Dimension 2 Code");
        l_rst32.SetFilter("Posting Date", '<=%1', l_datFechaFinal);
        l_rst32.SetRange("Item Category Code", l_rstIS."Categoria productos pesca");
        l_rst32.SetFilter("Entry Type", '%1|%2|%3', l_rst32."Entry Type"::"Positive Adjmt.", l_rst32."Entry Type"::"Negative Adjmt.", l_rst32."Entry Type"::Purchase);
        l_rst32.CalcSums("Net kilos");
        l_decEntradas := l_rst32."Net kilos";

        if fntRelacionadoAReparto(l_codJob, l_rst50545) then
            exit(1);

        if not ((l_decEntradas = 0) or (l_decVentas = 0)) then begin
            l_decCalculoExpoProd := Round(l_decVentas / (l_decEntradas * l_decPorcRendimiento), 0.01);
            if l_decCalculoExpoProd > 1 then
                exit(1);
        end;

        if not ((l_decEntradasDCL = 0) or (l_decVentasDCL = 0)) then begin
            l_decCalculoExpoDCL := Round(l_decVentasDCL / (l_decEntradasDCL * l_decPorcRendimiento), 0.01);
            if l_decCalculoExpoDCL > 1 then
                exit(1);
        end;

        if l_decCalculoExpoDCL > l_decCalculoExpoProd then
            exit(l_decCalculoExpoDCL)
        else
            exit(l_decCalculoExpoProd);

    end;

    local procedure fntRendimientoLote(l_rst167: Record Job; l_codActividad: Code[10]; l_datFechaFinal: Date): Decimal
    var
        l_decRendimientoProduccion: Decimal;
        l_rstIS: Record "Inventory Setup";
        l_rstMP: Record "Item Ledger Entry";
        l_codProduccionAnterior: Code[20];
    begin
        Clear(l_rstIS);
        l_rstIS.Get();

        //Primero, encuentro los movimientos de producción de ese lote, e itero cada producción, para esa actividad y dentro de la fecha
        l_codProduccionAnterior := '';
        Clear(l_rstMP);
        l_rstMP.SetCurrentKey("Document No.", "Nombre libro diario", "Lote origen", "Posting Date", "Global Dimension 2 Code");
        l_rstMP.SetRange("Nombre libro diario", l_rstIS."Production journal");
        l_rstMP.SetRange("Lote origen", l_rst167."Lote origen");
        if l_codActividad <> '' then
            l_rstMP.SetRange("Global Dimension 2 Code", l_codActividad);
        l_rstMP.SetFilter("Posting Date", '<=%1', l_datFechaFinal);
        l_rstMP.SetRange(Revertido, false);
        if l_rstMP.FindSet then
            repeat
                if l_codProduccionAnterior <> l_rstMP."Document No." then
                    fntRendimientoProduccion(l_rstMP);
                l_codProduccionAnterior := l_rstMP."Document No.";
            until l_rstMP.Next = 0;
        if (g_decMPTotal <> 0) and (g_decPTTotal <> 0) then
            exit(Round(g_decPTTotal / g_decMPTotal, 0.01));
    end;

    local procedure fntRendimientoProduccion(l_rstReferencia: Record "Item Ledger Entry")
    var
        l_decRendimientoProduccion: Decimal;
        l_rstMP: Record "Item Ledger Entry";
        l_rstPT: Record "Item Ledger Entry";
        l_decMP: Decimal;
        l_decPT: Decimal;
        l_decMPEsteLote: Decimal;
        l_decMPEstaProduccion: Decimal;
        l_decPTEsteLote: Decimal;
        l_decPTEstaProduccion: Decimal;
        l_decParticipacionEsteLoteEnProduccion: Decimal;
    begin
        //Necesito saber el total de rendimiento de mi lote, sobre el total de rendimiento de la producción
        Clear(l_rstPT);
        l_rstPT.SetRange("Document No.", l_rstReferencia."Document No.");
        l_rstPT.SetRange("Global Dimension 2 Code", l_rstReferencia."Global Dimension 2 Code");
        l_rstPT.SetRange(Revertido, false);
        l_rstPT.SetRange(Positive, true);
        l_rstPT.CalcSums("Net kilos");
        l_decPTEstaProduccion := l_rstPT."Net kilos";
        l_rstPT.SetRange("Lote origen", l_rstReferencia."Lote origen");
        l_rstPT.CalcSums("Net kilos");
        l_decPTEsteLote := l_rstPT."Net kilos";

        //Si hay PT de diferentes lotes, calculo la participación de mi lote, si no uso factor 1
        if (l_decPTEstaProduccion <> 0) and (l_decPTEsteLote <> l_decPTEstaProduccion) then
            l_decParticipacionEsteLoteEnProduccion := Round(l_decPTEsteLote / l_decPTEstaProduccion, 0.01)
        else
            l_decParticipacionEsteLoteEnProduccion := 1;

        //Busco el total de KN de materia prima usado en la producción
        Clear(l_rstMP);
        l_rstMP.SetRange("Document No.", l_rstReferencia."Document No.");
        l_rstMP.SetRange("Global Dimension 2 Code", l_rstReferencia."Global Dimension 2 Code");
        l_rstMP.SetRange(Revertido, false);
        l_rstMP.SetRange(Positive, false);
        l_rstMP.CalcSums("Net kilos");
        l_decMPEstaProduccion := l_rstMP."Net kilos";
        l_rstMP.SetRange("Lote origen", l_rstReferencia."Lote origen");
        l_rstMP.CalcSums("Net kilos");
        l_decMPEsteLote := l_rstMP."Net kilos";
        g_decMPTotal += l_decMPEsteLote;

        //Una vez obtenido el total de MP y su participación en la Producción, calculo los kilos totales de participación
        //Necesito saber el total de rendimiento de mi lote, sobre el total de rendimiento de la producción
        Clear(l_rstPT);
        l_rstPT.SetRange("Document No.", l_rstReferencia."Document No.");
        l_rstPT.SetRange("Global Dimension 2 Code", l_rstReferencia."Global Dimension 2 Code");
        l_rstPT.SetRange(Revertido, false);
        l_rstPT.SetRange(Positive, true);
        if l_decParticipacionEsteLoteEnProduccion = 1 then begin
            l_rstPT.SetRange("Lote origen", l_rstReferencia."Lote origen");
            l_rstPT.CalcSums("Net kilos");
            g_decPTTotal += l_rstPT."Net kilos";
        end
        else begin
            l_rstPT.CalcSums("Net kilos");
            g_decPTTotal += Round(l_rstPT."Net kilos" * l_decParticipacionEsteLoteEnProduccion, 0.01);
        end;
    end;

    [Scope('OnPrem')]
    procedure fntEliminarRecupero(l_intRegistro: Integer)
    var
        l_rst50544: Record "Recupero IVA";
        l_rst50545: Record "Detalle Recupero IVA";
        l_rst50546: Record "Recupero IVA Rubro 7";
        l_rst50547: Record "Recupero IVA Rubro 3";
        l_rst50: Record "Accounting Period";
        l_rst25: Record "Vendor Ledger Entry";
        l_rstGLS: Record "General Ledger Setup";
    begin
        Clear(l_rst50544);
        Clear(l_rst50546);
        Clear(l_rst50547);
        l_rst50544.SetRange("No.", l_intRegistro);
        if l_rst50544.FindFirst then begin
            Clear(l_rst50);
            l_rst50.SetRange("Starting Date", CalcDate('<-CM>', l_rst50544."Final Accounting Period"));
            if l_rst50.Find('-') then begin
                l_rst50."VAT recovery" := false;
                l_rst50.Modify;
            end;
            Clear(l_rstGLS);
            l_rstGLS.Get();
            l_rstGLS.TestField("VAT recovery end date margin");
            l_rstGLS.TestField("Age recovery VAT formula");
            Clear(l_rst50545);
            if l_rst50545.FindSet then
                repeat
                    Clear(l_rst25);
                    //l_rst25.SETRANGE("Document Date",CALCDATE(l_rstGLS."Age recovery VAT formula",CALCDATE('<-CM>',l_rst50544."Final Accounting Period")),l_rst50544."Final Accounting Period");
                    l_rst25.SetRange("Document Date", CalcDate(l_rstGLS."Age recovery VAT formula", CalcDate('<-CM>', l_rst50544."Final Accounting Period")), l_rst50544."Final Accounting Period");
                    l_rst25.SetRange("Estado recupero", l_rst25."Estado recupero"::"Listo para solicitar");
                    l_rst25.ModifyAll("Estado recupero", l_rst25."Estado recupero"::" ");
                until l_rst50545.Next = 0;
        end;
        l_rst50544.Delete;
        Clear(l_rst50545);
        l_rst50545.SetRange("No. registro recupero IVA", l_intRegistro);
        l_rst50545.DeleteAll;
        l_rst50546.SetRange("No. registro recupero IVA", l_intRegistro);
        l_rst50546.DeleteAll;
        l_rst50547.SetRange("No. registro recupero IVA", l_intRegistro);
        l_rst50547.DeleteAll;
    end;

    local procedure fntRelacionadoAReparto(l_codJob: Code[20]; l_rst50545: Record "Detalle Recupero IVA"): Boolean
    var
        l_rstSS: Record "Sales & Receivables Setup";
        l_rst167: Record Job;
        l_rst50542: Record "Cab. Reparto";
        l_rstGLS: Record "General Ledger Setup";
        l_codReparto: Code[20];
        l_rst21: Record "Cust. Ledger Entry";
        l_rst18: Record Customer;
    begin
        Clear(l_rstSS);
        l_rstSS.Get();
        Clear(l_rst167);
        l_rst167.Get(l_codJob);
        Clear(l_rst21);
        if l_rstSS."Dimension for sales" <> '' then begin
            Clear(l_rstGLS);
            l_rstGLS.Get();
            case l_rstSS."Dimension for sales" of
                l_rstGLS."Global Dimension 1 Code":
                    begin
                        if l_rst50542.Get(l_rst50545."Shortcut Dimension 1 Code") then;
                        l_rst21.SetRange("Global Dimension 1 Code", l_rst50545."Shortcut Dimension 1 Code");
                    end;
                l_rstGLS."Global Dimension 2 Code":
                    begin
                        if l_rst50542.Get(l_rst50545."Shortcut Dimension 2 Code") then;
                        l_rst21.SetRange("Global Dimension 2 Code", l_rst50545."Shortcut Dimension 2 Code");
                    end;
                l_rstGLS."Global Dimension 3 Code":
                    begin
                        if l_rst50542.Get(l_rst50545."Shortcut Dimension 3 Code") then;
                        l_rst21.SetRange("Global dimension 3 Code", l_rst50545."Shortcut Dimension 3 Code");
                    end;
                l_rstGLS."Global Dimension 4 Code":
                    begin
                        if l_rst50542.Get(l_rst50545."Shortcut Dimension 4 Code") then;
                        l_rst21.SetRange("Global Dimension 4 Code", l_rst50545."Shortcut Dimension 4 Code");
                    end;
                l_rstGLS."Global Dimension 5 Code":
                    begin
                        if l_rst50542.Get(l_rst50545."Shortcut Dimension 5 Code") then;
                        l_rst21.SetRange("Global Dimension 5 Code", l_rst50545."Shortcut Dimension 5 Code");
                    end;
                l_rstGLS."Global Dimension 6 Code":
                    begin
                        if l_rst50542.Get(l_rst50545."Shortcut Dimension 6 Code") then;
                        l_rst21.SetRange("Global dimension 6 Code", l_rst50545."Shortcut Dimension 6 Code");
                    end;
                l_rstGLS."Global Dimension 7 Code":
                    begin
                        if l_rst50542.Get(l_rst50545."Shortcut Dimension 7 Code") then;
                        l_rst21.SetRange("Global Dimension 7 Code", l_rst50545."Shortcut Dimension 7 Code");
                    end;
            end;
        end;
        //Busco el Reparto relacionado
        Clear(l_rst50542);
        l_rst50542.SetRange("No. Documento", l_rst50545."Shortcut Dimension 6 Code");
        if l_rst50542.FindFirst then begin

            Clear(l_rst18);
            l_rst18.Get(l_rst50542."Cliente factura");
            //Si el documento está relacionado a un reparto de exportación, entonces aplico el 100% del gasto como directo
            if l_rst18."Customer Posting Group" = l_rstSS."Grupo contable Exportaciones" then
                exit(true);
        end;

        exit(false);
    end;

    local procedure fntTraerMontoInsumos(l_codDocumento: Code[20]; l_codArancel: Code[20]; l_decFobUSD: Decimal) l_decInsumos: Decimal
    var
        l_rstSIH: Record "Sales Invoice Header";
        l_rst50220: Record "Insumos fact proyecto";
        l_rstSIL: Record "Sales Invoice Line";
        l_rstSCH: Record "Sales Cr.Memo Header";
        l_rstSCL: Record "Sales Cr.Memo Line";
    begin
        Clear(l_rst50220);
        l_decInsumos := 0;
        Clear(l_rstSIH);
        if l_rstSIH.Get(l_codDocumento) then begin
            l_rst50220.SetRange(Factura, l_rstSIH."Pre-Assigned No.");
            l_rst50220.SetRange("Posición arancelaria", l_codArancel);
            Clear(l_rstSIL);
            l_rstSIL.SetRange("Document No.", l_rstSIH."No.");
            l_rstSIL.SetRange("Cód. arancelario", l_codArancel);
            l_rstSIL.CalcSums("Importe USD");
            if l_rst50220.FindFirst then
                l_decInsumos := Round(l_rst50220.Insumos * (l_decFobUSD / l_rstSIL."Importe USD"), 0.01);
            exit(l_decInsumos);
        end
        else begin
            Clear(l_rstSCH);
            if l_rstSCH.Get(l_codDocumento) then begin
                l_rst50220.SetRange(Factura, l_rstSCH."Pre-Assigned No.");
                l_rst50220.SetRange("Posición arancelaria", l_codArancel);
                Clear(l_rstSCL);
                l_rstSCL.SetRange("Document No.", l_rstSCH."No.");
                l_rstSCL.SetRange("Cód. arancelario", l_codArancel);
                l_rstSCL.CalcSums("Importe USD");
                if l_rst50220.FindFirst then
                    l_decInsumos := Round(l_rst50220.Insumos * (l_decFobUSD / l_rstSCL."Importe USD"), 0.01);
                exit(l_decInsumos);
            end;
        end;
    end;

    local procedure fntIVARecuperado(l_datFechaRecupero: Date): Decimal
    begin
    end;

    local procedure fntCalcularMonto(l_decIVARecuperado: Decimal; l_decIVAParaRecupero: Decimal; l_decCoeficiente: Decimal; l_decIVARecuperadoEsteRegistro: Decimal; l_decIVAMaxARecuperar: Decimal; l_optTipoAfectacion: Option " ",Directa,Indirecta; l_decCantidadMovRelacionado: Decimal; l_decCantidadMovOriginal: Decimal) l_decARecuperar: Decimal
    var
        l_rstGLS: Record "General Ledger Setup";
    begin
        //Primero, verificamos si el IVA a recuperar es superior a la diferencia entre lo ya recuperado y el máximo a recuperar en esta instancia por ventas al exterior
        if ((l_decIVARecuperado + Round((l_decIVAParaRecupero) * l_decCoeficiente - l_decIVARecuperadoEsteRegistro, 0.01)) > l_decIVAMaxARecuperar) then
            //Si el IVA a recuperar es mayor, entonces directamente descuento el faltante hasta alcanzar el máximo a recuperar en esta instancia
            l_decARecuperar := l_decIVAMaxARecuperar - l_decIVARecuperado
        else
            //En caso contrario, aplicamos el coeficiente que corresponda sobre el monto de IVA para recupero
            if (l_decCantidadMovOriginal <> 0) and (l_decCantidadMovRelacionado <> 0) then
                l_decARecuperar := Round(l_decIVAParaRecupero * l_decCoeficiente * (Abs(l_decCantidadMovRelacionado) / Abs(l_decCantidadMovOriginal)), 0.01) - l_decIVARecuperadoEsteRegistro
            else
                l_decARecuperar := Round(l_decIVAParaRecupero * l_decCoeficiente, 0.01) - l_decIVARecuperadoEsteRegistro;
    end;

    local procedure fntVerificarFiltroParciales(l_rst50545: Record "Detalle Recupero IVA") blnFiltrar: Boolean
    var
        l_rstGLS: Record "General Ledger Setup";
        l_rstItem: Record Item;
        l_rstIS: Record "Inventory Setup";
        l_rst50546: Record "Recupero IVA Rubro 7";
    begin
        Clear(l_rstGLS);
        l_rstGLS.Get();
        if l_rstGLS."Filter partials from recovery" = l_rstGLS."Filter partials from recovery"::"All Invoice" then begin
            Clear(l_rst50546);
            l_rst50546.SetRange("No. documento interno", l_rst50545."No. documento interno");
            l_rst50546.SetFilter("IVA recuperado", '<>0');
            if l_rst50546.FindSet then
                exit(true);
        end;
        if l_rst50545."IVA recuperado" <> 0 then begin
            if l_rst50545.Tipo in [l_rst50545.Tipo::Item, l_rst50545.Tipo::"Charge (Item)", l_rst50545.Tipo::"Charge (Item)"] then begin
                if l_rstGLS."Filter partials from recovery" in [l_rstGLS."Filter partials from recovery"::All, l_rstGLS."Filter partials from recovery"::Items] then begin
                    Clear(l_rstItem);
                    l_rstItem.Get(l_rst50545."No.");
                    Clear(l_rstIS);
                    l_rstIS.Get();
                    case l_rstItem."Item Category Code" of
                        l_rstIS."Categoria productos consumo":
                            if l_rstGLS."Filter recovery by item cat." in ['', l_rstItem."Item Category Code"] then
                                exit(true);
                        l_rstIS."Categoria productos pesca":
                            if l_rstGLS."Filter recovery by item cat." in ['', l_rstItem."Item Category Code"] then
                                exit(true);
                    end;
                end;
            end;
            if l_rst50545.Tipo in [l_rst50545.Tipo::Resource] then begin
                if l_rstGLS."Filter partials from recovery" in [l_rstGLS."Filter partials from recovery"::All, l_rstGLS."Filter partials from recovery"::Resources] then
                    exit(true);
            end;
        end;

        exit(false);
    end;

    local procedure fntTipoAfectacion(l_rst167: Record Job; l_rst50545: Record "Detalle Recupero IVA"): Integer
    begin
        //0: Improductivo
        //1: Productivo
        if fntRelacionadoAReparto(l_rst167."No.", l_rst50545) then
            exit(1);
        case l_rst167.Tipo of
            l_rst167.Tipo::Improductivo:
                exit(2);
            l_rst167.Tipo::Productivo:
                exit(1);
        end;
    end;

    local procedure fntNuevaLineaRecuperoProducto(l_rst50545: Record "Detalle Recupero IVA"; l_rst50546: Record "Recupero IVA Rubro 7"; l_rstAP: Record "Accounting Period"; l_rst50544: Record "Recupero IVA")
    var
        l_rstIVLE: Record "Value Entry";
        l_rstILE: Record "Item Ledger Entry";
        l_rstIAE: Record "Item Application Entry";
        l_blnTransfer: Boolean;
        l_intSalida: Integer;
        l_rstGLS: Record "General Ledger Setup";
    begin
        with l_rstAP do begin
            Clear(l_rstIVLE);
            l_rstIVLE.SetRange("Document No.", l_rst50545."No. documento interno");
            l_rstIVLE.SetRange("Document Line No.", l_rst50545."No. linea");
            l_rstIVLE.SetRange("Document Type", l_rstIVLE."Document Type"::"Purchase Invoice");
            l_rstIVLE.SetRange("Item Ledger Entry Type", l_rstIVLE."Item Ledger Entry Type"::Purchase);
            l_rstIVLE.SetRange("Entry Type", l_rstIVLE."Entry Type"::"Direct Cost");
            l_rstIVLE.SetRange("Item Ledger Entry No.", l_rst50545."No. mov. relacionado");
            if l_rstIVLE.FindSet then begin
                if l_rstIVLE.Count > 1 then
                    Error('Hay más de un registro para el documento %1 línea %2', l_rst50545."No. documento interno", l_rst50545."No. linea");
                //Busco el movimiento de producto relacionado
                Clear(l_rstILE);
                l_rstILE.Get(l_rstIVLE."Item Ledger Entry No.");
                if l_rstILE."Remaining Quantity" <> l_rstILE.Quantity then begin
                    //Encuentro los movimientos con origen en el movimiento de producto relacionado (salidas, ventas, transferencias)
                    //Acá
                    fntBuscarUltimaSalida(l_rstILE."Entry No.", 0, l_rst50545, l_rst50544, l_rst50546, l_rstAP);
                    /*
                    CLEAR(l_rstIAE);
                    l_rstIAE.SETRANGE("Inbound Item Entry No.",l_rstILE."Entry No.");
                    l_rstIAE.SETFILTER("Posting Date",'<=%1',CALCDATE('<+CM>',"Starting Date"));
                    //Para evitar las salidas por transferencias en este filtro
                    //l_rstIAE.SETRANGE("Transferred-from Entry No.",0);
                    l_rstIAE.SETFILTER("Outbound Item Entry No.",'<>%1',0);

                    IF l_rstIAE.FINDSET THEN
                    REPEAT
                      //Por cada salida de cualquier clase, inserto una línea para recupero
                      l_blnTransfer := FALSE;
                      CLEAR(l_rstILE);
                      l_rstILE.GET(l_rstIAE."Outbound Item Entry No.");
                      IF l_rstILE."Entry Type" IN[l_rstILE."Entry Type"::"Negative Adjmt.",l_rstILE."Entry Type"::Sale,l_rstILE."Entry Type"::Transfer] THEN
                      BEGIN
                        l_intSalida := l_rstILE."Entry No.";
                      {
                      Acá
                      ELSE
                        l_intEntrada := l_rstILE."Entry No.";
                      }
                        fntBuscarUltimaSalida(l_intSalida,l_rst50545,l_rst50544,l_rstAP);
                        fntInsertarLineaConsumoProducto(l_rstIAE,l_rst50545,l_rst50546,l_rst50544);
                      END;
                    UNTIL l_rstIAE.NEXT = 0;
                    */
                    //Hago lo mismo para las transferencias!!
                    //Encuentro los movimientos con origen en el movimiento de producto relacionado (salidas, ventas)
                    /*
                    CLEAR(l_rstIAE);
                    l_rstIAE.SETFILTER("Posting Date",'<=%1'{,l_rstAP."Starting Date"},CALCDATE('<+CM>',"Starting Date"));
                    //Para evitar las salidas por transferencias en este filtro
                    l_rstIAE.SETRANGE("Transferred-from Entry No.",l_rstIVLE."Item Ledger Entry No.");
                    l_rstIAE.SETFILTER("Outbound Item Entry No.",'<>%1',0);
                    //j := 0;
                    IF l_rstIAE.FINDSET THEN
                    REPEAT
                      //¿Tiene alguna transferencia?
                      //Si es así, me fijo si hay una cadena de transferencias hasta ubicar la última
                      CLEAR(l_rstILE);
                      l_rstILE.GET(l_rstIAE."Outbound Item Entry No.");
                      IF l_rstILE."Entry Type" = l_rstILE."Entry Type"::Transfer THEN
                      BEGIN
                        l_intEntrada := l_rstIAE."Transferred-from Entry No.";
                        l_intSalida := l_rstILE."Entry No.";
                        WHILE l_blnTransfer = FALSE DO
                        BEGIN
                          //fntBuscarUltimaTransferencia(l_blnTransfer,l_intSalida,l_intEntrada);
                          fntBuscarUltimaTransferencia(l_blnTransfer,l_intSalida,l_intEntrada);
                        END;
                      END;
                      IF (l_intSalida <> l_rstILE."Entry No.") AND (l_intSalida <> 0) THEN
                      BEGIN
                        CLEAR(l_rstIAE2);
                        l_rstIAE2.SETRANGE("Outbound Item Entry No.",l_intSalida);
                        l_rstIAE2.FINDFIRST;
                      END
                      ELSE
                      BEGIN
                        CLEAR(l_rstIAE2);
                        l_rstIAE2.get(l_rstIAE."Entry No.");
                      END;
                      {
                      l_intSalida := l_rstIAE."Outbound Item Entry No.";
                      l_intEntrada := l_rstILE."Entry No.";
                      }
                      l_blnTransfer := FALSE;

                      CLEAR(l_rstILE);
                      l_rstILE.GET(l_rstIAE2."Outbound Item Entry No.");
                      IF l_intSalida <> 0 THEN
                      BEGIN
                        l_rst50545.SETFILTER("Filtro No. mov. relacionado",'%1',l_rstIAE2."Outbound Item Entry No.");
                        l_rst50545.CALCFIELDS("IVA recuperado");
                        l_rst50546."No. mov. relacionado" := l_rstIAE2."Outbound Item Entry No.";
                        //l_rst50546.CALCFIELDS("Cantidad mov. relacionado");
                        //l_rst50546.Cantidad := l_rstIAE.Quantity;
                        IF ABS(l_rstIAE2.Quantity) >= l_rst50546."Cantidad mov. compra" THEN
                          l_rst50546."Cantidad mov. relacionado" := l_rst50546."Cantidad mov. compra"
                        ELSE
                          l_rst50546."Cantidad mov. relacionado" := ABS(l_rstIAE2.Quantity);

                        l_rst50546."Importe Neto en $" := ROUND(l_rst50545."Importe Neto en $"*(ABS(l_rst50546."Cantidad mov. relacionado"/l_rst50546."Cantidad mov. compra")),0.01);
                        l_rst50546."Importe IVA Facturado en $" := ROUND(l_rst50545."Importe IVA Facturado en $"*(ABS(l_rst50546."Cantidad mov. relacionado"/l_rst50546."Cantidad mov. compra")),0.01);
                        l_rst50546."Importe IVA Computable vinc. a" := 0;
                        l_rst50546."Importe IVA Computable" := ROUND(l_rst50545."Importe IVA Computable"*(ABS(l_rst50546."Cantidad mov. relacionado"/l_rst50546."Cantidad mov. compra")),0.01);
                        l_rst50546."Monto IVA Retenido" := ROUND(l_rst50545."Monto IVA Retenido"*(ABS(l_rst50546."Cantidad mov. relacionado"/l_rst50546."Cantidad mov. compra")),0.01);
                        CLEAR(l_rstILE);
                        l_rstILE.GET(l_intSalida);
                        IF l_rstILE."Job No." = '' THEN
                          ERROR('El documento %1, línea %2 no tiene número de Proyecto',l_rstILE."Document No.",l_rstILE."Document Line No.");
                        l_rst167.GET(l_rstILE."Job No.");
                        l_rst50546.Proyecto := l_rst167."No.";
                        IF l_rst167.Tipo = l_rst167.Tipo::Productivo THEN
                          l_decPorcExportado := fntPorcentajeExportado(l_rst50546.Proyecto,l_rst50545."Fecha ingreso stock",l_rst50545);
                        j += 1;
                        IF j > 1 THEN
                        BEGIN
                          //Si este movimiento de factura ya tuvo un consumo previo, vuelvo a generar una cabecera para cada uno de los siguientes
                          CLEAR(l_rst50546);
                          i += 1;
                          l_rst50546."No. mov." := fntBuscarUltimoR7+1;
                          l_rst50546."Tipo de comprobante" := l_rst50545."Tipo de comprobante";
                          l_rst50546."Fecha de comprobante" := l_rst50545."Fecha de comprobante";
                          l_rst50546.Tipo := l_rst50545.Tipo;
                          l_rst50546."No." := l_rst50545."No.";
                          l_rst50546."Punto de venta" := l_rst50545."Punto de venta";
                          l_rst50546."Número de comprobante" := l_rst50545."Número de comprobante";
                          l_rst50546."CUIT Emisor" := l_rst50545."CUIT Emisor";
                          l_rst50546."Denominación emisor" := l_rst50545."Denominación emisor";
                          l_rst50546."CUIT Vendedor" := l_rst50545."CUIT Vendedor";
                          l_rst50546."Denominación vendedor" := l_rst50545."Denominación vendedor";
                          l_rst50546."No. mov. relacionado" := l_rstIAE2."Outbound Item Entry No.";
                          //l_rst50546.CALCFIELDS("Cantidad mov. relacionado");
                          //l_rst50546.Cantidad := l_rstIAE.Quantity;
                          l_rst50546."Cantidad mov. compra" := l_rst50545.Cantidad;
                          l_rst50546."Cantidad mov. relacionado" := ABS(l_rstIAE2.Quantity);
                          l_rst50546."Importe Neto en $" := ROUND(l_rst50545."Importe Neto en $"*(ABS(l_rst50546."Cantidad mov. relacionado"/l_rst50546."Cantidad mov. compra")),0.01);
                          l_rst50546."Importe IVA Facturado en $" := ROUND(l_rst50545."Importe IVA Facturado en $"*(ABS(l_rst50546."Cantidad mov. relacionado"/l_rst50546."Cantidad mov. compra")),0.01);
                          l_rst50546."Importe IVA Computable vinc. a" := 0;
                          l_rst50546."Importe IVA Computable" := ROUND(l_rst50545."Importe IVA Computable"*(ABS(l_rst50546."Cantidad mov. relacionado"/l_rst50546."Cantidad mov. compra")),0.01);
                          l_rst50546."Monto IVA Retenido" := ROUND(l_rst50545."Monto IVA Retenido"*(ABS(l_rst50546."Cantidad mov. relacionado"/l_rst50546."Cantidad mov. compra")),0.01);
                          l_rst50546."Período de Pago" := l_rst50545."Período de Pago";
                          l_rst50546."Período DDJJ" := l_rst50545."Período DDJJ";
                          //l_rst50546."Período DDJJ" := l_rst50544."Final Accounting Period";
                          l_rst50546."Descripción del Bien" := l_rst50545.Descripcion;
                          l_rst50546."IVA Depositado en CBU" := 0;
                          l_rst50546."Código de Régimen" := l_rst50545."Código de Régimen";
                          l_rst50546."Número de Certificado" := l_rst50545."Número de Certificado";
                          l_rst50546."Motivo de no retención" := l_rst50545."Motivo de no retención";
                          l_rst50546."R.G. Certificado de exclusión" := l_rst50545."R.G. Certificado de exclusión";
                          l_rst50546."Medios de Pago" := l_rst50545."Medios de Pago";
                          l_rst50546."Tipo de Rubro 7" := l_rst50545."Tipo de Rubro 7";
                          l_rst50546."Tipo de afectacion" := l_rst50545."Tipo afectación";
                          l_rst50546."Coeficiente aplicado" := l_decCoeficiente;
                          l_rst50546."Documento expo relacionado" := '';
                          l_rst50546."Posicion Arancelaria" := l_rst50545."Posicion Arancelaria";
                          l_rst50546.Proyecto := l_rst167."No.";
                          l_rst50546."No. documento interno" := l_rst50545."No. documento interno";
                          l_rst50546."No. linea" := l_rst50545."No. linea";
                          l_rst50546."No. registro recupero IVA" := l_intPeriodoAplicado;
                        END
                        ELSE
                          l_rst50546.Proyecto := l_rst167."No.";
                        l_rst50546."No. mov. relacionado" := l_intSalida;
                        l_rst50546."Tipo de afectacion" := fntTipoAfectacion(l_rst167,l_rst50545);
                        {
                        CASE l_rst167.Tipo OF
                          l_rst167.Tipo::Improductivo:
                            l_rst50546."Tipo de afectacion" := l_rst50546."Tipo de afectacion"::Indirecta;
                          l_rst167.Tipo::Productivo:
                            l_rst50546."Tipo de afectacion" := l_rst50546."Tipo de afectacion"::Directa;
                        END;
                        }
                        IF (l_rstILE."Document Type" <> l_rstILE."Document Type"::"Purchase Credit Memo") THEN
                        BEGIN
                          l_rst50546."Porcentaje aplicado" := l_decCoeficiente;
                          IF l_rst50546."Tipo de afectacion" = l_rst50546."Tipo de afectacion"::Indirecta THEN
                            l_rst50546."IVA recuperado" := ROUND(fntCalcularMonto(l_decIVARecuperado,l_rst50545."Importe IVA Computable"
                                                                            ,l_decCoeficiente,l_rst50545."IVA recuperado"
                                                                            ,l_decIVAMaxARecuperar,l_rst50545."Tipo afectación",ABS(l_rst50546."Cantidad mov. relacionado"),ABS(l_rst50546."Cantidad mov. compra"))
                                                                            ,0.01)
                        ELSE
                        BEGIN
                          l_rst50546."IVA recuperado" := ROUND(fntCalcularMonto(l_decIVARecuperado,l_rst50545."Importe IVA Computable"
                                                                          ,l_decPorcExportado,l_rst50545."IVA recuperado"
                                                                          ,l_decIVAMaxARecuperar,l_rst50545."Tipo afectación",ABS(l_rst50546."Cantidad mov. relacionado"),ABS(l_rst50546."Cantidad mov. compra"))
                                                                          ,0.01);
                          l_rst50546."Porcentaje aplicado" := l_decPorcExportado;
                        END;
                        l_rst50546."IVA para recupero" := l_rst50546."Importe IVA Computable";
                      END;
                    END;
                    {
                    //++Agregado
                    l_decARecuperar := l_rst50545."Importe IVA Computable"-l_rst50545."IVA recuperado";
                    //--Fin agregado
                    }
                    IF l_rstILE."Document Type" <> l_rstILE."Document Type"::"Purchase Credit Memo" THEN
                    BEGIN
                      //Primero, verificamos si el IVA a recuperar es superior a la diferencia entre lo ya recuperado y el máximo a recuperar en esta instancia por ventas al exterior
                      IF (l_decIVARecuperado > l_decIVAMaxARecuperar) THEN
                        //Si el IVA a recuperar es mayor, entonces directamente descuento el faltante hasta alcanzar el máximo a recuperar en esta instancia
                        l_rst50546."IVA recuperado" := l_decIVAMaxARecuperar-l_decIVARecuperado;
                        //En caso contrario, dejamos la aplicación previa con el coeficiente que corresponda sobre el monto de IVA para recupero
                    END;
                    IF l_rstGLS."VAT recover quotient summarize" THEN
                    BEGIN
                      IF (l_rst50546."IVA recuperado" <> 0) THEN
                      BEGIN
                        l_rst50546.INSERT;
                        l_decIVARecuperado += l_rst50546."IVA recuperado";
                        CLEAR(l_rst50546);
                      END;
                    END
                    ELSE
                    BEGIN
                      //IF (l_rst50546."IVA recuperado" > 0) OR ((l_rst50546."IVA recuperado" < 0) AND (l_rst50546."IVA para recupero" < 0)) THEN
                      IF ((l_rst50546."IVA recuperado" > 0) AND (l_rst50546."IVA para recupero" > 0)) OR ((l_rst50546."IVA recuperado" < 0) AND (l_rst50546."IVA para recupero" < 0)) THEN
                      BEGIN
                        l_rst50546.INSERT;
                        l_decIVARecuperado += l_rst50546."IVA recuperado";
                        CLEAR(l_rst50546);
                      END;
                    END;                      {
                    ELSE
                    BEGIN
                      IF l_rst50546.INSERT THEN;
                        //l_rst50546.DELETE;
                    END;
                    }
                  UNTIL l_rstIAE.NEXT = 0;
                  */
                end;
            end;
        end;

    end;

    local procedure fntBuscarUltimaTransferencia(var l_blnMov: Boolean; var l_intSalida: Integer; var l_intEntrada: Integer): Integer
    var
        l_rstIAE: Record "Item Application Entry";
        l_rstILE: Record "Item Ledger Entry";
        l_rstIAE2: Record "Item Application Entry";
        l_rst50546: Record "Recupero IVA Rubro 7";
    begin
        //Los movimientos de transferencia positivos tienen identificado el movimiento de compra del cual provienen
        //l_intSalida trae el movimiento de transferencia de salida
        //l_intEntrada trae el movimiento de transferencia de entrada (el destino de la transferencia de salida)
        //En este primer filtro, busco la próxima transferencia que haya tenido como origen en esta transferencia.
        Clear(l_rstIAE);
        l_rstIAE.SetRange("Outbound Item Entry No.", l_intSalida);
        l_rstIAE.SetRange("Transferred-from Entry No.", l_intEntrada);
        if l_rstIAE.FindSet then begin
            Clear(l_rstILE);
            l_rstILE.Get(l_rstIAE."Item Ledger Entry No.");
            if l_rstILE.Quantity <> l_rstILE."Remaining Quantity" then begin
                Clear(l_rstIAE2);
                l_rstIAE2.SetRange("Inbound Item Entry No.", l_intEntrada);
                l_rstIAE2.SetFilter("Outbound Item Entry No.", '<>%1', 0);
                l_rstIAE2.FindFirst;
                begin
                    Clear(l_rstILE);
                    l_rstILE.Get(l_rstIAE2."Outbound Item Entry No.");
                    if l_rstILE."Entry Type" = l_rstILE."Entry Type"::Transfer then begin
                        l_intSalida := l_rstIAE."Item Ledger Entry No.";
                        l_blnMov := false;
                        l_intEntrada := l_rstIAE."Inbound Item Entry No.";
                    end
                    else begin
                        l_intSalida := l_rstILE."Entry No.";
                        l_blnMov := true;
                    end;
                end;
            end
            else begin
                //Si no encuentro movimiento de entrada por transferencia, me fijo
                Clear(l_rstIAE);
                l_rstIAE.SetRange("Inbound Item Entry No.", l_intEntrada);
                if l_rstIAE.FindFirst then;
                l_intSalida := 0;
                l_blnMov := true;
            end;
        end
        else begin
            //Si no encuentro movimiento de entrada por transferencia, me fijo si la cantidad pendiente es igual a la cantidad (si tuvo algún consumo)
            Clear(l_rstIAE);
            l_rstIAE.SetRange("Item Ledger Entry No.", l_intEntrada);
            l_rstIAE.SetRange("Inbound Item Entry No.", l_intEntrada);
            l_rstIAE.FindFirst;
            begin
                Clear(l_rstILE);
                //Si la transferencia sólo tuvo consumos, los busco
                l_rstILE.Get(l_rstIAE."Item Ledger Entry No.");
                if l_rstILE.Quantity <> l_rstILE."Remaining Quantity" then begin
                    Clear(l_rstIAE);
                    l_rstIAE.SetRange("Inbound Item Entry No.", l_intEntrada);
                    l_rstIAE.SetFilter("Item Ledger Entry No.", '<>%1', l_intEntrada);
                    l_rstIAE.SetFilter("Outbound Item Entry No.", '<>%1', 0);
                    if l_rstIAE.FindSet then
                        repeat
                            Clear(l_rst50546);
                            //Si no generé ya la línea de recupero para este consumo, la creo.
                            //Si ya la generé, busco la siguiente salida
                            l_rst50546.SetRange("No. mov. relacionado", l_rstIAE."Item Ledger Entry No.");
                            if l_rst50546.IsEmpty then begin
                                l_intSalida := l_rstIAE."Item Ledger Entry No.";
                                l_blnMov := true;
                            end;
                        until l_rstIAE.Next = 0;
                end;
            end;
            /*
            IF l_rstIAE.FINDFIRST THEN;
            l_intSalida := 0;
            l_blnMov := TRUE;
            */
        end;

    end;

    local procedure fntBuscarUltimaSalida(l_intMov: Integer; l_intMovTransfer: Integer; l_rst50545: Record "Detalle Recupero IVA"; l_rst50544: Record "Recupero IVA"; l_rst50546: Record "Recupero IVA Rubro 7"; l_rstAP: Record "Accounting Period") l_intConsumo: Integer
    var
        l_rstIAE: Record "Item Application Entry";
        l_rstILE: Record "Item Ledger Entry";
        l_rstIAE2: Record "Item Application Entry";
        l_rst167: Record Job;
    begin
        //El movimiento puede ser: Compra, Salida, Venta, Transferencia:
        //Salida/Venta: Es un movimiento recuperable, se inserta.
        //1)Transferencia: No es un movimiento recuperable, hay que avanzar en la transferencia para encontrar una Salida o una Venta.
        //Si no encuentro una salida relacionada a la entrada de la transferencia, salgo. Si no encuentro Salida o Venta, busco una nueva transferencia.
        //Si encuentro una nueva transferencia, salgo.
        //Si encuentro una nueva transferencia, vuelvo al momento 1.

        k := 0;
        l_intR7 := 0;
        l_intR7 := fntBuscarUltimoR7;
        if l_intMov = 0 then
            exit
        else begin
            //  IF (l_intSalida <> 0) AND (l_rstILE."Entry Type"=l_rstILE."Entry Type"::Transfer) THEN
            Clear(l_rstILE);
            l_rstILE.Get(l_intMov);
            case l_rstILE."Entry Type" of
                l_rstILE."Entry Type"::Purchase:
                    begin
                        Clear(l_rstIAE);
                        l_rstIAE.SetRange("Inbound Item Entry No.", l_intMov);
                        l_rstIAE.SetFilter("Posting Date", '<=%1', CalcDate('<+CM>', l_rstAP."Starting Date"));
                        l_rstIAE.SetFilter("Outbound Item Entry No.", '<>%1', 0);
                        if l_rstIAE.FindSet then
                            repeat
                                //La primera siempre es una compra
                                Clear(l_rstILE);
                                l_rstILE.Get(l_rstIAE."Item Ledger Entry No.");
                                if l_rstILE."Entry Type" = l_rstILE."Entry Type"::"Negative Adjmt." then
                                    fntInsertarLineaConsumoProducto(l_rstIAE, l_rst50545, l_rst50546, l_rst50544)
                                else
                                    fntBuscarUltimaSalida(l_rstILE."Entry No.", l_rstIAE."Inbound Item Entry No.", l_rst50545, l_rst50544, l_rst50546, l_rstAP);
                            until l_rstIAE.Next = 0;
                    end;
                l_rstILE."Entry Type"::Transfer:
                    begin
                        //Si es negativa, busco la siguiente positiva
                        if not l_rstILE.Positive then begin
                            Clear(l_rstIAE);
                            l_rstIAE.SetRange("Transferred-from Entry No.", l_intMovTransfer);
                            l_rstIAE.SetFilter("Posting Date", '<=%1', CalcDate('<+CM>', l_rstAP."Starting Date"));
                            l_rstIAE.SetRange("Outbound Item Entry No.", l_rstILE."Entry No.");
                            if l_rstIAE.FindSet then begin
                                Clear(l_rstILE);
                                l_rstILE.Get(l_rstIAE."Item Ledger Entry No.");
                                fntBuscarUltimaSalida(l_rstILE."Entry No.", l_rstIAE."Inbound Item Entry No.", l_rst50545, l_rst50544, l_rst50546, l_rstAP);
                            end;
                        end
                        else begin
                            //Si es positiva, busco la siguiente salida
                            Clear(l_rstIAE);
                            l_rstIAE.SetRange("Inbound Item Entry No.", l_intMov);
                            l_rstIAE.SetFilter("Posting Date", '<=%1', CalcDate('<+CM>', l_rstAP."Starting Date"));
                            l_rstIAE.SetFilter("Outbound Item Entry No.", '<>%1', 0);
                            l_rstIAE.SetRange("Transferred-from Entry No.", 0);
                            if l_rstIAE.FindSet then
                                repeat
                                    Clear(l_rstILE);
                                    l_rstILE.Get(l_rstIAE."Item Ledger Entry No.");
                                    if l_rstILE."Entry Type" = l_rstILE."Entry Type"::"Negative Adjmt." then
                                        fntInsertarLineaConsumoProducto(l_rstIAE, l_rst50545, l_rst50546, l_rst50544)
                                    else
                                        fntBuscarUltimaSalida(l_rstILE."Entry No.", l_rstIAE."Inbound Item Entry No.", l_rst50545, l_rst50544, l_rst50546, l_rstAP);
                                until l_rstIAE.Next = 0;
                        end;
                    end;
            end;
        end;


        //fntInsertarLineaConsumoProducto(l_rstIAE
        //fntBuscarUltimaSalida;
        //  l_rst50546."IVA recuperado" := 0;
    end;

    local procedure fntInsertarLineaConsumoProducto(l_rstIAE: Record "Item Application Entry"; l_rst50545: Record "Detalle Recupero IVA"; l_rst50546: Record "Recupero IVA Rubro 7"; l_rst50544: Record "Recupero IVA")
    var
        l_rstILE: Record "Item Ledger Entry";
        l_rst167: Record Job;
        j: Integer;
        l_rstGLS: Record "General Ledger Setup";
    begin
        j := 0;
        l_rst50545.SetFilter("Filtro No. mov. relacionado", '%1', l_rstIAE."Outbound Item Entry No.");
        l_rst50545.CalcFields("IVA recuperado");
        l_rst50546."No. mov. relacionado" := l_rstIAE."Outbound Item Entry No.";
        if Abs(l_rstIAE.Quantity) >= l_rst50546."Cantidad mov. compra" then
            l_rst50546."Cantidad mov. relacionado" := l_rst50546."Cantidad mov. compra"
        else
            l_rst50546."Cantidad mov. relacionado" := Abs(l_rstIAE.Quantity);

        l_rst50546."Importe Neto en $" := Round(l_rst50545."Importe Neto en $" * (Abs(l_rst50546."Cantidad mov. relacionado" / l_rst50546."Cantidad mov. compra")), 0.01);
        l_rst50546."Importe IVA Facturado en $" := Round(l_rst50545."Importe IVA Facturado en $" * (Abs(l_rst50546."Cantidad mov. relacionado" / l_rst50546."Cantidad mov. compra")), 0.01);
        l_rst50546."Importe IVA Computable vinc. a" := 0;
        l_rst50546."Importe IVA Computable" := Round(l_rst50545."Importe IVA Computable" * (Abs(l_rst50546."Cantidad mov. relacionado" / l_rst50546."Cantidad mov. compra")), 0.01);
        l_rst50546."Monto IVA Retenido" := Round(l_rst50545."Monto IVA Retenido" * (Abs(l_rst50546."Cantidad mov. relacionado" / l_rst50546."Cantidad mov. compra")), 0.01);
        Clear(l_rstILE);
        l_rstILE.Get(l_rstIAE."Outbound Item Entry No.");
        if l_rstILE."Job No." = '' then
            Error('El documento %1, línea %2 no tiene número de Proyecto', l_rstILE."Document No.", l_rstILE."Document Line No.");
        Clear(l_rst167);
        l_rst167.Get(l_rstILE."Job No.");
        l_rst50546.Proyecto := l_rst167."No.";
        l_rst50546."Lote origen" := l_rst50545."Lote origen";
        if l_rst167.Tipo = l_rst167.Tipo::Productivo then
            g_decPorcExportado := fntPorcentajeExportado(l_rst50546.Proyecto, l_rst50544."Final Accounting Period", l_rst50545);
        k += 1;
        if k > 1 then begin
            //Si este movimiento de factura ya tuvo un consumo previo, vuelvo a generar una cabecera para cada uno de los siguientes
            Clear(l_rst50546);
            l_rst50546."Tipo de comprobante" := l_rst50545."Tipo de comprobante";
            l_rst50546."Fecha de comprobante" := l_rst50545."Fecha de comprobante";
            l_rst50546.Tipo := l_rst50545.Tipo;
            l_rst50546."No." := l_rst50545."No.";
            l_rst50546."Punto de venta" := l_rst50545."Punto de venta";
            l_rst50546."Número de comprobante" := l_rst50545."Número de comprobante";
            l_rst50546."CUIT Emisor" := l_rst50545."CUIT Emisor";
            l_rst50546."Denominación emisor" := l_rst50545."Denominación emisor";
            l_rst50546."CUIT Vendedor" := l_rst50545."CUIT Vendedor";
            l_rst50546."Denominación vendedor" := l_rst50545."Denominación vendedor";
            l_rst50546."No. mov. relacionado" := l_rstIAE."Outbound Item Entry No.";
            //l_rst50546.CALCFIELDS("Cantidad mov. relacionado");
            //l_rst50546.Cantidad := l_rstIAE.Quantity;
            l_rst50546."Cantidad mov. compra" := l_rst50545.Cantidad;
            l_rst50546."Cantidad mov. relacionado" := Abs(l_rstIAE.Quantity);
            l_rst50546."Importe Neto en $" := Round(l_rst50545."Importe Neto en $" * (Abs(l_rst50546."Cantidad mov. relacionado" / l_rst50546."Cantidad mov. compra")), 0.01);
            l_rst50546."Importe IVA Facturado en $" := Round(l_rst50545."Importe IVA Facturado en $" * (Abs(l_rst50546."Cantidad mov. relacionado" / l_rst50546."Cantidad mov. compra")), 0.01);
            l_rst50546."Importe IVA Computable vinc. a" := 0;
            l_rst50546."Importe IVA Computable" := Round(l_rst50545."Importe IVA Computable" * (Abs(l_rst50546."Cantidad mov. relacionado" / l_rst50546."Cantidad mov. compra")), 0.01);
            l_rst50546."Monto IVA Retenido" := Round(l_rst50545."Monto IVA Retenido" * (Abs(l_rst50546."Cantidad mov. relacionado" / l_rst50546."Cantidad mov. compra")), 0.01);
            l_rst50546."Período de Pago" := l_rst50545."Período de Pago";
            l_rst50546."Período DDJJ" := l_rst50545."Período DDJJ";
            //l_rst50546."Período DDJJ" := l_rst50544."Final Accounting Period";
            l_rst50546."Descripción del Bien" := l_rst50545.Descripcion;
            l_rst50546."IVA Depositado en CBU" := 0;
            l_rst50546."Código de Régimen" := l_rst50545."Código de Régimen";
            l_rst50546."Número de Certificado" := l_rst50545."Número de Certificado";
            l_rst50546."Motivo de no retención" := l_rst50545."Motivo de no retención";
            l_rst50546."R.G. Certificado de exclusión" := l_rst50545."R.G. Certificado de exclusión";
            l_rst50546."Medios de Pago" := l_rst50545."Medios de Pago";
            l_rst50546."Tipo de Rubro 7" := l_rst50545."Tipo de Rubro 7";
            l_rst50546."Tipo de afectacion" := l_rst50545."Tipo afectación";
            l_rst50546."Coeficiente aplicado" := g_decCoeficiente;
            l_rst50546."Documento expo relacionado" := '';
            l_rst50546."Posicion Arancelaria" := l_rst50545."Posicion Arancelaria";
            l_rst50546.Proyecto := l_rst167."No.";
            l_rst50546."Lote origen" := l_rst50545."Lote origen";
            l_rst50546."No. documento interno" := l_rst50545."No. documento interno";
            l_rst50546."No. linea" := l_rst50545."No. linea";
            l_rst50546."No. registro recupero IVA" := g_intPeriodoAplicado;
        end
        else
            l_rst50546.Proyecto := l_rst167."No.";
        l_rst50546."No. mov. relacionado" := l_rstILE."Entry No.";
        l_rst50546."Tipo de afectacion" := fntTipoAfectacion(l_rst167, l_rst50545);
        if (l_rstILE."Document Type" <> l_rstILE."Document Type"::"Purchase Credit Memo") then begin
            l_rst50546."Porcentaje aplicado" := g_decCoeficiente;
            if l_rst50546."Tipo de afectacion" = l_rst50546."Tipo de afectacion"::Indirecta then
                l_rst50546."IVA recuperado" := Round(fntCalcularMonto(g_decIVARecuperado, l_rst50545."Importe IVA Computable"
                                                                , g_decCoeficiente, l_rst50545."IVA recuperado"
                                                                , g_decIVAMaxARecuperar, l_rst50545."Tipo afectación", Abs(l_rst50546."Cantidad mov. relacionado"), Abs(l_rst50546."Cantidad mov. compra"))
                                                                , 0.01)
            else begin
                l_rst50546."IVA recuperado" := Round(fntCalcularMonto(g_decIVARecuperado, l_rst50545."Importe IVA Computable"
                                                                , g_decPorcExportado, l_rst50545."IVA recuperado"
                                                                , g_decIVAMaxARecuperar, l_rst50545."Tipo afectación", Abs(l_rst50546."Cantidad mov. relacionado"), Abs(l_rst50546."Cantidad mov. compra"))
                                                                , 0.01);
                l_rst50546."Porcentaje aplicado" := g_decPorcExportado;
            end;
            l_rst50546."IVA para recupero" := l_rst50546."Importe IVA Computable";
        end;
        if l_rstILE."Document Type" <> l_rstILE."Document Type"::"Purchase Credit Memo" then begin
            //Primero, verificamos si el IVA a recuperar es superior a la diferencia entre lo ya recuperado y el máximo a recuperar en esta instancia por ventas al exterior
            if (g_decIVARecuperado > g_decIVAMaxARecuperar) then
                //Si el IVA a recuperar es mayor, entonces directamente descuento el faltante hasta alcanzar el máximo a recuperar en esta instancia
                l_rst50546."IVA recuperado" := g_decIVAMaxARecuperar - g_decIVARecuperado;
            //En caso contrario, dejamos la aplicación previa con el coeficiente que corresponda sobre el monto de IVA para recupero
        end;
        Clear(l_rstGLS);
        l_rstGLS.Get();
        if l_rstGLS."VAT recover quotient summarize" then begin
            if (l_rst50546."IVA recuperado" <> 0) then begin
                l_intR7 += 1;
                l_rst50546."No. mov." := l_intR7;
                l_rst50546.Insert;
                g_decIVARecuperado += l_rst50546."IVA recuperado";
                Clear(l_rst50546);
            end;
        end
        else begin
            if ((l_rst50546."IVA recuperado" > 0) and (l_rst50546."IVA para recupero" > 0)) or ((l_rst50546."IVA recuperado" < 0) and (l_rst50546."IVA para recupero" < 0)) then begin
                l_intR7 += 1;
                l_rst50546."No. mov." := l_intR7;
                l_rst50546.Insert;
                g_decIVARecuperado += l_rst50546."IVA recuperado";
            end;
        end;
    end;

    [Scope('OnPrem')]
    procedure fntExportarArchivoAFIP(l_rstRI: Record "Recupero IVA"; l_optArchivo: Option "Rubro 3","Rubro 7","Rubro 7 Despachos")
    var
        l_rst50547: Record "Recupero IVA Rubro 3";
        l_rst50547_agrupado: Record "Recupero IVA Rubro 3";
        l_rst50546: Record "Recupero IVA Rubro 7";
        l_rst50546_agrupado: Record "Recupero IVA Rubro 7";
        strArchivo: Text;
        strRetCualquiera2: Text;
        cdu419: Codeunit "File Management";
        strBPA: Text;
        cduCommonControl: Codeunit Mail;
        StreamInTest: OutStream;
        StreamInTestAlicuotas: OutStream;
        StreamInTestDespachos: OutStream;
        FileTest: File;
        strArchivoRubro3: Text;
        strArchivoRubro7: Text;
        strArchivoRubro7Desp: Text;
        Txt: Text;
        dlgDialogo: Dialog;
        i: Integer;
        strRetCualquiera3: Text;
        strVariable: array[1000] of Text;
        FileMgt: Codeunit "File Management";
        CrLf: Text;
        strDia: Text[2];
        strMes: Text[2];
        strAno: Text[4];
        l_codDoc: Code[20];
        l_intItem: Integer;
        l_posAr: Code[12];
        l_blnIgnorar: Boolean;
        l_rstPais: Record "Country/Region";
        l_rstPI: Record "Purch. Inv. Header";
        l_cduRegistroDiarios: Codeunit "Registro diarios";
    begin
        strArchivo := '';
        strRetCualquiera2 := '';

        Clear(cdu419);
        Clear(cduCommonControl);
        Clear(FileMgt);
        strArchivoRubro3 := FileMgt.ServerTempFileName(strArchivoRubro3);
        FileTest.TextMode(true);
        FileTest.Create(strArchivoRubro3);
        FileTest.CreateOutStream(StreamInTest);

        //++Archivo Alicuotas
        Clear(cdu419);
        Clear(cduCommonControl);
        Clear(FileMgt);

        Clear(dlgDialogo);
        dlgDialogo.Open('#1##################################');

        CrLf[1] := 13;
        CrLf[2] := 10;
        l_intItem := 1;
        Clear(l_rst50547);
        l_rst50547.SetCurrentKey(/*"Tipo de documento",*/"Numero de documento", "Posicion Arancelaria");
        l_rst50547.SetRange("No. registro recupero IVA", l_rstRI."No.");
        l_rst50547.SetRange("Expo o MI", l_rst50547."Expo o MI"::Expo);
        if l_rst50547.FindSet then
            repeat

                Clear(l_rst50547_agrupado);
                l_rst50547_agrupado.SetCurrentKey(/*"Tipo de documento",*/"Numero de documento", "Posicion Arancelaria");
                l_rst50547_agrupado.SetRange("No. registro recupero IVA", l_rst50547."No. registro recupero IVA");
                //l_rst50547_agrupado.SETRANGE("Tipo de documento",l_rst50547."Tipo de documento");
                l_rst50547_agrupado.SetRange("Numero de documento", l_rst50547."Numero de documento");
                l_rst50547_agrupado.SetRange("Posicion Arancelaria", l_rst50547."Posicion Arancelaria");
                l_rst50547_agrupado.CalcSums("Monto FOB en divisa origen", Cantidad);
                l_blnIgnorar := false;
                if l_rst50547_agrupado."Monto FOB en divisa origen" = 0 then
                    l_blnIgnorar := true;
                Txt := '';
                if l_codDoc = l_rst50547."Numero de documento" then begin
                    if l_posAr <> l_rst50547."Posicion Arancelaria" then begin
                        l_intItem += 1;
                        l_posAr := l_rst50547."Posicion Arancelaria";
                    end
                    else begin
                        //l_intItem += 1;
                        l_blnIgnorar := true;
                    end;
                end
                else begin
                    l_codDoc := l_rst50547."Numero de documento";
                    l_posAr := l_rst50547."Posicion Arancelaria";
                    l_intItem := 1;
                end;

                if not l_blnIgnorar then begin
                    for i := 1 to 12 do begin

                        case i of
                            1://1;1 Regimen Informado
                                strVariable[i] := Format('1');
                            2://2;3  Tipo de Documento de Exportación
                              //strVariable[i] := '10';
                                strVariable[i] := '05';
                            3://16;19  Número de Documento
                              //strVariable[i] := COPYSTR(fntEliminarLetras(l_rst50547."Numero de documento"),1,5)+fntNum(11,COPYSTR(l_rst50547."Numero de documento",STRPOS(l_rst50547."Numero de documento",'-')+1,16));
                                strVariable[i] := l_cduRegistroDiarios.fntAlfa(16, l_rst50547."Numero de documento");
                            4://4;23  Item
                                strVariable[i] := l_cduRegistroDiarios.fntNum(4, Format(l_intItem));
                            5://12;35  Posición Arancelaria
                                strVariable[i] := l_cduRegistroDiarios.fntAlfa(12, l_rst50547."Posicion Arancelaria");
                            6://2;37  Unidad de Medida
                                strVariable[i] := '01';
                            7://13;50 Cantidad
                                strVariable[i] := l_cduRegistroDiarios.fntDec(l_rst50547_agrupado.Cantidad, 4, 13);
                            8://15;65 Monto FOB en U$S
                                strVariable[i] := l_cduRegistroDiarios.fntDec(l_rst50547_agrupado."Monto FOB en divisa origen", 2, 15);
                            9://10;75 Tipo de Cambio
                                strVariable[i] := l_cduRegistroDiarios.fntDec(l_rst50547."Tipo de cambio", 6, 10);
                            10://3;78 Aduana de Registro
                                strVariable[i] := l_cduRegistroDiarios.fntNum(3, l_rst50547."Aduana de Registro");
                            11://3;81 Aduana de Salida
                                strVariable[i] := l_cduRegistroDiarios.fntNum(3, l_rst50547."Aduana de Salida");
                            12://8;89 Fecha Cumplido
                                begin
                                    strDia := Format(Date2DMY(l_rst50547."Fecha Cumplido", 1));
                                    if StrLen(strDia) = 1 then
                                        strDia := '0' + strDia;
                                    strMes := Format(Date2DMY(l_rst50547."Fecha Cumplido", 2));
                                    if StrLen(strMes) = 1 then
                                        strMes := '0' + strMes;
                                    strAno := Format(Date2DMY(l_rst50547."Fecha Cumplido", 3));
                                    strVariable[i] := strAno + strMes + strDia;
                                end;
                        end;
                    end;
                    for i := 1 to 12 do begin
                        Txt := Txt + strVariable[i];
                    end;

                    dlgDialogo.Update(1, Txt);

                    StreamInTest.WriteText(Txt +
                                           CrLf);

                end;

            until l_rst50547.Next = 0;

        dlgDialogo.Close;

        FileTest.Close();

        FileMgt.DownloadTempFile(strArchivoRubro3);

        FileMgt.DownloadHandler(strArchivoRubro3, 'Archivo Rubro 3', '', 'Archivos de texto (*.txt)|*.txt', strArchivo);

        //Rubro 7
        strArchivo := '';
        strRetCualquiera2 := '';
        Txt := '';

        Clear(cdu419);
        Clear(cduCommonControl);
        Clear(FileMgt);
        strArchivoRubro7 := FileMgt.ServerTempFileName(strArchivoRubro7);
        FileTest.TextMode(true);
        FileTest.Create(strArchivoRubro7);
        FileTest.CreateOutStream(StreamInTest);

        Clear(cdu419);
        Clear(cduCommonControl);
        Clear(FileMgt);

        Clear(dlgDialogo);
        dlgDialogo.Open('#1##################################');

        CrLf[1] := 13;
        CrLf[2] := 10;
        l_intItem := 1;
        Clear(l_rst50546);
        l_rst50546.SetCurrentKey("No. documento interno");
        l_rst50546.SetRange("No. registro recupero IVA", l_rstRI."No.");
        //Eliminar de este archivo los despachos de Importación
        l_rst50546.SetRange("Posicion Arancelaria", '');
        if l_rst50546.FindSet then
            repeat

                Clear(l_rst50546_agrupado);
                l_rst50546_agrupado.SetRange("No. registro recupero IVA", l_rst50546."No. registro recupero IVA");
                l_rst50546_agrupado.SetRange("No. documento interno", l_rst50546."No. documento interno");
                l_rst50546_agrupado.SetRange("Código de Régimen", l_rst50546."Código de Régimen");
                l_rst50546_agrupado.SetRange("Número de Certificado", l_rst50546."Número de Certificado");
                l_rst50546_agrupado.CalcSums(l_rst50546_agrupado."Importe Neto en $", l_rst50546_agrupado."Importe IVA Facturado en $", l_rst50546_agrupado."Importe IVA Computable vinc. a"
                                            , l_rst50546_agrupado."Importe IVA Computable", l_rst50546_agrupado."Monto IVA Retenido", l_rst50546_agrupado."IVA Depositado en CBU"
                                            , l_rst50546_agrupado."IVA para recupero", l_rst50546_agrupado."IVA recuperado");

                Txt := '';
                if l_codDoc = l_rst50546."Número de comprobante" then
                    l_intItem += 1
                else begin
                    l_codDoc := l_rst50546."Número de comprobante";
                    l_intItem := 0;
                end;
                if l_intItem = 0 then begin
                    for i := 1 to 24 do begin

                        case i of
                            1://1;3 Tipo de comprobante, según tabla
                                strVariable[i] := l_cduRegistroDiarios.fntNum(3, Format(l_rst50546."Tipo de comprobante"));
                            2://8;11  Fecha de comprobante
                                begin
                                    strDia := Format(Date2DMY(l_rst50546."Fecha de comprobante", 1));
                                    if StrLen(strDia) = 1 then
                                        strDia := '0' + strDia;
                                    strMes := Format(Date2DMY(l_rst50546."Fecha de comprobante", 2));
                                    if StrLen(strMes) = 1 then
                                        strMes := '0' + strMes;
                                    strAno := Format(Date2DMY(l_rst50546."Fecha de comprobante", 3));
                                    strVariable[i] := strAno + strMes + strDia;
                                end;
                            3://5;16  Punto de Venta
                                strVariable[i] := l_cduRegistroDiarios.fntNum(5, CopyStr(l_cduRegistroDiarios.fntEliminarLetras(CopyStr(l_rst50546."Número de comprobante", 1, StrPos(l_cduRegistroDiarios.fntEliminarLetras(l_rst50546."Número de comprobante"), '-'))), 1, 5));
                            4://16;32  Número de comprobante
                                strVariable[i] := l_cduRegistroDiarios.fntNum(16, CopyStr(l_rst50546."Número de comprobante", StrPos(l_rst50546."Número de comprobante", '-') + 1, 16));
                            5://11;43  CUIT Emisor
                                strVariable[i] := l_cduRegistroDiarios.fntNum(11, l_rst50546."CUIT Emisor");
                            6://40;83   Denominación Emisor
                                strVariable[i] := l_cduRegistroDiarios.fntAlfa(40, l_rst50546."Denominación emisor");
                            7://11;94 CUIT Vendedor
                                strVariable[i] := l_cduRegistroDiarios.fntNum(11,/*l_rst50546."CUIT Vendedor"*/'');
                            8://40;134 Denominación Vendedor
                                strVariable[i] := l_cduRegistroDiarios.fntAlfa(40,/*l_rst50546."Denominación vendedor"*/'');
                            9://15;149 Importe Neto en $
                                strVariable[i] := l_cduRegistroDiarios.fntDec(l_rst50546_agrupado."Importe Neto en $", 2, 15);
                            10://15;164 Importe IVA Facturado en $
                                strVariable[i] := l_cduRegistroDiarios.fntDec(l_rst50546_agrupado."Importe IVA Facturado en $", 2, 15);
                            11://15;179 Importe IVA Computable vinc.a Exp. De Servicios
                                strVariable[i] := l_cduRegistroDiarios.fntDec(l_rst50546_agrupado."Importe IVA Computable vinc. a", 2, 15);
                            12://15;194 Importe IVA Computable .
                               //strVariable[i] := fntDec(l_rst50546_agrupado."Importe IVA Computable",2,15);
                                strVariable[i] := l_cduRegistroDiarios.fntDec(l_rst50546_agrupado."IVA recuperado", 2, 15);
                            13://15;209 Monto IVA Retenido
                                strVariable[i] := l_cduRegistroDiarios.fntDec(l_rst50546."Monto IVA Retenido", 2, 15);
                            14://6;215 Período de Pago
                                begin
                                    strDia := Format(Date2DMY(l_rst50546."Período de Pago", 1));
                                    if StrLen(strDia) = 1 then
                                        strDia := '0' + strDia;
                                    strMes := Format(Date2DMY(l_rst50546."Período de Pago", 2));
                                    if StrLen(strMes) = 1 then
                                        strMes := '0' + strMes;
                                    strAno := Format(Date2DMY(l_rst50546."Período de Pago", 3));
                                    strVariable[i] := strAno + strMes;
                                end;
                            15://6;221 Período DDJJ
                                begin
                                    strDia := Format(Date2DMY(l_rst50546."Período DDJJ", 1));
                                    if StrLen(strDia) = 1 then
                                        strDia := '0' + strDia;
                                    strMes := Format(Date2DMY(l_rst50546."Período DDJJ", 2));
                                    if StrLen(strMes) = 1 then
                                        strMes := '0' + strMes;
                                    strAno := Format(Date2DMY(l_rst50546."Período DDJJ", 3));
                                    strVariable[i] := strAno + strMes;
                                end;
                            16://40;261 Descripción del Bien
                               //strVariable[i] := l_cduRegistroDiarios.fntAlfa(40,l_rst50546."Descripción del Bien");
                                strVariable[i] := l_cduRegistroDiarios.fntAlfa(40, l_rst50546."Descripción contable");
                            17://15;276 IVA Depositado en CBU
                                strVariable[i] := l_cduRegistroDiarios.fntDec(l_rst50546_agrupado."IVA Depositado en CBU", 2, 15);
                            18://3;279 Código de Régimen
                                strVariable[i] := l_cduRegistroDiarios.fntAlfa(3, l_rst50546."Código de Régimen");
                            19://14;293 Número de Certificado
                                strVariable[i] := l_cduRegistroDiarios.fntNum(14, DelChr(l_rst50546."Número de Certificado", '=', '-'));
                            20://1;294 Motivo de no retención
                                begin
                                    if l_rst50546."Motivo de no retención" = '0' then
                                        strVariable[i] := l_cduRegistroDiarios.fntNum(1, '0')
                                    else
                                        strVariable[i] := l_cduRegistroDiarios.fntNum(1, l_rst50546."Motivo de no retención");
                                end;
                            21://2;296 R.G. Certificado de exclusión
                                strVariable[i] := l_cduRegistroDiarios.fntNum(2, l_rst50546."R.G. Certificado de exclusión");
                            22://20;316 Medios de Pago
                                strVariable[i] := l_cduRegistroDiarios.fntAlfa(20, l_rst50546."Medios de Pago");
                            23://3;319 Tipo de Rubro 7
                                strVariable[i] := l_cduRegistroDiarios.fntNum(3, l_rst50546."Tipo de Rubro 7");
                            24://1;320 Identifica el tipo de Crédito Fiscal
                                strVariable[i] := l_cduRegistroDiarios.fntAlfa(1, Format(l_rst50546."Tipo de afectacion"));
                        end;
                    end;
                    for i := 1 to 24 do begin
                        Txt := Txt + strVariable[i];
                    end;

                    dlgDialogo.Update(1, Txt);

                    StreamInTest.WriteText(Txt +
                                           CrLf);

                end;
            until l_rst50546.Next = 0;

        dlgDialogo.Close;

        FileTest.Close();

        FileMgt.DownloadTempFile(strArchivoRubro7);

        FileMgt.DownloadHandler(strArchivoRubro7, 'Archivo Rubro 3', strArchivo, 'Archivos de texto (*.txt)|*.txt', strArchivo);


        //Rubro 7 - Despachos Importación
        strArchivo := '';
        strRetCualquiera2 := '';
        Txt := '';

        Clear(cdu419);
        Clear(cduCommonControl);
        Clear(FileMgt);
        strArchivoRubro7Desp := FileMgt.ServerTempFileName(strArchivoRubro7Desp);
        FileTest.TextMode(true);
        FileTest.Create(strArchivoRubro7Desp);
        FileTest.CreateOutStream(StreamInTest);

        Clear(cdu419);
        Clear(cduCommonControl);
        Clear(FileMgt);

        Clear(dlgDialogo);
        dlgDialogo.Open('#1##################################');

        CrLf[1] := 13;
        CrLf[2] := 10;
        l_intItem := 1;
        Clear(l_rst50546);
        l_rst50546.SetCurrentKey("No. documento interno");
        l_rst50546.SetRange("No. registro recupero IVA", l_rstRI."No.");
        //Eliminar de este archivo los despachos de Importación
        l_rst50546.SetFilter("Posicion Arancelaria", '<>%1', '');
        if l_rst50546.FindSet then
            repeat
                Clear(l_rst50546_agrupado);
                l_rst50546_agrupado.SetRange("No. registro recupero IVA", l_rst50546."No. registro recupero IVA");
                l_rst50546_agrupado.SetRange("No. documento interno", l_rst50546."No. documento interno");
                l_rst50546_agrupado.SetRange("Código de Régimen", l_rst50546."Código de Régimen");
                l_rst50546_agrupado.SetRange("Número de Certificado", l_rst50546."Número de Certificado");
                l_rst50546_agrupado.SetRange("Posicion Arancelaria", l_rst50546."Posicion Arancelaria");
                l_rst50546_agrupado.CalcSums(l_rst50546_agrupado."Importe Neto en $", l_rst50546_agrupado."Importe IVA Facturado en $", l_rst50546_agrupado."Importe IVA Computable vinc. a"
                                            , l_rst50546_agrupado."Importe IVA Computable", l_rst50546_agrupado."Monto IVA Retenido", l_rst50546_agrupado."IVA Depositado en CBU"
                                            , l_rst50546_agrupado."IVA para recupero", l_rst50546_agrupado."IVA recuperado");
                Txt := '';
                if l_codDoc = l_rst50546."Número de comprobante" then
                    l_intItem += 1
                else begin
                    l_codDoc := l_rst50546."Número de comprobante";
                    l_intItem := 0;
                end;
                if l_intItem = 0 then begin
                    for i := 1 to 24 do begin

                        case i of
                            1://8;8  Fecha de comprobante
                                begin
                                    strDia := Format(Date2DMY(l_rst50546."Fecha de comprobante", 1));
                                    if StrLen(strDia) = 1 then
                                        strDia := '0' + strDia;
                                    strMes := Format(Date2DMY(l_rst50546."Fecha de comprobante", 2));
                                    if StrLen(strMes) = 1 then
                                        strMes := '0' + strMes;
                                    strAno := Format(Date2DMY(l_rst50546."Fecha de comprobante", 3));
                                    strVariable[i] := strAno + strMes + strDia;
                                end;
                            2://9;16  Número de despacho
                                strVariable[i] := l_cduRegistroDiarios.fntAlfa(16, l_rst50546."Número de comprobante");
                            3://25;12  Posición arancelaria
                                strVariable[i] := l_cduRegistroDiarios.fntAlfa(12, l_rst50546."Posicion Arancelaria");
                            4://37;4  Item
                                strVariable[i] := l_cduRegistroDiarios.fntNum(4, '1');
                            5://41;11   CUIT del país de origen
                                begin
                                    Clear(l_rstPI);
                                    l_rstPI.Get(l_rst50546."No. documento interno");
                                    Clear(l_rstPais);
                                    l_rstPais.SetRange(Code, l_rstPI."Buy-from Country/Region Code");
                                    l_rstPais.FindSet;
                                    strVariable[i] := l_cduRegistroDiarios.fntAlfa(11, l_rstPais."EU Country/Region Code");
                                end;
                            6://52;50 Denominación del país
                                begin
                                    Clear(l_rstPI);
                                    l_rstPI.Get(l_rst50546."No. documento interno");
                                    Clear(l_rstPais);
                                    l_rstPais.SetRange(Code, l_rstPI."Buy-from Country/Region Code");
                                    l_rstPais.FindSet;
                                    strVariable[i] := l_cduRegistroDiarios.fntAlfa(50, l_rstPais.Name);
                                end;
                            7://102;15 Imp. Total IVA del Despacho (no del item)
                                strVariable[i] := l_cduRegistroDiarios.fntDec(l_rst50546_agrupado."Importe IVA Facturado en $", 2, 15);
                            8://117;15 Importe IVA Computable vinc.a Exp. De Servicios
                                strVariable[i] := l_cduRegistroDiarios.fntDec(0, 2, 15);
                            9://132;15 Importe IVA Computable
                                strVariable[i] := l_cduRegistroDiarios.fntDec(l_rst50546_agrupado."IVA recuperado", 2, 15);
                            10://147;6 Período DDJJ
                                begin
                                    strDia := Format(Date2DMY(l_rst50546."Período DDJJ", 1));
                                    if StrLen(strDia) = 1 then
                                        strDia := '0' + strDia;
                                    strMes := Format(Date2DMY(l_rst50546."Período DDJJ", 2));
                                    if StrLen(strMes) = 1 then
                                        strMes := '0' + strMes;
                                    strAno := Format(Date2DMY(l_rst50546."Período DDJJ", 3));
                                    strVariable[i] := strAno + strMes;
                                end;
                            11://153;1 Identifica el tipo de Crédito Fiscal
                                strVariable[i] := l_cduRegistroDiarios.fntAlfa(1, Format(l_rst50546."Tipo de afectacion"));
                        end;
                    end;
                    for i := 1 to 11 do begin
                        Txt := Txt + strVariable[i];
                    end;

                    dlgDialogo.Update(1, Txt);

                    StreamInTest.WriteText(Txt +
                                           CrLf);

                end;
            until l_rst50546.Next = 0;

        dlgDialogo.Close;

        FileTest.Close();
        if StrLen(Txt) <> 0 then begin
            FileMgt.DownloadTempFile(strArchivoRubro7Desp);
            FileMgt.DownloadHandler(strArchivoRubro7Desp, 'Archivo Rubro 7 - Despachos', '', 'Archivos de texto (*.txt)|*.txt', strArchivo);
        end;

    end;

    [Scope('OnPrem')]
    procedure fntExportarArchivoAFIP_SIR(l_rstRI: Record "Recupero IVA"; l_optArchivo: Option "Rubro 3",Rubro7,"Rubro 7 Despachos")
    var
        l_rst50547: Record "Recupero IVA Rubro 3";
        l_rst50547_agrupado: Record "Recupero IVA Rubro 3";
        l_rst50546: Record "Recupero IVA Rubro 7";
        l_rst50546_agrupado: Record "Recupero IVA Rubro 7";
        strArchivo: Text;
        strRetCualquiera2: Text;
        cdu419: Codeunit "File Management";
        strBPA: Text;
        cduCommonControl: Codeunit Mail;
        StreamInTest: OutStream;
        StreamInTestAlicuotas: OutStream;
        StreamInTestDespachos: OutStream;
        FileTest: File;
        strArchivoRubro3: Text;
        strArchivoRubro7: Text;
        strArchivoRubro7Desp: Text;
        Txt: Text;
        dlgDialogo: Dialog;
        i: Integer;
        strRetCualquiera3: Text;
        strVariable: array[1000] of Text;
        FileMgt: Codeunit "File Management";
        CrLf: Text;
        strDia: Text[2];
        strMes: Text[2];
        strAno: Text[4];
        l_codDoc: Code[20];
        l_intItem: Integer;
        l_posAr: Code[12];
        l_blnIgnorar: Boolean;
        l_rstPais: Record "Country/Region";
        l_rstPI: Record "Purch. Inv. Header";
        l_rstTN: Record "Tariff Number";
        l_rstPPS: Record "Purchases & Payables Setup";
        l_rstV: Record Vendor;
        l_cduRegistroDiarios: Codeunit "Registro diarios";
    begin
        strArchivo := '';
        strRetCualquiera2 := '';

        Clear(cdu419);
        Clear(cduCommonControl);
        Clear(FileMgt);
        strArchivoRubro3 := FileMgt.ServerTempFileName(strArchivoRubro3);
        FileTest.TextMode(true);
        FileTest.Create(strArchivoRubro3);
        FileTest.CreateOutStream(StreamInTest);

        //++Archivo Alicuotas
        Clear(cdu419);
        Clear(cduCommonControl);
        Clear(FileMgt);

        Clear(dlgDialogo);
        dlgDialogo.Open('#1##################################');

        CrLf[1] := 13;
        CrLf[2] := 10;
        l_intItem := 1;
        Clear(l_rst50547);
        l_rst50547.SetCurrentKey("Tipo de documento", "Numero de documento", "Posicion Arancelaria");
        l_rst50547.SetRange("No. registro recupero IVA", l_rstRI."No.");
        l_rst50547.SetRange("Expo o MI", l_rst50547."Expo o MI"::Expo);
        if l_rst50547.FindSet then
            repeat

                Clear(l_rst50547_agrupado);
                l_rst50547_agrupado.SetCurrentKey("Tipo de documento", "Numero de documento", "Posicion Arancelaria");
                l_rst50547_agrupado.SetRange("No. registro recupero IVA", l_rst50547."No. registro recupero IVA");
                l_rst50547_agrupado.SetRange("Tipo de documento", l_rst50547."Tipo de documento");
                l_rst50547_agrupado.SetRange("Numero de documento", l_rst50547."Numero de documento");
                l_rst50547_agrupado.SetRange("Posicion Arancelaria", l_rst50547."Posicion Arancelaria");
                l_rst50547_agrupado.CalcSums("Monto FOB en divisa origen", Cantidad);
                l_blnIgnorar := false;
                Txt := '';
                if l_codDoc = l_rst50547."Numero de documento" then begin
                    if l_posAr <> l_rst50547."Posicion Arancelaria" then begin
                        l_intItem += 1;
                        l_posAr := l_rst50547."Posicion Arancelaria";
                    end
                    else begin
                        //l_intItem += 1;
                        l_blnIgnorar := true;
                    end;
                end
                else begin
                    l_codDoc := l_rst50547."Numero de documento";
                    l_posAr := l_rst50547."Posicion Arancelaria";
                    l_intItem := 1;
                end;

                if not l_blnIgnorar then begin
                    for i := 1 to 12 do begin

                        case i of
                            1://1;10  Tipo de Documento de Exportación
                              //strVariable[i] := '10';
                                strVariable[i] := '524';
                            2://11;16  Número de Documento
                              //strVariable[i] := COPYSTR(fntEliminarLetras(l_rst50547."Numero de documento"),1,5)+fntNum(11,COPYSTR(l_rst50547."Numero de documento",STRPOS(l_rst50547."Numero de documento",'-')+1,16));
                                strVariable[i] := l_cduRegistroDiarios.fntAlfa(16, l_rst50547."Numero de documento");
                            3://27;4  Item
                                strVariable[i] := l_cduRegistroDiarios.fntNum(4, Format(l_intItem));
                            4://31;12  Posición Arancelaria
                                strVariable[i] := l_cduRegistroDiarios.fntAlfa(12, l_rst50547."Posicion Arancelaria");
                            5://43;  Unidad de Medida
                                strVariable[i] := '01';
                            6://13;50 Cantidad
                                strVariable[i] := l_cduRegistroDiarios.fntDecConPunto(l_rst50547_agrupado.Cantidad, 4, 9);
                            7://15;65 Monto FOB en U$S
                                strVariable[i] := l_cduRegistroDiarios.fntDecConPunto(l_rst50547_agrupado."Monto FOB en divisa origen", 2, 13);
                            8://Monto en U$S de bienes importados temporariamente
                                strVariable[i] := '0';
                            9://10;75 Tipo de Cambio
                                strVariable[i] := l_cduRegistroDiarios.fntDecConPunto(l_rst50547."Tipo de cambio", 6, 4);
                            10://3;78 Aduana de Registro
                                strVariable[i] := l_cduRegistroDiarios.fntNum(3, l_rst50547."Aduana de Registro");
                            11://8;89 Fecha Cumplido
                                begin
                                    strDia := Format(Date2DMY(l_rst50547."Fecha Cumplido", 1));
                                    if StrLen(strDia) = 1 then
                                        strDia := '0' + strDia;
                                    strMes := Format(Date2DMY(l_rst50547."Fecha Cumplido", 2));
                                    if StrLen(strMes) = 1 then
                                        strMes := '0' + strMes;
                                    strAno := Format(Date2DMY(l_rst50547."Fecha Cumplido", 3));
                                    strVariable[i] := strDia + '/' + strMes + '/' + strAno;
                                end;
                            12://3;81 Fecha fin carga
                                begin
                                    strDia := Format(Date2DMY(l_rst50547."Fecha Cumplido", 1));
                                    if StrLen(strDia) = 1 then
                                        strDia := '0' + strDia;
                                    strMes := Format(Date2DMY(l_rst50547."Fecha Cumplido", 2));
                                    if StrLen(strMes) = 1 then
                                        strMes := '0' + strMes;
                                    strAno := Format(Date2DMY(l_rst50547."Fecha Cumplido", 3));
                                    strVariable[i] := strDia + '/' + strMes + '/' + strAno;
                                end;
                        end;
                    end;
                    for i := 1 to 12 do begin
                        if i < 12 then
                            Txt := Txt + strVariable[i] + ';'
                        else
                            Txt := Txt + strVariable[i];
                    end;

                    dlgDialogo.Update(1, Txt);

                    StreamInTest.WriteText(Txt +
                                           CrLf);

                end;

            until l_rst50547.Next = 0;

        dlgDialogo.Close;

        FileTest.Close();

        FileMgt.DownloadTempFile(strArchivoRubro3);
        FileMgt.DownloadHandler(strArchivoRubro3, 'Archivo Rubro 3', '', 'Archivos de texto (*.txt)|*.txt', strArchivo);

        //Rubro 7
        strArchivo := '';
        strRetCualquiera2 := '';
        Txt := '';

        Clear(cdu419);
        Clear(cduCommonControl);
        Clear(FileMgt);
        strArchivoRubro7 := FileMgt.ServerTempFileName(strArchivoRubro7);
        FileTest.TextMode(true);
        FileTest.Create(strArchivoRubro7);
        FileTest.CreateOutStream(StreamInTest);

        Clear(cdu419);
        Clear(cduCommonControl);
        Clear(FileMgt);

        Clear(dlgDialogo);
        dlgDialogo.Open('#1##################################');

        CrLf[1] := 13;
        CrLf[2] := 10;
        l_intItem := 1;
        Clear(l_rst50546);
        l_rst50546.SetCurrentKey("No. documento interno");
        l_rst50546.SetRange("No. registro recupero IVA", l_rstRI."No.");
        //Eliminar de este archivo los despachos de Importación
        l_rst50546.SetRange("Posicion Arancelaria", '');
        if l_rst50546.FindSet then
            repeat

                Clear(l_rst50546_agrupado);
                l_rst50546_agrupado.SetRange("No. registro recupero IVA", l_rst50546."No. registro recupero IVA");
                l_rst50546_agrupado.SetRange("No. documento interno", l_rst50546."No. documento interno");
                l_rst50546_agrupado.SetRange("Código de Régimen", l_rst50546."Código de Régimen");
                l_rst50546_agrupado.SetRange("Número de Certificado", l_rst50546."Número de Certificado");
                l_rst50546_agrupado.CalcSums(l_rst50546_agrupado."Importe Neto en $", l_rst50546_agrupado."Importe IVA Facturado en $", l_rst50546_agrupado."Importe IVA Computable vinc. a"
                                            , l_rst50546_agrupado."Importe IVA Computable", l_rst50546_agrupado."Monto IVA Retenido", l_rst50546_agrupado."IVA Depositado en CBU"
                                            , l_rst50546_agrupado."IVA para recupero", l_rst50546_agrupado."IVA recuperado");

                Txt := '';
                if l_codDoc = l_rst50546."Número de comprobante" then
                    l_intItem += 1
                else begin
                    l_codDoc := l_rst50546."Número de comprobante";
                    l_intItem := 0;
                end;
                if l_intItem = 0 then begin
                    for i := 1 to 19 do begin

                        case i of
                            1://1;3 Tipo de comprobante, según tabla
                                strVariable[i] := l_cduRegistroDiarios.fntNum(3, Format(l_rst50546."Tipo de comprobante"));
                            2://5;16  Punto de Venta
                                strVariable[i] := l_cduRegistroDiarios.fntNum(5, CopyStr(l_cduRegistroDiarios.fntEliminarLetras(CopyStr(l_rst50546."Número de comprobante", 1, StrPos(l_cduRegistroDiarios.fntEliminarLetras(l_rst50546."Número de comprobante"), '-'))), 1, 5));
                            3://16;32  Número de comprobante
                                strVariable[i] := l_cduRegistroDiarios.fntNum(16, CopyStr(l_rst50546."Número de comprobante", StrPos(l_rst50546."Número de comprobante", '-') + 1, 16));
                            4://11;43  CUIT Emisor
                                strVariable[i] := l_cduRegistroDiarios.fntNum(11, l_rst50546."CUIT Emisor");
                            5://11;94 CUIT Vendedor
                                strVariable[i] := l_cduRegistroDiarios.fntNum(11,/*l_rst50546."CUIT Vendedor"*/'');
                            6://40;261 Descripción del Bien
                                strVariable[i] := l_cduRegistroDiarios.fntAlfa(40, l_rst50546."Descripción del Bien");
                            7://15;164 Importe IVA Facturado en $
                                strVariable[i] := l_cduRegistroDiarios.fntDecConPunto(l_rst50546_agrupado."Importe IVA Facturado en $", 2, 13);
                            8://15;149 Importe Neto en $
                                strVariable[i] := l_cduRegistroDiarios.fntDecConPunto(l_rst50546_agrupado."Importe Neto en $", 2, 13);
                            9://15;194 Importe IVA Computable .
                              //strVariable[i] := fntDec(l_rst50546_agrupado."Importe IVA Computable",2,15);
                                strVariable[i] := l_cduRegistroDiarios.fntDecConPunto(l_rst50546_agrupado."IVA recuperado", 2, 13);
                            10://Signo comprobante
                                strVariable[i] := '+';
                            11://6;221 Período DDJJ
                                begin
                                    strDia := Format(Date2DMY(l_rst50546."Período DDJJ", 1));
                                    if StrLen(strDia) = 1 then
                                        strDia := '0' + strDia;
                                    strMes := Format(Date2DMY(l_rst50546."Período DDJJ", 2));
                                    if StrLen(strMes) = 1 then
                                        strMes := '0' + strMes;
                                    strAno := Format(Date2DMY(l_rst50546."Período DDJJ", 3));
                                    strVariable[i] := strAno + strMes;
                                end;
                            12://6;215 Período de Pago
                                begin
                                    strDia := Format(Date2DMY(l_rst50546."Período de Pago", 1));
                                    if StrLen(strDia) = 1 then
                                        strDia := '0' + strDia;
                                    strMes := Format(Date2DMY(l_rst50546."Período de Pago", 2));
                                    if StrLen(strMes) = 1 then
                                        strMes := '0' + strMes;
                                    strAno := Format(Date2DMY(l_rst50546."Período de Pago", 3));
                                    strVariable[i] := strAno + strMes;
                                end;
                            13://20;316 Medios de Pago
                                strVariable[i] := l_cduRegistroDiarios.fntAlfa(20, l_rst50546."Medios de Pago");
                            14://1;320 Identifica el tipo de Crédito Fiscal
                                strVariable[i] := l_cduRegistroDiarios.fntAlfa(1, Format(l_rst50546."Tipo de afectacion"));
                            15://14;293 Número de Certificado SIRE
                                strVariable[i] := '';
                            16://14;293 Número de Certificado SICORE
                                strVariable[i] := ''/*fntNum(14,DELCHR(l_rst50546."Número de Certificado",'=','-'))*/;
                            17://15;209 Monto IVA Retenido
                                begin
                                    if l_rst50546."Monto IVA Retenido" <> 0 then
                                        strVariable[i] := l_cduRegistroDiarios.fntDecConPunto(l_rst50546."Monto IVA Retenido", 2, 15)
                                    else
                                        strVariable[i] := '';
                                end;
                            18://Motivo no retención
                                begin
                                    if l_rst50546."Monto IVA Retenido" <> 0 then
                                        strVariable[i] := ''
                                    else
                                        strVariable[i] := l_rst50546."Motivo de no retención";
                                end;
                            19://8;11  Fecha de comprobante
                                begin
                                    strDia := Format(Date2DMY(l_rst50546."Fecha de comprobante", 1));
                                    if StrLen(strDia) = 1 then
                                        strDia := '0' + strDia;
                                    strMes := Format(Date2DMY(l_rst50546."Fecha de comprobante", 2));
                                    if StrLen(strMes) = 1 then
                                        strMes := '0' + strMes;
                                    strAno := Format(Date2DMY(l_rst50546."Fecha de comprobante", 3));
                                    strVariable[i] := strDia + '/' + strMes + '/' + strAno;
                                end;
                        end;
                    end;
                    for i := 1 to 19 do begin
                        if i < 19 then
                            Txt := Txt + strVariable[i] + ';'
                        else
                            Txt := Txt + strVariable[i];
                    end;

                    dlgDialogo.Update(1, Txt);

                    StreamInTest.WriteText(Txt +
                                           CrLf);

                end;
            until l_rst50546.Next = 0;

        dlgDialogo.Close;

        FileTest.Close();

        FileMgt.DownloadTempFile(strArchivoRubro7);

        FileMgt.DownloadHandler(strArchivoRubro7, 'Archivo Rubro 7', '', 'Archivos de texto (*.txt)|*.txt', strArchivo);

        //Rubro 7 - Despachos Importación
        strArchivo := '';
        strRetCualquiera2 := '';
        Txt := '';

        Clear(cdu419);
        Clear(cduCommonControl);
        Clear(FileMgt);
        strArchivoRubro7Desp := FileMgt.ServerTempFileName(strArchivoRubro7Desp);
        FileTest.TextMode(true);
        FileTest.Create(strArchivoRubro7Desp);
        FileTest.CreateOutStream(StreamInTest);

        Clear(cdu419);
        Clear(cduCommonControl);
        Clear(FileMgt);

        Clear(dlgDialogo);
        dlgDialogo.Open('#1##################################');

        CrLf[1] := 13;
        CrLf[2] := 10;
        l_intItem := 1;
        Clear(l_rstPPS);
        l_rstPPS.Get();

        Clear(l_rst50546);
        l_rst50546.SetCurrentKey("No. documento interno");
        l_rst50546.SetRange("No. registro recupero IVA", l_rstRI."No.");
        //Eliminar de este archivo los despachos de Importación
        l_rst50546.SetFilter("Posicion Arancelaria", '<>%1', '');
        if l_rst50546.FindSet then
            repeat
                Clear(l_rstV);
                if StrLen(l_rst50546."CUIT Emisor") > 10 then
                    l_rstV.Get(CopyStr(l_rst50546."CUIT Emisor", 1, 10))
                else
                    l_rstV.Get(l_rst50546."CUIT Emisor");
                if l_rstPPS."Grupo Contable Importaciones" = l_rstV."Vendor Posting Group" then begin
                    Clear(l_rst50546_agrupado);
                    l_rst50546_agrupado.SetRange("No. registro recupero IVA", l_rst50546."No. registro recupero IVA");
                    l_rst50546_agrupado.SetRange("No. documento interno", l_rst50546."No. documento interno");
                    l_rst50546_agrupado.SetRange("Código de Régimen", l_rst50546."Código de Régimen");
                    l_rst50546_agrupado.SetRange("Número de Certificado", l_rst50546."Número de Certificado");
                    l_rst50546_agrupado.SetRange("Posicion Arancelaria", l_rst50546."Posicion Arancelaria");
                    l_rst50546_agrupado.CalcSums(l_rst50546_agrupado."Importe Neto en $", l_rst50546_agrupado."Importe IVA Facturado en $", l_rst50546_agrupado."Importe IVA Computable vinc. a"
                                                , l_rst50546_agrupado."Importe IVA Computable", l_rst50546_agrupado."Monto IVA Retenido", l_rst50546_agrupado."IVA Depositado en CBU"
                                                , l_rst50546_agrupado."IVA para recupero", l_rst50546_agrupado."IVA recuperado");
                    Txt := '';
                    if l_codDoc = l_rst50546."Número de comprobante" then
                        l_intItem += 1
                    else begin
                        l_codDoc := l_rst50546."Número de comprobante";
                        l_intItem := 0;
                    end;
                    if l_intItem = 0 then begin
                        for i := 1 to 10 do begin

                            case i of
                                1://1;3 Tipo de comprobante, según tabla
                                    strVariable[i] := l_cduRegistroDiarios.fntNum(3, Format(l_rst50546."Tipo de comprobante"));
                                2://8;8  Fecha de comprobante
                                    begin
                                        strDia := Format(Date2DMY(l_rst50546."Fecha de comprobante", 1));
                                        if StrLen(strDia) = 1 then
                                            strDia := '0' + strDia;
                                        strMes := Format(Date2DMY(l_rst50546."Fecha de comprobante", 2));
                                        if StrLen(strMes) = 1 then
                                            strMes := '0' + strMes;
                                        strAno := Format(Date2DMY(l_rst50546."Fecha de comprobante", 3));
                                        strVariable[i] := strAno + strMes + strDia;
                                    end;
                                3://9;16  Número de despacho
                                    strVariable[i] := l_cduRegistroDiarios.fntAlfa(16, l_rst50546."Número de comprobante");
                                4://37;4  Item
                                    strVariable[i] := l_cduRegistroDiarios.fntNum(4, '1');
                                5://25;12  Posición arancelaria
                                    strVariable[i] := l_cduRegistroDiarios.fntAlfa(12, l_rst50546."Posicion Arancelaria");
                                6://Descripción posición arancelaria
                                    begin
                                        Clear(l_rstTN);
                                        l_rstTN.Get(l_rst50546."Posicion Arancelaria");
                                        strVariable[i] := l_rstTN.Description;
                                    end;
                                7://102;15 Imp. Total IVA del Despacho (no del item)
                                    strVariable[i] := l_cduRegistroDiarios.fntDec(l_rst50546_agrupado."Importe IVA Facturado en $", 2, 15);
                                8://132;15 Importe IVA Computable
                                    strVariable[i] := l_cduRegistroDiarios.fntDec(l_rst50546_agrupado."IVA recuperado", 2, 15);
                                9://147;6 Período DDJJ
                                    begin
                                        strDia := Format(Date2DMY(l_rst50546."Período DDJJ", 1));
                                        if StrLen(strDia) = 1 then
                                            strDia := '0' + strDia;
                                        strMes := Format(Date2DMY(l_rst50546."Período DDJJ", 2));
                                        if StrLen(strMes) = 1 then
                                            strMes := '0' + strMes;
                                        strAno := Format(Date2DMY(l_rst50546."Período DDJJ", 3));
                                        strVariable[i] := strAno + strMes;
                                    end;
                                10://153;1 Identifica el tipo de Crédito Fiscal
                                    strVariable[i] := l_cduRegistroDiarios.fntAlfa(1, Format(l_rst50546."Tipo de afectacion"));
                            end;
                        end;
                        for i := 1 to 10 do begin
                            if i < 19 then
                                Txt := Txt + strVariable[i] + ';'
                            else
                                Txt := Txt + strVariable[i];
                        end;

                        dlgDialogo.Update(1, Txt);

                        StreamInTest.WriteText(Txt +
                                               CrLf);

                    end;
                end;
            until l_rst50546.Next = 0;

        dlgDialogo.Close;

        FileTest.Close();
        if StrLen(Txt) <> 0 then begin
            FileMgt.DownloadTempFile(strArchivoRubro7Desp);
            FileMgt.DownloadHandler(strArchivoRubro7Desp, 'Archivo Rubro 7 - Despachos', '', 'Archivos de texto (*.txt)|*.txt', strArchivo);
        end;

    end;

    local procedure fntBuscarUltimoR7(): Integer
    var
        l_rst50546: Record "Recupero IVA Rubro 7";
    begin
        Clear(l_rst50546);
        if l_rst50546.FindLast then
            exit(l_rst50546."No. mov.");
    end;

    local procedure fntAgenteRetencionIVA(): Boolean
    var
        l_rstCI: Record "Company Information";
    begin
        Clear(l_rstCI);
        l_rstCI.Get();
        exit(l_rstCI."Ag. Retencion IVA");
    end;

}