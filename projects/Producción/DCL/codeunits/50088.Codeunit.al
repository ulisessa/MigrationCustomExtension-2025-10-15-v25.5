codeunit 50088 "DCL Management"
{
    trigger OnRun()
    begin
    end;

    var
        optDCLTracking: Option " ","Lote origen a DCL específico","Lote origen a DCL abierto";

    procedure StartCDU22(ItemLedgEntry: Record "Item Ledger Entry"; ItemJnlLine: Record "Item Journal Line"; TransferItem: Boolean)
    var
        rstIS: Record "Inventory Setup";
        l_rst37: Record "Sales Line";
        ItemTrackingCode: Record "Item Tracking Code";
        Item: Record "Item";
        Text018: Label 'Item Tracking Serial No. %1 Lot No. %2 for Item No. %3 Variant %4 cannot be fully applied.';
    begin
        With ItemLedgEntry do begin

            Clear(rstIS);
            rstIS.Get();
            clear(Item);
            Item.get(ItemLedgEntry."Item No.");
            clear(ItemTrackingCode);
            ItemTrackingCode.Get(Item."Item Tracking Code");
            if not (("Document Type" in ["Document Type"::"Purchase Return Shipment", "Document Type"::"Purchase Receipt"])
            and ("Job No." <> '')) and (rstIS."Categoria productos pesca" <> ItemJnlLine."Item Category Code")
            then
                if (ItemLedgEntry.Quantity < 0) and
                    (ItemTrackingCode."SN Specific Tracking" or ItemTrackingCode."Lot Specific Tracking")
                then
                    Error(Text018, "Serial No.", "Lot No.", "Item No.", "Variant Code");

            If TransferItem then begin
                ItemLedgEntry."Global dimension 3 Code" := ItemJnlLine."New shortcut Dimension 3 Code";
                ItemLedgEntry."Global Dimension 4 Code" := ItemJnlLine."New shortcut Dimension 4 Code";
                ItemLedgEntry."Global Dimension 5 Code" := ItemJnlLine."New shortcut Dimension 5 Code";
                ItemLedgEntry."Global dimension 6 Code" := ItemJnlLine."New shortcut Dimension 6 Code";
                ItemLedgEntry."Global Dimension 7 Code" := ItemJnlLine."New shortcut Dimension 7 Code";
            end
            else begin
                ItemLedgEntry."Global dimension 3 Code" := ItemJnlLine."Shortcut Dimension 3 Code";
                ItemLedgEntry."Global Dimension 4 Code" := ItemJnlLine."Shortcut Dimension 4 Code";
                ItemLedgEntry."Global Dimension 5 Code" := ItemJnlLine."Shortcut Dimension 5 Code";
                ItemLedgEntry."Global dimension 6 Code" := ItemJnlLine."Shortcut Dimension 6 Code";
                ItemLedgEntry."Global Dimension 7 Code" := ItemJnlLine."Shortcut Dimension 7 Code";
            end;
            if ("Entry Type" = "Entry Type"::Sale) and ("Concepto ajuste" = '') and ("Document Type" <> "Document Type"::"Sales Credit Memo") then begin
                if "Document Type" <> "Document Type"::"Sales Shipment" then begin
                    Clear(l_rst37);
                    l_rst37.SetRange("Document No.", ItemLedgEntry."Document No.");
                    l_rst37.SetRange("Line No.", ItemLedgEntry."Document Line No.");
                    if l_rst37.FindSet then begin
                        if l_rst37."No. remito oficial" <> '' then
                            fntEliminarAplicacionDCL(ItemLedgEntry)
                        else
                            fntRegistrarAplicacionDCL(ItemLedgEntry)
                    end;
                end
                else
                    fntRegistrarAplicacionDCL(ItemLedgEntry);
            end;

            if ("Entry Type" = "Entry Type"::Sale) and ("Concepto ajuste" = '') and ("Document Type" = "Document Type"::"Sales Credit Memo") then begin
                fntEliminarAplicacionDCL(ItemLedgEntry);
            end;
        end;
    end;

    procedure fntRegistrarAplicacionDCL(l_rst32: Record "Item Ledger Entry")
    var
        l_rst90: Record "BOM Component";
        l_rst27: Record Item;
        l_decKilosMateriaPrima: Decimal;
        l_rstAplicDCL: Record "DCL Application Lines";
        l_rst32Origen: Record "Item Ledger Entry";
        l_rstIS: Record "Inventory Setup";
        l_rstProduccion: Record "Produccion Planta";
        l_rstDCLLine: Record "Lín. DCL";
        l_rstJob: Record Job;
        l_codMP: Code[20];
        l_decPorcentaje: Decimal;
        l_rst32MP: Record "Item Ledger Entry";
        l_decKN: Decimal;
        l_docOrigen: Code[20];
        l_blnEncontrado: Boolean;
        l_rst32Loop: Record "Item Ledger Entry";
        l_rstSS: Record "Sales & Receivables Setup";
        l_rstCabRemito: Record "Sales Shipment Header";
        l_rstDV: Record "Dimension Value";
        l_rstGLS: Record "General Ledger Setup";
        l_optSegDCL: Option " ","Post-Expo - Controlar contra DCL","No controlar contra DCL","Pre-Expo - Controlar contra DCL";
        l_rstDCLAppTemp: Record "DCL Application Lines temp";
    begin
        //Verificar el nivel de producción del producto
        Clear(l_rstSS);
        l_rstSS.Get();
        if not l_rstSS."Controlar contra DCL" then
            exit;

        Clear(l_rstIS);
        l_rstIS.Get;

        l_rstIS.TestField("Production journal");
        l_rstIS.TestField("Unloading journal");
        l_rstIS.TestField("Purchasing journal");

        Clear(l_rstCabRemito);
        if l_rstCabRemito.Get(l_rst32."Document No.") then
            if l_rstSS."Customer Group for DCL" <> l_rstCabRemito."Customer Posting Group" then
                exit;

        l_docOrigen := '';
        l_decKilosMateriaPrima := 0;
        l_codMP := '';
        l_decPorcentaje := 0;
        l_decKN := -l_rst32."Net kilos";
        Clear(l_rst32Loop);
        l_rst32Loop.Get(l_rst32."Entry No.");

        Clear(l_rst27);
        l_rst27.Get(l_rst32."Item No.");
        if l_rst27."Item Category Code" <> l_rstIS."Categoria productos pesca" then
            exit;

        Clear(l_rstGLS);
        l_rstGLS.Get();
        l_optSegDCL := l_optSegDCL::" ";
        optDCLTracking := optDCLTracking::" ";

        if l_rst32."Seguimiento para trazabilidad" <> l_rst32."Seguimiento para trazabilidad"::" " then
            l_optSegDCL := l_rst32."Seguimiento para trazabilidad";

        Clear(l_rstDV);
        l_rstDV.Get(l_rstGLS."Global Dimension 2 Code", l_rst27."Global Dimension 2 Code");
        if l_optSegDCL = l_optSegDCL::" " then
            l_optSegDCL := l_rstDV."Seguimiento para trazabilidad";

        if (l_optSegDCL = l_optSegDCL::"No controlar contra DCL") or
            (l_optSegDCL = l_optSegDCL::"Pre-Expo - Controlar contra DCL") then
            exit;

        if l_rstDV."DCL tracking" <> l_rstDV."DCL tracking"::" " then
            optDCLTracking := l_rstDV."DCL tracking"
        else
            optDCLTracking := l_rstSS."DCL tracking";

        //IF l_rstSS."DCL tracking" = l_rstSS."DCL tracking"::"Lote origen a DCL específico" THEN
        if optDCLTracking = optDCLTracking::"Lote origen a DCL específico" then begin

            case l_rst27."Nivel de producción" of
                l_rst27."Nivel de producción"::"Materia Prima",
                l_rst27."Nivel de producción"::" ":
                    begin

                        //Verificar relación. Una MP no debería tener.
                        Clear(l_rst90);
                        l_rst90.SetRange("No.", l_rst32."Item No.");
                        if l_rst90.Count <> 0 then
                            Error('Existe una relación entre el producto %1 a productos de origen.', l_rst32."Item No.");

                        l_decKilosMateriaPrima := 0;
                        if l_rst32."Net kilos" <> 0 then
                            l_decKilosMateriaPrima := l_decKN;
                        l_codMP := l_rst32."Item No.";
                        Clear(l_rstJob);
                        l_rstJob.Get(l_rst32."Job No.");

                    end;

                l_rst27."Nivel de producción"::Semielaborado,
                l_rst27."Nivel de producción"::"Producto Terminado":
                    //REPEAT
                    begin

                        l_blnEncontrado := false;
                        //Si no hay relación, depender de la OP.
                        //Buscar el documento de origen del lote de ese producto
                        Clear(l_rst32Origen);
                        l_rst32Origen.SetRange("Lot No.", l_rst32Loop."Lot No.");
                        l_rst32Origen.SetRange("Lote origen", l_rst32Loop."Lote origen");
                        l_rst32Origen.SetRange("Global Dimension 2 Code", l_rst32Loop."Global Dimension 2 Code");
                        l_rst32Origen.SetRange("Item Category Code", l_rstIS."Categoria productos pesca");
                        //l_rst32Origen.SETRANGE("Document No.",l_rst32."Document No.");
                        l_rst32Origen.SetFilter("Nombre libro diario", '%1|%2|%3', l_rstIS."Production journal", l_rstIS."Unloading journal", l_rstIS."Purchasing journal");
                        l_rst32Origen.SetRange(Revertido, false);
                        if l_rst32Origen.FindFirst then begin

                            case l_rst32Origen."Nombre libro diario" of
                                l_rstIS."Production journal":
                                    begin

                                        //Buscar el movimiento de salida de la OP correspondiente.
                                        Clear(l_rst32MP);
                                        l_rst32MP.SetCurrentKey("Entry No.");
                                        l_rst32MP.SetRange("Document No.", l_rst32Origen."Document No.");
                                        l_rst32MP.SetRange("Entry Type", l_rst32MP."Entry Type"::"Negative Adjmt.");
                                        l_rst32MP.SetRange("Global Dimension 2 Code", l_rst32Origen."Global Dimension 2 Code");
                                        l_rst32MP.SetRange("Item Category Code", l_rstIS."Categoria productos pesca");
                                        l_rst32MP.SetRange(Revertido, false);
                                        if l_rst32MP.FindFirst then begin

                                            Clear(l_rst27);
                                            l_rst27.Get(l_rst32MP."Item No.");
                                            if l_rst27."Nivel de producción" in [l_rst27."Nivel de producción"::"Materia Prima", l_rst27."Nivel de producción"::Semielaborado] then begin

                                                //Si el movimiento de salida es una Materia prima, ya encontré todo lo necesario
                                                //Buscar proyecto origen
                                                Clear(l_rstJob);
                                                l_rstJob.Get(l_rst32MP."Job No.");

                                                l_docOrigen := l_rst32MP."Document No.";

                                                if l_codMP = '' then
                                                    l_codMP := l_rst32MP."Item No.";

                                                //Si hay una OP, aplicar el % que le corresponde por OP, en lugar de utilizar el % por lista de embalaje, a menos
                                                //que haya habido una Producción recursiva.
                                                if (l_rst32Loop."Entry No." = l_rst32."Entry No.") then begin

                                                    l_decPorcentaje := fntCalcularPorcentajesProduccion(l_rst32Origen);
                                                    l_decKilosMateriaPrima := Round((l_decKN / l_decPorcentaje), 1);

                                                end
                                                else
                                                    Clear(l_rst32MP);

                                            end
                                            else begin

                                                //Si el movimiento NO es de materia prima, debe ser una OP de ajuste, así que busco nuevamente el origen de esta salida
                                                Clear(l_rst32Loop);
                                                l_rst32Loop.Get(l_rst32MP."Entry No.");

                                            end;

                                        end;

                                    end;
                                l_rstIS."Unloading journal",
                                l_rstIS."Purchasing journal":
                                    begin

                                        Clear(l_rstJob);
                                        l_rstJob.Get(l_rst32Origen."Job No.");

                                        l_docOrigen := l_rst32Origen."Document No.";

                                        l_decPorcentaje := 1;
                                        //Si hay una OP, aplicar el % que le corresponde por OP, en lugar de utilizar el % por lista de embalaje
                                        if l_decPorcentaje <> 0 then
                                            l_decKilosMateriaPrima := Round((l_decKN / l_decPorcentaje), 1);
                                        l_codMP := l_rst32Origen."Item No.";

                                        l_blnEncontrado := true;

                                    end;
                            end;
                        end;
                        //Si no hay Orden de Producción, verificar relación
                        if l_rst32MP."Entry No." = 0 then begin

                            Clear(l_rst90);
                            l_rst90.SetRange("No.", l_rst32."Item No.");
                            if l_rst90.Count > 1 then
                                Error('Existe más de una relación entre el producto %1 a productos de origen.', l_rst32."Item No.");
                            //IF l_rst90.COUNT = 0 THEN
                            //  ERROR('No existe relación entre el producto %1 a productos de origen.',l_rst32."Item No.");
                            if (l_rst90.FindSet) and ((l_decKilosMateriaPrima = 0) or (l_codMP = '')) then begin

                                //Una vez encontrada la relación, calcular la MP utilizada para este PT.
                                l_decKilosMateriaPrima := 0;
                                if l_decPorcentaje = 0 then
                                    l_decPorcentaje := l_rst90."Quantity per";
                                if l_decKN <> 0 then
                                    l_decKilosMateriaPrima := Round((l_decKN / l_rst90."Quantity per"), 1)
                                else
                                    Error('El movimiento no tiene kilos netos. No puede calcularse la materia prima originaria.');

                                l_codMP := l_rst90."Parent Item No.";

                            end;

                        end;

                        if l_codMP <> '' then begin

                            Clear(l_rst27);
                            l_rst27.Get(l_codMP);
                            if l_rst27."Nivel de producción" in [l_rst27."Nivel de producción"::"Materia Prima", l_rst27."Nivel de producción"::Semielaborado] then begin
                                if l_rst27."Nivel de producción" = l_rst27."Nivel de producción"::Semielaborado then begin
                                    l_rst27.TestField("Seguimiento para trazabilidad", l_rst27."Seguimiento para trazabilidad"::"Forzar uso de L.M.");
                                    Clear(l_rst90);
                                    l_rst90.SetRange("No.", l_codMP);
                                    l_rst90.FindFirst;
                                    l_codMP := l_rst90."Parent Item No.";
                                end;
                                l_blnEncontrado := true;
                            end;

                        end;

                        //Si el código de PT lo encuentro en el DCL de ese buque, asumo que son el mismo producto y no hay transformación
                        if l_codMP = '' then begin
                            Clear(l_rstDCLLine);
                            l_rstDCLLine.SetRange("No. proyecto", l_rst32."Job No.");
                            l_rstDCLLine.SetRange(Clasificación, l_rst32."Item No.");
                            if l_rstDCLLine.FindFirst then begin
                                l_codMP := l_rstDCLLine.Clasificación;
                                Clear(l_rstJob);
                                l_rstJob.Get(l_rst32."Job No.");
                            end;
                        end;
                    end;

            end;

        end;

        if optDCLTracking = optDCLTracking::"Lote origen a DCL abierto" then begin

            case l_rst27."Nivel de producción" of
                l_rst27."Nivel de producción"::"Materia Prima",
                l_rst27."Nivel de producción"::" ":
                    begin

                        //Verificar relación. Una MP no debería tener.
                        Clear(l_rst90);
                        l_rst90.SetRange("No.", l_rst32."Item No.");
                        if l_rst90.Count <> 0 then
                            Error('Existe una relación entre el producto %1 a productos de origen.', l_rst32."Item No.");

                        l_decKilosMateriaPrima := 0;
                        if l_rst32."Net kilos" <> 0 then
                            l_decKilosMateriaPrima := l_decKN;
                        l_codMP := l_rst32."Item No.";
                        Clear(l_rstJob);
                        l_rstJob.Get(l_rst32."Job No.");

                    end;

                l_rst27."Nivel de producción"::Semielaborado,
                l_rst27."Nivel de producción"::"Producto Terminado":
                    //REPEAT
                    begin

                        l_blnEncontrado := false;
                        //Si no hay relación, depender de la OP.
                        //Buscar el documento de origen del lote de ese producto
                        Clear(l_rst32Origen);
                        l_rst32Origen.SetRange("Lot No.", l_rst32Loop."Lot No.");
                        l_rst32Origen.SetRange("Lote origen", l_rst32Loop."Lote origen");
                        l_rst32Origen.SetRange("Global Dimension 2 Code", l_rst32Loop."Global Dimension 2 Code");
                        l_rst32Origen.SetRange("Item Category Code", l_rstIS."Categoria productos pesca");
                        //l_rst32Origen.SETRANGE("Document No.",l_rst32."Document No.");
                        l_rst32Origen.SetFilter("Nombre libro diario", '%1|%2|%3', l_rstIS."Production journal", l_rstIS."Unloading journal", l_rstIS."Purchasing journal");
                        l_rst32Origen.SetRange(Revertido, false);
                        if (l_rst32Origen.FindFirst) and (l_rst27."Seguimiento para trazabilidad" = l_rst27."Seguimiento para trazabilidad"::" ") then begin

                            case l_rst32Origen."Nombre libro diario" of
                                l_rstIS."Production journal":
                                    begin

                                        //Buscar el movimiento de salida de la OP correspondiente.
                                        Clear(l_rst32MP);
                                        l_rst32MP.SetCurrentKey("Entry No.");
                                        l_rst32MP.SetRange("Document No.", l_rst32Origen."Document No.");
                                        l_rst32MP.SetRange("Entry Type", l_rst32MP."Entry Type"::"Negative Adjmt.");
                                        l_rst32MP.SetRange("Global Dimension 2 Code", l_rst32Origen."Global Dimension 2 Code");
                                        l_rst32MP.SetRange("Item Category Code", l_rstIS."Categoria productos pesca");
                                        l_rst32MP.SetRange(Revertido, false);
                                        if l_rst32MP.FindFirst then begin

                                            Clear(l_rst27);
                                            l_rst27.Get(l_rst32MP."Item No.");
                                            if l_rst27."Nivel de producción" in [l_rst27."Nivel de producción"::"Materia Prima", l_rst27."Nivel de producción"::Semielaborado] then begin

                                                //Si el movimiento de salida es una Materia prima, ya encontré todo lo necesario
                                                //Buscar proyecto origen
                                                Clear(l_rstJob);
                                                l_rstJob.Get(l_rst32MP."Job No.");

                                                l_docOrigen := l_rst32MP."Document No.";

                                                if l_codMP = '' then
                                                    l_codMP := l_rst32MP."Item No.";

                                                //Si hay una OP, aplicar el % que le corresponde por OP, en lugar de utilizar el % por lista de embalaje, a menos
                                                //que haya habido una Producción recursiva.
                                                if (l_rst32Loop."Entry No." = l_rst32."Entry No.") then begin

                                                    l_decPorcentaje := fntCalcularPorcentajesProduccion(l_rst32Origen);
                                                    l_decKilosMateriaPrima := Round((l_decKN / l_decPorcentaje), 1);

                                                end
                                                else
                                                    Clear(l_rst32MP);

                                            end
                                            else begin

                                                //Si el movimiento NO es de materia prima, debe ser una OP de ajuste, así que busco nuevamente el origen de esta salida
                                                Clear(l_rst32Loop);
                                                l_rst32Loop.Get(l_rst32MP."Entry No.");

                                            end;

                                        end;

                                    end;
                                l_rstIS."Unloading journal",
                                l_rstIS."Purchasing journal":
                                    begin

                                        Clear(l_rstJob);
                                        l_rstJob.Get(l_rst32Origen."Job No.");

                                        l_docOrigen := l_rst32Origen."Document No.";

                                        l_decPorcentaje := 1;
                                        //Si hay una OP, aplicar el % que le corresponde por OP, en lugar de utilizar el % por lista de embalaje
                                        if l_decPorcentaje <> 0 then
                                            l_decKilosMateriaPrima := Round((l_decKN / l_decPorcentaje), 1);
                                        l_codMP := l_rst32Origen."Item No.";

                                        l_blnEncontrado := true;

                                    end;
                            end;
                        end;
                        //Si no hay Orden de Producción, verificar relación
                        if l_rst32MP."Entry No." = 0 then begin

                            Clear(l_rst90);
                            l_rst90.SetRange("No.", l_rst32."Item No.");
                            if l_rst90.Count > 1 then
                                Error('Existe más de una relación entre el producto %1 a productos de origen.', l_rst32."Item No.");
                            //IF l_rst90.COUNT = 0 THEN
                            //  ERROR('No existe relación entre el producto %1 a productos de origen.',l_rst32."Item No.");
                            if (l_rst90.FindSet) and ((l_decKilosMateriaPrima = 0) or (l_codMP = '')) then begin

                                //Una vez encontrada la relación, calcular la MP utilizada para este PT.
                                l_decKilosMateriaPrima := 0;
                                if l_decPorcentaje = 0 then
                                    l_decPorcentaje := l_rst90."Quantity per";
                                if l_decKN <> 0 then
                                    l_decKilosMateriaPrima := Round((l_decKN / l_rst90."Quantity per"), 1)
                                else
                                    Error('El movimiento no tiene kilos netos. No puede calcularse la materia prima originaria.');

                                l_codMP := l_rst90."Parent Item No.";

                            end
                            else begin
                                l_rstAplicDCL.SetRange("Applied document no.", l_rstAplicDCL."Applied document no.");
                                if l_rstAplicDCL.FindSet then
                                    repeat
                                        Clear(l_rstDCLAppTemp);
                                        l_rstDCLAppTemp.TransferFields(l_rstAplicDCL);
                                        l_rstDCLAppTemp.Insert;
                                    until l_rstAplicDCL.Next = 0;
                                fntTestDCLApp(l_rstDCLAppTemp);
                                Error('No se ha encontrado Orden de Producción ni Descarga para producto %1, lote %2.', l_rst32."Item No.", l_rst32."Lot No.");
                            end;

                        end;

                        if l_codMP <> '' then begin

                            Clear(l_rst27);
                            l_rst27.Get(l_codMP);
                            if l_rst27."Nivel de producción" in [l_rst27."Nivel de producción"::"Materia Prima", l_rst27."Nivel de producción"::Semielaborado] then begin
                                if l_rst27."Nivel de producción" = l_rst27."Nivel de producción"::Semielaborado then begin
                                    l_rst27.TestField("Seguimiento para trazabilidad", l_rst27."Seguimiento para trazabilidad"::"Forzar uso de L.M.");
                                    Clear(l_rst90);
                                    l_rst90.SetRange("No.", l_codMP);
                                    l_rst90.FindFirst;
                                    l_codMP := l_rst90."Parent Item No.";
                                end;
                                l_blnEncontrado := true;
                            end;
                        end;

                        //Si el código de PT lo encuentro en el DCL de ese buque, asumo que son el mismo producto y no hay transformación
                        if l_codMP = '' then begin
                            Clear(l_rstDCLLine);
                            l_rstDCLLine.SetRange("No. proyecto", l_rst32."Job No.");
                            l_rstDCLLine.SetRange(Clasificación, l_rst32."Item No.");
                            if l_rstDCLLine.FindFirst then begin
                                l_codMP := l_rstDCLLine.Clasificación;
                                Clear(l_rstJob);
                                l_rstJob.Get(l_rst32."Job No.");
                            end;
                        end;

                        //UNTIL l_blnEncontrado;
                    end;

            end;

        end;

        fntVerificarExistenciaDCL(l_rst32, l_rstJob, l_codMP);

        fntAplicarDCL(l_rst32, l_rstJob, l_decKilosMateriaPrima, l_decPorcentaje, l_codMP, l_decKN, l_docOrigen);

        Clear(l_rstAplicDCL);
    end;

    local procedure fntVerificarExistenciaDCL(l_rst32: Record "Item Ledger Entry"; l_rstJob: Record Job; l_codMP: Code[20])
    var
        l_rstDCLLine: Record "Lín. DCL";
        l_rstSS: Record "Sales & Receivables Setup";
        l_rstItem: Record Item;
    begin
        //Verificar que exista el DCL
        Clear(l_rstSS);
        l_rstSS.Get();
        //l_rstSS.TESTFIELD("DCL local customer");

        if l_codMP = '' then
            Error('No existe ingreso oficial para el producto %1, lote %2.', l_rst32."Item No.", l_rst32."Lot No.");
        Clear(l_rstItem);
        l_rstItem.Get(l_codMP);

        Clear(l_rstDCLLine);
        l_rstDCLLine.SetRange("No. proyecto", l_rstJob."No.");
        if l_rstSS."DCL local customer" <> '' then
            l_rstDCLLine.SetRange(Cliente, l_rstSS."DCL local customer");
        l_rstDCLLine.SetRange(Actividad, l_rstItem."Global Dimension 2 Code");
        /*IF l_rst32."DCL application date formula" <> '' THEN
          l_rstDCLLine.SETFILTER("Fecha DCL",l_rst32."DCL application date formula");*/
        //l_rstDCLLine.SETRANGE(Clasificación,l_codMP);
        l_rstDCLLine.SetRange(Registrado, true);

        //Puede haber más de una línea

        if not l_rstSS."NO verificar DCL específico" then
            if not l_rstDCLLine.FindSet then
                Error('No existe DCL para el proyecto %1, código de producto %2, con materia prima %3.', l_rstJob."No.", l_rst32."Item No.", l_codMP);

    end;

    local procedure fntCalcularPorcentajesProduccion(l_rst32: Record "Item Ledger Entry"): Decimal
    var
        l_rst32MP: Record "Item Ledger Entry";
        l_rst32PT: Record "Item Ledger Entry";
        l_rst32SUBFAMILIA: Record "Item Ledger Entry";
        l_decKN_MP: Decimal;
        l_decKN_PT_SE: Decimal;
        l_decKN_SUBFAMILIA: Decimal;
    begin
        Clear(l_rst32MP);
        l_rst32MP.SetRange("Document No.", l_rst32."Document No.");
        l_rst32MP.SetRange("Entry Type", l_rst32MP."Entry Type"::"Negative Adjmt.");
        l_rst32MP.SetRange(Revertido, false);
        l_rst32MP.CalcSums("Net kilos");
        l_decKN_MP := l_rst32MP."Net kilos";

        Clear(l_rst32PT);
        l_rst32PT.SetRange("Document No.", l_rst32."Document No.");
        l_rst32PT.SetRange("Entry Type", l_rst32PT."Entry Type"::"Positive Adjmt.");
        l_rst32PT.SetRange(Revertido, false);
        l_rst32PT.CalcSums("Net kilos");
        l_decKN_PT_SE := l_rst32PT."Net kilos";

        Clear(l_rst32SUBFAMILIA);
        l_rst32SUBFAMILIA.SetRange("Document No.", l_rst32."Document No.");
        l_rst32SUBFAMILIA.SetRange("Entry Type", l_rst32SUBFAMILIA."Entry Type"::"Positive Adjmt.");
        l_rst32SUBFAMILIA.SetRange(Revertido, false);
        //l_rst32SUBFAMILIA.SETRANGE(Subfamily,l_rst32.Subfamily);
        l_rst32SUBFAMILIA.SetRange(Subfamily, l_rst32.Subfamily);
        l_rst32SUBFAMILIA.CalcSums("Net kilos");
        l_decKN_SUBFAMILIA := l_rst32SUBFAMILIA."Net kilos";

        exit(Abs(Round(l_decKN_SUBFAMILIA / l_decKN_MP, 0.001)));
    end;

    local procedure fntAplicarDCL(l_rst32: Record "Item Ledger Entry"; l_rstJob: Record Job; l_decKilosMateriaPrima: Decimal; l_decPorcentajeAplicado: Decimal; l_codMP: Code[20]; l_decKN: Decimal; l_docOrigen: Code[20])
    var
        l_rstAplicDCL: Record "DCL Application Lines";
        l_rstCabRemito: Record "Sales Shipment Header";
        l_rstProyAlt: Record Job;
        i: Integer;
        l_rstCabFactura: Record "Sales Invoice Header";
        l_rstDCLLine: Record "Lín. DCL";
        l_rstSS: Record "Sales & Receivables Setup";
        l_rstItem: Record Item;
        l_rst27: Record Item;
        l_rstCabRep: Record "Cab. Reparto";
        l_decKNAplicados: Decimal;
        l_rstDCLAppTemp: Record "DCL Application Lines temp";
    begin
        Clear(l_rstAplicDCL);
        if l_rstAplicDCL.FindLast then
            i := l_rstAplicDCL."Entry no.";


        Clear(l_rstSS);
        l_rstSS.Get();
        //l_rstSS.TESTFIELD("DCL local customer");

        Clear(l_rstItem);
        l_rstItem.Get(l_codMP);

        if l_rstJob."No." = '' then begin
            l_rstJob.SetRange("Lote origen", l_rst32."Lote origen");
            if l_rstJob.FindFirst then;
        end;

        l_decKNAplicados := 0;
        l_decKNAplicados := fntGetAppliedKilos(l_rstJob."No.", l_rstItem."Global Dimension 2 Code", l_rstSS."DCL local customer", l_codMP, l_rst32."Item No.");

        Clear(l_rstAplicDCL);
        l_rstAplicDCL.SetRange("Item entry no.", l_rst32."Entry No.");
        if l_rstAplicDCL.FindFirst then
            Error('El movimiento de producto %1 fue aplicado anteriormente.', l_rst32."Entry No.");

        Clear(l_rstDCLLine);
        l_rstDCLLine.SetRange("No. proyecto", l_rstJob."No.");
        if l_rstSS."DCL local customer" <> '' then
            l_rstDCLLine.SetRange(Cliente, l_rstSS."DCL local customer");

        Clear(l_rst27);
        l_rst27.Get(l_rst32."Item No.");
        if l_rst27."Seguimiento para trazabilidad" = l_rst27."Seguimiento para trazabilidad"::"Forzar uso de L.M." then
            l_rstDCLLine.SetRange(Clasificación, l_codMP);
        l_rstDCLLine.SetRange(Actividad, l_rstItem."Global Dimension 2 Code");
        if l_rst32."DCL application date formula" <> '' then begin
            //l_rstDCLLine.SETRANGE("Fecha DCL",CALCDATE(l_rst32."DCL application date formula",l_rst32."Posting Date"),l_rst32."Posting Date");
            if l_rstSS."Production date limit" = '' then
                l_rstDCLLine.SetFilter("Fecha DCL", '<=%1', CalcDate(l_rst32."DCL application date formula", l_rst32."Posting Date"))
            else
                l_rstDCLLine.SetFilter("Fecha DCL", '%1..%2', CalcDate(l_rstSS."Production date limit", l_rst32."Posting Date"), CalcDate(l_rst32."DCL application date formula", l_rst32."Posting Date"));
        end;
        l_rstDCLLine.SetRange(Registrado, true);
        if l_rstDCLLine.FindSet then begin

            l_rstDCLLine.CalcFields("Applied kilos");
            l_rstDCLLine.CalcSums("Kilos netos");
            //IF (l_rstDCLLine."Kilos netos" > l_rstDCLLine."Applied kilos") OR (l_decKilosMateriaPrima < 0) THEN
            if (l_rstDCLLine."Kilos netos" > l_decKNAplicados) or (l_decKilosMateriaPrima < 0) then begin

                i += 1;
                l_rstAplicDCL."Entry no." := i;
                l_rstAplicDCL."DCL Job no." := l_rstDCLLine."No. proyecto";
                l_rstAplicDCL."DCL Line no." := l_rstDCLLine."No. línea";
                l_rstAplicDCL."Item entry no." := l_rst32."Entry No.";
                //IF (l_rstDCLLine."Kilos netos" >= l_decKilosMateriaPrima+l_rstDCLLine."Applied kilos") OR (l_decKilosMateriaPrima < 0) THEN
                if (l_rstDCLLine."Kilos netos" >= l_decKilosMateriaPrima + l_decKNAplicados) or (l_decKilosMateriaPrima < 0) then begin

                    l_rstAplicDCL."Origin kilos" := l_decKilosMateriaPrima;
                    l_rstAplicDCL."Net kilos" := l_decKN;

                end
                else begin
                    //Si lo que queda en la línea no es suficiente para aplicar la línea completa
                    /*
                    l_rstAplicDCL."Net kilos" := ROUND(l_decKN
                                                 *((l_rstDCLLine."Kilos netos"-l_rstDCLLine."Applied kilos")
                                                 /l_decKilosMateriaPrima),1);
                    l_rstAplicDCL."Origin kilos" := l_rstDCLLine."Kilos netos"-l_rstDCLLine."Applied kilos";
                    */
                    l_rstAplicDCL."Net kilos" := Round(l_decKN
                                                 * ((l_rstDCLLine."Kilos netos" - l_decKNAplicados)
                                                 / l_decKilosMateriaPrima), 1);
                    l_rstAplicDCL."Origin kilos" := l_rstDCLLine."Kilos netos" - l_decKNAplicados;

                end;

                l_rstAplicDCL.Average := l_decPorcentajeAplicado;
                l_rstAplicDCL."Applied job no." := l_rst32."Job No.";
                //Para evitar los problemas de la Raya
                //l_rstAplicDCL.Activity := l_rst32."Global Dimension 2 Code";
                l_rstAplicDCL.Activity := l_rstItem."Global Dimension 2 Code";
                l_rstAplicDCL."Production no." := l_docOrigen;
                l_rstAplicDCL."Applied document no." := l_rst32."Document No.";
                l_rstAplicDCL."Line no." := l_rst32."Document Line No.";
                l_rstAplicDCL."Application type" := l_rstAplicDCL."Application type"::"Producción";
                Clear(l_rstCabRemito);
                if l_rstCabRemito.Get(l_rst32."Document No.") then begin

                    l_rstAplicDCL."Permiso de embarque" := l_rstCabRemito."Permiso de embarque";
                    l_rstAplicDCL."Container no." := l_rstCabRemito."Cód. Contenedor";

                end;
                Clear(l_rstCabFactura);
                if l_rstCabFactura.Get(l_rst32."Document No.") and (l_rstAplicDCL."Permiso de embarque" = '') then begin

                    l_rstAplicDCL."Permiso de embarque" := l_rstCabFactura."Permiso de embarque";
                    l_rstAplicDCL."Container no." := l_rstCabFactura."Cód. Contenedor";

                end;
                l_rstAplicDCL."Item no." := l_rst32."Item No.";
                l_rstAplicDCL."Original Item no." := l_codMP;
                l_rstAplicDCL.Insert;

                l_decKilosMateriaPrima := l_decKilosMateriaPrima - l_rstAplicDCL."Origin kilos";
                l_decKN := l_decKN - l_rstAplicDCL."Net kilos";

            end;

        end;

        //Si después de aplicar sobre el DCL correspondiente todavía queda materia prima, sigo con otros DCL del mismo buque
        if l_decKilosMateriaPrima <> 0 then begin

            if optDCLTracking = optDCLTracking::"Lote origen a DCL específico" then
                Error('No se pudo aplicar a un DCL el movimiento %4 para el producto %1, lote %2, cantidad de kilos %3', l_rst32."Item No.", l_rst32."Lot No.", l_rst32."Net kilos", l_rst32."Entry No.");
            Clear(l_rstProyAlt);
            l_rstProyAlt.SetRange("Global Dimension 1 Code", l_rstJob."Global Dimension 1 Code");
            /*
              IF l_rstJob."Starting Date" <> 0D  THEN
                l_rstProyAlt.SETFILTER("Ending Date",'<%1',l_rstJob."Starting Date");
            */
            l_rstProyAlt.SetCurrentKey("Ending Date");
            l_rstProyAlt.SetRange(Tipo, l_rstProyAlt.Tipo::Productivo);
            if l_rstProyAlt.FindLast then
                repeat

                    l_decKNAplicados := 0;
                    l_decKNAplicados := fntGetAppliedKilos(l_rstProyAlt."No.", l_rstItem."Global Dimension 2 Code", l_rstSS."DCL local customer", l_codMP, l_rst32."Item No.");

                    Clear(l_rstDCLLine);
                    l_rstDCLLine.SetRange("No. proyecto", l_rstProyAlt."No.");
                    if l_rstSS."DCL local customer" <> '' then
                        l_rstDCLLine.SetRange(Cliente, l_rstSS."DCL local customer");
                    if l_rst27."Seguimiento para trazabilidad" = l_rst27."Seguimiento para trazabilidad"::"Forzar uso de L.M." then
                        l_rstDCLLine.SetRange(Clasificación, l_codMP);
                    l_rstDCLLine.SetRange(Actividad, l_rstItem."Global Dimension 2 Code");
                    if l_rst32."DCL application date formula" <> '' then begin
                        //l_rstDCLLine.SETRANGE("Fecha DCL",CALCDATE(l_rst32."DCL application date formula",l_rst32."Posting Date"),l_rst32."Posting Date");
                        if l_rstSS."Production date limit" = '' then
                            l_rstDCLLine.SetFilter("Fecha DCL", '<=%1', CalcDate(l_rst32."DCL application date formula", l_rst32."Posting Date"))
                        else
                            l_rstDCLLine.SetFilter("Fecha DCL", '%1..%2', CalcDate(l_rstSS."Production date limit", l_rst32."Posting Date"), CalcDate(l_rst32."DCL application date formula", l_rst32."Posting Date"));
                    end;
                    l_rstDCLLine.SetRange(Registrado, true);
                    if l_rstDCLLine.FindSet then begin

                        l_rstDCLLine.CalcFields("Applied kilos");

                        l_rstDCLLine.CalcSums("Kilos netos");
                        //IF l_rstDCLLine."Applied kilos" < l_rstDCLLine."Kilos netos" THEN
                        if (l_rstDCLLine."Kilos netos" > l_decKNAplicados) or (l_decKilosMateriaPrima < 0) then begin

                            i += 1;
                            l_rstAplicDCL."Entry no." := i;
                            l_rstAplicDCL."DCL Job no." := l_rstDCLLine."No. proyecto";
                            l_rstAplicDCL."DCL Line no." := l_rstDCLLine."No. línea";
                            l_rstAplicDCL."Item entry no." := l_rst32."Entry No.";
                            //Para evitar los problemas de la Raya
                            //l_rstAplicDCL.Activity := l_rst32."Global Dimension 2 Code";
                            l_rstAplicDCL.Activity := l_rstItem."Global Dimension 2 Code";
                            //        IF l_rstDCLLine."Kilos netos" >= l_decKilosMateriaPrima+l_rstDCLLine."Applied kilos" THEN
                            if (l_rstDCLLine."Kilos netos" >= l_decKilosMateriaPrima + l_decKNAplicados) or (l_decKilosMateriaPrima < 0) then begin

                                l_rstAplicDCL."Origin kilos" := l_decKilosMateriaPrima;
                                l_rstAplicDCL."Net kilos" := l_decKN;

                            end
                            else begin

                                //Si lo que queda en la línea no es suficiente para aplicar la línea completa
                                /*
                                l_rstAplicDCL."Net kilos" := ROUND(l_decKN
                                                             *((l_rstDCLLine."Kilos netos"-l_rstDCLLine."Applied kilos")
                                                             /l_decKilosMateriaPrima),1);
                                l_rstAplicDCL."Origin kilos" := l_rstDCLLine."Kilos netos"-l_rstDCLLine."Applied kilos";
                                */
                                l_rstAplicDCL."Net kilos" := Round(l_decKN
                                                             * ((l_rstDCLLine."Kilos netos" - l_decKNAplicados)
                                                             / l_decKilosMateriaPrima), 1);
                                l_rstAplicDCL."Origin kilos" := l_rstDCLLine."Kilos netos" - l_decKNAplicados;
                            end;

                            l_rstAplicDCL.Average := l_decPorcentajeAplicado;
                            l_rstAplicDCL."Applied job no." := l_rst32."Job No.";
                            l_rstAplicDCL."Production no." := l_docOrigen;
                            l_rstAplicDCL."Applied document no." := l_rst32."Document No.";
                            l_rstAplicDCL."Line no." := l_rst32."Document Line No.";
                            l_rstAplicDCL."Application type" := l_rstAplicDCL."Application type"::Ajuste;
                            Clear(l_rstCabRemito);
                            if l_rstCabRemito.Get(l_rst32."Document No.") then begin

                                l_rstAplicDCL."Permiso de embarque" := l_rstCabRemito."Permiso de embarque";
                                l_rstAplicDCL."Container no." := l_rstCabRemito."Cód. Contenedor";

                            end;

                            Clear(l_rstCabFactura);
                            if l_rstCabFactura.Get(l_rst32."Document No.") and (l_rstAplicDCL."Permiso de embarque" = '') then begin

                                l_rstAplicDCL."Permiso de embarque" := l_rstCabFactura."Permiso de embarque";
                                l_rstAplicDCL."Container no." := l_rstCabFactura."Cód. Contenedor";

                            end;
                            //l_rstAplicDCL."Permiso de embarque" := l_rstCabRemito."Permiso de embarque";
                            l_rstAplicDCL."Item no." := l_rst32."Item No.";
                            l_rstAplicDCL."Original Item no." := l_codMP;
                            l_rstAplicDCL.Insert;

                            l_decKilosMateriaPrima := l_decKilosMateriaPrima - l_rstAplicDCL."Origin kilos";
                            l_decKN := l_decKN - l_rstAplicDCL."Net kilos";

                        end;

                    end;

                until (l_rstProyAlt.Next(-1) = 0) or (l_decKilosMateriaPrima = 0);

            /*
            UNTIL l_decKilosMateriaPrima = 0*/
        end
        else
            exit;

        //Si después de aplicar sobre DCLs del mismo buque todavía queda materia prima, sigo con otros DCL de otros buques
        if l_decKilosMateriaPrima <> 0 then begin

            Clear(l_rstProyAlt);
            l_rstProyAlt.SetFilter("Global Dimension 1 Code", '<>%1', l_rstJob."Global Dimension 1 Code");
            /*
            IF l_rstJob."Starting Date" <> 0D  THEN
              l_rstProyAlt.SETFILTER("Ending Date",'<%1',l_rstJob."Starting Date");
              */
            l_rstProyAlt.SetCurrentKey("Ending Date");
            l_rstProyAlt.SetRange(Tipo, l_rstProyAlt.Tipo::Productivo);
            if l_rstProyAlt.FindSet then
                repeat

                    l_decKNAplicados := 0;
                    l_decKNAplicados := fntGetAppliedKilos(l_rstProyAlt."No.", l_rstItem."Global Dimension 2 Code", l_rstSS."DCL local customer", l_codMP, l_rst32."Item No.");

                    Clear(l_rstDCLLine);
                    l_rstDCLLine.SetRange("No. proyecto", l_rstProyAlt."No.");
                    if l_rstSS."DCL local customer" <> '' then
                        l_rstDCLLine.SetRange(Cliente, l_rstSS."DCL local customer");
                    if l_rst32."DCL application date formula" <> '' then begin
                        //l_rstDCLLine.SETRANGE("Fecha DCL",CALCDATE(l_rst32."DCL application date formula",l_rst32."Posting Date"),l_rst32."Posting Date");
                        if l_rstSS."Production date limit" = '' then
                            l_rstDCLLine.SetFilter("Fecha DCL", '<=%1', CalcDate(l_rst32."DCL application date formula", l_rst32."Posting Date"))
                        else
                            l_rstDCLLine.SetFilter("Fecha DCL", '%1..%2', CalcDate(l_rstSS."Production date limit", l_rst32."Posting Date"), CalcDate(l_rst32."DCL application date formula", l_rst32."Posting Date"));
                    end;
                    if l_rst27."Seguimiento para trazabilidad" = l_rst27."Seguimiento para trazabilidad"::"Forzar uso de L.M." then
                        l_rstDCLLine.SetRange(Clasificación, l_codMP);
                    l_rstDCLLine.SetRange(Actividad, l_rstItem."Global Dimension 2 Code");

                    l_rstDCLLine.SetRange(Registrado, true);
                    //Puede haber más de una línea
                    if l_rstDCLLine.FindSet then begin

                        l_rstDCLLine.CalcFields("Applied kilos");
                        l_rstDCLLine.CalcSums("Kilos netos");
                        //IF l_rstDCLLine."Applied kilos" < l_rstDCLLine."Kilos netos" THEN
                        if (l_rstDCLLine."Kilos netos" > l_decKNAplicados)
                          or (l_decKilosMateriaPrima < 0) then begin

                            i += 1;
                            l_rstAplicDCL."Entry no." := i;
                            l_rstAplicDCL."DCL Job no." := l_rstDCLLine."No. proyecto";
                            l_rstAplicDCL."DCL Line no." := l_rstDCLLine."No. línea";
                            l_rstAplicDCL."Item entry no." := l_rst32."Entry No.";
                            //Para evitar los problemas de la Raya
                            //l_rstAplicDCL.Activity := l_rst32."Global Dimension 2 Code";
                            l_rstAplicDCL.Activity := l_rstItem."Global Dimension 2 Code";
                            //IF l_rstDCLLine."Kilos netos" >= l_decKilosMateriaPrima+l_rstDCLLine."Applied kilos" THEN
                            if (l_rstDCLLine."Kilos netos" >= l_decKilosMateriaPrima + l_decKNAplicados) or (l_decKilosMateriaPrima < 0) then begin

                                l_rstAplicDCL."Origin kilos" := l_decKilosMateriaPrima;
                                l_rstAplicDCL."Net kilos" := l_decKN;

                            end
                            else begin

                                //Si lo que queda en la línea no es suficiente para aplicar la línea completa
                                /*
                                l_rstAplicDCL."Net kilos" := ROUND(l_decKN
                                                             *((l_rstDCLLine."Kilos netos"-l_rstDCLLine."Applied kilos")
                                                             /l_decKilosMateriaPrima),1);
                                l_rstAplicDCL."Origin kilos" := l_rstDCLLine."Kilos netos"-l_rstDCLLine."Applied kilos";
                                */
                                l_rstAplicDCL."Net kilos" := Round(l_decKN
                                                             * ((l_rstDCLLine."Kilos netos" - l_decKNAplicados)
                                                             / l_decKilosMateriaPrima), 1);
                                l_rstAplicDCL."Origin kilos" := l_rstDCLLine."Kilos netos" - l_decKNAplicados;

                            end;

                            l_rstAplicDCL.Average := l_decPorcentajeAplicado;
                            l_rstAplicDCL."Applied job no." := l_rst32."Job No.";
                            l_rstAplicDCL."Production no." := l_docOrigen;
                            l_rstAplicDCL."Applied document no." := l_rst32."Document No.";
                            l_rstAplicDCL."Line no." := l_rst32."Document Line No.";
                            l_rstAplicDCL."Application type" := l_rstAplicDCL."Application type"::Ajuste;
                            Clear(l_rstCabRemito);
                            if l_rstCabRemito.Get(l_rst32."Document No.") then begin

                                l_rstAplicDCL."Permiso de embarque" := l_rstCabRemito."Permiso de embarque";
                                l_rstAplicDCL."Container no." := l_rstCabRemito."Cód. Contenedor";

                            end;

                            Clear(l_rstCabFactura);
                            if l_rstCabFactura.Get(l_rst32."Document No.") and (l_rstAplicDCL."Permiso de embarque" = '') then begin

                                l_rstAplicDCL."Permiso de embarque" := l_rstCabFactura."Permiso de embarque";
                                l_rstAplicDCL."Container no." := l_rstCabFactura."Cód. Contenedor";

                            end;
                            l_rstAplicDCL."Permiso de embarque" := l_rstCabRemito."Permiso de embarque";
                            l_rstAplicDCL."Item no." := l_rst32."Item No.";
                            l_rstAplicDCL."Original Item no." := l_codMP;
                            l_rstAplicDCL.Insert;

                            l_decKilosMateriaPrima := l_decKilosMateriaPrima - l_rstAplicDCL."Origin kilos";
                            l_decKN := l_decKN - l_rstAplicDCL."Net kilos";

                        end;

                    end;

                until (l_rstProyAlt.Next = 0) or (l_decKilosMateriaPrima = 0);

        end
        else
            exit;

        if l_decKilosMateriaPrima <> 0 then begin
            l_rstAplicDCL.SetRange("Applied document no.", l_rstAplicDCL."Applied document no.");
            if l_rstAplicDCL.FindSet then
                repeat
                    Clear(l_rstDCLAppTemp);
                    l_rstDCLAppTemp.TransferFields(l_rstAplicDCL);
                    l_rstDCLAppTemp.Insert;
                until l_rstAplicDCL.Next = 0;
            fntTestDCLApp(l_rstDCLAppTemp);
            Error('No se pudo aplicar a un DCL el movimiento %4 para el producto %1, lote %2, cantidad de kilos %3', l_rst32."Item No.", l_rst32."Lot No.", l_rst32."Net kilos", l_rst32."Entry No.");
        end;

    end;

    [Scope('OnPrem')]
    procedure fntAplicarDCLparaCCC(l_rst50543: Record "Lín. reparto")
    var
        l_rstAplicDCL: Record "DCL Application Lines";
        l_rstProyAlt: Record Job;
        i: Integer;
        l_rstDCLLine: Record "Lín. DCL";
        l_rstSS: Record "Sales & Receivables Setup";
        l_rst90: Record "BOM Component";
        l_rstItem: Record Item;
        l_decPorcentaje: Decimal;
        l_codMP: Code[20];
        l_decKN: Decimal;
        l_decKilosMateriaPrima: Decimal;
        l_decPorcentajeAplicado: Decimal;
        l_rstJob: Record Job;
        l_rstCRep: Record "Cab. Reparto";
        l_decKNAplicados: Decimal;
        l_rstDCLAppTemp: Record "DCL Application Lines temp";
    begin
        Clear(l_rstAplicDCL);
        if l_rstAplicDCL.FindLast then
            i := l_rstAplicDCL."Entry no.";

        Clear(l_rstAplicDCL);
        Clear(l_rstItem);
        l_rstItem.Get(l_rst50543."No. Producto");

        Clear(l_rstSS);
        l_rstSS.Get();
        //l_rstSS.TESTFIELD("DCL local customer");

        l_decKN := l_rst50543."Reservar - KN";

        Clear(l_rst90);
        l_rst90.SetRange("No.", l_rstItem."No.");
        if l_rst90.Count > 1 then
            Error('Existe más de una relación entre el producto %1 a productos de origen.', l_rstItem."No.");
        if l_rst90.Count = 0 then
            if l_rstItem.Rendimiento = 0 then
                Error('No existe relación entre el producto %1 a productos de origen, y tampoco rendimiento en la ficha.', l_rstItem."No.");
        if (l_rst90.FindSet) and ((l_decKilosMateriaPrima = 0) or (l_codMP = '')) then begin

            //Una vez encontrada la relación, calcular la MP utilizada para este PT.
            l_decKilosMateriaPrima := 0;
            if l_decPorcentaje = 0 then
                l_decPorcentaje := l_rst90."Quantity per";
            if l_decKN <> 0 then
                l_decKilosMateriaPrima := Round((l_decKN / l_rst90."Quantity per"), 0.01)
            else
                Error('El movimiento no tiene kilos netos. No puede calcularse la materia prima originaria.');

            l_codMP := l_rst90."Parent Item No.";

        end
        else begin

            if l_rstItem.Rendimiento <> 0 then begin

                //Una vez encontrado rendimiento, calcular la MP utilizada.
                l_decKilosMateriaPrima := 0;
                if l_decPorcentaje = 0 then
                    l_decPorcentaje := l_rstItem.Rendimiento;
                if l_decKN <> 0 then
                    l_decKilosMateriaPrima := Round((l_decKN / l_rstItem.Rendimiento), 0.01)
                else
                    Error('El movimiento no tiene kilos netos. No puede calcularse la materia prima originaria.');

                l_codMP := l_rstItem."No.";

            end;

        end;

        Clear(l_rstCRep);
        l_rstCRep.Get(l_rst50543."No. Documento");

        Clear(l_rstJob);
        l_rstJob.SetRange("Lote origen", l_rst50543."Lote origen");
        if l_rstJob.FindFirst then;
        //l_rstJob.GET(l_rst50543.Proyecto);

        Clear(l_rstDCLLine);
        l_rstDCLLine.SetRange("No. proyecto", l_rst50543.Proyecto);
        if l_rstSS."DCL local customer" <> '' then
            l_rstDCLLine.SetRange(Cliente, l_rstSS."DCL local customer");
        l_rstDCLLine.SetRange(Clasificación, l_codMP);
        /*
        IF l_rst50543."DCL application date formula" <> '' THEN
          //l_rstDCLLine.SETRANGE("Fecha DCL",CALCDATE(l_rst50543."DCL application date formula",l_rstCRep."Fecha reparto"),l_rstCRep."Fecha reparto");
          l_rstDCLLine.SETFILTER("Fecha DCL",'<=%1',CALCDATE(l_rst50543."DCL application date formula",l_rstCRep."Fecha reparto"));
        */
        if l_rst50543."DCL application date formula" <> '' then begin
            //l_rstDCLLine.SETRANGE("Fecha DCL",CALCDATE(l_rst32."DCL application date formula",l_rst32."Posting Date"),l_rst32."Posting Date");
            if l_rstSS."Production date limit" = '' then
                l_rstDCLLine.SetFilter("Fecha DCL", '<=%1', CalcDate(l_rst50543."DCL application date formula", l_rstCRep."Fecha reparto"))
            else
                l_rstDCLLine.SetFilter("Fecha DCL", '%1..%2', CalcDate(l_rstSS."Production date limit", l_rstCRep."Fecha reparto"), CalcDate(l_rst50543."DCL application date formula", l_rstCRep."Fecha reparto"));
        end;
        l_rstDCLLine.SetRange(Registrado, true);
        if l_rstDCLLine.FindSet then begin

            l_decKNAplicados := 0;
            l_decKNAplicados := fntGetAppliedKilos(l_rstJob."No.", l_rstItem."Global Dimension 2 Code", l_rstSS."DCL local customer", l_codMP, l_rst50543."No. Producto");

            l_rstDCLLine.CalcFields("Applied kilos");
            l_rstDCLLine.CalcSums("Kilos netos");
            //IF (l_rstDCLLine."Kilos netos" > l_rstDCLLine."Applied kilos") OR (l_decKilosMateriaPrima < 0) THEN
            if (l_rstDCLLine."Kilos netos" > l_decKNAplicados)
              or (l_decKilosMateriaPrima < 0) then begin

                i += 1;
                l_rstAplicDCL."Entry no." := i;
                l_rstAplicDCL."DCL Job no." := l_rstDCLLine."No. proyecto";
                l_rstAplicDCL."DCL Line no." := l_rstDCLLine."No. línea";
                //l_rstAplicDCL."Item entry no." := l_rst32."Entry No.";
                //Para evitar los problemas de la Raya
                //l_rstAplicDCL.Activity := l_rst32."Global Dimension 2 Code";
                l_rstAplicDCL.Activity := l_rstItem."Global Dimension 2 Code";
                if l_rstDCLLine."Kilos netos" >= l_decKilosMateriaPrima + l_decKNAplicados then begin

                    l_rstAplicDCL."Origin kilos" := l_decKilosMateriaPrima;
                    l_rstAplicDCL."Net kilos" := l_decKN;

                end
                else begin

                    //Si lo que queda en la línea no es suficiente para aplicar la línea completa
                    /*
                    l_rstAplicDCL."Net kilos" := ROUND(l_decKN
                                                 *((l_rstDCLLine."Kilos netos"-l_rstDCLLine."Applied kilos")
                                                 /l_decKilosMateriaPrima),1);
                    l_rstAplicDCL."Origin kilos" := l_rstDCLLine."Kilos netos"-l_rstDCLLine."Applied kilos";
                    */
                    l_rstAplicDCL."Net kilos" := Round(l_decKN
                                                 * ((l_rstDCLLine."Kilos netos" - l_decKNAplicados)
                                                 / l_decKilosMateriaPrima), 1);
                    l_rstAplicDCL."Origin kilos" := l_rstDCLLine."Kilos netos" - l_decKNAplicados;

                end;

                l_rstAplicDCL.Average := l_decPorcentaje;
                l_rstAplicDCL."Applied job no." := l_rst50543.Proyecto;
                l_rstAplicDCL."Applied document no." := l_rst50543."No. Documento";
                l_rstAplicDCL."Line no." := l_rst50543."No. línea";
                l_rstAplicDCL."Application type" := l_rstAplicDCL."Application type"::Reparto;
                l_rstAplicDCL."Item no." := l_rstItem."No.";
                l_rstAplicDCL."Original Item no." := l_codMP;
                l_rstAplicDCL.Insert;

                l_decKilosMateriaPrima := l_decKilosMateriaPrima - l_rstAplicDCL."Origin kilos";
                l_decKN := l_decKN - l_rstAplicDCL."Net kilos";

            end;

        end;

        //Si después de aplicar sobre el DCL correspondiente todavía queda materia prima, sigo con otros DCL del mismo buque
        if l_decKilosMateriaPrima <> 0 then begin

            if optDCLTracking = optDCLTracking::"Lote origen a DCL específico" then
                Error('No se pudo aplicar a un DCL la línea %4 para el producto %1, lote %2, cantidad de kilos %3', l_rstItem."No.", l_rst50543."Lote origen", l_decKN, l_rst50543."No. línea");
            Clear(l_rstProyAlt);
            l_rstProyAlt.SetRange("Global Dimension 1 Code", l_rst50543.Buque);
            /*
              IF l_rstJob."Starting Date" <> 0D  THEN
                l_rstProyAlt.SETFILTER("Ending Date",'<%1',l_rstJob."Starting Date");
            */
            l_rstProyAlt.SetCurrentKey("Ending Date");
            l_rstProyAlt.SetRange(Tipo, l_rstProyAlt.Tipo::Productivo);
            if l_rstProyAlt.FindLast then
                repeat

                    l_decKNAplicados := 0;
                    l_decKNAplicados := fntGetAppliedKilos(l_rstProyAlt."No.", l_rstItem."Global Dimension 2 Code", l_rstSS."DCL local customer", l_codMP, l_rst50543."No. Producto");

                    Clear(l_rstDCLLine);
                    l_rstDCLLine.SetRange("No. proyecto", l_rstProyAlt."No.");
                    if l_rstSS."DCL local customer" <> '' then
                        l_rstDCLLine.SetRange(Cliente, l_rstSS."DCL local customer");
                    l_rstDCLLine.SetRange(Clasificación, l_codMP);
                    l_rstDCLLine.SetRange(Registrado, true);
                    /*
                    IF l_rst50543."DCL application date formula" <> '' THEN
                      //l_rstDCLLine.SETRANGE("Fecha DCL",CALCDATE(l_rst50543."DCL application date formula",l_rstCRep."Fecha reparto"),l_rstCRep."Fecha reparto");
                      l_rstDCLLine.SETFILTER("Fecha DCL",'<=%1',CALCDATE(l_rst50543."DCL application date formula",l_rstCRep."Fecha reparto"));
                      */
                    if l_rst50543."DCL application date formula" <> '' then begin
                        //l_rstDCLLine.SETRANGE("Fecha DCL",CALCDATE(l_rst32."DCL application date formula",l_rst32."Posting Date"),l_rst32."Posting Date");
                        if l_rstSS."Production date limit" = '' then
                            l_rstDCLLine.SetFilter("Fecha DCL", '<=%1', CalcDate(l_rst50543."DCL application date formula", l_rstCRep."Fecha reparto"))
                        else
                            l_rstDCLLine.SetFilter("Fecha DCL", '%1..%2', CalcDate(l_rstSS."Production date limit", l_rstCRep."Fecha reparto"), CalcDate(l_rst50543."DCL application date formula", l_rstCRep."Fecha reparto"));
                    end;
                    if l_rstDCLLine.FindSet then begin

                        l_rstDCLLine.CalcFields("Applied kilos");

                        l_rstDCLLine.CalcSums("Kilos netos");
                        //IF l_rstDCLLine."Applied kilos" < l_rstDCLLine."Kilos netos" THEN
                        if (l_rstDCLLine."Kilos netos" > l_decKNAplicados)
                          or (l_decKilosMateriaPrima < 0) then begin

                            i += 1;
                            l_rstAplicDCL."Entry no." := i;
                            l_rstAplicDCL."DCL Job no." := l_rstDCLLine."No. proyecto";
                            l_rstAplicDCL."DCL Line no." := l_rstDCLLine."No. línea";
                            //Para evitar los problemas de la Raya
                            //l_rstAplicDCL.Activity := l_rst32."Global Dimension 2 Code";
                            l_rstAplicDCL.Activity := l_rstItem."Global Dimension 2 Code";
                            if l_rstDCLLine."Kilos netos" >= l_decKilosMateriaPrima + l_decKNAplicados then begin

                                l_rstAplicDCL."Origin kilos" := l_decKilosMateriaPrima;
                                l_rstAplicDCL."Net kilos" := l_decKN;

                            end
                            else begin

                                l_rstAplicDCL."Net kilos" := Round(l_decKN
                                                             * ((l_rstDCLLine."Kilos netos" - l_decKNAplicados)
                                                             / l_decKilosMateriaPrima), 0.01);
                                l_rstAplicDCL."Origin kilos" := l_rstDCLLine."Kilos netos" - l_decKNAplicados;

                            end;

                            l_rstAplicDCL.Average := l_decPorcentaje;
                            l_rstAplicDCL."Applied job no." := l_rstProyAlt."No.";
                            l_rstAplicDCL."Applied document no." := l_rst50543."No. Documento";
                            l_rstAplicDCL."Line no." := l_rst50543."No. línea";
                            l_rstAplicDCL."Application type" := l_rstAplicDCL."Application type"::Reparto;
                            l_rstAplicDCL."Item no." := l_rstItem."No.";
                            l_rstAplicDCL."Original Item no." := l_codMP;
                            l_rstAplicDCL.Insert;

                            l_decKilosMateriaPrima := l_decKilosMateriaPrima - l_rstAplicDCL."Origin kilos";
                            l_decKN := l_decKN - l_rstAplicDCL."Net kilos";

                        end;

                    end;

                until (l_rstProyAlt.Next(-1) = 0) or (l_decKilosMateriaPrima = 0);
        end
        else
            exit;

        //Si después de aplicar sobre DCLs del mismo buque todavía queda materia prima, sigo con otros DCL de otros buques
        if l_decKilosMateriaPrima <> 0 then begin

            Clear(l_rstProyAlt);
            l_rstProyAlt.SetFilter("Global Dimension 1 Code", '<>%1', l_rstJob."Global Dimension 1 Code");
            /*
              IF l_rstJob."Starting Date" <> 0D  THEN
                l_rstProyAlt.SETFILTER("Ending Date",'<%1',l_rstJob."Starting Date");
            */
            l_rstProyAlt.SetCurrentKey("Ending Date");
            l_rstProyAlt.SetRange(Tipo, l_rstProyAlt.Tipo::Productivo);
            if l_rstProyAlt.FindSet then
                repeat

                    Clear(l_rstDCLLine);
                    l_rstDCLLine.SetRange("No. proyecto", l_rstProyAlt."No.");
                    if l_rstSS."DCL local customer" <> '' then
                        l_rstDCLLine.SetRange(Cliente, l_rstSS."DCL local customer");
                    l_rstDCLLine.SetRange(Clasificación, l_codMP);
                    l_rstDCLLine.SetRange(Registrado, true);
                    /*
                        IF l_rst50543."DCL application date formula" <> '' THEN
                          //l_rstDCLLine.SETRANGE("Fecha DCL",CALCDATE(l_rst50543."DCL application date formula",l_rstCRep."Fecha reparto"),l_rstCRep."Fecha reparto");
                          l_rstDCLLine.SETFILTER("Fecha DCL",'<=%1',CALCDATE(l_rst50543."DCL application date formula",l_rstCRep."Fecha reparto"));
                    */
                    if l_rst50543."DCL application date formula" <> '' then begin
                        //l_rstDCLLine.SETRANGE("Fecha DCL",CALCDATE(l_rst32."DCL application date formula",l_rst32."Posting Date"),l_rst32."Posting Date");
                        if l_rstSS."Production date limit" = '' then
                            l_rstDCLLine.SetFilter("Fecha DCL", '<=%1', CalcDate(l_rst50543."DCL application date formula", l_rstCRep."Fecha reparto"))
                        else
                            l_rstDCLLine.SetFilter("Fecha DCL", '%1..%2', CalcDate(l_rstSS."Production date limit", l_rstCRep."Fecha reparto"), CalcDate(l_rst50543."DCL application date formula", l_rstCRep."Fecha reparto"));
                    end;
                    //Puede haber más de una línea
                    if l_rstDCLLine.FindSet then begin

                        l_decKNAplicados := 0;
                        l_decKNAplicados := fntGetAppliedKilos(l_rstProyAlt."No.", l_rstItem."Global Dimension 2 Code", l_rstSS."DCL local customer", l_codMP, l_rst50543."No. Producto");

                        l_rstDCLLine.CalcFields("Applied kilos");
                        l_rstDCLLine.CalcSums("Kilos netos");
                        //IF l_rstDCLLine."Applied kilos" < l_rstDCLLine."Kilos netos" THEN
                        if (l_rstDCLLine."Kilos netos" > l_decKNAplicados)
                          or (l_decKilosMateriaPrima < 0) then begin

                            i += 1;
                            l_rstAplicDCL."Entry no." := i;
                            l_rstAplicDCL."DCL Job no." := l_rstDCLLine."No. proyecto";
                            l_rstAplicDCL."DCL Line no." := l_rstDCLLine."No. línea";
                            l_rstAplicDCL.Activity := l_rstItem."Global Dimension 2 Code";
                            if l_rstDCLLine."Kilos netos" >= l_decKilosMateriaPrima + l_decKNAplicados then begin

                                l_rstAplicDCL."Origin kilos" := l_decKilosMateriaPrima;
                                l_rstAplicDCL."Net kilos" := l_decKN;

                            end
                            else begin

                                l_rstAplicDCL."Net kilos" := Round(l_decKN
                                                             * ((l_rstDCLLine."Kilos netos" - l_decKNAplicados)
                                                             / l_decKilosMateriaPrima), 0.01);
                                l_rstAplicDCL."Origin kilos" := l_rstDCLLine."Kilos netos" - l_decKNAplicados;

                            end;

                            l_rstAplicDCL.Average := l_decPorcentaje;
                            l_rstAplicDCL."Applied job no." := l_rstProyAlt."No.";
                            l_rstAplicDCL."Applied document no." := l_rst50543."No. Documento";
                            l_rstAplicDCL."Line no." := l_rst50543."No. línea";
                            l_rstAplicDCL."Application type" := l_rstAplicDCL."Application type"::Reparto;
                            l_rstAplicDCL."Item no." := l_rstItem."No.";
                            l_rstAplicDCL."Original Item no." := l_codMP;
                            l_rstAplicDCL.Insert;

                            l_decKilosMateriaPrima := l_decKilosMateriaPrima - l_rstAplicDCL."Origin kilos";
                            l_decKN := l_decKN - l_rstAplicDCL."Net kilos";

                        end;

                    end;

                until (l_rstProyAlt.Next = 0) or (l_decKilosMateriaPrima = 0);

        end
        else
            exit;

        if l_decKilosMateriaPrima <> 0 then begin
            l_rstAplicDCL.SetRange("Applied document no.", l_rstAplicDCL."Applied document no.");
            if l_rstAplicDCL.FindSet then
                repeat
                    Clear(l_rstDCLAppTemp);
                    l_rstDCLAppTemp.TransferFields(l_rstAplicDCL);
                    l_rstDCLAppTemp.Insert;
                until l_rstAplicDCL.Next = 0;
            fntTestDCLApp(l_rstDCLAppTemp);
            Error('No se pudo aplicar a un DCL el movimiento %4 para el producto %1, lote %2, cantidad de kilos %3', l_rstItem."No.", l_rst50543."Lote origen", l_decKN, l_rst50543."No. línea");
        end;

    end;

    local procedure fntGetAppliedKilos(l_codJob: Code[20]; l_codAct: Code[10]; l_codCli: Code[10]; l_codMP: Code[20]; l_codItem: Code[20]) l_decKN: Decimal
    var
        l_rstDCLAppLine: Record "DCL Application Lines";
        l_rst27: Record Item;
        l_rstDCLLine: Record "Lín. DCL";
        l_rstSS: Record "Sales & Receivables Setup";
        l_rstMP: Record Item;
    begin
        Clear(l_rst27);
        l_rst27.Get(l_codItem);
        Clear(l_rstSS);
        l_rstSS.Get();

        Clear(l_rstDCLAppLine);
        l_rstDCLAppLine.SetRange("DCL Job no.", l_codJob);
        l_rstDCLAppLine.SetRange(Activity, l_codAct);
        //l_rstDCLLine.CALCSUMS("Origin kilos");

        if l_rst27."Seguimiento para trazabilidad" = l_rst27."Seguimiento para trazabilidad"::"Forzar uso de L.M." then
            l_rstDCLAppLine.SetRange("Original Item no.", l_codMP);

        if (l_rstDCLAppLine.FindSet) /*AND (l_rst27."Nivel de producción" = l_rst27."Nivel de producción"::"Materia Prima")*/ then
            repeat
                l_decKN += l_rstDCLAppLine."Origin kilos";
            until l_rstDCLAppLine.Next = 0;

        //Esto no debería ser necesario, dado que ya estoy comparando el resultado contra un saldo que tiene restado las aplicaciones manuales
        /*
        CLEAR(l_rstDCLLine);
        l_rstDCLLine.SETRANGE("No. proyecto",l_codJob);
        l_rstDCLLine.SETRANGE(Actividad,l_codAct);
        //l_rstDCLLine.CALCSUMS("Origin kilos");
        {
        IF l_rst27."Seguimiento para trazabilidad" = l_rst27."Seguimiento para trazabilidad"::"Forzar uso de L.M." THEN
          l_rstDCLLine.SETRANGE("Item no.",l_codMP);
        }
        l_rstDCLLine.SETRANGE(Cliente,l_rstSS."DCL local customer");
        l_rstDCLLine.SETRANGE(Registrado,TRUE);
        l_rstDCLLine.SETFILTER("Kilos netos",'<%1',0);
        IF l_rstDCLLine.FINDSET THEN
        REPEAT
          l_decKN += l_decKN-l_rstDCLLine."Kilos netos";
        
        UNTIL l_rstDCLLine.NEXT = 0;
        */
        exit(l_decKN);

    end;

    local procedure fntEliminarAplicacionDCL(l_rst32: Record "Item Ledger Entry")
    var
        l_rst36: Record "Sales Header";
        l_rst37: Record "Sales Line";
        l_rst111: Record "Sales Shipment Line";
        l_rst112: Record "Sales Shipment Header";
        l_rstDCLAL: Record "DCL Application Lines";
    begin
        Clear(l_rst37);
        l_rst37.SetRange("Document No.", l_rst32."Document No.");
        l_rst37.SetRange("Line No.", l_rst32."Document Line No.");
        if l_rst37.FindSet then begin

            //Si la línea de ventas está vinculada a un remito
            if l_rst37."No. remito oficial" <> '' then begin
                Clear(l_rst112);
                l_rst112.SetRange("External Document No.", l_rst37."No. remito oficial");
                if l_rst112.FindLast then begin

                    Clear(l_rst111);
                    l_rst111.Get(l_rst112."No.", l_rst37."No. lín. remito oficial");

                    Clear(l_rstDCLAL);
                    l_rstDCLAL.SetRange("Applied document no.", l_rst112."No.");
                    l_rstDCLAL.SetRange("Line no.", l_rst37."No. lín. remito oficial");
                    l_rstDCLAL.DeleteAll;

                end;
            end;
        end;
    end;

    local procedure fntTestDCLApp(var l_rstDCLApp: Record "DCL Application Lines temp")
    var
        l_cduSI: Codeunit "Single Instance CU DCL";
    begin
        Clear(l_cduSI);
        //l_cduSI.ShowDCL(l_rstDCLApp);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInsertItemLedgEntry', '', true, true)]
    local procedure OnAfterInsertILE(ItemLedgerEntry: Record "Item Ledger Entry"; ItemJournalLine: Record "Item Journal Line"; TransferItem: Boolean)
    begin
        Run();
    end;

}