page 50557 "Cuadro producción"
{
    // IBdos Argentina - USS - 040603 - Adición Arbumasa

    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = CardPart;
    SourceTable = "Cuadro entradas";
    SourceTableView = SORTING("En puerto", Entrada);

    layout
    {
        area(content)
        {
            repeater("Capturas mareas activas")
            {
                field(Buque; Buque)
                {
                    Caption = 'Buque';
                }
                field(Marea; Marea)
                {
                    Editable = false;
                }
                field(Salidas; Salidas)
                {
                    Editable = false;
                }
                field("Días de marea"; "Días de marea")
                {
                    Editable = false;
                }
                field(Entrada; Entrada)
                {
                }
                field("Kilos capturados"; "Kilos capturados")
                {
                    Caption = 'Kilos';
                }
                field(Destino; Destino)
                {
                }
                field(Estado; Estado)
                {
                }
                field("En puerto"; "En puerto")
                {
                    Caption = 'Puerto';
                    Editable = false;
                }
                field("Confirmación de entrada"; "Confirmación de entrada")
                {
                    Caption = 'Conf.';
                }
            }
            repeater("Descargas por buque a hoy")
            {
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    Caption = 'Buque';
                }
                field("Kilos descargados x buque"; "Kilos descargados x buque")
                {
                }
            }
            group("Descargas por actividad a hoy")
            {
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                }
                field("Kilos descargados x actividad"; "Kilos descargados x actividad")
                {
                }
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
        SetRange("Filtro fecha", CalcDate('<-CY>', WorkDate), WorkDate);
    end;

    var
        VarDia: Integer;
        VarDiaSemana: Code[30];
        rstProyecto: Record Job;
        rstBuque: Record "Dimension Value";
        rstTempCuadro: Record "Cuadro entradas";

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
                rstProyecto.SetFilter(Status, '%1|%2', rstProyecto.Status::Open, rstProyecto.Status::Completed);
                rstProyecto.SetRange(Blocked, rstProyecto.Blocked::" ");
                rstProyecto.SetFilter("Starting Date", '<%1', Today);
                rstProyecto.SetCurrentKey("Starting Date");
                if rstProyecto.Find('+') then begin

                    rstTempCuadro.Buque := rstBuque.Name;
                    //rstTempCuadro."Buque/Departamento" := DELSTR(rstBuque.Name,1,15);
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
                    rstTempCuadro."Global Dimension 1 Code" := rstProyecto."Global Dimension 1 Code";
                    rstTempCuadro."Global Dimension 2 Code" := rstProyecto."Global Dimension 2 Code";
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

                    if rstTempCuadro.Estado in ['Puerto', 'Dique', 'Amarrado'] then begin

                        rstTempCuadro.Día := 0;
                        rstTempCuadro.Salidas := 0D;
                        rstTempCuadro."Días de marea" := 0;
                        rstTempCuadro."Día semana" := 0D;
                        rstTempCuadro."Confirmación de entrada" := 0;
                        rstTempCuadro.Marea := '';
                        rstTempCuadro.Modify;

                    end;

                end;

            until rstBuque.Next = 0;
    end;
}

