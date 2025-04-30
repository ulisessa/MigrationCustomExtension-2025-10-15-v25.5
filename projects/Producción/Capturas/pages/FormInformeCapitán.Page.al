page 50637 "Form Informe Capitán"
{
    Editable = true;
    PageType = Card;
    SourceTable = "Cab. informe capitán";
    SourceTableView = SORTING("Fecha de inicio de descarga")
                      ORDER(Descending);
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
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
                field(Cantidad; Cantidad)
                {
                    Editable = false;
                }
            }
            part(Control1000000012; "Subform. Informe Capitán")
            {
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
                action(Anular)
                {
                    Caption = 'Anular';

                    trigger OnAction()
                    begin
                        Registrado := false;
                        Modify;
                    end;
                }
                action("Traer diario abordo")
                {
                    Caption = 'Traer diario abordo';
                    Image = GetLines;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        fntCrearDesdeDiarioabordo;
                    end;
                }
            }
            group(Registro)
            {
                Caption = '&Registro';
                Visible = RegistroVisible;
                action(Registrar)
                {
                    Caption = 'Registrar';
                    Image = Post;
                    Promoted = true;
                    PromotedIsBig = true;
                    ShortCutKey = 'F11';

                    trigger OnAction()
                    begin
                        if Confirm('¿Desea registrar este informe?') then begin

                            Registrado := true;
                            Modify;
                            Message('Informe registrado con éxito');

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

                    trigger OnAction()
                    begin
                        if Confirm('¿Desea registrar e imprimir este informe?') then begin

                            Clear(rptInforme);
                            Clear(rstCabecera);
                            rstCabecera.Get("No. proyecto");
                            rstCabecera.SetRecFilter;
                            rptInforme.SetTableView(rstCabecera);
                            rptInforme.UseRequestPage := false;
                            rptInforme.RunModal;

                            Registrado := true;
                            Modify;
                            Message('Informe registrado con éxito');


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
                    rstDigitalizar.SetRange(Documento, 'Capitan');
                    rstDigitalizar.SetRange(Departamento, rstConfusu.Grupo);
                    frmDigitalizar.funLlamarCapturador('Capitan', "No. proyecto", '', "No. proyecto", '', '', '', '', '', '', '');
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
    end;

    trigger OnInit()
    begin
        AccionesVisible := true;
        RegistroVisible := true;
    end;

    var
        rptInforme: Report "Informe Capitán";
        rstCabecera: Record "Cab. informe capitán";
        cduDigitalizarOAbrir: Codeunit Escaneado;
        rstDigitalizar: Record "Ruta digitalizacion depto/espe";
        rstConfusu: Record "User Setup";

        RegistroVisible: Boolean;

        AccionesVisible: Boolean;
        Text19053462: Label 'Descarga';
        frmDigitalizar: Page "Ruta digitalización";

    [Scope('OnPrem')]
    procedure fntCrearDesdeDiarioabordo()
    var
        rstLDescarga: Record "On board capture lines";
        rstLDCL: Record "Lín. informe capitán";
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
        rstLDescarga.SetRange("Cód. proyecto", "No. proyecto");
        if rstLDescarga.FindSet then
            repeat

                Clear(rstLDCL);
                rstLDCL.SetRange(rstLDCL."No. proyecto", rstLDescarga."Cód. proyecto");
                rstLDCL.SetRange(Clasificación, rstLDescarga."No.");
                if rstLDCL.FindFirst then begin

                    rstLDCL.Cantidad += rstLDescarga.Cantidad;
                    rstLDCL.Modify;

                end
                else begin

                    i += 10000;
                    rstLDCL."No. proyecto" := rstLDescarga."Cód. proyecto";
                    rstLDCL."No. línea" := i;
                    rstLDCL.Clasificación := rstLDescarga."No.";
                    rstLDCL.Descripción := rstLDescarga.Descripción;
                    rstLDCL."Unidad medida" := rstLDescarga."Ud. Medida";
                    rstLDCL.Cantidad := rstLDescarga.Cantidad;
                    rstLDCL.Actividad := rstLDescarga.Actividad;
                    rstLDCL.Insert;

                end;

            until rstLDescarga.Next = 0;

        if i <> 0 then begin

            Message('Se han copiado los movimientos de la Descarga.');
            exit;

        end;
    end;
}

