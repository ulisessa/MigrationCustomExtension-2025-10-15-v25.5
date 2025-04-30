page 50649 "Lista descargas"
{
    CardPageID = "Form Descarga";
    Editable = false;
    PageType = List;
    SourceTable = "Cab. descarga";
    SourceTableView = SORTING("Fecha de inicio de descarga")
                      ORDER(Descending);
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("No. proyecto"; "No. proyecto")
                {
                }
                field("Capitán"; Capitán)
                {
                }
                field(Actividad; Actividad)
                {
                }
                field("Fecha de inicio de descarga"; "Fecha de inicio de descarga")
                {
                }
                field("Hora inicio descarga"; "Hora inicio descarga")
                {
                }
                field("Hora fin descarga"; "Hora fin descarga")
                {
                }
                field(Buque; Buque)
                {
                }
                field(Marea; Marea)
                {
                }
                field(Location; Location)
                {
                }
                field("Libro Diario"; "Libro Diario")
                {
                }
                field(Puerto; Puerto)
                {
                }
                field("Cantidad x capitán"; "Cantidad x capitán")
                {
                }
                field("Promedio general"; decPromedio)
                {
                }
                field("KN linea descarga"; "KN linea descarga")
                {
                }
                field("KN diario descarga"; "KN diario descarga")
                {
                }
                field("Totales DCL"; "Totales DCL")
                {
                }
                field("Totales aplicados a DCL"; "Totales aplicados a DCL")
                {
                }
                field("Totales descontados DCL"; "Totales descontados DCL")
                {
                }
                field("Pallets desde"; "Pallets desde")
                {
                }
                field("Pallets hasta"; "Pallets hasta")
                {
                }
                field(Registrado; Registrado)
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Menú")
            {
                Caption = '&Menú';
                action("<Action1000000034>")
                {
                    Caption = 'Imprimir &descarga';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        /*IF NOT Registrado THEN
                        BEGIN
                         */
                        Clear(rptInforme);
                        rptInforme.fntProyecto("No. proyecto");
                        rptInforme.RunModal;
                        /*
                      END
                      ELSE
                      BEGIN

                        CLEAR(rptInformeH);
                        CLEAR(rstCabecera);
                        rstCabecera.GET("No. proyecto");
                        rstCabecera.SETRECFILTER;
                        rptInformeH.SETTABLEVIEW(rstCabecera);
                        rptInformeH.RUNMODAL;


                      END;
                         */

                    end;
                }
            }
            group(Acciones)
            {
                Caption = 'A&cciones';
                action("<Action1000000014>")
                {
                    Caption = '&Digitalizar';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Clear(frmDigitalizar);
                        Clear(rstDigitalizar);
                        Clear(rstConfusu);
                        rstConfusu.Get(UserId);
                        //rstDigitalizar.SETRANGE(Documento,'Descarga');
                        rstDigitalizar.SetRange(Departamento, rstConfusu.Grupo);
                        frmDigitalizar.funLlamarCapturador('Descarga', "No. proyecto", '', "No. proyecto", '', '', '', '', '', '', '');
                        frmDigitalizar.LookupMode(true);
                        frmDigitalizar.SetTableView(rstDigitalizar);
                        if frmDigitalizar.RunModal = ACTION::LookupOK then begin

                            Clear(cduDigitalizarOAbrir);
                            frmDigitalizar.GetRecord(rstDigitalizar);
                            cduDigitalizarOAbrir.ImportarDocumento(rstDigitalizar.Documento,
                            Format(Today), rstDigitalizar.Departamento, "No. proyecto", UserId, "No. proyecto", Format(Today), '', '', '', '',
                            rstDigitalizar, false, false, true, '', false, false);

                        end;
                    end;
                }
                action("&Revertir")
                {
                    Caption = '&Revertir';
                    Enabled = blnNoRegistrado;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = blnNoRegistrado;

                    trigger OnAction()
                    begin
                        if Confirm('¿Desea revertir esta descarga?') then begin

                            if cduFishing.fntRegistroDescarga(Rec, rstLinDiaProd, true, false) then begin

                                CODEUNIT.Run(CODEUNIT::"Item Jnl.-Post", rstLinDiaProd);

                                Registrado := false;
                                Modify;
                                Message('Revertido con éxito');

                            end
                            else
                                Message('No se ha completado la reversión');

                        end;

                    end;
                }
                action("Movs. productos")
                {
                    Caption = 'Item Ledger';
                    Image = ItemLedger;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        ItemLedgEntry: Record "Item Ledger Entry";
                    begin
                        Clear(ItemLedgEntry);
                        ItemLedgEntry.SetRange(ItemLedgEntry."Lote origen", Buque + Marea);
                        ItemLedgEntry.SetRange("Nombre libro diario", "Libro Diario");
                        ItemLedgEntry.SetRange("Nombre seccion diario", Puerto);
                        PAGE.Run(PAGE::"Item Ledger Entries", ItemLedgEntry);
                    end;
                }
            }
            group("&Ver")
            {
                Caption = '&Ver';
                action("Ver descarga")
                {
                    RunObject = Page "Form Descarga";
                    RunPageLink = "No. proyecto" = FIELD("No. proyecto");
                }
                action("Ver descarga histórica")
                {
                    RunObject = Page "Form Descarga";
                    RunPageLink = "No. proyecto" = FIELD("No. proyecto");
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        decPromedio := 0;
        CalcFields("Cantidad x descarga", "KN linea descarga");
        if ("Cantidad x descarga" <> 0) and ("KN linea descarga" <> 0) then
            decPromedio := Round("KN linea descarga" / "Cantidad x descarga", 0.01);
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


    var
        rptInforme: Report "Descarga temp. x Informe Cap.";
        rptInformeH: Report "Descarga temp. x Informe Cap.";
        rstCabecera: Record "Cab. descarga";
        cduDigitalizarOAbrir: Codeunit Escaneado;
        rstDigitalizar: Record "Ruta digitalizacion depto/espe";
        rstConfusu: Record "User Setup";
        rstLinDescarga: Record "Lín. descarga";
        rstLinDiaProd: Record "Item Journal Line";
        rstConfEx: Record "Inventory Setup";
        rstProyecto: Record Job;
        intCantidadAproxPallets: Integer;
        i: Integer;
        cduAnular: Codeunit Descargas;

        RegistroVisible: Boolean;
        "strCapitán": Text[30];
        cduFishing: Codeunit Descargas;

        blnRegistrado: Boolean;

        blnNoRegistrado: Boolean;
        frmDigitalizar: Page "Ruta digitalización";
        decPromedio: Decimal;

}

