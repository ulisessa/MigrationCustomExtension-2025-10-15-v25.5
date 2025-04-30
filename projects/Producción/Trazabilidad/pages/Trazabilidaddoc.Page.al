page 50608 "Trazabilidad+doc"
{
    PageType = StandardDialog;
    SourceTable = "Item Ledger Entry";
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            field("Fecha inicial"; datFechaDesde)
            {

                trigger OnValidate()
                begin
                    FillTempTable;
                    //EXIT(FIND(Which));
                end;
            }
            field("Filtro lote origen"; strLote)
            {

                trigger OnValidate()
                begin
                    FillTempTable;
                    //EXIT(FIND(Which));
                end;
            }
            repeater(Control1000000008)
            {
                IndentationColumn = "Applies-to Entry";
                ShowAsTree = true;
                ShowCaption = false;
                field("Lote origen"; "Lote origen")
                {
                    StyleExpr = strStyle;
                }
                field("Entry Type"; "Entry Type")
                {
                }
                field(Family; Family)
                {
                }
                field(Subfamily; Subfamily)
                {
                }
                field("Nombre libro diario"; "Nombre libro diario")
                {
                }
                field("Item No."; "Item No.")
                {
                }
                field("Document No."; "Document No.")
                {
                    DrillDown = true;
                }
                field(Quantity; Quantity)
                {
                    StyleExpr = strStyle;

                    trigger OnDrillDown()
                    var
                        rst32Real: Record "Item Ledger Entry";
                        pgeILE: Page "Item Ledger Entries";
                    begin
                        Clear(rst32);
                        Clear(pgeILE);

                        if "Item No." <> '' then
                            rst32Real.SetRange("Item No.", "Item No.");

                        if "Lote origen" <> '' then
                            rst32Real.SetRange("Lote origen", "Lote origen");

                        if "Nombre libro diario" <> '' then
                            rst32Real.SetRange("Nombre libro diario", "Nombre libro diario");

                        if Format("Entry Type") <> '' then
                            rst32Real.SetRange("Entry Type", "Entry Type");

                        if "Document No." <> '' then
                            rst32Real.SetRange("Document No.", "Document No.");

                        if Family <> '' then
                            rst32Real.SetRange(Family, Family);

                        if Subfamily <> '' then
                            rst32Real.SetRange(Subfamily, Subfamily);

                        pgeILE.SetTableView(rst32Real);
                        pgeILE.Run;
                    end;
                }
                field("Net kilos"; "Net kilos")
                {
                    StyleExpr = strStyle;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        strStyle := '';
        rst32.Reset;
        if "Applies-to Entry" = 0 then begin

            strStyle := 'Strong';
            rst32.SetRange("Lote origen", "Lote origen");
            rst32.CalcSums(Quantity, "Net kilos");
            Quantity := rst32.Quantity;
            "Net kilos" := rst32."Net kilos";
            Modify;

        end;

        if "Applies-to Entry" = 1 then begin

            rst32.SetRange("Lote origen", "Lote origen");
            rst32.SetRange("Entry Type", "Entry Type");
            rst32.CalcSums(Quantity, "Net kilos");
            Quantity := rst32.Quantity;
            "Net kilos" := rst32."Net kilos";
            Modify;

        end;

        if "Applies-to Entry" = 2 then begin

            rst32.SetRange("Lote origen", "Lote origen");
            rst32.SetRange("Entry Type", "Entry Type");
            rst32.SetRange(Family, Family);
            rst32.CalcSums(Quantity, "Net kilos");
            Quantity := rst32.Quantity;
            "Net kilos" := rst32."Net kilos";
            Modify;

        end;

        if "Applies-to Entry" = 3 then begin

            rst32.SetRange("Lote origen", "Lote origen");
            rst32.SetRange(Family, Family);
            rst32.SetRange("Entry Type", "Entry Type");
            rst32.SetRange(Subfamily, Subfamily);
            rst32.CalcSums(Quantity, "Net kilos");
            Quantity := rst32.Quantity;
            "Net kilos" := rst32."Net kilos";
            Modify;

        end;
        /*
        IF "Applies-to Entry" = 4 THEN
          BEGIN
        
            rst32.SETRANGE("Lote origen","Lote origen");
            rst32.SETRANGE(Family,Family);
            rst32.SETRANGE("Entry Type","Entry Type");
            rst32.SETRANGE(Subfamily,Subfamily);
            rst32.SETRANGE("Document No.","Document No.");
            rst32.CALCSUMS(Quantity,"Net kilos");
            Quantity := rst32.Quantity;
            "Net kilos" := rst32."Net kilos";
            MODIFY;
        
          END;
        */

    end;

    trigger OnOpenPage()
    begin
        if (datFechaDesde <> 0D) or (strLote <> '') then
            FillTempTable;
    end;

    var
        qryTraz: Query Trazabilidad;
        datFechaDesde: Date;
        Lote: Integer;
        rst32: Record "Item Ledger Entry" temporary;
        strStyle: Text;
        strLote: Code[9];

    local procedure FillTempTable()
    var
        LotNos: Query "Trazabilidad+doc";
        i: Integer;
        xLote: Code[10];
        xFam: Code[10];
        xSubfam: Code[10];
        xEntryType: Text[100];
    begin
        if datFechaDesde <> 0D then
            LotNos.SetFilter(Posting_Date, '>=%1', datFechaDesde);
        if strLote <> '' then
            LotNos.SetRange(Lote_origen, strLote);

        LotNos.Open;

        DeleteAll;

        while LotNos.Read do begin
            if LotNos.Lote_origen <> xLote then begin

                Init;
                xLote := LotNos.Lote_origen;
                xFam := '';
                xSubfam := '';
                xEntryType := '';
                i += 1;
                "Applies-to Entry" := 0;
                "Entry No." := i;
                "Lote origen" := LotNos.Lote_origen;
                Insert;
                rst32.TransferFields(Rec);
                rst32.Insert;

                Init;

                xEntryType := Format(LotNos.Entry_Type);
                i += 1;
                "Applies-to Entry" := 1;
                "Entry Type" := LotNos.Entry_Type;
                "Entry No." := i;
                "Lote origen" := LotNos.Lote_origen;
                Insert;
                rst32.TransferFields(Rec);
                rst32.Insert;

                Init;
                xFam := LotNos.Family;
                xSubfam := '';
                i += 1;
                "Applies-to Entry" := 2;
                "Entry No." := i;
                "Lote origen" := LotNos.Lote_origen;
                "Entry Type" := LotNos.Entry_Type;
                Family := LotNos.Family;
                Insert;
                rst32.TransferFields(Rec);
                rst32.Insert;

                Init;
                xSubfam := LotNos.Subfamily;
                i += 1;
                "Applies-to Entry" := 3;
                "Entry No." := i;
                "Lote origen" := LotNos.Lote_origen;
                "Entry Type" := LotNos.Entry_Type;
                Family := LotNos.Family;
                Subfamily := LotNos.Subfamily;
                Insert;
                rst32.TransferFields(Rec);
                rst32.Insert;

                Init;
                i += 1;
                "Applies-to Entry" := 4;
                "Entry No." := i;
                "Item No." := LotNos.Item_No;
                "Lote origen" := LotNos.Lote_origen;
                Quantity := LotNos.Sum_Quantity;
                "Entry Type" := LotNos.Entry_Type;
                "Net kilos" := LotNos.Sum_Net_kilos;
                "Nombre libro diario" := LotNos.Nombre_libro_diario;
                "Document No." := LotNos.Document_No;
                Family := LotNos.Family;
                Subfamily := LotNos.Subfamily;
                Insert;
                rst32.TransferFields(Rec);
                rst32.Insert;

            end
            else begin

                if Format(LotNos.Entry_Type) <> xEntryType then begin

                    Init;
                    xEntryType := Format(LotNos.Entry_Type);
                    i += 1;
                    "Applies-to Entry" := 1;
                    "Entry Type" := LotNos.Entry_Type;
                    "Entry No." := i;
                    "Lote origen" := LotNos.Lote_origen;
                    Insert;
                    rst32.TransferFields(Rec);
                    rst32.Insert;

                    Init;
                    xFam := LotNos.Family;
                    i += 1;
                    "Applies-to Entry" := 2;
                    "Entry Type" := LotNos.Entry_Type;
                    "Entry No." := i;
                    "Lote origen" := LotNos.Lote_origen;
                    Family := LotNos.Family;
                    Insert;
                    rst32.TransferFields(Rec);
                    rst32.Insert;

                    Init;
                    i += 1;
                    xSubfam := LotNos.Subfamily;
                    "Applies-to Entry" := 3;
                    "Entry No." := i;
                    "Entry Type" := LotNos.Entry_Type;
                    "Lote origen" := LotNos.Lote_origen;
                    Family := LotNos.Family;
                    Subfamily := LotNos.Subfamily;
                    Insert;
                    rst32.TransferFields(Rec);
                    rst32.Insert;

                    Init;
                    i += 1;
                    "Applies-to Entry" := 4;
                    "Entry No." := i;
                    "Item No." := LotNos.Item_No;
                    "Lote origen" := LotNos.Lote_origen;
                    "Entry Type" := LotNos.Entry_Type;
                    Quantity := LotNos.Sum_Quantity;
                    "Net kilos" := LotNos.Sum_Net_kilos;
                    "Nombre libro diario" := LotNos.Nombre_libro_diario;
                    Family := LotNos.Family;
                    "Document No." := LotNos.Document_No;
                    Subfamily := LotNos.Subfamily;
                    Insert;
                    rst32.TransferFields(Rec);
                    rst32.Insert;

                end
                else begin

                    if LotNos.Family <> xFam then begin

                        Init;
                        xFam := LotNos.Family;
                        xSubfam := '';
                        i += 1;
                        "Applies-to Entry" := 2;
                        "Entry Type" := LotNos.Entry_Type;
                        "Entry No." := i;
                        "Lote origen" := LotNos.Lote_origen;
                        Family := LotNos.Family;
                        Insert;
                        rst32.TransferFields(Rec);
                        rst32.Insert;

                        Init;
                        i += 1;
                        xSubfam := LotNos.Subfamily;
                        "Applies-to Entry" := 3;
                        "Entry No." := i;
                        "Entry Type" := LotNos.Entry_Type;
                        "Lote origen" := LotNos.Lote_origen;
                        Family := LotNos.Family;
                        Subfamily := LotNos.Subfamily;
                        Insert;
                        rst32.TransferFields(Rec);
                        rst32.Insert;

                        Init;
                        i += 1;
                        "Applies-to Entry" := 4;
                        "Entry No." := i;
                        "Item No." := LotNos.Item_No;
                        "Lote origen" := LotNos.Lote_origen;
                        "Entry Type" := LotNos.Entry_Type;
                        Quantity := LotNos.Sum_Quantity;
                        "Net kilos" := LotNos.Sum_Net_kilos;
                        "Nombre libro diario" := LotNos.Nombre_libro_diario;
                        Family := LotNos.Family;
                        Subfamily := LotNos.Subfamily;
                        "Document No." := LotNos.Document_No;
                        Insert;
                        rst32.TransferFields(Rec);
                        rst32.Insert;

                    end
                    else begin

                        if LotNos.Subfamily <> xSubfam then begin

                            Init;
                            xSubfam := LotNos.Subfamily;
                            i += 1;
                            "Applies-to Entry" := 3;
                            "Entry No." := i;
                            "Lote origen" := LotNos.Lote_origen;
                            "Entry Type" := LotNos.Entry_Type;
                            Family := LotNos.Family;
                            Subfamily := LotNos.Subfamily;
                            Insert;
                            rst32.TransferFields(Rec);
                            rst32.Insert;

                            Init;
                            i += 1;
                            "Applies-to Entry" := 4;
                            "Entry No." := i;
                            "Item No." := LotNos.Item_No;
                            "Lote origen" := LotNos.Lote_origen;
                            "Entry Type" := LotNos.Entry_Type;
                            Quantity := LotNos.Sum_Quantity;
                            "Net kilos" := LotNos.Sum_Net_kilos;
                            "Nombre libro diario" := LotNos.Nombre_libro_diario;
                            "Document No." := LotNos.Document_No;
                            Family := LotNos.Family;
                            Subfamily := LotNos.Subfamily;
                            Insert;
                            rst32.TransferFields(Rec);
                            rst32.Insert;

                        end
                        else begin

                            Init;
                            i += 1;
                            "Applies-to Entry" := 4;
                            "Entry No." := i;
                            "Item No." := LotNos.Item_No;
                            "Lote origen" := LotNos.Lote_origen;
                            "Entry Type" := LotNos.Entry_Type;
                            Quantity := LotNos.Sum_Quantity;
                            "Net kilos" := LotNos.Sum_Net_kilos;
                            "Nombre libro diario" := LotNos.Nombre_libro_diario;
                            "Document No." := LotNos.Document_No;
                            Family := LotNos.Family;
                            Subfamily := LotNos.Subfamily;
                            Insert;
                            rst32.TransferFields(Rec);
                            rst32.Insert;

                        end;
                    end;
                end;
            end;
        end;
    end;

    [Scope('OnPrem')]
    procedure SetFilters(l_strFecha: Date; l_strLote: Code[9])
    begin
        datFechaDesde := l_strFecha;
        strLote := l_strLote;
    end;
}

