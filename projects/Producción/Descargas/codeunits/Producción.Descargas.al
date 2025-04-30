codeunit 50509 Descargas
{
    trigger OnRun()
    begin

    end;

    procedure fntGetNextPalletNo(codDto: Code[10]; datFecha: Date; codPallet: Code[10]): Code[10]
    var
        l_rstCDA: Record "On board capture";
        l_rstLDA: Record "On board capture lines";
        l_rstLD: Record "Lín. descarga";
        l_rst167: Record Job;
        l_rstLP: Record "Lin. produccion planta";
        l_rstCP: Record "Produccion Planta";
        rstGLS: Record "General Ledger Setup";
        rstDV: Record "Dimension Value";
        codOrden: Code[10];
        rstIS: Record "Inventory Setup";
        qryLotes: Query "Lotes por lote de origen";
        intIteraciones: Integer;
    begin
        /*
        IF codPallet <> '' THEN
          EXIT(fntCompletarPallet(codPallet));
        */
        Clear(rstGLS);
        rstGLS.Get();
        Clear(rstIS);
        rstIS.Get();
        Clear(rstDV);
        rstDV.Get(rstGLS."Global Dimension 1 Code", codDto);
        rstDV.TestField("Formato codificacion pallet");
        rstDV.TestField("Use code");
        rstDV.SetFilter("Filtro fecha", '>=%1', CalcDate('<-CY>', datFecha));
        rstDV.SetFilter("Pallet filter", '<>*A*&<>*B*&<>*C*&<>*D*&<>*E*&<>*F*&<>*G*&<>*H*&<>*I*&<>*J*&<>*K*&<>*L*&<>*M*&<>*N*&<>*Ñ*&<>*O*&<>*P*&<>*Q*&<>*R*&<>*S*&<>*U*&<>*V*&<>*W*&<>*X*&<>*Y*&<>*Z*');
        rstDV.CalcFields("Last Pallet No.");
        if rstDV."Formato codificacion pallet" <> rstDV."Formato codificacion pallet"::" " then
            fntObtainSetupPalletFormat(rstDV."Formato codificacion pallet", rstDV, datFecha, codPallet)
        else begin
            if rstIS."Formato codificacion pallet" <> rstIS."Formato codificacion pallet"::" " then
                fntObtainSetupPalletFormat(rstIS."Formato codificacion pallet", rstDV, datFecha, codPallet);
        end;

        intIteraciones := 0;

        Clear(qryLotes);
        qryLotes.SetRange(qryLotes.Global_Dimension_1_Code, codDto);
        qryLotes.SetRange(Pallet_no, codPallet);
        qryLotes.Open;
        if qryLotes.Read then
            intIteraciones := qryLotes.Count_;

        if rstDV."Formato codificacion pallet" = rstDV."Formato codificacion pallet"::"Juliano ordenado" then begin
            if codOrden = '' then
                codOrden := 'A'
            else begin

                if intIteraciones <> 0 then
                    repeat

                        if IncStr(codOrden) = '' then begin
                            codOrden[StrLen(codOrden)] := codOrden[StrLen(codOrden)] + 1;
                        end else
                            codOrden := IncStr(codOrden);

                        intIteraciones -= 1;

                    until intIteraciones = 0;

            end;
        end;
        codPallet := codPallet + '-' + codOrden;
        exit(codPallet);

    end;

    [Scope('OnPrem')]
    procedure fntObtainSetupPalletFormat(optTipoFormatoPallet: Option " ","Correlativo por año","Juliano ordenado"; rstDV: Record "Dimension Value"; datFecha: Date; var codPallet: Code[10])
    var
        intCorrelativo: Integer;
        intFecha: Integer;
    begin
        case optTipoFormatoPallet of
            optTipoFormatoPallet::"Correlativo por año":
                begin
                    if codPallet = '' then begin
                        if Evaluate(intCorrelativo, rstDV."Last Pallet No.") then;
                        intCorrelativo += 1;
                    end
                    else begin
                        if Evaluate(intCorrelativo, codPallet) then;
                        intCorrelativo += 1;
                    end;
                    codPallet := Format(intCorrelativo);
                    codPallet := fntCompletarPallet(codPallet);
                end;
            optTipoFormatoPallet::"Juliano ordenado":
                begin
                    if codPallet = '' then begin
                        if datFecha <> 0D then
                            intFecha := datFecha - CalcDate('<-CY>', datFecha) + 1
                        else
                            Error('Debe ingresar una fecha de cálculo');
                        codPallet := Format(intFecha);
                    end
                    else begin
                        Evaluate(intFecha, CopyStr(codPallet, 1, StrPos(codPallet, '-') - 1));
                        if StrPos(codPallet, Format(intFecha)) <> 0 then
                            codPallet[StrLen(codPallet)] := codPallet[StrLen(codPallet)] + 1
                        else
                            codPallet := Format(intFecha) + '-' + codPallet;
                    end;
                end;
        end;
    end;

    local procedure fntCompletarPallet(codPallet: Code[10]): Code[10]
    begin
        if codPallet <> '' then begin

            if StrLen(codPallet) < 4 then
                repeat

                    codPallet := '0' + codPallet;

                until StrLen(codPallet) = 4;

        end;

        exit(codPallet);
    end;

    [Scope('OnPrem')]
    procedure fntSugerirPallets(l_rstPP: Record "Produccion Planta")
    var
        l_rstLPP: Record "Lin. produccion planta";
        Mensaje0001: Label 'Esta Orden de Producción tiene cargado un detalle de ingresos de producto terminado. ¿Desea proseguir con la generación automática de lineas de producción?';
        Error0001: Label 'Se ha detenido la creación de nuevas líneas de producción.';
        l_rstJob: Record Job;
        l_rstTunel: Record "Lin. tunel";
        l_rstTunelAgrupado: Record "Lin. tunel" temporary;
        i: Integer;
        l_rstIUM: Record "Item Unit of Measure";
        l_rstItem: Record Item;
        l_rstILE: Record "Item Ledger Entry";
        l_rstILE2: Record "Item Ledger Entry";
        l_decQ: Decimal;
        l_codPallet: Code[10];
        Error0002: Label 'Se ha detenido la creación de nuevas líneas de producción. No puede modificar una OP registrada.';
        l_rstLPPTemp: Record "Lin. produccion planta";
        l_rstDV: Record "Dimension Value";
        l_rstGLS: Record "General Ledger Setup";
        intFecha: Integer;
        Error0003: Label 'Debe completar la salida de Materia Prima antes de Sugerir Líneas de entrada.';
    begin
        Clear(l_rstLPP);
        l_rstLPP.SetRange("No. documento", l_rstPP."No. documento");
        l_rstLPP.SetRange(Tipo, l_rstLPP.Tipo::Entrada);
        if not l_rstLPP.IsEmpty then
            if not Confirm(Mensaje0001, true) then
                Error(Error0001);

        Clear(l_rstLPP);
        l_rstLPP.SetRange("No. documento", l_rstPP."No. documento");
        l_rstLPP.SetRange(Tipo, l_rstLPP.Tipo::Salida);
        if l_rstLPP.IsEmpty then
            Error(Error0003);

        if l_rstPP.Registrado then
            Error(Error0002);

        Clear(l_rstJob);
        l_rstJob.Get(l_rstPP."Proyecto Destino");

        Clear(l_rstLPP);
        l_rstLPP.SetRange("No. documento", l_rstPP."No. documento");
        if l_rstLPP.FindLast then
            i := l_rstLPP."No. línea";

        Clear(l_rstTunelAgrupado);
        Clear(l_rstTunel);
        l_rstTunel.SetRange("No. documento", l_rstPP."No. documento");
        if l_rstTunel.FindSet then
            repeat

                l_rstTunelAgrupado.SetRange(Clasificacion, l_rstTunel.Clasificacion);
                if l_rstTunelAgrupado.FindFirst then begin

                    l_rstTunelAgrupado.Cantidad += l_rstTunel.Cantidad;
                    l_rstTunelAgrupado.Modify;

                end
                else begin

                    l_rstTunelAgrupado.TransferFields(l_rstTunel);
                    l_rstTunelAgrupado.Insert;

                end;

            until l_rstTunel.Next = 0;

        l_rstTunelAgrupado.SetRange(Clasificacion);
        if l_rstTunelAgrupado.FindSet then
            repeat

                //Empiezo un loop en las líneas de túnel
                Clear(l_rstItem);
                l_rstItem.Get(l_rstTunelAgrupado.Clasificacion);
                l_rstItem.TestField("Cantidad de bultos por pallet");
                l_rstItem.TestField("Lleva No. Pallet");

                l_codPallet := '';

                Clear(l_rstIUM);
                l_rstIUM.Get(l_rstTunelAgrupado.Clasificacion, l_rstTunelAgrupado."Unidad medida");

                //Obtengo la cantidad a palletizar
                if l_decQ = 0 then
                    l_decQ := Round(l_rstTunelAgrupado.Cantidad * l_rstIUM."Qty. per Unit of Measure", 1, '<');

                while l_decQ <> 0 do begin

                    //Verificar que no haya un pallet disponible en inventario, para ese producto, que tenga espacio disponible para completar
                    Clear(l_rstILE);
                    l_rstILE.SetRange("Item No.", l_rstItem."No.");
                    l_rstILE.SetRange(Open, true);
                    l_rstILE.SetFilter("Pallet no.", '<>%1', '');
                    l_rstILE.SetRange("Global Dimension 1 Code", l_rstJob."Global Dimension 1 Code");
                    l_rstILE.SetFilter("Remaining Quantity", '<%1', l_rstItem."Cantidad de bultos por pallet");
                    if l_rstILE.FindFirst then
                        repeat

                            //Verificar si este pallet tiene más de un movimiento, completando la cantidad de bultos por pallet
                            Clear(l_rstILE2);
                            l_rstILE2.SetRange("Item No.", l_rstItem."No.");
                            l_rstILE2.SetRange(Open, true);
                            l_rstILE2.SetRange("Global Dimension 1 Code", l_rstJob."Global Dimension 1 Code");
                            l_rstILE2.SetRange("Item No.", l_rstILE."Item No.");
                            l_rstILE2.SetRange("Pallet no.", l_rstILE."Pallet no.");
                            l_rstILE2.CalcSums("Remaining Quantity");
                            if l_rstILE2."Remaining Quantity" < l_rstItem."Cantidad de bultos por pallet" then begin

                                i += 10000;
                                Clear(l_rstLPP);
                                l_rstLPP."No. documento" := l_rstPP."No. documento";
                                l_rstLPP."Nombre libro diario" := l_rstPP."Nombre libro diario";
                                l_rstLPP."Nombre seccion diario" := l_rstPP."Nombre seccion diario";
                                l_rstLPP."No. línea" := i;
                                l_rstLPP.Tipo := l_rstLPP.Tipo::Entrada;
                                l_rstLPP.Validate(Clasificacion, l_rstTunelAgrupado.Clasificacion);
                                l_rstLPP.Validate("Cod. deposito", l_rstJob."Default location code");
                                l_rstLPP.Validate("No. proyecto", l_rstJob."No.");
                                l_rstLPP.Validate(Buque, l_rstJob."Global Dimension 1 Code");

                                //Verificar que no lo haya utilizado en algún otro momento
                                Clear(l_rstLPPTemp);
                                l_rstLPPTemp.SetRange("No. documento", l_rstPP."No. documento");
                                l_rstLPPTemp.SetRange(Buque, l_rstPP."Global Dimension 1");
                                l_rstLPPTemp.SetRange("No. Pallet", l_rstILE2."Pallet no.");
                                l_rstLPPTemp.SetRange(Tipo, l_rstLPPTemp.Tipo::Entrada);
                                //l_rstLPPTemp.SETRANGE(Clasificacion,l_rstItem."No.");
                                //Si encuentro dicha línea, debo generar un nuevo pallet. Si no la encuentro, sigo adelante y aplico el número de pallet con cantidad pendiente...
                                if l_rstLPPTemp.FindLast then
                                    l_codPallet := l_rstLPPTemp."No. Pallet"
                                else begin

                                    l_rstLPP.Validate("No. Pallet", l_rstILE."Pallet no.");
                                    //Si la cantidad a ocupar en el pallet es mayor o igual a la necesaria para aplicar lo que tengo en túnel, aplico directamente y dejo el remanente en 0
                                    if (l_rstItem."Cantidad de bultos por pallet" - l_rstILE2."Remaining Quantity") >= (l_decQ) then begin

                                        l_rstLPP.Validate(Cantidad, l_decQ);
                                        l_rstLPP."Lin. tunel" := l_rstTunelAgrupado."No. linea";
                                        l_rstLPP."Lote origen" := l_rstILE2."Lote origen";
                                        l_rstLPP.Insert(true);
                                        l_decQ := 0;

                                    end
                                    else begin

                                        //Si la cantidad a ocupar en el pallet es menor a la necesaria para aplicar lo que tengo en túnel, dejo el remanente en la diferencia para aplicar sobre otro pallet
                                        l_rstLPP.Validate(Cantidad, l_rstItem."Cantidad de bultos por pallet" - l_rstILE2."Remaining Quantity");
                                        l_rstLPP."Lin. tunel" := l_rstTunelAgrupado."No. linea";
                                        l_rstLPP."Lote origen" := l_rstILE2."Lote origen";
                                        l_rstLPP.Insert(true);
                                        l_decQ -= l_rstLPP.Cantidad;

                                    end;

                                end;

                            end;

                        until (l_rstILE.Next = 0) or (l_rstILE2."Remaining Quantity" < l_rstItem."Cantidad de bultos por pallet");

                    //Verificar que no haya generado anteriormente un pallet para este producto y este departamento.
                    while l_decQ <> 0 do begin

                        i += 10000;
                        Clear(l_rstLPP);
                        l_rstLPP."No. documento" := l_rstPP."No. documento";
                        l_rstLPP."Nombre libro diario" := l_rstPP."Nombre libro diario";
                        l_rstLPP."Nombre seccion diario" := l_rstPP."Nombre seccion diario";
                        l_rstLPP."No. línea" := i;
                        l_rstLPP.Tipo := l_rstLPP.Tipo::Entrada;
                        l_rstLPP.Validate(Clasificacion, l_rstTunelAgrupado.Clasificacion);
                        l_rstLPP.Validate("Cod. deposito", l_rstJob."Default location code");
                        l_rstLPP.Validate("No. proyecto", l_rstJob."No.");
                        l_rstLPP.Validate(Buque, l_rstJob."Global Dimension 1 Code");
                        l_rstLPP.Validate("Lote origen", l_rstPP."Lote origen");

                        Clear(l_rstLPPTemp);
                        l_rstLPPTemp.SetRange("No. documento", l_rstPP."No. documento");
                        l_rstLPPTemp.SetRange(Buque, l_rstJob."Global Dimension 1 Code");
                        Clear(l_rstGLS);
                        l_rstGLS.Get();
                        Clear(l_rstDV);
                        intFecha := l_rstPP."Fecha registro" - CalcDate('<-CY>', l_rstPP."Fecha registro") + 1;
                        l_rstDV.Get(l_rstGLS."Global Dimension 1 Code", l_rstJob."Global Dimension 1 Code");
                        case l_rstDV."Formato codificacion pallet" of
                            l_rstDV."Formato codificacion pallet"::"Juliano ordenado":
                                l_rstLPPTemp.SetFilter("No. Pallet", '%1', Format(intFecha) + '*');
                        end;
                        //l_rstLPPTemp.SETRANGE(Clasificacion,l_rstItem."No.");
                        if l_rstLPPTemp.FindLast then
                            l_rstLPP.Validate("No. Pallet", fntCreatePalletNo(l_rstJob."Global Dimension 1 Code", l_rstPP."Fecha registro", l_rstLPPTemp."No. Pallet", l_rstLPPTemp.Clasificacion, l_rstLPPTemp."Cod. deposito"))
                        else
                            //Creo un nuevo pallet
                            l_rstLPP.Validate("No. Pallet", fntCreatePalletNo(l_rstJob."Global Dimension 1 Code", l_rstPP."Fecha registro", '', l_rstLPP.Clasificacion, l_rstLPP."Cod. deposito"));

                        //Si la cantidad a aplicar es superior a la que permite un pallet, aplicar parcialmente
                        if l_rstItem."Cantidad de bultos por pallet" > l_decQ then begin

                            l_rstLPP.Validate(Cantidad, l_decQ);
                            l_decQ -= l_decQ;

                        end
                        else begin

                            l_rstLPP.Validate(Cantidad, l_rstItem."Cantidad de bultos por pallet");
                            l_decQ -= l_rstLPP.Cantidad;

                        end;

                        l_rstLPP."Lin. tunel" := l_rstTunelAgrupado."No. linea";
                        l_rstLPP.Insert(true);

                    end;

                end;

            until (l_rstTunelAgrupado.Next = 0);
    end;

    procedure fntSugerirPalletsDescarga(l_rstDescarga: Record "Cab. descarga")
    var
        l_rstLDescarga: Record "Lín. descarga";
        Mensaje0001: Label 'Esta Descarga tiene cargado un detalle de ingresos. ¿Desea proseguir con la generación automática de lineas de descarga?';
        Error0001: Label 'Se ha detenido la creación de nuevas líneas de descarga.';
        l_rstJob: Record Job;
        l_rstLCapitan: Record "Lín. informe capitán";
        i: Integer;
        l_rstIUM: Record "Item Unit of Measure";
        l_rstItem: Record Item;
        l_rstILE: Record "Item Ledger Entry";
        l_decQ: Decimal;
        l_codPallet: Code[10];
        Error0002: Label 'Se ha detenido la creación de nuevas líneas de descarga. No puede modificar una descarga registrada.';
        l_rstLDescargaTemp: Record "Lín. descarga";
    begin
        Clear(l_rstLDescarga);
        l_rstLDescarga.SetRange("No. proyecto", l_rstDescarga."No. proyecto");
        if not l_rstLDescarga.IsEmpty then
            if not Confirm(Mensaje0001, true) then
                Error(Error0001);

        if l_rstDescarga.Registrado then
            Error(Error0002);

        Clear(l_rstJob);
        l_rstJob.Get(l_rstDescarga."No. proyecto");

        Clear(l_rstLDescarga);
        l_rstLDescarga.SetRange("No. proyecto", l_rstDescarga."No. proyecto");
        if l_rstLDescarga.FindLast then
            i := l_rstLDescarga."Line no.";

        Clear(l_rstLCapitan);
        l_rstLCapitan.SetRange(l_rstLCapitan."No. proyecto", l_rstDescarga."No. proyecto");
        if l_rstLCapitan.FindSet then
            repeat

                //Empiezo un loop en las líneas de túnel
                Clear(l_rstItem);
                l_rstItem.Get(l_rstLCapitan.Clasificación);
                l_rstItem.TestField("Cantidad de bultos por pallet");
                l_rstItem.TestField("Lleva No. Pallet");

                l_codPallet := '';

                Clear(l_rstIUM);
                l_rstIUM.Get(l_rstLCapitan.Clasificación, l_rstLCapitan."Unidad medida");

                //Obtengo la cantidad a palletizar
                if l_decQ = 0 then
                    l_decQ := Round(l_rstLCapitan.Cantidad * l_rstIUM."Qty. per Unit of Measure", 1);

                while l_decQ <> 0 do begin

                    i += 10000;
                    Clear(l_rstLDescarga);
                    l_rstLDescarga."No. proyecto" := l_rstDescarga."No. proyecto";
                    l_rstLDescarga."Line no." := i;
                    l_rstLDescarga.Validate("Item no.", l_rstLCapitan.Clasificación);
                    l_rstLDescarga.Validate(Location, l_rstDescarga.Location);
                    l_rstLDescarga.Validate("No. proyecto", l_rstJob."No.");
                    l_rstLDescarga.Validate("Fecha remito", l_rstDescarga."Fecha de inicio de descarga");
                    l_rstLDescarga.Validate(Buque, l_rstJob."Global Dimension 1 Code");
                    l_rstLDescarga.Validate(Marea, l_rstJob."Global Dimension 3 Code");
                    l_rstLDescarga.Validate(Actividad, l_rstJob."Global Dimension 2 Code");
                    l_rstLDescarga.Validate(Puerto, l_rstJob."Puerto Descarga");


                    Clear(l_rstLDescargaTemp);
                    l_rstLDescargaTemp.SetRange(Buque, l_rstJob."Global Dimension 1 Code");
                    l_rstLDescargaTemp.SetRange("Fecha remito", CalcDate('<-CY>', l_rstDescarga."Fecha de inicio de descarga"), CalcDate('<+CY>', l_rstDescarga."Fecha de inicio de descarga"));
                    //l_rstLDescargaTemp.SETRANGE(Clasificacion,l_rstItem."No.");
                    if l_rstLDescargaTemp.FindLast then
                        l_rstLDescarga.Validate("No. Pallet", fntCreatePalletNo(l_rstJob."Global Dimension 1 Code", l_rstDescarga."Fecha de inicio de descarga", l_rstLDescargaTemp."No. Pallet", l_rstLCapitan.Clasificación, l_rstLDescargaTemp.Location))
                    else
                        //Creo un nuevo pallet
                        l_rstLDescarga.Validate("No. Pallet", fntCreatePalletNo(l_rstJob."Global Dimension 1 Code", l_rstDescarga."Fecha de inicio de descarga", '', l_rstLCapitan.Clasificación, l_rstLDescarga.Location));

                    //Si la cantidad a aplicar es superior a la que permite un pallet, aplicar parcialmente
                    if l_rstItem."Cantidad de bultos por pallet" > l_decQ then begin

                        l_rstLDescarga.Validate(Cantidad, l_decQ);
                        l_decQ -= l_decQ;

                    end
                    else begin

                        l_rstLDescarga.Validate(Cantidad, l_rstItem."Cantidad de bultos por pallet");
                        l_decQ -= l_rstLDescarga.Cantidad;

                    end;

                    l_rstLDescarga."Line no." := i;
                    l_rstLDescarga."Item no." := '';
                    l_rstLDescarga.Description := '';
                    l_rstLDescarga.Insert;

                end;

            until (l_rstLCapitan.Next = 0);
    end;

    [Scope('OnPrem')]
    procedure fntCreatePalletNo(codDto: Code[10]; datFecha: Date; codPallet: Code[10]; codItem: Code[20]; codLocation: Code[10]): Code[10]
    var
        rstItem: Record Item;
        rstDV: Record "Dimension Value";
        rstGLS: Record "General Ledger Setup";
        rstLocation: Record Location;
        rstIS: Record "Inventory Setup";
        codDia: Code[2];
        codMes: Code[2];
        codYear: Code[2];
        codFecha: Code[6];
        optTipoFormatoPallet: Option " ","Correlativo por año","Juliano ordenado";
        qryPallet: Query "Pallets por fecha";
        intPallet: Integer;
        intFecha: Integer;
        codOrden: Code[2];
    begin
        //Verificar que haya pasado data de Depto y Marea
        if (codDto = '') or (datFecha = 0D) then
            Error('Verifique la información. Falta departamento o fecha.');

        //Verificar que el Departamento tiene un Formato de codificación de lote. En su defecto, buscar el formato de codificación de lote predefinido en Conf. Inventario
        Clear(rstIS);
        rstIS.Get();

        Clear(rstGLS);
        rstGLS.Get();

        Clear(rstLocation);
        if rstLocation.Get() then;

        Clear(rstDV);
        rstDV.Get(rstGLS."Global Dimension 1 Code", codDto);

        if rstDV."Formato codificacion pallet" <> rstDV."Formato codificacion pallet"::" " then
            optTipoFormatoPallet := rstDV."Formato codificacion pallet"
        else begin

            if rstIS."Formato codificacion pallet" <> rstIS."Formato codificacion pallet"::" " then
                optTipoFormatoPallet := rstIS."Formato codificacion pallet"
            else
                Error(rstIS.FieldCaption("Formato codificacion pallet") + ' debe tener algún valor.');

        end;


        codDia := Format(Date2DMY(datFecha, 1));
        codMes := Format(Date2DMY(datFecha, 2));
        codYear := CopyStr(Format(Date2DMY(datFecha, 3)), 3, 2);
        if StrLen(codDia) = 1 then codDia := '0' + codDia;
        if StrLen(codMes) = 1 then codMes := '0' + codMes;
        codFecha := codYear + codMes + codDia;

        rstItem.Reset;
        if rstItem.Get(codItem) then begin
            if rstItem."Lleva No. Lote" then begin
                if (rstItem."Lleva No. Pallet" and not rstLocation."Don't require pallet no.") then begin
                    case optTipoFormatoPallet of
                        optTipoFormatoPallet::"Correlativo por año":
                            begin
                                if codPallet = '' then begin
                                    Clear(qryPallet);
                                    qryPallet.SetFilter(qryPallet.Global_Dimension_1_Code, codDto);
                                    qryPallet.SetRange(Posting_Date, CalcDate('<-CY>', datFecha), CalcDate('<+CY>', datFecha));
                                    qryPallet.Open;
                                    if not qryPallet.Read then begin
                                        Evaluate(intPallet, qryPallet.Pallet_no);
                                        codPallet := (fntCompletarPallet(Format(intPallet + 1)));
                                    end
                                    else
                                        codPallet := fntCompletarPallet(Format(intPallet + 1));
                                end
                                else begin
                                    Evaluate(intPallet, codPallet);
                                    codPallet := fntCompletarPallet(Format(intPallet + 1));
                                end;
                            end;
                        optTipoFormatoPallet::"Juliano ordenado":
                            begin
                                intFecha := datFecha - CalcDate('<-CY>', datFecha) + 1;
                                if codPallet = '' then begin

                                    Clear(qryPallet);
                                    qryPallet.SetFilter(qryPallet.Global_Dimension_1_Code, codDto);
                                    qryPallet.SetFilter(qryPallet.Pallet_no, '%1', Format(intFecha) + '*');
                                    qryPallet.SetRange(Posting_Date, datFecha);
                                    qryPallet.Open;
                                    //qryPallet.Read;

                                    if not qryPallet.Read then
                                        codPallet := Format(intFecha)//+'-A'
                                    else
                                        repeat
                                            codPallet := qryPallet.Pallet_no;
                                        until (not qryPallet.Read)

                                end;

                                if StrPos(codPallet, '-') <> 0 then
                                    codOrden := CopyStr(codPallet, StrPos(codPallet, '-') + 1, 2);

                                if codOrden = '' then begin
                                    codOrden := 'A';
                                    codPallet := codPallet + '-' + codOrden;
                                end
                                else
                                    codPallet := Format(intFecha) + '-' + fntNextPalletOrder(codOrden);
                            end;
                    end;
                end
            end
            else
                exit('');

        end;

        exit(codPallet);
    end;

    local procedure fntNextPalletOrder(codOrden: Code[2]): Code[2]
    begin
        case StrLen(codOrden) of
            1:
                exit(fntNextLetter(codOrden));
            2:
                begin

                    case CopyStr(codOrden, 2, 1) of
                        'A':
                            exit(CopyStr(codOrden, 1, 1) + 'B');
                        'B':
                            exit(CopyStr(codOrden, 1, 1) + 'C');
                        'C':
                            exit(CopyStr(codOrden, 1, 1) + 'D');
                        'D':
                            exit(CopyStr(codOrden, 1, 1) + 'E');
                        'E':
                            exit(CopyStr(codOrden, 1, 1) + 'F');
                        'F':
                            exit(CopyStr(codOrden, 1, 1) + 'G');
                        'G':
                            exit(CopyStr(codOrden, 1, 1) + 'H');
                        'H':
                            exit(CopyStr(codOrden, 1, 1) + 'I');
                        'I':
                            exit(CopyStr(codOrden, 1, 1) + 'J');
                        'J':
                            exit(CopyStr(codOrden, 1, 1) + 'K');
                        'K':
                            exit(CopyStr(codOrden, 1, 1) + 'L');
                        'L':
                            exit(CopyStr(codOrden, 1, 1) + 'M');
                        'M':
                            exit(CopyStr(codOrden, 1, 1) + 'N');
                        'N':
                            exit(CopyStr(codOrden, 1, 1) + 'O');
                        'O':
                            exit(CopyStr(codOrden, 1, 1) + 'P');
                        'P':
                            exit(CopyStr(codOrden, 1, 1) + 'Q');
                        'Q':
                            exit(CopyStr(codOrden, 1, 1) + 'R');
                        'R':
                            exit(CopyStr(codOrden, 1, 1) + 'S');
                        'S':
                            exit(CopyStr(codOrden, 1, 1) + 'T');
                        'T':
                            exit(CopyStr(codOrden, 1, 1) + 'U');
                        'U':
                            exit(CopyStr(codOrden, 1, 1) + 'V');
                        'V':
                            exit(CopyStr(codOrden, 1, 1) + 'X');
                        'X':
                            exit(CopyStr(codOrden, 1, 1) + 'Y');
                        'Y':
                            exit(CopyStr(codOrden, 1, 1) + 'Z');
                        'Z':
                            exit(fntNextLetter(CopyStr(codOrden, 1, 1) + 'A'));

                    end;
                end;
        end;
    end;

    local procedure fntNextLetter(codLetra: Code[2]): Code[2]
    begin
        case codLetra of
            'A':
                exit('B');
            'B':
                exit('C');
            'C':
                exit('D');
            'D':
                exit('E');
            'E':
                exit('F');
            'F':
                exit('G');
            'G':
                exit('H');
            'H':
                exit('I');
            'I':
                exit('J');
            'J':
                exit('K');
            'K':
                exit('L');
            'L':
                exit('M');
            'M':
                exit('N');
            'N':
                exit('O');
            'O':
                exit('P');
            'P':
                exit('Q');
            'Q':
                exit('R');
            'R':
                exit('S');
            'S':
                exit('T');
            'T':
                exit('U');
            'U':
                exit('V');
            'V':
                exit('X');
            'X':
                exit('Y');
            'Y':
                exit('Z');
            'Z':
                exit('AA');
        end;
    end;

    [Scope('OnPrem')]
    procedure fntGenLote(codDto: Code[10]; codProg: Code[10]; codMarea: Code[10]; codPallet: Code[10]; codItem: Code[20]; datFecha: Date; codLoteOrigen: Code[10]; codDeposito: Code[10]) codLot: Code[30]
    var
        lTBTrackSpec: Record "Tracking Specification";
        cduCreateReservEntry: Codeunit "Create Reserv. Entry";
        rstItem: Record Item;
        intFecha: Integer;
        rst32: Record "Item Ledger Entry";
        blnFin: Boolean;
        qryLotes: Query "Lotes por lote de origen";
        intIteraciones: Integer;
        codOrden: Code[2];
        t: Text;
        rstDV: Record "Dimension Value";
        rstGLS: Record "General Ledger Setup";
        rstLocation: Record Location;
        rstIS: Record "Inventory Setup";
        optTipoFormatoLote: Option " ","Departamento+Marea+Pallet+Día+Máster","Departamento+Día+Pallet+Depto. origen+Marea origen+Máster","Departamento+Día+LoteOrigen","Planta+Fecha+Depto. origen+Marea origen+Pallet";
        codDia: Code[2];
        codMes: Code[2];
        codYear: Code[2];
        codFecha: Code[6];
    begin
        //Verificar que haya pasado data de Depto y Marea
        if (codDto = '') or (codMarea = '') then
            exit('');

        //Si tengo código de pallet, verificar que debe llevar pallet
        if rstItem.Get(codItem) then;
        if codPallet <> '' then begin

            if rstItem.Get(codItem) then
                rstItem.TestField("Lleva No. Pallet");

        end;

        //Verificar que el Departamento tiene un Formato de codificación de lote. En su defecto, buscar el formato de codificación de lote predefinido en Conf. Inventario
        Clear(rstIS);
        rstIS.Get();

        if (rstIS."Categoria productos consumo" = rstItem."Item Category Code") then
            exit;

        Clear(rstGLS);
        rstGLS.Get();

        Clear(rstDV);
        rstDV.Get(rstGLS."Global Dimension 1 Code", codDto);

        if rstDV."Formato codificacion lote" <> rstDV."Formato codificacion lote"::" " then
            optTipoFormatoLote := rstDV."Formato codificacion lote"
        else begin

            if rstIS."Formato codificacion lote" <> rstIS."Formato codificacion lote"::" " then
                optTipoFormatoLote := rstIS."Formato codificacion lote"
            else
                Error(rstIS.FieldCaption("Formato codificacion lote") + ' debe tener algún valor.');

        end;

        Clear(rstLocation);
        if rstLocation.Get(codDeposito) then;

        codDia := Format(Date2DMY(datFecha, 1));
        codMes := Format(Date2DMY(datFecha, 2));
        codYear := CopyStr(Format(Date2DMY(datFecha, 3)), 3, 2);
        if StrLen(codDia) = 1 then codDia := '0' + codDia;
        if StrLen(codMes) = 1 then codMes := '0' + codMes;
        codFecha := codYear + codMes + codDia;

        //Si no completaron número de pallet, y ni el depósito requiere pallet ni el producto requiere pallet
        if ((codPallet = '') and (rstItem."Lleva No. Pallet" = true)) and (rstLocation."Don't require pallet no." = false) then
            codPallet := fntGetNextPalletNo(codDto, datFecha, codPallet);
        rstItem.Reset;
        if rstItem.Get(codItem) then begin
            if rstItem."Lleva No. Lote" then begin
                if (rstItem."Lleva No. Pallet" and not rstLocation."Don't require pallet no.") then begin
                    case optTipoFormatoLote of
                        optTipoFormatoLote::"Departamento+Día+Pallet+Depto. origen+Marea origen+Máster":
                            codLot := codDto + '-' + codFecha + '-' + codPallet + '-' + codLoteOrigen;
                        optTipoFormatoLote::"Departamento+Marea+Pallet+Día+Máster":
                            codLot := codDto + '-' + codMarea + '-' + codPallet + '-' + codFecha;
                        optTipoFormatoLote::"Departamento+Día+LoteOrigen":
                            codLot := codDto + '-' + codFecha + '-' + codLoteOrigen;
                        optTipoFormatoLote::"Planta+Fecha+Depto. origen+Marea origen+Pallet":
                            begin
                                codFecha := codDia + codMes + codYear;
                                codLot := codDto + '-' + codFecha + '-' + CopyStr(codLoteOrigen, 1, 3) + '-M' + CopyStr(codLoteOrigen, 7, 3) + '-' + codPallet;
                            end;
                    end;
                end
                else begin
                    if (rstItem."Lleva No. Pallet")
                      and (rstLocation."Don't require pallet no.")
                      and (codPallet <> '')
                    then
                        Error('No debe ingresar número de pallet para el depósito %1.');
                    case optTipoFormatoLote of
                        optTipoFormatoLote::"Departamento+Día+Pallet+Depto. origen+Marea origen+Máster":
                            codLot := codDto + '-' + codFecha + '-' + codLoteOrigen;
                        optTipoFormatoLote::"Departamento+Marea+Pallet+Día+Máster":
                            codLot := codDto + '-' + codMarea + '-' + codFecha;
                        optTipoFormatoLote::"Departamento+Día+LoteOrigen":
                            codLot := codDto + '-' + codFecha + '-' + codLoteOrigen;
                        optTipoFormatoLote::"Planta+Fecha+Depto. origen+Marea origen+Pallet":
                            begin
                                codFecha := codDia + codMes + codYear;
                                codLot := codDto + '-' + codFecha + '-' + CopyStr(codLoteOrigen, 1, 3) + '-M' + CopyStr(codLoteOrigen, 7, 3);
                            end;
                        else begin
                            if codLoteOrigen = codDto + codMarea then
                                exit(codDto + '-' + codMarea)
                            else begin
                                if codLoteOrigen <> '' then
                                    exit(codDto + '-' + codMarea + '-' + codLoteOrigen)
                                else
                                    exit(codDto + '-' + codMarea);
                            end;
                        end;
                    end;
                end;
            end
            else
                exit('');

        end;

        intIteraciones := 0;

        if codLoteOrigen <> '' then begin

            Clear(rst32);
            rst32.SetRange("Item No.", codItem);
            rst32.SetRange("Pallet no.", codPallet);
            rst32.SetRange(Open, true);
            if rst32.IsEmpty then
                exit(codLot);

            rst32.SetRange("Lote origen", codLoteOrigen);
            if rst32.FindSet then
                exit(codLot);

            Clear(qryLotes);
            qryLotes.SetRange(Item_No_f, codItem);
            qryLotes.SetRange(Pallet_no, codPallet);
            qryLotes.Open;
            if not qryLotes.Read then
                exit(codLot);

            intIteraciones := qryLotes.Count_;

            if codPallet <> '' then begin

                if (codOrden = '') then
                    codOrden := 'A'
                else begin

                    if intIteraciones <> 0 then
                        repeat

                            if IncStr(codOrden) = '' then begin
                                codOrden[StrLen(codOrden)] := codOrden[StrLen(codOrden)] + 1;
                            end else
                                codOrden := IncStr(codOrden);

                            intIteraciones -= 1;

                        until intIteraciones = 0;

                end;

            end;
            /*
            CASE optTipoFormatoLote OF
              optTipoFormatoLote::"Departamento+Día+Pallet+Depto. origen+Marea origen+Máster":
                BEGIN
                  IF codPallet <> '' THEN
                    codLot :=  codDto+'-'+codFecha+'-'+codPallet+'-'+codOrden+'-'+codLoteOrigen
                  ELSE
                    codLot :=  codDto+'-'+codFecha+'-'+codLoteOrigen;
                END;
              optTipoFormatoLote::"Departamento+Marea+Pallet+Día+Máster":
                BEGIN
                  IF codPallet <> '' THEN
                    codLot :=  codDto+'-'+codMarea+'-'+codPallet+'-'+codOrden+'-'+codFecha
                  ELSE
                    codLot :=  codDto+'-'+codMarea+'-'+codFecha;
                END;
              optTipoFormatoLote::"Departamento+Día+LoteOrigen":
                codLot :=  codDto+'-'+codFecha+'-'+codLoteOrigen;
              optTipoFormatoLote::"Planta+Fecha+Depto. origen+Marea origen+Pallet":
              BEGIN
                codFecha := codDia+codMes+codYear;
                codLot :=  codDto+'-'+codFecha+'-'+COPYSTR(codLoteOrigen,1,3)+'-M'+COPYSTR(codLoteOrigen,7,3);
              END;
            END;
            */
        end;

        exit(codLot);

    end;

    [Scope('OnPrem')]
    procedure fntLinkLote(codItem: Code[20]; intTable: Integer; intMode: Integer; decQty: Decimal; decKN: Decimal; decKB: Decimal; codJN: Code[20]; codJB: Code[20]; intLin: Integer; codLot: Code[30]; codLoc: Code[20]; datPD: Date)
    var
        lTBTrackSpec: Record "Tracking Specification";
        cduCreateReservEntry: Codeunit "Create Reserv. Entry";
        VarPallet: Code[10];
        rstItem: Record Item;
        Status: Enum "Reservation Status";
    begin
        cduCreateReservEntry.SetDates(0D, 0D);
        cduCreateReservEntry.SetApplyFromEntryNo(0);
#pragma warning disable AL0126 // TODO: - Reserva
        //cduCreateReservEntry.CreateReservEntryFor(intTable, intMode, codJN, codJB,
#pragma warning restore AL0126 // TODO: - Reserva
        //                                          0, intLin, 1, decQty, decQty, '', codLot,
        //                                          decKN, decKB);
        cduCreateReservEntry.CreateEntry(codItem, '', codLoc, rstItem.Description, datPD, 0D, 0, Status::Tracking);
    end;

    [Scope('OnPrem')]
    procedure fntPrintLabel(codPallet: Code[10]; codMarea: Code[10]; codDepto: Code[20]; datFecha: Date; codClasificacion: Code[30]; decQ: Decimal; codFamilia: Code[30]; blnPrintDataMatrix: Boolean)
    var
        ProcessStartInfo: DotNet dnProcessStartInfo;
        ProcessWindowStyle: DotNet dnProcess;
        Process: DotNet dnProcess;
        FileTest: File;
        StreamInTest: OutStream;
        FileMgt: Codeunit "File Management";
        strData: Text;
        CRLF: Text[2];
        strArchivo: Text;
        rst27: Record Item;
        rstIUM: Record "Item Unit of Measure";
        codM: Code[2];
        codD: Code[2];
        codY: Code[4];
        codYV: Code[4];
        rstDV: Record "Dimension Value";
        rstGLS: Record "General Ledger Setup";
        rstPS: Record "Printer Selection";
        rstSP: Record "Subfamilia producto";
        rstIS: Record "Inventory Setup";
        intImpresiones: Integer;
        rstDVA: Record "Dimension Value";
        strDepto: Text;
    begin
        CRLF := '';
        CRLF[1] := 13;
        CRLF[2] := 10;

        strArchivo := FileMgt.ServerTempFileName('txt');

        FileTest.TextMode(true);
        FileTest.Create(strArchivo);
        FileTest.CreateOutStream(StreamInTest);

        Clear(rst27);
        rst27.Get(codClasificacion);

        Clear(rstIUM);
        rstIUM.SetRange("Item No.", codClasificacion);
        rstIUM.SetFilter("EAN-14 code", '<>%1', '');
        if rstIUM.FindFirst then;

        codD := Format(Date2DMY(datFecha, 1));
        if StrLen(codD) = 1 then
            codD := '0' + codD;

        codM := Format(Date2DMY(datFecha, 2));
        if StrLen(codM) = 1 then
            codM := '0' + codM;

        codY := Format(Date2DMY(datFecha, 3));
        if StrLen(codY) = 4 then
            codY := CopyStr(codY, 3, 2);

        codYV := Format(Date2DMY(CalcDate('<+2Y>', datFecha), 3));
        if StrLen(codY) = 4 then
            codY := CopyStr(codY, 3, 2);

        Clear(rstGLS);
        rstGLS.Get();

        Clear(rstDV);
        rstDV.Get(rstGLS."Global Dimension 1 Code", codDepto);

        Clear(rstSP);
        rstSP.Get(rst27.Familia, rst27.Subfamilia);
        rstSP.TestField("Descripción mínima");
        rst27.TestField("Descripcion minima");
        Clear(rstDVA);
        rstDVA.Get(rstGLS."Global Dimension 2 Code", rst27."Global Dimension 2 Code");
        if StrPos(rstDV.Name, 'Buque ') <> 0 then
            strDepto := CopyStr(rstDV.Name, StrLen('Buque ') + 1, 100)
        else
            strDepto := rstDV.Name;
        Clear(rstIS);
        rstIS.Get();
        if rstIS."Cantidad etiquetas por pallet" <> 0 then begin
            if rstIS."Cantidad etiquetas por pallet" <> 1 then begin
                intImpresiones := rstIS."Cantidad etiquetas por pallet";
            end
            else
                intImpresiones := 1;

        end
        else
            intImpresiones := 1;

        if blnPrintDataMatrix then begin

            strData :=
            '${' + CRLF +
            '^XA' + CRLF +
            '^PQ' + Format(intImpresiones) + CRLF +
            '^FX Cabecera con Nro. Pallet' + CRLF +
            '^FO5,5,0^GB395,70,3^FS' + CRLF +
            '^FO5,5,0^GB395,180,3^FS' + CRLF +
            '^A0N,60,60^FB200,1,0,C,0^FO100,20^FVPALLET^FS' + CRLF +
            '^FX Cabecera con Marea' + CRLF +
            '^FO395,5,0^GB395,70,3^FS' + CRLF +
            '^FO395,5,0^GB395,180,3^FS' + CRLF +
            '^A0N,60,60^FB395,1,0,C,0^FO395,20^FVMAREA^FS' + CRLF +
            '^FX Detalle Nro. Pallet' + CRLF +
            '^A0N,110,110^FB395,1,0,C,0^FO20,90^FV' + codPallet + '^FS' + CRLF +
            '^FX Detalle Marea' + CRLF +
            '^A0N,110,110^FB395,1,0,C,0^FO415,90^FV' + codMarea + '^FS' + CRLF +
            '^FX Cabecera Buque/Planta' + CRLF +
            '^FO5,180,0^GB785,100,3^FS' + CRLF +
            '^A0N,70,70^FB785,1,0,C,0^FO20,200^FVBUQUE/PLANTA^FS' + CRLF +
            '^FX Detalle Buque/Planta' + CRLF +
            '^FO5,280,0^GB785,100,3^FS' + CRLF +
            '^A0N,100,100^FB785,1,0,C,0^FO20,290^FV' + strDepto + '^FS' + CRLF +
            '^FX Detalle Fecha Pallet' + CRLF +
            '^FO5,380,0^GB785,100,3^FS' + CRLF +
            '^A0N,100,100^FB785,1,0,C,0^FO20,390^FV' + Format(datFecha) + '^FS' + CRLF +
            '^FX Detalle Clasificación' + CRLF +
            '^FO5,480,0^GB785,140,3^FS' + CRLF +
            '^A0N,100,100^FB785,1,0,C,0^FO20,510^FV' + rst27."Descripcion minima" + '^FS' + CRLF +
            '^FX Cabecera Bultos por Formato' + CRLF +
            '^FO5,620,0^GB785,70,3^FS' + CRLF +
            '^FO250,620,0^GB540,70,3^FS' + CRLF +
            '^A0N,60,60^FB785,1,0,L,0^FO50,630^FVBULTOS        FORMATO^FS' + CRLF +
            '^FX Detalle Bultos por formato' + CRLF +
            '^FO5,690,0^GB785,280,3^FS' + CRLF +
            '^FO250,690,0^GB540,280,3^FS' + CRLF +
            '^A0N,100,100^FB300,3,0,C,0^FO10,730^FV' + Format(decQ) + '^FS' + CRLF +
            '^A0N,100,100^FB550,3,0,C,0^FO252,700^FV' + rstDVA.Name + ' ' + rstSP."Descripción mínima" + '^FS' + CRLF +
            '^FX Datamatrix' + CRLF +
            '^BY110,110^FT125,960^BXB,5,200,0,0,1,~' + CRLF +
            '^FH\^FD\7E101' + rstIUM."EAN-14 code" + '11' + codY + codM + codD + '12' + codYV + codM + codD + '414' + rstDV.GLN + '^FS' + CRLF +
            '^XZ' + CRLF +
            '}$';

        end
        else begin

            strData :=
            '${' + CRLF +
            '^XA' + CRLF +
            '^PQ' + Format(intImpresiones) + CRLF +
            '^FX Cabecera con Nro. Pallet' + CRLF +
            '^FO5,5,0^GB395,70,3^FS' + CRLF +
            '^FO5,5,0^GB395,180,3^FS' + CRLF +
            '^A0N,60,60^FB200,1,0,C,0^FO100,20^FVPALLET^FS' + CRLF +
            '^FX Cabecera con Marea' + CRLF +
            '^FO395,5,0^GB395,70,3^FS' + CRLF +
            '^FO395,5,0^GB395,180,3^FS' + CRLF +
            '^A0N,60,60^FB395,1,0,C,0^FO395,20^FVMAREA^FS' + CRLF +
            '^FX Detalle Nro. Pallet' + CRLF +
            '^A0N,110,110^FB395,1,0,C,0^FO20,90^FV' + codPallet + '^FS' + CRLF +
            '^FX Detalle Marea' + CRLF +
            '^A0N,110,110^FB395,1,0,C,0^FO415,90^FV' + codMarea + '^FS' + CRLF +
            '^FX Cabecera Buque/Planta' + CRLF +
            '^FO5,180,0^GB785,100,3^FS' + CRLF +
            '^A0N,70,70^FB785,1,0,C,0^FO20,200^FVBUQUE/PLANTA^FS' + CRLF +
            '^FX Detalle Buque/Planta' + CRLF +
            '^FO5,280,0^GB785,100,3^FS' + CRLF +
            '^A0N,100,100^FB785,1,0,C,0^FO20,290^FV' + strDepto + '^FS' + CRLF +
            '^FX Detalle Fecha Pallet' + CRLF +
            '^FO5,380,0^GB785,100,3^FS' + CRLF +
            '^A0N,100,100^FB785,1,0,C,0^FO20,390^FV' + Format(datFecha) + '^FS' + CRLF +
            '^FX Detalle Clasificación' + CRLF +
            '^FO5,480,0^GB785,140,3^FS' + CRLF +
            '^A0N,100,100^FB785,1,0,C,0^FO20,510^FV' + rst27."Descripcion minima" + '^FS' + CRLF +
            '^FX Cabecera Bultos por Formato' + CRLF +
            '^FO5,620,0^GB785,70,3^FS' + CRLF +
            '^FO250,620,0^GB540,70,3^FS' + CRLF +
            '^A0N,60,60^FB785,1,0,L,0^FO50,630^FVBULTOS        FORMATO^FS' + CRLF +
            '^FX Detalle Bultos por formato' + CRLF +
            '^FO5,690,0^GB785,280,3^FS' + CRLF +
            '^FO250,690,0^GB540,280,3^FS' + CRLF +
            '^A0N,100,100^FB300,3,0,C,0^FO10,730^FV' + Format(decQ) + '^FS' + CRLF +
            '^A0N,100,100^FB550,3,0,C,0^FO252,700^FV' + rstDVA.Name + ' ' + rstSP."Descripción mínima" + '^FS' + CRLF +
            '^XZ' + CRLF +
            '}$';

        end;

        StreamInTest.WriteText(strData);

        FileTest.Close();

        FileMgt.DownloadTempFile(strArchivo);

        FileTest.Open(strArchivo);
        FileTest.TextMode(true);

        if IsNull(ProcessStartInfo) then
            ProcessStartInfo := ProcessStartInfo.ProcessStartInfo(FileTest.Name);
        ProcessStartInfo.Verb := 'PrintTo';
        ProcessStartInfo.CreateNoWindow := true;
        //ProcessStartInfo.FileName := FileTest.NAME;
        //ProcessStartInfo.WindowStyle := ProcessWindowStyle;
        Clear(rstPS);
        if rstPS.Get(UserId, 0) then
            ProcessStartInfo.Arguments := '"' + rstPS."Printer Name" + '"';

        Process.Start(ProcessStartInfo);
    end;

    procedure fntRegistroDescarga(rstCabDescarga: Record "Cab. descarga"; rstLinDiaProd: Record "Item Journal Line"; blnRevertir: Boolean; blnImprimir: Boolean): Boolean
    var
        rstConfEx: Record "Inventory Setup";
        rstProyecto: Record Job;
        intCantidadAproxPallets: Integer;
        i: Integer;
        RegistroVisible: Boolean;
        "strCapitán": Text[30];
        rstLinDescarga: Record "Lín. descarga";
        rstLocation: Record Location;
        rst32: Record "Item Ledger Entry";
        rptInforme: Report "Descarga temp. x Informe Cap.";
        rptInformeH: Report "Descarga temp. x Informe Cap.";
        Advertencia0001: Label 'La descarga no tiene una Actividad específica, ¿desea registrarla de esta manera?';
        Error0001: Label 'Se ha detenido el registro.';
        blnRegistrado: Boolean;
    begin
        with rstCabDescarga do begin

            blnRegistrado := false;
            Clear(rstLinDescarga);
            Clear(rstLinDiaProd);
            Clear(rstConfEx);

            if (Actividad = '') and (not blnRevertir) then
                if not Confirm(Advertencia0001) then
                    Error(Error0001);

            TestField("Fecha de inicio de descarga");
            rstLinDescarga.SetRange(rstLinDescarga."No. proyecto", "No. proyecto");
            rstLinDescarga.SetFilter("Item no.", '<>%1', '');
            TestField(Buque);
            TestField(Marea);
            TestField("Libro Diario");

            rstConfEx.Get();
            Clear(rstProyecto);
            rstProyecto.Get("No. proyecto");
            rstProyecto.TestField("Puerto Descarga");

            Clear(rstLinDiaProd);
            rstLinDiaProd.SetRange("Journal Template Name", rstConfEx."Diario Descarga");
            rstLinDiaProd.SetRange("Journal Batch Name", Puerto);
            rstLinDiaProd.DeleteAll;
            Clear(rstLinDiaProd);

            if rstLinDescarga.Find('-') then
                repeat

                    Clear(rstLinDiaProd);
                    rstLinDescarga.TestField("No. remito");
                    rstLinDescarga.TestField(rstLinDescarga.Description);
                    rstLinDescarga.TestField(rstLinDescarga."Unidad medida");
                    rstLinDescarga.TestField(rstLinDescarga.Cantidad);
                    rstLinDescarga.TestField(rstLinDescarga."Net weight");
                    rstLinDescarga.TestField(rstLinDescarga."Gross weight");
                    rstLinDescarga.TestField(rstLinDescarga."Fecha remito");
                    rstLinDescarga.TestField(Location);
                    rstLinDiaProd."Journal Template Name" := rstConfEx."Diario Descarga";
                    rstLinDiaProd."Journal Batch Name" := Puerto;
                    if not blnRevertir then
                        rstLinDiaProd.Validate("Entry Type", rstLinDiaProd."Entry Type"::"Positive Adjmt.")
                    else begin

                        rstLinDiaProd.Validate("Entry Type", rstLinDiaProd."Entry Type"::"Negative Adjmt.");
                        rstLinDiaProd.Revertido := true;

                    end;
                    rstLinDiaProd."Line No." := rstLinDescarga."Line no.";
                    rstLinDiaProd.Validate("Item No.", rstLinDescarga."Item no.");
                    rstLinDiaProd.Validate("Posting Date", rstLinDescarga."Fecha remito");
                    rstLinDiaProd.Validate("Document No.", rstLinDescarga."No. remito");
                    rstLinDiaProd.Validate("Location Code", rstLinDescarga.Location);
                    rstLinDiaProd.Validate("Unit Cost", 0);
                    Clear(rstLocation);
                    rstLocation.Get(rstLinDiaProd."Location Code");
                    if rstLocation."Bin Mandatory" then begin
                        if rstLinDescarga."Bin code" <> '' then
                            rstLinDiaProd.Validate("Bin Code", rstLinDescarga."Bin code")
                        else
                            rstLinDiaProd.Validate("Bin Code", rstLocation."Default bin");
                    end;
                    if Puerto = 'COM.RIV' then
                        rstLinDiaProd.Validate("Entry/Exit Point", 'CRV');
                    if Puerto = 'PTO.DDO' then
                        rstLinDiaProd.Validate("Entry/Exit Point", 'PD');
                    if Puerto = 'PTO.CAM' then
                        rstLinDiaProd.Validate("Entry/Exit Point", 'CAMARONES');
                    if Puerto = 'PTO.MDQ' then
                        rstLinDiaProd.Validate("Entry/Exit Point", 'MDQ');
                    if Puerto = 'PTO.MYN' then
                        rstLinDiaProd.Validate("Entry/Exit Point", 'PM');
                    if Puerto = 'PTO.RAW' then
                        rstLinDiaProd.Validate("Entry/Exit Point", 'RAWSON');
                    rstLinDiaProd."Shortcut Dimension 1 Code" := rstLinDescarga.Buque;
                    rstLinDiaProd."Shortcut Dimension 2 Code" := rstLinDescarga.Actividad;
                    rstLinDiaProd."Shortcut Dimension 3 Code" := rstLinDescarga.Marea;
                    rstLinDiaProd.Validate("No. Pallet", rstLinDescarga."No. Pallet");
                    rstLinDiaProd.Validate("No. Proyecto", "No. proyecto");
                    rstLinDiaProd.Validate("No. Pallet", rstLinDescarga."No. Pallet");
                    rstLinDiaProd.Validate("Shortcut Dimension 1 Code", rstLinDescarga.Buque);
                    rstLinDiaProd.Validate("Shortcut Dimension 2 Code", rstLinDescarga.Actividad);
                    rstLinDiaProd.Validate("Shortcut Dimension 3 Code", rstLinDescarga.Marea);

                    /*
                    IF (blnRevertir) AND (rstLinDescarga."No. Pallet" = '') THEN
                      rstLinDiaProd."Lot No." := rstLinDescarga.Buque+'-'+rstLinDescarga.Marea;
                    */

                    rstLinDiaProd.Validate(Quantity, rstLinDescarga.Cantidad);
                    rstLinDiaProd.Validate("Net kilos", rstLinDescarga."Net weight");
                    rstLinDiaProd.Validate("Gross kilos", rstLinDescarga."Gross weight");
                    rstLinDiaProd.Validate("Unit Cost", 0);
                    rstLinDiaProd."Document Line No." := rstLinDescarga."Line no.";
                    rstLinDiaProd."Lote origen" := rstLinDescarga.Buque + rstLinDescarga.Marea;
                    rstLinDiaProd."Transporte matrícula" := rstLinDescarga."Transport's license";
                    rstLinDiaProd.Temperatura := rstLinDescarga.Temperatura;
                    rstLinDiaProd."Hora de ingreso" := rstLinDescarga."Hora de ingreso";
                    rstLinDiaProd."Tipo de amparo sanitario" := rstLinDescarga."Tipo de amparo sanitario";
                    rstLinDiaProd."No. amparo sanitario" := rstLinDescarga."No. amparo sanitario";
                    rstLinDiaProd.Destino := rstLinDescarga.Destino;
                    rstLinDiaProd.Insert(true);

                until rstLinDescarga.Next = 0;

            CODEUNIT.Run(CODEUNIT::"Item Jnl.-Post", rstLinDiaProd);

            blnRegistrado := true;

            if blnRevertir then begin

                Clear(rst32);
                rst32.SetRange(rst32."Job No.", rstCabDescarga."No. proyecto");
                rst32.SetRange("Nombre libro diario", "Libro Diario");
                rst32.SetRange("Nombre seccion diario", Puerto);
                rst32.ModifyAll(Revertido, true);

                Registrado := false;

            end
            else
                Registrado := true;

            Modify;

            if blnImprimir then begin

                Clear(rptInformeH);
                rstCabDescarga.SetRecFilter;
                Clear(rptInforme);
                rptInforme.fntProyecto(rstCabDescarga."No. proyecto");
                rptInforme.Run;

            end;

            exit(blnRegistrado);

        end;

    end;


    var
        myInt: Integer;
}