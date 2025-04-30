page 50661 "Cuadro Entradas Resumido"
{
    // IBdos Argentina - USS - 040603 - Adición Arbumasa

    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = CardPart;
    SourceTable = "Cuadro entradas";
    SourceTableView = SORTING("En puerto", Salidas);

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
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
                    Editable = true;
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
            }
        }
    }

    trigger OnOpenPage()
    begin
        fntGenerarCuadro;
        intDias := 30;
        CurrPage.Editable(true);
    end;

    var
        VarDia: Integer;
        VarDiaSemana: Code[30];
        rstProyecto: Record Job;
        rstBuque: Record "Dimension Value";
        rstTempCuadro: Record "Cuadro entradas";
        intDias: Integer;

    [Scope('OnPrem')]
    procedure fntGenerarCuadro()
    var
        VarDia: Integer;
        VarDiaSemana: Code[30];
        rstProyecto: Record Job;
        rstBuque: Record "Dimension Value";
        rstTempCuadro: Record "Cuadro entradas";
        rstGLSetup: Record "General Ledger Setup";
    begin
        Clear(rstBuque);
        Clear(rstTempCuadro);
        rstTempCuadro.DeleteAll;

        Clear(rstGLSetup);
        rstGLSetup.Get();
        rstBuque.SetRange("Dimension Code", rstGLSetup."Shortcut Dimension 1 Code");
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

                    rstTempCuadro.Buque := CopyStr(rstBuque.Name, StrLen('Buque Arbumasa '), 20);
                    if StrPos('Buque Arbumasa ', rstBuque.Name) = 0 then
                        rstTempCuadro.Buque := rstBuque.Code;
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

