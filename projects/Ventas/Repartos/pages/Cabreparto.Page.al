page 50600 "Cab. reparto"
{
    DeleteAllowed = false;
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = "Cab. Reparto";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group("General")
            {
                Caption = 'General';
                //The GridLayout property is only supported on controls of type Grid
                //GridLayout = Columns;
                field("No. Documento"; "No. Documento")
                {
                    Editable = false;
                    QuickEntry = false;
                }
                field("Loading port"; "Loading port")
                {
                    Editable = NOT blnRegistrado;
                }
                field("Exit port"; "Exit port")
                {
                    Editable = NOT blnRegistrado;
                }
                field(Actividad; Actividad)
                {
                    CaptionClass = '1,2,2';
                    Editable = NOT blnRegistrado;
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
                }
                field("No. Pedido"; "No. Pedido")
                {
                    Editable = false;
                    Lookup = true;

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        pagSO: Page "Sales Order";
                        rst36: Record "Sales Header";
                    begin
                        Clear(rst36);
                        if rst36.Get(rst36."Document Type"::Order, "No. Pedido") then begin

                            rst36.SetRecFilter;
                            Clear(pagSO);
                            pagSO.SetTableView(rst36);
                            pagSO.Run;

                        end;
                    end;
                }
                field(Folder; Folder)
                {
                    Editable = NOT blnRegistrado;
                }
                field(Estado; Estado)
                {
                    Editable = NOT blnRegistrado;
                }
                field("Fecha reparto"; "Fecha reparto")
                {
                    Editable = NOT blnRegistrado;
                }
                field("Permiso de Embarque"; "Permiso de Embarque")
                {
                    Editable = true;
                }
            }
            group("Clientes")
            {
                Caption = 'Clientes';
                Editable = NOT blnRegistrado;
                //The GridLayout property is only supported on controls of type Grid
                //GridLayout = Columns;
                field(Cliente; Cliente)
                {
                }
                field("Nombre cliente"; "Nombre cliente")
                {
                    Editable = false;
                    ShowCaption = false;
                }
                field("Shipment address"; "Shipment address")
                {
                }
                field("Cliente factura"; "Cliente factura")
                {
                }
                field("Nombre cliente factura"; "Nombre cliente factura")
                {
                    Editable = false;
                    ShowCaption = false;
                }
                field("Invoice address"; "Invoice address")
                {
                }
            }
            group("Envío")
            {
                Caption = 'Envío';
                Editable = NOT blnRegistrado;
                //The GridLayout property is only supported on controls of type Grid
                //GridLayout = Columns;
                field("Container type"; "Container type")
                {
                }
                field("Quantity of containers"; "Quantity of containers")
                {
                }
                field(Transportista; Transportista)
                {
                }
                field("Destination port"; "Destination port")
                {
                }
            }
            group("Condiciones venta")
            {
                Caption = 'Condiciones venta';
                Editable = NOT blnRegistrado;
                //The GridLayout property is only supported on controls of type Grid
                //GridLayout = Columns;
                field("Payment terms"; "Payment terms")
                {
                }
                field("Sales conditions"; "Sales conditions")
                {
                }
                field("Beneficiary bank"; "Beneficiary bank")
                {
                }
                field("Corresponsal bank"; "Corresponsal bank")
                {
                }
            }
            group("Cumplido")
            {
                Caption = 'Cumplido';
                field("Fecha cumplido"; "Fecha cumplido")
                {
                    Caption = 'Fecha cumplido';
                }
                field("Currency Code"; "Currency Code")
                {
                    Caption = 'Currency Code';

                    trigger OnAssistEdit()
                    begin
                        Clear(ChangeExchangeRate);
                        if "Fecha cumplido" <> 0D then
                            ChangeExchangeRate.SetParameter("Currency Code", "Currency Factor", "Fecha cumplido")
                        else
                            ChangeExchangeRate.SetParameter("Currency Code", "Currency Factor", WorkDate);
                        if ChangeExchangeRate.RunModal = ACTION::OK then begin
                            Validate("Currency Factor", ChangeExchangeRate.GetParameter);
                            CurrPage.Update;
                        end;
                        Clear(ChangeExchangeRate);
                    end;
                }
                field("Tipo cambio oficialización"; decCF)
                {
                    Caption = 'Tipo cambio cumplido';
                    Editable = false;
                }
                field("Divisa recupero"; "Recovery Currency Code")
                {
                    Caption = 'Currency Code';

                    trigger OnAssistEdit()
                    begin
                        Clear(ChangeExchangeRate);
                        if "Fecha cumplido" <> 0D then
                            ChangeExchangeRate.SetParameter("Recovery Currency Code", "Recovery Currency Factor", "Fecha cumplido")
                        else
                            ChangeExchangeRate.SetParameter("Recovery Currency Code", "Recovery Currency Factor", WorkDate);
                        if ChangeExchangeRate.RunModal = ACTION::OK then begin
                            Validate("Recovery Currency Factor", ChangeExchangeRate.GetParameter);
                            CurrPage.Update;
                        end;
                        Clear(ChangeExchangeRate);
                    end;
                }
                field("Tipo cambio recupero"; decCFR)
                {
                    Caption = 'Tipo cambio recupero';
                    Editable = false;
                }
                field("Fecha oficializacion"; "Fecha oficializacion")
                {
                    Caption = 'Fecha oficialización';
                }
                field("Officialization Currency Code"; "Officialization Curr. Code")
                {
                    Caption = 'Officializatoin Currency Code';

                    trigger OnAssistEdit()
                    begin
                        Clear(ChangeExchangeRate);
                        if "Fecha oficializacion" <> 0D then
                            ChangeExchangeRate.SetParameter("Officialization Curr. Code", "Officialization Curr. Factor", "Fecha oficializacion")
                        else
                            ChangeExchangeRate.SetParameter("Officialization Curr. Code", "Officialization Curr. Factor", WorkDate);
                        if ChangeExchangeRate.RunModal = ACTION::OK then begin
                            Validate("Officialization Curr. Factor", ChangeExchangeRate.GetParameter);
                            CurrPage.Update;
                        end;
                        Clear(ChangeExchangeRate);
                    end;
                }
                field("Officialization Curr. factor"; decCFO)
                {
                    Caption = 'Tipo cambio oficialización';
                    Editable = false;
                }
            }
            group(Control1000000024)
            {
                ShowCaption = false;
                part(pgeStockPescaTreeview; "Item Sales List")
                {
                    SubPageLink = "Global Dimension 2 Code" = FIELD(Actividad);
                }
                part(Treeview; "Stock pesca treeview bis")
                {
                    Editable = NOT blnRegistrado;
                    Provider = pgeStockPescaTreeview;
                    SubPageLink = "Item No." = FIELD("No.");
                }
            }
            group(Control1000000027)
            {
                Editable = NOT blnRegistrado;
                ShowCaption = false;
                part(Control1000000025; "Lín. reparto")
                {
                    Editable = NOT blnRegistrado;
                    SubPageLink = "No. Documento" = FIELD("No. Documento");
                }
                part(Control1000000010; "Reparto por producto")
                {
                    ShowFilter = false;
                    SubPageLink = "Filtro factura" = FIELD("No. Documento");
                    Visible = false;
                }
                part("<Reparto por proyecto>"; "Reparto por lote")
                {
                    Caption = 'Reparto por proyecto';
                    ShowFilter = false;
                    SubPageLink = "Filtro factura venta" = FIELD("No. Documento");
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Get items")
            {
                CaptionML = ENU = '&Get items', ESP = 'Obtener &productos';
                Image = GetEntries;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    i: Integer;
                begin
                    Clear(rstProductosExportacion);
                    rstProductosExportacion.SetRange(rstProductosExportacion."Exportación", true);
                    if Actividad <> '' then
                        rstProductosExportacion.SetFilter(rstProductosExportacion."Global Dimension 2 Code", Actividad);
                    if rstProductosExportacion.Find('-') then
                        repeat

                            i += 10000;
                            Clear(rstLotes);
                            Clear(rstProducto);
                            Clear(rstUnidadMedidadProducto);
                            rstLotes."No. Documento" := "No. Documento";
                            rstLotes."No. Producto" := rstProductosExportacion."No.";
                            rstLotes.Actividad := rstProductosExportacion."Global Dimension 2 Code";
                            rstLotes."No. línea" := i;
                            rstProducto.Get(rstLotes."No. Producto");
                            rstLotes.Descripcion := rstProducto.Description;
                            if rstProducto."Sales Unit of Measure" <> '' then begin

                                rstLotes."Cod. unidad medida" := rstProducto."Sales Unit of Measure";
                                rstUnidadMedidadProducto.Get(rstProducto."No.", rstProducto."Sales Unit of Measure");
                                rstLotes.Validate("Cantidad x Unidad Medida", rstUnidadMedidadProducto."Qty. per Unit of Measure");

                            end
                            else begin

                                rstLotes."Cod. unidad medida" := rstProducto."Base Unit of Measure";
                                rstLotes.Validate("Cantidad x Unidad Medida", 1);

                            end;

                            if rstLotes."No. línea" <> 0 then
                                rstLotes.Insert;

                            rstLotes.CalcFields("Existencias - UMB");
                            if rstLotes."Existencias - UMB" = 0 then
                                rstLotes.Delete;

                        until rstProductosExportacion.Next = 0;

                    CurrPage.Treeview.PAGE.fntFiltroDocumento("No. Documento", Actividad);
                    CurrPage.pgeStockPescaTreeview.PAGE.GETRECORD(rstItem);
                    CurrPage.Treeview.PAGE.fntFiltrarLegajo(rstItem."No.");
                    CurrPage.UPDATE;


                end;
            }
            action("Get lots")
            {
                CaptionML = ENU = '&Get lots', ESP = '&Obtener lotes';
                Image = GetLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    i: Integer;
                begin

                    CLEAR(rstProductosExportacion);
                    rstProductosExportacion.SETRANGE(rstProductosExportacion.Exportación, TRUE);
                    IF Actividad <> '' THEN
                        rstProductosExportacion.SETFILTER(rstProductosExportacion."Global Dimension 2 Code", Actividad);
                    IF rstProductosExportacion.FIND('-') THEN
                        REPEAT

                            i += 10000;
                            CLEAR(rstLotes);
                            CLEAR(rstProducto);
                            CLEAR(rstUnidadMedidadProducto);
                            rstLotes."No. Documento" := "No. Documento";
                            rstLotes."No. Producto" := rstProductosExportacion."No.";
                            rstLotes.Actividad := rstProductosExportacion."Global Dimension 2 Code";
                            rstLotes."No. línea" := i;
                            rstProducto.GET(rstLotes."No. Producto");
                            rstLotes.Descripcion := rstProducto.Description;
                            IF rstProducto."Sales Unit of Measure" <> '' THEN BEGIN

                                rstLotes."Cod. unidad medida" := rstProducto."Sales Unit of Measure";
                                rstUnidadMedidadProducto.GET(rstProducto."No.", rstProducto."Sales Unit of Measure");
                                rstLotes.VALIDATE("Cantidad x Unidad Medida", rstUnidadMedidadProducto."Qty. per Unit of Measure");

                            END
                            ELSE BEGIN

                                rstLotes."Cod. unidad medida" := rstProducto."Base Unit of Measure";
                                rstLotes.VALIDATE("Cantidad x Unidad Medida", 1);

                            END;

                            IF rstLotes."No. línea" <> 0 THEN
                                rstLotes.INSERT;

                            rstLotes.CALCFIELDS("Existencias - UMB");
                            IF rstLotes."Existencias - UMB" = 0 THEN
                                rstLotes.DELETE;

                        UNTIL rstProductosExportacion.NEXT = 0;

                    CurrPage.Treeview.PAGE.fntFiltroDocumento("No. Documento", Actividad);
                    CurrPage.pgeStockPescaTreeview.PAGE.GetRecord(rstItem);
                    CurrPage.Treeview.PAGE.fntFiltrarLegajo(rstItem."No.");
                    CurrPage.Update;

                end;
            }
            action("Activate Distribution")
            {
                CaptionML = ENU = 'Activate &Distribution', ESP = 'Activar &Distribución';
                Enabled = false;
                Image = DistributionGroup;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    SetRange("No. Documento", "No. Documento");
                    SetRecFilter();

                    TestField("No. Documento");
                    TestField("Fecha reparto");
                    TestField(Usuario);
                    TestField(Cliente);
                    TestField("Container type");
                    TestField("Loading port");
                    TestField(Transportista);
                    TestField("Destination port");
                    //TESTFIELD(Actividad);

                    Clear(fntCrearLineas);
                    Clear(rstLinReparto);
                    //fntCrearLineas.CrearLineasExistencias(rstLinReparto,Rec);
                    fntCrearLineas.ActualizarLineasExistencias(Rec);
                    Clear(cduMensajeria);
                    Clear(rstConfUsu);
                    Clear(rstMensajeria);

                    rstConfUsu.Reset;
                    if rstConfUsu.Get(UserId) then
                        cduMensajeria.RegistrarMensaje('Alta de Reparto', '', "No. Documento", 'Reparto (ventas)', 'Abierto', Today,
                        rstMensajeria."Tipo movimiento"::"Mensaje con Seguimiento", rstConfUsu.Grupo, '', '', '', '', '', '', '');

                    pge50604.SetTableView(Rec);
                    pge50604.fntPasarDoc("No. Documento");
                    pge50604.Run;
                end;
            }
            action("Imprimir reparto")
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                var
                    rstCabReparto: Record "Cab. Reparto";
                    repReparto: Report Reparto;
                begin
                    Clear(rstCabReparto);
                    CurrPage.SetSelectionFilter(rstCabReparto);
                    repReparto.SetTableView(rstCabReparto);
                    repReparto.Run;
                end;
            }
            action("Imprimir proforma")
            {
                CaptionML = ENU = 'Print pro-forma invoice', ESP = 'Imprimir proforma';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                var
                    rstCabReparto: Record "Cab. Reparto";
                    repReparto: Report "Pro forma invoice";
                begin
                    Clear(rstCabReparto);
                    CurrPage.SetSelectionFilter(rstCabReparto);
                    repReparto.SetTableView(rstCabReparto);
                    repReparto.Run;
                end;
            }
            action("Imprimir control DCL Pre-Expo")
            {
                CaptionML = ENU = 'Print DCL Pre-Expo control', ESP = 'Imprimir control DCL Pre-Expo';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                var
                    rpt50038: Report "CCL/CCC";
                    rstDCLApp: Record "DCL Application Lines";
                begin
                    Clear(rstDCLApp);
                    rstDCLApp.SetRange(rstDCLApp."Applied document no.", "No. Documento");
                    rpt50038.SetTableView(rstDCLApp);
                    rpt50038.RunModal;
                end;
            }
            action("Te&xtos adicionales")
            {
                CaptionML = ENU = 'E&xtended Texts', ESP = 'Te&xtos adicionales';
                Image = Text;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Extended Text List";
                RunPageLink = "Table Name" = const(Reparto),
                              "No." = FIELD("No. Documento");
                RunPageView = SORTING("Table Name", "No.", "Language Code", "All Language Codes", "Starting Date", "Ending Date");
            }
            group("&Registro")
            {
                CaptionML = ENU = '&Post', ESP = '&Registro';
                action(Registrar)
                {
                    CaptionML = ENU = 'Post', ESP = 'Registrar';
                    Image = Post;
                    Promoted = true;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';
                    Visible = NOT blnRegistrado;

                    trigger OnAction()
                    var
                        cduFishing: Codeunit "ExtensiónVentas";
                    begin
                        if Confirm('¿Desea registrar este reparto?') then begin

                            if cduFishing.fntRegistroReparto(Rec, rstLinReparto, false) then
                                Message('Reparto registrado.')
                            else
                                Message('No se ha completado el registro.');

                        end;
                    end;
                }
                action("Registrar e &imprimir")
                {
                    CaptionML = ENU = 'Post and &Print', ESP = 'Registrar e &imprimir';
                    Ellipsis = true;
                    Image = PostPrint;
                    Promoted = true;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+F9';
                    Visible = NOT blnRegistrado;

                    trigger OnAction()
                    var
                        CabVale: Record "Cab. Vale consumo";
                        rptVC: Report Reparto;
                        cduFishing: Codeunit "ExtensiónVentas";
                        rstCab: Record "Cab. Reparto";
                    begin
                        if Confirm('¿Desea registrar este reparto?') then begin

                            if cduFishing.fntRegistroReparto(Rec, rstLinReparto, false) then
                                Message('Reparto registrado.')
                            else
                                Message('No se ha completado el registro');

                            Clear(rptVC);
                            Clear(rstCab);
                            CurrPage.SetSelectionFilter(rstCab);
                            REPORT.Run(50597, false, true, rstCab);

                        end;
                    end;
                }
                action("&Revertir")
                {
                    CaptionML = ENU = '&Revert', ESP = '&Revertir';
                    Enabled = blnRegistrado;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;
                    Visible = blnRegistrado;

                    trigger OnAction()
                    var
                        cduFishing: Codeunit "ExtensiónVentas";
                    begin
                        if Confirm('¿Desea revertir este reparto?') then begin

                            if cduFishing.fntRegistroReparto(Rec, rstLinReparto, true) then
                                Message('El reparto fue revertido.')
                            else
                                Message('No se ha completado la reversión');

                        end;
                    end;
                }
            }
            group(Acciones)
            {
                CaptionML = ENU = 'A&ctions', ESP = 'A&cciones';
                action("<Action1000000666>")
                {
                    CaptionML = ENU = '&Scan', ESP = 'Digitalizar';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        frmDigitalizar: Page "Ruta digitalización";
                        cduDigitalizarOAbrir: Codeunit Escaneado;
                        rstDigitalizar: Record "Ruta digitalizacion depto/espe";
                        rstConfusu: Record "User Setup";
                    begin
                        Clear(frmDigitalizar);
                        Clear(rstDigitalizar);
                        Clear(rstConfusu);
                        rstConfusu.Get(UserId);
                        //rstDigitalizar.SETRANGE(Documento,'Descarga');
                        rstDigitalizar.SetRange(Departamento, rstConfusu.Grupo);
                        frmDigitalizar.funLlamarCapturador('Reparto', "No. Documento", '', "No. Documento", '', '', '', '', '', '', '');
                        frmDigitalizar.LookupMode(true);
                        frmDigitalizar.SetTableView(rstDigitalizar);
                        if frmDigitalizar.RunModal = ACTION::LookupOK then begin

                            Clear(cduDigitalizarOAbrir);
                            frmDigitalizar.GetRecord(rstDigitalizar);
                            cduDigitalizarOAbrir.ImportarDocumento(rstDigitalizar.Documento,
                            Format(Today), rstDigitalizar.Departamento, "No. Documento", UserId, "No. Documento", Format(Today), '', '', '', '',
                            rstDigitalizar, false, false, true, '', false, false);

                        end;
                    end;
                }
                action("Copiar a nuevo")
                {
                    CaptionML = ENU = 'Crear nuevo reparto a partir de este', ESP = 'Create copy of this';
                    Image = Copy;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        rstCabreparto: Record "Cab. Reparto";
                    begin
                        if Confirm('Si prosigue, creará una nueva cabecera de Reparto con la misma información de cabecera que la actual. ¿Desea avanzar?') then begin

                            rstConfVentas.Get();
                            Clear(rstCabreparto);
                            rstCabreparto.Copy(Rec);
                            rstCabreparto."No. Documento" := fntNroSerie.GetNextNo(rstConfVentas."No. serie repartos", Today, true);
                            rstCabreparto."Fecha reparto" := Today;
                            rstCabreparto."No. Pedido" := '';
                            rstCabreparto.Usuario := UserId;
                            rstCabreparto."Currency Code" := '';
                            rstCabreparto."Currency Factor" := 0;
                            rstCabreparto."Fecha cumplido" := 0D;
                            rstCabreparto."Fecha oficializacion" := 0D;
                            rstCabreparto."Fecha reparto" := 0D;
                            rstCabreparto."Fecha registro" := 0D;
                            rstCabreparto."Recovery Currency Code" := '';
                            rstCabreparto."Recovery Currency Factor" := 0;
                            rstCabreparto.Insert(true);
                            CurrPage.Update(false);

                            Message('Se ha creado la cabecera No. %1', rstCabreparto."No. Documento");

                        end
                        else
                            Error('Se ha detenido la copia');
                    end;
                }
                action("Regenerar distribución por DCL")
                {

                    trigger OnAction()
                    var
                        cdu50088: Codeunit "DCL Management";
                        rst32: Record "Item Ledger Entry";
                        rst32Stock: Record "Item Ledger Entry";
                        rstDCLApp: Record "DCL Application Lines";
                        l_rstSSH: Record "Sales Shipment Header";
                        l_rstSCH: Record "Sales Cr.Memo Header";
                        l_rstSIH: Record "Sales Invoice Header";
                    begin
                        TestField("Permiso de Embarque");
                        Clear(l_rstSSH);
                        l_rstSSH.SetRange("Permiso de embarque", "Permiso de Embarque");
                        if l_rstSSH.FindSet then
                            repeat
                                Clear(cdu50088);
                                Clear(rst32Stock);
                                Clear(rst32);
                                rst32.SetRange("Document No.", l_rstSSH."No.");
                                rst32.SetRange("Entry Type", rst32."Entry Type"::Sale);
                                rst32.SetRange(Revertido, false);
                                rst32.SetRange("Entry Type", rst32."Entry Type"::Sale);
                                if rst32.FindSet then
                                    repeat
                                        cdu50088.fntRegistrarAplicacionDCL(rst32);
                                    until rst32.Next = 0;
                            until l_rstSSH.Next = 0;


                        Clear(l_rstSCH);
                        l_rstSCH.SetRange("Permiso de embarque", "Permiso de Embarque");
                        if l_rstSCH.FindSet then
                            repeat
                                Clear(cdu50088);
                                Clear(rst32Stock);
                                Clear(rst32);
                                rst32.SetRange("Document No.", l_rstSCH."No.");
                                rst32.SetRange("Entry Type", rst32."Entry Type"::Sale);
                                rst32.SetRange(Revertido, false);
                                rst32.SetRange("Entry Type", rst32."Entry Type"::Sale);
                                if rst32.FindSet then
                                    repeat
                                        cdu50088.fntRegistrarAplicacionDCL(rst32);
                                    until rst32.Next = 0;
                            until l_rstSCH.Next = 0;

                        Clear(l_rstSIH);
                        l_rstSIH.SetRange("Permiso de embarque", "Permiso de Embarque");
                        if l_rstSIH.FindSet then
                            repeat
                                Clear(rst32Stock);
                                Clear(rst32);
                                rst32.SetRange("Document No.", l_rstSIH."No.");
                                rst32.SetRange("Entry Type", rst32."Entry Type"::Sale);
                                rst32.SetRange(Revertido, false);
                                rst32.SetRange("Entry Type", rst32."Entry Type"::Sale);
                                if rst32.FindSet then
                                    repeat
                                        cdu50088.fntRegistrarAplicacionDCL(rst32);
                                    until rst32.Next = 0;
                            until l_rstSIH.Next = 0;
                    end;
                }
            }
        }
    }

    var
        cduGenerarReparto: Codeunit "Registro diarios";
        rstConfVentas: Record "Sales & Receivables Setup";
        fntNroSerie: Codeunit "No. Series";
        fntCrearLineas: Codeunit "ExtensiónVentas";
        rstLinReparto: Record "Lín. reparto";
        cduMensajeria: Codeunit "Mensajería";
        rstConfUsu: Record "User Setup";
        rstMensajeria: Record Mensajeria;
        rstProductosExportacion: Record Item;
        rstLotes: Record "Lín. reparto";
        rstProducto: Record Item;
        rstUnidadMedidadProducto: Record "Item Unit of Measure";
        i: Integer;
        Text19046221: Label 'Seleccione los productos que desea vender';
        pge50604: Page "Reparto nuevo";
        ChangeExchangeRate: Page "Change Exchange Rate";
        blnRegistrado: Boolean;
        rstItem: Record Item;
        codFiltroPRoducto: Text;
        decCF: Decimal;
        decCFR: Decimal;
        decCFO: Decimal;

    trigger OnAfterGetRecord()
    begin
        CalcFields(Estado);
        if (Estado in ['Abierto', '']) then
            blnRegistrado := false
        else
            blnRegistrado := true;

        fntTC;

        CurrPage.Update(false);
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        if blnRegistrado then
            Error('No puede eliminar un reparto registrado. Reviértalo primero.');
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        rstConfVentas.Get();
        "No. Documento" := fntNroSerie.GetNextNo(rstConfVentas."No. serie repartos", Today, true);
        "Fecha reparto" := Today;
        Usuario := UserId;
        CurrPage.Update(false);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        fntTC;
    end;

    trigger OnOpenPage()
    begin
        //blnRegistrado := TRUE;
    end;

    local procedure fntTC()
    begin
        decCF := 0;
        if "Currency Factor" <> 0 then
            decCF := 1 / "Currency Factor";

        decCFR := 0;
        if "Recovery Currency Factor" <> 0 then
            decCFR := 1 / "Recovery Currency Factor";

        decCFO := 0;
        if "Officialization Curr. Factor" <> 0 then
            decCFO := 1 / "Officialization Curr. Factor";
    end;

}

