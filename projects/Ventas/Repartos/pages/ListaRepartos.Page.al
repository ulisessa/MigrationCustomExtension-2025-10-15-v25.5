page 50062 "Lista Repartos"
{
    // IF blnRegistrado THEN
    //   ERROR('No puede eliminar un reparto registrado. Reviértalo primero.');

    CardPageID = "Cab. reparto";
    DeleteAllowed = true;
    PageType = List;
    SourceTable = "Cab. Reparto";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No. Documento"; "No. Documento")
                {
                }
                field(Cliente; Cliente)
                {
                }
                field("Nombre cliente"; "Nombre cliente")
                {
                }
                field("Beneficiary bank"; "Beneficiary bank")
                {
                }
                field("Loading port"; "Loading port")
                {
                }
                field(Transportista; Transportista)
                {
                }
                field("Destination port"; "Destination port")
                {
                }
                field("No. Pedido"; "No. Pedido")
                {
                }
                field(Observaciones; Observaciones)
                {
                }
                field("Fecha cumplido"; "Fecha cumplido")
                {
                }
                field(Usuario; Usuario)
                {
                }
                field(Estado; Estado)
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Activate Distribution")
            {
                Caption = 'Activate &Distribution';
                Image = Approve;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                RunPageMode = Edit;
                Visible = false;

                trigger OnAction()
                begin
                    //SETRANGE("No. Documento","No. Documento");
                    CurrPage.SetSelectionFilter(rstCabReparto);
                    rstCabReparto.FindFirst;


                    with rstCabReparto do begin

                        TestField("No. Documento");
                        TestField("Fecha reparto");
                        TestField(Usuario);
                        TestField(Cliente);
                        TestField("Container type");
                        TestField("Loading port");
                        TestField(Transportista);
                        TestField("Destination port");
                        //TESTFIELD(Actividad);

                        Clear(cduGestionReparto);
                        Clear(rstLinReparto);
                        //fntCrearLineas.CrearLineasExistencias(rstLinReparto,Rec);
                        cduGestionReparto.ActualizarLineasExistencias(rstCabReparto);
                        Clear(cduMensajeria);
                        Clear(rstConfUsu);
                        Clear(rstMensajeria);

                        rstConfUsu.Reset;
                        if rstConfUsu.Get(UserId) then
                            cduMensajeria.RegistrarMensaje('Alta de Reparto', '', "No. Documento", 'Reparto (ventas)', 'Abierto', Today,
                            rstMensajeria."Tipo movimiento"::"Mensaje con Seguimiento", rstConfUsu.Grupo, '', '', '', '', '', '', '');

                        pge50604.SetTableView(rstCabReparto);
                        pge50604.fntPasarDoc("No. Documento");
                        pge50604.Run;

                    end;
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
            action("Eliminar reparto")
            {
                Image = Delete;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Visible = blnRegistrado;

                trigger OnAction()
                var
                    l_rstCabReparto: Record "Cab. Reparto";
                begin
                    CurrPage.SetSelectionFilter(l_rstCabReparto);
                    l_rstCabReparto.FindFirst;
                    l_rstCabReparto.Delete(true);
                end;
            }
            group("&Registro")
            {
                Caption = '&Registro';
                action(Registrar)
                {
                    Caption = 'Registrar';
                    Image = Post;
                    Promoted = true;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';
                    Visible = blnRegistrado;

                    trigger OnAction()
                    begin
                        if Confirm('¿Desea registrar este reparto?') then begin

                            if cduGestionReparto.fntRegistroReparto(Rec, rstLinReparto, false) then
                                exit
                            else
                                Message('No se ha completado el registro');

                        end;
                    end;
                }
                action("Registrar e &imprimir")
                {
                    Caption = 'Registrar e &imprimir';
                    Ellipsis = true;
                    Image = PostPrint;
                    Promoted = true;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+F9';
                    Visible = blnRegistrado;

                    trigger OnAction()
                    var
                        CabVale: Record "Cab. Vale consumo";
                        rptVC: Report Reparto;
                        cduFishing: Codeunit "Registro diarios";
                        rstCab: Record "Cab. Reparto";
                    begin
                        if Confirm('¿Desea registrar este reparto?') then begin

                            if cduGestionReparto.fntRegistroReparto(Rec, rstLinReparto, false) then
                                exit
                            else
                                Message('No se ha completado el registro');

                            Clear(rptVC);
                            Clear(rstCab);
                            CurrPage.SetSelectionFilter(rstCab);
                            REPORT.Run(50597, false, true, rstCab);

                        end;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if not (Estado in ['Abierto', '']) then
            blnRegistrado := false
        else
            blnRegistrado := true;

        CurrPage.Update(false);
    end;

    trigger OnOpenPage()
    begin
        blnRegistrado := true;
        //SETCURRENTKEY(Estado);
    end;

    var
        cduGestionReparto: Codeunit "ExtensiónVentas";
        rstLinReparto: Record "Lín. reparto";
        cduMensajeria: Codeunit "Mensajería";
        rstConfUsu: Record "User Setup";
        rstMensajeria: Record Mensajeria;
        rstProductosExportacion: Record Item;
        rstLotes: Record "Lín. reparto";
        rstProducto: Record Item;
        rstUnidadMedidadProducto: Record "Item Unit of Measure";
        i: Integer;
        pge50604: Page "Reparto nuevo";
        rstCabReparto: Record "Cab. Reparto";
        blnRegistrado: Boolean;
}

