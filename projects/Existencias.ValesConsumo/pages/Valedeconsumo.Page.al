page 50045 "Vale de consumo"
{
    // IBdos Argentina - USS - 180603 - Modificación Arbumasa
    //  a) Modificación para que imprima el vale registrado

    Editable = true;
    PageType = Document;
    SourceTable = "Cab. Vale consumo";
    SourceTableView = SORTING("Nombre Libro Consumo", "No. documento");
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = blnRegistrado;
                //The GridLayout property is only supported on controls of type Grid
                //GridLayout = Rows;
                field("Nombre Libro Consumo"; "Nombre Libro Consumo")
                {
                    NotBlank = true;
                }
                field("No. documento"; "No. documento")
                {
                }
                field("Descripción"; Descripción)
                {
                }
                field("Fecha registro"; "Fecha registro")
                {
                }
                field(Usuario; Usuario)
                {
                    Editable = false;
                }
                field(Estado; Estado)
                {
                    Editable = false;
                }
            }
            part(SubForm; "Lin. vale consumo")
            {
                Editable = blnRegistrado;
                SubPageLink = "No. documento" = FIELD("No. documento");
            }
        }
    }

    actions
    {
        area(navigation)
        {
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
                    var
                        rstConfEx: Record "Inventory Setup";
                    begin
                        if Confirm('¿Desea registrar este consumo?') then begin

                            if not cduFishing.fntRegistroConsumo(Rec, rstLinDiaProd, false) then
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
                        rptVC: Report "Vale de consumo VALORADO";
                        rstConfEx: Record "Inventory Setup";
                    begin
                        if Confirm('¿Desea registrar este consumo?') then begin

                            if not cduFishing.fntRegistroConsumo(Rec, rstLinDiaProd, false) then
                                Message('No se ha completado el registro')
                            else begin
                                Clear(rptVC);
                                Clear(rstCab);
                                CurrPage.SetSelectionFilter(rstCab);
                                REPORT.Run(50025, false, true, rstCab);
                                //rptVC.SETTABLEVIEW(rstCab);
                                //rptVC.RUN;
                            end;

                        end;
                    end;
                }
            }
        }
        area(processing)
        {
            action("&Imprimir")
            {
                Caption = '&Imprimir';
                Ellipsis = true;
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rptVC: Report "Vale de consumo VALORADO";
                begin
                    Clear(rptVC);
                    Clear(rstCab);
                    CurrPage.SetSelectionFilter(rstCab);
                    rptVC.SetTableView(rstCab);
                    rptVC.Run;
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
            action("<Action1000000014>")
            {
                Caption = '&Digitalizar';
                Image = Attach;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    cduDigitalizarOAbrir: Codeunit Escaneado;
                    rstDigitalizar: Record "Ruta digitalizacion depto/espe";
                    frmDigitalizar: Page "Ruta digitalización";
                begin
                    Clear(frmDigitalizar);
                    Clear(rstDigitalizar);
                    Clear(rstConfUsu);
                    rstConfUsu.Get(UserId);
                    //rstDigitalizar.SETRANGE(Documento,'Descarga');
                    rstDigitalizar.SetRange(Departamento, rstConfUsu.Grupo);
                    frmDigitalizar.funLlamarCapturador('Consumo', "No. documento", '', "No. documento", '', '', '', '', '', '', '');
                    frmDigitalizar.LookupMode(true);
                    frmDigitalizar.SetTableView(rstDigitalizar);
                    if frmDigitalizar.RunModal = ACTION::LookupOK then begin

                        Clear(cduDigitalizarOAbrir);
                        frmDigitalizar.GetRecord(rstDigitalizar);
                        cduDigitalizarOAbrir.ImportarDocumento(rstDigitalizar.Documento,
                        Format(Today), rstDigitalizar.Departamento, "No. documento", UserId, "No. documento", Format(Today), '', '', '', '',
                        rstDigitalizar, false, false, true, '', false, false);

                    end;
                end;
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
    end;

    var
        Fun: Codeunit GestionConsumos;
        rstMensajeria: Record Mensajeria;
        cduMensajeria: Codeunit "Mensajería";
        rstConfUsu: Record "User Setup";
        blnRegistrado: Boolean;
        cduFishing: Codeunit GestionConsumos;
        rstLinDiaProd: Record "Item Journal Line";
        rstCab: Record "Cab. Vale consumo";
}

