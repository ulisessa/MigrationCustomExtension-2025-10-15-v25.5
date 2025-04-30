page 50639 "Form Descarga"
{
    DelayedInsert = true;
    Editable = true;
    PageType = Card;
    PromotedActionCategories = 'Nuevo,Proceso,Informe,Navegar';
    RefreshOnActivate = true;
    SourceTable = "Cab. descarga";
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
                field("No. proyecto"; Rec."No. proyecto")
                {
                }
                field("Capitán"; Rec.Capitán)
                {
                    AutoFormatExpression = strCapitán;
                }
                field(Actividad; Rec.Actividad)
                {
                }
                field("Fecha de inicio de descarga"; Rec."Fecha de inicio de descarga")
                {
                }
                field("Hora inicio descarga"; Rec."Hora inicio descarga")
                {
                }
                field("Hora fin descarga"; Rec."Hora fin descarga")
                {
                }
                field("Origen del cartón"; Rec."Origen del cartón")
                {
                }
                field(Location; Rec.Location)
                {
                }
                field(Puerto; Rec.Puerto)
                {
                }
                field("Libro Diario"; Rec."Libro Diario")
                {
                    Editable = false;
                }
                field("Promedio general"; decPromedio)
                {
                }
                field("Scale code"; Rec."Scale code")
                {
                }
                group(Pallets)
                {
                    Caption = 'Pallets';
                    field("Pallets desde"; Rec."Pallets desde")
                    {
                    }
                    field("Pallets hasta"; Rec."Pallets hasta")
                    {
                        Editable = false;
                    }
                    field(intCantidadAproxPallets; intCantidadAproxPallets)
                    {
                        Caption = 'Cantidad aprox. pallets';

                        trigger OnValidate()
                        begin
                            Rec."Pallets hasta" := Rec."Pallets desde" + intCantidadAproxPallets;
                        end;
                    }
                }
                field("Cantidad x capitán"; Rec."Cantidad x capitán")
                {
                    Editable = false;
                }
                field("Cantidad x descarga"; Rec."Cantidad x descarga")
                {
                }
            }
            part(Control1000000012; "Subform. Descarga")
            {
                Editable = blnRegistrado;
                SubPageLink = "No. proyecto" = FIELD("No. proyecto");
                SubPageView = SORTING("No. proyecto", "Line no.");
            }
            group(Control1000000023)
            {
                Editable = blnRegistrado;
                ShowCaption = false;
                label(Control1000000021)
                {
                    CaptionClass = Text19057672;
                    ShowCaption = false;
                    Style = Standard;
                    StyleExpr = TRUE;
                }
                part(Control1000000016; "Subform. Matriz Capitán")
                {
                    SubPageLink = "No. proyecto" = FIELD("No. proyecto");
                }
                label(Control1000000022)
                {
                    CaptionClass = Text19046721;
                    ShowCaption = false;
                    Style = Standard;
                    StyleExpr = TRUE;
                }
                part(Control1000000020; "Subform. Matriz Descarga")
                {
                    ApplicationArea = Suite;
                    Editable = blnRegistrado;
                    Enabled = blnRegistrado;
                    UpdatePropagation = Both;
                    SubPageLink = "Filtro proyecto" = FIELD("No. proyecto");
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Registro)
            {
                Caption = '&Registro';
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
                        if Confirm('¿Desea registrar esta descarga?') then begin

                            if not cduFishing.fntRegistroDescarga(Rec, rstLinDiaProd, false, false) then
                                Message('No se ha completado el registro');

                        end;

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
                    Visible = false;

                    trigger OnAction()
                    begin
                        if Confirm('¿Desea registrar e imprimir esta descarga?') then begin

                            if not cduFishing.fntRegistroDescarga(Rec, rstLinDiaProd, false, true) then
                                Message('No se ha completado el registro');

                        end;

                    end;
                }
            }
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
                        rptInforme.fntProyecto(rec."No. proyecto");
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
                        frmDigitalizar.funLlamarCapturador('Descarga', rec."No. proyecto", '', rec."No. proyecto", '', '', '', '', '', '', '');
                        frmDigitalizar.LookupMode(true);
                        frmDigitalizar.SetTableView(rstDigitalizar);
                        if frmDigitalizar.RunModal = ACTION::LookupOK then begin

                            Clear(cduDigitalizarOAbrir);
                            frmDigitalizar.GetRecord(rstDigitalizar);
                            cduDigitalizarOAbrir.ImportarDocumento(rstDigitalizar.Documento,
                            Format(Today), rstDigitalizar.Departamento, rec."No. proyecto", UserId, rec."No. proyecto", Format(Today), '', '', '', '',
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

                            if not cduFishing.fntRegistroDescarga(Rec, rstLinDiaProd, true, false) then
                                Message('No se ha completado la reversión');

                        end;

                    end;
                }
                action("&Ficha")
                {
                    Caption = '&Ficha';
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Job Card";
                    RunPageLink = "No." = FIELD("No. proyecto");
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
                        ItemLedgEntry.SetRange(ItemLedgEntry."Lote origen", rec.Buque + rec.Marea);
                        ItemLedgEntry.SetRange("Nombre libro diario", rec."Libro Diario");
                        ItemLedgEntry.SetRange("Nombre seccion diario", rec.Puerto);
                        PAGE.Run(PAGE::"Item Ledger Entries", ItemLedgEntry);
                    end;
                }
                action("Enviar a empresa")
                {
                    Caption = 'Enviar a empresa';
                    Image = SendTo;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        rstCompany: Record Company;
                        pgeCompany: Page Companies;
                        rstDescarga: Record "Cab. descarga";
                        rstLDescarga: Record "Lín. descarga";
                        rstLDescargaCurrent: Record "Lín. descarga";
                        rstDV: Record "Dimension Value";
                        rstConfCont: Record "General Ledger Setup";
                        rstDVCurrent: Record "Dimension Value";
                        rstConfContCurrent: Record "General Ledger Setup";
                        rstSubst: Record "Item Reference";
                    begin
                        Clear(rstCompany);
                        rstCompany.SetFilter(Name, '<>%1', CompanyName);
                        Clear(pgeCompany);
                        pgeCompany.Editable(false);
                        pgeCompany.SetTableView(rstCompany);
                        pgeCompany.LookupMode(true);
                        if pgeCompany.RunModal = ACTION::LookupOK then begin

                            pgeCompany.GetRecord(rstCompany);

                            Clear(rstDescarga);
                            rstDescarga.ChangeCompany(rstCompany.Name);

                            Clear(rstConfCont);
                            rstConfCont.ChangeCompany(rstCompany.Name);
                            rstConfCont.Get();

                            Clear(rstConfContCurrent);
                            rstConfContCurrent.Get();

                            rstDescarga.TransferFields(Rec);

                            Clear(rstDV);
                            rstDV.ChangeCompany(rstCompany.Name);
                            if rstDescarga.Buque <> '' then begin

                                if rstConfContCurrent."Global Dimension 1 Code" = rstConfCont."Global Dimension 1 Code" then begin

                                    Clear(rstDVCurrent);
                                    rstDVCurrent.Get(rstConfContCurrent."Global Dimension 1 Code", rec.Buque);
                                    rstDV."Dimension Code" := rstConfCont."Global Dimension 1 Code";
                                    rstDV.Code := rec.Buque;
                                    rstDV.Name := rstDVCurrent.Name;
                                    rstDV."Global Dimension No." := 1;
                                    if not rstDV.Insert then;

                                end
                                else
                                    rstDescarga.Buque := '';

                            end;

                            Clear(rstDV);
                            rstDV.ChangeCompany(rstCompany.Name);
                            if rstDescarga.Actividad <> '' then begin

                                if rstConfContCurrent."Global Dimension 2 Code" = rstConfCont."Global Dimension 2 Code" then begin

                                    Clear(rstDVCurrent);
                                    rstDVCurrent.Get(rstConfContCurrent."Global Dimension 2 Code", rec.Actividad);
                                    rstDV."Dimension Code" := rstConfCont."Global Dimension 2 Code";
                                    rstDV.Code := rec.Actividad;
                                    rstDV.Name := rstDVCurrent.Name;
                                    rstDV."Global Dimension No." := 2;
                                    if not rstDV.Insert then;

                                end
                                else
                                    rstDescarga.Actividad := '';

                            end;

                            Clear(rstDV);
                            rstDV.ChangeCompany(rstCompany.Name);
                            if rstDescarga.Marea <> '' then begin

                                if rstConfContCurrent."Global Dimension 3 Code" = rstConfCont."Global Dimension 3 Code" then begin

                                    Clear(rstDVCurrent);
                                    rstDVCurrent.Get(rstConfContCurrent."Global Dimension 3 Code", rec.Marea);
                                    rstDV."Dimension Code" := rstConfCont."Global Dimension 3 Code";
                                    rstDV.Code := rec.Marea;
                                    rstDV.Name := rstDVCurrent.Name;
                                    rstDV."Global Dimension No." := 3;
                                    if not rstDV.Insert then;

                                end
                                else
                                    rstDescarga.Marea := '';

                            end;
                            rstDescarga.Registrado := false;
                            if not rstDescarga.Insert then
                                Error('Ya existe esta descarga en la empresa de destino.');

                            Clear(rstLDescargaCurrent);
                            rstLDescargaCurrent.SetRange("No. proyecto", rec."No. proyecto");
                            if rstLDescargaCurrent.FindSet then
                                repeat

                                    Clear(rstLDescarga);
                                    rstLDescarga.ChangeCompany(rstCompany.Name);
                                    rstLDescarga.TransferFields(rstLDescargaCurrent);

                                    Clear(rstSubst);
                                    rstSubst.SetRange(rstSubst."Item No.", rstLDescarga."Item no.");
                                    if rstSubst.FindSet then
                                        rstLDescarga."Item no." := rstSubst."Reference No.";

                                    rstLDescarga.Insert;

                                until rstLDescargaCurrent.Next = 0;

                            Message('Descarga transferida!');

                        end;
                    end;
                }
                action("Sugerir líneas de pallet")
                {
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        cduFishing: Codeunit "Descargas";
                        rstPP: Record "Cab. descarga";
                    begin
                        Clear(cduFishing);
                        Clear(rstPP);
                        rstPP.SetRange(rstPP."No. proyecto", rec."No. proyecto");
                        if rstPP.FindFirst then
                            cduFishing.fntSugerirPalletsDescarga(rstPP);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        decPromedio := 0;
        CalcFields(rec."Cantidad x descarga", rec."KN linea descarga");
        if (rec."Cantidad x descarga" <> 0) and (rec."KN linea descarga" <> 0) then
            decPromedio := Round(rec."KN linea descarga" / rec."Cantidad x descarga", 0.01);
    end;

    trigger OnInit()
    begin
        RegistroVisible := true;
    end;

    trigger OnOpenPage()
    begin
        if Rec.Registrado then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;

        if not CurrPage.Editable then
            RegistroVisible := false;
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

        RegistroVisible: Boolean;
        Text19000926: Label 'Pallets desde';
        Text19057672: Label 'Informe del Capitán';
        Text19046721: Label 'Descarga hasta el momento';
        "strCapitán": Text[30];
        cduFishing: Codeunit "Descargas";

        blnRegistrado: Boolean;

        blnNoRegistrado: Boolean;
        frmDigitalizar: Page "Ruta digitalización";
        decPromedio: Decimal;

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
}

