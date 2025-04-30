codeunit 50044 GestionProduccionPlanta
{
    trigger OnRun()
    begin

    end;

    [Scope('OnPrem')]
    procedure fntRegistroProduccion(rstCabProd: Record "Produccion Planta"; rstLinDiaProd: Record "Item Journal Line"; blnRevertir: Boolean; blnImprimir: Boolean): Boolean
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
        rstLinProdPta: Record "Lin. produccion planta";
        rstConfEx: Record "Inventory Setup";
        rstProyecto: Record Job;
        rst32: Record "Item Ledger Entry";
        rstLVC: Record "Lín. vale consumo";
        rstLVC2: Record "Lín. vale consumo";
        rst233: Record "Item Journal Batch";
        rstHistCabProd: Record "Produccion Planta";
        intLastRegister: Integer;
        rstCVC: Record "Cab. Vale consumo";
        int32Inicial: Integer;
        int32Final: Integer;
        rst32Appl: Record "Item Ledger Entry";
        temp_rstLVC: Record "Lín. vale consumo" temporary;
        intLine: Integer;
    begin
        with rstCabProd do begin

            Clear(rstLinProdPta);
            Clear(rstLinDiaProd);
            Clear(rstConfEx);
            rstConfEx.Get();
            intLastRegister := 0;

            rstLinProdPta.SetRange(rstLinProdPta."No. documento", rstCabProd."No. documento");
            blnSalir := false;

            Clear(rst233);
            if rst233.Get("Nombre libro diario", "Nombre seccion diario") then begin
                if not rst233."No pide confirmación" then
                    Error('Verifique que la Sección utilizada no pida confirmación de registro de líneas.');
            end;

            Clear(rstLinDiaProd);
            rstLinDiaProd.SetRange("Journal Template Name", "Nombre libro diario");
            rstLinDiaProd.SetRange("Journal Batch Name", "Nombre seccion diario");
            rstLinDiaProd.DeleteAll;

            //Si se revierte la producción
            if blnRevertir then begin

                Clear(rstLinProdPta);
                rstLinProdPta.SetRange("Nombre libro diario", rstCabProd."Nombre libro diario");
                rstLinProdPta.SetRange("Nombre seccion diario", rstCabProd."Nombre seccion diario");
                rstLinProdPta.SetRange("No. documento", rstCabProd."No. documento");
                rstLinProdPta.DeleteAll;

                //Busco el último registro
                Clear(rst32);
                if rst32.FindLast then
                    int32Final := rst32."Entry No.";

                //Busco el primer registro de esta producción sin revertir
                Clear(rst32);
                rst32.SetRange("Document No.", "No. documento");
                rst32.SetRange("Nombre libro diario", "Nombre libro diario");
                rst32.SetRange("Nombre seccion diario", "Nombre seccion diario");
                rst32.SetRange(Revertido, false);
                if rst32.FindFirst then
                    int32Inicial := rst32."Entry No.";

                //Me aseguro que no se haya consumido nada del producto terminado de esta OP
                Clear(rst32);
                rst32.SetRange("Document No.", "No. documento");
                rst32.SetRange("Nombre libro diario", "Nombre libro diario");
                rst32.SetRange("Nombre seccion diario", "Nombre seccion diario");
                rst32.SetRange("Item Category Code", rstConfEx."Categoria productos pesca");
                rst32.SetRange(Revertido, false);
                rst32.SetRange(Positive, true);
                if rst32.FindSet then
                    repeat
                        if rst32.Quantity <> rst32."Remaining Quantity" then begin
                            //ERROR('Existen movimientos de consumo sobre esta producción, no se puede continuar con la reversión');
                            if not Confirm('Existen movimientos de consumo sobre esta producción. ¿Desea continuar?.') then
                                Error('Reversión detenida')
                            else
                                blnSalir := true;
                        end;
                    until (rst32.Next = 0) or blnSalir;

                //Primero, recreo las salidas de materia prima en la OP
                Clear(rst32);
                rst32.SetRange("Document No.", "No. documento");
                rst32.SetRange("Nombre libro diario", "Nombre libro diario");
                rst32.SetRange("Nombre seccion diario", "Nombre seccion diario");
                rst32.SetRange("Item Category Code", rstConfEx."Categoria productos pesca");
                rst32.SetRange(Revertido, false);
                rst32.SetRange("Entry Type", rst32."Entry Type"::"Negative Adjmt.");
                if rst32.FindSet then
                    repeat

                        i += 10000;

                        Clear(rstLinProdPta);
                        rstLinProdPta."Nombre libro diario" := rst32."Nombre libro diario";
                        rstLinProdPta."Nombre seccion diario" := rst32."Nombre seccion diario";
                        rstLinProdPta."No. documento" := rst32."Document No.";
                        rstLinProdPta."No. línea" := i;
                        rstLinProdPta.Tipo := rstLinProdPta.Tipo::Salida;
                        rstLinProdPta.Clasificacion := rst32."Item No.";
                        rstLinProdPta.Descripcion := rst32.Description;
                        rstLinProdPta."Unidad medida" := rst32."Unit of Measure Code";
                        rstLinProdPta.Cantidad := Abs(rst32.Quantity);
                        rstLinProdPta."Kilos netos" := Abs(rst32."Net kilos");
                        rstLinProdPta."Kilos brutos" := Abs(rst32."Gross kilos");
                        rstLinProdPta."No. Pallet" := rst32."Pallet no.";
                        rstLinProdPta."No. lote" := rst32."Lot No.";
                        rstLinProdPta."Cod. deposito" := rst32."Location Code";
                        rstLinProdPta.Buque := rst32."Global Dimension 1 Code";
                        rstLinProdPta.Marea := rst32."Global dimension 3 Code";
                        if rst32."Global Dimension 7 Code" <> '' then
                            rstLinProdPta."Cod. relacion costo" := rst32."Global Dimension 7 Code";
                        rstLinProdPta.Puerto := rst32."Entry/Exit Point";
                        rstLinProdPta."No. proyecto" := rst32."Job No.";
                        rstLinProdPta.Actividad := rst32."Global Dimension 2 Code";
                        rstLinProdPta.Familia := rst32.Family;
                        rstLinProdPta.Subfamilia := rst32.Subfamily;
                        rstLinProdPta."Lote origen" := rst32."Lote origen";
                        rstLinProdPta.Registrado := false;
                        rstLinProdPta.Revertido := false;
                        rstLinProdPta.Insert;
                        //Revierto la salida
                        clear(cduGestionExistencias);
                        cduGestionExistencias.fntRevertirILE(rst32, false);
                    until rst32.Next = 0;

                //Hago lo mismo con las entradas de producto terminado
                Clear(rst32);
                rst32.SetRange("Document No.", "No. documento");
                rst32.SetRange("Nombre libro diario", "Nombre libro diario");
                rst32.SetRange("Nombre seccion diario", "Nombre seccion diario");
                rst32.SetRange("Item Category Code", rstConfEx."Categoria productos pesca");
                rst32.SetRange(Revertido, false);
                rst32.SetRange("Entry Type", rst32."Entry Type"::"Positive Adjmt.");
                if rst32.FindSet then
                    repeat

                        i += 10000;

                        Clear(rstLinProdPta);
                        rstLinProdPta."Nombre libro diario" := rst32."Nombre libro diario";
                        rstLinProdPta."Nombre seccion diario" := rst32."Nombre seccion diario";
                        rstLinProdPta."No. documento" := rst32."Document No.";
                        rstLinProdPta."No. línea" := i;
                        rstLinProdPta.Tipo := rstLinProdPta.Tipo::Entrada;
                        rstLinProdPta.Clasificacion := rst32."Item No.";
                        rstLinProdPta.Descripcion := rst32.Description;
                        rstLinProdPta."Unidad medida" := rst32."Unit of Measure Code";
                        rstLinProdPta.Cantidad := Abs(rst32.Quantity);
                        rstLinProdPta."Kilos netos" := Abs(rst32."Net kilos");
                        rstLinProdPta."Kilos brutos" := Abs(rst32."Gross kilos");
                        rstLinProdPta."No. Pallet" := rst32."Pallet no.";
                        rstLinProdPta."No. lote" := rst32."Lot No.";
                        rstLinProdPta."Cod. deposito" := rst32."Location Code";
                        rstLinProdPta.Buque := rst32."Global Dimension 1 Code";
                        rstLinProdPta.Marea := rst32."Global dimension 3 Code";
                        if rst32."Global Dimension 7 Code" <> '' then
                            rstLinProdPta."Cod. relacion costo" := rst32."Global Dimension 7 Code";
                        rstLinProdPta.Puerto := rst32."Entry/Exit Point";
                        rstLinProdPta."No. proyecto" := rst32."Job No.";
                        rstLinProdPta.Actividad := rst32."Global Dimension 2 Code";
                        rstLinProdPta.Familia := rst32.Family;
                        rstLinProdPta.Subfamilia := rst32.Subfamily;
                        rstLinProdPta."Lote origen" := rst32."Lote origen";
                        rstLinProdPta.Registrado := false;
                        rstLinProdPta.Revertido := false;
                        rstLinProdPta.Insert;
                        //Revierto la entrada
                        //Si no han habido movimientos de consumo sobre la producción, avanzo con la reversión
                        clear(cduGestionExistencias);
                        cduGestionExistencias.fntRevertirILE(rst32, false);
                    until rst32.Next = 0;

                i := 0;

                Clear(rstLinProdPta);
                rstLinProdPta.SetRange(rstLinProdPta."No. documento", rstCabProd."No. documento");

                Clear(rstLVC);
                rstLVC.SetRange("No. documento", "No. documento");
                rstLVC.SetRange(Revertido, false);
                if rstLVC.FindFirst then
                    repeat
                        temp_rstLVC.TransferFields(rstLVC);
                        temp_rstLVC.Insert;
                        Clear(rstLVC2);
                        rstLVC2.SetRange("No. documento", rstLVC."No. documento");
                        rstLVC2.SetRange("No. línea", rstLVC."No. línea");
                        rstLVC2.FindFirst;
                        Clear(cduGestionConsumos);
                        cduGestionConsumos.fntAnularConsumo(rstLVC2);
                    until rstLVC.Next = 0;
                Clear(rstLVC);
                rstLVC.SetRange("No. documento", "No. documento");
                if rstLVC.FindLast then
                    intLine := rstLVC."No. línea";
                if temp_rstLVC.FindSet then
                    repeat
                        intLine += 10000;
                        Clear(rstLVC);
                        rstLVC.TransferFields(temp_rstLVC);
                        rstLVC."No. línea" := intLine;
                        rstLVC.Revertido := false;
                        rstLVC.Insert;
                    until temp_rstLVC.Next = 0;

                Clear(rstLinProd83);
                rstLinProd83.SetRange("Journal Template Name", rstCabProd."Nombre libro diario");
                rstLinProd83.SetRange("Journal Batch Name", rstCabProd."Nombre seccion diario");
                rstLinProd83.SetRange("Document No.", rstCabProd."No. documento");
                if rstLinProd83.FindSet then begin
                    clear(cduGestionExistencias);
                    cduGestionExistencias.fntRegistrarReversionILE(rstLinProd83);
                end;

                Clear(rst32);
                if rst32.FindLast then
                    intLastRegister := rst32."Entry No.";

                Clear(rst32);
                rst32.SetRange("Document No.", rstCabProd."No. documento");
                rst32.SetRange("Entry No.", int32Inicial, int32Final);
                if rst32.FindSet then
                    repeat
                        Clear(rst32Appl);
                        rst32Appl.SetFilter("Entry No.", '>%1', int32Final);
                        rst32Appl.SetRange("Item No.", rst32."Item No.");
                        rst32Appl.SetRange("Document No.", rst32."Document No.");
                        rst32Appl.SetRange("Document Line No.", rst32."Document Line No.");
                        rst32Appl.FindLast;
                        cleaR(cduGestionExistencias);
                        cduGestionExistencias.fntDeshacerAplicacionMovProducto(rst32."Item No.", rst32."Entry No.");
                        cduGestionExistencias.fntHacerNuevaAplicacionMovProducto(rst32, rst32Appl."Entry No.");
                    until rst32.Next = 0;
                Registrado := false;
                Modify;
                Message('Producción revertida con éxito')

            end;

            if not blnRevertir then begin
                if rstLinProdPta.Find('-') then
                    repeat

                        rstLinProdPta.SetFilter(Clasificacion, '<>%1', '');
                        rstLinProdPta.TestField(Buque);
                        rstLinProdPta.TestField(Marea);
                        rstLinProdPta.TestField("Cod. deposito");
                        rstLinProdPta.TestField(rstLinProdPta."Nombre libro diario");
                        rstLinProdPta.TestField(rstLinProdPta.Descripcion);
                        rstLinProdPta.TestField(rstLinProdPta."Unidad medida");
                        rstLinProdPta.TestField(rstLinProdPta.Cantidad);
                        rstLinProdPta.TestField(rstLinProdPta."Kilos netos");
                        rstLinProdPta.TestField(rstLinProdPta."Kilos brutos");
                        rstLinProdPta.TestField("Cod. deposito");
                        rstLinProdPta.TestField("Lote origen");
                        Clear(rstProyecto);
                        rstProyecto.Get(rstLinProdPta."No. proyecto");
                        Clear(rstLinDiaProd);
                        rstLinDiaProd."Journal Template Name" := rstLinProdPta."Nombre libro diario";
                        rstLinDiaProd."Journal Batch Name" := rstLinProdPta."Nombre seccion diario";
                        case rstLinProdPta.Tipo of
                            rstLinProdPta.Tipo::Salida:
                                rstLinDiaProd.Validate("Entry Type", rstLinDiaProd."Entry Type"::"Negative Adjmt.");
                            rstLinProdPta.Tipo::Entrada:
                                rstLinDiaProd.Validate("Entry Type", rstLinDiaProd."Entry Type"::"Positive Adjmt.");
                        end;
                        rstLinDiaProd."Line No." := rstLinProdPta."No. línea";
                        rstLinDiaProd.Validate("Item No.", rstLinProdPta.Clasificacion);
                        rstLinDiaProd.Validate("Posting Date", rstCabProd."Fecha registro");
                        rstLinDiaProd.Validate("Document No.", rstCabProd."No. documento");
                        rstLinDiaProd.Validate("Location Code", rstLinProdPta."Cod. deposito");
                        Clear(rstLocation);
                        rstLocation.Get(rstLinDiaProd."Location Code");
                        if rstLocation."Bin Mandatory" then
                            rstLinDiaProd.Validate("Bin Code", rstLocation."Default bin");
                        if "Puerto/Aeropuerto" = 'COM.RIV' then
                            rstLinDiaProd.Validate("Entry/Exit Point", 'CRV');
                        if "Puerto/Aeropuerto" = 'PTO.DDO' then
                            rstLinDiaProd.Validate("Entry/Exit Point", 'PD');
                        if "Puerto/Aeropuerto" = 'PTO.CAM' then
                            rstLinDiaProd.Validate("Entry/Exit Point", 'CAMARONES');
                        if "Puerto/Aeropuerto" = 'PTO.MDQ' then
                            rstLinDiaProd.Validate("Entry/Exit Point", 'MDQ');
                        rstLinDiaProd.Validate("Entry/Exit Point", rstLinProdPta.Puerto);
                        rstLinDiaProd."Job No." := rstLinProdPta."No. proyecto";
                        rstLinDiaProd."Document Line No." := rstLinProdPta."No. línea";
                        rstLinDiaProd.Validate("Shortcut Dimension 1 Code", rstLinProdPta.Buque);
                        rstLinDiaProd.Validate("Shortcut Dimension 2 Code", rstLinProdPta.Actividad);
                        rstLinDiaProd.Validate("Shortcut Dimension 3 Code", rstLinProdPta.Marea);
                        if rstLinProdPta."Cod. relacion costo" <> '' then
                            rstLinDiaProd."Shortcut Dimension 7 Code" := rstLinProdPta."Cod. relacion costo";
                        rstLinDiaProd.Validate("No. Pallet", rstLinProdPta."No. Pallet");
                        rstLinDiaProd.Validate("Lot No.", rstLinProdPta."No. lote");
                        rstLinDiaProd.Validate(Quantity, rstLinProdPta.Cantidad);
                        rstLinDiaProd.Validate("Net kilos", rstLinProdPta."Kilos netos");
                        rstLinDiaProd.Validate("Gross kilos", rstLinProdPta."Kilos brutos");
                        rstLinDiaProd."Lote origen" := rstLinProdPta."Lote origen";
                        rstLinDiaProd.Validate("Unit Cost", 0);
                        rstLinDiaProd.Validate("Unit Cost (ACY)", 0);
                        rstLinDiaProd.Validate("Unit Amount", 0);
                        rstLinDiaProd.Insert(true);
                    until rstLinProdPta.Next = 0;
                fntRegistroConsumoProduccion(rstCabProd, false);
                CODEUNIT.Run(CODEUNIT::"Item Jnl.-Post", rstLinDiaProd);
                Registrado := true;
                Modify;
                Message('Producción registrada con éxito');
            end;

            if blnImprimir then begin

                rstCabProd.SetRecFilter;

                Clear(rstHistCabProd);
                rstHistCabProd.SetRange("Nombre libro diario", "Nombre libro diario");
                rstHistCabProd.SetRange("Nombre seccion diario", "Nombre seccion diario");
                rstHistCabProd.SetRange("No. documento", "No. documento");
                if rstHistCabProd.Find('-') then begin

                    case rstHistCabProd."Global Dimension 2" of
                        'CAL', 'CLM':
                            REPORT.Run(50067, false, true, rstHistCabProd);
                        'LAN', 'FRE':
                            REPORT.Run(50068, false, true, rstHistCabProd);
                        else
                            REPORT.Run(50069, false, true, rstHistCabProd);

                    end;

                end;

            end;

            exit(true);

        end;
    end;

    [Scope('OnPrem')]
    procedure fntRegistroConsumoProduccion(rstCabProd: Record "Produccion Planta"; blnRevertir: Boolean): Boolean
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
        rstLinDiaProd: Record "Item Journal Line";
        rstCVC: Record "Cab. Vale consumo";
        Producto: Record Item;
    begin
        with rstCabProd do begin
            Clear(rstCVC);
            rstCVC."Nombre Libro Consumo" := rstCabProd."Nombre libro diario";
            rstCVC."No. documento" := rstCabProd."No. documento";
            rstCVC."Fecha registro" := rstCabProd."Fecha registro";
            rstCVC.Usuario := UserId;
            if not rstCVC.Insert then;

            Clear(rstLinProdPta);
            Clear(rstConfEx);
            rstLinProdPta.SetRange(rstLinProdPta."No. documento", rstCabProd."No. documento");
            rstLinProdPta.SetRange(Revertido, false);

            Clear(rstLinDiaProd);
            rstLinDiaProd.SetRange("Journal Template Name", rstCabProd."Nombre libro diario");
            rstLinDiaProd.SetRange("Journal Batch Name", rstCabProd."Nombre seccion diario");
            if rstLinDiaProd.FindLast then
                i := rstLinDiaProd."Line No.";
            Clear(rstLinDiaProd);

            //rstLinProdPta.SETRANGE(Registrado,FALSE);
            if rstLinProdPta.Find('-') then
                repeat

                    i += 10000;
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
                    rstLinDiaProd."Journal Template Name" := rstCabProd."Nombre libro diario";
                    rstLinDiaProd."Journal Batch Name" := rstCabProd."Nombre seccion diario";
                    rstLinDiaProd.Validate("Entry Type", rstLinDiaProd."Entry Type"::"Negative Adjmt.");

                    if blnRevertir then begin

                        if rstLinDiaProd."Entry Type" = rstLinDiaProd."Entry Type"::"Positive Adjmt." then
                            rstLinDiaProd."Entry Type" := rstLinDiaProd."Entry Type"::"Negative Adjmt."
                        else
                            rstLinDiaProd."Entry Type" := rstLinDiaProd."Entry Type"::"Positive Adjmt.";

                    end;

                    rstLinDiaProd."Line No." := i;
                    rstLinDiaProd.Validate("Item No.", rstLinProdPta."No.");
                    rstLinDiaProd.Description := rstLinProdPta.Descripción;
                    rstLinDiaProd.Validate("Posting Date", rstCabProd."Fecha registro");
                    rstLinDiaProd.Validate("Document No.", rstCabProd."No. documento");
                    rstLinDiaProd.Validate("Location Code", rstLinProdPta."Cód. depósito");
                    if rstCabProd."Puerto/Aeropuerto" = 'COM.RIV' then
                        rstLinDiaProd.Validate("Entry/Exit Point", 'CRV');
                    if rstCabProd."Puerto/Aeropuerto" = 'PTO.DDO' then
                        rstLinDiaProd.Validate("Entry/Exit Point", 'PD');
                    if rstCabProd."Puerto/Aeropuerto" = 'PTO.CAM' then
                        rstLinDiaProd.Validate("Entry/Exit Point", 'CAMARONES');
                    rstLinDiaProd.Validate("Unit of Measure Code", rstLinProdPta."Cód. unidad medida");
                    rstLinDiaProd.Validate(Quantity, rstLinProdPta.Cantidad);
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
                    rstLinDiaProd."Document Line No." := rstLinProdPta."No. línea";
                    rstLinDiaProd.Validate("Concepto proyecto", rstLinProdPta."Concepto proyecto");
                    rstLinDiaProd.Validate(Revertido, blnRevertir);
                    rstLinDiaProd.Validate("Lot No.", rstLinProdPta."Lot No.");
                    rstLinDiaProd.Insert(true);

                until rstLinProdPta.Next = 0;

            //CODEUNIT.RUN(CODEUNIT::"Item Jnl.-Post",rstLinDiaProd);
            /*
              IF blnRevertir THEN
                rstLinProdPta.MODIFYALL(Registrado,FALSE)
              ELSE
                rstLinProdPta.MODIFYALL(Registrado,TRUE);
            */
        end;

    end;


    [Scope('OnPrem')]
    procedure fntCalcularProduccion(var rstCabProd: Record "Produccion Planta")
    var
        PunLineas: Record "Lin. produccion planta";
        PunLinMP: Record "Lin. produccion planta";
        PunLinPT: Record "Lin. produccion planta";
        TotalKGMP: Decimal;
        TotalKGPT: Decimal;
        TotalVai: Decimal;
        TotalRej: Decimal;
        TotalAle: Decimal;
        rstConfEx: Record "Inventory Setup";
        PunProducto: Record Item;
        rstLineasSalida: Record "Lin. produccion planta";
        i: Integer;
        rstLinProd: Record "Lin. produccion planta";
        rstProd: Record Item;
        blnEntero: Boolean;
        blnCola: Boolean;
        blnPelado: Boolean;
        blnRoto: Boolean;
        rstILE: Record "Item Ledger Entry";
        rstILE2: Record "Item Ledger Entry";
        rstILEMP: Record "Item Ledger Entry";
        rstILEPT: Record "Item Ledger Entry";
        Rendimiento: array[5] of Decimal;
        rstLocation: Record Location;
    begin
        with rstCabProd do begin

            "CAL Pelado Entrada KG" := 0;
            "CAL Pelado Rejos KG" := 0;
            "CAL Pelado Aletas KG" := 0;
            "CAL Pelado Vaina RE (%)" := 0;
            "CAL Pelado Rejos RE (%)" := 0;
            "CAL Pelado Aletas RE (%)" := 0;
            "CAL Engorde Entrada KG" := 0;
            "CAL Engorde Salida KG" := 0;
            "CAL Engorde RE (%)" := 0;
            "CAL Envasado Entrada KG" := 0;
            "CAL Envasado Salida KG" := 0;
            "CAL Produccion RE (%)" := 0;
            "CAL Merma Pelado (%)" := 0;
            "CAL Vaina Sin Pelar KG" := 0;
            "CAL Vaina Sin Pelar (%)" := 0;
            "CAL Residuos KG" := 0;
            "CAL Vaina Sin Engorde KN" := 0;
            "CAL Rejo Sin Engorde KN" := 0;
            "CAL Entero Sin Clasificar KN" := 0;
            "CAL Entrada SE Reproceso" := 0;
            "CAL Entrada MP" := 0;
            "CAL Salida KG Semielaborado" := 0;
            "CAL Vaina MP" := 0;
            "CAL Entero MP" := 0;
            "CAL Rejo MP" := 0;
            "CAL Rejo Sucio PT" := 0;
            "CAL Rejo Sucio MP" := 0;
            "CAL Rejo a Congelar PT" := 0;
            "CAL Entrada PT" := 0;
            "FRE Clasificacion Entrada KG" := 0;
            "FRE Clasificacion Salida KG" := 0;
            "FRE Clasificacion Pelado KG" := 0;
            "FRE Clasificacion Cola KG" := 0;
            "FRE Clasificacion Entero KG" := 0;
            "FRE Clas. Pelado RE (%)" := 0;
            "FRE Clas. Cola RE (%)" := 0;
            "FRE Clas. Entero RE (%)" := 0;
            "FRE Pelado Entrada KG" := 0;
            "FRE Pelado Salida KG" := 0;
            "FRE Pelado RE (%)" := 0;
            "FRE Envasado Entrada KG" := 0;
            "FRE Envasado Salida KG" := 0;
            "FRE Produccion RE (%)" := 0;
            "FRE Merma Clasificacion (%)" := 0;
            "FRE Seccionado Entrada KG" := 0;
            "FRE Seccionado Salida KG" := 0;
            "FRE Seccionado Entrada RE (%)" := 0;
            "FRE Entrada KG" := 0;
            "FRE Residuos Entrada" := 0;
            "FRE Residuos Entrada (%)" := 0;
            "PES Entera Entrada KG" := 0;
            "PES Entera Salida KG" := 0;
            "PES Entera Clasif. RE (%)" := 0;
            "PES Entera Clasif. Merma KG" := 0;
            "PES Entera Clasif. Descarte KG" := 0;
            "PES Clasificacion Descarte" := 0;
            "PES Clasificacion RE (%)" := 0;
            "PES Envasado Entrada KG" := 0;
            "PES Envasado Salida KG" := 0;
            "PES Produccion RE (%)" := 0;
            "PES Produccion Merma" := 0;
            "PES MP Entrada KG" := 0;
            "PES Carioca Entrada KG" := 0;
            "PES Carioca Entrada RE (%)" := 0;
            "PES Entera Entrada RE (%)" := 0;
            "PES Carioca Proceso-Out KG" := 0;
            "PES Carioca Proceso RE (%)" := 0;
            "PES Carioca RE (%)" := 0;
            "PES Filete S/E RE (%)" := 0;
            "PES Filete S/E Entrada KG" := 0;
            "PES Filete S/E Salida KG" := 0;
            "PES Filete S/E Merma" := 0;
            "PES Filete C/E Entrada KG" := 0;
            "PES Filete C/E Salida KG" := 0;
            "PES Filete C/E RE (%)" := 0;
            "PES Filete C/E Merma" := 0;
            "PES Filete C/E Residuos" := 0;
            "PES Filete S/E Residuos" := 0;
            "PES Carioca Descarte" := 0;
            "PES Carioca Merma (%)" := 0;
            "PES HG Entrada KG" := 0;
            "PES HG Salida KG" := 0;
            "PES HG RE (%)" := 0;
            "PES HG Descarte" := 0;
            "PES HG Merma (%)" := 0;
            "PES Carioca HG Entrada KG" := 0;
            "PES Carioca HG Salida KG" := 0;
            "PES Carioca HG RE (%)" := 0;
            "PES Carioca HG Descarte" := 0;
            "PES Carioca HG Merma (%)" := 0;
            "PES Filete Clasif. Entrada KG" := 0;
            "PES Filete Clasif. Salida KG" := 0;
            "ANC Entera Entrada KG" := 0;
            "ANC Entera Salida KG" := 0;
            "ANC Envasado Entrada KG" := 0;
            "ANC Envasado Salida KG" := 0;
            "ANC Produccion RE (%)" := 0;


            if not rstCabProd.Registrado then begin

                case rstCabProd."Global Dimension 2" of
                    'CAL', 'CLM':
                        begin

                            TestField("Produccion terminada");
                            PunLineas.Reset;
                            rstConfEx.Get();

                            Clear(PunLineas);
                            PunLineas.SetRange("Nombre libro diario", "Nombre libro diario");
                            PunLineas.SetRange("Nombre seccion diario", "Nombre seccion diario");
                            PunLineas.SetRange("No. documento", "No. documento");
                            PunLinMP.Copy(PunLineas);
                            PunLinPT.Copy(PunLineas);
                            PunLinMP.SetRange(Tipo, PunLinMP.Tipo::Salida);
                            PunLinPT.SetRange(Tipo, PunLinPT.Tipo::Entrada);

                            if PunLinMP.Find('-') then
                                repeat

                                    if PunLinMP.Familia <> rstConfEx."Familia CAL SE" then begin


                                    end
                                    else begin

                                        "CAL Entrada SE Reproceso" += Abs(PunLinMP."Kilos brutos");

                                    end;

                                    "CAL Pelado Entrada KG" += Abs(PunLinMP."Kilos brutos");

                                    if PunLinMP.Subfamilia = rstConfEx."Subfamilia CAL Entero MP" then
                                        "CAL Entero MP" += Abs(PunLinMP."Kilos brutos");

                                    if PunLinMP.Subfamilia = rstConfEx."Subfamilia CAL Rejo MP" then
                                        "CAL Rejo MP" += Abs(PunLinMP."Kilos brutos");

                                    if PunLinMP.Subfamilia = rstConfEx."Subfamilia CAL Vaina MP" then
                                        "CAL Vaina MP" += Abs(PunLinMP."Kilos brutos");

                                    if PunLinMP.Subfamilia = rstConfEx."Subfamilia CAL Rejo Sucio MP" then
                                        "CAL Rejo Sucio MP" += Abs(PunLinMP."Kilos brutos");

                                    TotalKGMP += PunLinMP."Kilos netos";
                                    "CAL Entrada MP" += PunLinMP."Kilos netos";

                                until PunLinMP.Next = 0;

                            if PunLinPT.Find('-') then
                                repeat

                                    PunProducto.Reset;
                                    PunProducto.Get(PunLinPT.Clasificacion);

                                    if PunLinPT.Subfamilia = rstConfEx."Subfamilia CAL Vaina" then
                                        "CAL Engorde Salida KG" += Abs(PunLinPT."Kilos netos");
                                    if PunLinPT.Subfamilia = rstConfEx."Subfamilia CAL Roto" then
                                        "CAL Engorde Salida KG" += Abs(PunLinPT."Kilos netos");
                                    if PunLinPT.Subfamilia = rstConfEx."Subfamilia CAL Vaina SE" then begin
                                        "CAL Vaina Sin Engorde KN" += Abs(PunLinPT."Kilos netos");
                                        "CAL Salida KG Semielaborado" += Abs(PunLinPT."Kilos netos");
                                    end;
                                    if PunLinPT.Subfamilia = rstConfEx."Subfamilia CAL Rejo Sucio PT" then
                                        "CAL Rejo Sucio PT" += Abs(PunLinPT."Kilos netos");
                                    if PunLinPT.Subfamilia = rstConfEx."Subfamilia CAL Aletas" then
                                        "CAL Pelado Aletas KG" += Abs(PunLinPT."Kilos netos");
                                    if PunLinPT.Subfamilia = rstConfEx."Subfamilia CAL Rejos" then
                                        "CAL Pelado Rejos KG" += Abs(PunLinPT."Kilos netos");
                                    if PunLinPT.Subfamilia <> rstConfEx."Subfamilia CAL Residuos" then
                                        "CAL Envasado Salida KG" += Abs(PunLinPT."Kilos netos");
                                    if PunLinPT.Subfamilia = rstConfEx."Subfamilia CAL Rejo SE" then begin
                                        "CAL Rejo Sin Engorde KN" += PunLinPT."Kilos netos";
                                        "CAL Salida KG Semielaborado" += Abs(PunLinPT."Kilos netos");
                                    end;

                                    if PunLinPT.Subfamilia = rstConfEx."Subfamilia CAL Residuos" then
                                        "CAL Residuos KG" += PunLinPT."Kilos netos";
                                    if PunLinPT.Subfamilia = rstConfEx."Subfamilia CAL Ent S/Clas" then
                                        "CAL Entero Sin Clasificar KN" += PunLinPT."Kilos netos";

                                    TotalKGPT += PunLinPT."Kilos netos";
                                    "CAL Entrada PT" += PunLinPT."Kilos netos";
                                    Clear(rstLocation);
                                    rstLocation.Get(PunLinPT."Cod. deposito");
                                    if (PunLinPT."No. Pallet" = '') and (PunProducto."Lleva No. Pallet" = true) and (rstLocation."Don't require pallet no." = false) then begin
                                        clear(cduDescargas);
                                        PunLinPT.Validate("No. Pallet", cduDescargas.fntGetNextPalletNo(PunLinPT.Buque, rstCabProd."Fecha registro", ''));
                                        PunLinPT.Modify;

                                    end;

                                until PunLinPT.Next = 0;
                            /*
                            CLEAR(PunLineas);
                            PunLineas.SETRANGE(PunLineas."Nombre libro diario","Nombre libro diario");
                            PunLineas.SETRANGE(PunLineas."Nombre seccion diario","Nombre seccion diario");
                            PunLineas.SETRANGE("No. documento","No. documento");
                            IF PunLineas.FIND('-') THEN
                            REPEAT

                              CASE COPYSTR(PunLineas.Familia,1,2) OF
                                'PT':

                                'MP':
                                  BEGIN


                                  END;

                                END;

                            UNTIL PunLineas.NEXT = 0;
                            */
                            if "CAL Engorde Entrada KG" <> 0 then
                                "CAL Pelado Vaina KG" += "CAL Engorde Entrada KG";
                            if "CAL Pelado Vaina KG" <> 0 then
                                "CAL Engorde Entrada KG" := "CAL Pelado Vaina KG"
                            else
                                "CAL Engorde Entrada KG" := "CAL Engorde Salida KG";
                            if "CAL Pelado Entrada KG" > 0 then
                                "CAL Pelado Vaina RE (%)" := Round((("CAL Pelado Vaina KG" / "CAL Pelado Entrada KG") * 100), 0.01);
                            if "CAL Pelado Entrada KG" > 0 then
                                "CAL Pelado Rejos RE (%)" := Round((("CAL Pelado Rejos KG" / "CAL Pelado Entrada KG") * 100), 0.01);
                            if "CAL Pelado Entrada KG" > 0 then
                                "CAL Pelado Aletas RE (%)" := Round((("CAL Pelado Aletas KG" / "CAL Pelado Entrada KG") * 100), 0.01);
                            if "CAL Pelado Entrada KG" > 0 then
                                "CAL Merma Pelado (%)" :=
                                                          (1 - (("CAL Pelado Vaina KG" + "CAL Pelado Rejos KG" + "CAL Pelado Aletas KG") / "CAL Pelado Entrada KG")) * 100
                              ;
                            "CAL Envasado Entrada KG" := "CAL Pelado Rejos KG" + "CAL Pelado Aletas KG" + "CAL Engorde Salida KG" +
                                                          "CAL Vaina Sin Engorde KN" + "CAL Rejo Sin Engorde KN" + "CAL Entero Sin Clasificar KN";

                            if "CAL Rejo Sucio PT" <> 0 then
                                "CAL Rejo a Congelar PT" := Abs(PunLineas."Kilos brutos");

                            if "CAL Engorde Entrada KG" > 0 then
                                "CAL Engorde RE (%)" := -(1 - ("CAL Engorde Salida KG" / "CAL Engorde Entrada KG")) * 100;

                            if "CAL Engorde Salida KG" = 0 then begin

                                /*
                                "CAL Pelado Vaina KG" := 0;
                                "CAL Pelado Vaina RE (%)" := 0;
                                */
                                "CAL Engorde Entrada KG" := 0;
                                "CAL Engorde Salida KG" := 0;
                                "CAL Engorde RE (%)" := 0;

                            end;

                            if "CAL Residuos KG" = 0 then
                                "CAL Residuos KG" := ("CAL Entrada MP" + "CAL Entrada SE Reproceso") -
                                                                    ("CAL Engorde Entrada KG" + "CAL Pelado Rejos KG" +
                                                                    "CAL Pelado Aletas KG" + "CAL Rejo Sucio PT");

                            Modify;


                        end;
                    'FRE':
                        begin

                            TestField("Produccion terminada");
                            PunLineas.Reset;
                            PunLinMP.Reset;
                            PunLinPT.Reset;
                            rstConfEx.Get();
                            TotalKGMP := 0;
                            TotalKGPT := 0;

                            "FRE Residuos Entrada" := 0;
                            //Verificar el tipo de produccion
                            Clear(rstLinProd);
                            rstLinProd.SetRange("Nombre libro diario", "Nombre libro diario");
                            rstLinProd.SetRange("Nombre seccion diario", "Nombre seccion diario");
                            rstLinProd.SetRange("No. documento", "No. documento");
                            if rstLinProd.FindSet then
                                repeat

                                    Clear(rstProd);
                                    if rstProd.Get(rstLinProd.Clasificacion) then begin

                                        if rstProd.Subfamilia in [rstConfEx."Subfamilia LAN Entero MP", rstConfEx."Subfamilia LAN Entero PT"] then
                                            blnEntero := true;

                                        if (rstProd.Subfamilia = rstConfEx."Subfamilia LAN Pelado PT") or (rstProd.Subfamilia = rstConfEx."Subfamilia LAN P&D PT") then
                                            blnPelado := true;

                                        if rstProd.Subfamilia in [rstConfEx."Subfamilia LAN Cola MP", rstConfEx."Subfamilia LAN Cola PT"] then
                                            blnCola := true;

                                        if rstProd.Subfamilia in [rstConfEx."Subfamilia LAN Roto MP"] then
                                            blnRoto := true;


                                    end;

                                until rstLinProd.Next = 0;

                            //Si se dan los tres productos, error
                            if blnEntero and blnPelado and blnCola and blnRoto then
                                Error('Ha generado una producción no admitida');
                            //Si hay entero y cola, no hay producción de pelado. OK
                            //Si hay pelado y cola, hay cola que se manda a pelar. OK
                            //Si hay entero y pelado, hay entero que se manda a seccionar y luego pelar. OK
                            //Si sólo se da uno, error
                            if blnEntero then
                                i += 1;
                            if blnPelado then
                                i += 1;
                            if blnCola then
                                i += 1;
                            if blnRoto then
                                i += 2;

                            if i < 2 then
                                if not Confirm('Ha generado una producción no admitida, ¿desea continuar?') then
                                    Error('Se ha detenido el proceso');

                            i := 0;

                            for i := 1 to 5 do begin

                                Rendimiento[i] := 0;

                            end;

                            Clear(PunLineas);
                            PunLineas.SetRange("Nombre libro diario", "Nombre libro diario");
                            PunLineas.SetRange("Nombre seccion diario", "Nombre seccion diario");
                            PunLineas.SetRange("No. documento", "No. documento");
                            PunLinMP.Copy(PunLineas);
                            PunLinPT.Copy(PunLineas);
                            PunLinMP.SetRange(Tipo, PunLinMP.Tipo::Salida);
                            PunLinPT.SetRange(Tipo, PunLinPT.Tipo::Entrada);

                            if blnCola then
                                "FRE Pelado Entrada KG" := "FRE Clasificacion Pelado KG";

                            if PunLinMP.Find('-') then
                                repeat

                                    // := PunLinMP.Actividad;

                                    PunProducto.Reset;
                                    PunProducto.Get(PunLinMP.Clasificacion);

                                    if PunProducto.Subfamilia in [rstConfEx."Subfamilia LAN Entero MP", rstConfEx."Subfamilia LAN Entero PT"] then
                                        "FRE Seccionado Entrada KG" += PunLinMP."Kilos netos";

                                    if blnCola then
                                        if PunProducto.Subfamilia in [rstConfEx."Subfamilia LAN Cola MP", rstConfEx."Subfamilia LAN Cola PT"] then
                                            "FRE Pelado Entrada KG" += PunLinMP."Kilos netos";

                                    TotalKGMP += PunLinMP."Kilos netos";
                                    "FRE Entrada KG" += PunLinMP."Kilos netos";

                                until PunLinMP.Next = 0;

                            //"FRE Clasificación Entrada KG" := TotalKGMP;

                            if PunLinPT.Find('-') then
                                repeat

                                    PunProducto.Reset;
                                    PunProducto.Get(PunLinPT.Clasificacion);

                                    if (blnCola and not blnPelado) then
                                        if CopyStr(PunProducto.Familia, 1, 2) = 'PT' then begin

                                            if PunProducto.Subfamilia = rstConfEx."Subfamilia LAN Pelado PT" then
                                                "FRE Pelado Salida KG" += PunLinPT."Kilos netos";
                                            if PunProducto.Subfamilia = rstConfEx."Subfamilia LAN Entero PT" then
                                                "FRE Clasificacion Entero KG" += PunLinPT."Kilos netos";
                                            if PunProducto.Subfamilia = rstConfEx."Subfamilia LAN Cola PT" then
                                                "FRE Clasificacion Cola KG" += PunLinPT."Kilos netos";
                                            "FRE Seccionado Salida KG" += PunLinPT."Kilos netos";
                                            if PunProducto.Subfamilia = rstConfEx."Subfamilia LAN Residuos" then
                                                "FRE Residuos Entrada" += PunLinPT."Kilos netos";

                                        end;
                                    Clear(rstLocation);
                                    rstLocation.Get(PunLinPT."Cod. deposito");
                                    if CopyStr(PunProducto.Familia, 1, 2) = 'SE' then begin

                                        if blnPelado then
                                            if PunProducto.Subfamilia = rstConfEx."Subfamilia LAN Cola PT" then
                                                "FRE Clasificacion Pelado KG" += PunLinPT."Kilos netos";
                                        if blnCola then
                                            "FRE Seccionado Salida KG" += PunLinPT."Kilos netos";

                                    end;

                                    TotalKGPT += PunLinPT."Kilos netos";
                                    Clear(rstLocation);
                                    rstLocation.Get(PunLinPT."Cod. deposito");
                                    if (PunLinPT."No. Pallet" = '') and (PunProducto."Lleva No. Pallet" = true) and (rstLocation."Don't require pallet no." = false) then begin
                                        clear(cduDescargas);
                                        PunLinPT.Validate("No. Pallet", cduDescargas.fntGetNextPalletNo(PunLinPT.Buque, rstCabProd."Fecha registro", ''));
                                        PunLinPT.Modify;

                                    end;

                                until PunLinPT.Next = 0;

                            if blnCola then
                                "FRE Clasificacion Entrada KG" := "FRE Seccionado Salida KG";

                            if "FRE Clasificacion Entrada KG" > 0 then
                                "FRE Clas. Pelado RE (%)" := Round((("FRE Clasificacion Pelado KG" / "FRE Clasificacion Entrada KG") * 100), 0.01);
                            if "FRE Clasificacion Entrada KG" > 0 then
                                "FRE Clas. Entero RE (%)" := Round((("FRE Clasificacion Entero KG" / "FRE Clasificacion Entrada KG") * 100), 0.01);
                            if "FRE Clasificacion Entrada KG" > 0 then
                                "FRE Clas. Cola RE (%)" := Round((("FRE Clasificacion Cola KG" / "FRE Clasificacion Entrada KG") * 100), 0.01);
                            if "FRE Clasificacion Entrada KG" > 0 then
                                "FRE Merma Clasificacion (%)" := (1 - (("FRE Clasificacion Pelado KG" + "FRE Clasificacion Entero KG" +
                                                 "FRE Clasificacion Cola KG") / "FRE Clasificacion Entrada KG")) * 100;


                            "FRE Envasado Entrada KG" := "FRE Clasificacion Entero KG" + "FRE Clasificacion Cola KG" + "FRE Pelado Salida KG" + "FRE Clasificacion Pelado KG";
                            "FRE Envasado Salida KG" := TotalKGPT;
                            if "FRE Envasado Entrada KG" = 0 then
                                "FRE Envasado Entrada KG" := TotalKGPT;
                            if "FRE Pelado Entrada KG" > 0 then
                                "FRE Pelado RE (%)" := -(1 - ("FRE Pelado Salida KG" / "FRE Pelado Entrada KG")) * 100;
                            if "FRE Seccionado Entrada KG" > 0 then
                                "FRE Seccionado Entrada RE (%)" := -(1 - ("FRE Seccionado Salida KG" / "FRE Seccionado Entrada KG")) * 100;

                            if ("FRE Entrada KG" <> 0) and ("FRE Envasado Salida KG" <> 0) then
                                "FRE Produccion RE (%)" := Round((("FRE Envasado Entrada KG" / "FRE Entrada KG") * 100), 0.01);
                            Modify;


                        end;
                    else begin

                        TestField("Produccion terminada");
                        PunLineas.Reset;
                        PunLinMP.Reset;
                        PunLinPT.Reset;
                        rstConfEx.Get();
                        TotalKGMP := 0;
                        TotalKGPT := 0;

                        "PES Entera Entrada KG" := 0;
                        "PES Entera Salida KG" := 0;
                        "PES Entera Clasif. RE (%)" := 0;
                        "PES Entera Clasif. Merma KG" := 0;
                        "PES Entera Clasif. Descarte KG" := 0;
                        "PES Clasificacion Descarte" := 0;
                        "PES Clasificacion RE (%)" := 0;
                        "PES Envasado Entrada KG" := 0;
                        "PES Envasado Salida KG" := 0;
                        "PES Produccion RE (%)" := 0;
                        "PES Produccion Merma" := 0;
                        "PES MP Entrada KG" := 0;
                        "PES Carioca Entrada KG" := 0;
                        "PES Carioca Entrada RE (%)" := 0;
                        "PES Entera Entrada RE (%)" := 0;
                        "PES Carioca Proceso-Out KG" := 0;
                        "PES Carioca Proceso RE (%)" := 0;
                        "PES Carioca RE (%)" := 0;
                        "PES Filete S/E RE (%)" := 0;
                        "PES Filete S/E Entrada KG" := 0;
                        "PES Filete S/E Salida KG" := 0;
                        "PES Filete S/E Merma" := 0;
                        "PES Filete C/E Entrada KG" := 0;
                        "PES Filete C/E Salida KG" := 0;
                        "PES Filete C/E RE (%)" := 0;
                        "PES Filete C/E Merma" := 0;
                        "PES Filete C/E Residuos" := 0;
                        "PES Filete S/E Residuos" := 0;
                        "PES Carioca Descarte" := 0;
                        "PES Carioca Merma (%)" := 0;
                        "PES HG Entrada KG" := 0;
                        "PES HG Salida KG" := 0;
                        "PES HG RE (%)" := 0;
                        "PES HG Descarte" := 0;
                        "PES HG Merma (%)" := 0;
                        "PES Carioca HG Entrada KG" := 0;
                        "PES Carioca HG Salida KG" := 0;
                        "PES Carioca HG RE (%)" := 0;
                        "PES Carioca HG Descarte" := 0;
                        "PES Carioca HG Merma (%)" := 0;
                        "PES Filete Clasif. Entrada KG" := 0;
                        "PES Filete Clasif. Salida KG" := 0;

                        TestField("Produccion terminada");
                        rstILE.Reset;
                        rstILEMP.Reset;
                        rstILEPT.Reset;
                        rstConfEx.Get();
                        TotalKGMP := 0;
                        TotalKGPT := 0;

                        i := 0;

                        for i := 1 to 5 do begin

                            Rendimiento[i] := 0;

                        end;

                        Clear(PunLineas);
                        PunLineas.SetRange("Nombre libro diario", "Nombre libro diario");
                        PunLineas.SetRange("Nombre seccion diario", "Nombre seccion diario");
                        PunLineas.SetRange("No. documento", "No. documento");
                        PunLinMP.CopyFilters(PunLineas);
                        PunLinPT.CopyFilters(PunLineas);
                        PunLinMP.SetRange(Tipo, PunLinMP.Tipo::Salida);
                        PunLinPT.SetRange(Tipo, PunLinPT.Tipo::Entrada);

                        if PunLinMP.Find('-') then
                            repeat

                                // := rstILEMP.Actividad;

                                PunProducto.Reset;
                                PunProducto.Get(PunLinMP.Clasificacion);
                                TotalKGMP += PunLinMP."Kilos netos";
                                rstCabProd."PES MP Entrada KG" += PunLinMP."Kilos netos";

                            until PunLinMP.Next = 0;

                        //"FRE Clasificación Entrada KG" := TotalKGMP;

                        if PunLinPT.Find('-') then
                            repeat

                                PunProducto.Reset;
                                PunProducto.Get(PunLinPT.Clasificacion);

                                TotalKGPT += PunLinPT."Kilos netos";
                                rstCabProd."PES Envasado Salida KG" += PunLinPT."Kilos netos";

                                Clear(rstLocation);
                                rstLocation.Get(PunLinPT."Cod. deposito");
                                if (PunLinPT."No. Pallet" = '') and (PunProducto."Lleva No. Pallet" = true) and (rstLocation."Don't require pallet no." = false) then begin
                                    clear(cduDescargas);
                                    PunLinPT.Validate("No. Pallet", cduDescargas.fntGetNextPalletNo(PunLinPT.Buque, rstCabProd."Fecha registro", ''));
                                    PunLinPT.Modify;

                                end;

                            until PunLinPT.Next = 0;
                        rstCabProd."PES Produccion Merma" := (rstCabProd."PES MP Entrada KG" - rstCabProd."PES Envasado Salida KG");
                        rstCabProd."PES Produccion RE (%)" := Round((rstCabProd."PES Envasado Salida KG" / rstCabProd."PES MP Entrada KG") * 100, 0.01);

                        Modify;

                    end;

                end;

            end;

            if rstCabProd.Registrado then begin

                case rstCabProd."Global Dimension 2" of
                    'CAL', 'CLM':
                        begin

                            TestField("Produccion terminada");
                            rstILE.Reset;
                            rstConfEx.Get();

                            Clear(rstILE2);
                            rstILE2.SetRange("Nombre libro diario", "Nombre libro diario");
                            rstILE2.SetRange("Nombre seccion diario", "Nombre seccion diario");
                            rstILE2.SetRange("Document No.", "No. documento");
                            rstILEMP.CopyFilters(rstILE2);
                            rstILEPT.CopyFilters(rstILE2);
                            rstILEMP.SetRange(Revertido, false);
                            rstILEPT.SetRange(Revertido, false);
                            rstILEMP.SetRange("Entry Type", rstILEMP."Entry Type"::"Negative Adjmt.");
                            rstILEPT.SetRange("Entry Type", rstILEMP."Entry Type"::"Positive Adjmt.");

                            if rstILEMP.Find('-') then
                                repeat

                                    // := rstILEMP.Actividad;

                                    PunProducto.Reset;
                                    PunProducto.Get(rstILEMP."Item No.");

                                    TotalKGMP += rstILEMP."Gross kilos" * -1;
                                    //"CAL Entero MP" += rstILEMP."Net kilos"*-1;
                                    "CAL Entrada MP" += rstILEMP."Gross kilos" * -1;

                                until rstILEMP.Next = 0;

                            //"FRE Clasificación Entrada KG" := TotalKGMP;

                            if rstILEPT.Find('-') then
                                repeat

                                    PunProducto.Reset;
                                    PunProducto.Get(rstILEPT."Item No.");

                                    TotalKGPT += rstILEPT."Net kilos";
                                    "CAL Entrada PT" += rstILE."Net kilos";

                                until rstILEPT.Next = 0;

                            Clear(rstILE);
                            rstILE.SetRange(rstILE."Nombre libro diario", "Nombre libro diario");
                            rstILE.SetRange(rstILE."Nombre seccion diario", "Nombre seccion diario");
                            rstILE.SetRange("Document No.", "No. documento");
                            rstILE.SetRange(Revertido, false);
                            if rstILE.Find('-') then
                                repeat

                                    case CopyStr(rstILE.Family, 1, 2) of
                                        'PT':
                                            begin

                                                if rstILE.Subfamily = rstConfEx."Subfamilia CAL Vaina" then
                                                    "CAL Engorde Salida KG" += rstILE."Net kilos";
                                                if rstILE.Subfamily = rstConfEx."Subfamilia CAL Roto" then
                                                    "CAL Engorde Salida KG" += rstILE."Net kilos";
                                                if rstILE.Subfamily = rstConfEx."Subfamilia CAL Vaina SE" then begin
                                                    "CAL Vaina Sin Engorde KN" += rstILE."Net kilos";
                                                    "CAL Salida KG Semielaborado" += rstILE."Net kilos";
                                                end;
                                                if rstILE.Subfamily = rstConfEx."Subfamilia CAL Rejo Sucio PT" then
                                                    "CAL Rejo Sucio PT" += rstILE."Net kilos";
                                                if rstILE.Subfamily = rstConfEx."Subfamilia CAL Aletas" then
                                                    "CAL Pelado Aletas KG" += rstILE."Net kilos";
                                                if rstILE.Subfamily = rstConfEx."Subfamilia CAL Rejos" then
                                                    "CAL Pelado Rejos KG" += rstILE."Net kilos";
                                                if rstILE.Subfamily <> rstConfEx."Subfamilia CAL Residuos" then
                                                    "CAL Envasado Salida KG" += rstILE."Net kilos";
                                                if rstILE.Subfamily = rstConfEx."Subfamilia CAL Rejo SE" then begin
                                                    "CAL Rejo Sin Engorde KN" += rstILE."Net kilos";
                                                    "CAL Salida KG Semielaborado" += rstILE."Net kilos";
                                                end;

                                                if rstILE.Subfamily = rstConfEx."Subfamilia CAL Residuos" then
                                                    "CAL Residuos KG" += rstILE."Net kilos";
                                                if rstILE.Subfamily = rstConfEx."Subfamilia CAL Ent S/Clas" then
                                                    "CAL Entero Sin Clasificar KN" += rstILE."Net kilos";

                                            end;
                                        'MP':
                                            begin

                                                "CAL Pelado Entrada KG" += rstILE."Gross kilos";

                                                if rstILE.Subfamily = rstConfEx."Subfamilia CAL Entero MP" then
                                                    "CAL Entero MP" += rstILE."Gross kilos";

                                                if rstILE.Subfamily = rstConfEx."Subfamilia CAL Rejo MP" then
                                                    "CAL Rejo MP" += rstILE."Gross kilos";

                                                if rstILE.Subfamily = rstConfEx."Subfamilia CAL Vaina MP" then
                                                    "CAL Vaina MP" += rstILE."Gross kilos";

                                                if rstILE.Subfamily = rstConfEx."Subfamilia CAL Rejo Sucio MP" then
                                                    "CAL Rejo Sucio MP" += rstILE."Gross kilos";

                                            end;
                                        'SE':
                                            begin

                                                "CAL Entrada SE Reproceso" += rstILE."Gross kilos";

                                            end;

                                    end;

                                until rstILE.Next = 0;

                            "CAL Entrada MP" := Abs("CAL Entrada MP");
                            "CAL Pelado Entrada KG" := Abs("CAL Pelado Entrada KG");
                            "CAL Entero MP" := Abs("CAL Entero MP");
                            "CAL Rejo MP" := Abs("CAL Rejo MP");
                            "CAL Vaina MP" := Abs("CAL Vaina MP");
                            "CAL Rejo Sucio MP" := Abs("CAL Rejo Sucio MP");

                            "CAL Pelado Vaina KG" += "CAL Engorde Entrada KG";
                            /*
                            IF "CAL Pelado Vaina KG" <> 0 THEN
                              "CAL Engorde Entrada KG" := "CAL Pelado Vaina KG"
                            ELSE
                              "CAL Engorde Entrada KG" := "CAL Engorde Salida KG";
                              */
                            if "CAL Engorde Entrada KG" <> 0 then begin
                                if "CAL Pelado Entrada KG" > 0 then
                                    "CAL Pelado Vaina RE (%)" := Round((("CAL Pelado Vaina KG" / "CAL Pelado Entrada KG") * 100), 0.01);
                                if "CAL Pelado Entrada KG" > 0 then
                                    "CAL Pelado Rejos RE (%)" := Round((("CAL Pelado Rejos KG" / "CAL Pelado Entrada KG") * 100), 0.01);
                                if "CAL Pelado Entrada KG" > 0 then
                                    "CAL Pelado Aletas RE (%)" := Round((("CAL Pelado Aletas KG" / "CAL Pelado Entrada KG") * 100), 0.01);
                                if ("CAL Pelado Entrada KG" > 0) and ("CAL Engorde Entrada KG" <> 0) then
                                    "CAL Merma Pelado (%)" :=
                                                              (1 - (("CAL Pelado Vaina KG" + "CAL Pelado Rejos KG" + "CAL Pelado Aletas KG") / "CAL Pelado Entrada KG")) * 100
                                  ;
                            end
                            else begin
                                "CAL Pelado Vaina RE (%)" := Round((("CAL Pelado Vaina KG" / "CAL Salida KG Semielaborado") * 100), 0.01);
                                "CAL Pelado Rejos RE (%)" := Round((("CAL Pelado Rejos KG" / "CAL Salida KG Semielaborado") * 100), 0.01);
                                "CAL Pelado Aletas RE (%)" := Round((("CAL Pelado Aletas KG" / "CAL Salida KG Semielaborado") * 100), 0.01);
                                "CAL Merma Pelado (%)" := (1 - (("CAL Pelado Vaina KG" + "CAL Pelado Rejos KG" + "CAL Pelado Aletas KG") / "CAL Salida KG Semielaborado")) * 100;
                            end;
                            "CAL Envasado Entrada KG" := "CAL Pelado Rejos KG" + "CAL Pelado Aletas KG" + "CAL Engorde Salida KG" +
                                                         "CAL Vaina Sin Engorde KN" + "CAL Rejo Sin Engorde KN" + "CAL Entero Sin Clasificar KN";

                            if "CAL Rejo Sucio PT" <> 0 then
                                "CAL Rejo a Congelar PT" := Abs(rstILE."Gross kilos");

                            if "CAL Engorde Entrada KG" > 0 then
                                "CAL Engorde RE (%)" := -(1 - ("CAL Engorde Salida KG" / "CAL Engorde Entrada KG")) * 100;

                            if "CAL Engorde Salida KG" = 0 then begin
                                /*
                                  "CAL Pelado Vaina KG" := 0;
                                  "CAL Pelado Vaina RE (%)" := 0;
                                  */
                                "CAL Engorde Entrada KG" := 0;
                                "CAL Engorde Salida KG" := 0;
                                "CAL Engorde RE (%)" := 0;

                            end;

                            if "CAL Residuos KG" = 0 then
                                "CAL Residuos KG" := ("CAL Entrada MP" + "CAL Entrada SE Reproceso") -
                                                                   ("CAL Engorde Entrada KG" + "CAL Pelado Rejos KG" +
                                                                   "CAL Pelado Aletas KG" + "CAL Rejo Sucio PT");

                            Modify;

                        end;

                    'FRE':
                        begin

                            TestField("Produccion terminada");
                            PunLineas.Reset;
                            PunLinMP.Reset;
                            PunLinPT.Reset;
                            rstConfEx.Get();
                            TotalKGMP := 0;
                            TotalKGPT := 0;

                            "FRE Residuos Entrada" := 0;
                            //Verificar el tipo de produccion
                            Clear(rstILE);
                            rstILE.SetRange("Nombre libro diario", "Nombre libro diario");
                            rstILE.SetRange("Nombre seccion diario", "Nombre seccion diario");
                            rstILE.SetRange("Document No.", "No. documento");
                            if rstILE.FindSet then
                                repeat

                                    Clear(rstProd);
                                    if rstProd.Get(rstILE."Item No.") then begin

                                        if rstProd.Subfamilia in [rstConfEx."Subfamilia LAN Entero MP", rstConfEx."Subfamilia LAN Entero PT"] then
                                            blnEntero := true;

                                        if (rstProd.Subfamilia = rstConfEx."Subfamilia LAN Pelado PT") or (rstProd.Subfamilia = rstConfEx."Subfamilia LAN P&D PT") then
                                            blnPelado := true;

                                        if rstProd.Subfamilia in [rstConfEx."Subfamilia LAN Cola MP", rstConfEx."Subfamilia LAN Cola PT"] then
                                            blnCola := true;

                                        if rstProd.Subfamilia in [rstConfEx."Subfamilia LAN Roto MP"] then
                                            blnRoto := true;


                                    end;

                                until rstILE.Next = 0;

                            //Si se dan los tres productos, error
                            if blnEntero and blnPelado and blnCola then
                                Error('Ha generado una producción no admitida');
                            //Si hay entero y cola, no hay producción de pelado. OK
                            //Si hay pelado y cola, hay cola que se manda a pelar. OK
                            //Si hay entero y pelado, hay entero que se manda a seccionar y luego pelar. OK
                            //Si sólo se da uno, error
                            if blnEntero then
                                i += 1;
                            if blnPelado then
                                i += 1;
                            if blnCola then
                                i += 1;
                            if blnRoto then
                                i += 2;

                            if i < 2 then
                                if not Confirm('Ha generado una producción no admitida, ¿desea continuar?') then
                                    Error('Se ha detenido el proceso');

                            i := 0;

                            for i := 1 to 5 do begin

                                Rendimiento[i] := 0;

                            end;

                            Clear(rstILE2);
                            rstILE2.SetRange("Nombre libro diario", "Nombre libro diario");
                            rstILE2.SetRange("Nombre seccion diario", "Nombre seccion diario");
                            rstILE2.SetRange("Document No.", "No. documento");
                            rstILEMP.CopyFilters(rstILE2);
                            rstILEPT.CopyFilters(rstILE2);
                            rstILEMP.SetRange("Entry Type", rstILEMP."Entry Type"::"Negative Adjmt.");
                            rstILEPT.SetRange("Entry Type", rstILEMP."Entry Type"::"Positive Adjmt.");

                            if blnCola then
                                "FRE Pelado Entrada KG" := "FRE Clasificacion Pelado KG";

                            if rstILEMP.Find('-') then
                                repeat

                                    // := rstILEMP.Actividad;

                                    PunProducto.Reset;
                                    PunProducto.Get(rstILEMP."Item No.");

                                    if PunProducto.Subfamilia in [rstConfEx."Subfamilia LAN Entero MP", rstConfEx."Subfamilia LAN Entero PT"] then
                                        "FRE Seccionado Entrada KG" += rstILEMP."Net kilos" * -1;

                                    if blnCola then
                                        if PunProducto.Subfamilia in [rstConfEx."Subfamilia LAN Cola MP", rstConfEx."Subfamilia LAN Cola PT"] then
                                            "FRE Pelado Entrada KG" += rstILEMP."Net kilos" * -1;

                                    TotalKGMP += rstILEMP."Net kilos" * -1;
                                    "FRE Entrada KG" += rstILEMP."Net kilos" * -1;

                                until rstILEMP.Next = 0;

                            //"FRE Clasificación Entrada KG" := TotalKGMP;

                            if rstILEPT.Find('-') then
                                repeat

                                    PunProducto.Reset;
                                    PunProducto.Get(rstILEPT."Item No.");

                                    if (blnCola and not blnPelado) then
                                        if CopyStr(PunProducto.Familia, 1, 2) = 'PT' then begin

                                            if PunProducto.Subfamilia = rstConfEx."Subfamilia LAN Pelado PT" then
                                                "FRE Pelado Salida KG" += rstILEPT."Net kilos";
                                            if PunProducto.Subfamilia = rstConfEx."Subfamilia LAN Entero PT" then
                                                "FRE Clasificacion Entero KG" += rstILEPT."Net kilos";
                                            if PunProducto.Subfamilia = rstConfEx."Subfamilia LAN Cola PT" then
                                                "FRE Clasificacion Cola KG" += rstILEPT."Net kilos";
                                            "FRE Seccionado Salida KG" += rstILEPT."Net kilos";
                                            if PunProducto.Subfamilia = rstConfEx."Subfamilia LAN Residuos" then
                                                "FRE Residuos Entrada" += rstILEPT."Net kilos";

                                        end;

                                    if CopyStr(PunProducto.Familia, 1, 2) = 'SE' then begin

                                        if blnPelado then
                                            if PunProducto.Subfamilia = rstConfEx."Subfamilia LAN Cola PT" then
                                                "FRE Clasificacion Pelado KG" += rstILEPT."Net kilos";
                                        if blnCola then
                                            "FRE Seccionado Salida KG" += rstILEPT."Net kilos";

                                    end;

                                    TotalKGPT += rstILEPT."Net kilos";

                                until rstILEPT.Next = 0;

                            if blnCola then
                                "FRE Clasificacion Entrada KG" := "FRE Seccionado Salida KG";

                            if "FRE Clasificacion Entrada KG" > 0 then
                                "FRE Clas. Pelado RE (%)" := Round((("FRE Clasificacion Pelado KG" / "FRE Clasificacion Entrada KG") * 100), 0.01);
                            if "FRE Clasificacion Entrada KG" > 0 then
                                "FRE Clas. Entero RE (%)" := Round((("FRE Clasificacion Entero KG" / "FRE Clasificacion Entrada KG") * 100), 0.01);
                            if "FRE Clasificacion Entrada KG" > 0 then
                                "FRE Clas. Cola RE (%)" := Round((("FRE Clasificacion Cola KG" / "FRE Clasificacion Entrada KG") * 100), 0.01);
                            if "FRE Clasificacion Entrada KG" > 0 then
                                "FRE Merma Clasificacion (%)" := (1 - (("FRE Clasificacion Pelado KG" + "FRE Clasificacion Entero KG" +
                                                 "FRE Clasificacion Cola KG") / "FRE Clasificacion Entrada KG")) * 100;


                            "FRE Envasado Entrada KG" := "FRE Clasificacion Entero KG" + "FRE Clasificacion Cola KG" + "FRE Pelado Salida KG" + "FRE Clasificacion Pelado KG";
                            "FRE Envasado Salida KG" := TotalKGPT;
                            if "FRE Envasado Entrada KG" = 0 then
                                "FRE Envasado Entrada KG" := TotalKGPT;
                            if "FRE Pelado Entrada KG" > 0 then
                                "FRE Pelado RE (%)" := -(1 - ("FRE Pelado Salida KG" / "FRE Pelado Entrada KG")) * 100;
                            if "FRE Seccionado Entrada KG" > 0 then
                                "FRE Seccionado Entrada RE (%)" := -(1 - ("FRE Seccionado Salida KG" / "FRE Seccionado Entrada KG")) * 100;

                            if ("FRE Entrada KG" <> 0) and ("FRE Envasado Salida KG" <> 0) then
                                "FRE Produccion RE (%)" := Round((("FRE Envasado Salida KG" / "FRE Entrada KG") * 100), 0.01);
                            Modify;

                        end;

                    else begin

                        TestField("Produccion terminada");
                        rstILE.Reset;
                        rstILEMP.Reset;
                        rstILEPT.Reset;
                        rstConfEx.Get();
                        TotalKGMP := 0;
                        TotalKGPT := 0;

                        i := 0;

                        for i := 1 to 5 do begin

                            Rendimiento[i] := 0;

                        end;

                        Clear(rstILE);
                        rstILE.SetRange("Nombre libro diario", "Nombre libro diario");
                        rstILE.SetRange("Nombre seccion diario", "Nombre seccion diario");
                        rstILE.SetRange("Document No.", "No. documento");
                        rstILEMP.Copy(rstILE);
                        rstILEPT.Copy(rstILE);
                        rstILEMP.SetRange("Entry Type", rstILEMP."Entry Type"::"Negative Adjmt.");
                        rstILEPT.SetRange("Entry Type", rstILEMP."Entry Type"::"Positive Adjmt.");

                        if rstILEMP.Find('-') then
                            repeat

                                // := rstILEMP.Actividad;

                                PunProducto.Reset;
                                PunProducto.Get(rstILEMP."Item No.");
                                TotalKGMP += rstILEMP."Net kilos";
                                rstCabProd."PES MP Entrada KG" += rstILEMP."Net kilos" * -1;

                            until rstILEMP.Next = 0;

                        //"FRE Clasificación Entrada KG" := TotalKGMP;

                        if rstILEPT.Find('-') then
                            repeat

                                PunProducto.Reset;
                                PunProducto.Get(rstILEPT."Item No.");

                                TotalKGPT += rstILEPT."Net kilos";
                                rstCabProd."PES Envasado Salida KG" += rstILEPT."Net kilos";

                            until rstILEPT.Next = 0;

                        rstCabProd."PES Produccion Merma" := (rstCabProd."PES MP Entrada KG" - rstCabProd."PES Envasado Salida KG");
                        rstCabProd."PES Produccion RE (%)" := Round((rstCabProd."PES Envasado Salida KG" / rstCabProd."PES MP Entrada KG") * 100, 0.01);

                        rstCabProd.Modify;

                    end;

                end;

            end;

        end;

    end;

    var
        blnSalir: Boolean;
        cduGestionExistencias: Codeunit GestionExistencias;
        cduGestionConsumos: Codeunit GestionConsumos;
        cduDescargas: Codeunit Descargas;

}