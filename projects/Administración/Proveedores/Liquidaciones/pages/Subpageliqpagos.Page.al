page 50672 "Subpage liq. pagos"
{
    PageType = ListPart;
    RefreshOnActivate = true;
    SourceTable = "Vendor Ledger Entry";

    layout
    {
        area(content)
        {
            field(optLP; optLP)
            {
                OptionCaption = ' ,BUE,CRV,PD';

                trigger OnValidate()
                begin
                    SetFilter("Lugar de Pago", '%1|%2', 0, optLP);
                    if optLP = 0 then
                        SetFilter("Lugar de Pago", '');
                    CurrPage.Update(false);
                    if FindFirst then;
                end;
            }
            repeater(Group)
            {
                field("Entry No."; "Entry No.")
                {
                }
                field("Vendor No."; "Vendor No.")
                {

                    trigger OnDrillDown()
                    begin
                        Matrix_OnDrilldown;
                    end;
                }
                field("rstProv.Name"; rstProv.Name)
                {
                    Caption = 'Nombre';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        rstMovProv: Record "Vendor Ledger Entry";
                        decImporteReg: Decimal;
                        decImporteDeuda: Decimal;
                        decImporte: Decimal;
                        rstPlazo: Record Installment;
                        decCuota: Decimal;
                        rstMovLiq: Record "Lín. Liquidacion Pagos";
                        rstTPago: Record "Payment Terms";
                    begin
                        if codLiquidacion = '' then
                            GetLiq;

                        if VerificarProveedorEnLiquidacion(Rec) then begin
                            EliminarProveedorLiquidacion(Rec);
                            CurrPage.Update(false);
                            exit;
                        end;

                        h := 0;
                        Clear(rstMovProv);
                        rstMovProv.CopyFilters(Rec);
                        rstMovProv.SetRange("Vendor No.", "Vendor No.");
                        if rstMovProv.Find('-') then
                            repeat

                                decImporte := 0;
                                decImporteReg := 0;
                                decCuota := 0;
                                decImporteDeuda := 0;

                                Clear(rstTPago);
                                if rstTPago.Get("Cód. condición pago") then begin

                                    rstTPago.CalcFields(rstTPago."No. of Installments");
                                    if rstTPago."No. of Installments" > 0 then begin

                                        with rstMovProv do begin

                                            CalcFields(Amount, "Remaining Amount");
                                            decImporte := (Amount) - ("Remaining Amount");   // importe pagado
                                            decImporteReg := 0;

                                            Clear(rstPlazo);
                                            rstPlazo.SetRange(rstPlazo."Payment Terms Code", rstTPago.Code);
                                            if rstPlazo.Find('-') then
                                                repeat

                                                    h += 1;
                                                    decCuota := Amount * rstPlazo."% of Total" / 100;
                                                    if Abs(decCuota) > Abs(decImporte) then begin

                                                        decImporteReg := (decCuota - (decImporte));
                                                        decImporte := 0;

                                                    end
                                                    else begin

                                                        decImporte := decImporte - decCuota;
                                                        decImporteReg := 0;

                                                    end;

                                                    decImporteDeuda := decImporteReg;

                                                    Clear(rstMovLiq);
                                                    if rstMovLiq.Get(codLiquidacion, datInicialDef, rstMovProv."Entry No.") then
                                                        EliminarProveedorLiquidacion(rstMovProv);

                                                    if rstMovLiq."No. mov." = 0 then begin

                                                        rstMovLiq."No. Liquidacion" := codLiquidacion;
                                                        rstMovLiq."No. mov." := rstMovProv."Entry No.";
                                                        rstMovLiq."No. proveedor" := rstMovProv."Vendor No.";
                                                        rstMovLiq."No. documento" := rstMovProv."Document No.";
                                                        rstMovLiq."No. documento externo" := rstMovProv."External Document No.";
                                                        rstMovLiq."Fecha registro" := rstMovProv."Posting Date";
                                                        rstMovLiq."Fecha vencimiento" := fntCalcFVentoInc(rstMovProv."Document Date",
                                                                                                         rstMovProv."Cód. condición pago");
                                                        rstMovLiq."Cód. divisa" := rstMovProv."Currency Code";
                                                        rstMovLiq.Importe := rstMovProv.Amount;
                                                        rstMovLiq."Importe a pagar" := decImporteDeuda;
                                                        rstMovLiq."Importe pendiente" := rstMovProv."Remaining Amount";
                                                        rstMovLiq."Fecha pago" := WorkDate;
                                                        rstMovLiq.Insert;

                                                    end
                                                    else begin

                                                        rstMovLiq.Delete;

                                                    end;

                                                until rstPlazo.Next = 0
                                            else begin

                                                with rstMovProv do begin

                                                    CalcFields(Amount, "Remaining Amount");
                                                    decImporte := (Amount) - ("Remaining Amount");   // importe pagado
                                                    decImporteReg := 0;

                                                    h += 1;
                                                    decCuota := Amount;
                                                    if Abs(decCuota) > Abs(decImporte) then begin

                                                        decImporteReg := (decCuota - (decImporte));
                                                        decImporte := 0;

                                                    end
                                                    else begin

                                                        decImporte := decImporte - decCuota;
                                                        decImporteReg := 0;

                                                    end;

                                                    decImporteDeuda := decImporteReg;

                                                    Clear(rstMovLiq);
                                                    if rstMovLiq.Get(codLiquidacion, datInicialDef, rstMovProv."Entry No.") then
                                                        EliminarProveedorLiquidacion(rstMovProv);

                                                    if rstMovLiq."No. mov." = 0 then begin

                                                        rstMovLiq."No. Liquidacion" := codLiquidacion;
                                                        rstMovLiq."No. mov." := rstMovProv."Entry No.";
                                                        rstMovLiq."No. proveedor" := rstMovProv."Vendor No.";
                                                        rstMovLiq."No. documento" := rstMovProv."Document No.";
                                                        rstMovLiq."No. documento externo" := rstMovProv."External Document No.";
                                                        rstMovLiq."Fecha registro" := rstMovProv."Posting Date";
                                                        rstMovLiq."Fecha vencimiento" := fntCalcFVentoInc(rstMovProv."Document Date",
                                                                                                         rstMovProv."Cód. condición pago");
                                                        rstMovLiq."Cód. divisa" := rstMovProv."Currency Code";
                                                        rstMovLiq.Importe := rstMovProv.Amount;
                                                        rstMovLiq."Importe a pagar" := decImporteDeuda;
                                                        rstMovLiq."Importe pendiente" := rstMovProv."Remaining Amount";
                                                        rstMovLiq."Fecha pago" := WorkDate;
                                                        rstMovLiq.Insert;

                                                    end
                                                    else begin

                                                        rstMovLiq.Delete;

                                                    end;

                                                end;

                                            end;

                                        end;

                                    end;

                                end
                                else begin

                                    with rstMovProv do begin

                                        CalcFields(Amount, "Remaining Amount");
                                        decImporte := (Amount) - ("Remaining Amount");   // importe pagado
                                        decImporteReg := 0;

                                        h += 1;
                                        decCuota := Amount;
                                        if Abs(decCuota) > Abs(decImporte) then begin

                                            decImporteReg := (decCuota - (decImporte));
                                            decImporte := 0;

                                        end
                                        else begin

                                            decImporte := decImporte - decCuota;
                                            decImporteReg := 0;

                                        end;

                                        decImporteDeuda := decImporteReg;

                                        Clear(rstMovLiq);
                                        if rstMovLiq.Get(codLiquidacion, datInicialDef, rstMovProv."Entry No.") then
                                            EliminarProveedorLiquidacion(rstMovProv);

                                        if rstMovLiq."No. mov." = 0 then begin

                                            rstMovLiq."No. Liquidacion" := codLiquidacion;
                                            rstMovLiq."No. mov." := rstMovProv."Entry No.";
                                            rstMovLiq."No. proveedor" := rstMovProv."Vendor No.";
                                            rstMovLiq."No. documento" := rstMovProv."Document No.";
                                            rstMovLiq."No. documento externo" := rstMovProv."External Document No.";
                                            rstMovLiq."Fecha registro" := rstMovProv."Posting Date";
                                            rstMovLiq."Fecha vencimiento" := fntCalcFVentoInc(rstMovProv."Document Date",
                                                                                             rstMovProv."Cód. condición pago");
                                            rstMovLiq."Cód. divisa" := rstMovProv."Currency Code";
                                            rstMovLiq.Importe := rstMovProv.Amount;
                                            rstMovLiq."Importe a pagar" := decImporteDeuda;
                                            rstMovLiq."Importe pendiente" := rstMovProv."Remaining Amount";
                                            rstMovLiq."Fecha pago" := WorkDate;
                                            rstMovLiq.Insert;

                                        end
                                        else begin

                                            rstMovLiq.Delete;

                                        end;

                                    end;

                                end;

                            until rstMovProv.Next = 0;

                        CurrPage.Update(false);
                    end;
                }
                field("Document Type"; "Document Type")
                {
                    StyleExpr = StyleApply;
                }
                field("Document No."; "Document No.")
                {

                    trigger OnAssistEdit()
                    var
                        rstLinCompra: Record "Purch. Inv. Line";
                        frmLinCompra: Page "Lista líneas compra";
                        rstLinCompraNC: Record "Purch. Cr. Memo Line";
                        frmLinCompraNC: Page "Lista líneas nota crédito";
                    begin
                        if "Document Type" = "Document Type"::Invoice then begin

                            Clear(rstLinCompra);
                            Clear(frmLinCompra);
                            rstLinCompra.SetRange(rstLinCompra."Document No.", "Document No.");
                            frmLinCompra.SetTableView(rstLinCompra);
                            frmLinCompra.RunModal;

                        end;

                        if "Document Type" = "Document Type"::"Credit Memo" then begin

                            Clear(rstLinCompraNC);
                            Clear(frmLinCompraNC);
                            rstLinCompraNC.SetRange(rstLinCompraNC."Document No.", "Document No.");
                            frmLinCompraNC.SetTableView(rstLinCompraNC);
                            frmLinCompraNC.RunModal;

                        end;
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        PunSeguimiento: Record "Seguimiento Documentos";
                        PunTipoDoc: Record "Tipos documento";
                        PunCompras: Record "Purchase Header";
                        PunVentas: Record "Sales Header";
                        PunSol: Record Solicitud;
                        PunHSol: Record Solicitud;
                        PunConsumo: Record "Cab. Vale consumo";
                        PunHRemV: Record "Sales Shipment Header";
                        PunHFacV: Record "Sales Invoice Header";
                        PunHNCV: Record "Sales Cr.Memo Header";
                        PunHRemC: Record "Purch. Rcpt. Header";
                        PunHFacC: Record "Purch. Inv. Header";
                        PunHNCC: Record "Purch. Cr. Memo Hdr.";
                        rstConfUsu: Record "User Setup";
                        cduMensajeria: Codeunit "Mensajería";
                        rstMensajeria: Record Mensajeria;
                        rstSeguridad: Record Seguridad;
                        rstSeguridadUsuario: Record "Seguridad por usuario";
                        rstSeguridadCambioEstado: Record "Seguridad cambio estados";
                        strNombreProveedor: Text[50];
                        rstProveedor: Record Vendor;
                        strFacturaLin: Text[30];
                        rstCabNota: Record "Purchase Header";
                        rstHCRemito: Record "Sales Shipment Header";
                        rstTipoDoc: Record "Tipos documento";
                        rstDigitalizar: Record "Ruta digitalizacion depto/espe";
                        cduDigitalizarOAbrir: Codeunit Escaneado;
                        rstDocDigit: Record "Documentos digitalizados";
                        rstDocVin: Record "Vinculación documentos";
                        rstInfoEmpresa: Record "Company Information";
                        rstHRCompra: Record "Purch. Rcpt. Header";
                        rstLiqPago: Record "Cab. Liquidacion Pagos";

                        strNombreProveedorVisible: Boolean;

                        strNombreProvVisible: Boolean;

                        strFacturaCabVisible: Boolean;

                        strFacturaLinVisible: Boolean;

                        DetalleEmphasize: Boolean;

                        "Tipo DocumentoEmphasize": Boolean;
                        Html: Text[1024];
                        strExpress: Text[1024];
                        rstReparto: Record "Cab. Reparto";
                        frmCambiarEstado: Page "Cambiar estado documento";
                        "frmNotaCrédito": Page "Purchase Credit Memo";
                        frmCuadroEntradas: Page "Cuadro Entradas Resumido";
                    begin
                        Clear(rstMensajeria);
                        rstMensajeria.SetRange(rstMensajeria."No. documento", "Document No.");
                        if rstMensajeria.FindFirst then;
                        PunTipoDoc.Reset;
                        PunTipoDoc.SetRange("Tipos documento", rstMensajeria."Tipo Documento");
                        if PunTipoDoc.Find('-') then;

                        if rstMensajeria."Tipo Documento" in ['Reparto (ventas)'] then begin

                            Clear(rstReparto);
                            rstReparto.SetRange(rstReparto."No. Documento", rstMensajeria."No. documento");
                            if rstReparto.FindFirst then
                                PAGE.Run(PunTipoDoc."No. form", rstReparto);

                        end;

                        if rstMensajeria."Tipo Documento" in ['Cotización (compras)', 'Factura (compras)', 'Pedido (compras)', 'Fact. pronto venc. (compras)', 'Nota débito (compras)', 'Déb. pronto venc. (compras)'] then begin

                            PunCompras.Reset;
                            PunCompras.SetRange(PunCompras."No.", rstMensajeria."No. documento");
                            if PunCompras.Find('-') then begin

                                case rstMensajeria."Tipo Documento" of
                                    'Cotización (compras)':
                                        begin

                                            Clear(PunCompras);
                                            if PunCompras.Get(PunCompras."Document Type"::Quote, rstMensajeria."No. documento") then
                                                PAGE.Run(PunTipoDoc."No. form", PunCompras)

                                        end;

                                    'Factura (compras)', 'Nota débito (compras)', 'Déb. pronto venc. (compras)':
                                        begin

                                            Clear(PunCompras);
                                            if PunCompras.Get(PunCompras."Document Type"::Invoice, rstMensajeria."No. documento") then
                                                PAGE.Run(PunTipoDoc."No. form", PunCompras)

                                        end;

                                    'Fact. pronto venc. (compras)':
                                        begin

                                            Clear(PunCompras);
                                            if PunCompras.Get(PunCompras."Document Type"::Invoice, rstMensajeria."No. documento") then
                                                PAGE.Run(PunTipoDoc."No. form", PunCompras)

                                        end;

                                    'Pedido (compras)':
                                        begin

                                            Clear(PunCompras);
                                            if PunCompras.Get(PunCompras."Document Type"::Order, rstMensajeria."No. documento") then
                                                PAGE.Run(PunTipoDoc."No. form", PunCompras)

                                        end;
                                end;

                            end
                            else begin

                                PunHRemC.Reset;
                                PunHRemC.SetRange(PunHRemC."No.", rstMensajeria."No. documento");
                                if PunHRemC.Find('-') then begin

                                    PAGE.Run(PAGE::"Posted Purchase Receipt", PunHRemC);

                                end;

                                PunHFacC.Reset;
                                PunHFacC.SetCurrentKey(PunHFacC."Pre-Assigned No.");
                                PunHFacC.SetRange(PunHFacC."Pre-Assigned No.", rstMensajeria."No. documento");
                                if PunHFacC.Find('-') then begin

                                    PAGE.Run(PAGE::"Posted Purchase Invoice", PunHFacC);

                                end;

                                PunHNCC.Reset;
                                PunHNCC.SetRange("No.", rstMensajeria."No. documento");
                                if PunHNCC.Find('-') then begin

                                    PAGE.Run(PAGE::"Posted Purchase Credit Memo", PunHNCC);

                                end;
                            end;
                        end;

                        if rstMensajeria."Tipo Documento" = 'Nota crédito (compras)' then begin

                            Clear(rstCabNota);
                            Clear(frmNotaCrédito);
                            rstCabNota.Get(rstCabNota."Document Type"::"Credit Memo", rstMensajeria."No. documento");
                            PAGE.Run(PAGE::"Purchase Credit Memo", rstCabNota);

                        end;

                        if rstMensajeria."Tipo Documento" in ['Factura (ventas)', 'Pedido (ventas)'] then begin

                            Clear(PunVentas);
                            PunVentas.SetRange("No.", rstMensajeria."No. documento");
                            if PunVentas.Find('-') then begin

                                PAGE.Run(PunTipoDoc."No. form", PunVentas);

                            end
                            else begin

                                PunHRemV.Reset;
                                PunHRemV.SetRange("No.", rstMensajeria."No. documento");
                                if PunHRemV.Find('-') then begin

                                    PAGE.Run(PAGE::"Posted Sales Shipment", PunHRemV);

                                end;

                                PunHFacV.Reset;
                                PunHFacV.SetRange("Pre-Assigned No.", rstMensajeria."No. documento");
                                if PunHFacV.Find('-') then begin

                                    PAGE.Run(PAGE::"Posted Sales Invoice", PunHFacV);

                                end;

                                PunHNCV.Reset;
                                PunHNCV.SetRange("No.", rstMensajeria."No. documento");
                                if PunHNCV.Find('-') then begin

                                    PAGE.Run(PAGE::"Posted Sales Credit Memo", PunHNCV);

                                end;
                            end;
                        end;

                        if rstMensajeria."Tipo Documento" in ['Vale de consumo', 'Vale de consumo en tránsito'] then begin

                            PunConsumo.Reset;
                            PunConsumo.SetRange(PunConsumo."No. documento", rstMensajeria."No. documento");
                            if PunConsumo.Find('-') then begin

                                PAGE.Run(PunTipoDoc."No. form", PunConsumo);

                            end;
                        end;

                        if rstMensajeria."Tipo Documento" = 'Cuadro de Entradas (producción)' then begin

                            Clear(frmCuadroEntradas);
                            if rstConfUsu.Get(UserId) then
                                cduMensajeria.RegistrarAlerta('Cuadro de Entradas sin modificaciones', UserId, rstMensajeria."No. documento", 'Cuadro de Entradas (producción)',
                                'Completada', WorkDate, rstMensajeria."Tipo movimiento"::Alerta, '', '', '', '', '', '', '', '');
                            Commit;
                            frmCuadroEntradas.RunModal;

                        end;

                        case rstMensajeria."Tipo Documento" of

                            'Solicitud (compras)':
                                begin

                                    PunSol.Reset;
                                    PunSol.SetRange("No. documento", rstMensajeria."No. documento");
                                    if PunSol.Find('-') then begin

                                        PAGE.Run(PunTipoDoc."No. form", PunSol);

                                    end
                                    else begin

                                        PunHSol.Reset;
                                        PunHSol.SetRange("No. documento", rstMensajeria."No. documento");
                                        if PunHSol.Find('-') then begin

                                            PAGE.Run(PAGE::Solicitud, PunHSol);

                                        end;
                                    end;
                                end;
                        end;

                        if rstMensajeria."Tipo Documento" = 'Remito (ventas)' then begin

                            Clear(rstHCRemito);
                            rstHCRemito.SetRange("No.", rstMensajeria."No. documento");
                            if rstHCRemito.Find('-') then begin

                                PAGE.Run(PAGE::"Posted Sales Shipment", rstHCRemito);

                            end;

                        end;

                        if rstMensajeria."Tipo Documento" = 'Liquidación pagos' then begin

                            Clear(rstLiqPago);
                            rstLiqPago.SetRange(rstLiqPago."No. Liquidacion", rstMensajeria."No. documento");
                            if rstLiqPago.Find('-') then
                                PAGE.Run(50671, rstLiqPago);

                        end;
                    end;
                }
                field("External Document No."; "External Document No.")
                {
                    StyleExpr = StyleApply;
                }
                field("Currency Code"; "Currency Code")
                {
                }
                field(decImporteALiquidar; decImporteALiquidar)
                {
                    Caption = 'A pagar';
                    StyleExpr = StyleApply;
                }
                field("MatrixCellData[1]"; MatrixCellData[1])
                {
                    CaptionClass = '3,' + MatrixCaption[1];
                    Visible = Field1Visible;
                    Width = 10;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Matrix_OnLookup(1);
                    end;

                    trigger OnValidate()
                    begin
                        Matrix_OnValidate(1, Format(MatrixCellData[1]));
                    end;
                }
                field("MatrixCellData[2]"; MatrixCellData[2])
                {
                    CaptionClass = '3,' + MatrixCaption[2];
                    Visible = Field2Visible;
                    Width = 10;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Matrix_OnLookup(2);
                    end;

                    trigger OnValidate()
                    begin
                        Matrix_OnValidate(2, Format(MatrixCellData[2]));
                    end;
                }
                field("MatrixCellData[3]"; MatrixCellData[3])
                {
                    CaptionClass = '3,' + MatrixCaption[3];
                    Visible = Field3Visible;
                    Width = 10;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Matrix_OnLookup(3);
                    end;

                    trigger OnValidate()
                    begin
                        Matrix_OnValidate(3, Format(MatrixCellData[3]));
                    end;
                }
                field("MatrixCellData[4]"; MatrixCellData[4])
                {
                    CaptionClass = '3,' + MatrixCaption[4];
                    Visible = Field4Visible;
                    Width = 10;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Matrix_OnLookup(4);
                    end;

                    trigger OnValidate()
                    begin
                        Matrix_OnValidate(4, Format(MatrixCellData[4]));
                    end;
                }
                field("MatrixCellData[5]"; MatrixCellData[5])
                {
                    CaptionClass = '3,' + MatrixCaption[5];
                    Visible = Field5Visible;
                    Width = 10;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Matrix_OnLookup(5);
                    end;

                    trigger OnValidate()
                    begin
                        Matrix_OnValidate(5, Format(MatrixCellData[5]));
                    end;
                }
                field("MatrixCellData[6]"; MatrixCellData[6])
                {
                    CaptionClass = '3,' + MatrixCaption[6];
                    Visible = Field6Visible;
                    Width = 10;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Matrix_OnLookup(6);
                    end;

                    trigger OnValidate()
                    begin
                        Matrix_OnValidate(6, Format(MatrixCellData[6]));
                    end;
                }
                field("MatrixCellData[7]"; MatrixCellData[7])
                {
                    CaptionClass = '3,' + MatrixCaption[7];
                    Visible = Field7Visible;
                    Width = 10;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Matrix_OnLookup(7);
                    end;

                    trigger OnValidate()
                    begin
                        Matrix_OnValidate(7, Format(MatrixCellData[7]));
                    end;
                }
                field("MatrixCellData[8]"; MatrixCellData[8])
                {
                    CaptionClass = '3,' + MatrixCaption[8];
                    Visible = Field8Visible;
                    Width = 10;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Matrix_OnLookup(8);
                    end;

                    trigger OnValidate()
                    begin
                        Matrix_OnValidate(8, Format(MatrixCellData[8]));
                    end;
                }
                field("MatrixCellData[9]"; MatrixCellData[9])
                {
                    CaptionClass = '3,' + MatrixCaption[9];
                    Visible = Field9Visible;
                    Width = 10;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Matrix_OnLookup(9);
                    end;

                    trigger OnValidate()
                    begin
                        Matrix_OnValidate(9, Format(MatrixCellData[9]));
                    end;
                }
                field("MatrixCellData[10]"; MatrixCellData[10])
                {
                    CaptionClass = '3,' + MatrixCaption[10];
                    Visible = Field10Visible;
                    Width = 10;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Matrix_OnLookup(10);
                    end;

                    trigger OnValidate()
                    begin
                        Matrix_OnValidate(10, Format(MatrixCellData[10]));
                    end;
                }
                field("MatrixCellData[11]"; MatrixCellData[11])
                {
                    CaptionClass = '3,' + MatrixCaption[11];
                    Visible = Field11Visible;
                    Width = 10;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Matrix_OnLookup(11);
                    end;

                    trigger OnValidate()
                    begin
                        Matrix_OnValidate(11, Format(MatrixCellData[11]));
                    end;
                }
                field("MatrixCellData[12]"; MatrixCellData[12])
                {
                    CaptionClass = '3,' + MatrixCaption[12];
                    Visible = Field12Visible;
                    Width = 10;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Matrix_OnLookup(12);
                    end;

                    trigger OnValidate()
                    begin
                        Matrix_OnValidate(12, Format(MatrixCellData[12]));
                    end;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        for i := 1 to MatrixColumnCount do begin
            Matrix_OnAfterGetRecord(i);
        end;

        Clear(rstProv);
        rstProv.Get("Vendor No.");
    end;

    trigger OnInit()
    begin
        Field1Visible := true;
        Field2Visible := true;
        Field3Visible := true;
        Field4Visible := true;
        Field5Visible := true;
        Field6Visible := true;
        Field7Visible := true;
        Field8Visible := true;
        Field9Visible := true;
        Field10Visible := true;
        Field11Visible := true;
        Field12Visible := true;
    end;

    trigger OnOpenPage()
    begin
        InitFilter;
    end;

    var
        MatrixCellData: array[12] of Text;
        MatrixCaption: array[12] of Text[50];
        MatrixRecord: array[12] of Record Date;
        Field1Visible: Boolean;
        Field2Visible: Boolean;
        Field3Visible: Boolean;
        Field4Visible: Boolean;
        Field5Visible: Boolean;
        Field6Visible: Boolean;
        Field7Visible: Boolean;
        Field8Visible: Boolean;
        Field9Visible: Boolean;
        Field10Visible: Boolean;
        Field11Visible: Boolean;
        Field12Visible: Boolean;
        PageDateFilter: Text;
        MatrixColumnCount: Integer;
        i: Integer;
        datInicialDef: Date;
        datFinalDef: Date;
        datInicial: Date;
        datFinal: Date;
        codLiquidacion: Code[20];
        FechaVto: Date;
        h: Integer;
        k: Integer;
        PeriodType: Enum "Analysis Period Type";
        FormatCell: Boolean;
        Error001: Label 'Este movimiento ya está presente en la liquidación %1';
        Error002: Label 'No puede ingresar movimientos de diferentes divisas en la misma liquidación. ';
        Error003: Label 'No es posible modificar una liquidación registrada. Anule primero la liquidación.';
        StyleApply: Text[1024];
        decImporteALiquidar: Decimal;
        rstProv: Record Vendor;
        optLP: Option;

    [Scope('OnPrem')]
    procedure SetMatrixData(MATRIX_ColumnCaptions: array[12] of Text[1024]; var MatrixRec: array[12] of Record Date; DateFilter: Text[1024]; ColumnSetLength: Integer)
    var
        i: Integer;
        rstDate: Record Date;
        j: Integer;
    begin
        if codLiquidacion = '' then
            GetLiq;

        for i := 1 to ArrayLen(MatrixRecord) do begin

            if MATRIX_ColumnCaptions[i] = '' then
                MatrixCaption[i] := ''
            else
                MatrixCaption[i] := MATRIX_ColumnCaptions[i];
            MatrixRecord[i] := MatrixRec[i];

            j := 0;
            for j := 1 to i do begin

                if PeriodType = PeriodType::Week then begin

                    MatrixCaption[j] := Format(MatrixRec[j]."Period Start") + ' ' +
                                        Format(MatrixRec[j]."Period End");

                end;

            end;

        end;

        PageDateFilter := DateFilter;
        MatrixColumnCount := ColumnSetLength;

        ShowHideColumns;
    end;

    [Scope('OnPrem')]
    procedure ShowHideColumns()
    begin
        Field1Visible := MatrixColumnCount >= 1;
        Field2Visible := MatrixColumnCount >= 2;
        Field3Visible := MatrixColumnCount >= 3;
        Field4Visible := MatrixColumnCount >= 4;
        Field5Visible := MatrixColumnCount >= 5;
        Field6Visible := MatrixColumnCount >= 6;
        Field7Visible := MatrixColumnCount >= 7;
        Field8Visible := MatrixColumnCount >= 8;
        Field9Visible := MatrixColumnCount >= 9;
        Field10Visible := MatrixColumnCount >= 10;
        Field11Visible := MatrixColumnCount >= 11;
        Field12Visible := MatrixColumnCount >= 12;
    end;

    [Scope('OnPrem')]
    procedure Matrix_OnAfterGetRecord(CurrColumnNo: Integer)
    begin
        MatrixCellData[CurrColumnNo] := Format(fntDetalle(CurrColumnNo));
        if MatrixCellData[CurrColumnNo] = '0' then
            MatrixCellData[CurrColumnNo] := '';
        decImporteALiquidar := fntSumaAPagar();
        //IF MatrixCellData[CurrColumnNo] <> '' THEN
        StyleApply := StyleFormat(MatrixCellData[CurrColumnNo]);
    end;

    [Scope('OnPrem')]
    procedure InitFilter()
    begin
        SetRange(Open, true);
        SetRange(Positive, false);
    end;

    [Scope('OnPrem')]
    procedure fntDetalle(l: Integer): Text
    var
        rstPlazo: Record Installment;
        rstTPago: Record "Payment Terms";
        decImporte: Decimal;
        i: Integer;
        decCuota: Decimal;
        blnPesos: Boolean;
        strTitulo: Text[100];
        ImportePendiente: Decimal;
        codLDPago: Code[20];
        codSDPago: Code[20];
        rstSeccion: Record "Gen. Journal Batch";
        frmSeccion: Page "General Journal Batches";
        blnGenerar: Boolean;
        intLinea: Integer;
        rstLinDiaGen: Record "Gen. Journal Line";
        GestNroDoc: Codeunit "No. Series";
        TipImporte: Option "Saldo periodo","Acumulado hasta fecha";
        PeriodoContable: Record "Accounting Period";
        decImporteReg: Decimal;
        decImporteDeuda: Decimal;
        blnDetalle: Boolean;
        intNum: Integer;
        dlgFecha: Dialog;
        strNombre: Text[50];
        rstProv: Record Vendor;
        rstMovLiq: Record "Lín. Liquidacion Pagos";
        rstConfComp: Record "Purchases & Payables Setup";
        codDivisa: Code[10];
        rstMovProv: Record "Vendor Ledger Entry";
        frmMovProv: Page "Vendor Ledger Entries";
        datFecha: Date;
        FechaVto: Date;
        decLiq: Decimal;
    begin
        decImporteReg := 0;
        decImporteDeuda := 0;
        decCuota := 0;
        decImporte := 0;
        CalcFields("Amount (LCY)", "Remaining Amt. (LCY)");

        BuscaFecha(l);

        //debug
        if "Vendor No." = '2017574126' then
            h := 0;
        h := 0;

        Clear(rstTPago);
        if rstTPago.Get("Cód. condición pago") then begin

            rstTPago.CalcFields("No. of Installments");
            if rstTPago."No. of Installments" > 0 then begin

                decImporte := ("Amount (LCY)") - ("Remaining Amt. (LCY)");   // importe pagado
                decImporteReg := 0;

                Clear(rstPlazo);
                rstPlazo.SetRange(rstPlazo."Payment Terms Code", rstTPago.Code);
                if rstPlazo.Find('-') then
                    repeat

                        h += 1;
                        decCuota := "Amount (LCY)" * rstPlazo."% of Total" / 100;
                        if Abs(decCuota) > Abs(decImporte) then begin

                            decImporteReg := (decCuota - (decImporte));
                            decImporte := 0;

                        end
                        else begin

                            decImporte := decImporte - decCuota;
                            decImporteReg := 0;

                        end;

                        FechaVto := fntCalcFVento("Document Date", "Cód. condición pago");

                        if (MatrixRecord[l]."Period Start" <= FechaVto) and (FechaVto <= MatrixRecord[l]."Period End") then begin
                            decImporteDeuda += decImporteReg;
                        end;

                        if (FechaVto < datInicial) and (FechaVto < datInicialDef)
                        and (l = 1) then begin
                            decImporteDeuda += decImporteReg;
                        end;

                        if (FechaVto > datFinal) and (FechaVto > datFinalDef)
                        and (l = 12) then begin
                            decImporteDeuda += decImporteReg;
                        end;

                        if (MatrixRecord[l]."Period Start" <= FechaVto) and (FechaVto <= MatrixRecord[l]."Period End") then begin

                            decLiq := fntMovLiqRelacionado(true, l);

                            if (decLiq <> 0) and ((decImporteDeuda - decLiq) <> 0) then
                                exit(Format(decImporteDeuda - decLiq))
                            else
                                if decLiq <> 0 then
                                    exit('-');

                        end;

                        if (FechaVto < datInicial) and (FechaVto < datInicialDef)
                          and (l = 1) then begin

                            decLiq := fntMovLiqRelacionado(true, l);

                            if (decLiq <> 0) and ((decLiq - decImporteDeuda) <> 0) then
                                exit(Format(decImporteDeuda - decLiq))
                            else
                                if decLiq <> 0 then
                                    exit('-');

                        end;

                        if (FechaVto > datFinal) and (FechaVto > datFinalDef)
                        and (l = 12) then begin

                            decLiq := fntMovLiqRelacionado(true, l);

                            if (decLiq <> 0) and ((decLiq - decImporteDeuda) <> 0) then
                                exit(Format(decImporteDeuda - decLiq))
                            else
                                if decLiq <> 0 then
                                    exit('-');

                        end;

                    until rstPlazo.Next = 0;

            end
            else begin

                decImporte := ("Remaining Amt. (LCY)");   // importe pagado
                decImporteReg := 0;

                FechaVto := "Due Date";

                if (MatrixRecord[l]."Period Start" <= FechaVto) and (FechaVto <= MatrixRecord[l]."Period End") then begin
                    decImporteDeuda += decImporte;
                end;

                if (FechaVto < datInicial) and (FechaVto < datInicialDef)
                and (l = 1) then begin
                    decImporteDeuda += decImporte;
                end;

                if (FechaVto > datFinal) and (FechaVto > datFinalDef)
                and (l = 12) then begin
                    decImporteDeuda += decImporte;
                end;

                if (MatrixRecord[l]."Period Start" <= FechaVto) and (FechaVto <= MatrixRecord[l]."Period End") then begin

                    decLiq := fntMovLiqRelacionado(true, l);

                    if (decLiq <> 0) and ((decImporteDeuda - decLiq) <> 0) then
                        exit(Format(decImporteDeuda - decLiq))
                    else
                        if decLiq <> 0 then
                            exit('-');

                end;

                if (FechaVto < datInicial) and (FechaVto < datInicialDef)
                  and (l = 1) then begin

                    decLiq := fntMovLiqRelacionado(true, l);

                    if (decLiq <> 0) and ((decLiq - decImporteDeuda) <> 0) then
                        exit(Format(decImporteDeuda - decLiq))
                    else
                        if decLiq <> 0 then
                            exit('-');

                end;

                if (FechaVto > datFinal) and (FechaVto > datFinalDef)
                and (l = 12) then begin

                    decLiq := fntMovLiqRelacionado(true, l);

                    if (decLiq <> 0) and ((decLiq - decImporteDeuda) <> 0) then
                        exit(Format(decImporteDeuda - decLiq))
                    else
                        if decLiq <> 0 then
                            exit('-');

                end;

            end;

        end
        else begin

            decImporte := ("Remaining Amt. (LCY)");   // importe pagado
            decImporteReg := 0;

            FechaVto := "Due Date";

            if (MatrixRecord[l]."Period Start" <= FechaVto) and (FechaVto <= MatrixRecord[l]."Period End") then begin
                decImporteDeuda += decImporte;
            end;

            if (FechaVto < datInicial) and (FechaVto < datInicialDef)
            and (l = 1) then begin
                decImporteDeuda += decImporte;
            end;

            if (FechaVto > datFinal) and (FechaVto > datFinalDef)
            and (l = 12) then begin
                decImporteDeuda += decImporte;
            end;

            if (MatrixRecord[l]."Period Start" <= FechaVto) and (FechaVto <= MatrixRecord[l]."Period End") then begin

                decLiq := fntMovLiqRelacionado(true, l);

                if (decLiq <> 0) and ((decImporteDeuda - decLiq) <> 0) then
                    exit(Format(decImporteDeuda - decLiq))
                else
                    if decLiq <> 0 then
                        exit('-');

            end;

            if (FechaVto < datInicial) and (FechaVto < datInicialDef)
              and (l = 1) then begin

                decLiq := fntMovLiqRelacionado(true, l);

                if (decLiq <> 0) and ((decLiq - decImporteDeuda) <> 0) then
                    exit(Format(decImporteDeuda - decLiq))
                else
                    if decLiq <> 0 then
                        exit('-');

            end;

            if (FechaVto > datFinal) and (FechaVto > datFinalDef)
            and (l = 12) then begin

                decLiq := fntMovLiqRelacionado(true, l);

                if (decLiq <> 0) and ((decLiq - decImporteDeuda) <> 0) then
                    exit(Format(decImporteDeuda - decLiq))
                else
                    if decLiq <> 0 then
                        exit('-');

            end;

        end;

        exit(Format(decImporteDeuda));
    end;

    [Scope('OnPrem')]
    procedure fntMovLiqRelacionado(blnConsiderarFechas: Boolean; p: Integer): Decimal
    var
        rstMovLiq: Record "Lín. Liquidacion Pagos";
        rstTPago: Record "Payment Terms";
    begin
        Clear(rstMovLiq);
        rstMovLiq.SetRange("No. mov.", "Entry No.");
        rstMovLiq.SetFilter(rstMovLiq."No. Liquidacion", '%1', codLiquidacion);
        BuscaFecha(p);

        Clear(rstTPago);
        if rstTPago.Get("Cód. condición pago") then begin

            rstTPago.CalcFields(rstTPago."No. of Installments");
            if rstTPago."No. of Installments" > 0 then
                rstMovLiq.SetRange("Fecha vencimiento", fntCalcFVento("Document Date", "Cód. condición pago"))
            else
                rstMovLiq.SetRange("Fecha vencimiento", "Due Date");

        end;
        rstMovLiq.CalcSums(rstMovLiq."Importe a pagar");
        if rstMovLiq.FindFirst then
            exit(rstMovLiq."Importe a pagar")
        else
            exit(0);
    end;

    [Scope('OnPrem')]
    procedure fntCalcFVento(datFecha: Date; codTPago: Code[10]): Date
    var
        rstPlazo: Record Installment;
        j: Integer;
    begin
        Clear(rstPlazo);
        rstPlazo.SetRange(rstPlazo."Payment Terms Code", codTPago);
        if rstPlazo.Find('-') then begin

            FechaVto := "Document Date";
            j := 0;

            repeat

                j += 1;
                FechaVto := CalcDate(rstPlazo."Gap between Installments", FechaVto);//datFecha);

            until (j = h) or (rstPlazo.Next = 0);
            exit(FechaVto);

        end;
    end;

    [Scope('OnPrem')]
    procedure BuscaFecha(p: Integer): Boolean
    var
        Buscar: Boolean;
        rstDate: Record Date;
    begin
        k := 0;
        Clear(rstDate);
        rstDate.SetRange("Period Type", PeriodType);
        rstDate.SetFilter("Period Start", '>=%1', datInicial);
        rstDate.SetFilter("Period End", '<=%1', ClosingDate(datFinal));
        if rstDate.FindSet then
            repeat

                if k <> 0 then
                    rstDate.Next;

                k += 1;
                datInicialDef := rstDate."Period Start";
                datFinalDef := rstDate."Period End";

            until (k = p);
    end;

    [Scope('OnPrem')]
    procedure LiquidacionPago(l_codLiquidacion: Code[20]; l_PeriodType: Enum "Analysis Period Type"; l_datInicial: Date; l_datFinal: Date)
    begin
        codLiquidacion := l_codLiquidacion;
        PeriodType := l_PeriodType;
        datInicial := l_datInicial;
        datFinal := l_datFinal;
    end;

    [Scope('OnPrem')]
    procedure Matrix_OnLookup(i: Integer)
    var
        rstCabLiq: Record "Cab. Liquidacion Pagos";
        rstMovProv: Record "Vendor Ledger Entry";
        rstTPago: Record "Payment Terms";
        decImporteReg: Decimal;
        decImporte: Decimal;
        rstPlazo: Record Installment;
        decCuota: Decimal;
        decImporteDeuda: Decimal;
        rstMovLiq: Record "Lín. Liquidacion Pagos";
    begin
        if codLiquidacion <> '' then begin

            Clear(rstCabLiq);
            rstCabLiq.Get(codLiquidacion);

        end
        else begin

            GetLiq;

        end;

        if rstCabLiq.Registrado then
            Error(Error003);

        BuscaFecha(i);

        h := 0;
        Clear(rstMovProv);
        rstMovProv.CopyFilters(Rec);
        rstMovProv.SetRange("Entry No.", "Entry No.");
        rstMovProv.SetRange("Vendor No.", "Vendor No.");
        if rstMovProv.Find('-') then
            repeat

                Clear(rstTPago);
                if rstTPago.Get("Cód. condición pago") then begin

                    rstTPago.CalcFields(rstTPago."No. of Installments");
                    if rstTPago."No. of Installments" > 0 then begin

                        with rstMovProv do begin

                            rstMovProv.CalcFields("Amount (LCY)", "Remaining Amt. (LCY)");
                            decImporteReg := 0;

                            decImporte := 0;
                            decImporte := ("Amount (LCY)") - ("Remaining Amt. (LCY)");   // importe pagado

                            Clear(rstPlazo);
                            rstPlazo.SetRange(rstPlazo."Payment Terms Code", rstTPago.Code);
                            if rstPlazo.Find('-') then
                                repeat

                                    decCuota := 0;
                                    decImporteDeuda := 0;

                                    h += 1;
                                    decCuota := "Amount (LCY)" * rstPlazo."% of Total" / 100;
                                    if Abs(decCuota) > Abs(decImporte) then begin

                                        decImporteReg := (decCuota - (decImporte));
                                        decImporte := 0;

                                    end
                                    else begin

                                        decImporte := decImporte - decCuota;
                                        decImporteReg := 0;

                                    end;

                                    FechaVto := fntCalcFVento(rstMovProv."Document Date",
                                                                                     rstMovProv."Cód. condición pago");

                                    if (datInicialDef <= FechaVto) and (FechaVto < datFinalDef) then begin
                                        decImporteDeuda := decImporteReg;
                                    end;

                                    if (FechaVto < datInicial) and (FechaVto < datInicialDef)
                                      and (i = 1) then begin
                                        decImporteDeuda := decImporteReg;
                                    end;

                                    if (FechaVto > datFinal) and (FechaVto > datFinalDef)
                                      and (i = 10) then begin
                                        decImporteDeuda := decImporteReg;
                                    end;

                                    Clear(rstMovLiq);
                                    if rstMovLiq.Get(codLiquidacion, fntCalcFVento(rstMovProv."Document Date", rstMovProv."Cód. condición pago"),
                                                     rstMovProv."Entry No.") then
                                        ;

                                    if decImporteDeuda <> 0 then begin

                                        if rstMovLiq."No. mov." = 0 then begin

                                            if VerificarAusenciaLiquidacion(rstMovProv) then
                                                Error(Error001, rstMovLiq."No. Liquidacion");

                                            rstMovLiq."No. Liquidacion" := codLiquidacion;
                                            rstMovLiq."No. mov." := rstMovProv."Entry No.";
                                            rstMovLiq."No. proveedor" := rstMovProv."Vendor No.";
                                            rstMovLiq."No. documento" := rstMovProv."Document No.";
                                            rstMovLiq."No. documento externo" := rstMovProv."External Document No.";
                                            rstMovLiq."Fecha registro" := rstMovProv."Posting Date";
                                            rstMovLiq."Fecha vencimiento" := fntCalcFVento("Document Date", "Cód. condición pago");
                                            rstMovLiq."Cód. divisa" := rstMovProv."Currency Code";
                                            rstMovLiq.Importe := rstMovProv."Amount (LCY)";
                                            rstMovLiq."Importe a pagar" := decImporteDeuda;
                                            rstMovLiq."Importe pendiente" := rstMovProv."Remaining Amt. (LCY)";
                                            rstMovLiq."Fecha pago" := WorkDate;
                                            rstMovLiq.Insert;

                                        end
                                        else begin

                                            rstMovLiq.Delete;

                                        end;

                                    end;

                                until rstPlazo.Next = 0;

                        end;

                    end
                    else begin

                        with rstMovProv do begin

                            CalcFields("Amount (LCY)", "Remaining Amt. (LCY)");
                            decImporteReg := 0;

                            decImporteReg := ("Remaining Amt. (LCY)");   // importe pagado

                            FechaVto := rstMovProv."Due Date";

                            if (datInicialDef <= FechaVto) and (FechaVto < datFinalDef) then begin
                                decImporteDeuda := decImporteReg;
                            end;

                            if (FechaVto < datInicial) and (FechaVto < datInicialDef)
                              and (i = 1) then begin
                                decImporteDeuda := decImporteReg;
                            end;

                            if (FechaVto > datFinal) and (FechaVto > datFinalDef)
                              and (i = 10) then begin
                                decImporteDeuda := decImporteReg;
                            end;

                            Clear(rstMovLiq);
                            if rstMovLiq.Get(codLiquidacion, "Due Date",
                                             "Entry No.") then
                                ;

                            if decImporteDeuda <> 0 then begin

                                if rstMovLiq."No. mov." = 0 then begin

                                    if VerificarAusenciaLiquidacion(rstMovProv) then
                                        Error(Error001, rstMovLiq."No. Liquidacion");

                                    rstMovLiq."No. Liquidacion" := codLiquidacion;
                                    rstMovLiq."No. mov." := "Entry No.";
                                    rstMovLiq."No. proveedor" := "Vendor No.";
                                    rstMovLiq."No. documento" := "Document No.";
                                    rstMovLiq."No. documento externo" := "External Document No.";
                                    rstMovLiq."Fecha registro" := "Posting Date";
                                    rstMovLiq."Fecha vencimiento" := "Due Date";
                                    rstMovLiq."Cód. divisa" := "Currency Code";
                                    rstMovLiq.Importe := "Amount (LCY)";
                                    rstMovLiq."Importe a pagar" := decImporteDeuda;
                                    rstMovLiq."Importe pendiente" := "Remaining Amt. (LCY)";
                                    rstMovLiq."Fecha pago" := WorkDate;
                                    rstMovLiq.Insert;

                                end
                                else begin

                                    rstMovLiq.Delete;

                                end;

                            end;

                        end;

                    end;

                end
                else begin

                    with rstMovProv do begin

                        CalcFields("Amount (LCY)", "Remaining Amt. (LCY)");
                        decImporteReg := 0;

                        decImporteReg := ("Remaining Amt. (LCY)");   // importe pagado

                        FechaVto := rstMovProv."Due Date";

                        if (datInicialDef <= FechaVto) and (FechaVto < datFinalDef) then begin
                            decImporteDeuda := decImporteReg;
                        end;

                        if (FechaVto < datInicial) and (FechaVto < datInicialDef)
                          and (i = 1) then begin
                            decImporteDeuda := decImporteReg;
                        end;

                        if (FechaVto > datFinal) and (FechaVto > datFinalDef)
                          and (i = 10) then begin
                            decImporteDeuda := decImporteReg;
                        end;

                        Clear(rstMovLiq);
                        if rstMovLiq.Get(codLiquidacion, "Due Date",
                                         "Entry No.") then
                            ;

                        if decImporteDeuda <> 0 then begin

                            if rstMovLiq."No. mov." = 0 then begin

                                if VerificarAusenciaLiquidacion(rstMovProv) then
                                    Error(Error001, rstMovLiq."No. Liquidacion");

                                rstMovLiq."No. Liquidacion" := codLiquidacion;
                                rstMovLiq."No. mov." := "Entry No.";
                                rstMovLiq."No. proveedor" := "Vendor No.";
                                rstMovLiq."No. documento" := "Document No.";
                                rstMovLiq."No. documento externo" := "External Document No.";
                                rstMovLiq."Fecha registro" := "Posting Date";
                                rstMovLiq."Fecha vencimiento" := "Due Date";
                                rstMovLiq."Cód. divisa" := "Currency Code";
                                rstMovLiq.Importe := "Amount (LCY)";
                                rstMovLiq."Importe a pagar" := decImporteDeuda;
                                rstMovLiq."Importe pendiente" := "Remaining Amt. (LCY)";
                                rstMovLiq."Fecha pago" := WorkDate;
                                rstMovLiq.Insert;

                            end
                            else begin

                                rstMovLiq.Delete;

                            end;

                        end;

                    end;

                end;

            until rstMovProv.Next = 0;

        CurrPage.Update(true);
    end;

    [Scope('OnPrem')]
    procedure Matrix_OnDrilldown()
    var
        rstMovProv: Record "Vendor Ledger Entry";
        frmMovProv: Page "Vendor Ledger Entries";
    begin
        Clear(rstMovProv);
        Clear(frmMovProv);
        rstMovProv.SetRange("Vendor No.", "Vendor No.");
        rstMovProv.SetRange(Open, true);
        rstMovProv.SetFilter("Document Type", '%1|%2', rstMovProv."Document Type"::Invoice, rstMovProv."Document Type"::"Credit Memo");
        rstMovProv.SetRange("Document No.", "Document No.");

        frmMovProv.SetTableView(rstMovProv);
        frmMovProv.Run;
    end;

    [Scope('OnPrem')]
    procedure Matrix_OnValidate(i: Integer; strImporteAPagar: Text)
    var
        rstCabLiq: Record "Cab. Liquidacion Pagos";
        rstMovProv: Record "Vendor Ledger Entry";
        rstTPago: Record "Payment Terms";
        decImporteReg: Decimal;
        decImporte: Decimal;
        rstPlazo: Record Installment;
        decCuota: Decimal;
        decImporteDeuda: Decimal;
        rstMovLiq: Record "Lín. Liquidacion Pagos";
        decImporteAPagar: Decimal;
    begin
        if rstCabLiq.Registrado then
            Error(Error003);

        Evaluate(decImporteAPagar, strImporteAPagar);
        BuscaFecha(i);

        h := 0;
        Clear(rstMovProv);
        rstMovProv.CopyFilters(Rec);
        rstMovProv.SetRange("Entry No.", "Entry No.");
        rstMovProv.SetRange("Vendor No.", "Vendor No.");
        if rstMovProv.Find('-') then
            repeat

                Clear(rstTPago);
                if rstTPago.Get("Cód. condición pago") then begin

                    rstTPago.CalcFields(rstTPago."No. of Installments");
                    if rstTPago."No. of Installments" > 0 then begin

                        with rstMovProv do begin

                            rstMovProv.CalcFields("Amount (LCY)", "Remaining Amt. (LCY)");
                            decImporteReg := 0;

                            decImporte := 0;
                            decImporte := ("Amount (LCY)") - ("Remaining Amt. (LCY)");   // importe pagado

                            Clear(rstPlazo);
                            rstPlazo.SetRange(rstPlazo."Payment Terms Code", rstTPago.Code);
                            if rstPlazo.Find('-') then
                                repeat

                                    decCuota := 0;
                                    decImporteDeuda := 0;

                                    h += 1;
                                    decCuota := "Amount (LCY)" * rstPlazo."% of Total" / 100;
                                    if Abs(decCuota) > Abs(decImporte) then begin

                                        decImporteReg := (decCuota - (decImporte));
                                        decImporte := 0;

                                    end
                                    else begin

                                        decImporte := decImporte - decCuota;
                                        decImporteReg := 0;

                                    end;

                                    FechaVto := fntCalcFVento(rstMovProv."Document Date",
                                                                                     rstMovProv."Cód. condición pago");

                                    if (datInicialDef <= FechaVto) and (FechaVto < datFinalDef) then begin
                                        decImporteDeuda := decImporteReg;
                                    end;

                                    if (FechaVto < datInicial) and (FechaVto < datInicialDef)
                                      and (i = 1) then begin
                                        decImporteDeuda := decImporteReg;
                                    end;

                                    if (FechaVto > datFinal) and (FechaVto > datFinalDef)
                                      and (i = 10) then begin
                                        decImporteDeuda := decImporteReg;
                                    end;

                                    Clear(rstMovLiq);
                                    if rstMovLiq.Get(codLiquidacion, fntCalcFVento(rstMovProv."Document Date", rstMovProv."Cód. condición pago"),
                                                     rstMovProv."Entry No.") then
                                        ;

                                    if decImporteDeuda <> 0 then begin

                                        if (decImporteDeuda > decImporteAPagar) or (decImporteDeuda > (decImporteDeuda + fntSumaAPagar())) then
                                            Error('No se puede ingresar una suma mayor a la adeudada');

                                        if rstMovLiq."No. mov." = 0 then begin

                                            if VerificarAusenciaLiquidacion(rstMovProv) then
                                                Error(Error001, rstMovLiq."No. Liquidacion");

                                            rstMovLiq."No. Liquidacion" := codLiquidacion;
                                            rstMovLiq."No. mov." := rstMovProv."Entry No.";
                                            rstMovLiq."No. proveedor" := rstMovProv."Vendor No.";
                                            rstMovLiq."No. documento" := rstMovProv."Document No.";
                                            rstMovLiq."No. documento externo" := rstMovProv."External Document No.";
                                            rstMovLiq."Fecha registro" := rstMovProv."Posting Date";
                                            rstMovLiq."Fecha vencimiento" := fntCalcFVento("Document Date", "Cód. condición pago");
                                            rstMovLiq."Cód. divisa" := rstMovProv."Currency Code";
                                            rstMovLiq.Importe := rstMovProv."Amount (LCY)";
                                            rstMovLiq."Importe a pagar" := decImporteAPagar;
                                            rstMovLiq."Importe pendiente" := rstMovProv."Remaining Amt. (LCY)";
                                            rstMovLiq."Fecha pago" := WorkDate;
                                            rstMovLiq.Insert;

                                        end
                                        else begin

                                            rstMovLiq.Delete;

                                        end;

                                    end;

                                until rstPlazo.Next = 0;

                        end;

                    end
                    else begin

                        decImporte := decImporteAPagar;   // importe pagado
                        decImporteReg := decImporteAPagar;
                        decImporteDeuda := 0;

                        h += 1;
                        FechaVto := rstMovProv."Due Date";

                        if (datInicialDef <= FechaVto) and (FechaVto < datFinalDef) then begin
                            decImporteDeuda := decImporteReg;
                        end;

                        if (FechaVto < datInicial) and (FechaVto < datInicialDef)
                          and (i = 1) then begin
                            decImporteDeuda := decImporteReg;
                        end;

                        if (FechaVto > datFinal) and (FechaVto > datFinalDef)
                          and (i = 10) then begin
                            decImporteDeuda := decImporteReg;
                        end;

                        if decImporteDeuda <> 0 then begin

                            if (decImporteDeuda > decImporteAPagar) or (decImporteDeuda > (decImporteDeuda + fntSumaAPagar())) then
                                Error('No se puede ingresar una suma mayor a la adeudada');

                            if rstMovLiq."No. mov." = 0 then begin

                                if VerificarAusenciaLiquidacion(rstMovProv) then
                                    Error(Error001, rstMovLiq."No. Liquidacion");

                                rstMovLiq."No. Liquidacion" := codLiquidacion;
                                rstMovLiq."No. mov." := "Entry No.";
                                rstMovLiq."No. proveedor" := "Vendor No.";
                                rstMovLiq."No. documento" := "Document No.";
                                rstMovLiq."No. documento externo" := "External Document No.";
                                rstMovLiq."Fecha registro" := "Posting Date";
                                rstMovLiq."Fecha vencimiento" := FechaVto;
                                rstMovLiq."Cód. divisa" := "Currency Code";
                                rstMovLiq.Importe := "Amount (LCY)";
                                rstMovLiq."Importe a pagar" := decImporteAPagar;
                                rstMovLiq."Importe pendiente" := "Remaining Amt. (LCY)";
                                rstMovLiq."Fecha pago" := WorkDate;
                                rstMovLiq.Insert;

                            end
                            else begin

                                rstMovLiq.Delete;

                            end;

                        end;

                    end;

                end
                else begin

                    decImporte := decImporteAPagar;   // importe pagado
                    decImporteReg := decImporteAPagar;
                    decImporteDeuda := 0;

                    h += 1;
                    FechaVto := rstMovProv."Due Date";

                    if (datInicialDef <= FechaVto) and (FechaVto < datFinalDef) then begin
                        decImporteDeuda := decImporteReg;
                    end;

                    if (FechaVto < datInicial) and (FechaVto < datInicialDef)
                      and (i = 1) then begin
                        decImporteDeuda := decImporteReg;
                    end;

                    if (FechaVto > datFinal) and (FechaVto > datFinalDef)
                      and (i = 10) then begin
                        decImporteDeuda := decImporteReg;
                    end;

                    if decImporteDeuda <> 0 then begin

                        if (decImporteDeuda > decImporteAPagar) or (decImporteDeuda > (decImporteDeuda + fntSumaAPagar())) then
                            Error('No se puede ingresar una suma mayor a la adeudada');

                        if rstMovLiq."No. mov." = 0 then begin

                            if VerificarAusenciaLiquidacion(rstMovProv) then
                                Error(Error001, rstMovLiq."No. Liquidacion");

                            rstMovLiq."No. Liquidacion" := codLiquidacion;
                            rstMovLiq."No. mov." := "Entry No.";
                            rstMovLiq."No. proveedor" := "Vendor No.";
                            rstMovLiq."No. documento" := "Document No.";
                            rstMovLiq."No. documento externo" := "External Document No.";
                            rstMovLiq."Fecha registro" := "Posting Date";
                            rstMovLiq."Fecha vencimiento" := FechaVto;
                            rstMovLiq."Cód. divisa" := "Currency Code";
                            rstMovLiq.Importe := "Amount (LCY)";
                            rstMovLiq."Importe a pagar" := decImporteAPagar;
                            rstMovLiq."Importe pendiente" := "Remaining Amt. (LCY)";
                            rstMovLiq."Fecha pago" := WorkDate;
                            rstMovLiq.Insert;

                        end
                        else begin

                            rstMovLiq.Delete;

                        end;

                    end;

                end;

            until rstMovProv.Next = 0;

        CurrPage.Update(true);
    end;

    [Scope('OnPrem')]
    procedure VerificarAusenciaLiquidacion(rstMovProv: Record "Vendor Ledger Entry"): Boolean
    var
        l_rstMovLiq: Record "Lín. Liquidacion Pagos";
        rstTPago: Record "Payment Terms";
    begin
        Clear(l_rstMovLiq);
        l_rstMovLiq.SetFilter("No. Liquidacion", '%1', codLiquidacion);
        l_rstMovLiq.SetRange("No. mov.", rstMovProv."Entry No.");
        BuscaFecha(i);
        Clear(rstTPago);
        if rstTPago.Get("Cód. condición pago") then begin

            rstTPago.CalcFields(rstTPago."No. of Installments");
            if rstTPago."No. of Installments" > 0 then
                l_rstMovLiq.SetRange("Fecha vencimiento", fntCalcFVento("Document Date", "Cód. condición pago"))
            else
                l_rstMovLiq.SetRange("Fecha vencimiento", "Due Date");

        end;

        if l_rstMovLiq.FindFirst then
            exit(true)
        else
            exit(false);
    end;

    [Scope('OnPrem')]
    procedure StyleFormat(strImporte: Text[1024]): Text[1024]
    var
        decImporte: Decimal;
    begin
        /*IF EVALUATE(decImporte,strImporte) THEN
        BEGIN
         */
        if (fntSumaAPagar) <> 0 then
            exit('StrongAccent')
        else
            exit('StandardAccent');

        /*  IF decImporte <0 THEN
            EXIT('Attention');
          If decImporte = 0 then
            EXIT('StandardAccent');
            */
        /*
      END
      ELSE

        EXIT('StandardAccent');
          */

    end;

    [Scope('OnPrem')]
    procedure fntSumaAPagar(): Decimal
    var
        rstMovLiq: Record "Lín. Liquidacion Pagos";
    begin
        Clear(rstMovLiq);
        rstMovLiq.SetRange("No. mov.", "Entry No.");
        rstMovLiq.SetFilter(rstMovLiq."No. Liquidacion", '%1', codLiquidacion);
        rstMovLiq.CalcSums(rstMovLiq."Importe a pagar");
        if rstMovLiq.FindFirst then
            exit(rstMovLiq."Importe a pagar")
        else
            exit(0);
    end;

    [Scope('OnPrem')]
    procedure fntCalcFVentoInc(FechaVto: Date; codTPago: Code[10]): Date
    var
        rstPlazo: Record Installment;
        j: Integer;
    begin
        Clear(rstPlazo);
        j := 0;
        rstPlazo.SetRange(rstPlazo."Payment Terms Code", codTPago);
        if rstPlazo.Find('-') then
            repeat

                j += 1;
                FechaVto := CalcDate(rstPlazo."Gap between Installments", FechaVto);

            until (j = h) or (rstPlazo.Next = 0);

        exit(FechaVto);
    end;

    [Scope('OnPrem')]
    procedure VerificarProveedorEnLiquidacion(rstMovProv: Record "Vendor Ledger Entry"): Boolean
    var
        l_rstMovLiq: Record "Lín. Liquidacion Pagos";
    begin
        Clear(l_rstMovLiq);
        l_rstMovLiq.SetFilter("No. Liquidacion", '%1', codLiquidacion);
        l_rstMovLiq.SetRange(l_rstMovLiq."No. proveedor", rstMovProv."Vendor No.");
        if l_rstMovLiq.FindFirst then
            exit(true)
        else
            exit(false);
    end;

    [Scope('OnPrem')]
    procedure EliminarProveedorLiquidacion(rstMovProv: Record "Vendor Ledger Entry"): Boolean
    var
        l_rstMovLiq: Record "Lín. Liquidacion Pagos";
    begin
        Clear(l_rstMovLiq);
        l_rstMovLiq.SetFilter("No. Liquidacion", '%1', codLiquidacion);
        l_rstMovLiq.SetRange(l_rstMovLiq."No. proveedor", rstMovProv."Vendor No.");
        l_rstMovLiq.DeleteAll;

        exit;
    end;

    [Scope('OnPrem')]
    procedure GetLiq()
    var
        rstCabLiq: Record "Cab. Liquidacion Pagos";
    begin
        Clear(rstCabLiq);
        rstCabLiq.SetRange(Usuario, UserId);
        if rstCabLiq.FindLast then
            codLiquidacion := rstCabLiq."No. Liquidacion";
    end;
}

