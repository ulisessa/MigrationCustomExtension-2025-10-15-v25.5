pageextension 42 "Sales Order extension" extends "Sales Order"
{
    layout
    {
        modify("External Document No.")
        {

            trigger OnAfterValidate()
            var
                cduDigitalizarOAbrir: Codeunit Escaneado;
            begin
                "External Document No." := cduDigitalizarOAbrir.VerificarRemitoCliente("External Document No.");
            end;

            trigger OnAssistEdit()
            var
                rstHCabRemito: Record "Sales Shipment Header";
                frmDigitalizar: Page "Ruta digitalización";
                rstDigitalizar: Record "Ruta digitalizacion depto/espe";
                cduDigitalizarOAbrir: Codeunit Escaneado;
            begin

                //US.ARBU - 2005-06-08 - Inicio - Validaciones. Verificar que no exista un remito con el mismo número y para el mismo proveedor

                TestField("No.");
                TestField("Posting Date");
                TestField("Document Date");
                TestField("External Document No.");

                Clear(rstHCabRemito);
                rstHCabRemito.SetCurrentKey("External Document No.");
                rstHCabRemito.SetRange("External Document No.", "External Document No.");
                if rstHCabRemito.Find('-') then
                    Error('Ya existe el remito %1, registrado desde el pedido %2', "External Document No.", rstHCabRemito."Order No.");

                //US.ARBU - 2005-06-08 - Fin - Validaciones. Verificar que no exista un remito con el mismo número y para el mismo proveedor

                Clear(frmDigitalizar);
                Clear(rstDigitalizar);
                rstDigitalizar.SetFilter(rstDigitalizar.Documento, '%1', 'Egresos');
                if rstDigitalizar.Count <> 1 then
                    frmDigitalizar.funLlamarCapturador('', Format(Today), '', "Bill-to Customer No.", UserId, "External Document No.", Format("Posting Date"), "No.", '', '', '')
                else
                    frmDigitalizar.funLlamarCapturador('EGRESOS', Format(Today), '', "Bill-to Customer No.", UserId, "External Document No.", Format("Posting Date"), "No.", '', '', '');
                //frmDigitalizar.funLlamarCapturador('','','',"No.",USERID,"External Document No.",FORMAT("Posting Date"),"No.");
                frmDigitalizar.LookupMode(true);
                frmDigitalizar.SetTableView(rstDigitalizar);
                if frmDigitalizar.RunModal = ACTION::LookupOK then begin

                    frmDigitalizar.GetRecord(rstDigitalizar);
                    cduDigitalizarOAbrir.ImportarDocumento(rstDigitalizar.Documento,
                    Format(Today), rstDigitalizar.Departamento, "Sell-to Customer No.",
                    UserId, "External Document No.", Format("Posting Date"), "No.", '', '', '', rstDigitalizar, false, false, true, '', false, false);

                end;
            end;

        }
        addafter(Payment)
        {
            group(Reparto)
            {
                Caption = 'Reparto';
            }
            group("Cámaras")
            {
                CaptionML = ENU = 'Shipping', ESP = 'Cámaras';
                field("Permiso de embarque"; "Permiso de embarque")
                {
                }
                field("Seguimiento para trazabilidad"; "Seguimiento para trazabilidad")
                {
                }
                field("Puerto carga"; "Puerto carga")
                {
                }
                field("Puerto destino"; "Puerto destino")
                {
                }
                field("Cód. Contenedor"; "Container code")
                {
                }
                field("Precinto DGA"; "Precinto DGA")
                {
                }
                field(Precinto; Precinto)
                {
                }
            }
            group(Exportaciones)
            {
                CaptionML = ENU = 'Export', ESP = 'Exportación';
                field("Carpeta de Exportación"; "Carpeta de Exportación")
                {
                }
                field(Marcas; Marcas)
                {
                }
                field("Banco Interviniente"; "Banco Interviniente")
                {
                }
                field("Producido en"; "Producido en")
                {
                }
                field(Aprobar; Aprobar)
                {
                }
            }
            group(Dimensiones)
            {
                Caption = 'Dimensiones';
                field("Shortcut Dimension 3 Code"; "Shortcut Dimension 3 Code")
                {
                }
                field("Shortcut Dimension 4 Code"; "Shortcut Dimension 4 Code")
                {
                }
                field("Shortcut Dimension 5 Code"; "Shortcut Dimension 5 Code")
                {
                }
                field("Shortcut Dimension 6 Code"; "Shortcut Dimension 6 Code")
                {
                }
                field("Shortcut Dimension 7 Code"; "Shortcut Dimension 7 Code")
                {
                }
            }
        }
        movefirst(Dimensiones; "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code")
    }

    actions
    {
        addafter("&Print")
        {

            group(ShipmentManagement)
            {

                action("Test de remito")
                {

                    trigger OnAction()
                    var
                        ReportPrint: Report "Remito Venta-Test";
                        rstSH: Record "Sales Header";
                    begin
                        Clear(rstSH);
                        rstSH.Get(Rec."Document Type", Rec."No.");
                        rstSH.SetRecFilter();

                        ReportPrint.SetTableView(rstSH);
                        ReportPrint.RunModal;
                    end;
                }

                action(Create_or_open_Shipment)
                {
                    CaptionML = ENU = 'Create or Open Shipm&ent', ESP = '&Elaborar o abrir Remito';
                    ToolTipML = ENU = 'Create or Open a new shipment related to this Sales Order.', ESP = 'Crear o abrir un nuevo remito relacionado con este Pedido de Venta.';
                    Visible = true;
                    Image = Shipment;

                    trigger OnAction()
                    var
                        "---ARBUMASA---": Integer;
                        ConfVtas: Record "Sales & Receivables Setup";
                        rstCabAjuste: Record "Cab. remito ventas";
                        frmAjuste: Page Remito;
                        rstReparto: Record "Cab. Reparto";
                        rstLinReparto: Record "Lín. reparto";
                        rstAjuste: Record "Lín. ajuste ventas";

                        SalesHistoryBtnVisible: Boolean;

                        BillToCommentPictVisible: Boolean;

                        BillToCommentBtnVisible: Boolean;

                        SalesHistoryStnVisible: Boolean;
                        ImprimDoc: Codeunit "Document-Print";
                        strStatus: Text[200];
                        cduDigitalizarOAbrir: Codeunit Escaneado;
                    begin
                        ClearAll();
                        TestField("Document Type");
                        TestField("No.");
                        TestField("Sell-to Customer No.");
                        Clear(ConfVtas);
                        ConfVtas.Get();
                        if ConfVtas."Grupo contable Exportaciones" = "Customer Posting Group" then begin

                            TestField("Permiso de embarque");
                            TestField("Puerto carga");
                            TestField("Puerto destino");
                            TestField("External Document No.");

                        end;

                        Clear(rstCabAjuste);
                        if not rstCabAjuste.Get("External Document No.") then begin

                            Clear(rstCabAjuste);
                            rstCabAjuste."No. documento" := "External Document No.";
                            rstCabAjuste."Venta a-No. cliente" := "Sell-to Customer No.";
                            rstCabAjuste."Nombre cliente" := "Sell-to Customer Name";
                            rstCabAjuste."Fecha de remito" := "Posting Date";
                            rstCabAjuste."No. remito" := "External Document No.";
                            rstCabAjuste."Global Dimension 6" := "Shortcut Dimension 6 Code";
                            rstCabAjuste."Carpeta de Exportación" := "Carpeta de Exportación";
                            rstCabAjuste."Permiso de embarque" := "Permiso de embarque";
                            rstCabAjuste."Puerto embarque" := "Puerto carga";
                            rstCabAjuste."Puerto destino" := "Puerto destino";
                            rstCabAjuste."Cód. Contenedor" := "Container code";
                            rstCabAjuste."Tipo de Contenedor" := "Tipo de Contenedor";
                            rstCabAjuste."Precinto DGA" := "Precinto DGA";
                            rstCabAjuste."Currency Code" := "Currency Code";
                            rstCabAjuste."Currency Factor" := "Currency Factor";
                            rstCabAjuste.Precinto := Precinto;
                            rstCabAjuste."Modo transporte" := "Transport Method";
                            rstCabAjuste."Cód. transportista" := "Shipping Agent Code";
                            rstCabAjuste."Transport registration-chassis" := "Transport registration no.";
                            rstCabAjuste.Temperatura := Temperatura;
                            rstCabAjuste.Hora := Hora;
                            rstCabAjuste."Tipo de amparo sanitario" := "Tipo de amparo sanitario";
                            rstCabAjuste."No. amparo sanitario" := "Certification No.";
                            rstCabAjuste.Destino := Destino;
                            rstCabAjuste.Conductor := Conductor;
                            rstCabAjuste."Tipo documento" := "Document Type";
                            rstCabAjuste."Documento venta" := "No.";
                            rstCabAjuste."No. reparto" := "Quote No.";
                            rstCabAjuste.Insert;

                            Clear(rstAjuste);
                            rstAjuste.SetRange("No. documento", "External Document No.");

                            rstAjuste.DeleteAll;

                            Clear(rstReparto);
                            rstReparto.SetRange("No. Pedido", "No.");
                            if rstReparto.Find('-') then begin

                                Clear(rstLinReparto);
                                rstLinReparto.SetRange(rstLinReparto."No. Documento", rstReparto."No. Documento");
                                if rstLinReparto.Find('-') then
                                    repeat

                                        Clear(rstAjuste);
                                        rstAjuste.SetRange("No. documento", "External Document No.");
                                        rstAjuste.SetRange("No. producto", rstLinReparto."No. Producto");
                                        rstAjuste.SetRange("Lote origen", rstLinReparto."Lote origen");
                                        rstAjuste.SetRange("Seguimiento para trazabilidad", rstLinReparto."Seguimiento para trazabilidad");
                                        if rstAjuste.Find('-') then begin

                                            rstAjuste."Cantidad a reservar" += rstLinReparto."Reservar - UMB";
                                            rstAjuste.Modify;

                                        end
                                        else begin

                                            rstAjuste."No. documento" := "External Document No.";
                                            rstAjuste."No. producto" := rstLinReparto."No. Producto";
                                            rstAjuste."Lote origen" := rstLinReparto."Lote origen";
                                            rstAjuste."Seguimiento para trazabilidad" := rstLinReparto."Seguimiento para trazabilidad";
                                            rstAjuste."DCL application date formula" := rstLinReparto."DCL application date formula";
                                            rstAjuste."Tipo documento" := rstAjuste."Tipo documento"::Pedido;
                                            rstAjuste."Documento venta" := "No.";
                                            rstAjuste."No. producto" := rstLinReparto."No. Producto";
                                            rstAjuste.Descripción := rstLinReparto.Descripcion;
                                            rstAjuste."Cód. unidad medida" := rstLinReparto."Cod. unidad medida";
                                            rstAjuste."Cantidad a reservar" := rstLinReparto."Reservar - UMB";
                                            rstAjuste.Buque := rstLinReparto.Buque;
                                            rstAjuste.Marea := rstLinReparto.Marea;
                                            rstAjuste."No. reparto" := rstLinReparto."No. Documento";
                                            rstAjuste."Linea reparto" := rstLinReparto."No. línea";
                                            rstAjuste."Kilos brutos a reservar" := rstLinReparto."Reservar - KB";
                                            rstAjuste."Kilos netos a reservar" := rstLinReparto."Reservar - KN";
                                            rstAjuste.Insert;

                                        end;

                                    until rstLinReparto.Next = 0;

                            end;

                        end;

                        Clear(rstCabAjuste);
                        rstCabAjuste.SetRange(rstCabAjuste."No. documento", "External Document No.");
                        rstCabAjuste.SetRange(rstCabAjuste."Documento venta", "No.");
                        if not rstCabAjuste.FindFirst then
                            Error('Ya existe un Pedido de Venta con el mismo número de remito.')
                        else
                            rstCabAjuste.FindFirst;
                        //rstCabAjuste.get("External Document No.");

                        Clear(frmAjuste);
                        frmAjuste.SetTableView(rstCabAjuste);
                        //frmAjuste.SETRECORD(rstCabAjuste);
                        frmAjuste.Run();
                    end;
                }
                action("&Regenerar Remito")
                {
                    CaptionML = ENU = '&Regenerate Shipment', ESP = '&Regenerar Remito';
                    ToolTipML = ENU = 'When a Shipment already exists with the specified External Document No., this process removes it and recreates it using the related parameters in the Sales Order.', ESP = 'Cuando ya existe un remito con el número de documento externo especificado, este proceso lo elimina y lo recrea utilizando los parámetros relacionados en el Pedido de Venta.';
                    Image = UpdateShipment;
                    Visible = true;

                    trigger OnAction()
                    var
                        "---ARBUMASA---": Integer;
                        ConfVtas: Record "Sales & Receivables Setup";
                        rstCabAjuste: Record "Cab. remito ventas";
                        frmAjuste: Page Remito;
                        rstReparto: Record "Cab. Reparto";
                        rstLinReparto: Record "Lín. reparto";
                        rstAjuste: Record "Lín. ajuste ventas";

                        SalesHistoryBtnVisible: Boolean;

                        BillToCommentPictVisible: Boolean;

                        BillToCommentBtnVisible: Boolean;

                        SalesHistoryStnVisible: Boolean;
                        ImprimDoc: Codeunit "Document-Print";
                        strStatus: Text[200];
                        cduDigitalizarOAbrir: Codeunit Escaneado;
                    begin
                        TestField("Document Type");
                        TestField("No.");
                        TestField("Sell-to Customer No.");

                        Clear(ConfVtas);
                        ConfVtas.Get();
                        if ConfVtas."Grupo contable Exportaciones" = "Customer Posting Group" then begin

                            TestField("Permiso de embarque");
                            TestField("Puerto carga");
                            TestField("Puerto destino");
                            TestField("External Document No.");

                        end;

                        Clear(rstCabAjuste);
                        if rstCabAjuste.Get("External Document No.") then
                            rstCabAjuste.Delete(true);

                        Clear(rstCabAjuste);
                        if not rstCabAjuste.Get("External Document No.") then begin

                            Clear(rstCabAjuste);
                            rstCabAjuste."No. documento" := "External Document No.";
                            rstCabAjuste."Venta a-No. cliente" := "Sell-to Customer No.";
                            rstCabAjuste."Nombre cliente" := "Sell-to Customer Name";
                            rstCabAjuste."Fecha de remito" := "Posting Date";
                            rstCabAjuste."No. remito" := "External Document No.";
                            rstCabAjuste."Global Dimension 6" := "Shortcut Dimension 6 Code";
                            rstCabAjuste."Carpeta de Exportación" := "Carpeta de Exportación";
                            rstCabAjuste."Permiso de embarque" := "Permiso de embarque";
                            rstCabAjuste."Puerto embarque" := "Puerto carga";
                            rstCabAjuste."Puerto destino" := "Puerto destino";
                            rstCabAjuste."Cód. Contenedor" := "Container code";
                            rstCabAjuste."Tipo de Contenedor" := "Tipo de Contenedor";
                            rstCabAjuste."Precinto DGA" := "Precinto DGA";
                            rstCabAjuste."Currency Code" := "Currency Code";
                            rstCabAjuste."Currency Factor" := "Currency Factor";
                            rstCabAjuste.Precinto := Precinto;
                            rstCabAjuste."Modo transporte" := "Transport Method";
                            rstCabAjuste."Cód. transportista" := "Shipping Agent Code";
                            rstCabAjuste."Transport registration-chassis" := "Transport registration no.";
                            rstCabAjuste.Temperatura := Temperatura;
                            rstCabAjuste.Hora := Hora;
                            rstCabAjuste."Tipo de amparo sanitario" := "Tipo de amparo sanitario";
                            rstCabAjuste."No. amparo sanitario" := "Certification No.";
                            rstCabAjuste.Destino := Destino;
                            rstCabAjuste.Conductor := Conductor;
                            rstCabAjuste."Tipo documento" := "Document Type";
                            rstCabAjuste."Documento venta" := "No.";
                            rstCabAjuste."No. reparto" := "Quote No.";
                            rstCabAjuste.Insert;

                        end;

                        Clear(rstAjuste);
                        rstAjuste.SetRange("No. documento", "External Document No.");
                        rstAjuste.DeleteAll(true);

                        Clear(rstReparto);
                        rstReparto.SetRange("No. Pedido", "No.");
                        if rstReparto.Find('-') then begin

                            Clear(rstLinReparto);
                            rstLinReparto.SetRange(rstLinReparto."No. Documento", rstReparto."No. Documento");
                            //rstLinReparto.SETRANGE("Tipo movimiento",rstLinReparto."Tipo movimiento"::Venta);
                            if rstLinReparto.Find('-') then
                                repeat

                                    Clear(rstAjuste);
                                    rstAjuste.SetRange("No. documento", "External Document No.");
                                    rstAjuste.SetRange("No. producto", rstLinReparto."No. Producto");
                                    rstAjuste.SetRange("Lote origen", rstLinReparto."Lote origen");
                                    rstAjuste.SetRange("Seguimiento para trazabilidad", rstLinReparto."Seguimiento para trazabilidad");
                                    if rstAjuste.Find('-') then begin

                                        rstAjuste."Cantidad a reservar" += rstLinReparto."Reservar - UMB";
                                        rstAjuste.Modify;

                                    end
                                    else begin

                                        rstAjuste."No. documento" := "External Document No.";
                                        rstAjuste."No. producto" := rstLinReparto."No. Producto";
                                        rstAjuste."Lote origen" := rstLinReparto."Lote origen";
                                        rstAjuste."Seguimiento para trazabilidad" := rstLinReparto."Seguimiento para trazabilidad";
                                        rstAjuste."DCL application date formula" := rstLinReparto."DCL application date formula";
                                        rstAjuste."Tipo documento" := rstAjuste."Tipo documento"::Pedido;
                                        rstAjuste."Documento venta" := "No.";
                                        rstAjuste."No. producto" := rstLinReparto."No. Producto";
                                        rstAjuste.Descripción := rstLinReparto.Descripcion;
                                        rstAjuste."Cód. unidad medida" := rstLinReparto."Cod. unidad medida";
                                        rstAjuste."Cantidad a reservar" := rstLinReparto."Reservar - UMB";
                                        rstAjuste.Buque := rstLinReparto.Buque;
                                        rstAjuste.Marea := rstLinReparto.Marea;
                                        rstAjuste."No. reparto" := rstLinReparto."No. Documento";
                                        rstAjuste."Linea reparto" := rstLinReparto."No. línea";
                                        rstAjuste."Kilos brutos a reservar" := rstLinReparto."Reservar - KN";
                                        rstAjuste."Kilos netos a reservar" := rstLinReparto."Reservar - KB";
                                        rstAjuste.Insert;

                                    end;

                                until rstLinReparto.Next = 0;

                        end;

                        rstCabAjuste.SetRange("Documento venta", "No.");
                        rstCabAjuste.Get("External Document No.");

                        Clear(frmAjuste);
                        frmAjuste.SetTableView(rstCabAjuste);
                        frmAjuste.SetRecord(rstCabAjuste);
                        frmAjuste.Run();
                    end;
                }
            }
        }
        addfirst(Category_Category13)
        {
            actionref(Create_or_open_Shipment_Promoted; Create_or_open_Shipment)
            {
            }
            actionref("&Regenerar Remito_Promoted"; "&Regenerar Remito")
            {
            }
        }
        addfirst(Category_Report)
        {
            actionref(Test_de_Remito_Promoted; "Test de remito")
            {
            }
        }
        modify(Category_Category10)
        {
            CaptionML = ENU = 'History', ESP = 'Historial';
        }
        modify(Category_Category11)
        {
            CaptionML = ENU = 'Print/Send', ESP = 'Imprimir/Enviar';
        }
        modify(Category_Category12)
        {
            CaptionML = ENU = 'Navigate', ESP = 'Navegar';
        }
        modify(Category_Category13)
        {
            CaptionML = ENU = 'Shipment Management', ESP = 'Gestión de Remitos';
        }
        modify(Category_Category4)
        {
            CaptionML = ENU = 'Approve', ESP = 'Aprobar';
        }
        modify(Category_Category5)
        {
            CaptionML = ENU = 'Release', ESP = 'Publicar';
        }
        modify(Category_Category6)
        {
            CaptionML = ENU = 'Posting', ESP = 'Contabilizar';
        }
        modify(Category_Category7)
        {
            CaptionML = ENU = 'Prepare', ESP = 'Preparar';
        }
        modify(Category_Category8)
        {
            CaptionML = ENU = 'Order', ESP = 'Orden';
        }
        modify(Category_Category9)
        {
            CaptionML = ENU = 'Request Approval', ESP = 'Solicitar aprobación';
        }
        modify(Category_New)
        {
            CaptionML = ENU = 'New', ESP = 'Nuevo';
        }
        modify(Category_Process)
        {
            CaptionML = ENU = 'Process', ESP = 'Procesar';
        }
        modify(Category_Report)
        {
            CaptionML = ENU = 'Report', ESP = 'Informe';
        }
    }

    var
        myInt: Integer;
}