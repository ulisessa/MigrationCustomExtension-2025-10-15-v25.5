codeunit 50040 GestionConsumos
{
    trigger OnRun()
    begin

    end;

    [Scope('OnPrem')]
    procedure fntRegistroConsumo(rstCabVC: Record "Cab. Vale consumo"; rstLinDiaProd: Record "Item Journal Line"; blnRevertir: Boolean): Boolean
    var
        i: Integer;
        RegistroVisible: Boolean;
        "strCapitán": Text[30];
        rstLinProd83: Record "Item Journal Line";
        rstLinProd32: Record "Item Ledger Entry";
        rstLocation: Record Location;
        rstSeccion: Record "Item Journal Batch";
        rstConfUsu: Record "User Setup";
        cduMensajeria: Codeunit "Mensajería";
        rstMensajeria: Record Mensajeria;
        rstLinProdPta: Record "Lín. vale consumo";
        rstConfEx: Record "Inventory Setup";
        rstProyecto: Record Job;
        rstCProd: Record "Produccion Planta";
        RegLinDiaProd: Codeunit "Item Jnl.-Post";
    begin
        with rstCabVC do begin
            Clear(rstLinProdPta);
            Clear(rstLinDiaProd);
            Clear(rstConfEx);
            rstConfEx.Get();
            rstConfEx.TestField("Nombre libro diario consumos");
            rstConfEx.TestField("Sección libro diario consumos");
            rstLinProdPta.SetRange(rstLinProdPta."No. documento", rstCabVC."No. documento");
            Clear(rstLinDiaProd);
            Clear(rstCProd);
            rstCProd.SetRange("No. documento", rstCabVC."No. documento");
            if rstCProd.FindFirst then begin
                rstLinDiaProd.SetRange("Journal Template Name", rstCProd."Nombre libro diario");
                rstLinDiaProd.SetRange("Journal Batch Name", rstCProd."Nombre seccion diario");
            end
            else begin
                rstLinDiaProd.SetRange("Journal Template Name", rstConfEx."Nombre libro diario consumos");
                rstLinDiaProd.SetRange("Journal Batch Name", rstConfEx."Sección libro diario consumos");
            end;
            rstLinDiaProd.DeleteAll;
            if rstLinProdPta.Find('-') then
                repeat
                    if blnRevertir then
                        fntAnularConsumo(rstLinProdPta)
                    else
                        fntRegistroLinConsumo(rstCProd, rstLinProdPta, false);
                until rstLinProdPta.Next = 0;
            if rstCProd.FindFirst then begin
                rstLinDiaProd.SetRange("Journal Template Name", rstCProd."Nombre libro diario");
                rstLinDiaProd.SetRange("Journal Batch Name", rstCProd."Nombre seccion diario");
            end
            else begin
                rstLinDiaProd.SetRange("Journal Template Name", rstConfEx."Nombre libro diario consumos");
                rstLinDiaProd.SetRange("Journal Batch Name", rstConfEx."Sección libro diario consumos");
            end;
            rstLinDiaProd.FindFirst;
            if not blnRevertir then begin
                //RegLinDiaProd.SuppressConfirmationRequest;
                RegLinDiaProd.Run(rstLinDiaProd);
            end;
            rstConfUsu.Reset;
            if rstConfUsu.Get(UserId) then
                cduMensajeria.RegistrarMensaje('Vale de Consumo Registrado', '', "No. documento", 'Vale de Consumo', 'Registrado', Today,
                rstMensajeria."Tipo movimiento"::Seguimiento, rstConfUsu.Grupo, '', '', '', '', '', '', '');
            Message('Consumo registrado con éxito');
            exit(true);
        end;
    end;

    [Scope('OnPrem')]
    procedure fntRegistroLinConsumo(rstCabProd: Record "Produccion Planta"; rstLinProdPta: Record "Lín. vale consumo"; blnRevertir: Boolean): Boolean
    var
        i: Integer;

        RegistroVisible: Boolean;
        "strCapitán": Text[30];
        rstLinProd83: Record "Item Journal Line";
        rstLinProd32: Record "Item Ledger Entry";
        rstLocation: Record Location;
        rstSeccion: Record "Item Journal Batch";
        rstConfUsu: Record "User Setup";
        cduMensajeria: Codeunit "Mensajería";
        rstMensajeria: Record Mensajeria;
        rstConfEx: Record "Inventory Setup";
        rstProyecto: Record Job;
        rstLinDiaProd: Record "Item Journal Line";
        rstCabVC: Record "Cab. Vale consumo";
    begin
        Clear(rstConfEx);
        rstConfEx.Get();

        //Limpio la sección del diario de productos a utilizar para registrar cada línea
        /*
        CLEAR(rstLinDiaProd);
        IF rstCabProd."No. documento" <> '' THEN
        BEGIN
          rstLinDiaProd.SETRANGE("Journal Template Name",rstCabProd."Nombre libro diario");
          rstLinDiaProd.SETRANGE("Journal Batch Name",rstCabProd."Nombre seccion diario");
        END
        ELSE
        BEGIN
          rstLinDiaProd.SETRANGE("Journal Template Name",rstConfEx."Nombre libro diario consumos");
          rstLinDiaProd.SETRANGE("Journal Batch Name",rstConfEx."Sección libro diario consumos");
        END;
        rstLinDiaProd.DELETEALL;
        */
        rstLinProdPta.TestField("Cód. depósito");
        rstLinProdPta.TestField(rstLinProdPta."No.");
        rstLinProdPta.TestField(rstLinProdPta.Descripción);
        rstLinProdPta.TestField(rstLinProdPta."Cód. unidad medida");
        rstLinProdPta.TestField(rstLinProdPta.Cantidad);
        rstLinProdPta.TestField(rstLinProdPta."No. proyecto");
        rstLinProdPta.TestField("Cód. depósito");

        Clear(rstProyecto);
        rstProyecto.Get(rstLinProdPta."No. proyecto");

        Clear(rstLinDiaProd);
        if rstCabProd."No. documento" <> '' then begin
            rstLinDiaProd."Journal Template Name" := rstCabProd."Nombre libro diario";
            rstLinDiaProd."Journal Batch Name" := rstCabProd."Nombre seccion diario";
        end
        else begin
            rstLinDiaProd."Journal Template Name" := rstConfEx."Nombre libro diario consumos";
            rstLinDiaProd."Journal Batch Name" := rstConfEx."Sección libro diario consumos";
        end;
        rstLinDiaProd.Validate("Entry Type", rstLinDiaProd."Entry Type"::"Negative Adjmt.");

        if blnRevertir then begin

            //Inserto en el diario de productos la reversión
            if rstLinDiaProd."Entry Type" = rstLinDiaProd."Entry Type"::"Positive Adjmt." then
                rstLinDiaProd."Entry Type" := rstLinDiaProd."Entry Type"::"Negative Adjmt."
            else
                rstLinDiaProd."Entry Type" := rstLinDiaProd."Entry Type"::"Positive Adjmt.";

            Clear(rstLinProd32);
            rstLinProd32.SetRange("Document No.", rstLinProdPta."No. documento");
            rstLinProd32.SetRange("Document Line No.", rstLinProdPta."No. línea");
            rstLinProd32.SetRange("Item No.", rstLinProdPta."No.");
            rstLinProd32.SetRange(Revertido, false);
            if rstLinProd32.FindFirst then begin
                rstLinProd32.Revertido := true;
                rstLinProd32.Modify;
            end;

        end;

        rstLinDiaProd."Line No." := rstLinProdPta."No. línea";
        rstLinDiaProd.Validate("Item No.", rstLinProdPta."No.");
        rstLinDiaProd.Description := rstLinProdPta.Descripción;
        if rstCabProd."No. documento" <> '' then begin
            rstLinDiaProd.Validate("Posting Date", rstCabProd."Fecha registro");
            rstLinDiaProd.Validate("Document No.", rstCabProd."No. documento");
        end
        else begin
            Clear(rstCabVC);
            rstCabVC.SetRange("No. documento", rstLinProdPta."No. documento");
            rstCabVC.FindFirst;
            rstLinDiaProd.Validate("Posting Date", rstCabVC."Fecha registro");
            rstLinDiaProd.Validate("Document No.", rstCabVC."No. documento");
        end;
        rstLinDiaProd.Validate("Location Code", rstLinProdPta."Cód. depósito");
        rstLinDiaProd.Validate("Unit of Measure Code", rstLinProdPta."Cód. unidad medida");
        rstLinDiaProd.Validate(Quantity, rstLinProdPta.Cantidad);
        rstLinDiaProd."Document Line No." := rstLinProdPta."No. línea";
        rstLinDiaProd.Validate("No. Proyecto", rstLinProdPta."No. proyecto");
        if rstLinProdPta."Shortcut Dimension 1 Code" <> '' then
            rstLinDiaProd.Validate("Shortcut Dimension 1 Code", rstLinProdPta."Shortcut Dimension 1 Code");
        if rstLinProdPta."Shortcut Dimension 2 Code" <> '' then
            rstLinDiaProd.Validate("Shortcut Dimension 2 Code", rstLinProdPta."Shortcut Dimension 2 Code");
        if rstLinProdPta."Shortcut Dimension 3 Code" <> '' then
            rstLinDiaProd.Validate("Shortcut Dimension 3 Code", rstLinProdPta."Shortcut Dimension 3 Code");
        if rstLinProdPta."Shortcut Dimension 4 Code" <> '' then
            rstLinDiaProd.Validate("Shortcut Dimension 4 Code", rstLinProdPta."Shortcut Dimension 4 Code");
        if rstLinProdPta."Shortcut Dimension 5 Code" <> '' then
            rstLinDiaProd.Validate("Shortcut Dimension 5 Code", rstLinProdPta."Shortcut Dimension 5 Code");
        if rstLinProdPta."Shortcut Dimension 6 Code" <> '' then
            rstLinDiaProd.Validate("Shortcut Dimension 6 Code", rstLinProdPta."Shortcut Dimension 6 Code");
        if rstLinProdPta."Shortcut Dimension 7 Code" <> '' then
            rstLinDiaProd.Validate("Shortcut Dimension 7 Code", rstLinProdPta."Shortcut Dimension 7 Code");
        rstLinDiaProd.Validate("Concepto proyecto", rstLinProdPta."Concepto proyecto");
        rstLinDiaProd.Validate("Lot No.", rstLinProdPta."Lot No.");
        rstLinDiaProd.Insert(true);

        exit(true);

    end;

    [Scope('OnPrem')]
    procedure fntAnularConsumo(Lin: Record "Lín. vale consumo")
    var
        "Almacén": Record Location;
        LinDiaProd: Record "Item Journal Line";
        Lin2: Record "Lín. vale consumo";
        RegLinDiaProd: Codeunit "Item Jnl.-Post Line";
        rstJobTask: Record "Job Task";
        i: Integer;
        dlgDialogo: Dialog;
        rstIJL: Record "Item Journal Line";
        j: Integer;
        rst50103: RecordRef;
        cduValidaciones: Codeunit Validaciones;
        strFiltro: array[250, 3] of Text[30];
        Producto: Record Item;
        ItemCheckAvail: Codeunit "Item-Check Avail.";
        strDoc: Code[20];
        rstConfEx: Record "Inventory Setup";
        rstCVC: Record "Cab. Vale consumo";
        Application: Record "Item Application Entry";
        Apply: Codeunit "Item Jnl.-Post Line";
        AppliedRec: Record "Item Ledger Entry";
        Applyrec: Record "Item Ledger Entry";
        intILE: Integer;
        rstILE: Record "Item Ledger Entry";
        rstILE2: Record "Item Ledger Entry";
        cduGestionExistencias: Codeunit GestionExistencias;
    begin
        i := 0;
        dlgDialogo.Open('Revirtiendo #1############# de #2#############\' +
                        '                       @3@@@@@@@@@@@@@@@@@@@@@');
        j := Lin.Count;
        dlgDialogo.Update(2, j);
        Clear(rstConfEx);
        rstConfEx.Get();
        strDoc := Lin."No. documento";
        Clear(rstCVC);
        rstCVC.SetRange(rstCVC."No. documento", Lin."No. documento");
        if rstCVC.FindFirst then begin
            if Lin.Revertido then
                Error('La línea no. %1 ya fue revertida previamente.', Lin."No. línea");
            if Lin.Cantidad < 0 then
                Error('No puede revertir la línea no. %1 ya que es una línea de reversión.', Lin."No. línea");
            i += 1;
            dlgDialogo.Update(1, i);
            dlgDialogo.Update(3, Round(i / j, 1));
            rst50103.GetTable(Lin);
            cduValidaciones.ValidarxTabla(rst50103, rst50103.GetPosition(), strFiltro);
            Clear(rstILE);
            rstILE.SetRange("Document No.", Lin."No. documento");
            rstILE.SetRange("Document Line No.", Lin."No. línea");
            rstILE.SetRange(Revertido, false);
            if rstILE.FindFirst then begin
                clear(cduGestionExistencias);
                cduGestionExistencias.fntRevertirILE(rstILE, false);
                cduGestionExistencias.fntDeshacerAplicacionMovProducto(rstILE."Item No.", rstILE."Entry No.");
                //fntHacerNuevaAplicacionMovProducto(rstILE);
                Clear(Lin2);
                Lin2 := Lin;
                Lin2."No. línea" += 1;
                Lin2.Cantidad := -Lin.Cantidad;
                Lin2.Insert;
                Lin.Revertido := true;
                Lin2.Revertido := true;
                Lin.Modify;
                Lin2.Modify;
            end;
        end;
        fntActualizarEstadoConsumo(Lin, rstILE."Document No.", i);
        dlgDialogo.Close;
    end;

    local procedure fntActualizarEstadoConsumo(Lin: Record "Lín. vale consumo"; strDoc: Code[20]; i: Integer)
    var
        rstConfUsu: Record "User Setup";
        rstMensajeria: Record Mensajeria;
        cduMensajeria: Codeunit "Mensajería";
    begin
        Clear(Lin);
        Lin.SetRange("No. documento", strDoc);
        Lin.SetFilter(Cantidad, '>0');
        Lin.SetRange(Revertido, false);
        if Lin.FindFirst then begin
            Clear(Lin);
            Lin.SetRange("No. documento", strDoc);
            Lin.SetFilter(Cantidad, '>0');
            Lin.SetRange(Revertido, true);
            if Lin.FindFirst then begin
                rstConfUsu.Reset;
                if rstConfUsu.Get(UserId) then
                    cduMensajeria.RegistrarMensaje('Registro Vale de Consumo', '', strDoc, 'Vale de Consumo', 'Parcialmente revertido', Today,
                    rstMensajeria."Tipo movimiento"::Seguimiento, rstConfUsu.Grupo, '', '', '', '', '', '', '');
            end
        end
        else begin
            rstConfUsu.Reset;
            if i <> 0 then
                if rstConfUsu.Get(UserId) then
                    cduMensajeria.RegistrarMensaje('Registro Vale de Consumo', '', strDoc, 'Vale de Consumo', 'Completamente revertido', Today,
                    rstMensajeria."Tipo movimiento"::Seguimiento, rstConfUsu.Grupo, '', '', '', '', '', '', '');
        end;
    end;

    var
        myInt: Integer;
}