page 50646 "Movs. remitos"
{
    DeleteAllowed = true;
    Editable = true;
    InsertAllowed = false;
    PageType = ListPlus;
    SourceTable = "Mov. remitos";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("No. documento"; "No. documento")
                {
                    Editable = false;
                }
                field("No. línea"; "No. línea")
                {
                    Editable = false;
                }
                field("No. producto"; "No. producto")
                {
                    Editable = false;
                }
                field(Lote; Lote)
                {
                    Editable = false;
                }
                field(Cantidad; Cantidad)
                {

                    trigger OnValidate()
                    var
                        rstProducto: Record Item;
                    begin
                        Clear(rstProducto);
                        rstProducto.Get("No. producto");
                        if rstProducto."Utiliza Tarifario" then begin

                            "Kilos brutos" := Cantidad * rstProducto."Gross Weight";
                            "Kilos netos" := Cantidad * rstProducto."Net Weight";

                        end;
                    end;
                }
                field("Kilos brutos"; "Kilos brutos")
                {
                }
                field("Kilos netos"; "Kilos netos")
                {
                }
                field("Seguimiento para trazabilidad"; "Seguimiento para trazabilidad")
                {
                }
                field("Cód. depósito"; "Cód. depósito")
                {
                }
                field("Lote origen"; "Lote origen")
                {
                    Editable = false;
                }
            }
            grid("Totales seleccionados")
            {
                Caption = 'Totales seleccionados';
                Editable = false;
                GridLayout = Columns;
                field(decKNh; decKNh)
                {
                    Caption = 'Kilos netos';
                }
                field(decKBh; decKBh)
                {
                    Caption = 'Kilos brutos';
                }
                field(decQh; decQh)
                {
                    Caption = 'Cantidad';
                }
            }
            grid("Totales marcados")
            {
                Caption = 'Totales marcados';
                Editable = false;
                GridLayout = Columns;
                field(decKNm; decKNm)
                {
                    Caption = 'Kilos netos';
                }
                field(decKBm; decKBm)
                {
                    Caption = 'Kilos brutos';
                }
                field(decQm; decQm)
                {
                    Caption = 'Cantidad';
                }
            }
            grid("Totales por reparto")
            {
                Caption = 'Totales por reparto';
                Editable = false;
                GridLayout = Columns;
                field(decKNr; decKNr)
                {
                    Caption = 'Kilos netos';
                }
                field(decKBr; decKBr)
                {
                    Caption = 'Kilos brutos';
                }
                field(decQr; decQr)
                {
                    Caption = 'Cantidad';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        decQh := 0;
        decKNh := 0;
        decKBh := 0;

        SetSelection(rstILE);
        rstILE.CalcSums(rstILE.Cantidad, rstILE."Kilos netos", rstILE."Kilos brutos");

        decQh += rstILE.Cantidad;
        decKNh += rstILE."Kilos netos";
        decKBh += rstILE."Kilos brutos";
        CalcMarkedTots;
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        CalcMarkedTots
    end;

    trigger OnModifyRecord(): Boolean
    begin
        CalcMarkedTots
    end;

    trigger OnOpenPage()
    begin
        CalcMarkedTots;
        CalcTotsReparto;
    end;

    var
        decKN: Decimal;
        decKB: Decimal;
        decQ: Decimal;
        rstMR: Record "Mov. remitos";
        decQh: Decimal;
        decKBh: Decimal;
        decKNh: Decimal;
        decQm: Decimal;
        decKBm: Decimal;
        decKNm: Decimal;
        decKNr: Decimal;
        decKBr: Decimal;
        decQr: Decimal;
        codRemito: Code[20];
        codBuque: Code[10];
        codMarea: Code[10];
        rstILE: Record "Mov. remitos";
        codLoteOrigen: Code[10];
        codProducto: Code[20];

    [Scope('OnPrem')]
    procedure fntRemito(l_codRemito: Code[20]; l_codBuque: Code[10]; l_codMarea: Code[10]; l_codLoteOrigen: Code[10]; l_codProducto: Code[20])
    begin
        codRemito := l_codRemito;
        codBuque := l_codBuque;
        codMarea := l_codMarea;
        codLoteOrigen := l_codLoteOrigen;
        codProducto := l_codProducto;
    end;

    [Scope('OnPrem')]
    procedure CalcSelectedTots()
    var
        rstMR: Record "Item Ledger Entry";
    begin
        decQh := 0;
        decKNh := 0;
        decKBh := 0;

        Clear(rstMR);
        rstMR.CopyFilters(Rec);
        rstMR.SetRange(Marcado);
        if rstMR.FindSet then
            repeat

                decQh += rstMR."Remaining Quantity";
                decKNh += rstMR."Remaining net kilos";
                decKBh += rstMR."Remaining gross kilos";

            until (rstMR.Next = 0);
    end;

    [Scope('OnPrem')]
    procedure CalcMarkedTots()
    var
        l_rstMR: Record "Mov. remitos";
    begin
        decQm := 0;
        decKNm := 0;
        decKBm := 0;

        Clear(rstMR);
        rstMR.CopyFilters(Rec);
        rstMR.CalcSums(Cantidad, "Kilos netos", "Kilos brutos");

        decQm := rstMR.Cantidad;
        decKNm := rstMR."Kilos netos";
        decKBm := rstMR."Kilos brutos";
    end;

    [Scope('OnPrem')]
    procedure SetSelection(var l_rstILE: Record "Mov. remitos")
    begin
        CurrPage.SetSelectionFilter(l_rstILE);
    end;

    [Scope('OnPrem')]
    procedure CalcTotsReparto()
    var
        rstLAV: Record "Lín. ajuste ventas";
    begin
        decQr := 0;
        decKNr := 0;
        decKBr := 0;

        Clear(rstLAV);
        rstLAV.SetRange("No. documento", codRemito);
        rstLAV.SetRange("Lote origen", codLoteOrigen);
        rstLAV.SetRange("No. producto", codProducto);

        if rstLAV.FindSet then
            repeat

                decQr += rstLAV."Cantidad a reservar";
                decKNr += rstLAV."Kilos netos a reservar";
                decKBr += rstLAV."Kilos brutos a reservar";

            until (rstLAV.Next = 0);
    end;
}

