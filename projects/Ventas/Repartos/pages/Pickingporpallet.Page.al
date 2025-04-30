page 50645 "Picking por pallet"
{
    Editable = true;
    InsertAllowed = false;
    PageType = ListPlus;
    RefreshOnActivate = true;
    SourceTable = "Item Ledger Entry";
    SourceTableTemporary = true;
    SourceTableView = SORTING("Lot No.");

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                Editable = true;
                ShowCaption = false;
                field("Entry No."; "Entry No.")
                {
                }
                field("Item No."; "Item No.")
                {
                    Editable = false;
                }
                field(Description; Description)
                {
                    Editable = false;
                }
                field("Entry/Exit Point"; "Entry/Exit Point")
                {
                    Caption = 'Puerto';
                    Editable = false;
                }
                field("Location Code"; "Location Code")
                {
                    Editable = false;
                }
                field("Bin code"; "Bin code")
                {
                }
                field("Lot No."; "Lot No.")
                {
                    Editable = false;
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                }
                field("Global dimension 3 Code"; "Global dimension 3 Code")
                {
                }
                field("Pallet no."; "Pallet no.")
                {
                    Editable = false;
                    Enabled = false;

                    trigger OnAssistEdit()
                    begin
                        /*IF NOT Marcado THEN
                          Marcado := TRUE
                        ELSE
                          Marcado := FALSE;
                        //UpdateForm;
                        */

                    end;
                }
                field("Lote origen"; "Lote origen")
                {
                    Editable = false;
                }
                field("Remaining Quantity"; "Remaining Quantity")
                {
                    Editable = true;

                    trigger OnValidate()
                    var
                        rstProducto: Record Item;
                    begin
                        Clear(rstProducto);
                        rstProducto.Get("Item No.");
                        if rstProducto."Utiliza Tarifario" then begin

                            "Remaining gross kilos" := "Remaining Quantity" * rstProducto."Gross Weight";
                            "Remaining net kilos" := "Remaining Quantity" * rstProducto."Net Weight";

                        end;

                        Modify;
                    end;
                }
                field("Remaining net kilos"; "Remaining net kilos")
                {
                    Editable = true;

                    trigger OnValidate()
                    begin
                        Modify;
                    end;
                }
                field("Remaining gross kilos"; "Remaining gross kilos")
                {
                    Editable = true;

                    trigger OnValidate()
                    begin
                        Modify;
                    end;
                }
                field(Marcado; Marcado)
                {
                    Caption = 'Marcado';

                    trigger OnValidate()
                    begin
                        CurrPage.SetSelectionFilter(t_rst32);
                        ApplySelection(t_rst32);
                        CalcMarkedTots;
                    end;
                }
            }
            grid("Totales hasta posición")
            {
                Caption = 'Totales hasta posición';
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
            grid("Totales por remito")
            {
                Caption = 'Totales por remito';
                Editable = false;
                GridLayout = Columns;
                field(decKNrem; decKNrem)
                {
                    Caption = 'Kilos netos';
                }
                field(decKBrem; decKBrem)
                {
                    Caption = 'Kilos brutos';
                }
                field(decQrem; decQrem)
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
        area(factboxes)
        {
            part(Control1000000021; "Item Application FactBox")
            {
                SubPageLink = "Item No." = FIELD("Item No."),
                              "Document No." = FIELD("Document No."),
                              "Lote origen" = FIELD("Lote origen");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Marcar")
            {
                Caption = '&Marcar';
                Image = Approve;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                ShortCutKey = 'Ctrl+M';

                trigger OnAction()
                begin
                    CurrPage.SetSelectionFilter(t_rst32);
                    ApplySelection(t_rst32);
                    CalcMarkedTots;
                end;
            }
            action("&Desmarcar")
            {
                Caption = '&Desmarcar';
                Image = Reject;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                ShortCutKey = 'Ctrl+D';

                trigger OnAction()
                var
                    rstMR: Record "Item Ledger Entry";
                begin
                    CurrPage.SetSelectionFilter(t_rst32);
                    UnApplySelection(t_rst32);
                    CalcMarkedTots;
                end;
            }
            action("&Reservar")
            {
                Caption = '&Reservar';
                Image = Reserve;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                ShortCutKey = 'Ctrl+R';

                trigger OnAction()
                begin
                    fntReservar;
                end;
            }
            action("<Action1000000009>")
            {
                Caption = '&Calcular seleccionados';
                Image = Calculate;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                ShortCutKey = 'Ctrl+S';

                trigger OnAction()
                begin
                    CalcSelectedTots;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        rstMR: Record "Item Ledger Entry";
    begin
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        CalcMarkedTots;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        CalcMarkedTots;
    end;

    trigger OnOpenPage()
    begin
        CalcMarkedTots;
        CalcTotsReparto;
        /*IF blnSoloMarcados THEN
          SETRANGE(Marcado,TRUE);
          */
        SetCurrentKey("Lot No.");

    end;

    var
        rstMovRemito: Record "Mov. remitos";
        codRemito: Code[20];
        blnMarcado: Boolean;
        decQh: Decimal;
        decKBh: Decimal;
        decKNh: Decimal;
        decQm: Decimal;
        decKBm: Decimal;
        decKNm: Decimal;
        decKNr: Decimal;
        decKBr: Decimal;
        decQr: Decimal;
        rstLinRemito: Record "Lín. ajuste ventas";
        codBuque: Code[10];
        codMarea: Code[10];
        codLoteOrigen: Code[10];
        codItem: Code[20];
        intLinea: Integer;
        t_rst32: Record "Item Ledger Entry" temporary;
        intLinReparto: Integer;
        codReparto: Code[20];
        blnSoloMarcados: Boolean;
        codDeposito: Code[10];
        decKNrem: Decimal;
        decKBrem: Decimal;
        decQrem: Decimal;
        optSegDCL: Option " ","Post-Expo - Controlar contra DCL","No controlar contra DCL","Pre-Expo - Controlar contra DCL";
        strFormFecha: Text[30];

    [Scope('OnPrem')]
    procedure fntRemito(l_codRemito: Code[20]; l_codBuque: Code[10]; l_codMarea: Code[10]; l_codLoteOrigen: Code[10]; l_codItem: Code[20]; l_codReparto: Code[20]; l_intLinReparto: Integer; l_codDeposito: Code[10]; l_optSegDCL: Option " ","Post-Expo - Controlar contra DCL","No controlar contra DCL","Pre-Expo - Controlar contra DCL"; l_strFormFecha: Text[30])
    var
        l_rst32: Record "Item Ledger Entry";
        l_intFirst: Integer;
    begin
        codRemito := l_codRemito;
        codBuque := l_codBuque;
        codMarea := l_codMarea;
        codLoteOrigen := l_codLoteOrigen;
        codItem := l_codItem;
        codReparto := l_codReparto;
        intLinReparto := l_intLinReparto;
        codDeposito := l_codDeposito;
        optSegDCL := l_optSegDCL;
        strFormFecha := l_strFormFecha;
        Clear(l_rst32);
        l_rst32.SetCurrentKey("Lot No.");
        if codBuque <> '' then
            l_rst32.SetRange("Global Dimension 1 Code", codBuque);
        if codMarea <> '' then
            l_rst32.SetRange("Global dimension 3 Code", codMarea);
        if codLoteOrigen <> '' then
            l_rst32.SetRange("Lote origen", codLoteOrigen);
        l_rst32.SetRange("Item No.", codItem);
        if codDeposito <> '' then
            l_rst32.SetRange("Location Code", codDeposito);
        if not blnSoloMarcados then
            l_rst32.SetRange(Open, true);
        if l_rst32.FindSet then begin
            l_intFirst := l_rst32."Entry No.";
            repeat

                Init;
                "Entry No." := l_rst32."Entry No.";
                "Item No." := l_rst32."Item No.";
                Description := l_rst32.Description;
                "Remaining Quantity" := l_rst32."Remaining Quantity";
                "Remaining net kilos" := l_rst32."Remaining net kilos";
                "Remaining gross kilos" := l_rst32."Remaining gross kilos";
                "Global Dimension 1 Code" := l_rst32."Global Dimension 1 Code";
                "Global Dimension 2 Code" := l_rst32."Global Dimension 2 Code";
                "Global dimension 3 Code" := l_rst32."Global dimension 3 Code";
                "Global Dimension 4 Code" := l_rst32."Global Dimension 4 Code";
                "Global Dimension 5 Code" := l_rst32."Global Dimension 5 Code";
                "Global dimension 6 Code" := l_rst32."Global dimension 6 Code";
                "Global Dimension 7 Code" := l_rst32."Global Dimension 7 Code";
                "Dimension Set ID" := l_rst32."Dimension Set ID";
                "Job No." := l_rst32."Job No.";
                "Location Code" := l_rst32."Location Code";
                "Bin code" := l_rst32."Bin code";
                "Entry/Exit Point" := l_rst32."Entry/Exit Point";
                "Document No." := l_rst32."Document No.";
                "Lot No." := l_rst32."Lot No.";
                "Lote origen" := l_rst32."Lote origen";
                "Pallet no." := l_rst32."Pallet no.";
                "Seguimiento para trazabilidad" := optSegDCL;
                "DCL application date formula" := strFormFecha;
                Open := l_rst32.Open;
                Insert;

            until l_rst32.Next = 0;

        end;

        Clear(rstMovRemito);
        rstMovRemito.SetRange("No. documento", codRemito);
        if codBuque <> '' then
            rstMovRemito.SetRange(Buque, codBuque);
        if codMarea <> '' then
            rstMovRemito.SetRange(Marea, codMarea);
        if codLoteOrigen <> '' then
            rstMovRemito.SetRange("Lote origen", codLoteOrigen);
        if codDeposito <> '' then
            rstMovRemito.SetRange("Cód. depósito", codDeposito);
        /*
        IF optSegDCL <> optSegDCL::" " THEN
          rstMovRemito.SETRANGE("Seguimiento para trazabilidad",optSegDCL);
          */
        rstMovRemito.SetRange("No. producto", codItem);
        if rstMovRemito.FindSet then
            repeat

                if Get(rstMovRemito."No. línea") then begin

                    if rstMovRemito."Seguimiento para trazabilidad" = optSegDCL then begin

                        "Remaining Quantity" := rstMovRemito.Cantidad;
                        "Remaining net kilos" := rstMovRemito."Kilos netos";
                        "Remaining gross kilos" := rstMovRemito."Kilos brutos";
                        Marcado := true;
                        Modify;

                    end
                    else begin
                        "Remaining Quantity" -= rstMovRemito.Cantidad;
                        "Remaining net kilos" -= rstMovRemito."Kilos netos";
                        "Remaining gross kilos" -= rstMovRemito."Kilos brutos";
                        Marcado := true;
                        Modify;
                    end;
                    //DELETE;

                end;

            until rstMovRemito.Next = 0;

        if Get(l_intFirst) then;

        if blnSoloMarcados then begin

            SetRange(Marcado, false);
            DeleteAll;
            SetRange(Marcado, true);

        end;

    end;

    [Scope('OnPrem')]
    procedure CalcSelectedTots()
    var
        rstMR: Record "Item Ledger Entry";
    begin
        intLinea := "Entry No.";
        CurrPage.SetSelectionFilter(Rec);

        CalcSums("Remaining Quantity", "Remaining net kilos", "Remaining gross kilos");

        decQh := "Remaining Quantity";
        decKNh := "Remaining net kilos";
        decKBh := "Remaining gross kilos";

        Rec.FilterGroup(0);
        Rec.Reset;
        SetCurrentKey("Lot No.");

        if Get(intLinea) then;
    end;

    [Scope('OnPrem')]
    procedure CalcMarkedTots()
    var
        rstMR: Record "Item Ledger Entry";
    begin

        intLinea := "Entry No.";
        SetRange(Marcado, true);
        CalcSums("Remaining Quantity", "Remaining net kilos", "Remaining gross kilos");

        decQm := "Remaining Quantity";
        decKNm := "Remaining net kilos";
        decKBm := "Remaining gross kilos";

        FilterGroup(0);
        Reset;
        SetCurrentKey("Lot No.");

        if Get(intLinea) then;
    end;

    [Scope('OnPrem')]
    procedure CalcTotsReparto()
    var
        rstLAV: Record "Lín. ajuste ventas";
    begin
        Clear(rstLAV);
        rstLAV.SetRange("No. documento", codRemito);
        rstLAV.SetRange("Lote origen", codLoteOrigen);
        rstLAV.SetRange("No. producto", "Item No.");
        rstLAV.CalcSums("Cantidad a reservar", "Kilos brutos a reservar", "Kilos netos a reservar");

        decQr += rstLAV."Cantidad a reservar";
        decKNr += rstLAV."Kilos netos a reservar";
        decKBr += rstLAV."Kilos brutos a reservar";
    end;

    local procedure ApplySelection(var l_rst32: Record "Item Ledger Entry" temporary)
    var
        l_intLinea: Integer;
        t_rstILE: Record "Item Ledger Entry" temporary;
    begin
        intLinea := "Entry No.";
        CurrPage.SetSelectionFilter(Rec);

        ModifyAll(Marcado, true);

        Rec.FilterGroup(0);
        Rec.Reset;

        SetCurrentKey("Lot No.");

        if Get(intLinea) then;
    end;

    local procedure UnApplySelection(var l_rst32: Record "Item Ledger Entry" temporary)
    var
        l_intLinea: Integer;
        t_rstILE: Record "Item Ledger Entry" temporary;
    begin
        intLinea := "Entry No.";
        CurrPage.SetSelectionFilter(Rec);

        ModifyAll(Marcado, false);

        Rec.FilterGroup(0);
        Rec.Reset;

        SetCurrentKey("Lot No.");

        if Get(intLinea) then;
    end;

    local procedure fntReservar()
    begin
        Clear(rstMovRemito);
        rstMovRemito.SetRange("No. documento", codRemito);
        rstMovRemito.SetRange("No. producto", "Item No.");
        if codBuque <> '' then
            rstMovRemito.SetRange(Buque, "Global Dimension 1 Code");
        if codMarea <> '' then
            rstMovRemito.SetRange(Marea, "Global dimension 3 Code");
        rstMovRemito.SetRange("Seguimiento para trazabilidad", optSegDCL);
        rstMovRemito.DeleteAll;

        Clear(rstMovRemito);

        if FindFirst then
            repeat

                if Marcado then begin

                    //intLinea += 10000;
                    rstMovRemito."No. documento" := codRemito;
                    rstMovRemito."No. línea" := "Entry No.";//intLinea;
                    rstMovRemito."No. producto" := "Item No.";
                    rstMovRemito.Lote := "Lot No.";
                    rstMovRemito.Cantidad := "Remaining Quantity";
                    rstMovRemito."Kilos brutos" := "Remaining gross kilos";
                    rstMovRemito."Kilos netos" := "Remaining net kilos";
                    rstMovRemito."Lote origen" := "Lote origen";
                    rstMovRemito.Buque := "Global Dimension 1 Code";
                    rstMovRemito.Marea := "Global dimension 3 Code";
                    rstMovRemito."Puerto/Aeropuerto" := "Entry/Exit Point";
                    rstMovRemito."Cód. depósito" := "Location Code";
                    rstMovRemito."Cód. caja" := "Bin code";
                    rstMovRemito."No. pallet" := "Pallet no.";
                    rstMovRemito."No. reparto" := codReparto;
                    rstMovRemito."Linea reparto" := intLinReparto;
                    rstMovRemito."Seguimiento para trazabilidad" := optSegDCL;
                    rstMovRemito."DCL application date formula" := strFormFecha;
                    rstMovRemito.Insert;

                end;

            until Next = 0;

        CurrPage.Close;
    end;

    [Scope('OnPrem')]
    procedure fntShowMarkedOnly()
    begin
        blnSoloMarcados := true;
    end;
}

