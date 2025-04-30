page 50662 "Cab. DCL"
{
    Editable = true;
    PageType = Card;
    SourceTable = "Cab. DCL";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = NOT registrado;
                field("No. proyecto"; Rec."No. proyecto")
                {
                }
                field("Fecha de inicio de descarga"; "Fecha de inicio de descarga")
                {
                }
                field("Fecha y hora zarpada"; "Fecha y hora zarpada")
                {
                }
                field("Fecha y hora desembarque"; "Fecha y hora desembarque")
                {
                }
                field("No. DCL"; "No. DCL")
                {
                    Editable = false;
                }
                field(Cantidad; Cantidad)
                {
                    Editable = false;
                }
                field("KN aplicados"; "KN aplicados")
                {
                }
                field("Promedio general"; decPromedio)
                {
                }
                field("Totales DCL"; "Totales DCL")
                {
                }
            }
            part(Control1000000012; "Lin. DCL")
            {
                Editable = NOT Registrado;
                SubPageLink = "No. proyecto" = FIELD("No. proyecto");
            }
            part(Control1000000016; "Subform. Matriz Descargado")
            {
                Editable = false;
                SubPageLink = "Global Dimension 1 Filter" = FIELD(Buque),
                              "Global Dimension 3 filter" = FIELD(Marea);
            }
            label(Control1000000020)
            {
                CaptionClass = Text19053462;
                ShowCaption = false;
                Style = Standard;
                StyleExpr = TRUE;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Acciones)
            {
                Caption = 'A&cciones';
                Visible = AccionesVisible;
                action(Numerar)
                {
                    Image = NumberSetup;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = NOT Registrado;

                    trigger OnAction()
                    var
                        rstIS: Record "Inventory Setup";
                        GestNoSerie: Codeunit "No. Series";
                        rstDV: Record "Dimension Value";
                        rstGLS: Record "General Ledger Setup";
                    begin
                        if "No. DCL" <> '' then
                            Error('El DCL ya tiene numeración asignada.');
                        Clear(rstIS);
                        rstIS.Get;

                        rstIS.TestField("DCL Series");

                        Clear(rstGLS);
                        rstGLS.Get();

                        Clear(rstDV);
                        rstDV.Get(rstGLS."Global Dimension 1 Code", Buque);
                        if rstDV."Use code" = rstDV."Use code"::Buque then
                            "No. DCL" := GestNoSerie.GetNextNo(rstIS."DCL Series", Today, true);
                    end;
                }
                action(Anular)
                {
                    Caption = 'Anular';
                    Image = UnApply;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = Registrado;

                    trigger OnAction()
                    begin
                        Registrado := false;
                        Clear(rstLDCL);
                        rstLDCL.SetRange(rstLDCL."No. proyecto", "No. proyecto");
                        if not rstLDCL.IsEmpty then
                            rstLDCL.ModifyAll(Registrado, false);
                        Modify;
                    end;
                }
                action("Traer descarga")
                {
                    Caption = 'Traer descarga';
                    Image = GetLines;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        fntCrearDesdeDescarga;
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
                        rstDCL: Record "Cab. DCL";
                        rstLDCL: Record "Lín. DCL";
                        rstLDCLCurrent: Record "Lín. DCL";
                        rstDV: Record "Dimension Value";
                        rstConfCont: Record "General Ledger Setup";
                        rstDVCurrent: Record "Dimension Value";
                        rstConfContCurrent: Record "General Ledger Setup";
                        rstItem: Record Item;
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

                            Clear(rstDCL);
                            rstDCL.ChangeCompany(rstCompany.Name);

                            Clear(rstConfCont);
                            rstConfCont.ChangeCompany(rstCompany.Name);
                            rstConfCont.Get();

                            Clear(rstConfContCurrent);
                            rstConfContCurrent.Get();

                            rstDCL.TransferFields(Rec);

                            Clear(rstDV);
                            rstDV.ChangeCompany(rstCompany.Name);
                            if rstDCL.Buque <> '' then begin

                                if rstConfContCurrent."Global Dimension 1 Code" = rstConfCont."Global Dimension 1 Code" then begin

                                    Clear(rstDVCurrent);
                                    rstDVCurrent.Get(rstConfContCurrent."Global Dimension 1 Code", Buque);
                                    rstDV."Dimension Code" := rstConfCont."Global Dimension 1 Code";
                                    rstDV.Code := Buque;
                                    rstDV.Name := rstDVCurrent.Name;
                                    rstDV."Global Dimension No." := 1;
                                    if not rstDV.Insert then;

                                end
                                else
                                    rstDCL.Buque := '';

                            end;

                            Clear(rstDV);
                            rstDV.ChangeCompany(rstCompany.Name);
                            if rstDCL.Actividad <> '' then begin

                                if rstConfContCurrent."Global Dimension 2 Code" = rstConfCont."Global Dimension 2 Code" then begin

                                    Clear(rstDVCurrent);
                                    rstDVCurrent.Get(rstConfContCurrent."Global Dimension 2 Code", Actividad);
                                    rstDV."Dimension Code" := rstConfCont."Global Dimension 2 Code";
                                    rstDV.Code := Actividad;
                                    rstDV.Name := rstDVCurrent.Name;
                                    rstDV."Global Dimension No." := 2;
                                    if not rstDV.Insert then;

                                end
                                else
                                    rstDCL.Actividad := '';

                            end;

                            Clear(rstDV);
                            rstDV.ChangeCompany(rstCompany.Name);
                            if rstDCL.Marea <> '' then begin

                                if rstConfContCurrent."Global Dimension 3 Code" = rstConfCont."Global Dimension 3 Code" then begin

                                    Clear(rstDVCurrent);
                                    rstDVCurrent.Get(rstConfContCurrent."Global Dimension 3 Code", Marea);
                                    rstDV."Dimension Code" := rstConfCont."Global Dimension 3 Code";
                                    rstDV.Code := Marea;
                                    rstDV.Name := rstDVCurrent.Name;
                                    rstDV."Global Dimension No." := 3;
                                    if not rstDV.Insert then;

                                end
                                else
                                    rstDCL.Marea := '';

                            end;
                            rstDCL.Registrado := false;
                            if not rstDCL.Insert then
                                Error('Ya existe este DCL en la empresa de destino.');

                            Clear(rstLDCLCurrent);
                            rstLDCLCurrent.SetRange("No. proyecto", "No. proyecto");
                            if rstLDCLCurrent.FindSet then
                                repeat

                                    Clear(rstLDCL);
                                    rstLDCL.ChangeCompany(rstCompany.Name);
                                    rstLDCL.TransferFields(rstLDCLCurrent);

                                    Clear(rstSubst);
                                    rstSubst.SetRange(rstSubst."Item No.", rstLDCL.Clasificación);
                                    if not rstSubst.FindFirst then
                                        Error('Debe crear una relación entre el producto ' + rstLDCLCurrent.Descripción + ' de esta empresa y la empresa de destino. Para eso, utilice una Referencia Cruzada.');
                                    rstLDCL.Clasificación := rstSubst."Reference No.";

                                    rstLDCL.Registrado := false;
                                    rstLDCL.Insert;

                                until rstLDCLCurrent.Next = 0;

                            Message('DCL transferido!');

                        end;
                    end;
                }
            }
            group(Registro)
            {
                Caption = '&Registro';
                Visible = NOT Registrado;
                action(Registrar)
                {
                    Caption = 'Registrar';
                    Image = Post;
                    Promoted = true;
                    PromotedIsBig = true;
                    ShortCutKey = 'F11';
                    Visible = NOT Registrado;

                    trigger OnAction()
                    begin
                        if Confirm('¿Desea registrar este DCL?') then begin

                            Registrado := true;

                            Clear(rstLDCL);
                            rstLDCL.SetRange(rstLDCL."No. proyecto", "No. proyecto");
                            if not rstLDCL.IsEmpty then
                                rstLDCL.ModifyAll(Registrado, true);
                            Modify;
                            Message('DCL registrado con éxito');

                        end;
                    end;
                }
                action("Registrar & Imprimir")
                {
                    Caption = 'Registrar & Imprimir';
                    Image = PostPrint;
                    Promoted = true;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+F11';
                    Visible = NOT Registrado;

                    trigger OnAction()
                    begin
                        if Confirm('¿Desea registrar e imprimir este DCL?') then begin

                            Clear(rptInforme);
                            Clear(rstCabecera);
                            rstCabecera.Get("No. proyecto");
                            rstCabecera.SetRecFilter;
                            rptInforme.SetTableView(rstCabecera);
                            rptInforme.UseRequestPage := false;
                            rptInforme.RunModal;

                            Registrado := true;
                            Clear(rstLDCL);
                            rstLDCL.SetRange(rstLDCL."No. proyecto", "No. proyecto");
                            if not rstLDCL.IsEmpty then
                                rstLDCL.ModifyAll(Registrado, true);
                            Modify;
                            Message('DCL registrado con éxito');


                        end;
                    end;
                }
            }
        }
        area(processing)
        {
            action("&Navegar")
            {
                Caption = '&Navegar';
                Image = Navigate;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;

                trigger OnAction()
                begin
                    Navegar;
                end;
            }
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
                    Clear(rstConfusu);
                    rstConfusu.Get(UserId);
                    rstDigitalizar.SetRange(Documento, 'DCL');
                    rstDigitalizar.SetRange(Departamento, rstConfusu.Grupo);
                    frmDigitalizar.funLlamarCapturador('DCL', "No. proyecto", '', "No. proyecto", '', '', '', '', '', '', '');
                    frmDigitalizar.LookupMode(true);
                    frmDigitalizar.SetTableView(rstDigitalizar);
                    if frmDigitalizar.RunModal = ACTION::LookupOK then begin

                        frmDigitalizar.GetRecord(rstDigitalizar);
                        cduDigitalizarOAbrir.ImportarDocumento(rstDigitalizar.Documento,
                        Format(Today), rstDigitalizar.Departamento, "No. proyecto", UserId, "No. proyecto", Format(Today), '', '', '', '',
                        rstDigitalizar, false, false, true, '', false, false);

                    end;
                end;
            }
            action("&Imprimir")
            {
                Caption = '&Imprimir';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Clear(rptInforme);
                    Clear(rstCabecera);
                    rstCabecera.Get("No. proyecto");
                    rstCabecera.SetRecFilter;
                    rptInforme.SetTableView(rstCabecera);
                    rptInforme.RunModal;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if Registrado then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;

        if not CurrPage.Editable then begin

            RegistroVisible := false;
            AccionesVisible := true;

        end
        else begin

            RegistroVisible := true;
            AccionesVisible := false;

        end;

        decPromedio := 0;
        Clear(rstLDCL);
        rstLDCL.SetRange("No. proyecto", "No. proyecto");
        rstLDCL.CalcSums(Cantidad, "Kilos netos");
        if (rstLDCL.Cantidad <> 0) and (rstLDCL."Kilos netos" <> 0) then
            decPromedio := Round(rstLDCL."Kilos netos" / rstLDCL.Cantidad, 0.01);
    end;

    trigger OnInit()
    begin
        AccionesVisible := true;
        RegistroVisible := true;
    end;

    var
        rptInforme: Report DCL;
        rstCabecera: Record "Cab. DCL";
        cduDigitalizarOAbrir: Codeunit Escaneado;
        rstDigitalizar: Record "Ruta digitalizacion depto/espe";
        rstConfusu: Record "User Setup";

        RegistroVisible: Boolean;

        AccionesVisible: Boolean;
        Text19053462: Label 'Descarga';
        frmDigitalizar: Page "Ruta digitalización";
        rstLDCL: Record "Lín. DCL";
        rstCompany: Record Company;
        decPromedio: Decimal;

    [Scope('OnPrem')]
    procedure fntCrearDesdeDescarga()
    var
        rstLDescarga: Record "Lín. descarga";
        rstLDCL: Record "Lín. DCL";
        i: Integer;
    begin
        TestField("No. proyecto");
        Clear(rstLDCL);
        rstLDCL.SetRange(rstLDCL."No. proyecto", "No. proyecto");
        if rstLDCL.FindSet then
            if not Confirm('Este proceso eliminará las líneas existentes en el DCL ' + "No. proyecto" + '. ¿Desea continuar?') then
                Error('Se ha detenido la copia de la Descarga.')
            else
                rstLDCL.DeleteAll;

        i := 0;

        Clear(rstLDescarga);
        rstLDescarga.SetRange(rstLDescarga."No. proyecto", "No. proyecto");
        if rstLDescarga.FindSet then
            repeat

                Clear(rstLDCL);
                rstLDCL.SetRange(rstLDCL."No. proyecto", rstLDescarga."No. proyecto");
                rstLDCL.SetRange(Clasificación, rstLDescarga."Item no.");
                if rstLDCL.FindFirst then begin

                    rstLDCL.Cantidad += rstLDescarga.Cantidad;
                    rstLDCL."Kilos netos" += rstLDescarga."Net weight";
                    rstLDCL.Modify;

                end
                else begin

                    i += 10000;
                    rstLDCL."No. proyecto" := rstLDescarga."No. proyecto";
                    rstLDCL."No. línea" := i;
                    rstLDCL.Clasificación := rstLDescarga."Item no.";
                    rstLDCL.Descripción := rstLDescarga.Description;
                    rstLDCL."Unidad medida" := rstLDescarga."Unidad medida";
                    rstLDCL.Cantidad := rstLDescarga.Cantidad;
                    rstLDCL."Kilos netos" := rstLDescarga."Net weight";
                    rstLDCL.Promedio := Round(rstLDCL."Kilos netos" / rstLDCL.Cantidad, 0.01);
                    rstLDCL.Actividad := rstLDescarga.Actividad;
                    rstLDCL.Familia := rstLDescarga.Familia;
                    rstLDCL.Subfamilia := rstLDescarga.Subfamilia;
                    rstLDCL.Insert;

                end;

            until rstLDescarga.Next = 0;

        if i <> 0 then begin

            Message('Se han copiado los movimientos de la Descarga.');
            exit;

        end;

        Clear(rstCompany);
        rstCompany.SetFilter(rstCompany.Name, '<>%1', CompanyName);
        if rstCompany.FindSet then
            repeat

                Clear(rstLDescarga);
                rstLDescarga.ChangeCompany(rstCompany.Name);
                rstLDescarga.SetRange(rstLDescarga."No. proyecto", "No. proyecto");
                rstLDescarga.SetFilter(Cantidad, '<>0');
                if rstLDescarga.FindSet then
                    repeat

                        Clear(rstLDCL);
                        rstLDCL.SetRange(rstLDCL."No. proyecto", rstLDescarga."No. proyecto");
                        rstLDCL.SetRange(Clasificación, rstLDescarga."Item no.");
                        if rstLDCL.FindFirst then begin

                            rstLDCL.Cantidad += rstLDescarga.Cantidad;
                            rstLDCL."Kilos netos" += rstLDescarga."Net weight";
                            rstLDCL.Modify;

                        end
                        else begin

                            i += 10000;
                            rstLDCL."No. proyecto" := rstLDescarga."No. proyecto";
                            rstLDCL."No. línea" := i;
                            rstLDCL.Clasificación := rstLDescarga."Item no.";
                            rstLDCL.Descripción := rstLDescarga.Description;
                            rstLDCL."Unidad medida" := rstLDescarga."Unidad medida";
                            rstLDCL.Cantidad := rstLDescarga.Cantidad;
                            rstLDCL."Kilos netos" := rstLDescarga."Net weight";
                            rstLDCL.Promedio := Round(rstLDCL."Kilos netos" / rstLDCL.Cantidad, 0.01);
                            rstLDCL.Actividad := rstLDescarga.Actividad;
                            rstLDCL.Familia := rstLDescarga.Familia;
                            rstLDCL.Subfamilia := rstLDescarga.Subfamilia;
                            rstLDCL.Insert;

                        end;

                    until rstLDescarga.Next = 0;

            until rstCompany.Next = 0;

        if i <> 0 then begin

            Message('Se han copiado los movimientos de la Descarga.');
            exit;

        end;
    end;
}

