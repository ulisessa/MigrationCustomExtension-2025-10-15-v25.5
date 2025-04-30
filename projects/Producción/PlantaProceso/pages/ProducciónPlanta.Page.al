page 50560 "Producción Planta"
{
    // US.ARBU - 20041117 - Inicio Modificacion Arbumasa para el seguimiento de documentos

    DelayedInsert = true;
    DeleteAllowed = false;
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = "Produccion Planta";
    SourceTableView = SORTING("Nombre libro diario", "Nombre seccion diario", "No. documento")
                      ORDER(Ascending);
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            field("No. documento"; "No. documento")
            {
                Caption = 'Producción No.:';
                Editable = false;
                Style = Standard;
                StyleExpr = TRUE;
            }
            group(General)
            {
                Caption = 'General';
                Editable = NOT Registrado;
                field("Nombre libro diario"; "Nombre libro diario")
                {
                    TableRelation = "Item Journal Template".Name;
                }
                field("Nombre seccion diario"; "Nombre seccion diario")
                {
                    TableRelation = "Item Journal Batch".Name WHERE("Journal Template Name" = FIELD("Nombre libro diario"));
                }
                field(Fecha; "Fecha produccion")
                {
                    Caption = 'Fecha';
                }
                field("Puerto/Aeropuerto"; "Puerto/Aeropuerto")
                {
                }
                field("Proyecto Origen"; "Proyecto Origen")
                {

                    trigger OnValidate()
                    begin
                        if "Global Dimension 1" <> '' then begin

                            Clear(rstBuque);
                            rstBuque.SetRange(rstBuque."Global Dimension No.", 1);
                            rstBuque.SetRange(rstBuque.Code, "Global Dimension 1");
                            rstBuque.FindFirst;

                        end;

                        if (rstBuque."Use code" <> rstBuque."Use code"::Buque) and
                           (rstBuque."Use code" <> rstBuque."Use code"::Planta) then begin

                            "Buque TerceroVisible" := true;
                            "Marea TerceroVisible" := true;
                            Tercero := true;

                        end
                        else begin

                            "Buque TerceroVisible" := false;
                            "Marea TerceroVisible" := false;
                            Tercero := false;

                        end;
                    end;
                }
                field("Proyecto Destino"; "Proyecto Destino")
                {
                }
                field("Hora inicio"; "Hora inicio")
                {
                }
                field("Hora fin"; "Hora fin")
                {
                }
                field("Lote origen"; "Lote origen")
                {
                    Editable = false;
                }
                field("Encargado Produccion"; "Encargado Produccion")
                {
                }
                field(Actividad; "Global Dimension 2")
                {
                    Caption = 'Global Dimension 2 Code';
                }
                field("Produccion terminada"; "Produccion terminada")
                {
                }
                field("Próx. pallet"; codPallet)
                {
                    Caption = '<Próx. pallet>';
                }
            }
            part("Producto terminado en túnel"; "Subform tunel")
            {
                Caption = 'Producto terminado en túnel';
                SubPageLink = "Nombre libro diario" = FIELD("Nombre libro diario"),
                              "Nombre seccion diario" = FIELD("Nombre seccion diario"),
                              "No. documento" = FIELD("No. documento");
            }
            part("Detalle produccion"; "Subform Planta")
            {
                Caption = 'Detalle produccion';
                Editable = NOT Registrado;
                SubPageLink = "Nombre libro diario" = FIELD("Nombre libro diario"),
                              "Nombre seccion diario" = FIELD("Nombre seccion diario"),
                              "No. documento" = FIELD("No. documento");
                Visible = NOT Registrado;
            }
            part(Control1000000038; "Subform hist. prod. planta")
            {
                Caption = 'Detalle produccion';
                Editable = NOT Registrado;
                SubPageLink = "Document No." = FIELD("No. documento");
                SubPageView = WHERE("Item Category Code" = CONST('PESCA'),
                                    Revertido = CONST(false));
                Visible = Registrado;
            }
            part("Consumo insumos"; "Lin. vale consumo")
            {
                Caption = 'Consumo insumos';
                Editable = NOT Registrado;
                SubPageLink = "No. documento" = FIELD("No. documento");
                SubPageView = WHERE(Revertido = FILTER(false));
                Visible = Not Registrado;
            }
            part(Control1000000052; "Subform hist. prod. planta")
            {
                Caption = 'Consumo insumos';
                Editable = NOT Registrado;
                SubPageLink = "Document No." = FIELD("No. documento");
                SubPageView = WHERE("Item Category Code" = CONST('CONSUMO'),
                                    Revertido = CONST(false));
                Visible = Registrado;
            }
            group("Producción LAN")
            {
                Caption = 'Producción LAN';
                Editable = NOT Registrado;
                Visible = intActividad = 0;
                group(Seccionado)
                {
                    Caption = 'Seccionado';
                    field(Entrada; "FRE Seccionado Entrada KG")
                    {
                    }
                    field(Salida; "FRE Seccionado Salida KG")
                    {
                    }
                    field(Residuos; "FRE Seccionado Entrada KG" - "FRE Seccionado Salida KG")
                    {
                    }
                }
                group("Clasificación")
                {
                    Caption = 'Clasificación';
                    field("Entrada KG"; "FRE Clasificacion Entrada KG")
                    {
                        Caption = 'Entrada KG';
                        Editable = false;
                    }
                    group(Control1000000044)
                    {
                        Caption = 'A Pelado';
                        field("A Pelado"; "FRE Clasificacion Pelado KG")
                        {
                            Caption = 'Pelado';
                            Editable = false;
                        }
                        field("% Pelado MP"; "FRE Clas. Pelado RE (%)")
                        {
                            Caption = '%';
                            Editable = false;
                        }
                    }
                    group("Subproceso pelado")
                    {
                        Caption = 'Sin pelar';
                        field("Sin Pelar"; "FRE Clasificacion Cola KG")
                        {
                        }
                        field("FRE Clas. Cola RE (%)"; "FRE Clas. Cola RE (%)")
                        {
                            Caption = '%';
                        }
                    }
                }
                group(Pelado)
                {
                    Caption = 'Pelado';
                    Visible = intActividad = 0;
                    field("Entrada Pelado"; "FRE Pelado Entrada KG")
                    {
                        Caption = 'Entrada Pelado';
                        DecimalPlaces = 0 : 2;
                        Editable = false;

                        trigger OnValidate()
                        begin
                            FunRendimientoLAN;
                        end;
                    }
                    field("Salida Pelado"; "FRE Pelado Salida KG")
                    {
                        Caption = 'Salida Pelado';
                        DecimalPlaces = 0 : 2;
                        Editable = false;

                        trigger OnValidate()
                        begin
                            FunRendimientoLAN;
                        end;
                    }
                    field("% Pelado"; "FRE Pelado RE (%)")
                    {
                        Caption = '% Pelado';
                        DecimalPlaces = 0 : 2;
                        Editable = false;
                    }
                }
                group("Envasado LAN")
                {
                    Caption = 'Envasado LAN';
                    Visible = intActividad = 0;
                    field("FRE Envasado Salida KG"; "FRE Envasado Salida KG")
                    {
                        Caption = 'Salida KG';
                        DecimalPlaces = 0 : 2;
                        Editable = false;

                        trigger OnValidate()
                        begin
                            FunRendimientoLAN;
                        end;
                    }
                    field("FRE Envasado Entrada KG"; "FRE Envasado Entrada KG")
                    {
                        Caption = 'Entrada KG';
                        DecimalPlaces = 0 : 2;
                        Editable = false;

                        trigger OnValidate()
                        begin
                            FunRendimientoLAN;
                        end;
                    }
                    field("FRE Residuos Entrada"; "FRE Residuos Entrada")
                    {
                        Caption = 'Residuos KG';
                        DecimalPlaces = 0 : 2;
                    }
                    field("FRE Produccion RE (%)"; "FRE Produccion RE (%)")
                    {
                    }
                }
            }
            group("Producción CAL")
            {
                Caption = 'Producción CAL';
                Editable = NOT Registrado;
                Visible = intActividad = 1;
                group("Materia Prima")
                {
                    Caption = 'Materia Prima';
                    field("CAL Entrada MP"; "CAL Entrada MP")
                    {
                        Caption = 'MP Total';
                        Editable = false;
                    }
                    field("CAL Vaina MP"; "CAL Vaina MP")
                    {
                        Caption = 'MP Vaina';
                        Editable = false;
                    }
                    field("CAL Entero MP"; "CAL Entero MP")
                    {
                        Caption = 'MP Entero';
                        Editable = false;
                    }
                    field("CAL Rejo MP"; "CAL Rejo MP")
                    {
                        Caption = 'MP Rejo';
                        Editable = false;
                    }
                    field("CAL Rejo Sucio MP"; "CAL Rejo Sucio MP")
                    {
                        Caption = 'MP Rejo Sucio';
                        Editable = false;
                    }
                }
                group("Pelado  CAL")
                {
                    Caption = 'Pelado  CAL';
                    field("CAL Pelado Entrada KG"; "CAL Pelado Entrada KG")
                    {
                        Editable = false;
                    }
                }
                group(Vaina)
                {
                    Caption = 'Vaina';
                    field("CAL Pelado Vaina KG"; "CAL Pelado Vaina KG")
                    {
                        DecimalPlaces = 0 : 2;
                    }
                    field("CAL Pelado Vaina RE (%)"; "CAL Pelado Vaina RE (%)")
                    {
                        Editable = false;
                    }
                }
                group(Rejos)
                {
                    Caption = 'Rejos';
                    Editable = false;
                    field("CAL Pelado Rejos KG"; "CAL Pelado Rejos KG")
                    {
                        DecimalPlaces = 0 : 2;
                        Editable = false;
                    }
                    field("CAL Rejo Sin Engorde KN"; "CAL Rejo Sin Engorde KN")
                    {
                    }
                    field("CAL Pelado Rejos RE (%)"; "CAL Pelado Rejos RE (%)")
                    {
                    }
                }
                group(Aletas)
                {
                    Caption = 'Aletas';
                    Editable = false;
                    field("CAL Pelado Aletas KG"; "CAL Pelado Aletas KG")
                    {
                    }
                    field("CAL Pelado Aletas RE (%)"; "CAL Pelado Aletas RE (%)")
                    {
                        DecimalPlaces = 0 : 2;
                        Editable = false;
                    }
                    field("CAL Merma Pelado (%)"; "CAL Merma Pelado (%)")
                    {
                        Caption = 'Merma';
                        Editable = false;
                    }
                }
            }
            group(Engorde)
            {
                Caption = 'Engorde';
                Visible = intActividad = 1;
                field("CAL Engorde Entrada KG"; "CAL Engorde Entrada KG")
                {
                    Caption = 'Entrada KG';
                    DecimalPlaces = 0 : 2;
                    Editable = false;

                    trigger OnValidate()
                    begin
                        FunRendimientoCAL;
                    end;
                }
                field("CAL Engorde Salida KG"; "CAL Engorde Salida KG")
                {
                    Caption = 'Salida KG';
                    DecimalPlaces = 0 : 2;
                    Editable = false;

                    trigger OnValidate()
                    begin
                        FunRendimientoCAL;
                    end;
                }
                field("CAL Engorde RE (%)"; "CAL Engorde RE (%)")
                {
                    Caption = 'RE (%)';
                    DecimalPlaces = 0 : 2;
                    Editable = false;
                }
                field("CAL Vaina Sin Engorde KN"; "CAL Vaina Sin Engorde KN")
                {
                    Caption = 'Sin Engorde';
                    DecimalPlaces = 0 : 2;
                    Editable = false;
                }
            }
            group("Envasado  CAL")
            {
                Caption = 'Envasado  CAL';
                Visible = intActividad = 1;
                field("CAL Envasado Entrada KG"; "CAL Envasado Entrada KG")
                {
                    Caption = 'Entrada KG';
                    DecimalPlaces = 0 : 2;
                    Editable = false;

                    trigger OnValidate()
                    begin
                        FunRendimientoCAL;
                    end;
                }
                field("CAL Envasado Salida KG"; "CAL Envasado Salida KG")
                {
                    Caption = 'Salida KG';
                    DecimalPlaces = 0 : 2;
                    Editable = false;

                    trigger OnValidate()
                    begin
                        FunRendimientoCAL;
                    end;
                }
            }
            group("A congelar")
            {
                Caption = 'A congelar';
                Visible = intActividad = 1;
                field("CAL Rejo a Congelar PT"; "CAL Rejo a Congelar PT")
                {
                    Caption = 'Rejo Sucio';
                    Editable = false;
                }
                field("CAL Residuos KG"; "CAL Residuos KG")
                {
                    DecimalPlaces = 0 : 2;
                    Editable = false;
                    Visible = intActividad = 1;
                }
                field("CAL Entero Sin Clasificar KN"; "CAL Entero Sin Clasificar KN")
                {
                    DecimalPlaces = 0 : 2;
                    Editable = false;
                    Visible = intActividad = 1;
                }
            }
            group("Producción")
            {
                Caption = 'Producción';
                Editable = false;
                Visible = intActividad = 2;
                group(Proceso)
                {
                    Caption = 'Clasificación';
                    field("PES MP Entrada KG"; "PES MP Entrada KG")
                    {
                    }
                    field("PES Produccion Merma"; "PES Produccion Merma")
                    {
                    }
                    field("PES Envasado Salida KG"; "PES Envasado Salida KG")
                    {
                        Caption = 'Entrada KG';
                    }
                    field("PES Produccion RE (%)"; "PES Produccion RE (%)")
                    {
                        Caption = 'RE (%)';
                    }
                }
            }
        }
        area(factboxes)
        {
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Registro")
            {
                Caption = '&Registro';
                action(Test)
                {
                    Caption = 'Test';
                    Ellipsis = true;

                    trigger OnAction()
                    begin

                        PunLins.Reset;
                        PunLins.SetRange("Journal Template Name", "Nombre libro diario");
                        PunLins.SetRange("Journal Batch Name", "Nombre seccion diario");
                        PunLins.SetRange("Document No.", "No. documento");
                        ImprInfor.PrintItemJnlLine(PunLins);
                    end;
                }
                action("<Action44>")
                {
                    Caption = '&Imprimir';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    RunPageOnRec = true;

                    trigger OnAction()
                    begin
                        Clear(PunProduccion);
                        PunProduccion.Get("Nombre libro diario", "Nombre seccion diario", "No. documento");
                        PunProduccion.SetRecFilter();
                        /*
                        CASE "Global Dimension 2" OF
                          'CAL':
                            REPORT.RUN(50067,TRUE,FALSE,PunProduccion);
                          'LAN','FRE':
                            REPORT.RUN(50068,TRUE,FALSE,PunProduccion);
                          ELSE
                            REPORT.RUN(50069,TRUE,FALSE,PunProduccion);
                        END;
                        */
                        REPORT.Run(50069, true, false, PunProduccion);

                    end;
                }
                action(Registrar)
                {
                    Caption = 'Registrar';
                    Enabled = blnRegistrado;
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';
                    Visible = blnRegistrado;

                    trigger OnAction()
                    begin
                        TestField("Produccion terminada");
                        if Confirm('¿Desea registrar esta producción?') then
                            cduProd.fntRegistroProduccion(Rec, rstLinDiaProd, false, false);
                    end;
                }
                action("Registrar & Imprimir")
                {
                    Caption = 'Registrar & Imprimir';
                    Enabled = blnRegistrado;
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+F9';
                    Visible = blnRegistrado;

                    trigger OnAction()
                    begin
                        TestField("Produccion terminada");
                        if Confirm('¿Desea registrar e imprimir esta producción?') then
                            cduProd.fntRegistroProduccion(Rec, rstLinDiaProd, false, true);
                    end;
                }
                action("&Navegar")
                {
                    Caption = '&Navigate';
                    Image = Navigate;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        Navigate;
                    end;
                }
                action(Lista)
                {
                    Caption = 'Lista';
                    RunObject = Page "Lista producción planta";
                    RunPageView = WHERE("Global Dimension 2" = FILTER('CAL' | ''),
                                        Registrado = FILTER(false));
                    ShortCutKey = 'F5';
                }
            }
        }
        area(processing)
        {
            action("&Digitalizar")
            {
                Caption = '&Digitalizar';
                Image = DocInBrowser;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Clear(frmDigitalizar);
                    Clear(rstDigitalizar);
                    Clear(rstConfUsu);
                    rstConfUsu.Get(UserId);
                    //rstDigitalizar.SETRANGE(Documento,'Produccion');
                    rstDigitalizar.SetRange(Departamento, rstConfUsu.Grupo);
                    if rstDigitalizar.FindFirst then;
                    frmDigitalizar.funLlamarCapturador(rstDigitalizar.Documento, Format(Today), '', "Proyecto Origen", UserId, "Proyecto Destino", Format("Fecha produccion"), "No. documento", '', '', '');
                    //frmDigitalizar.funLlamarCapturador('',"No. documento",'',"Proyecto Origen",'','','',"No. documento");
                    frmDigitalizar.LookupMode(true);
                    frmDigitalizar.SetTableView(rstDigitalizar);
                    if frmDigitalizar.RunModal = ACTION::LookupOK then begin

                        frmDigitalizar.GetRecord(rstDigitalizar);
                        cduDigitalizarOAbrir.ImportarDocumento(rstDigitalizar.Documento,
                        Format(Today), rstDigitalizar.Departamento, "Proyecto Origen", UserId, "Proyecto Destino", Format("Fecha produccion"), "No. documento", '', '', '',
                        rstDigitalizar, false, false, true, '', false, false);

                    end;
                end;
            }
            action("&Calcular Producción")
            {
                Caption = '&Calcular Producción';
                Image = Calculate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    PunLinPT: Record "Item Journal Line";
                    PunProducto: Record Item;
                    cduFishing: Codeunit GestionProduccionPlanta;
                begin
                    cduFishing.fntCalcularProduccion(Rec);
                end;
            }
            action("Cambiar estado")
            {
                Caption = 'Cambiar estado';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ConfUsu: Record "User Setup";
                    rstCambioEstado: Record "Seguridad cambio estados";
                begin
                    Clear(ConfUsu);
                    Clear(rstCambioEstado);

                    if "Produccion terminada" then begin

                        Clear(rstMensajeria);
                        rstMensajeria.SetCurrentKey("No. documento");
                        rstMensajeria.SetRange(rstMensajeria."No. documento", Rec."No. documento");
                        rstMensajeria.FindFirst;

                        PAGE.Run(50064, rstMensajeria);

                    end
                    else
                        Error('Antes de cambiar de estado debe marcar la producción como terminada');
                    CurrPage.Close;
                end;
            }
            action("&Revertir")
            {
                Caption = '&Revertir';
                Image = ReverseRegister;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = Registrado;

                trigger OnAction()
                var
                    cduProd: Codeunit GestionProduccionPlanta;
                begin
                    if Confirm('¿Desea revertir esta producción?') then
                        cduProd.fntRegistroProduccion(Rec, rstLinDiaProd, true, false);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        RecRef: RecordRef;
    begin
        //++Migracion Arbumasa 2009
        RecRef.GetTable(Rec);
        //--Migracion Arbumasa 2009

        Clear(rstBuque);
        if "Global Dimension 1" <> '' then begin
            rstBuque.SetRange(rstBuque."Global Dimension No.", 1);
            rstBuque.SetRange(rstBuque.Code, "Global Dimension 1");
            rstBuque.FindFirst;
        end;

        if (rstBuque."Use code" <> rstBuque."Use code"::Buque) and
           (rstBuque."Use code" <> rstBuque."Use code"::Planta) then begin

            "Buque TerceroVisible" := true;
            "Marea TerceroVisible" := true;
            Tercero := true;

        end
        else begin

            "Buque TerceroVisible" := false;
            "Marea TerceroVisible" := false;
            Tercero := false;

        end;

        Clear(rstBuque);
        Clear(rstProyecto);
        if rstProyecto.Get("Proyecto Destino") then begin

            Clear(cduFishing);

            if rstProyecto."Global Dimension 1 Code" <> '' then begin
                rstBuque.SetRange(rstBuque."Global Dimension No.", 1);
                rstBuque.SetRange(rstBuque.Code, rstProyecto."Global Dimension 1 Code");
                rstBuque.FindFirst;
            end;

            //rstBuque.CALCFIELDS("Last Pallet No.");

            codPallet := '';
            codPallet := cduFishing.fntGetNextPalletNo(rstBuque.Code, "Fecha produccion", '');

        end;

        blnEliminable := not Registrado;
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        PunLins.Reset;
        PunLins.SetRange("Journal Template Name", "Nombre libro diario");
        PunLins.SetRange("Journal Batch Name", "Nombre seccion diario");
        PunLins.SetRange(PunLins."Document No.", "No. documento");
        PunLins.DeleteAll;
    end;

    trigger OnInit()
    begin
        RegistroVisible := true;
    end;

    trigger OnOpenPage()
    var

        intCardFormID: Integer;
    begin
        /*
        CLEAR(rstBuque);
        IF "Global Dimension 1" <> '' THEN
        BEGIN
          rstBuque.SETRANGE(rstBuque."Global Dimension No.",1);
          rstBuque.SETRANGE(rstBuque.Code,"Global Dimension 1");
          rstBuque.FINDFIRST;
        END
        ELSE
          EXIT;
        
        IF (rstBuque."Use code" <> rstBuque."Use code"::Buque) AND
           (rstBuque."Use code" <> rstBuque."Use code"::Planta) THEN
        BEGIN
        
          "Buque TerceroVisible" := TRUE;
          "Marea TerceroVisible" := TRUE;
          Tercero := TRUE;
        
        END
        ELSE
        BEGIN
        
          "Buque TerceroVisible" := FALSE;
          "Marea TerceroVisible" := FALSE;
          Tercero := FALSE;
        
        END;
        */

        if "Global Dimension 2" = '' then begin

            intCardFormID := StrMenu(Text000, 3);
            if intCardFormID = 0 then
                Error('Debe seleccionar una de las opciones');

            case intCardFormID of
                1:
                    intActividad := 1;
                2:
                    intActividad := 0;
                3:
                    intActividad := 2;
            end;

        end
        else begin

            case "Global Dimension 2" of
                'CAL':
                    intActividad := 1;
                'LAN', 'FRE':
                    intActividad := 0;
                else
                    intActividad := 2;
            end;

        end;


        if Registrado then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;

        if not CurrPage.Editable then
            RegistroVisible := false;

    end;

    var
        Rendimiento: array[5] of Decimal;
        DiarioProd: Record "Item Journal Batch";
        PunLins: Record "Item Journal Line";
        PunLins2: Record "Item Journal Line";
        ImprInfor: Codeunit "Test Report-Print";
        GestNoSerie: Codeunit "No. Series";
        rstSeccion: Record "Item Journal Batch";
        rstConfUsu: Record "User Setup";
        cduMensajeria: Codeunit "Mensajería";
        rstMensajeria: Record Mensajeria;
        rstBuque: Record "Dimension Value";
        rstDepartamento: Record "Dimension Value";
        rstProyecto: Record Job;
        cduDigitalizarOAbrir: Codeunit Escaneado;
        rstDigitalizar: Record "Ruta digitalizacion depto/espe";
        rstHistCabProd: Record "Produccion Planta";

        "Buque TerceroVisible": Boolean;

        "Marea TerceroVisible": Boolean;
        Text19053974: Label 'Entrada KG';
        Text19028109: Label 'KG';
        Text19018034: Label 'RE %';
        PunProduccion: Record "Produccion Planta";
        cduFishing: Codeunit Descargas;
        cduProd: Codeunit GestionProduccionPlanta;
        rstLinDiaProd: Record "Item Journal Line";
        rstCabecera: Record "Produccion Planta";

        blnRegistrado: Boolean;

        blnNoRegistrado: Boolean;

        RegistroVisible: Boolean;
        frmDigitalizar: Page "Ruta digitalización";
        intActividad: Integer;
        Text000: Label '&Calamar,&Langostino,&Pescado';
        rstLVC: Record "Lín. vale consumo";
        codPallet: Code[10];
        blnEliminable: Boolean;

    [Scope('OnPrem')]
    procedure FunRendimientoCAL()
    var
        rstLineas: Record "Lin. produccion planta";
        PunLinMP: Record "Lin. produccion planta";
        PunLinPT: Record "Lin. produccion planta";
        TotalKGMP: Decimal;
        TotalKGPT: Decimal;
        TotalVai: Decimal;
        TotalRej: Decimal;
        TotalAle: Decimal;
        rstConfEx: Record "Inventory Setup";
        PunProducto: Record Item;
        rstLineasSalida: Record "Lin. produccion planta";
    begin
        TestField("Produccion terminada");
        rstLineas.Reset;
        rstConfEx.Get();

        Clear(rstLineas);
        rstLineas.SetRange(rstLineas."Nombre libro diario", "Nombre libro diario");
        rstLineas.SetRange(rstLineas."Nombre seccion diario", "Nombre seccion diario");
        rstLineas.SetRange("No. documento", "No. documento");
        if rstLineas.Find('-') then
            repeat

                if rstLineas.Tipo = rstLineas.Tipo::Salida then begin

                    if rstLineas.Familia <> rstConfEx."Familia CAL SE" then begin

                        "CAL Entrada MP" += Abs(rstLineas."Kilos brutos");

                    end
                    else begin

                        "CAL Entrada SE Reproceso" += Abs(rstLineas."Kilos brutos");

                    end;

                    "CAL Pelado Entrada KG" += Abs(rstLineas."Kilos brutos");

                    if rstLineas.Subfamilia = rstConfEx."Subfamilia CAL Entero MP" then
                        "CAL Entero MP" += Abs(rstLineas."Kilos brutos");

                    if rstLineas.Subfamilia = rstConfEx."Subfamilia CAL Rejo MP" then
                        "CAL Rejo MP" += Abs(rstLineas."Kilos brutos");

                    if rstLineas.Subfamilia = rstConfEx."Subfamilia CAL Vaina MP" then
                        "CAL Vaina MP" += Abs(rstLineas."Kilos brutos");

                    if rstLineas.Subfamilia = rstConfEx."Subfamilia CAL Rejo Sucio MP" then
                        "CAL Rejo Sucio MP" += Abs(rstLineas."Kilos brutos");


                end
                else begin

                    if rstLineas.Subfamilia = rstConfEx."Subfamilia CAL Vaina" then
                        "CAL Engorde Salida KG" += Abs(rstLineas."Kilos netos");
                    if rstLineas.Subfamilia = rstConfEx."Subfamilia CAL Roto" then
                        "CAL Engorde Salida KG" += Abs(rstLineas."Kilos netos");
                    if rstLineas.Subfamilia = rstConfEx."Subfamilia CAL Vaina SE" then begin
                        "CAL Vaina Sin Engorde KN" += Abs(rstLineas."Kilos netos");
                        "CAL Salida KG Semielaborado" += Abs(rstLineas."Kilos netos");
                    end;
                    if rstLineas.Subfamilia = rstConfEx."Subfamilia CAL Rejo Sucio PT" then
                        "CAL Rejo Sucio PT" += Abs(rstLineas."Kilos netos");
                    if rstLineas.Subfamilia = rstConfEx."Subfamilia CAL Aletas" then
                        "CAL Pelado Aletas KG" += Abs(rstLineas."Kilos netos");
                    if rstLineas.Subfamilia = rstConfEx."Subfamilia CAL Rejos" then
                        "CAL Pelado Rejos KG" += Abs(rstLineas."Kilos netos");
                    if rstLineas.Subfamilia <> rstConfEx."Subfamilia CAL Residuos" then
                        "CAL Envasado Salida KG" += Abs(rstLineas."Kilos netos");
                    if rstLineas.Subfamilia = rstConfEx."Subfamilia CAL Rejo SE" then begin
                        "CAL Rejo Sin Engorde KN" += rstLineas."Kilos netos";
                        "CAL Salida KG Semielaborado" += Abs(rstLineas."Kilos netos");
                    end;

                    if rstLineas.Subfamilia = rstConfEx."Subfamilia CAL Residuos" then
                        "CAL Residuos KG" += rstLineas."Kilos netos";
                    if rstLineas.Subfamilia = rstConfEx."Subfamilia CAL Ent S/Clas" then
                        "CAL Entero Sin Clasificar KN" += rstLineas."Kilos netos";

                    "CAL Entrada PT" += rstLineas."Kilos netos";

                end;

            until rstLineas.Next = 0;

        "CAL Pelado Vaina KG" += "CAL Engorde Entrada KG";
        if "CAL Pelado Vaina KG" <> 0 then
            "CAL Engorde Entrada KG" := "CAL Pelado Vaina KG"
        else
            "CAL Engorde Entrada KG" := "CAL Engorde Salida KG";
        if "CAL Pelado Entrada KG" > 0 then
            "CAL Pelado Vaina RE (%)" := Round((("CAL Pelado Vaina KG" / "CAL Pelado Entrada KG") * 100), 0.01);
        if "CAL Pelado Entrada KG" > 0 then
            "CAL Pelado Rejos RE (%)" := Round((("CAL Pelado Rejos KG" / "CAL Pelado Entrada KG") * 100), 0.01);
        if "CAL Pelado Entrada KG" > 0 then
            "CAL Pelado Aletas RE (%)" := Round((("CAL Pelado Aletas KG" / "CAL Pelado Entrada KG") * 100), 0.01);
        if "CAL Pelado Entrada KG" > 0 then
            "CAL Merma Pelado (%)" :=
                                      (1 - (("CAL Pelado Vaina KG" + "CAL Pelado Rejos KG" + "CAL Pelado Aletas KG") / "CAL Pelado Entrada KG")) * 100
          ;
        "CAL Envasado Entrada KG" := "CAL Pelado Rejos KG" + "CAL Pelado Aletas KG" + "CAL Engorde Salida KG" +
                                     "CAL Vaina Sin Engorde KN" + "CAL Rejo Sin Engorde KN" + "CAL Entero Sin Clasificar KN";

        if "CAL Rejo Sucio PT" <> 0 then
            "CAL Rejo a Congelar PT" := Abs(rstLineas."Kilos brutos");

        if "CAL Engorde Entrada KG" > 0 then
            "CAL Engorde RE (%)" := -(1 - ("CAL Engorde Salida KG" / "CAL Engorde Entrada KG")) * 100;

        if "CAL Engorde Salida KG" = 0 then begin

            "CAL Pelado Vaina KG" := 0;
            "CAL Pelado Vaina RE (%)" := 0;
            "CAL Engorde Entrada KG" := 0;
            "CAL Engorde Salida KG" := 0;
            "CAL Engorde RE (%)" := 0;

        end;

        if "CAL Residuos KG" = 0 then
            "CAL Residuos KG" := ("CAL Entrada MP" + "CAL Entrada SE Reproceso") -
                                               ("CAL Engorde Entrada KG" + "CAL Pelado Rejos KG" +
                                               "CAL Pelado Aletas KG" + "CAL Rejo Sucio PT");

        Modify;
    end;

    [Scope('OnPrem')]
    procedure FunRendimientoLAN()
    var
        PunLinPT: Record "Lin. produccion planta";
        PunLineas: Record "Lin. produccion planta";
        PunLinMP: Record "Lin. produccion planta";
        TotalKGMP: Decimal;
        TotalKGPT: Decimal;
        TotalVai: Decimal;
        TotalRej: Decimal;
        TotalAle: Decimal;
        PunConfEx: Record "Inventory Setup";
        PunProducto: Record Item;
        rstLineasSalida: Record "Item Journal Line";
        i: Integer;
        rstLinProd: Record "Lin. produccion planta";
        rstProd: Record Item;
        blnEntero: Boolean;
        blnCola: Boolean;
        blnPelado: Boolean;
        blnRoto: Boolean;
    begin
        TestField("Produccion terminada");
        PunLineas.Reset;
        PunLinMP.Reset;
        PunLinPT.Reset;
        PunConfEx.Get();
        TotalKGMP := 0;
        TotalKGPT := 0;

        "FRE Residuos Entrada" := 0;
        //Verificar el tipo de produccion
        Clear(rstLinProd);
        rstLinProd.SetRange("Nombre libro diario", "Nombre libro diario");
        rstLinProd.SetRange("Nombre seccion diario", "Nombre seccion diario");
        rstLinProd.SetRange("No. documento", "No. documento");
        if rstLinProd.FindSet then
            repeat

                Clear(rstProd);
                if rstProd.Get(rstLinProd.Clasificacion) then begin

                    if rstProd.Subfamilia in [PunConfEx."Subfamilia LAN Entero MP", PunConfEx."Subfamilia LAN Entero PT"] then
                        blnEntero := true;

                    if (rstProd.Subfamilia = PunConfEx."Subfamilia LAN Pelado PT") or (rstProd.Subfamilia = PunConfEx."Subfamilia LAN P&D PT") then
                        blnPelado := true;

                    if rstProd.Subfamilia in [PunConfEx."Subfamilia LAN Cola MP", PunConfEx."Subfamilia LAN Cola PT"] then
                        blnCola := true;

                    if rstProd.Subfamilia in [PunConfEx."Subfamilia LAN Roto MP"] then
                        blnRoto := true;


                end;

            until rstLinProd.Next = 0;

        //Si se dan los tres productos, error
        if blnEntero and blnPelado and blnCola then
            Error('Ha generado una produccion no admitida');
        //Si hay entero y cola, no hay produccion de pelado. OK
        //Si hay pelado y cola, hay cola que se manda a pelar. OK
        //Si hay entero y pelado, hay entero que se manda a seccionar y luego pelar. OK
        //Si solo se da uno, error
        if blnEntero then
            i += 1;
        if blnPelado then
            i += 1;
        if blnCola then
            i += 1;
        if blnRoto then
            i += 2;

        if i < 2 then
            Error('Ha generado una produccion no admitida');

        i := 0;

        for i := 1 to 5 do begin

            Rendimiento[i] := 0;

        end;

        Clear(PunLineas);
        PunLineas.SetRange("Nombre libro diario", "Nombre libro diario");
        PunLineas.SetRange("Nombre seccion diario", "Nombre seccion diario");
        PunLineas.SetRange("No. documento", "No. documento");
        PunLinMP.Copy(PunLineas);
        PunLinPT.Copy(PunLineas);
        PunLinMP.SetRange(Tipo, PunLinMP.Tipo::Salida);
        PunLinPT.SetRange(Tipo, PunLinPT.Tipo::Entrada);

        if blnCola then
            "FRE Pelado Entrada KG" := "FRE Clasificacion Pelado KG";

        if PunLinMP.Find('-') then
            repeat

                // := PunLinMP.Actividad;

                PunProducto.Reset;
                PunProducto.Get(PunLinMP.Clasificacion);

                if PunProducto.Subfamilia in [PunConfEx."Subfamilia LAN Entero MP", PunConfEx."Subfamilia LAN Entero PT"] then
                    "FRE Seccionado Entrada KG" += PunLinMP."Kilos netos";

                if blnCola then
                    if PunProducto.Subfamilia in [PunConfEx."Subfamilia LAN Cola MP", PunConfEx."Subfamilia LAN Cola PT"] then
                        "FRE Pelado Entrada KG" += PunLinMP."Kilos netos";

                TotalKGMP += PunLinMP."Kilos netos";
                "FRE Entrada KG" += PunLinMP."Kilos netos";

            until PunLinMP.Next = 0;

        //"FRE Clasificacion Entrada KG" := TotalKGMP;

        if PunLinPT.Find('-') then
            repeat

                PunProducto.Reset;
                PunProducto.Get(PunLinPT.Clasificacion);

                if (blnCola and not blnPelado) then
                    if CopyStr(PunProducto.Familia, 1, 2) = 'PT' then begin

                        if PunProducto.Subfamilia = PunConfEx."Subfamilia LAN Pelado PT" then
                            "FRE Pelado Salida KG" += PunLinPT."Kilos netos";
                        if PunProducto.Subfamilia = PunConfEx."Subfamilia LAN Entero PT" then
                            "FRE Clasificacion Entero KG" += PunLinPT."Kilos netos";
                        if PunProducto.Subfamilia = PunConfEx."Subfamilia LAN Cola PT" then
                            "FRE Clasificacion Cola KG" += PunLinPT."Kilos netos";
                        "FRE Seccionado Salida KG" += PunLinPT."Kilos netos";
                        if PunProducto.Subfamilia = PunConfEx."Subfamilia LAN Residuos" then
                            "FRE Residuos Entrada" += PunLinPT."Kilos netos";

                    end;

                if CopyStr(PunProducto.Familia, 1, 2) = 'SE' then begin

                    if blnPelado then
                        if PunProducto.Subfamilia = PunConfEx."Subfamilia LAN Cola PT" then
                            "FRE Clasificacion Pelado KG" += PunLinPT."Kilos netos";
                    if blnCola then
                        "FRE Seccionado Salida KG" += PunLinPT."Kilos netos";

                end;

                TotalKGPT += PunLinPT."Kilos netos";

            until PunLinPT.Next = 0;

        if blnCola then
            "FRE Clasificacion Entrada KG" := "FRE Seccionado Salida KG";

        if "FRE Clasificacion Entrada KG" > 0 then
            "FRE Clas. Pelado RE (%)" := Round((("FRE Clasificacion Pelado KG" / "FRE Clasificacion Entrada KG") * 100), 0.01);
        if "FRE Clasificacion Entrada KG" > 0 then
            "FRE Clas. Entero RE (%)" := Round((("FRE Clasificacion Entero KG" / "FRE Clasificacion Entrada KG") * 100), 0.01);
        if "FRE Clasificacion Entrada KG" > 0 then
            "FRE Clas. Cola RE (%)" := Round((("FRE Clasificacion Cola KG" / "FRE Clasificacion Entrada KG") * 100), 0.01);
        if "FRE Clasificacion Entrada KG" > 0 then
            "FRE Merma Clasificacion (%)" := (1 - (("FRE Clasificacion Pelado KG" + "FRE Clasificacion Entero KG" +
                             "FRE Clasificacion Cola KG") / "FRE Clasificacion Entrada KG")) * 100;


        "FRE Envasado Entrada KG" := "FRE Clasificacion Entero KG" + "FRE Clasificacion Cola KG" + "FRE Pelado Salida KG" + "FRE Clasificacion Pelado KG";
        "FRE Envasado Salida KG" := TotalKGPT;
        if "FRE Envasado Entrada KG" = 0 then
            "FRE Envasado Entrada KG" := TotalKGPT;
        if "FRE Pelado Entrada KG" > 0 then
            "FRE Pelado RE (%)" := -(1 - ("FRE Pelado Salida KG" / "FRE Pelado Entrada KG")) * 100;
        if "FRE Seccionado Entrada KG" > 0 then
            "FRE Seccionado Entrada RE (%)" := -(1 - ("FRE Seccionado Salida KG" / "FRE Seccionado Entrada KG")) * 100;

        if ("FRE Entrada KG" <> 0) and ("FRE Envasado Salida KG" <> 0) then
            "FRE Produccion RE (%)" := Round((("FRE Envasado Entrada KG" / "FRE Entrada KG") * 100), 0.01);
        Modify;
    end;

    [Scope('OnPrem')]
    procedure FunRendimientoMER()
    var
        PunLinPT: Record "Lin. produccion planta";
        PunLineas: Record "Lin. produccion planta";
        PunLinMP: Record "Lin. produccion planta";
        TotalKGMP: Decimal;
        TotalKGPT: Decimal;
        TotalVai: Decimal;
        TotalRej: Decimal;
        TotalAle: Decimal;
        PunConfEx: Record "Inventory Setup";
        PunProducto: Record Item;
        rstLineasSalida: Record "Item Journal Line";
        i: Integer;
        rstLinProd: Record "Lin. produccion planta";
        rstProd: Record Item;
        blnEntero: Boolean;
        blnCola: Boolean;
        blnPelado: Boolean;
        blnRoto: Boolean;
    begin
        TestField("Produccion terminada");
        PunLineas.Reset;
        PunLinMP.Reset;
        PunLinPT.Reset;
        PunConfEx.Get();
        TotalKGMP := 0;
        TotalKGPT := 0;

        "PES Entera Entrada KG" := 0;
        "PES Entera Salida KG" := 0;
        "PES Entera Clasif. RE (%)" := 0;
        "PES Entera Clasif. Merma KG" := 0;
        "PES Entera Clasif. Descarte KG" := 0;
        "PES Clasificacion Descarte" := 0;
        "PES Clasificacion RE (%)" := 0;
        "PES Envasado Entrada KG" := 0;
        "PES Envasado Salida KG" := 0;
        "PES Produccion RE (%)" := 0;
        "PES Produccion Merma" := 0;
        "PES MP Entrada KG" := 0;
        "PES Carioca Entrada KG" := 0;
        "PES Carioca Entrada RE (%)" := 0;
        "PES Entera Entrada RE (%)" := 0;
        "PES Carioca Proceso-Out KG" := 0;
        "PES Carioca Proceso RE (%)" := 0;
        "PES Carioca RE (%)" := 0;
        "PES Filete S/E RE (%)" := 0;
        "PES Filete S/E Entrada KG" := 0;
        "PES Filete S/E Salida KG" := 0;
        "PES Filete S/E Merma" := 0;
        "PES Filete C/E Entrada KG" := 0;
        "PES Filete C/E Salida KG" := 0;
        "PES Filete C/E RE (%)" := 0;
        "PES Filete C/E Merma" := 0;
        "PES Filete C/E Residuos" := 0;
        "PES Filete S/E Residuos" := 0;
        "PES Carioca Descarte" := 0;
        "PES Carioca Merma (%)" := 0;
        "PES HG Entrada KG" := 0;
        "PES HG Salida KG" := 0;
        "PES HG RE (%)" := 0;
        "PES HG Descarte" := 0;
        "PES HG Merma (%)" := 0;
        "PES Carioca HG Entrada KG" := 0;
        "PES Carioca HG Salida KG" := 0;
        "PES Carioca HG RE (%)" := 0;
        "PES Carioca HG Descarte" := 0;
        "PES Carioca HG Merma (%)" := 0;
        "PES Filete Clasif. Entrada KG" := 0;
        "PES Filete Clasif. Salida KG" := 0;

        //Verificar el tipo de produccion
        Clear(rstLinProd);
        rstLinProd.SetRange("Nombre libro diario", "Nombre libro diario");
        rstLinProd.SetRange("Nombre seccion diario", "Nombre seccion diario");
        rstLinProd.SetRange("No. documento", "No. documento");
        if rstLinProd.FindSet then
            repeat

                Clear(rstProd);
                if rstProd.Get(rstLinProd.Clasificacion) then begin

                    if rstProd.Subfamilia in [PunConfEx."Subfamilia LAN Entero MP", PunConfEx."Subfamilia LAN Entero PT"] then
                        blnEntero := true;

                    if rstProd.Subfamilia = PunConfEx."Subfamilia LAN Pelado PT" then
                        blnPelado := true;

                    if rstProd.Subfamilia in [PunConfEx."Subfamilia LAN Cola MP", PunConfEx."Subfamilia LAN Cola PT"] then
                        blnCola := true;

                    if rstProd.Subfamilia in [PunConfEx."Subfamilia LAN Roto MP"] then
                        blnRoto := true;


                end;

            until rstLinProd.Next = 0;

        //Si se dan los tres productos, error
        if blnEntero and blnPelado and blnCola then
            Error('Ha generado una produccion no admitida');
        //Si hay entero y cola, no hay produccion de pelado. OK
        //Si hay pelado y cola, hay cola que se manda a pelar. OK
        //Si hay entero y pelado, hay entero que se manda a seccionar y luego pelar. OK
        //Si solo se da uno, error
        if blnEntero then
            i += 1;
        if blnPelado then
            i += 1;
        if blnCola then
            i += 1;
        if blnRoto then
            i += 2;

        if i < 2 then
            Error('Ha generado una produccion no admitida');

        i := 0;

        for i := 1 to 5 do begin

            Rendimiento[i] := 0;

        end;

        Clear(PunLineas);
        PunLineas.SetRange("Nombre libro diario", "Nombre libro diario");
        PunLineas.SetRange("Nombre seccion diario", "Nombre seccion diario");
        PunLineas.SetRange("No. documento", "No. documento");
        PunLinMP.Copy(PunLineas);
        PunLinPT.Copy(PunLineas);
        PunLinMP.SetRange(Tipo, PunLinMP.Tipo::Salida);
        PunLinPT.SetRange(Tipo, PunLinPT.Tipo::Entrada);

        if blnCola then
            "FRE Pelado Entrada KG" := "FRE Clasificacion Pelado KG";

        if PunLinMP.Find('-') then
            repeat

                // := PunLinMP.Actividad;

                PunProducto.Reset;
                PunProducto.Get(PunLinMP.Clasificacion);

                if PunProducto.Subfamilia in [PunConfEx."Subfamilia LAN Entero MP", PunConfEx."Subfamilia LAN Entero PT"] then
                    "FRE Seccionado Entrada KG" += PunLinMP."Kilos netos";

                if blnCola then
                    if PunProducto.Subfamilia in [PunConfEx."Subfamilia LAN Cola MP", PunConfEx."Subfamilia LAN Cola PT"] then
                        "FRE Pelado Entrada KG" += PunLinMP."Kilos netos";

                TotalKGMP += PunLinMP."Kilos netos";

            until PunLinMP.Next = 0;

        //"FRE Clasificacion Entrada KG" := TotalKGMP;

        if PunLinPT.Find('-') then
            repeat

                PunProducto.Reset;
                PunProducto.Get(PunLinPT.Clasificacion);

                if (blnCola and not blnPelado) then
                    if CopyStr(PunProducto.Familia, 1, 2) = 'PT' then begin

                        if PunProducto.Subfamilia = PunConfEx."Subfamilia LAN Pelado PT" then
                            "FRE Pelado Salida KG" += PunLinPT."Kilos netos";
                        if PunProducto.Subfamilia = PunConfEx."Subfamilia LAN Entero PT" then
                            "FRE Clasificacion Entero KG" += PunLinPT."Kilos netos";
                        if PunProducto.Subfamilia = PunConfEx."Subfamilia LAN Cola PT" then
                            "FRE Clasificacion Cola KG" += PunLinPT."Kilos netos";
                        "FRE Seccionado Salida KG" += PunLinPT."Kilos netos";
                        if PunProducto.Subfamilia = PunConfEx."Subfamilia LAN Residuos" then
                            "FRE Residuos Entrada" += PunLinPT."Kilos netos";

                    end;

                if CopyStr(PunProducto.Familia, 1, 2) = 'SE' then begin

                    if blnPelado then
                        if PunProducto.Subfamilia = PunConfEx."Subfamilia LAN Cola PT" then
                            "FRE Clasificacion Pelado KG" += PunLinPT."Kilos netos";
                    if blnCola then
                        "FRE Seccionado Salida KG" += PunLinPT."Kilos netos";

                end;

                TotalKGPT += PunLinPT."Kilos netos";

            until PunLinPT.Next = 0;

        if blnCola then
            "FRE Clasificacion Entrada KG" := "FRE Seccionado Salida KG";

        if "FRE Clasificacion Entrada KG" > 0 then
            "FRE Clas. Pelado RE (%)" := Round((("FRE Clasificacion Pelado KG" / "FRE Clasificacion Entrada KG") * 100), 0.01);
        if "FRE Clasificacion Entrada KG" > 0 then
            "FRE Clas. Entero RE (%)" := Round((("FRE Clasificacion Entero KG" / "FRE Clasificacion Entrada KG") * 100), 0.01);
        if "FRE Clasificacion Entrada KG" > 0 then
            "FRE Clas. Cola RE (%)" := Round((("FRE Clasificacion Cola KG" / "FRE Clasificacion Entrada KG") * 100), 0.01);
        if "FRE Clasificacion Entrada KG" > 0 then
            "FRE Merma Clasificacion (%)" := (1 - (("FRE Clasificacion Pelado KG" + "FRE Clasificacion Entero KG" +
                             "FRE Clasificacion Cola KG") / "FRE Clasificacion Entrada KG")) * 100;


        "FRE Envasado Entrada KG" := "FRE Clasificacion Entero KG" + "FRE Clasificacion Cola KG" + "FRE Pelado Salida KG" + "FRE Clasificacion Pelado KG";
        "FRE Envasado Salida KG" := TotalKGPT;
        if "FRE Envasado Entrada KG" = 0 then
            "FRE Envasado Entrada KG" := TotalKGPT;
        if "FRE Pelado Entrada KG" > 0 then
            "FRE Pelado RE (%)" := -(1 - ("FRE Pelado Salida KG" / "FRE Pelado Entrada KG")) * 100;
        if "FRE Seccionado Entrada KG" > 0 then
            "FRE Seccionado Entrada RE (%)" := -(1 - ("FRE Seccionado Salida KG" / "FRE Seccionado Entrada KG")) * 100;

        if ("FRE Entrada KG" <> 0) and ("FRE Envasado Salida KG" <> 0) then
            "FRE Produccion RE (%)" := Round((("FRE Envasado Entrada KG" / "FRE Entrada KG") * 100), 0.01);
        Modify;
    end;

    trigger OnAfterGetCurrRecord()
    begin
        xRec := Rec;

        if Registrado then begin
            CurrPage.Editable := false;
            blnRegistrado := false;
            blnNoRegistrado := true;
        end
        else begin
            CurrPage.Editable := true;
            blnRegistrado := true;
            blnNoRegistrado := false;
        end;
    end;

    [Scope('OnPrem')]
    procedure FunRendimientoLANHist()
    var
        PunLinPT: Record "Item Ledger Entry";
        PunLineas: Record "Item Ledger Entry";
        PunLinMP: Record "Item Ledger Entry";
        TotalKGMP: Decimal;
        TotalKGPT: Decimal;
        TotalVai: Decimal;
        TotalRej: Decimal;
        TotalAle: Decimal;
        PunConfEx: Record "Inventory Setup";
        PunProducto: Record Item;
        rstLineasSalida: Record "Item Journal Line";
        i: Integer;
        rstLinProd: Record "Item Ledger Entry";
        rstProd: Record Item;
        blnEntero: Boolean;
        blnCola: Boolean;
        blnPelado: Boolean;
        blnRoto: Boolean;
    begin
        TestField("Produccion terminada");
        PunLineas.Reset;
        PunLinMP.Reset;
        PunLinPT.Reset;
        PunConfEx.Get();
        TotalKGMP := 0;
        TotalKGPT := 0;

        "FRE Residuos Entrada" := 0;
        //Verificar el tipo de produccion
        Clear(rstLinProd);
        rstLinProd.SetRange("Nombre libro diario", "Nombre libro diario");
        rstLinProd.SetRange("Nombre seccion diario", "Nombre seccion diario");
        rstLinProd.SetRange("Document No.", "No. documento");
        if rstLinProd.FindSet then
            repeat

                Clear(rstProd);
                if rstProd.Get(rstLinProd."Item No.") then begin

                    if rstProd.Subfamilia in [PunConfEx."Subfamilia LAN Entero MP", PunConfEx."Subfamilia LAN Entero PT"] then
                        blnEntero := true;

                    if rstProd.Subfamilia = PunConfEx."Subfamilia LAN Pelado PT" then
                        blnPelado := true;

                    if rstProd.Subfamilia in [PunConfEx."Subfamilia LAN Cola MP", PunConfEx."Subfamilia LAN Cola PT"] then
                        blnCola := true;

                    if rstProd.Subfamilia in [PunConfEx."Subfamilia LAN Roto MP"] then
                        blnRoto := true;


                end;

            until rstLinProd.Next = 0;

        //Si se dan los tres productos, error
        if blnEntero and blnPelado and blnCola then
            Error('Ha generado una produccion no admitida');
        //Si hay entero y cola, no hay produccion de pelado. OK
        //Si hay pelado y cola, hay cola que se manda a pelar. OK
        //Si hay entero y pelado, hay entero que se manda a seccionar y luego pelar. OK
        //Si solo se da uno, error
        if blnEntero then
            i += 1;
        if blnPelado then
            i += 1;
        if blnCola then
            i += 1;
        if blnRoto then
            i += 2;

        if i < 2 then
            Error('Ha generado una produccion no admitida');

        i := 0;

        for i := 1 to 5 do begin

            Rendimiento[i] := 0;

        end;

        Clear(PunLineas);
        PunLineas.SetRange("Nombre libro diario", "Nombre libro diario");
        PunLineas.SetRange("Nombre seccion diario", "Nombre seccion diario");
        PunLineas.SetRange("Document No.", "No. documento");
        PunLinMP.Copy(PunLineas);
        PunLinPT.Copy(PunLineas);
        PunLinMP.SetRange("Entry Type", PunLinMP."Entry Type"::"Negative Adjmt.");
        PunLinPT.SetRange("Entry Type", PunLinPT."Entry Type"::"Positive Adjmt.");

        if blnCola then
            "FRE Pelado Entrada KG" := "FRE Clasificacion Pelado KG";

        if PunLinMP.Find('-') then
            repeat

                // := PunLinMP.Actividad;

                PunProducto.Reset;
                PunProducto.Get(PunLinMP."Item No.");

                if PunProducto.Subfamilia in [PunConfEx."Subfamilia LAN Entero MP", PunConfEx."Subfamilia LAN Entero PT"] then
                    "FRE Seccionado Entrada KG" += PunLinMP."Net kilos" * -1;

                if blnCola then
                    if PunProducto.Subfamilia in [PunConfEx."Subfamilia LAN Cola MP", PunConfEx."Subfamilia LAN Cola PT"] then
                        "FRE Pelado Entrada KG" += PunLinMP."Net kilos" * -1;

                TotalKGMP += PunLinMP."Net kilos" * -1;
                "FRE Entrada KG" += PunLinMP."Net kilos" * -1;

            until PunLinMP.Next = 0;

        //"FRE Clasificacion Entrada KG" := TotalKGMP;

        if PunLinPT.Find('-') then
            repeat

                PunProducto.Reset;
                PunProducto.Get(PunLinPT."Item No.");

                if (blnCola and not blnPelado) then
                    if CopyStr(PunProducto.Familia, 1, 2) = 'PT' then begin

                        if PunProducto.Subfamilia = PunConfEx."Subfamilia LAN Pelado PT" then
                            "FRE Pelado Salida KG" += PunLinPT."Net kilos";
                        if PunProducto.Subfamilia = PunConfEx."Subfamilia LAN Entero PT" then
                            "FRE Clasificacion Entero KG" += PunLinPT."Net kilos";
                        if PunProducto.Subfamilia = PunConfEx."Subfamilia LAN Cola PT" then
                            "FRE Clasificacion Cola KG" += PunLinPT."Net kilos";
                        "FRE Seccionado Salida KG" += PunLinPT."Net kilos";
                        if PunProducto.Subfamilia = PunConfEx."Subfamilia LAN Residuos" then
                            "FRE Residuos Entrada" += PunLinPT."Net kilos";

                    end;

                if CopyStr(PunProducto.Familia, 1, 2) = 'SE' then begin

                    if blnPelado then
                        if PunProducto.Subfamilia = PunConfEx."Subfamilia LAN Cola PT" then
                            "FRE Clasificacion Pelado KG" += PunLinPT."Net kilos";
                    if blnCola then
                        "FRE Seccionado Salida KG" += PunLinPT."Net kilos";

                end;

                TotalKGPT += PunLinPT."Net kilos";

            until PunLinPT.Next = 0;

        if blnCola then
            "FRE Clasificacion Entrada KG" := "FRE Seccionado Salida KG";

        if "FRE Clasificacion Entrada KG" > 0 then
            "FRE Clas. Pelado RE (%)" := Round((("FRE Clasificacion Pelado KG" / "FRE Clasificacion Entrada KG") * 100), 0.01);
        if "FRE Clasificacion Entrada KG" > 0 then
            "FRE Clas. Entero RE (%)" := Round((("FRE Clasificacion Entero KG" / "FRE Clasificacion Entrada KG") * 100), 0.01);
        if "FRE Clasificacion Entrada KG" > 0 then
            "FRE Clas. Cola RE (%)" := Round((("FRE Clasificacion Cola KG" / "FRE Clasificacion Entrada KG") * 100), 0.01);
        if "FRE Clasificacion Entrada KG" > 0 then
            "FRE Merma Clasificacion (%)" := (1 - (("FRE Clasificacion Pelado KG" + "FRE Clasificacion Entero KG" +
                             "FRE Clasificacion Cola KG") / "FRE Clasificacion Entrada KG")) * 100;


        "FRE Envasado Entrada KG" := "FRE Clasificacion Entero KG" + "FRE Clasificacion Cola KG" + "FRE Pelado Salida KG" + "FRE Clasificacion Pelado KG";
        "FRE Envasado Salida KG" := TotalKGPT;
        if "FRE Envasado Entrada KG" = 0 then
            "FRE Envasado Entrada KG" := TotalKGPT;
        if "FRE Pelado Entrada KG" > 0 then
            "FRE Pelado RE (%)" := -(1 - ("FRE Pelado Salida KG" / "FRE Pelado Entrada KG")) * 100;
        if "FRE Seccionado Entrada KG" > 0 then
            "FRE Seccionado Entrada RE (%)" := -(1 - ("FRE Seccionado Salida KG" / "FRE Seccionado Entrada KG")) * 100;

        if ("FRE Entrada KG" <> 0) and ("FRE Envasado Salida KG" <> 0) then
            "FRE Produccion RE (%)" := Round((("FRE Envasado Entrada KG" / "FRE Entrada KG") * 100), 0.01);
        Modify;
    end;

    [Scope('OnPrem')]
    procedure FunRendimientoCALHist()
    var
        rstLineas: Record "Item Ledger Entry";
        PunLinMP: Record "Item Ledger Entry";
        PunLinPT: Record "Item Ledger Entry";
        TotalKGMP: Decimal;
        TotalKGPT: Decimal;
        TotalVai: Decimal;
        TotalRej: Decimal;
        TotalAle: Decimal;
        rstConfEx: Record "Inventory Setup";
        PunProducto: Record Item;
        rstLineasSalida: Record "Item Ledger Entry";
    begin
        TestField("Produccion terminada");
        rstLineas.Reset;
        rstConfEx.Get();

        Clear(rstLineas);
        rstLineas.SetRange(rstLineas."Nombre libro diario", "Nombre libro diario");
        rstLineas.SetRange(rstLineas."Nombre seccion diario", "Nombre seccion diario");
        rstLineas.SetRange("Document No.", "No. documento");
        if rstLineas.Find('-') then
            repeat

                if rstLineas."Entry Type" = rstLineas."Entry Type"::"Negative Adjmt." then begin

                    if rstLineas.Family <> rstConfEx."Familia CAL SE" then begin

                        "CAL Entrada MP" += Abs(rstLineas."Gross kilos");

                    end
                    else begin

                        "CAL Entrada SE Reproceso" += Abs(rstLineas."Gross kilos");

                    end;

                    "CAL Pelado Entrada KG" += Abs(rstLineas."Gross kilos");

                    if rstLineas.Subfamily = rstConfEx."Subfamilia CAL Entero MP" then
                        "CAL Entero MP" += Abs(rstLineas."Gross kilos");

                    if rstLineas.Subfamily = rstConfEx."Subfamilia CAL Rejo MP" then
                        "CAL Rejo MP" += Abs(rstLineas."Gross kilos");

                    if rstLineas.Subfamily = rstConfEx."Subfamilia CAL Vaina MP" then
                        "CAL Vaina MP" += Abs(rstLineas."Gross kilos");

                    if rstLineas.Subfamily = rstConfEx."Subfamilia CAL Rejo Sucio MP" then
                        "CAL Rejo Sucio MP" += Abs(rstLineas."Gross kilos");


                end
                else begin

                    if rstLineas.Subfamily = rstConfEx."Subfamilia CAL Vaina" then
                        "CAL Engorde Salida KG" += Abs(rstLineas."Net kilos");
                    if rstLineas.Subfamily = rstConfEx."Subfamilia CAL Roto" then
                        "CAL Engorde Salida KG" += Abs(rstLineas."Net kilos");
                    if rstLineas.Subfamily = rstConfEx."Subfamilia CAL Vaina SE" then begin
                        "CAL Vaina Sin Engorde KN" += Abs(rstLineas."Net kilos");
                        "CAL Salida KG Semielaborado" += Abs(rstLineas."Net kilos");
                    end;
                    if rstLineas.Subfamily = rstConfEx."Subfamilia CAL Rejo Sucio PT" then
                        "CAL Rejo Sucio PT" += Abs(rstLineas."Net kilos");
                    if rstLineas.Subfamily = rstConfEx."Subfamilia CAL Aletas" then
                        "CAL Pelado Aletas KG" += Abs(rstLineas."Net kilos");
                    if rstLineas.Subfamily = rstConfEx."Subfamilia CAL Rejos" then
                        "CAL Pelado Rejos KG" += Abs(rstLineas."Net kilos");
                    if rstLineas.Subfamily <> rstConfEx."Subfamilia CAL Residuos" then
                        "CAL Envasado Salida KG" += Abs(rstLineas."Net kilos");
                    if rstLineas.Subfamily = rstConfEx."Subfamilia CAL Rejo SE" then begin
                        "CAL Rejo Sin Engorde KN" += rstLineas."Net kilos";
                        "CAL Salida KG Semielaborado" += Abs(rstLineas."Net kilos");
                    end;

                    if rstLineas.Subfamily = rstConfEx."Subfamilia CAL Residuos" then
                        "CAL Residuos KG" += rstLineas."Net kilos";
                    if rstLineas.Subfamily = rstConfEx."Subfamilia CAL Ent S/Clas" then
                        "CAL Entero Sin Clasificar KN" += rstLineas."Net kilos";

                    "CAL Entrada PT" += rstLineas."Net kilos";

                end;

            until rstLineas.Next = 0;

        "CAL Pelado Vaina KG" += "CAL Engorde Entrada KG";
        if "CAL Pelado Vaina KG" <> 0 then
            "CAL Engorde Entrada KG" := "CAL Pelado Vaina KG"
        else
            "CAL Engorde Entrada KG" := "CAL Engorde Salida KG";
        if "CAL Pelado Entrada KG" > 0 then
            "CAL Pelado Vaina RE (%)" := Round((("CAL Pelado Vaina KG" / "CAL Pelado Entrada KG") * 100), 0.01);
        if "CAL Pelado Entrada KG" > 0 then
            "CAL Pelado Rejos RE (%)" := Round((("CAL Pelado Rejos KG" / "CAL Pelado Entrada KG") * 100), 0.01);
        if "CAL Pelado Entrada KG" > 0 then
            "CAL Pelado Aletas RE (%)" := Round((("CAL Pelado Aletas KG" / "CAL Pelado Entrada KG") * 100), 0.01);
        if "CAL Pelado Entrada KG" > 0 then
            "CAL Merma Pelado (%)" :=
                                      (1 - (("CAL Pelado Vaina KG" + "CAL Pelado Rejos KG" + "CAL Pelado Aletas KG") / "CAL Pelado Entrada KG")) * 100
          ;
        "CAL Envasado Entrada KG" := "CAL Pelado Rejos KG" + "CAL Pelado Aletas KG" + "CAL Engorde Salida KG" +
                                     "CAL Vaina Sin Engorde KN" + "CAL Rejo Sin Engorde KN" + "CAL Entero Sin Clasificar KN";

        if "CAL Rejo Sucio PT" <> 0 then
            "CAL Rejo a Congelar PT" := Abs(rstLineas."Gross kilos");

        if "CAL Engorde Entrada KG" > 0 then
            "CAL Engorde RE (%)" := -(1 - ("CAL Engorde Salida KG" / "CAL Engorde Entrada KG")) * 100;

        if "CAL Engorde Salida KG" = 0 then begin

            "CAL Pelado Vaina KG" := 0;
            "CAL Pelado Vaina RE (%)" := 0;
            "CAL Engorde Entrada KG" := 0;
            "CAL Engorde Salida KG" := 0;
            "CAL Engorde RE (%)" := 0;

        end;

        if "CAL Residuos KG" = 0 then
            "CAL Residuos KG" := ("CAL Entrada MP" + "CAL Entrada SE Reproceso") -
                                               ("CAL Engorde Entrada KG" + "CAL Pelado Rejos KG" +
                                               "CAL Pelado Aletas KG" + "CAL Rejo Sucio PT");

        Modify;
    end;

    [Scope('OnPrem')]
    procedure FunRendimientoMERHist()
    var
        PunLinPT: Record "Item Ledger Entry";
        PunLineas: Record "Item Ledger Entry";
        PunLinMP: Record "Item Ledger Entry";
        TotalKGMP: Decimal;
        TotalKGPT: Decimal;
        TotalVai: Decimal;
        TotalRej: Decimal;
        TotalAle: Decimal;
        PunConfEx: Record "Inventory Setup";
        PunProducto: Record Item;
        rstLineasSalida: Record "Item Journal Line";
        i: Integer;
        rstLinProd: Record "Item Ledger Entry";
        rstProd: Record Item;
        blnEntero: Boolean;
        blnCola: Boolean;
        blnPelado: Boolean;
        blnRoto: Boolean;
    begin
        TestField("Produccion terminada");
        PunLineas.Reset;
        PunLinMP.Reset;
        PunLinPT.Reset;
        PunConfEx.Get();
        TotalKGMP := 0;
        TotalKGPT := 0;

        "FRE Residuos Entrada" := 0;
        //Verificar el tipo de produccion
        Clear(rstLinProd);
        rstLinProd.SetRange("Nombre libro diario", "Nombre libro diario");
        rstLinProd.SetRange("Nombre seccion diario", "Nombre seccion diario");
        rstLinProd.SetRange("Document No.", "No. documento");
        if rstLinProd.FindSet then
            repeat

                Clear(rstProd);
                if rstProd.Get(rstLinProd."Item No.") then begin

                    if rstProd.Subfamilia in [PunConfEx."Subfamilia LAN Entero MP", PunConfEx."Subfamilia LAN Entero PT"] then
                        blnEntero := true;

                    if rstProd.Subfamilia = PunConfEx."Subfamilia LAN Pelado PT" then
                        blnPelado := true;

                    if rstProd.Subfamilia in [PunConfEx."Subfamilia LAN Cola MP", PunConfEx."Subfamilia LAN Cola PT"] then
                        blnCola := true;

                    if rstProd.Subfamilia in [PunConfEx."Subfamilia LAN Roto MP"] then
                        blnRoto := true;


                end;

            until rstLinProd.Next = 0;

        //Si se dan los tres productos, error
        if blnEntero and blnPelado and blnCola then
            Error('Ha generado una produccion no admitida');
        //Si hay entero y cola, no hay produccion de pelado. OK
        //Si hay pelado y cola, hay cola que se manda a pelar. OK
        //Si hay entero y pelado, hay entero que se manda a seccionar y luego pelar. OK
        //Si solo se da uno, error
        if blnEntero then
            i += 1;
        if blnPelado then
            i += 1;
        if blnCola then
            i += 1;
        if blnRoto then
            i += 2;

        if i < 2 then
            Error('Ha generado una produccion no admitida');

        i := 0;

        for i := 1 to 5 do begin

            Rendimiento[i] := 0;

        end;

        Clear(PunLineas);
        PunLineas.SetRange("Nombre libro diario", "Nombre libro diario");
        PunLineas.SetRange("Nombre seccion diario", "Nombre seccion diario");
        PunLineas.SetRange("Document No.", "No. documento");
        PunLinMP.Copy(PunLineas);
        PunLinPT.Copy(PunLineas);
        PunLinMP.SetRange("Entry Type", PunLinMP."Entry Type"::"Negative Adjmt.");
        PunLinPT.SetRange("Entry Type", PunLinPT."Entry Type"::"Positive Adjmt.");

        if blnCola then
            "FRE Pelado Entrada KG" := "FRE Clasificacion Pelado KG";

        if PunLinMP.Find('-') then
            repeat

                // := PunLinMP.Actividad;

                PunProducto.Reset;
                PunProducto.Get(PunLinMP."Item No.");

                if PunProducto.Subfamilia in [PunConfEx."Subfamilia LAN Entero MP", PunConfEx."Subfamilia LAN Entero PT"] then
                    "FRE Seccionado Entrada KG" += PunLinMP."Net kilos" * -1;

                if blnCola then
                    if PunProducto.Subfamilia in [PunConfEx."Subfamilia LAN Cola MP", PunConfEx."Subfamilia LAN Cola PT"] then
                        "FRE Pelado Entrada KG" += PunLinMP."Net kilos" * -1;

                TotalKGMP += PunLinMP."Net kilos" * -1;

            until PunLinMP.Next = 0;

        //"FRE Clasificacion Entrada KG" := TotalKGMP;

        if PunLinPT.Find('-') then
            repeat

                PunProducto.Reset;
                PunProducto.Get(PunLinPT."Item No.");

                if (blnCola and not blnPelado) then
                    if CopyStr(PunProducto.Familia, 1, 2) = 'PT' then begin

                        if PunProducto.Subfamilia = PunConfEx."Subfamilia LAN Pelado PT" then
                            "FRE Pelado Salida KG" += PunLinPT."Net kilos";
                        if PunProducto.Subfamilia = PunConfEx."Subfamilia LAN Entero PT" then
                            "FRE Clasificacion Entero KG" += PunLinPT."Net kilos";
                        if PunProducto.Subfamilia = PunConfEx."Subfamilia LAN Cola PT" then
                            "FRE Clasificacion Cola KG" += PunLinPT."Net kilos";
                        "FRE Seccionado Salida KG" += PunLinPT."Net kilos";
                        if PunProducto.Subfamilia = PunConfEx."Subfamilia LAN Residuos" then
                            "FRE Residuos Entrada" += PunLinPT."Net kilos";

                    end;

                if CopyStr(PunProducto.Familia, 1, 2) = 'SE' then begin

                    if blnPelado then
                        if PunProducto.Subfamilia = PunConfEx."Subfamilia LAN Cola PT" then
                            "FRE Clasificacion Pelado KG" += PunLinPT."Net kilos";
                    if blnCola then
                        "FRE Seccionado Salida KG" += PunLinPT."Net kilos";

                end;

                TotalKGPT += PunLinPT."Net kilos";

            until PunLinPT.Next = 0;

        if blnCola then
            "FRE Clasificacion Entrada KG" := "FRE Seccionado Salida KG";

        if "FRE Clasificacion Entrada KG" > 0 then
            "FRE Clas. Pelado RE (%)" := Round((("FRE Clasificacion Pelado KG" / "FRE Clasificacion Entrada KG") * 100), 0.01);
        if "FRE Clasificacion Entrada KG" > 0 then
            "FRE Clas. Entero RE (%)" := Round((("FRE Clasificacion Entero KG" / "FRE Clasificacion Entrada KG") * 100), 0.01);
        if "FRE Clasificacion Entrada KG" > 0 then
            "FRE Clas. Cola RE (%)" := Round((("FRE Clasificacion Cola KG" / "FRE Clasificacion Entrada KG") * 100), 0.01);
        if "FRE Clasificacion Entrada KG" > 0 then
            "FRE Merma Clasificacion (%)" := (1 - (("FRE Clasificacion Pelado KG" + "FRE Clasificacion Entero KG" +
                             "FRE Clasificacion Cola KG") / "FRE Clasificacion Entrada KG")) * 100;


        "FRE Envasado Entrada KG" := "FRE Clasificacion Entero KG" + "FRE Clasificacion Cola KG" + "FRE Pelado Salida KG" + "FRE Clasificacion Pelado KG";
        "FRE Envasado Salida KG" := TotalKGPT;
        if "FRE Envasado Entrada KG" = 0 then
            "FRE Envasado Entrada KG" := TotalKGPT;
        if "FRE Pelado Entrada KG" > 0 then
            "FRE Pelado RE (%)" := -(1 - ("FRE Pelado Salida KG" / "FRE Pelado Entrada KG")) * 100;
        if "FRE Seccionado Entrada KG" > 0 then
            "FRE Seccionado Entrada RE (%)" := -(1 - ("FRE Seccionado Salida KG" / "FRE Seccionado Entrada KG")) * 100;

        if ("FRE Entrada KG" <> 0) and ("FRE Envasado Salida KG" <> 0) then
            "FRE Produccion RE (%)" := -(1 - ("FRE Envasado Salida KG" / "FRE Entrada KG")) * 100;
        Modify;
    end;

    [Scope('OnPrem')]
    procedure Navigate()
    var
        NavigateForm: Page Navigate;
    begin
        NavigateForm.SetDoc("Fecha registro", "No. documento");
        NavigateForm.Run;
    end;
}

