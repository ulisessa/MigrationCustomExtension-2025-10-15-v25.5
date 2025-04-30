page 50665 "Lista DCL"
{
    CardPageID = "Cab. DCL";
    Editable = false;
    PageType = List;
    SourceTable = "Cab. DCL";
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
                field("No. DCL"; "No. DCL")
                {
                }
                field("No. proyecto"; "No. proyecto")
                {
                }
                field(Actividad; Actividad)
                {
                }
                field("Fecha y hora zarpada"; "Fecha y hora zarpada")
                {
                }
                field("Fecha y hora desembarque"; "Fecha y hora desembarque")
                {
                }
                field("Fecha de inicio de descarga"; "Fecha de inicio de descarga")
                {
                }
                field(Buque; Buque)
                {
                }
                field(Marea; Marea)
                {
                }
                field(Cantidad; Cantidad)
                {
                }
                field("KN aplicados"; "KN aplicados")
                {
                }
                field("Totales DCL"; "Totales DCL")
                {
                }
                field("PT obtenido"; "PT obtenido")
                {
                }
                field("Rendimiento producción"; l_decRe)
                {
                }
                field("Promedio general"; "Promedio general")
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
                var
                    frmDigitalizar: Page "Ruta digitalización";
                    rstLDCL: Record "Lín. DCL";
                    rstDigitalizar: Record "Ruta digitalizacion depto/espe";
                    rstConfusu: Record "User Setup";
                    cduDigitalizarOAbrir: Codeunit Escaneado;
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
                var
                    rptInforme: Report DCL;
                    rstCabecera: Record "Cab. DCL";
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
        l_decRe := 0;
        if ("PT obtenido" <> 0) and ("Totales DCL" <> 0) then
            l_decRe := Round("PT obtenido" / "Totales DCL" * 100, 0.01);
    end;

    var
        l_decRe: Decimal;
}

