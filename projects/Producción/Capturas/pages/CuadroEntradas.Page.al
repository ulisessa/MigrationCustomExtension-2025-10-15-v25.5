page 50009 "Cuadro Entradas"
{
    // IBdos Argentina - USS - 040603 - Adición Arbumasa

    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    PageType = ListPlus;
    SourceTable = "Cuadro entradas";
    SourceTableView = SORTING("En puerto", Entrada);

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                Editable = false;
                ShowCaption = false;
                field(Buque; Buque)
                {
                    Editable = false;
                }
                field(Marea; Marea)
                {
                }
                field(Salidas; Salidas)
                {
                    Editable = false;
                }
                field(Entrada; Entrada)
                {
                }
                field("Confirmación de entrada"; "Confirmación de entrada")
                {
                }
                field("Kilos capturados"; "Kilos capturados")
                {
                }
                field(Destino; Destino)
                {
                }
            }
            field(intDias; intDias)
            {
                Caption = 'Captura en días';

                trigger OnValidate()
                begin
                    SetFilter("Filtro fecha", '%1..%2', Today - intDias, Today);
                end;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Imprimir &diario abordo")
            {
                Caption = 'Imprimir &diario abordo';
                Promoted = true;
                PromotedCategory = Process;
            }
        }
    }

    trigger OnOpenPage()
    begin
        fntGenerarCuadro;
        intDias := 30;
    end;

    var
        VarDia: Integer;
        VarDiaSemana: Code[30];
        rstProyecto: Record Job;
        rstBuque: Record "Country/Region Translation";
        rstTempCuadro: Record "Cuadro entradas";
        intDias: Integer;

    [Scope('OnPrem')]
    procedure fntGenerarCuadro()
    var
        VarDia: Integer;
        VarDiaSemana: Code[30];
        rstProyecto: Record Job;
        rstBuque: Record "Dimension value";
        rstTempCuadro: Record "Cuadro entradas";
    begin
        Clear(rstBuque);
        Clear(rstTempCuadro);
        rstTempCuadro.DeleteAll;

        rstBuque.SetRange(rstBuque."Use code", rstBuque."Use code"::Buque);
        rstBuque.SetFilter(Estado, '<>%1', '');
        if rstBuque.Find('-') then
            repeat

                Clear(rstProyecto);
                rstProyecto.SetRange("Global Dimension 1 Code", rstBuque.Code);
                rstProyecto.SetRange(Tipo, rstProyecto.Tipo::Productivo);
                rstProyecto.SetRange(Status, rstProyecto.Status::Open);
                rstProyecto.SetRange(Blocked, rstProyecto.Blocked::" ");
                rstProyecto.SetCurrentKey("Starting Date");
                if rstProyecto.Find('+') then begin

                    rstTempCuadro.Buque := rstBuque.Romanos;
                    Evaluate(rstTempCuadro.Marea, rstProyecto."Global Dimension 3 Code");
                    rstTempCuadro.Salidas := rstProyecto."Starting Date";
                    rstTempCuadro."Días de marea" := rstProyecto."Dias de mar previstos";
                    rstTempCuadro.Entrada := rstProyecto."Fecha llegada prevista";
                    if rstProyecto."Fecha llegada prevista" <> 0D then
                        rstTempCuadro.Día := Date2DMY(rstProyecto."Fecha llegada prevista", 1);
                    rstTempCuadro."Día semana" := rstProyecto."Fecha llegada prevista";
                    rstTempCuadro."Salida prevista" := rstProyecto."Salida Prevista Marea pos";
                    rstTempCuadro.Destino := rstProyecto."Puerto Descarga";
                    rstTempCuadro."Confirmación de entrada" := rstProyecto."Confirmación entrada";
                    rstTempCuadro.Estado := rstBuque.Estado;
                    if rstProyecto."Ending Date" <> 0D then
                        rstTempCuadro."En puerto" := true
                    else begin
                        if rstProyecto."Starting Date" = 0D then
                            rstTempCuadro."En puerto" := true
                        else begin

                            if rstProyecto."Starting Date" > Today then
                                rstTempCuadro."En puerto" := true
                            else
                                rstTempCuadro."En puerto" := false;

                        end;

                    end;

                    rstTempCuadro.Proyecto := rstProyecto."No.";
                    rstTempCuadro.Insert;

                    if rstTempCuadro.Estado <> 'Navegación' then begin

                        rstTempCuadro.Día := 0;
                        rstTempCuadro.Salidas := 0D;
                        rstTempCuadro."Días de marea" := 0;
                        rstTempCuadro."Día semana" := 0D;
                        rstTempCuadro."Confirmación de entrada" := 0;
                        Evaluate(rstTempCuadro.Marea, '');
                        rstTempCuadro.Modify;

                    end;

                end;

            until rstBuque.Next = 0;
    end;
}

