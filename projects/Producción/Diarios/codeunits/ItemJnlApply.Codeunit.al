codeunit 50517 "Item Jnl.-Apply"
{
    TableNo = "Item Journal Line";

    trigger OnRun()
    var
        Text0001: Label 'No se puede aplicar un documento interno en un pago. Este mensaje aparece porque el documento %1 es una %2.';
        cdu90: Codeunit "Purch.-Post";
        rst122: Record "Purch. Inv. Header";
        Text0002: Label 'El tipo de movimiento del diario debe ser "Ajuste negativo" o "Transferencia" para realizar la aplicaci n.';
    begin
        if not (AccType in [ItemJnlLine."Entry Type"::"Negative Adjmt.", ItemJnlLine."Entry Type"::Transfer]) then
            Error(Text0002);

        ItemLedgEntry.SetCurrentKey("Item No.", Open, Positive);
        if AccNo <> '' then
            ItemLedgEntry.SetRange("Item No.", AccNo);
        ItemLedgEntry.SetRange(Open, true);
        if LocCode <> '' then
            ItemLedgEntry.SetRange("Location Code", LocCode);
        ItemLedgEntry.SetRange(Positive, true);
        ApplyItemEntries.SetRecord(ItemLedgEntry);
        ApplyItemEntries.SetTableView(ItemLedgEntry);
        ApplyItemEntries.LookupMode(true);
        ApplyItemEntries.SetLibro(codLibro, codSeccion);
        OK := ApplyItemEntries.RunModal = ACTION::LookupOK;
        //CLEAR(ApplyItemEntries);
        if not OK then
            exit
        else
            ApplyItemEntries.SetSelection(ItemLedgEntry);
        if not ItemLedgEntry.IsEmpty then
            fntGenerarDiarioProducto(ItemLedgEntry);
    end;

    var
        Text000: Label 'You must specify %1 or %2.';
        Text001: Label 'The %1 in the %2 will be changed from %3 to %4.\';
        Text002: Label 'Do you wish to continue?';
        Text003: Label 'The update has been interrupted to respect the warning.';
        Text005: Label 'The %1 or %2 must be Customer or Vendor.';
        Text006: Label 'All entries in one application must be in the same currency.';
        Text007: Label 'All entries in one application must be in the same currency or one or more of the EMU currencies. ';
        ItemJnlLine: Record "Item Journal Line";
        InventorySetup: Record "Inventory Setup";
        ItemLedgEntry: Record "Item Ledger Entry";
        ApplyItemEntries: Page "Item Ledger Entries";
        AccNo: Code[20];
        AccType: Enum "Item Ledger Document Type";
        LocCode: Code[10];
        OK: Boolean;
        codLibro: Code[10];
        codSeccion: Code[10];
        rstMensajeria: Record Mensajeria;
        codDoc: Code[20];
        datFecha: Date;
        LodDestCode: Code[10];

    [Scope('OnPrem')]
    procedure SetJournal(l_codLibro: Code[10]; l_codSeccion: Code[10]; l_codDoc: Code[20]; l_AccNo: Code[20]; l_AccType: Enum "Item Ledger Document Type"; l_LocCode: Code[10]; l_LocDestCode: Code[10]; l_datFecha: Date)
    begin
        //++Migraci n Arbumasa 2009
        codLibro := l_codLibro;
        codSeccion := l_codSeccion;
        AccNo := l_AccNo;
        AccType := l_AccType;
        LocCode := l_LocCode;
        LodDestCode := l_LocDestCode;
        codDoc := l_codDoc;
        datFecha := l_datFecha;
        //--Migraci n Arbumasa 2009
    end;

    [Scope('OnPrem')]
    procedure fntGenerarDiarioProducto(var rst32: Record "Item Ledger Entry")
    var
        rst83: Record "Item Journal Line";
        rstIS: Record "Inventory Setup";
        i: Integer;
        dlgV: Dialog;
        pge393: Page "Item Reclass. Journal";
        pge40: Page "Item Journal";
        rstVE: Record "Value Entry";
        j: Integer;
    begin
        Clear(rstIS);
        rstIS.Get();
        j := 0;
        Clear(rst83);
        rst83.SetRange("Journal Batch Name", codSeccion);
        rst83.SetRange("Journal Template Name", codLibro);
        if not rst83.IsEmpty then
            if Confirm('El libro ' + codLibro + ', secci n ' + codSeccion + ', tiene l neas pendientes. Si decide seguir adelante, las l neas se a adir n luego de las pendientes.  Desea proseguir?') then begin
                rst83.FindLast;
                i := rst83."Line No.";
            end
            else
                Error('Se ha detenido el proceso.');

        Clear(dlgV);
        dlgV.Open('Enviando movimiento #1## de #2##');

        dlgV.Update(2, rst32.Count);
        Clear(rst83);
        if rst32.FindSet then
            repeat

                i += 10000;
                j += 1;
                dlgV.Update(1, j);

                Clear(rst83);
                rst83."Journal Template Name" := codLibro;
                rst83."Journal Batch Name" := codSeccion;
                rst83."Line No." := i;
                rst83.Validate("Item No.", rst32."Item No.");
                rst83."Posting Date" := datFecha;
                rst83."Entry Type" := AccType;
                rst83."Source No." := rst32."Source No.";
                rst83."Document Line No." := rst32."Document Line No.";
                rst83."Document No." := codDoc;
                rst83.Description := rst32.Description;
                rst83."Location Code" := rst32."Location Code";
                rst83."Bin Code" := rst32."Bin code";
                rst83.Validate(Quantity, rst32."Remaining Quantity");
                rst83."Qty. per Unit of Measure" := rst32."Qty. per Unit of Measure";
                rst83.Validate("Unit of Measure Code", rst32."Unit of Measure Code");
                rst83.Validate("Gross kilos", rst32."Remaining gross kilos");
                rst83.Validate("Net kilos", rst32."Remaining net kilos");
                rst83.Validate("Job No.", rst32."Job No.");
                rst83.Validate("Job Task No.", rst32."Job Task No.");
                rst83.Validate("Shortcut Dimension 1 Code", rst32."Global Dimension 1 Code");
                rst83.Validate("Shortcut Dimension 2 Code", rst32."Global Dimension 2 Code");
                rst83.Validate("Shortcut Dimension 3 Code", rst32."Global dimension 3 Code");
                rst83.Validate("Shortcut Dimension 4 Code", rst32."Global Dimension 4 Code");
                rst83.Validate("Shortcut Dimension 5 Code", rst32."Global Dimension 5 Code");
                rst83.Validate("Shortcut Dimension 6 Code", rst32."Global dimension 6 Code");
                rst83.Validate("Shortcut Dimension 7 Code", rst32."Global Dimension 7 Code");
                if AccType = AccType::"Direct Transfer" then
                    rst83.Validate("New Location Code", LodDestCode);
                rst83."Source Type" := rst32."Source Type";
                rst83."Country/Region Code" := rst32."Country/Region Code";
                rst83."Entry/Exit Point" := rst32."Entry/Exit Point";
                rst83."Document Date" := rst32."Document Date";
                rst83."External Document No." := rst32."External Document No.";
                rst83.Area := rst32.Area;
                rst83.Validate("Lot No.", rst32."Lot No.");
                //rst83."Shipment Method Code" := rst32."Shipment Method Code";
                rst83.Validate("No. Pallet", rst32."Pallet no.");
                rst83."Lote origen" := rst32."Lote origen";
                rst83.Insert;

            until rst32.Next = 0;

        dlgV.Close;
    end;
}

