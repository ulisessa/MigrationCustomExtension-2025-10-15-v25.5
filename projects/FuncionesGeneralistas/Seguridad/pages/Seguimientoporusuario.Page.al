page 50537 "Seguimiento por usuario"
{
    Editable = false;
    PageType = List;
    SourceTable = "Seguimiento Documentos";
    SourceTableView = SORTING("Line No.")
                      ORDER(Ascending);
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Tipo Documento"; "Tipo Documento")
                {
                }
                field("No. documento"; "No. documento")
                {
                }
                field(Fecha; Fecha)
                {
                }
                field(Hora; Hora)
                {
                }
                field("Global Dimension 2"; "Global Dimension 2")
                {
                }
                field(Estado; Estado)
                {
                }
                field("Estado actual"; "Estado actual")
                {
                }
                field("En ese estado desde"; "En ese estado desde")
                {
                }
                field(Usuario; Usuario)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Editar)
            {
                Caption = 'E&ditar';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if UserId in ['ULISES.SASOVSKY', 'ulises.sasovsky'] then
                        CurrPage.Editable(true);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        /*SETFILTER("No. documento",'<>%1','');
        SETRANGE(Usuario,USERID);
        
        SETFILTER(Fecha,'>=%1',CALCDATE('-30D',TODAY));
         */

    end;

}

