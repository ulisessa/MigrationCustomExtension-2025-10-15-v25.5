codeunit 50041 GestionExistencias
{
    trigger OnRun()
    begin

    end;

    [Scope('OnPrem')]
    procedure fntCalcKilosRatio(codNroProducto: Code[30]; decQty: Decimal; decQtyxUOM: Decimal; decKilos: Decimal): Decimal
    var
        rstInvtSetup: Record "Inventory Setup";
        rstGLSetup: Record "General Ledger Setup";
    begin
        Clear(rstInvtSetup);
        rstInvtSetup.Get();
        if decQty = 0 then
            exit(0);
        exit(Round(decKilos / (decQty * decQtyxUOM), rstInvtSetup."Ratios rounding precision"));
    end;

    [Scope('OnPrem')]
    procedure fntCalcKilosFromRatio(codNroProducto: Code[30]; decQty: Decimal; decQtyxUOM: Decimal; decRatio: Decimal): Decimal
    var
        rstInvtSetup: Record "Inventory Setup";
        rstGLSetup: Record "General Ledger Setup";
    begin
        Clear(rstInvtSetup);
        rstInvtSetup.Get();
        if decQty = 0 then
            exit(0);
        exit(Round(decQty * decRatio, rstInvtSetup."Ratios rounding precision"));
    end;

    [Scope('OnPrem')]
    procedure FunCalcPesoNeto(VarCantidad: Decimal; VarProducto: Code[20]; VarQ: Decimal): Decimal
    var
        PunProducto: Record Item;
    begin
        PunProducto.Reset;
        PunProducto.Get(VarProducto);
        if VarCantidad = 0 then
            exit(0);
        exit(VarCantidad * PunProducto."Net Weight" * VarQ);
    end;

    [Scope('OnPrem')]
    procedure FunCalcPesoBruto(VarCantidad: Decimal; VarProducto: Code[20]; VarQ: Decimal): Decimal
    var
        PunProducto: Record Item;
    begin
        PunProducto.Reset;
        PunProducto.Get(VarProducto);
        if VarCantidad = 0 then
            exit(0);
        exit(VarCantidad * PunProducto."Gross Weight" * VarQ);
    end;


    procedure fntRevertirILE(rstILE: Record "Item Ledger Entry"; blnRegistrar: Boolean)
    var
        Producto: Record Item;
        LinDiaProd: Record "Item Journal Line";
        rstJobTask: Record "Job Task";
        ItemCheckAvail: Codeunit "Item-Check Avail.";
        RegLinDiaProd: Codeunit "Item Jnl.-Post Line";
        rstILE2: Record "Item Ledger Entry";
        intLin: Integer;
    begin
        if Producto.Get(rstILE."Item No.") then;
        //Producto.TESTFIELD("Tipo producto",Producto."Tipo producto"::Consumo);

        intLin := 0;
        Clear(LinDiaProd);
        LinDiaProd.SetRange("Journal Template Name", rstILE."Nombre libro diario");
        LinDiaProd.SetRange("Journal Batch Name", rstILE."Nombre seccion diario");
        if LinDiaProd.FindLast then
            intLin := LinDiaProd."Line No.";

        LinDiaProd.Init;
        LinDiaProd."Line No." := intLin + 10000;
        LinDiaProd."Posting Date" := rstILE."Posting Date";
        LinDiaProd."Document No." := rstILE."Document No.";
        LinDiaProd."Journal Template Name" := rstILE."Nombre libro diario";
        LinDiaProd."Journal Batch Name" := rstILE."Nombre seccion diario";
        LinDiaProd.Validate("Item No.", rstILE."Item No.");
        LinDiaProd.Validate(Description, rstILE.Description);
        LinDiaProd.Validate("Entry Type", LinDiaProd."Entry Type"::"Positive Adjmt.");
        LinDiaProd.Validate("Location Code", rstILE."Location Code");
        LinDiaProd.Validate("Job No.", rstILE."Job No.");
        LinDiaProd.Validate(Quantity, -rstILE.Quantity);
        LinDiaProd.Validate("Net kilos", -rstILE."Net kilos");
        LinDiaProd.Validate("Gross kilos", -rstILE."Gross kilos");
        //LinDiaProd.VALIDATE("Unit of Measure Code",rstILE."Unit of Measure Code");
        LinDiaProd.Validate("Qty. per Unit of Measure", 1);
        LinDiaProd.Validate("No. Pallet", rstILE."Pallet no.");
        LinDiaProd."Document Line No." := rstILE."Document Line No.";
        Clear(rstJobTask);
        rstJobTask.SetRange(rstJobTask."Job No.", rstILE."Job No.");
        rstJobTask.SetRange("Job Task Type", rstJobTask."Job Task Type"::Posting);
        if rstJobTask.FindFirst then
            LinDiaProd."Job Task No." := rstJobTask."Job Task No.";
        if rstILE."Global Dimension 1 Code" <> '' then
            LinDiaProd.Validate("Shortcut Dimension 1 Code", rstILE."Global Dimension 1 Code");
        if rstILE."Global Dimension 2 Code" <> '' then
            LinDiaProd.Validate("Shortcut Dimension 2 Code", rstILE."Global Dimension 2 Code");
        if rstILE."Global dimension 3 Code" <> '' then
            LinDiaProd.Validate("Shortcut Dimension 3 Code", rstILE."Global dimension 3 Code");
        if rstILE."Global Dimension 4 Code" <> '' then
            LinDiaProd.Validate("Shortcut Dimension 4 Code", rstILE."Global Dimension 4 Code");
        if rstILE."Global Dimension 5 Code" <> '' then
            LinDiaProd.Validate("Shortcut Dimension 5 Code", rstILE."Global Dimension 5 Code");
        if rstILE."Global dimension 6 Code" <> '' then
            LinDiaProd.Validate("Shortcut Dimension 6 Code", rstILE."Global dimension 6 Code");
        if rstILE."Global Dimension 7 Code" <> '' then
            LinDiaProd.Validate("Shortcut Dimension 7 Code", rstILE."Global Dimension 7 Code");
        LinDiaProd.Validate(Revertido, true);
        LinDiaProd."Lot No." := rstILE."Lot No.";
        if (rstILE.Positive) then
            //LinDiaProd.VALIDATE(LinDiaProd."Applies-to Entry",rstILE."Entry No.");
            LinDiaProd."Applies-to Entry" := rstILE."Entry No.";

        LinDiaProd."Entry/Exit Point" := rstILE."Entry/Exit Point";
        LinDiaProd."Lote origen" := rstILE."Lote origen";

        if ItemCheckAvail.ItemJnlCheckLine(LinDiaProd) then
            Error('Se ha detenido el registro para respetar el aviso');
        LinDiaProd.Insert;
        if blnRegistrar then
            RegLinDiaProd.Run(LinDiaProd);
        Clear(rstILE2);
        rstILE2.Get(rstILE."Entry No.");
        rstILE2.Revertido := true;
        rstILE2.Modify;
    end;

    [Scope('OnPrem')]
    procedure fntRegistrarReversionILE(LinDiaProd: Record "Item Journal Line")
    var
        RegLinDiaProd: Codeunit "Item Jnl.-Post Batch";
    begin
        RegLinDiaProd.Run(LinDiaProd);
    end;

    procedure fntDeshacerAplicacionMovProducto(codItem: Code[20]; intILEntryNo: Integer)
    var
        Item: Record Item;
        TempUnapplyItem: Record Item temporary;
        Application: Record "Item Application Entry";
        Apply: Codeunit "Item Jnl.-Post Line";
        AppliedRec: Record "Item Ledger Entry";
        Applyrec: Record "Item Ledger Entry";
    begin
        with TempUnapplyItem do
            if not Get(codItem) then begin
                Init;
                "No." := codItem;
                Insert;
            end;

        Clear(Application);
        Application.SetCurrentKey("Inbound Item Entry No.", "Outbound Item Entry No.");
        Application.SetRange("Outbound Item Entry No.", intILEntryNo);
        if Application.Find('-') then
            repeat
                Apply.UnApply(Application);
            until Application.Next = 0;
    end;

    procedure fntHacerNuevaAplicacionMovProducto(rstILE: Record "Item Ledger Entry"; intILE: Integer)
    var
        rstILE2: Record "Item Ledger Entry";
        Apply: Codeunit "Item Jnl.-Post Line";
        TempUnapplyItem: Record Item temporary;
        Application: Record "Item Application Entry";
        Item: Record Item;
    begin
        Clear(rstILE2);
        if rstILE2.Get(intILE) then begin

            intILE := rstILE."Entry No.";
            Apply.ReApply(rstILE2, rstILE."Entry No.");
            Clear(Application);

        end;

        with TempUnapplyItem do begin
            if FindSet then
                repeat
                    Item.Get("No.");
                    if Item."Application Wksh. User ID" = UpperCase(UserId) then begin
                        Item."Application Wksh. User ID" := '';
                        Item.Modify;
                    end;
                until Next = 0;

            DeleteAll;
        end;
        Apply.RedoApplications;
        Apply.CostAdjust;

        with TempUnapplyItem do begin
            if FindSet then
                repeat
                    Item.Get(rstILE."Item No.");
                    if Item."Application Wksh. User ID" = UpperCase(UserId) then begin
                        Item."Application Wksh. User ID" := '';
                        Item.Modify;
                    end;
                until Next = 0;
            DeleteAll;
        end;
    end;

    [Scope('OnPrem')]
    procedure fntRevertirRegistroProducto(rstIR: Record "Item Register")
    var
        rst83: Record "Item Journal Line";
        rstIS: Record "Inventory Setup";
        rst32: Record "Item Ledger Entry";
    begin
        if rstIR.FindSet then
            repeat

                rstIR.TestField("Nombre libro diario");
                rstIR.TestField(rstIR."Journal Batch Name");

            until rstIR.Next = 0;

        Clear(rst32);
        rst32.SetRange("Entry No.", rstIR."From Entry No.", rstIR."To Entry No.");
        if rst32.FindSet then
            repeat

                fntRevertirDiarioProducto(rst32);

            until rst32.Next = 0;
    end;

    [Scope('OnPrem')]
    procedure fntRevertirDiarioProducto(var rst32: Record "Item Ledger Entry")
    var
        rst83: Record "Item Journal Line";
        rstIS: Record "Inventory Setup";
        i: Integer;
        dlgV: Dialog;
        pge393: Page "Item Reclass. Journal";
        pge40: Page "Item Journal";
        rstVE: Record "Value Entry";
        rstSeguridadUsuario: Record "Seguridad por usuario";
        rstSeguridad: Record Seguridad;
    begin
        Clear(rstIS);
        rstIS.Get();

        if (not (rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Anular n/c de compra")))) then begin
            if rst32.FindSet then
                repeat
                    rst32.TestField("Nombre libro diario");
                    rst32.TestField("Nombre seccion diario");
                until rst32.Next = 0;
        end;

        Clear(rst83);
        rst83.SetRange("Journal Batch Name", rst32."Nombre seccion diario");
        rst83.SetRange("Journal Template Name", rst32."Nombre libro diario");
        if not rst83.IsEmpty then
            if Confirm('El libro ' + rst32."Nombre libro diario" + ', sección ' + rst32."Nombre seccion diario" + ', tiene líneas pendientes. Si decide seguir adelante, estas líneas se eliminarán. ¿Desea proseguir?') then
                rst83.DeleteAll
            else
                Error('Se ha detenido el proceso.');

        Clear(dlgV);
        dlgV.Open('Enviando entrada #1## de #2##');

        dlgV.Update(2, rst32.Count);
        Clear(rst83);
        if rst32.FindSet then
            repeat

                i += 10000;
                dlgV.Update(1, 10000 / 10000);

                if not ((rst32."Entry Type" = rst32."Entry Type"::Transfer) and (rst32.Quantity < 0)) then begin

                    Clear(rst83);
                    rst83."Journal Template Name" := rst32."Nombre libro diario";
                    rst83."Journal Batch Name" := rst32."Nombre seccion diario";
                    rst83."Line No." := i;
                    rst83.Validate("Item No.", rst32."Item No.");
                    rst83."Posting Date" := rst32."Posting Date";
                    rst83."Entry Type" := rst32."Entry Type";
                    rst83."Source No." := rst32."Source No.";
                    rst83."Document Line No." := rst32."Document Line No.";
                    rst83."Document No." := rst32."Document No.";
                    rst83.Description := rst32.Description;
                    rst83."Location Code" := rst32."Location Code";
                    rst83."Bin Code" := rst32."Bin code";
                    /*
                    rst83.VALIDATE(Quantity,rst32.Quantity*-1);
                    rst83."Qty. per Unit of Measure" := rst32."Qty. per Unit of Measure";
                    rst83.VALIDATE("Unit of Measure Code",rst32."Unit of Measure Code");
                    rst83.VALIDATE("Gross kilos",rst32."Gross kilos"*-1);
                    rst83.VALIDATE("Net kilos",rst32."Net kilos"*-1);
                    rst83."Invoiced Quantity" := rst32."Invoiced Quantity"*-1;
                    //rst83.VALIDATE(rst83."Applies-to Entry",rst32."Entry No.");
                    */
                    case (rst32.Positive and (rst32."Entry Type" <> rst32."Entry Type"::Transfer)) of
                        true:
                            begin

                                rst83.Validate(Quantity, rst32.Quantity * -1);
                                rst83."Qty. per Unit of Measure" := rst32."Qty. per Unit of Measure";
                                rst83.Validate("Unit of Measure Code", rst32."Unit of Measure Code");
                                rst83.Validate("Gross kilos", rst32."Gross kilos" * -1);
                                rst83.Validate("Net kilos", rst32."Net kilos" * -1);
                                rst83."Invoiced Quantity" := rst32."Invoiced Quantity" * -1;

                            end;
                        false:
                            begin
                                if rst32."Entry Type" = rst32."Entry Type"::Transfer then begin
                                    rst83.Validate(Quantity, Abs(rst32.Quantity));
                                    rst83."Qty. per Unit of Measure" := rst32."Qty. per Unit of Measure";
                                    rst83.Validate("Unit of Measure Code", rst32."Unit of Measure Code");
                                    rst83.Validate("Gross kilos", Abs(rst32."Gross kilos"));
                                    rst83.Validate("Net kilos", Abs(rst32."Net kilos"));
                                    rst83."Invoiced Quantity" := Abs(rst32."Invoiced Quantity");
                                end
                                else begin
                                    rst83.Validate(Quantity, rst32.Quantity);
                                    rst83."Qty. per Unit of Measure" := rst32."Qty. per Unit of Measure";
                                    rst83.Validate("Unit of Measure Code", rst32."Unit of Measure Code");
                                    rst83.Validate("Gross kilos", rst32."Gross kilos");
                                    rst83.Validate("Net kilos", rst32."Net kilos");
                                    rst83."Invoiced Quantity" := rst32."Invoiced Quantity";
                                end;
                            end;
                    end;
                    rst83."Shortcut Dimension 1 Code" := rst32."Global Dimension 1 Code";
                    rst83."Shortcut Dimension 2 Code" := rst32."Global Dimension 2 Code";
                    rst83."Shortcut Dimension 3 Code" := rst32."Global dimension 3 Code";
                    rst83."Shortcut Dimension 4 Code" := rst32."Global Dimension 4 Code";
                    rst83."Shortcut Dimension 5 Code" := rst32."Global Dimension 5 Code";
                    rst83."Shortcut Dimension 6 Code" := rst32."Global dimension 6 Code";
                    rst83."Shortcut Dimension 7 Code" := rst32."Global Dimension 7 Code";
                    Clear(rstVE);
                    rstVE.SetRange("Item Ledger Entry No.", rst32."Entry No.");
                    rstVE.CalcSums(rstVE."Cost per Unit");
                    rst83.Validate("Unit Amount", rstVE."Cost per Unit");
                    rst83."Dimension Set ID" := rst32."Dimension Set ID";
                    rst83."Source Type" := rst32."Source Type";
                    rst83."Country/Region Code" := rst32."Country/Region Code";
                    rst83."Entry/Exit Point" := rst32."Entry/Exit Point";
                    rst83."Document Date" := rst32."Document Date";
                    rst83."External Document No." := rst32."External Document No.";
                    rst83.Area := rst32.Area;
                    rst83."Job No." := rst32."Job No.";
                    rst83."Job Task No." := rst32."Job Task No.";
                    rst83."Lot No." := rst32."Lot No.";
                    //rst83."Shipment Method Code" := rst32."Shipment Method Code";
                    rst83."No. Pallet" := rst32."Pallet no.";
                    rst83."Lote origen" := rst32."Lote origen";
                    rst83.Insert;

                end;

            until rst32.Next = 0;

        dlgV.Close;

        Clear(rst83);
        rst83.SetRange("Journal Batch Name", rst32."Nombre seccion diario");
        rst83.SetRange("Journal Template Name", rst32."Nombre libro diario");
        /*
        IF rst32."Entry Type" = rst32."Entry Type"::Transfer THEN
        BEGIN
        
          CLEAR(pge393);
          pge393.RUN;
        
        END
        ELSE
        BEGIN
        */
        Clear(pge40);
        pge40.Run;
        /*
      END;
      */

    end;

    //Función para actualizar las líneas de seguimiento de los artículos de compra
    [Scope('OnPrem')]
    procedure UpdatePuchItemTrackingLines(PurchaseLines: Record "Purchase Line")
    var
        LotNoInfo: Record "Lot No. Information";
        ItemTrackinglinesHasUpdated: TextConst ENU = 'Item Tracking lines has been updated.', ESP = 'Las líneas de seguimiento de artículos han sido actualizadas.';
        NothingUpdate: TextConst ENU = 'Nothing to update.', ESP = 'Nada que actualizar.';
    begin
        IsUpdated := false;
        LastEntryNo := 0;

        PurchaseLines.Reset();
        PurchaseLines.SetRange("Document Type", PurchaseLines."Document Type");
        PurchaseLines.SetRange("Document No.", PurchaseLines."No.");
        PurchaseLines.SetFilter("Qty. to Invoice", '<>0');
        if PurchaseLines.FindSet() then
            repeat

            until PurchaseLines.Next = 0;

        if IsUpdated then
            Message(ItemTrackinglinesHasUpdated)
        else
            Message(NothingUpdate);
    end;

    local procedure IsPurchReservationEntryExist(PurchaseLines: Record "Purchase Line"): Boolean
    var
        ReservationEntry: Record "Reservation Entry";
    begin
        ReservationEntry.Reset();
        ReservationEntry.SetRange("Source Type", Database::"Purchase Line");
        ReservationEntry.SetRange("Source ID", PurchaseLines."Document No.");
        ReservationEntry.SetRange("Source Ref. No.", PurchaseLines."Line No.");
        if ReservationEntry.FindSet then
            exit(true);
        exit(false);
    end;

    local procedure DeletePurchReservationEntry(PurchaseLines: Record "Purchase Line"): Boolean
    var
        ReservationEntry: Record "Reservation Entry";
    begin
        ReservationEntry.Reset();
        ReservationEntry.SetRange("Source Type", Database::"Purchase Line");
        ReservationEntry.SetRange("Source ID", PurchaseLines."Document No.");
        ReservationEntry.SetRange("Source Ref. No.", PurchaseLines."Line No.");
        if ReservationEntry.FindSet then begin
            ReservationEntry.Delete();
            exit(true);
        end
        else
            exit(false);
    end;

    local procedure ModifyPurchReservationEntry(PurchaseLines: Record "Purchase Line")
    begin
        ReservationEntry.Description := PurchaseLines.Description;
        ReservationEntry.VALIDATE("Quantity (Base)", PurchaseLines."Qty. to Receive (Base)");
        ReservationEntry."Qty. per Unit of Measure" := PurchaseLines."Qty. per Unit of Measure";
        ReservationEntry."Expected Receipt Date" := PurchaseLines."Expected Receipt Date";
        ReservationEntry."Creation Date" := WorkDate();
        ReservationEntry."Created By" := UserId;
        ReservationEntry.Modify();
        IsUpdated := true;
    end;

    local procedure CreateReservationEntry(PurchaseLines: Record "Purchase Line")
    var
        Item: Record Item;
        rstDimVal: Record "Dimension Value";
        rstGLS: Record "General Ledger Setup";
        cduGenLote: Codeunit Descargas;
        cduGestExt: Codeunit GestionExistencias;
    begin
        if not Item.Get(PurchaseLines."No.") then
            exit;
        Item.TestField("Item Tracking Code");
        Item.TestField("Lot Nos.");

        ReservationEntry.Init();
        ReservationEntry."Entry No." := NextEntryNo;
        ReservationEntry."Item No." := PurchaseLines."No.";
        ReservationEntry.Description := PurchaseLines.Description;
        ReservationEntry."Location Code" := PurchaseLines."Location Code";
        ReservationEntry."Variant Code" := PurchaseLines."Variant Code";
        ReservationEntry.Validate("Quantity (Base)", PurchaseLines."Qty. to Receive (Base)");
        ReservationEntry."Reservation Status" := ReservationEntry."Reservation Status"::Surplus;
        ReservationEntry."Source Type" := Database::"Purchase Line";
        ReservationEntry."Source Subtype" := ReservationEntry."Source Subtype"::"1";
        ReservationEntry."Source ID" := PurchaseLines."Document No.";
        ReservationEntry."Source Ref. No." := PurchaseLines."Line No.";
        ReservationEntry."Expected Receipt Date" := PurchaseLines."Expected Receipt Date";
        ReservationEntry."Qty. per Unit of Measure" := PurchaseLines."Qty. per Unit of Measure";
        If Item."Lleva No. Lote" then begin
            clear(rstGLS);
            rstGLS.get();
            cleaR(rstDimVal);
            rstDimVal.get(rstGLS."Global Dimension 1 Code", PurchaseLines."Shortcut Dimension 1 Code");
            clear(cduGestExt);
            //A Controlar 
            //ReservationEntry.VALIDATE("Lot No.",cduGenLote.fntGenLote(rstDimVal.Code,PurchaseLines."Shortcut Dimension 2 Code",PurchaseLines."Shortcut Dimension 3 Code",);
        end
        else
            ReservationEntry.VALIDATE("Lot No.", NoSeriesMgt.GetNextNo(Item."Lot Nos.", WorkDate(), true));
        ReservationEntry."Item Tracking" := ReservationEntry."Item Tracking"::"Lot No.";
        ReservationEntry."Created By" := UserId;
        ReservationEntry.Positive := true;
        ReservationEntry."Creation Date" := WorkDate();
        ReservationEntry.Insert();
    end;



    local procedure IsLotInfoExist(): Boolean
    var
        myInt: Integer;
    begin
        IF LotNoInfo.Get(ReservationEntry."Item No.", ReservationEntry."Variant Code", ReservationEntry."Lot No.") then
            exit(true);
        exit(false);
    end;

    local procedure ModifyLotInfo()
    var
        myInt: Integer;
    begin
        LotNoInfo.Description := ReservationEntry.Description;
        //You can add custom fields in Lot Information.
        LotNoInfo.Modify();

        IsUpdated := true;
    end;

    local procedure CreateLotNoInfo()
    var
        myInt: Integer;
    begin
        LotNoInfo.Init();
        LotNoInfo."Item No." := ReservationEntry."Item No.";
        LotNoInfo."Variant Code" := ReservationEntry."Variant Code";
        LotNoInfo."Lot No." := ReservationEntry."Lot No.";
        LotNoInfo.Description := ReservationEntry.Description;
        //You can add custom fields in Lot Information.
        LotNoInfo.Insert();
        IsUpdated := true;
    end;

    local procedure NextEntryNo(): Integer
    var
        ReserveEntry: Record "Reservation Entry";
    begin
        ReserveEntry.Reset();
        if LastEntryNo = 0 then
            if ReserveEntry.FindLast() then
                LastEntryNo := ReserveEntry."Entry No.";
        LastEntryNo += 1;
        exit(LastEntryNo);
    end;

    var
        ReservationEntry: Record "Reservation Entry";
        IsUpdated: Boolean;
        LastEntryNo: Integer;
        LotNoInfo: Record "Lot No. Information";
        NoSeriesMgt: Codeunit "No. Series";

}