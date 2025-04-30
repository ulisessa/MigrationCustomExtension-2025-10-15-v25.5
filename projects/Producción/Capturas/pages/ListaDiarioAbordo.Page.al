page 50526 "Lista Diario Abordo"
{
    CardPageID = "Diario Abordo";
    Editable = false;
    PageType = List;
    SourceTable = "On board capture";
    SourceTableView = SORTING ("Fecha Salida")
                      ORDER(Descending);
    ApplicationArea = All;
    UsageCategory = Administration;


    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Cód. Proyecto"; "Cód. Proyecto")
                {
                }
                field(Buque; Buque)
                {
                }
                field(Marea; Marea)
                {
                }
                field("Patrón"; Patrón)
                {
                }
                field("Fecha Salida"; "Fecha Salida")
                {
                }
                field("Fecha Entrada"; "Fecha Entrada")
                {
                }
                field(Concepto; Concepto)
                {
                }
                field("Fecha creación"; "Fecha creación")
                {
                }
                field("Histórico"; Histórico)
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("&Imprimir")
                {
                    Caption = '&Imprimir';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";

                    trigger OnAction()
                    begin
                        //IBdos Argentina - USS - 040403 - Inicio Modificación Arbumasa
                        //Botón para imprimir

                        CurrPage.SetSelectionFilter(Rec);
                        REPORT.Run(REPORT::"Capturas diarias", true, false, Rec);
                        Reset;

                        //IBdos Argentina - USS - 040403 - Fin Modificación Arbumasa
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if FindFirst then;
    end;
}

