page 50603 "Reparto 1"
{
    AutoSplitKey = false;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Cab. Reparto";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                label(Control1)
                {
                    CaptionClass = Text19046221;
                    ShowCaption = false;
                }
                field("'Usted está trabajando con el documento No.: '"; 'Usted está trabajando con el documento No.: ')
                {
                    Editable = false;
                }
                field("No. Documento"; "No. Documento")
                {
                    Editable = false;
                }
                field(Cliente; Cliente)
                {
                }
                field("Nombre cliente"; "Nombre cliente")
                {
                    Editable = false;
                }
                field("Cliente factura"; "Cliente factura")
                {
                }
                field("Nombre cliente factura"; "Nombre cliente factura")
                {
                    Editable = false;
                }
                field("Container type"; "Container type")
                {
                }
                field("Loading port"; "Loading port")
                {
                }
                field(Actividad; Actividad)
                {
                    CaptionClass = '1,2,2';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
                }
                field(Transportista; Transportista)
                {
                }
                field("Destination port"; "Destination port")
                {
                }
            }
            part(Control2; "Lín. reparto")
            {
                SubPageLink = "No. Documento" = FIELD("No. Documento"),
                              Actividad = FIELD(Actividad);
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Get items")
            {
                Caption = '&Get items';
                Image = GetEntries;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Clear(rstProductosExportacion);
                    rstProductosExportacion.SetRange(rstProductosExportacion.Exportación, true);
                    //rstProductosExportacion.SETFILTER("No.",'<>%1&<>%2','LTBP-AA17-LV-12 K','LTBP-AA18-LV-12 K');
                    if Actividad <> '' then
                        rstProductosExportacion.SetFilter(rstProductosExportacion."Global Dimension 2 Code", Actividad);
                    if rstProductosExportacion.Find('-') then
                        repeat

                            Clear(rstLotes);
                            Clear(rstProducto);
                            Clear(rstUnidadMedidadProducto);
                            rstLotes."No. Documento" := "No. Documento";
                            rstLotes."No. Producto" := rstProductosExportacion."No.";
                            i += 10000;
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

                    CurrPage.Update;
                end;
            }
            action("Activate Distribution")
            {
                Caption = 'Activate &Distribution';
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

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

                    Clear(cduGenerarReparto);
                    Clear(rstLinReparto);
                    //fntCrearLineas.CrearLineasExistencias(rstLinReparto,Rec);
                    cduGenerarReparto.ActualizarLineasExistencias(Rec);
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
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        rstConfVentas.Get();
        "No. Documento" := fntNroSerie.GetNextNo(rstConfVentas."No. serie repartos", Today, true);
        "Fecha reparto" := Today;
        Usuario := UserId;
        CurrPage.Update(false);
    end;

    var
        cduGenerarReparto: Codeunit "ExtensiónVentas";
        rstConfVentas: Record "Sales & Receivables Setup";
        fntNroSerie: Codeunit "No. Series";
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
}

