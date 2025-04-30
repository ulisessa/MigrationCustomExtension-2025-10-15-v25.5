codeunit 50506 "Interfaz Meta4"
{
    // c

    SingleInstance = true;

    trigger OnRun()
    var
        optParametro: Option Nomina,Personal;
    begin
        case optParametro of
            0:
                fntActivarInterfazMeta4(CalcDate('<-1M-CM>', Today), CalcDate('<-1M+CM>', Today), true, true, false, false);
            1:
                fntSincronizarPersonal(Today, Today, false, true);
        end;
    end;

    var
        rstBuffer: Record "Buffer Meta4";
        blnPersonal: Boolean;
        i: Integer;
        blnSicoreImp: Boolean;
        rstLinDiaGen: Record "Gen. Journal Line";
        strField1: Text[100];
        strField2: Text[100];
        strField3: Text[100];
        strField4: Text[100];
        strField5: Text[100];
        strField6: Decimal;
        strField7: Text[100];
        strField8: Text[100];
        strField9: Text[100];
        strField10: Text[100];
        strField11: Text[100];
        strField12: Text[100];
        strField13: Text[100];
        strField14: Text[100];
        strField15: Text[100];
        strField16: Text[100];
        strField17: Code[10];
        strField18: Code[10];
        datFechaInicio: Date;
        datFechaFin: Date;
        datFecha: Date;
        codBuque: Code[10];
        codMarea: Code[10];
        codProyecto: Code[10];
        codCostoTramo: Code[10];
        rstCta: Record "G/L Account";
        rstCatPuesto: Record "Dimension Value";
        strNPuesto: Text[100];
        strNCat: Text[100];
        strNCuenta: Code[20];
        g_datFechaInicio: Date;
        g_datFechaFinal: Date;
        blnRegistrar: Boolean;
        blnGenerarDiario: Boolean;
        rstHRS: Record "Human Resources Setup";
        g_ConnectionString: Text;

    [Scope('OnPrem')]
    procedure fntActivarInterfazMeta4(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean; l_blnRegistrar: Boolean; l_blnGenerarDiario: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strInicioSic: Text[30];
        strFinalSic: Text[30];
        datFechaVariable: Date;
        strVariable: Text[1024];
        intInteger: Integer;
        decDecimal: Decimal;
        rstMeta4Buffer: Record "Buffer Meta4";
    begin
        if l_blnGenerarDiario then
            blnGenerarDiario := true;

        g_datFechaInicio := datInicio;
        g_datFechaFinal := datFinal;

        if Confirm('Este proceso eliminará todos los registros realizados entre el ' + Format(datInicio) + ' y el ' + Format(datFinal) + '. Desea continuar?') then begin

            Clear(rstMeta4Buffer);
            rstMeta4Buffer.SetRange("Fecha imputacion", datInicio, datFinal);
            rstMeta4Buffer.DeleteAll;

            Clear(rstMeta4Buffer);
            rstMeta4Buffer.SetRange("Fecha sicore", datInicio, datFinal);
            rstMeta4Buffer.DeleteAll;

            if l_blnGenerarDiario then begin

                Clear(rstHRS);
                rstHRS.Get();
                Clear(rstLinDiaGen);
                rstLinDiaGen.SetRange("Journal Template Name", rstHRS."Nombre libro nomina");
                rstLinDiaGen.SetRange("Journal Batch Name", rstHRS."Nombre sección nomina temporal");
                rstLinDiaGen.DeleteAll(false);

                blnGenerarDiario := l_blnGenerarDiario;

                Clear(rstLinDiaGen);
                rstLinDiaGen.SetRange("Journal Template Name", rstHRS."Nombre libro nomina");
                rstLinDiaGen.SetRange("Journal Batch Name", rstHRS."Nombre sección nomina");
                rstLinDiaGen.DeleteAll;

            end;
        end;

        fntSincronizarSindicatoAPagar(datInicio, datFinal, blnSicore, blnVentana);
        strField18 := '';
        fntSincronizarRemuneracionesPasivo(datInicio, datFinal, blnSicore, blnVentana);
        fntSincronizarRemuneracionesResultado(datInicio, datFinal, blnSicore, blnVentana);
        fntSincronizarRemuneracionesPasivoEsp(datInicio, datFinal, blnSicore, blnVentana);
        fntSincronizarRemuneracionesResultadoEsp(datInicio, datFinal, blnSicore, blnVentana);
        fntSincronizarPersonal(datInicio, datFinal, blnSicore, blnVentana);
        fntSincronizarPersonalDatos(datInicio, datFinal, blnSicore, blnVentana);
        /*
        fntSincronizarSindicatoAPagarMaq(datInicio,datFinal,blnSicore,blnVentana);
        fntSincronizarSindicatoAPagarCap(datInicio,datFinal,blnSicore,blnVentana);
        fntSincronizarSindicatoAPagarFEC(datInicio,datFinal,blnSicore,blnVentana);
        fntSincronizarSindicatoAPagarASO(datInicio,datFinal,blnSicore,blnVentana);
        fntSincronizarSindicatoAPagarCON(datInicio,datFinal,blnSicore,blnVentana);
        fntSincronizarSindicatoAPagarPAT(datInicio,datFinal,blnSicore,blnVentana);
        fntSincronizarSindicatoAPagarSBASTI(datInicio,datFinal,blnSicore,blnVentana);
        fntSincronizarSindicatoAPagarSEC(datInicio,datFinal,blnSicore,blnVentana);
        fntSincronizarSindicatoAPagarSOM(datInicio,datFinal,blnSicore,blnVentana);
        fntSincronizarSindicatoAPagarSSI(datInicio,datFinal,blnSicore,blnVentana);
        fntSincronizarSindicatoAPagarUOM(datInicio,datFinal,blnSicore,blnVentana);
        fntSincronizarSindicatoAPagarMaqEsp(datInicio,datFinal,blnSicore,blnVentana);
        fntSincronizarSindicatoAPagarCapEsp(datInicio,datFinal,blnSicore,blnVentana);
        fntSincronizarSindicatoAPagarFECEsp(datInicio,datFinal,blnSicore,blnVentana);
        fntSincronizarSindicatoAPagarASOEsp(datInicio,datFinal,blnSicore,blnVentana);
        fntSincronizarSindicatoAPagarCONEsp(datInicio,datFinal,blnSicore,blnVentana);
        fntSincronizarSindicatoAPagarPATEsp(datInicio,datFinal,blnSicore,blnVentana);
        fntSincronizarSindicatoAPagarSBASTIEsp(datInicio,datFinal,blnSicore,blnVentana);
        fntSincronizarSindicatoAPagarSECEsp(datInicio,datFinal,blnSicore,blnVentana);
        fntSincronizarSindicatoAPagarSOMEsp(datInicio,datFinal,blnSicore,blnVentana);
        fntSincronizarSindicatoAPagarSSIEsp(datInicio,datFinal,blnSicore,blnVentana);
        fntSincronizarSindicatoAPagarUOMEsp(datInicio,datFinal,blnSicore,blnVentana);
        */

        Clear(rstConfCont);
        rstConfCont.Get();
        if (Abs(decTotalxFecha) <> 0) and (Abs(decTotalxFecha) <= 1) then begin

            //fntGenerarLineaDiario(rstConfCont.CuentaRedondeo,-decTotalxFecha,'',FORMAT(datFecha));
            decTotalxFecha := 0;

        end;

        if l_blnGenerarDiario then
            fntConsolidarDiario();

        fntCompletarPersonalAbordo;

    end;

    [Scope('OnPrem')]
    procedure fntGenerarNiveles(VarProy: Text[30])
    var
        PunDepTest: Record "Dimension Value";
        PunDep: Record "Dimension Value";
        rstGLS: Record "General Ledger Setup";
    begin
        PunDepTest.Reset;
        Clear(rstGLS);
        rstGLS.Get();

        codBuque := '';
        codMarea := '';
        codProyecto := '';
        codCostoTramo := '';

        if (CopyStr(VarProy, 1, 1) in ['1', 'A']) and (PunDepTest.Get(rstGLS."Global Dimension 1 Code", '1' + CopyStr(VarProy, 2, 2))) then
            codBuque := '1' + CopyStr(VarProy, 2, 2)
        else begin

            //VER PROYECTO YUKO MARU
            if CopyStr(VarProy, 1, 1) = 'Y' then begin
                codBuque := '128'
            end;

            if CopyStr(VarProy, 1, 2) = 'FM' then begin
                codBuque := '301'
            end;

            if CopyStr(VarProy, 1, 2) = 'KM' then begin
                codBuque := '302'
            end;


            if codBuque = '' then begin

                if (PunDepTest.Get(rstGLS."Global Dimension 1 Code", '2' + CopyStr(VarProy, 2, 2))) then begin
                    codBuque := '2' + CopyStr(VarProy, 2, 2)
                end
                else begin

                    codBuque := CopyStr(VarProy, 1, 3);

                end;

            end;

        end;

        PunDep.Reset;
        if PunDep.Get(rstGLS."Global Dimension 1 Code", codBuque) then;

        if codBuque = 'PPD' then
            codBuque := 'ARB';

        if codCostoTramo = '' then begin

            case codBuque of

                'ADM':
                    begin

                        if (CopyStr(Format(rstLinDiaGen."Account No."), 1, 2) = '61') and
                        (CopyStr(Format(rstLinDiaGen."Account No."), 7, 1) = '6') then
                            codCostoTramo := 'SAC'
                        else
                            codCostoTramo := 'SUE';

                    end;

                'ARB', 'PCR', 'PPM':
                    codCostoTramo := 'JOR';

            end;

        end;

        case codBuque of

            'FLT':
                begin

                    codMarea := 'NOM' + PunDep.Programa;
                    codCostoTramo := CopyStr(VarProy, 10, 3);

                end;

            '301', '302', '303': // VER YUKO MARU
                begin

                    if CopyStr(VarProy, 9, 3) in ['PTO', 'PIL'] then
                        codMarea := 'NOM' + PunDep.Programa;

                    if codMarea = '' then
                        codMarea := CopyStr(VarProy, 3, 6);

                    codCostoTramo := CopyStr(VarProy, 9, 3);

                end;
            /*
              '128':
                BEGIN

                  IF COPYSTR(VarProy,10,3) IN['PTO','PIL'] THEN
                  BEGIN

                    codMarea := 'NOM'+PunDep.programa;
                    codCostoTramo := COPYSTR(VarProy,10,3);

                  END;

                  IF COPYSTR(VarProy,9,3) IN['PTO','PIL'] THEN
                  BEGIN

                    codMarea := 'NOM'+PunDep.programa;
                    codCostoTramo := COPYSTR(VarProy,9,3);

                  END;

                  IF codMarea = '' THEN
                    codMarea := COPYSTR(VarProy,4,6);

                END;
             */
            else begin

                codMarea := CopyStr(VarProy, 4, 6);
                if codCostoTramo = '' then
                    codCostoTramo := CopyStr(VarProy, 10, 3);

            end;

        end;

        if codCostoTramo = 'DIQ' then begin

            codMarea := 'DIQUE';

        end;


        case CopyStr(codMarea, 3, 2) of

            '20':
                begin

                    if codBuque in ['PCR', 'ARB', 'PPM', '110', '101', '112', '114', '115', '116', '117', '118', '119', '126', '127', '128', '129'] then
                        codMarea := 'NOMINA'
                    else
                        codMarea := CopyStr(VarProy, 4, 6);

                    if codCostoTramo = 'AVE' then
                        codMarea := 'AVERIA';
                end;


        end;

        if codBuque in ['102', '106', '107'] then
            codBuque := '999';

    end;

    [Scope('OnPrem')]
    procedure fntCalcularProyecto(): Code[20]
    var
        ProdImprod: Code[10];
        PunProyecto: Record Job;
    begin
        ProdImprod := '';

        case codBuque of

            'ADM', 'FLT':
                ProdImprod := 'PN-';
            'PCR', 'PPD':
                ProdImprod := 'PN-';
            '999':
                exit('PP-999-M.ANTE');

            else
                ProdImprod := 'PP-';

        end;

        //Agregado por A.B. 05-Mar-04

        case CopyStr(codMarea, 1, 3) of

            'NOM':
                //Agregado por A.B. 05-Mar-04
                if (codBuque = 'PCR') or
                   (codBuque = 'ARB') or
                   (codBuque = 'PPM') then begin

                    ProdImprod := 'PN-';
                    //FIN Agregado por A.B. 05-Mar-04
                end
                else begin

                    ProdImprod := 'PN-';
                end;

            'DIQ':
                begin

                    ProdImprod := 'PN-';

                end;
            'AVE':
                begin

                    ProdImprod := 'PN-';

                end;
        //Fin Agregado A.B. 05-Mar-04

        end;
        PunProyecto.Reset;
        PunProyecto.SetRange(PunProyecto."Global Dimension 1 Code", codBuque);
        PunProyecto.SetRange("Global Dimension 3 Code", codMarea);
        //PunProyecto.SETRANGE(Blocked,PunProyecto.Blocked::" ");
        if not PunProyecto.Find('-') then begin

            PunProyecto.Reset;
            PunProyecto.SetRange(PunProyecto."Global Dimension 1 Code", codBuque);
            //PunProyecto.SETRANGE(Blocked,PunProyecto.Blocked::" ");
            if PunProyecto.Find('+') then begin

                if PunProyecto."Global Dimension 3 Code" > codMarea then begin
                    //Agregado por A.B. 05-Mar-04
                    if PunProyecto."Global Dimension 1 Code" = 'PCR' then begin

                        exit(ProdImprod + codBuque + '-' + 'NOMINA');

                    end
                    else begin

                        if PunProyecto."Global Dimension 1 Code" in ['ARB', 'PPM'] then begin

                            exit(ProdImprod + codBuque + '-' + 'NOMINA');

                        end
                        else begin

                            exit(ProdImprod + codBuque + '-' + 'M.ANTE');

                        end;

                    end;
                    //FIN Agregado por A.B. 05-Mar-04
                end
                else begin

                    exit(ProdImprod + codBuque + '-' + codMarea);

                end;

            end;

        end
        else begin
            ;
            exit(ProdImprod + codBuque + '-' + codMarea);
        end;
    end;

    [Scope('OnPrem')]
    procedure fntInsertarDiario(i: Integer; var l_rstLinDiaGen: Record "Gen. Journal Line")
    var
        PunProyecto: Record Job;
        PunCuenta: Record "G/L Account";
        NroMov: Integer;
    begin
        if blnGenerarDiario then begin

            l_rstLinDiaGen.Validate(Amount, Round(/*l_rstLinDiaGen.Debe-l_rstLinDiaGen.Haber*/l_rstLinDiaGen.Amount, 0.01));

            if l_rstLinDiaGen."Job No." <> '' then begin

                Clear(PunCuenta);
                PunCuenta.Get(l_rstLinDiaGen."Account No.");
                if l_rstLinDiaGen.Delete then;

            end;

            //fntCompletarPersonalAbordo;

        end;

        NroMov := 0;

    end;

    [Scope('OnPrem')]
    procedure fntInsertarM4(var cCuenta: Code[20]; cProy: Code[20])
    var
        PunProyecto: Record Job;
        PunCuenta: Record "G/L Account";
        NroMov: Integer;
    begin
        case cCuenta of

            '6110010':
                begin

                    if cProy = 'PN-ADM-BAIRES' then begin

                        cCuenta := '6311006';
                        Clear(rstCta);
                        rstCta.Get(cCuenta);

                    end;

                    if cProy = 'PN-ADM-PTODDO' then begin

                        cCuenta := '6312006';
                        Clear(rstCta);
                        rstCta.Get(cCuenta);

                    end;

                    if cProy = 'PN-ADM-COMRIV' then begin

                        cCuenta := '6313006';
                        Clear(rstCta);
                        rstCta.Get(cCuenta);

                    end;

                end;

            '6110026':
                begin

                    if cProy = 'PN-ADM-BAIRES' then begin

                        cCuenta := '6311023';
                        Clear(rstCta);
                        rstCta.Get(cCuenta);

                    end;

                    if cProy = 'PN-ADM-PTODDO' then begin

                        cCuenta := '6312020';
                        Clear(rstCta);
                        rstCta.Get(cCuenta);

                    end;

                    if cProy = 'PN-ADM-COMRIV' then begin

                        cCuenta := '6313020';
                        Clear(rstCta);
                        rstCta.Get(cCuenta);

                    end;

                    if CopyStr(cProy, 1, 4) in ['PP-P', 'PN-P'] then begin

                        cCuenta := '6106003';
                        Clear(rstCta);
                        rstCta.Get(cCuenta);

                    end;

                end;

            '6311004':
                begin

                    Clear(rstCta);
                    rstCta.Get('6311004');

                end;

            '6110027':
                begin

                    if CopyStr(cProy, 1, 4) in ['PP-1', 'PN-1', 'PN-N'] then begin

                        cCuenta := '6110027';
                        Clear(rstCta);
                        rstCta.Get(cCuenta);

                    end;

                    if cProy = 'PN-ADM-BAIRES' then begin

                        cCuenta := '6311026';
                        Clear(rstCta);
                        rstCta.Get(cCuenta);

                    end;

                    if cProy = 'PN-ADM-PTODDO' then begin

                        cCuenta := '6312023';
                        Clear(rstCta);
                        rstCta.Get(cCuenta);

                    end;

                    if cProy = 'PN-ADM-COMRIV' then begin

                        cCuenta := '6313023';
                        Clear(rstCta);
                        rstCta.Get(cCuenta);

                    end;

                    if CopyStr(cProy, 1, 4) in ['PP-P', 'PN-P'] then begin

                        cCuenta := '6106004';
                        Clear(rstCta);
                        rstCta.Get(cCuenta);

                    end;

                end;

            '6110047':
                begin

                    if CopyStr(cProy, 1, 4) in ['PP-1', 'PN-1', 'PN-N'] then begin

                        cCuenta := '6110047';
                        Clear(rstCta);
                        rstCta.Get(cCuenta);

                    end;

                end;
        end;

        //fntCompletarPersonalAbordo;

        NroMov := 0;
    end;

    [Scope('OnPrem')]
    procedure fntGenerarLineaDiario(codCuenta: Code[10]; decImporte: Decimal; codProyecto: Code[20]; strFecha: Text[30])
    var
        filtString: Text[30];
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        bstrConverter: Integer;
        x: Integer;
        [NonDebuggable]
        rstCuenta: Record "G/L Account";
        rstMeta4: Record "Buffer Meta4";
        tmp_rstMeta4: Record "Buffer Meta4";
        datFecha2: Date;
        decPreviamenteRegistrado: Decimal;
        rstCatPuesto: Record "Dimension Value";
        rst352: Record "Default Dimension";
        codMes: Code[2];
        "codAño": Code[2];
    begin
        fntGenerarNiveles(strField4);

        if strField18 <> '' then
            codCostoTramo := strField18;

        decPreviamenteRegistrado := 0;

        Clear(tmp_rstMeta4);
        tmp_rstMeta4.SetCurrentKey("Id. Sociedad", "Id. Empleado", "Cod. cuenta", "Proyecto original", "Id. Empresa");
        tmp_rstMeta4.SetRange("Id. Sociedad", strField13);
        tmp_rstMeta4.SetRange("Id. Empleado", strField1);
        tmp_rstMeta4.SetRange("Cod. cuenta", codCuenta);
        tmp_rstMeta4.SetRange("Proyecto original", strField4);
        tmp_rstMeta4.SetRange("Id. Empresa", strField3);
        datFecha2 := 0D;
        if StrLen(strField7) > 8 then begin

            if StrLen(strField7) > 10 then
                while StrLen(strField7) > 10 do begin

                    strField7 := CopyStr(strField7, 1, StrPos(strField7, ' ') - 1);

                end;

        end;

        Evaluate(datFecha2, strField7);
        tmp_rstMeta4.SetRange("Fecha imputacion", datFecha2);
        datFecha2 := 0D;
        if StrLen(strField14) > 8 then begin

            if StrLen(strField14) > 10 then
                while StrLen(strField14) > 10 do begin

                    strField14 := CopyStr(strField14, 1, StrPos(strField14, ' ') - 1);

                end;

        end;

        Evaluate(datFecha2, strField14);
        tmp_rstMeta4.SetRange("Fecha pago", datFecha2);
        tmp_rstMeta4.SetRange("Tipo imputacion", strField8);
        tmp_rstMeta4.SetRange("Tipo imputacion auxiliar", strField17);
        datFecha2 := 0D;
        Evaluate(datFecha2, strField14);
        tmp_rstMeta4.SetRange("Fecha pago", datFecha2);
        datFecha2 := 0D;
        Evaluate(datFecha2, strField7);
        tmp_rstMeta4.SetRange(Costo, codCostoTramo);
        tmp_rstMeta4.SetRange("Fecha imputacion", datFecha2);
        tmp_rstMeta4.SetRange("Tipo imputacion", strField8);
        tmp_rstMeta4.SetRange("Id. categoria", strField9);
        tmp_rstMeta4.SetRange("Id. puesto", strField10);
        tmp_rstMeta4.SetRange("Id. nacionalidad", strField15);
        datFecha2 := 0D;
        if StrLen(strField2) > 8 then begin

            if StrLen(strField2) > 10 then
                while StrLen(strField2) > 10 do begin

                    strField2 := CopyStr(strField2, 1, StrPos(strField2, ' ') - 1);

                end;

        end;

        if StrLen(strFecha) > 8 then begin

            if StrLen(strFecha) > 10 then
                while StrLen(strFecha) > 10 do begin

                    strFecha := CopyStr(strFecha, 1, StrPos(strFecha, ' ') - 1);

                end;

        end;

        Evaluate(datFecha2, strField2);
        tmp_rstMeta4.SetRange("Fecha sicore", datFecha2);
        if tmp_rstMeta4.Find('+') then
            decPreviamenteRegistrado += tmp_rstMeta4.Importe;

        if decImporte <> decPreviamenteRegistrado then begin

            Clear(rstMeta4);
            rstMeta4."No. mov." := i;
            rstMeta4."Id. Sociedad" := strField13;
            rstMeta4."Id. Empleado" := strField1;
            Evaluate(rstMeta4."Fecha sicore", strField2);
            fntInsertarM4(codCuenta, fntCalcularProyecto);
            rstMeta4.Proyecto := fntCalcularProyecto;
            rstMeta4."Cod. cuenta" := codCuenta;
            rstMeta4."Id. Empresa" := strField3;
            Evaluate(rstMeta4."Fecha pago", strField14);
            Evaluate(rstMeta4."Fecha imputacion", strField7);
            rstMeta4."Tipo imputacion" := strField8;
            rstMeta4."Tipo imputacion auxiliar" := strField17;
            rstMeta4."Id. categoria" := strField9;
            rstMeta4."Nombre categoria" := strField11;
            rstMeta4."Id. puesto" := strField10;
            rstMeta4."Nombre puesto" := strField12;
            rstMeta4."Id. nacionalidad" := strField15;
            rstMeta4.Importe := decImporte;
            rstMeta4."Fecha de importacion" := CurrentDateTime;
            rstMeta4.Buque := codBuque;
            rstMeta4.Marea := codMarea;
            rstMeta4.Costo := codCostoTramo;
            rstMeta4."Proyecto original" := strField4;
            rstMeta4."Cuenta original" := strField5;
            rstMeta4."Fecha registro" := rstMeta4."Fecha sicore";
            if rstMeta4."Fecha registro" < g_datFechaInicio then
                rstMeta4."Fecha registro" := g_datFechaInicio;
            if rstMeta4."Fecha registro" > g_datFechaFinal then
                rstMeta4."Fecha registro" := g_datFechaFinal;
            if rstMeta4."Fecha registro" = 0D then
                rstMeta4."Fecha registro" := rstMeta4."Fecha sicore";
            if rstMeta4."Fecha sicore" = 0D then
                Error('No hay fecha sicore');

            if (rstMeta4."Fecha registro" < datFechaInicio) then
                rstMeta4."Fecha registro" := rstMeta4."Fecha sicore";

            //datFechaFin;
            if rstMeta4.Importe = 0 then
                Error('Amount inferior al mínimo');

            fntInsertarM4(codCuenta, fntCalcularProyecto);
            rstMeta4.Insert;

            fntMarcarUltimo(rstMeta4);

            fntGenerarNiveles(strField4);

            Clear(rstCuenta);
            rstCuenta.Get(codCuenta);

            if blnGenerarDiario then begin

                Clear(rstLinDiaGen);
                rstLinDiaGen."Journal Template Name" := rstHRS."Nombre libro nomina";
                rstLinDiaGen."Journal Batch Name" := rstHRS."Nombre sección nomina temporal";
                rstLinDiaGen."Line No." := i;
                rstLinDiaGen."Account Type" := rstLinDiaGen."Account Type"::"G/L Account";
                rstLinDiaGen.Validate("Account No.", codCuenta);
                //EVALUATE(rstLinDiaGen."Posting Date",strFecha);
                rstLinDiaGen."Posting Date" := rstMeta4."Fecha sicore";
                if rstLinDiaGen."Posting Date" < g_datFechaInicio then
                    rstLinDiaGen."Posting Date" := g_datFechaInicio;
                if rstLinDiaGen."Posting Date" > g_datFechaFinal then
                    rstLinDiaGen."Posting Date" := g_datFechaFinal;
                if rstLinDiaGen."Posting Date" = 0D then
                    rstLinDiaGen."Posting Date" := rstMeta4."Fecha sicore";
                if rstMeta4."Fecha sicore" = 0D then
                    Error('No hay fecha sicore');
                //  rstLinDiaGen."Posting Date" := rstMeta4."Fecha pago";
                rstLinDiaGen."Document No." := 'Sueldos ' + CopyStr(Format(rstLinDiaGen."Posting Date"), 3, 10);
                rstLinDiaGen.Quantity := 1;
                rstLinDiaGen."External Document No." := rstLinDiaGen."Document No.";

                if rstCuenta."Registro por proyectos" <> rstCuenta."Registro por proyectos"::"Sin código" then begin

                    Clear(PunProyecto);
                    if PunProyecto.Get(codProyecto) then
                        rstLinDiaGen.Validate("Job No.", codProyecto)
                    else
                        rstLinDiaGen.Validate("Job No.", fntCalcularProyecto);
                    PunProyecto.Reset;
                    PunProyecto.SetRange(PunProyecto."No.", rstLinDiaGen."Job No.");
                    if not PunProyecto.Find('-') then
                        Error('No se encuentra el proyecto %1, referencia %2 Buque %3 marea %4', rstLinDiaGen."Job No.", codProyecto, codBuque, codMarea);
                    rstLinDiaGen."Shortcut Dimension 2 Code" := PunProyecto."Global Dimension 2 Code";

                end;

                rstLinDiaGen.Description := 'Meta 4 ' + Format(rstLinDiaGen."Posting Date");//strField2;
                rstLinDiaGen."Id. Sociedad" := rstMeta4."Id. Sociedad";
                rstLinDiaGen."Id. Empleado" := rstMeta4."Id. Empleado";
                rstLinDiaGen."Cod. cuenta" := rstMeta4."Cod. cuenta";
                rstLinDiaGen."Proy." := rstMeta4.Proyecto;
                rstLinDiaGen."Id. Empresa" := rstMeta4."Id. Empresa";
                rstLinDiaGen."Fecha pago" := rstMeta4."Fecha pago";
                rstLinDiaGen."Fecha imputacion" := rstMeta4."Fecha imputacion";
                rstLinDiaGen."Tipo imputacion" := rstMeta4."Tipo imputacion";
                rstLinDiaGen."Id. categoria" := rstMeta4."Id. categoria";
                rstLinDiaGen."Nombre categoria" := rstMeta4."Nombre categoria";

            end;

            Clear(rstCatPuesto);
            if not rstCatPuesto.Get('CATEGORIAS', rstMeta4."Id. categoria") then begin

                rstCatPuesto."Dimension Code" := 'CATEGORIAS';
                rstCatPuesto.Code := rstMeta4."Id. categoria";
                rstCatPuesto.Name := rstMeta4."Nombre categoria";
                rstCatPuesto.Insert;

            end;

            if blnGenerarDiario then begin

                rstLinDiaGen."Id. puesto" := rstMeta4."Id. puesto";
                rstLinDiaGen."Nombre puesto" := rstMeta4."Nombre puesto";

            end;

            Clear(rstCatPuesto);
            if not rstCatPuesto.Get('PUESTOS', rstMeta4."Id. puesto") then begin

                rstCatPuesto."Dimension Code" := 'PUESTOS';
                rstCatPuesto.Code := rstMeta4."Id. puesto";
                rstCatPuesto.Name := rstMeta4."Nombre puesto";
                rstCatPuesto.Insert;

            end;

            if blnGenerarDiario then begin

                rstLinDiaGen."Id. nacionalidad" := rstMeta4."Id. nacionalidad";
                rstLinDiaGen."Fecha sicore" := rstMeta4."Fecha sicore";
                //rstLinDiaGen."Posting Date" := rstMeta4."Fecha sicore";
                rstLinDiaGen.Validate(Amount, Round(decImporte - decPreviamenteRegistrado, 0.01));
                rstLinDiaGen.Amount := rstMeta4.Importe;
                if rstLinDiaGen.Amount = 0 then
                    Error('Amount no puede ser 0');
                rstLinDiaGen."Fecha de importacion" := rstMeta4."Fecha de importacion";
                rstLinDiaGen.Buque := rstMeta4.Buque;
                rstLinDiaGen.Marea := rstMeta4.Marea;
                rstLinDiaGen.Costo := rstMeta4.Costo;
                Clear(rst352);
                rst352.SetRange(rst352."Table ID", 15);
                rst352.SetRange("No.", rstCuenta."No.");
                rst352.SetRange("Dimension Code", 'MES COSTO');
                codMes := '';
                codAño := '';
                if rst352.FindFirst then begin

                    if rst352."Value Posting" in [rst352."Value Posting"::"Code Mandatory",
                                                 rst352."Value Posting"::"Same Code"] then begin

                        if StrLen(Format(Date2DMY(rstLinDiaGen."Posting Date", 2))) = 1 then
                            codMes := '0' + Format(Date2DMY(rstLinDiaGen."Posting Date", 2))
                        else
                            codMes := Format(Date2DMY(rstLinDiaGen."Posting Date", 2));

                        codAño := CopyStr(Format(Date2DMY(rstLinDiaGen."Posting Date", 3)), 3, 2);
                        //rstLinDiaGen.VALIDATE("Shortcut Dimension 7 Code",codMes+'-'+codAño);

                    end;

                end;

                fntInsertarDiario(i, rstLinDiaGen);
                rstLinDiaGen.Insert;

            end;

            i += 1;

        end;
    end;

    [Scope('OnPrem')]
    procedure fntCompletarPersonalAbordo()
    var
        rstPersonal: Record "Personal embarcado";
        rstBufferM4: Record "Buffer Meta4";
        windows: Dialog;
    begin
        windows.Open('Proceso  #0###################################\' +
                      'Empleado #1#############\' +
                      'Fecha    #2#############\' +
                      'Empresa  #3#############\' +
                      'Proyecto #4#############\' +
                      'Cuenta   #5#############\' +
                      'Sueldos  #6#############\' +
                      'Debe     #7#############\' +
                      'Haber    #8#############\');

        windows.Update(0, 'Personal abordo');
        Clear(rstBufferM4);
        if (datFechaInicio <> 0D) and (datFechaFin <> 0D) then
            rstBufferM4.SetRange("Fecha pago", datFechaInicio, datFechaFin);
        if rstBufferM4.Find('-') then
            repeat

                windows.Update(1, rstBufferM4."Id. Empleado");
                Clear(rstPersonal);
                if not rstPersonal.Get(rstBufferM4."Id. Sociedad", rstBufferM4."Id. Empleado", rstBufferM4.Proyecto) then begin

                    rstPersonal.TransferFields(rstBufferM4);
                    rstPersonal.Insert;

                end;

            until rstBufferM4.Next = 0;

        windows.Close;
    end;

    [Scope('OnPrem')]
    procedure fntConsolidarDiario()
    var
        rstLinDiarioGen_temp: Record "Gen. Journal Line";
        rstLinDiarioGen_cons: Record "Gen. Journal Line";
        datFechaReg: Date;
        decImporteTotal: Decimal;
        rstConfCont: Record "General Ledger Setup";
        rstCuenta: Record "G/L Account";
        rstLinDiarioGen_gen: Record "Gen. Journal Line";
        rstMovProy: Record "Job Ledger Entry";
        windows: Dialog;
        intCount: Integer;
        l_rstLinDiaGen: Record "Gen. Journal Line";
    begin
        windows.Open('Proceso  #0###################################\' +
                      'Generación @1@@@@@@@@@@@\' +
                      'Línea    #2#############\' +
                      'De líneas #3#############'
                      );

        windows.Update(0, 'Consolidar diario');
        Clear(rstLinDiarioGen_cons);
        Clear(rstConfCont);
        rstConfCont.Get();

        Clear(rstLinDiarioGen_cons);
        rstLinDiarioGen_cons.SetRange(rstLinDiarioGen_cons."Journal Template Name", rstHRS."Nombre libro nomina");
        rstLinDiarioGen_cons.SetRange("Journal Batch Name", rstHRS."Nombre sección nomina");
        rstLinDiarioGen_cons.DeleteAll;

        i := 0;

        if blnGenerarDiario then begin

            Clear(l_rstLinDiaGen);
            l_rstLinDiaGen.SetCurrentKey("Journal Template Name", l_rstLinDiaGen."Journal Batch Name", l_rstLinDiaGen."Posting Date");
            l_rstLinDiaGen.SetRange("Journal Template Name", rstHRS."Nombre libro nomina");
            l_rstLinDiaGen.SetRange("Journal Batch Name", rstHRS."Nombre sección nomina temporal");
            intCount := l_rstLinDiaGen.Count;
            windows.Update(3, intCount);
            if l_rstLinDiaGen.FindSet then
                repeat

                    i += 10000;
                    Clear(rstCuenta);
                    rstCuenta.Get(l_rstLinDiaGen."Account No.");

                    windows.Update(1, Round((i / 10000 / intCount) * 10000, 1));
                    windows.Update(2, i / 10000);
                    Clear(rstLinDiarioGen_cons);
                    rstLinDiarioGen_cons.SetCurrentKey("Journal Template Name", "Journal Batch Name", "Account No.", "Posting Date",
                                                       ProyectoMeta4);
                    rstLinDiarioGen_cons.SetRange(rstLinDiarioGen_cons."Journal Template Name", rstHRS."Nombre libro nomina");
                    rstLinDiarioGen_cons.SetRange("Journal Batch Name", rstHRS."Nombre sección nomina");
                    rstLinDiarioGen_cons.SetRange("Account No.", l_rstLinDiaGen."Account No.");
                    rstLinDiarioGen_cons.SetRange("Posting Date", l_rstLinDiaGen."Posting Date");
                    /*
                    IF rstCuenta."Registro por proyectos" <> rstCuenta."Registro por proyectos"::"Sin código" THEN
                      rstLinDiarioGen_cons.SETRANGE(ProyectoMeta4,l_rstLinDiaGen."Proy.");
                    */
                    if rstCuenta."Registro por proyectos" = rstCuenta."Registro por proyectos"::"Igual código" then
                        rstLinDiarioGen_cons.SetRange(ProyectoMeta4, rstCuenta."No. proyecto")
                    else
                        if rstCuenta."Registro por proyectos" = rstCuenta."Registro por proyectos"::Obligatorio then
                            rstLinDiarioGen_cons.SetRange(ProyectoMeta4, l_rstLinDiaGen."Proy.");
                    //rstLinDiarioGen_cons.SETRANGE(rstLinDiarioGen_cons."Shortcut Dimension 7 Code",l_rstLinDiaGen."Shortcut Dimension 7 Code");
                    if rstLinDiarioGen_cons.Find('-') then begin

                        rstLinDiarioGen_cons.Validate(rstLinDiarioGen_cons.Amount,
                                                      rstLinDiarioGen_cons.Amount + l_rstLinDiaGen.Amount);
                        rstLinDiarioGen_cons.Modify;

                    end
                    else begin

                        // i += 10000;
                        // windows.UPDATE(1,ROUND((i/10000/intCount)*10000,1));
                        // windows.UPDATE(2,i/10000);
                        Clear(rstLinDiarioGen_cons);
                        rstLinDiarioGen_cons."Journal Template Name" := rstHRS."Nombre libro nomina";
                        rstLinDiarioGen_cons."Journal Batch Name" := rstHRS."Nombre sección nomina";
                        rstLinDiarioGen_cons."Line No." := i;
                        rstLinDiarioGen_cons."Account Type" := rstLinDiarioGen_cons."Account Type"::"G/L Account";
                        rstLinDiarioGen_cons.Validate("Account No.", l_rstLinDiaGen."Account No.");
                        Clear(rstCuenta);
                        rstCuenta.Get(rstLinDiarioGen_cons."Account No.");
                        if rstCuenta."Registro por proyectos" = rstCuenta."Registro por proyectos"::"Igual código" then
                            rstLinDiarioGen_cons.Validate("Job No.", rstCuenta."No. proyecto");
                        rstLinDiarioGen_cons."Posting Date" := l_rstLinDiaGen."Posting Date";
                        rstLinDiarioGen_cons."Document No." := 'Sueldos ' + CopyStr(Format(rstLinDiarioGen_cons."Posting Date"), 3, 10);
                        rstLinDiarioGen_cons.Description := l_rstLinDiaGen.Description;
                        if rstLinDiarioGen_cons."Job No." = '' then
                            rstLinDiarioGen_cons.Validate("Job No.", l_rstLinDiaGen."Job No.");
                        rstLinDiarioGen_cons.Amount := l_rstLinDiaGen.Amount;
                        rstLinDiarioGen_cons.Validate(Amount, l_rstLinDiaGen.Amount);
                        //rstLinDiarioGen_cons.VALIDATE("Shortcut Dimension 7 Code",l_rstLinDiaGen."Shortcut Dimension 7 Code");
                        /*
                            IF rstCuenta."Registro por proyectos" <> rstCuenta."Registro por proyectos"::"Sin código" THEN
                              rstLinDiarioGen_cons.ProyectoMeta4 := l_rstLinDiaGen."Proy.";
                        */
                        if rstCuenta."Registro por proyectos" <> rstCuenta."Registro por proyectos"::"Igual código" then
                            rstLinDiarioGen_cons.ProyectoMeta4 := l_rstLinDiaGen."Proy.";

                        if rstLinDiarioGen_cons.Amount <> 0 then
                            rstLinDiarioGen_cons.Insert;

                    end;

                    if (datFechaReg <> l_rstLinDiaGen."Posting Date") and (datFechaReg <> 0D) then begin

                        if decImporteTotal <> 0 then begin

                            //fntGenerarLineaDiario(rstConfCont.CuentaRedondeo,-decImporteTotal,rstConfCont."No. proyecto ajustes",FORMAT(datFechaReg));
                            i += 10000;
                            Clear(rstLinDiarioGen_gen);
                            rstLinDiarioGen_gen.SetCurrentKey("Journal Template Name", "Journal Batch Name", "Posting Date");
                            rstLinDiarioGen_gen.SetRange(rstLinDiarioGen_gen."Journal Template Name", rstLinDiarioGen_cons."Journal Template Name");
                            rstLinDiarioGen_gen.SetRange("Journal Batch Name", rstLinDiarioGen_cons."Journal Batch Name");
                            rstLinDiarioGen_gen.SetRange("Posting Date", datFechaReg);
                            rstLinDiarioGen_gen.Find('+');
                            Clear(rstLinDiarioGen_cons);
                            rstLinDiarioGen_cons."Journal Template Name" := rstHRS."Nombre libro nomina";
                            rstLinDiarioGen_cons."Journal Batch Name" := rstHRS."Nombre sección nomina";
                            rstLinDiarioGen_cons."Line No." := rstLinDiarioGen_gen."Line No." + 5000;
                            rstLinDiarioGen_cons."Transaction No." := rstLinDiarioGen_gen."Transaction No.";
                            rstLinDiarioGen_cons."Account Type" := rstLinDiarioGen_cons."Account Type"::"G/L Account";
                            rstLinDiarioGen_cons.Validate("Account No.", rstConfCont.CuentaRedondeo);
                            rstLinDiarioGen_cons."Posting Date" := datFechaReg;
                            rstLinDiarioGen_cons."Document No." := 'Sueldos ' + CopyStr(Format(rstLinDiarioGen_cons."Posting Date"), 3, 10);
                            rstLinDiarioGen_cons.Description := l_rstLinDiaGen.Description;
                            if rstLinDiarioGen_cons."Job No." <> '' then
                                rstLinDiarioGen_cons.Validate("Job No.", rstConfCont."No. proyecto ajustes");
                            rstLinDiarioGen_cons.Validate(Amount, -decImporteTotal);
                            if rstLinDiarioGen_cons.Amount <> 0 then
                                rstLinDiarioGen_cons.Insert;

                            decImporteTotal := 0;

                        end;

                    end;

                    datFechaReg := l_rstLinDiaGen."Posting Date";
                    decImporteTotal += l_rstLinDiaGen.Amount;

                until l_rstLinDiaGen.Next = 0;

            if decImporteTotal <> 0 then begin

                /*  IF ABS(decImporteTotal) > 2 THEN
                    ERROR('El Amount del redondeo es %1 en %2, superior al admitido',decImporteTotal,rstLinDiarioGen_cons."Account no.");
                 */
                i += 10000;
                Clear(rstLinDiarioGen_cons);
                rstLinDiarioGen_cons."Journal Template Name" := rstHRS."Nombre libro nomina";
                rstLinDiarioGen_cons."Journal Batch Name" := rstHRS."Nombre sección nomina";
                rstLinDiarioGen_cons."Line No." := i;
                rstLinDiarioGen_cons."Account Type" := rstLinDiarioGen_cons."Account Type"::"G/L Account";
                rstLinDiarioGen_cons.Validate("Account No.", rstConfCont.CuentaRedondeo);
                rstLinDiarioGen_cons."Posting Date" := datFechaReg;
                rstLinDiarioGen_cons."Document No." := 'Sueldos ' + CopyStr(Format(rstLinDiarioGen_cons."Posting Date"), 3, 10);
                ;
                rstLinDiarioGen_cons.Description := l_rstLinDiaGen.Description;
                rstLinDiarioGen_cons.Validate("Job No.", rstConfCont."No. proyecto ajustes");
                rstLinDiarioGen_cons.Validate(Amount, -decImporteTotal);
                if rstLinDiarioGen_cons.Amount <> 0 then
                    rstLinDiarioGen_cons.Insert;

                decImporteTotal := 0;

            end;

        end;

        windows.Close;

        fntCompletarDatosRecursos;

        /*
        CLEAR(rstMovProy);
        rstMovProy.LOCKTABLE;
        */

        if blnRegistrar then begin

            Clear(rstLinDiarioGen_cons);
            rstLinDiarioGen_cons.SetRange("Journal Template Name", rstHRS."Nombre libro nomina");
            rstLinDiarioGen_cons.SetRange("Journal Batch Name", rstHRS."Nombre sección nomina");
            if rstLinDiarioGen_cons.Find('-') then
                CODEUNIT.Run(CODEUNIT::"Gen. Jnl.-Post Batch", rstLinDiarioGen_cons);

        end;

        //rstLinDiarioGen_cons.DELETEALL;

    end;

    [Scope('OnPrem')]
    procedure fntCompletarDatosRecursos()
    var
        rstRecurso: Record Employee;
        rstBufferMeta4: Record "Buffer Meta4";
    begin
        Clear(rstRecurso);

        if rstRecurso.Find('-') then
            repeat

                Clear(rstBufferMeta4);
                rstBufferMeta4.SetRange("Id. Empleado", rstRecurso."No.");
                if rstBufferMeta4.Find('+') then begin

                    rstRecurso.Categoría := rstBufferMeta4."Id. categoria";
                    rstRecurso.Puesto := rstBufferMeta4."Id. puesto";
                    rstRecurso."No. proyecto" := rstBufferMeta4.Proyecto;
                    rstRecurso.Modify;

                end;

            until rstRecurso.Next = 0;
    end;

    [Scope('OnPrem')]
    procedure fntMarcarUltimo(l_tmp_rstMeta4: Record "Buffer Meta4")
    var
        datFecha2: Date;
        l_codCuenta: Code[10];
    begin
        Clear(l_tmp_rstMeta4);
        l_tmp_rstMeta4.SetRange("Id. Sociedad", strField13);
        l_tmp_rstMeta4.SetRange("Id. Empleado", strField1);
        l_codCuenta := strField5;
        fntInsertarM4(l_codCuenta, fntCalcularProyecto);
        l_tmp_rstMeta4.SetRange("Cod. cuenta", l_codCuenta);
        l_tmp_rstMeta4.SetRange("Proyecto original", strField4);
        l_tmp_rstMeta4.SetRange("Id. Empresa", strField3);
        datFecha2 := 0D;
        Evaluate(datFecha2, strField7);
        l_tmp_rstMeta4.SetRange("Fecha imputacion", datFecha2);
        datFecha2 := 0D;
        Evaluate(datFecha2, strField14);
        l_tmp_rstMeta4.SetRange("Fecha pago", datFecha2);
        l_tmp_rstMeta4.SetRange("Tipo imputacion", strField8);
        l_tmp_rstMeta4.SetRange("Tipo imputacion auxiliar", strField17);
        datFecha2 := 0D;
        Evaluate(datFecha2, strField14);
        l_tmp_rstMeta4.SetRange("Fecha pago", datFecha2);
        datFecha2 := 0D;
        Evaluate(datFecha2, strField7);
        l_tmp_rstMeta4.SetRange(Costo, codCostoTramo);
        l_tmp_rstMeta4.SetRange("Fecha imputacion", datFecha2);
        l_tmp_rstMeta4.SetRange("Tipo imputacion", strField8);
        l_tmp_rstMeta4.SetRange("Tipo imputacion auxiliar", strField17);
        l_tmp_rstMeta4.SetRange("Id. categoria", strField9);
        l_tmp_rstMeta4.SetRange("Id. puesto", strField10);
        l_tmp_rstMeta4.SetRange("Id. nacionalidad", strField15);
        datFecha2 := 0D;
        Evaluate(datFecha2, strField2);
        l_tmp_rstMeta4.SetRange("Fecha sicore", datFecha2);
        l_tmp_rstMeta4.ModifyAll(l_tmp_rstMeta4."Registro real", false);
        l_tmp_rstMeta4.Find('+');
        l_tmp_rstMeta4."Registro real" := true;
        l_tmp_rstMeta4.Modify;
    end;

    [Scope('OnPrem')]
    procedure fntActPersonal(l_blnPersonal: Boolean)
    begin
        blnPersonal := l_blnPersonal;
    end;

    [Scope('OnPrem')]
    procedure fntSincronizarPersonal(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strNBanco: Text[30];
        ServerName: Text;
        OracleDB: Text;
        ConnectionString: Text;
        UserName: Text;
        Pass: Text;
        datFechaVariable: Date;
        strVariable: Text[1024];
        rstCatPue: Record "Dimension Value";
        strNConvenio: Text;
        rstConvenio: Record "Dimension Value";
        strIConvenio: Text;
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');

        g_ConnectionString := fntConfSincrMeta4;

        windows.Update(0, 'Sincronizar personal');
        filtString1 := '';

        filtString1 :=
                 'select d.ID_EMPLEADO,d.FEC_BAJA,D.FEC_ALTA_EMPLEADO,g.id_categoria,h.id_puesto,f.n_categoria,e.n_puesto,i.num_cuenta,j.id_convenio,k.N_CONVENIO,' +
                 'i.id_banco ' +
                 'from m4t_fases_alta d,m4_puestos_trabajo e,m4_categorias f,m4t_hist_categorias g ,m4t_hist_puestos h,m4t_datos_pago i,M4t_hist_convenios j,m4t_convenios k ' +
                 'where g.id_empleado = d.ID_empleado ' +
                 'and g.id_categoria = f.id_categoria ' +
                 'and g.FEC_ALTA_EMPLEADO = d.FEC_ALTA_EMPLEADO ' +
                 'and h.id_empleado = d.ID_empleado ' +
                 'and h.id_puesto = e.id_puesto ' +
                 'and h.FEC_ALTA_EMPLEADO = d.FEC_ALTA_EMPLEADO ' +
                 'and d.Fec_Baja is null ' +
                 'and g.fec_fin is null ' +
                 'and h.fec_fin is null ' +
                 'and i.ID_EMPLEADO = d.ID_empleado ' +
                 'and i.NUM_CUENTA is not null ' +
                 'and j.id_empleado = g.id_empleado ' +
                 'and j.fec_fin is null ' +
                 'and j.id_convenio = k.id_convenio ' +
                 'group by d.ID_EMPLEADO,d.FEC_BAJA,D.FEC_ALTA_EMPLEADO,g.id_categoria,h.id_puesto,f.n_categoria,e.n_puesto,i.num_cuenta,j.id_convenio,k.N_CONVENIO,i.id_banco ' +
                 'order by d.ID_EMPLEADO';


        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);
        aADO_Con.Open;

        //aADO_Comm := aADO_Con.OracleConnection;

        aADO_Comm := aADO_Comm.OracleCommand(filtString1, aADO_Con);

        aADO_Reader := aADO_Comm.ExecuteReader;

        while aADO_Reader.Read() do begin

            if blnVentana then
                windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));

            Clear(rstRecurso);
            decLegajo := 0;

            Evaluate(decLegajo, Format(aADO_Reader.Item('ID_EMPLEADO')));

            codLegajo := '';
            codLegajo := DelChr(Format(decLegajo), '=', ',.');

            if StrLen(codLegajo) < 5 then
                repeat

                    codLegajo := '0' + codLegajo;

                until StrLen(codLegajo) = 5;

            if not rstRecurso.Get(codLegajo) then begin

                rstRecurso."No." := codLegajo;

                if Evaluate(datFechaVariable, aADO_Reader.Item('Fec_Baja')) then
                    rstRecurso."Fecha baja" := aADO_Reader.Item('Fec_Baja');

                rstRecurso."pat_Fecha ingreso laboral" := DT2Date(aADO_Reader.Item('FEC_ALTA_EMPLEADO'));
                rstRecurso."Employment Date" := DT2Date(aADO_Reader.Item('FEC_ALTA_EMPLEADO'));

                if Evaluate(strVariable, aADO_Reader.Item('ID_CATEGORIA')) then
                    rstRecurso.Categoría := aADO_Reader.Item('ID_CATEGORIA');

                strNCat := '';
                if Evaluate(strVariable, aADO_Reader.Item('N_CATEGORIA')) then
                    strNCat := aADO_Reader.Item('N_CATEGORIA');

                if Evaluate(strVariable, aADO_Reader.Item('ID_PUESTO')) then
                    rstRecurso.Puesto := aADO_Reader.Item('ID_PUESTO');

                strNPuesto := '';
                if Evaluate(strVariable, aADO_Reader.Item('N_PUESTO')) then
                    strNPuesto := aADO_Reader.Item('N_PUESTO');

                strNCuenta := '';
                if Evaluate(strVariable, aADO_Reader.Item('NUM_CUENTA')) then
                    strNCuenta := aADO_Reader.Item('NUM_CUENTA');

                rstRecurso.pat_CBU := strNCuenta;

                strNBanco := '';
                if Evaluate(strVariable, aADO_Reader.Item('ID_BANCO')) then
                    strNBanco := aADO_Reader.Item('ID_BANCO');

                rstRecurso."pat_Dependencia de pago" := strNBanco;

                strIConvenio := '';
                if Evaluate(strVariable, aADO_Reader.Item('ID_CONVENIO')) then
                    strNConvenio := aADO_Reader.Item('ID_CONVENIO');

                rstRecurso."pat_Cod. convenio" := strIConvenio;

                strNConvenio := '';
                if Evaluate(strVariable, aADO_Reader.Item('N_CONVENIO')) then
                    strNConvenio := aADO_Reader.Item('N_CONVENIO');

                rstRecurso."pat_Nombre convenio" := strNConvenio;


                Clear(rstCatPuesto);
                if not rstCatPuesto.Get('CATEGORIAS', rstRecurso.Categoría) then begin

                    rstCatPuesto."Dimension Code" := 'CATEGORIAS';
                    rstCatPuesto.Code := rstRecurso.Categoría;
                    rstCatPuesto.Name := strNCat;
                    rstCatPuesto.Insert;

                end;

                Clear(rstCatPuesto);
                if not rstCatPuesto.Get('PUESTOS', rstRecurso.Puesto) then begin

                    rstCatPuesto."Dimension Code" := 'PUESTOS';
                    rstCatPuesto.Code := rstRecurso.Puesto;
                    rstCatPuesto.Name := strNCat;
                    rstCatPuesto.Insert;

                end;

                Clear(rstConvenio);
                if not rstConvenio.Get('CONVENIO', rstRecurso."pat_Cod. convenio") then begin

                    rstConvenio."Dimension Code" := 'CONVENIO';
                    rstConvenio.Code := rstRecurso."pat_Cod. convenio";
                    rstConvenio.Name := rstRecurso."pat_Nombre convenio";
                    rstConvenio.Insert;

                end;

                if not rstRecurso.Insert then
                    rstRecurso.Modify;

            end
            else begin

                if Evaluate(datFechaVariable, aADO_Reader.Item('Fec_Baja')) then
                    rstRecurso."Fecha baja" := aADO_Reader.Item('Fec_Baja');

                rstRecurso."pat_Fecha ingreso laboral" := DT2Date(aADO_Reader.Item('FEC_ALTA_EMPLEADO'));
                rstRecurso."Employment Date" := DT2Date(aADO_Reader.Item('FEC_ALTA_EMPLEADO'));

                if Evaluate(strVariable, aADO_Reader.Item('ID_CATEGORIA')) then
                    rstRecurso.Categoría := aADO_Reader.Item('ID_CATEGORIA');

                strNCat := '';
                if Evaluate(strVariable, aADO_Reader.Item('N_CATEGORIA')) then
                    strNCat := aADO_Reader.Item('N_CATEGORIA');

                if Evaluate(strVariable, aADO_Reader.Item('ID_PUESTO')) then
                    rstRecurso.Puesto := aADO_Reader.Item('ID_PUESTO');

                strNPuesto := '';
                if Evaluate(strVariable, aADO_Reader.Item('N_PUESTO')) then
                    strNPuesto := aADO_Reader.Item('N_PUESTO');

                strNCuenta := '';
                if Evaluate(strVariable, aADO_Reader.Item('NUM_CUENTA')) then
                    strNCuenta := aADO_Reader.Item('NUM_CUENTA');

                rstRecurso.pat_CBU := strNCuenta;

                strIConvenio := '';
                if Evaluate(strVariable, aADO_Reader.Item('ID_CONVENIO')) then
                    strNConvenio := aADO_Reader.Item('ID_CONVENIO');

                rstRecurso."pat_Cod. convenio" := strIConvenio;

                strNConvenio := '';
                if Evaluate(strVariable, aADO_Reader.Item('N_CONVENIO')) then
                    strNConvenio := aADO_Reader.Item('N_CONVENIO');

                rstRecurso."pat_Nombre convenio" := strNConvenio;

                strNBanco := '';
                if Evaluate(strVariable, aADO_Reader.Item('ID_BANCO')) then
                    strNBanco := aADO_Reader.Item('ID_BANCO');

                rstRecurso."pat_Dependencia de pago" := strNBanco;

                Clear(rstConvenio);
                if not rstConvenio.Get('CONVENIO', rstRecurso."pat_Cod. convenio") then begin

                    rstConvenio."Dimension Code" := 'CONVENIO';
                    rstConvenio.Code := rstRecurso."pat_Cod. convenio";
                    rstConvenio.Name := rstRecurso."pat_Nombre convenio";
                    rstConvenio.Insert;

                end;

                Clear(rstCatPuesto);
                if not rstCatPuesto.Get('CATEGORIAS', rstRecurso.Categoría) then begin

                    rstCatPuesto."Dimension Code" := 'CATEGORIAS';
                    rstCatPuesto.Code := rstRecurso.Categoría;
                    rstCatPuesto.Name := strNCat;
                    rstCatPuesto.Insert;

                end;

                Clear(rstCatPuesto);
                if not rstCatPuesto.Get('PUESTOS', rstRecurso.Puesto) then begin

                    rstCatPuesto."Dimension Code" := 'PUESTOS';
                    rstCatPuesto.Code := rstRecurso.Puesto;
                    rstCatPuesto.Name := strNPuesto;
                    rstCatPuesto.Insert;

                end;


                if not rstRecurso.Insert then
                    rstRecurso.Modify;

            end;

        end;

        windows.Close;
        Commit;

        fntSincronizarPersonalDatos(datInicio, datFinal, blnSicore, blnVentana);
    end;

    [Scope('OnPrem')]
    procedure fntSincronizarPersonalDatos(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text;
        filtString2: Text;
        filtString3: Text;
        filtString4: Text;
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strNBanco: Text[30];
        ServerName: Text;
        OracleDB: Text;
        ConnectionString: Text;
        UserName: Text;
        Pass: Text;
        datFechaVariable: Date;
        strVariable: Text;
        rstHRS: Record "Human Resources Setup";
        rstDV: Record "Default Dimension";
        rstDirecciones: Record "Alternative Address";
        rstDatoPago: Record "Employee payment data";
        rstComent: Record "Human Resource Comment Line";
        intVariable: Decimal;
        rstPuerto: Record "Entry/Exit Point";
        rstArea: Record "Area";
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');

        windows.Update(0, 'Personal datos');

        filtString1 := '';

        filtString1 :=
                 'select a.ID_EMPLEADO, a.Nombre, a.Apellido_1, a.Apellido_2, a.ID_TIPO_DOCUMENTO,a.NUM_DOCUMENTO, ' +
                 'a.FEC_NACIMIENTO, a.ID_SEXO, a.ID_ESTADO_CIVIL, a.CUIL, a.ID_NACIONALIDAD,b.ID_EMPLEADO, b.id_subdiv_geografica, ' +
                 'b.ID_SIGLA_DOMICILIO,b.VIA_publica,b.NUM_VIA,b.PISO,c.N_SUBDIV_GEOGRAFICA POBLACION,b.TELEFONO,b.COMENT,b.DISTRITO_POSTAL,B.ID_SUBDIV_GEOGRAFICA,B.COMENT COMDIR,i.id_banco, ' +
                 'c.id_subdiv_geografica, c.n_subdiv_geografica,b.DEPARTAMENTO,d.ID_EMPLEADO,f.N_CATEGORIA,max(d.FEC_BAJA),max(d.FEC_ALTA_EMPLEADO), ' +
                 'i.id_dato_pago,i.fec_inicio,i.fec_fin,i.id_agencia,i.num_cuenta,i.id_forma_pago,i.id_centro_pago,i.id_tipo_benefic,i.id_legal,i.id_tipo_cuenta,i.coment COMENTPAGO,i.n_sucursal ' +
                 'from m4t_empleados a,m4t_domicilio_empleado b,m4t_subdiv_geografica c,m4t_fases_alta d,m4t_hist_categorias e,' +
                 'm4_categorias f,m4t_datos_pago i ' +
                 'where a.ID_EMPLEADO = b.ID_EMPLEADO ' +
                 'AND a.ID_EMPLEADO = e.ID_EMPLEADO ';
        filtString2 :=
                 'AND b.ID_SUBDIV_GEOGRAFICA = c.ID_SUBDIV_GEOGRAFICA ' +
                 'AND a.ID_EMPLEADO = d.ID_EMPLEADO ' +
                 'AND e.id_categoria = f.id_categoria ' +
                 'and i.ID_EMPLEADO = d.ID_empleado ' +
        //         'and i.NUM_CUENTA is not null '+
                 'group by a.ID_EMPLEADO, a.Nombre, a.Apellido_1, a.Apellido_2, a.ID_TIPO_DOCUMENTO,a.NUM_DOCUMENTO, ' +
                 'a.FEC_NACIMIENTO, a.ID_SEXO, a.ID_ESTADO_CIVIL, a.CUIL, a.ID_NACIONALIDAD,b.ID_EMPLEADO, b.id_subdiv_geografica, ' +
                 'b.ID_SIGLA_DOMICILIO,b.VIA_publica,b.NUM_VIA,b.PISO,c.N_SUBDIV_GEOGRAFICA,b.DISTRITO_POSTAL,B.ID_SUBDIV_GEOGRAFICA, ' +
                 'c.id_subdiv_geografica, c.n_subdiv_geografica,b.DEPARTAMENTO,d.ID_EMPLEADO,f.N_CATEGORIA,i.id_banco,B.COMENT, ' +
                 'i.id_dato_pago,i.fec_inicio,i.fec_fin,i.id_agencia,i.num_cuenta,i.id_forma_pago,i.id_centro_pago, ' +
                 'i.id_tipo_benefic,i.id_legal,i.id_tipo_cuenta,i.coment,i.n_sucursal,b.TELEFONO,b.COMENT ' +
                 'order by a.ID_EMPLEADO, a.Nombre, a.Apellido_1, a.Apellido_2, a.ID_TIPO_DOCUMENTO,a.NUM_DOCUMENTO, ' +
                 'a.FEC_NACIMIENTO, a.ID_SEXO, a.ID_ESTADO_CIVIL, a.CUIL, a.ID_NACIONALIDAD,b.ID_EMPLEADO, b.id_subdiv_geografica, ' +
                 'b.ID_SIGLA_DOMICILIO,b.VIA_publica,b.NUM_VIA,b.PISO,c.N_SUBDIV_GEOGRAFICA,b.DISTRITO_POSTAL,B.ID_SUBDIV_GEOGRAFICA, ' +
                 'c.id_subdiv_geografica, c.n_subdiv_geografica,b.DEPARTAMENTO,d.ID_EMPLEADO,f.N_CATEGORIA,i.id_banco,B.COMENT, ' +
                 'i.id_dato_pago,i.fec_inicio,i.fec_fin,i.id_agencia,i.num_cuenta,i.id_forma_pago,i.id_centro_pago, ' +
                 'i.id_tipo_benefic,i.id_legal,i.id_tipo_cuenta,i.coment,i.n_sucursal,b.TELEFONO,b.COMENT';

        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);
        aADO_Con.Open;
        //aADO_Comm := aADO_Con.OracleConnection;
        aADO_Comm := aADO_Comm.OracleCommand(filtString1 + filtString2, aADO_Con);
        aADO_Reader := aADO_Comm.ExecuteReader;

        while aADO_Reader.Read() do begin

            begin

                if blnVentana then
                    windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));

                Clear(rstRecurso);
                decLegajo := 0;

                Evaluate(decLegajo, Format(aADO_Reader.Item('ID_EMPLEADO')));

                codLegajo := '';
                codLegajo := DelChr(Format(decLegajo), '=', ',.');

                if StrLen(codLegajo) < 5 then
                    repeat

                        codLegajo := '0' + codLegajo;

                    until StrLen(codLegajo) = 5;

                if not rstRecurso.Get(codLegajo) then begin

                    rstRecurso."No." := codLegajo;

                    rstRecurso.Name := Format(aADO_Reader.Item('Nombre'));
                    rstRecurso.pat_Nombre := Format(aADO_Reader.Item('Nombre'));

                    if Evaluate(strVariable, aADO_Reader.Item('Apellido_1')) then begin
                        rstRecurso."First Family Name" := Format(aADO_Reader.Item('Apellido_1'));
                        rstRecurso.pat_Apellido := Format(aADO_Reader.Item('Apellido_1'));
                    end;

                    if Evaluate(strVariable, aADO_Reader.Item('Apellido_2')) then
                        if strVariable <> 'null' then begin
                            rstRecurso."Second Family Name" := Format(aADO_Reader.Item('Apellido_2'));
                            rstRecurso.pat_Apellido := rstRecurso.pat_Apellido + ' ' + Format(aADO_Reader.Item('Apellido_2'));
                        end;

                    if Evaluate(strVariable, aADO_Reader.Item('ID_SUBDIV_GEOGRAFICA')) then begin
                        rstRecurso."Cód. provincia domicilio" := Format(aADO_Reader.Item('ID_SUBDIV_GEOGRAFICA'));
                        rstRecurso.County := Format(aADO_Reader.Item('ID_SUBDIV_GEOGRAFICA'));
                    end;

                    if Evaluate(strVariable, aADO_Reader.Item('N_SUBDIV_GEOGRAFICA')) then
                        rstRecurso."Nombre provincia domicilio" := Format(aADO_Reader.Item('N_SUBDIV_GEOGRAFICA'));

                    if Evaluate(datFechaVariable, aADO_Reader.Item('MAX(D.Fec_Baja)')) then begin
                        rstRecurso."Fecha baja" := DT2Date(aADO_Reader.Item('MAX(D.Fec_Baja)'));
                        rstRecurso."Inactive Date" := DT2Date(aADO_Reader.Item('MAX(D.Fec_Baja)'));
                    end;

                    if Evaluate(strVariable, aADO_Reader.Item('NUM_DOCUMENTO')) then
                        rstRecurso."pat_No. documento" := aADO_Reader.Item('NUM_DOCUMENTO');

                    Clear(rstHRS);
                    rstHRS.Get();
                    Clear(rstDV);


                    if Evaluate(strVariable, aADO_Reader.Item('ID_TIPO_DOCUMENTO')) then begin

                        Clear(rstDV);
                        case Format(aADO_Reader.Item('ID_TIPO_DOCUMENTO')) of

                            'DNI':
                                begin
                                    rstRecurso."pat_Tipo de documento" := 1;
                                    rstDV."Table ID" := 5200;
                                    rstDV."Dimension Code" := rstHRS."DNI Dimension";
                                    rstDV."No." := rstRecurso."No.";
                                    rstDV."Dimension Value Code" := rstRecurso."pat_No. documento";
                                    if not rstDV.Insert then;
                                end;
                            'ENR':
                                begin
                                    rstRecurso."pat_Tipo de documento" := 2;
                                    rstDV."Table ID" := 5200;
                                    rstDV."Dimension Code" := rstHRS."LE Dimension";
                                    rstDV."No." := rstRecurso."No.";
                                    rstDV."Dimension Value Code" := rstRecurso."pat_No. documento";
                                    if not rstDV.Insert then;
                                end;
                            'CIV':
                                begin
                                    rstRecurso."pat_Tipo de documento" := 3;
                                    rstDV."Table ID" := 5200;
                                    rstDV."Dimension Code" := rstHRS."CI Dimension";
                                    rstDV."No." := rstRecurso."No.";
                                    rstDV."Dimension Value Code" := rstRecurso."pat_No. documento";
                                    if not rstDV.Insert then;
                                end;
                            'CUIL':
                                begin
                                    rstRecurso."pat_Tipo de documento" := 4;
                                    rstDV."Table ID" := 5200;
                                    rstDV."Dimension Code" := rstHRS."CUIL Dimension";
                                    rstDV."No." := rstRecurso."No.";
                                    rstDV."Dimension Value Code" := rstRecurso."pat_No. documento";
                                    if not rstDV.Insert then;
                                end;

                        end;

                    end;

                    Clear(rstHRS);
                    rstHRS.Get();
                    Clear(rstDV);


                    if Evaluate(strVariable, aADO_Reader.Item('ID_NACIONALIDAD')) then begin
                        rstRecurso.pat_Nacionalidad := aADO_Reader.Item('ID_NACIONALIDAD');
                        if rstRecurso.pat_Nacionalidad = 'ARG' then
                            rstRecurso."Country/Region Code" := 'AR'
                        else
                            rstRecurso."Country/Region Code" := aADO_Reader.Item('ID_NACIONALIDAD');
                    end;

                    //IF EVALUATE(datFechaVariable,aADO_Reader.Item('FEC_NACIMIENTO')) THEN
                    //rstRecurso."pat_Fecha nacimiento" := aADO_Reader.Item('FEC_NACIMIENTO');
                    if Evaluate(strVariable, aADO_Reader.Item('FEC_NACIMIENTO')) then
                        if strVariable <> 'null' then begin
                            Evaluate(rstRecurso."pat_Fecha nacimiento", CopyStr(strVariable, 1, 8));
                            Evaluate(rstRecurso."Birth Date", CopyStr(strVariable, 1, 8));
                        end;

                    if Evaluate(strVariable, aADO_Reader.Item('ID_SEXO')) then begin
                        rstRecurso.pat_Sexo := aADO_Reader.Item('ID_SEXO');
                        case rstRecurso.pat_Sexo of
                            'M':
                                rstRecurso.Gender := rstRecurso.Gender::Male;
                            'H':
                                rstRecurso.Gender := rstRecurso.Gender::Female;
                        end;
                    end;

                    if Evaluate(strVariable, aADO_Reader.Item('ID_ESTADO_CIVIL')) then
                        rstRecurso."pat_Estado civil" := aADO_Reader.Item('ID_ESTADO_CIVIL');

                    Clear(rstHRS);
                    rstHRS.Get();
                    if Evaluate(strVariable, aADO_Reader.Item('CUIL')) then begin
                        rstDV."Table ID" := 5200;
                        rstDV."No." := rstRecurso."No.";
                        rstRecurso."CIF/NIF" := aADO_Reader.Item('CUIL');
                        rstDV."Dimension Code" := rstHRS."CUIL Dimension";
                        rstDV."No." := rstRecurso."No.";
                        rstDV."Dimension Value Code" := rstRecurso."CIF/NIF";
                        if not rstDV.Insert then;
                    end;

                    if Evaluate(strVariable, aADO_Reader.Item('VIA_PUBLICA')) then begin
                        rstRecurso."pat_Calle domicilio particular" := aADO_Reader.Item('VIA_PUBLICA');
                    end;

                    if Evaluate(strVariable, aADO_Reader.Item('NUM_VIA')) then begin
                        if strVariable <> 'null' then
                            rstRecurso."pat_Número puerta dom. part." := aADO_Reader.Item('NUM_VIA')
                        else
                            rstRecurso."pat_Número puerta dom. part." := '';
                    end;

                    if Evaluate(strVariable, aADO_Reader.Item('PISO')) then begin
                        if strVariable <> 'null' then begin

                            rstRecurso."pat_Piso dom. part." := aADO_Reader.Item('PISO');

                            if Evaluate(strVariable, aADO_Reader.Item('DEPARTAMENTO')) then begin
                                if strVariable <> 'null' then
                                    rstRecurso."pat_Piso dom. part." := rstRecurso."pat_Piso dom. part." + ' ' + Format(aADO_Reader.Item('DEPARTAMENTO'))
                                else
                                    rstRecurso."pat_Piso dom. part." := rstRecurso."pat_Piso dom. part.";

                            end;

                        end
                        else
                            rstRecurso."pat_Piso dom. part." := '';

                    end;

                    if rstRecurso."pat_Calle domicilio particular" <> '' then begin

                        rstRecurso.Address := rstRecurso."pat_Calle domicilio particular";

                        if rstRecurso."pat_Número puerta dom. part." <> '' then begin

                            rstRecurso.Address := rstRecurso.Address + ' ' + rstRecurso."pat_Número puerta dom. part.";

                            if rstRecurso."pat_Piso dom. part." <> '' then begin

                                rstRecurso.Address := rstRecurso.Address + ' ' + rstRecurso."pat_Piso dom. part.";

                            end;

                        end;

                    end;

                    if Evaluate(strVariable, aADO_Reader.Item('POBLACION')) then
                        rstRecurso."pat_Localidad dom. part." := aADO_Reader.Item('POBLACION');

                    if Evaluate(strVariable, aADO_Reader.Item('DISTRITO_POSTAL')) then
                        rstRecurso."pat_Cód. postal dom. part." := aADO_Reader.Item('DISTRITO_POSTAL');

                    if Evaluate(strVariable, aADO_Reader.Item('ID_SUBDIV_GEOGRAFICA')) then
                        rstRecurso."pat_Cód. provincia dom. part." := aADO_Reader.Item('ID_SUBDIV_GEOGRAFICA');

                    if Evaluate(strVariable, aADO_Reader.Item('TELEFONO')) then
                        if strVariable <> 'null' then
                            rstRecurso."Phone No." := CopyStr(DelChr(strVariable, '=', ' '), 1, 30)
                        else
                            rstRecurso."Phone No." := '';

                    Clear(rstDirecciones);
                    rstDirecciones."Employee No." := rstRecurso."No.";
                    rstDirecciones.Code := 'PRINCIPAL';
                    rstDirecciones.Name := 'Dirección principal';
                    rstDirecciones.Address := rstRecurso.Address;

                    rstComent."Alternative Address Code" := rstDirecciones.Code;

                    Clear(rstArea);
                    if rstArea.Get then
                        rstDirecciones.County := rstArea.Code
                    else begin

                        Clear(rstArea);
                        rstArea.SetRange(Text, rstRecurso."pat_Localidad dom. part.");
                        if rstArea.Find('-') then
                            rstDirecciones.County := rstArea.Code
                        else begin

                            rstArea.Code := rstRecurso."pat_Cód. provincia dom. part.";
                            rstArea.Text := rstRecurso."pat_Localidad dom. part.";
                            if not rstArea.Insert then
                                rstArea.Modify;

                            rstDirecciones.County := rstRecurso."pat_Cód. provincia dom. part.";

                        end;

                    end;

                    rstDirecciones.Validate("Post Code", rstRecurso."pat_Cód. postal dom. part.");
                    rstDirecciones."Phone No." := rstRecurso."Phone No.";
                    rstDirecciones."E-Mail" := '';
                    rstDirecciones."Country/Region Code" := 'AR';
                    x := 0;
                    if Evaluate(strVariable, aADO_Reader.Item('COMDIR')) then begin

                        if (StrLen(strVariable) <> 0) and ((strVariable) <> 'null') then
                            repeat

                                x += 10000;
                                Clear(rstComent);
                                rstComent."Table Name" := rstComent."Table Name"::"Alternative Address";
                                rstComent."No." := rstDirecciones."Employee No.";
                                rstComent."Line No." := x;
                                rstComent.Date := Today;
                                rstComent.Code := rstDirecciones.Code;
                                rstComent.Comment := CopyStr(strVariable, 1, 80);
                                strVariable := CopyStr(strVariable, 81, 2000);
                                if not rstComent.Insert then
                                    rstComent.Modify;

                            until StrLen(strVariable) = 0;

                    end;

                    if not rstDirecciones.Insert then
                        rstDirecciones.Modify;

                    /*
                    IF EVALUATE(strVariable,aADO_Reader.Item('N_CATEGORIA')) THEN
                    BEGIN
                      rstRecurso."pat_ Categoría/Cargo/Rango" := aADO_Reader.Item('N_CATEGORIA');
                      rstRecurso.Categoría := aADO_Reader.Item('N_CATEGORIA');
                    END;
                    */

                    /*
                    IF EVALUATE(strVariable,aADO_Reader.Item('MAX(D.FEC_ALTA_EMPLEADO)')) THEN
                      IF strVariable <> 'null' THEN
                      BEGIN
                    */
                    rstRecurso."pat_Fecha ingreso laboral" := DT2Date(aADO_Reader.Item('max(d.FEC_ALTA_EMPLEADO)'));
                    rstRecurso."Employment Date" := DT2Date(aADO_Reader.Item('max(d.FEC_ALTA_EMPLEADO)'));
                    /*
                     END;
                    */
                    if Evaluate(strVariable, aADO_Reader.Item('ID_BANCO')) then
                        rstRecurso."pat_Dependencia de pago" := aADO_Reader.Item('ID_BANCO');

                    Clear(rstDatoPago);
                    rstDatoPago."Employee No." := rstRecurso."No.";
                    if Evaluate(strVariable, Format(aADO_Reader.Item('ID_DATO_PAGO'))) then
                        rstDatoPago."Id. dato pago" := strVariable;

                    if Evaluate(strVariable, aADO_Reader.Item('FEC_INICIO')) then
                        if strVariable <> 'null' then
                            Evaluate(rstDatoPago."Fecha inicial", CopyStr(strVariable, 1, 8));

                    if Evaluate(strVariable, aADO_Reader.Item('FEC_FIN')) then
                        if strVariable <> 'null' then
                            Evaluate(rstDatoPago."Fecha final", CopyStr(strVariable, 1, 8));

                    if Evaluate(strVariable, aADO_Reader.Item('ID_BANCO')) then
                        rstDatoPago.Banco := aADO_Reader.Item('ID_BANCO');

                    if Evaluate(strVariable, aADO_Reader.Item('ID_AGENCIA')) then
                        rstDatoPago.Agencia := aADO_Reader.Item('ID_AGENCIA');

                    if Evaluate(strVariable, aADO_Reader.Item('NUM_CUENTA')) then
                        rstDatoPago."No. cuenta" := aADO_Reader.Item('NUM_CUENTA');

                    if Evaluate(strVariable, aADO_Reader.Item('ID_FORMA_PAGO')) then
                        rstDatoPago."Cód. forma pago" := aADO_Reader.Item('ID_FORMA_PAGO');

                    if Evaluate(strVariable, aADO_Reader.Item('ID_CENTRO_PAGO')) then
                        rstDatoPago."Cód. centro pago" := aADO_Reader.Item('ID_CENTRO_PAGO');

                    rstDatoPago.Name := rstRecurso.Name;
                    rstDatoPago."First Family Name" := rstRecurso."First Family Name";
                    rstDatoPago."Second Family Name" := rstRecurso."Second Family Name";
                    if Evaluate(strVariable, aADO_Reader.Item('ID_LEGAL')) then
                        rstDatoPago."Id. legal" := aADO_Reader.Item('ID_LEGAL');
                    if Evaluate(strVariable, aADO_Reader.Item('ID_TIPO_CUENTA')) then begin

                        case strVariable of
                            'CA':
                                rstDatoPago."Tipo cuenta" := rstDatoPago."Tipo cuenta"::CA;
                            'CC':
                                rstDatoPago."Tipo cuenta" := rstDatoPago."Tipo cuenta"::CC;
                        end;

                    end;

                    if Evaluate(strVariable, aADO_Reader.Item('DISTRITO_POSTAL')) then
                        rstRecurso.Validate(rstRecurso."Post Code", aADO_Reader.Item('DISTRITO_POSTAL'));

                    if Evaluate(strVariable, aADO_Reader.Item('N_SUCURSAL')) then begin
                        Clear(rstPuerto);
                        rstPuerto.SetRange(rstPuerto.Description, strVariable);
                        if rstPuerto.FindFirst then
                            rstDatoPago."No. sucursal" := rstPuerto.Code;
                    end;
                    //rstRecurso."Workday code" := 'MAT_HAB';
                    rstRecurso."Flexible o restricto" := rstRecurso."Flexible o restricto"::Mixto;

                    if not rstDatoPago.Insert then
                        rstDatoPago.Modify;

                    if not rstRecurso.Insert then
                        rstRecurso.Modify;

                end
                else begin

                    rstRecurso.Name := Format(aADO_Reader.Item('Nombre'));
                    rstRecurso.pat_Nombre := Format(aADO_Reader.Item('Nombre'));

                    if Evaluate(strVariable, aADO_Reader.Item('Apellido_1')) then begin
                        rstRecurso."First Family Name" := Format(aADO_Reader.Item('Apellido_1'));
                        rstRecurso.pat_Apellido := Format(aADO_Reader.Item('Apellido_1'));
                    end;

                    if Evaluate(strVariable, aADO_Reader.Item('Apellido_2')) then
                        if strVariable <> 'null' then begin
                            rstRecurso."Second Family Name" := Format(aADO_Reader.Item('Apellido_2'));
                            rstRecurso.pat_Apellido := rstRecurso.pat_Apellido + ' ' + Format(aADO_Reader.Item('Apellido_2'));
                        end;

                    if Evaluate(strVariable, aADO_Reader.Item('ID_SUBDIV_GEOGRAFICA')) then begin
                        rstRecurso."Cód. provincia domicilio" := Format(aADO_Reader.Item('ID_SUBDIV_GEOGRAFICA'));
                        rstRecurso.County := Format(aADO_Reader.Item('ID_SUBDIV_GEOGRAFICA'));
                    end;

                    if Evaluate(strVariable, aADO_Reader.Item('N_SUBDIV_GEOGRAFICA')) then
                        rstRecurso."Nombre provincia domicilio" := Format(aADO_Reader.Item('N_SUBDIV_GEOGRAFICA'));


                    if Evaluate(datFechaVariable, aADO_Reader.Item('MAX(D.Fec_Baja)')) then begin
                        rstRecurso."Fecha baja" := DT2Date(aADO_Reader.Item('MAX(D.Fec_Baja)'));
                        rstRecurso."Inactive Date" := DT2Date(aADO_Reader.Item('MAX(D.Fec_Baja)'));
                    end;

                    if Evaluate(strVariable, aADO_Reader.Item('NUM_DOCUMENTO')) then
                        rstRecurso."pat_No. documento" := aADO_Reader.Item('NUM_DOCUMENTO');

                    Clear(rstHRS);
                    rstHRS.Get();
                    Clear(rstDV);


                    if Evaluate(strVariable, aADO_Reader.Item('ID_TIPO_DOCUMENTO')) then begin

                        Clear(rstDV);
                        case Format(aADO_Reader.Item('ID_TIPO_DOCUMENTO')) of

                            'DNI':
                                begin
                                    rstRecurso."pat_Tipo de documento" := 1;
                                    rstDV."Table ID" := 5200;
                                    rstDV."Dimension Code" := rstHRS."DNI Dimension";
                                    rstDV."No." := rstRecurso."No.";
                                    rstDV."Dimension Value Code" := rstRecurso."pat_No. documento";
                                    if not rstDV.Insert then;
                                end;
                            'ENR':
                                begin
                                    rstRecurso."pat_Tipo de documento" := 2;
                                    rstDV."Table ID" := 5200;
                                    rstDV."Dimension Code" := rstHRS."LE Dimension";
                                    rstDV."No." := rstRecurso."No.";
                                    rstDV."Dimension Value Code" := rstRecurso."pat_No. documento";
                                    if not rstDV.Insert then;
                                end;
                            'CIV':
                                begin
                                    rstRecurso."pat_Tipo de documento" := 3;
                                    rstDV."Table ID" := 5200;
                                    rstDV."Dimension Code" := rstHRS."CI Dimension";
                                    rstDV."No." := rstRecurso."No.";
                                    rstDV."Dimension Value Code" := rstRecurso."pat_No. documento";
                                    if not rstDV.Insert then;
                                end;
                            'CUIL':
                                begin
                                    rstRecurso."pat_Tipo de documento" := 4;
                                    rstDV."Table ID" := 5200;
                                    rstDV."Dimension Code" := rstHRS."CUIL Dimension";
                                    rstDV."No." := rstRecurso."No.";
                                    rstDV."Dimension Value Code" := rstRecurso."pat_No. documento";
                                    if not rstDV.Insert then;
                                end;

                        end;

                    end;

                    Clear(rstHRS);
                    rstHRS.Get();
                    Clear(rstDV);


                    if Evaluate(strVariable, aADO_Reader.Item('ID_NACIONALIDAD')) then begin
                        rstRecurso.pat_Nacionalidad := aADO_Reader.Item('ID_NACIONALIDAD');
                        if rstRecurso.pat_Nacionalidad = 'ARG' then
                            rstRecurso."Country/Region Code" := 'AR'
                        else
                            rstRecurso."Country/Region Code" := aADO_Reader.Item('ID_NACIONALIDAD');
                    end;

                    //IF EVALUATE(datFechaVariable,aADO_Reader.Item('FEC_NACIMIENTO')) THEN
                    //rstRecurso."pat_Fecha nacimiento" := aADO_Reader.Item('FEC_NACIMIENTO');
                    if Evaluate(strVariable, aADO_Reader.Item('FEC_NACIMIENTO')) then
                        if strVariable <> 'null' then begin
                            Evaluate(rstRecurso."pat_Fecha nacimiento", CopyStr(strVariable, 1, 8));
                            Evaluate(rstRecurso."Birth Date", CopyStr(strVariable, 1, 8));
                        end;

                    if Evaluate(strVariable, aADO_Reader.Item('ID_SEXO')) then begin
                        rstRecurso.pat_Sexo := aADO_Reader.Item('ID_SEXO');
                        case rstRecurso.pat_Sexo of
                            'M':
                                rstRecurso.Gender := rstRecurso.Gender::Male;
                            'H':
                                rstRecurso.Gender := rstRecurso.Gender::Female;
                        end;
                    end;

                    if Evaluate(strVariable, aADO_Reader.Item('ID_ESTADO_CIVIL')) then
                        rstRecurso."pat_Estado civil" := aADO_Reader.Item('ID_ESTADO_CIVIL');

                    Clear(rstHRS);
                    rstHRS.Get();
                    if Evaluate(strVariable, aADO_Reader.Item('CUIL')) then begin
                        rstRecurso."CIF/NIF" := aADO_Reader.Item('CUIL');
                        rstDV."Table ID" := 5200;
                        rstDV."No." := rstRecurso."No.";
                        rstDV."Dimension Code" := rstHRS."CUIL Dimension";
                        rstDV."Dimension Value Code" := aADO_Reader.Item('CUIL');
                        if not rstDV.Insert then;
                    end;

                    if Evaluate(strVariable, aADO_Reader.Item('VIA_PUBLICA')) then begin
                        if strVariable <> 'null' then
                            rstRecurso."pat_Calle domicilio particular" := aADO_Reader.Item('VIA_PUBLICA');
                    end;

                    if Evaluate(strVariable, aADO_Reader.Item('NUM_VIA')) then begin
                        if strVariable <> 'null' then
                            rstRecurso."pat_Número puerta dom. part." := aADO_Reader.Item('NUM_VIA')
                        else
                            rstRecurso."pat_Número puerta dom. part." := '';
                    end;

                    if Evaluate(strVariable, aADO_Reader.Item('PISO')) then begin
                        if strVariable <> 'null' then begin

                            rstRecurso."pat_Piso dom. part." := aADO_Reader.Item('PISO');

                            if Evaluate(strVariable, aADO_Reader.Item('DEPARTAMENTO')) then begin
                                if strVariable <> 'null' then
                                    rstRecurso."pat_Piso dom. part." := rstRecurso."pat_Piso dom. part." + ' ' + Format(aADO_Reader.Item('DEPARTAMENTO'))
                                else
                                    rstRecurso."pat_Piso dom. part." := rstRecurso."pat_Piso dom. part.";

                            end;

                        end
                        else
                            rstRecurso."pat_Piso dom. part." := '';


                    end;

                    if rstRecurso."pat_Calle domicilio particular" <> '' then begin

                        rstRecurso.Address := rstRecurso."pat_Calle domicilio particular";

                        if rstRecurso."pat_Número puerta dom. part." <> '' then begin

                            rstRecurso.Address := rstRecurso.Address + ' ' + rstRecurso."pat_Número puerta dom. part.";

                            if rstRecurso."pat_Piso dom. part." <> '' then begin

                                rstRecurso.Address := rstRecurso.Address + ' ' + rstRecurso."pat_Piso dom. part.";

                            end;

                        end;

                    end;

                    if Evaluate(strVariable, aADO_Reader.Item('POBLACION')) then
                        rstRecurso."pat_Localidad dom. part." := aADO_Reader.Item('POBLACION');

                    if Evaluate(strVariable, aADO_Reader.Item('DISTRITO_POSTAL')) then
                        rstRecurso."pat_Cód. postal dom. part." := aADO_Reader.Item('DISTRITO_POSTAL');

                    if Evaluate(strVariable, aADO_Reader.Item('ID_SUBDIV_GEOGRAFICA')) then
                        rstRecurso."pat_Cód. provincia dom. part." := aADO_Reader.Item('ID_SUBDIV_GEOGRAFICA');

                    if Evaluate(strVariable, aADO_Reader.Item('TELEFONO')) then
                        if strVariable <> 'null' then
                            rstRecurso."Phone No." := CopyStr(DelChr(strVariable, '=', ' '), 1, 30)
                        else
                            rstRecurso."Phone No." := '';


                    Clear(rstDirecciones);
                    rstDirecciones."Employee No." := rstRecurso."No.";
                    rstDirecciones.Code := 'PRINCIPAL';
                    rstDirecciones.Name := 'Dirección principal';
                    rstDirecciones.Address := rstRecurso.Address;
                    rstDirecciones.Validate("Post Code", rstRecurso."pat_Cód. postal dom. part.");

                    Clear(rstArea);
                    if rstArea.Get then
                        rstDirecciones.County := rstArea.Code
                    else begin

                        Clear(rstArea);
                        rstArea.SetRange(Text, rstRecurso."pat_Localidad dom. part.");
                        if rstArea.Find('-') then
                            rstDirecciones.County := rstArea.Code
                        else begin

                            rstArea.Code := rstRecurso."pat_Cód. provincia dom. part.";
                            rstArea.Text := rstRecurso."pat_Localidad dom. part.";
                            if not rstArea.Insert then
                                rstArea.Modify;

                            rstDirecciones.County := rstRecurso."pat_Cód. provincia dom. part.";

                        end;

                    end;

                    rstDirecciones."Phone No." := rstRecurso."Phone No.";
                    rstDirecciones."E-Mail" := '';
                    rstDirecciones."Country/Region Code" := 'AR';

                    x := 0;
                    if Evaluate(strVariable, aADO_Reader.Item('COMDIR')) then begin

                        if (StrLen(strVariable) <> 0) and ((strVariable) <> 'null') then
                            repeat

                                x += 10000;
                                Clear(rstComent);
                                rstComent."Table Name" := rstComent."Table Name"::"Alternative Address";
                                rstComent."No." := rstDirecciones."Employee No.";
                                rstComent."Line No." := x;
                                rstComent.Date := Today;
                                rstComent.Code := rstDirecciones.Code;
                                rstComent."Alternative Address Code" := rstDirecciones.Code;
                                rstComent.Comment := CopyStr(strVariable, 1, 80);
                                strVariable := CopyStr(strVariable, 81, 2000);
                                if not rstComent.Insert then
                                    rstComent.Modify;

                            until StrLen(strVariable) = 0;

                    end;

                    if not rstDirecciones.Insert then
                        rstDirecciones.Modify;

                    /*
                    IF EVALUATE(strVariable,aADO_Reader.Item('N_CATEGORIA')) THEN
                    BEGIN
                      rstRecurso."pat_ Categoría/Cargo/Rango" := aADO_Reader.Item('N_CATEGORIA');
                      rstRecurso.Categoría := aADO_Reader.Item('N_CATEGORIA');
                    END;
                    */

                    if Evaluate(strVariable, aADO_Reader.Item('MAX(D.FEC_ALTA_EMPLEADO)')) then
                        if strVariable <> 'null' then begin
                            rstRecurso."pat_Fecha ingreso laboral" := DT2Date(aADO_Reader.Item('MAX(D.FEC_ALTA_EMPLEADO)'));
                            rstRecurso."Employment Date" := DT2Date(aADO_Reader.Item('MAX(D.FEC_ALTA_EMPLEADO)'));
                        end;
                    if Evaluate(strVariable, aADO_Reader.Item('ID_BANCO')) then
                        rstRecurso."pat_Dependencia de pago" := aADO_Reader.Item('ID_BANCO');

                    Clear(rstDatoPago);
                    rstDatoPago."Employee No." := rstRecurso."No.";
                    if Evaluate(strVariable, Format(aADO_Reader.Item('ID_DATO_PAGO'))) then
                        rstDatoPago."Id. dato pago" := strVariable;

                    if Evaluate(strVariable, aADO_Reader.Item('FEC_INICIO')) then
                        if strVariable <> 'null' then
                            Evaluate(rstDatoPago."Fecha inicial", CopyStr(strVariable, 1, 8));

                    if Evaluate(strVariable, aADO_Reader.Item('FEC_FIN')) then
                        if strVariable <> 'null' then
                            Evaluate(rstDatoPago."Fecha final", CopyStr(strVariable, 1, 8));

                    if Evaluate(strVariable, aADO_Reader.Item('ID_BANCO')) then
                        rstDatoPago.Banco := aADO_Reader.Item('ID_BANCO');

                    if Evaluate(strVariable, aADO_Reader.Item('ID_AGENCIA')) then
                        rstDatoPago.Agencia := aADO_Reader.Item('ID_AGENCIA');

                    if Evaluate(strVariable, aADO_Reader.Item('NUM_CUENTA')) then
                        rstDatoPago."No. cuenta" := aADO_Reader.Item('NUM_CUENTA');

                    if Evaluate(strVariable, aADO_Reader.Item('ID_FORMA_PAGO')) then
                        rstDatoPago."Cód. forma pago" := aADO_Reader.Item('ID_FORMA_PAGO');

                    if Evaluate(strVariable, aADO_Reader.Item('ID_CENTRO_PAGO')) then
                        rstDatoPago."Cód. centro pago" := aADO_Reader.Item('ID_CENTRO_PAGO');

                    rstDatoPago.Name := rstRecurso.Name;
                    rstDatoPago."First Family Name" := rstRecurso."First Family Name";
                    rstDatoPago."Second Family Name" := rstRecurso."Second Family Name";
                    if Evaluate(strVariable, aADO_Reader.Item('ID_LEGAL')) then
                        rstDatoPago."Id. legal" := aADO_Reader.Item('ID_LEGAL');
                    if Evaluate(strVariable, aADO_Reader.Item('ID_TIPO_CUENTA')) then begin

                        case strVariable of
                            'CA':
                                rstDatoPago."Tipo cuenta" := rstDatoPago."Tipo cuenta"::CA;
                            'CC':
                                rstDatoPago."Tipo cuenta" := rstDatoPago."Tipo cuenta"::CC;
                        end;

                    end;

                    if Evaluate(strVariable, aADO_Reader.Item('N_SUCURSAL')) then begin
                        Clear(rstPuerto);
                        rstPuerto.SetRange(rstPuerto.Description, strVariable);
                        if rstPuerto.FindFirst then
                            rstDatoPago."No. sucursal" := rstPuerto.Code;
                    end;

                    if not rstDatoPago.Insert then
                        rstDatoPago.Modify;
                    if Evaluate(strVariable, aADO_Reader.Item('DISTRITO_POSTAL')) then
                        rstRecurso.Validate(rstRecurso."Post Code", aADO_Reader.Item('DISTRITO_POSTAL'));

                    //rstRecurso."Workday code" := 'MAT_HAB';
                    rstRecurso."Flexible o restricto" := rstRecurso."Flexible o restricto"::Mixto;

                    if not rstRecurso.Insert then
                        rstRecurso.Modify;

                end;

            end;

        end;

        windows.Close;

    end;

    [Scope('OnPrem')]
    procedure fntSincronizarRemuneracionesPasivo(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strInicioSic: Text[30];
        strFinalSic: Text[30];
        datFechaVariable: Date;
        strVariable: Text[1024];
        intInteger: Integer;
        decDecimal: Decimal;
        ConnectionString: Text;
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');

        windows.Update(0, 'Remuneraciones pasivo');

        strInicio := Format(datInicio, 0, '<Year4>/<Month,2>/<Day,2>');
        strFinal := Format(datFinal, 0, '<Year4>/<Month,2>/<Day,2>');
        if Evaluate(intInicio, strInicio) then;
        if Evaluate(intFinal, strFinal) then;
        strInicioSic := Format(datInicio, 0, '<Year4>/<Month,2>/<Day,2>');//'2015/06/01';
        strFinalSic := Format(datFinal, 0, '<Year4>/<Month,2>/<Day,2>');

        filtString1 := '';
        filtString2 := '';
        filtString3 := '';

        filtString1 := 'select a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa, a.fec_imputacion,a.tp_imput,d.tp_imput_aux,d.id_categoria,d.id_puesto,' +
                       'g.id_nacion,f.n_categoria,e.n_puesto,a.FECHA_SICORE_ST,' +
                       'sum(ANT_DESC_EMB) cta_1115204,' +
                       'sum(ANT_DESC_ADM) cta_1115205,' +
                       'sum(REM_PAG_TA) cta_2112001,' +
                       'sum(REM_PAG_TE) cta_2112002,' +
                       'sum(REM_PAG_ADM) cta_2112003,' +
                       'sum(REM_PAG_PTA) cta_2112011,' +
                       'sum(CS_SC_A_PAG) cta_2113001,' +
                       'sum(OTR_CONTR_A_PAG) cta_2113005,' +
                       'sum(CTA_ALIM) cta_2113002,' +
                       'sum(EMB_JUDIC) cta_2113004,' +
                       'sum(SG_SC_ESP_A_PAG) cta_2113006,' +
                       'sum(IMP_GCIAS) cta_2115006, ' +
                       'sum(CNT_PROV_SAC) cta_2113029, ' +
                       'sum(CRED_IVA_TA + CRED_IVA_BA + CRED_IVA_PD + CRED_IVA_CR + CRED_IVA_PTA + CRED_IVA_PTA_PD) cta_1115314,' +
                       //'sum({-SAC_TA-SAC_AB-SAC_AP-SAC_AC-SAC_PTA_PD-SAC_PTA+}PROV_SAC) cta_2112010 ';
                       'sum(PROV_SAC) cta_2112010 ';

        if blnSicore then begin

            filtString2 := 'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                         'm4t_acumulado_rl3 d,m4_puestos_trabajo e,m4_categorias f ,m4_empleados g ' +
                         'where a.id_sociedad = b.id_sociedad ' +
                         'and a.id_empleado = b.id_empleado ' +
                         'and a.fec_imputacion = b.fec_imputacion ' +
                         'and a.fec_alta_empleado = b.fec_alta_empleado ' +
                         'and a.fec_pago = b.fec_pago ' +
                         'and a.fec_imputacion = c.fec_imputacion ' +
                         'and a.id_sociedad = c.id_sociedad ' +
                         'and a.id_empleado = c.id_empleado ' +
                         'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                         'and a.fec_pago = c.fec_pago ' +
                         'and a.id_sociedad = d.id_sociedad ' +
                         'and a.id_empleado = d.id_empleado ' +
                         'and a.fec_imputacion = d.fec_imputacion ' +
                         'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                         'and a.fec_pago = d.fec_pago ' +
                         'and a.tp_imput <> 4 ' +
                         'and a.id_cto_cost_nav <> ''NULL''' +
                         'and a.ID_CONVENIO <> ''FE'' ' +
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = f.id_categoria ' +
                         'and d.id_puesto = e.id_puesto ' +
                         'and a.id_empleado = g.id_empleado ';

        end
        else begin

            filtString2 := 'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                         'm4t_acumulado_rl3 d,m4_puestos_trabajo e,m4_categorias f ,m4_empleados g ' +
                         'where a.id_sociedad = b.id_sociedad ' +
                         //               'and a.id_empleado = ''00548'' '+
                         'and a.id_empleado = b.id_empleado ' +
                         'and a.fec_imputacion = b.fec_imputacion ' +
                         'and a.fec_alta_empleado = b.fec_alta_empleado ' +
                         'and a.fec_pago = b.fec_pago ' +
                         'and a.fec_imputacion = c.fec_imputacion ' +
                         'and a.id_sociedad = c.id_sociedad ' +
                         'and a.ID_CONVENIO <> ''FE'' ' +
                         'and a.id_empleado = c.id_empleado ' +
                         'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                         'and a.fec_pago = c.fec_pago ' +
                         'and a.id_sociedad = d.id_sociedad ' +
                         'and a.id_empleado = d.id_empleado ' +
                         'and a.fec_imputacion = d.fec_imputacion ' +
                         'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                         'and a.fec_pago = d.fec_pago ' +
                         'and a.tp_imput <> 4 ' +
                         'and a.id_cto_cost_nav <> ''NULL''' +
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = f.id_categoria ' +
                         'and d.id_puesto = e.id_puesto ' +
                         'and a.id_empleado = g.id_empleado ';

        end;

        filtString3 := 'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,' +
                       'd.id_categoria,d.id_puesto,g.id_nacion,f.n_categoria,e.n_puesto,a.FECHA_SICORE_ST' +
                       ' order by a.fec_imputacion,a.id_empleado,' +
                       'a.FECHA_SICORE_ST';

        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);
        aADO_Con.Open;

        //aADO_Comm := aADO_Con.OracleConnection;

        aADO_Comm := aADO_Comm.OracleCommand(filtString1 + filtString2 + filtString3, aADO_Con);
        aADO_Reader := aADO_Comm.ExecuteReader;

        while aADO_Reader.Read() do begin

            begin

                if blnVentana then begin

                    windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));
                    windows.Update(2, aADO_Reader.Item('FEC_IMPUTACION'));
                    windows.Update(3, aADO_Reader.Item('ID_EMPRESA'));
                    windows.Update(4, aADO_Reader.Item('ID_CTO_COST_NAV'));

                end;
                strField1 := Format(aADO_Reader.Item('ID_EMPLEADO'));
                strField2 := Format(aADO_Reader.Item('FECHA_SICORE_ST'));
                strField3 := Format(aADO_Reader.Item('ID_EMPRESA'));
                strField4 := Format(aADO_Reader.Item('ID_CTO_COST_NAV'));
                strField7 := Format(aADO_Reader.Item('fec_imputacion'));

                //IF EVALUATE(intInteger,aADO_Reader.Item('TP_IMPUT')) THEN
                strField8 := Format(aADO_Reader.Item('TP_IMPUT'));

                strField9 := Format(aADO_Reader.Item('id_categoria'));
                strField10 := Format(aADO_Reader.Item('id_puesto'));
                strField11 := Format(aADO_Reader.Item('n_categoria'));
                strField12 := Format(aADO_Reader.Item('n_puesto'));
                strField13 := Format(aADO_Reader.Item('id_sociedad'));
                strField14 := Format(aADO_Reader.Item('FEC_IMPUTACION'));
                strField15 := Format(aADO_Reader.Item('id_nacion'));
                strField17 := Format(aADO_Reader.Item('tp_imput_aux'));

                if datFecha <> 0D then begin

                    if Format(datFecha) <> strField2 then begin

                        Clear(rstConfCont);
                        rstConfCont.Get();
                        if (Abs(decTotalxFecha) <> 0) and (Abs(decTotalxFecha) <= 1) then begin

                            //fntGenerarLineaDiario(rstConfCont.CuentaRedondeo,-decTotalxFecha,'',FORMAT(datFecha));
                            decTotalxFecha := 0;

                        end;

                    end;

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;

                decImporte := 0;
                strField5 := '1115204';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);

                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '1115205';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '2112001';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '2112002';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '2112003';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '2112010';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '2113029';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '2112011';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '2113001';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '2113005';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '2113002';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '2113004';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;


                decImporte := 0;
                strField5 := '2113006';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '2115006';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '1115314';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                    decTotalxFecha += Round(decImporte, 0.01);

                end;

            end;

        end;

        windows.Close;
    end;

    [Scope('OnPrem')]
    procedure fntSincronizarRemuneracionesResultado(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strInicioSic: Text[30];
        strFinalSic: Text[30];
        datFechaVariable: Date;
        strVariable: Text[1024];
        intInteger: Integer;
        decDecimal: Decimal;
        ConnectionString: Text;
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');

        windows.Update(0, 'Remuneraciones resultado');

        strInicio := Format(datInicio, 0, '<Year4><Month,2><Day,2>');
        strFinal := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        if Evaluate(intInicio, strInicio) then;
        if Evaluate(intFinal, strFinal) then;
        strInicioSic := Format(datInicio, 0, '<Year4><Month,2><Day,2>');//'2015/06/01';
        strFinalSic := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        //--ESP

        filtString1 := 'select a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa, a.fec_imputacion,a.tp_imput,d.tp_imput_aux,d.id_categoria,d.id_puesto,' +
                       'g.id_nacion,f.n_categoria,e.n_puesto,a.FECHA_SICORE_ST,' +
                       'sum(FARM_ASIST_MED) cta_6110006,' +
                       'sum(VIVERES) cta_6110007,' +
                       'sum(VIAJES) cta_6110010,' +
                       'sum(COMUNICAC) cta_6110011,' +
                       'sum(DIVERSOS) cta_6110025,' +
                       'sum(SDOS_JORN) cta_6110001,' +
                       'sum(CONTR_TA) cta_6110002,' +
                       'sum(REM_EXTR) cta_6110003,' +
                       'sum(GRAT_ESP) cta_6110005,' +
                       'sum(CNT_PROV_SAC) cta_6110027,' +
                       '-sum(DTO_SIND_EXENMT + DTO_SINDEXENSAC) cta_6110047, ' +
                       'sum(REMUN_AB) cta_6311001,' +
                       'sum(CONTR_AB) cta_6311002,' +
                       'sum(REMUN_AP) cta_6312001,' +
                       'sum(CONTR_AP) cta_6312002,' +
                       'sum(REMUN_AC) cta_6313001,' +
                       'sum(CONTR_AC) cta_6313002,' +
                       'sum(REMUN_PTA + REMUN_PTA_PD) cta_6106001,' +
                       'sum(CONTR_PTA + CONTR_PTA_PD) cta_6106002,' +
                       //'sum(PROV_SAC) cta_6110026 ';
                       'sum(+SAC_TA+SAC_AB+SAC_AP+SAC_AC+SAC_PTA_PD+SAC_PTA+PROV_SAC) cta_6110026 ';

        if blnSicore then begin

            filtString2 := 'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                         'm4t_acumulado_rl3 d, m4_puestos_trabajo e,m4_categorias f, m4_empleados g ' +
                         'where a.id_sociedad = b.id_sociedad ' +
                         'and a.id_empleado = b.id_empleado ' +
                         'and a.fec_imputacion = b.fec_imputacion ' +
                         'and a.id_sociedad = c.id_sociedad ' +
                         'and a.id_empleado = c.id_empleado ' +
                         'and a.fec_imputacion = c.fec_imputacion ' +
                         'and a.id_sociedad = d.id_sociedad ' +
                         'and a.id_empleado = d.id_empleado ' +
                         'and a.ID_CONVENIO <> ''FE'' ' +
                         'and a.fec_imputacion = d.fec_imputacion ' +
                         'and a.tp_imput <> 4 ' +
                         'and a.id_cto_cost_nav <> ''NULL''' +
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion = b.fec_imputacion ' +
                         'and a.fec_imputacion = c.fec_imputacion ' +
                         'and a.fec_imputacion = c.fec_imputacion ' +
                         'and d.id_categoria = f.id_categoria ' +
                         'and d.id_puesto = e.id_puesto ' +
                         'and a.id_empleado = g.id_empleado ';

        end
        else begin

            filtString2 := 'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                         'm4t_acumulado_rl3 d, m4_puestos_trabajo e,m4_categorias f, m4_empleados g ' +
                         'where a.id_sociedad = b.id_sociedad ' +
                         'and a.id_empleado = b.id_empleado ' +
                         'and a.fec_imputacion = b.fec_imputacion ' +
                         'and a.id_sociedad = c.id_sociedad ' +
                         'and a.id_empleado = c.id_empleado ' +
                         'and a.fec_imputacion = c.fec_imputacion ' +
                         'and a.id_sociedad = d.id_sociedad ' +
                         'and a.id_empleado = d.id_empleado ' +
                         'and a.fec_imputacion = d.fec_imputacion ' +
                         'and a.ID_CONVENIO <> ''FE'' ' +
                         'and a.tp_imput <> 4 ' +
                         'and a.id_cto_cost_nav <> ''NULL''' +
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion = b.fec_imputacion ' +
                         'and a.fec_imputacion = c.fec_imputacion ' +
                         'and a.fec_imputacion = c.fec_imputacion ' +
                         'and d.id_categoria = f.id_categoria ' +
                         'and d.id_puesto = e.id_puesto ' +
                         'and a.id_empleado = g.id_empleado ';

        end;

        filtString3 := 'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                       'd.id_categoria,d.id_puesto,g.id_nacion,f.n_categoria,e.n_puesto order by a.fec_imputacion,a.id_empleado,' +
                       'a.FECHA_SICORE_ST';

        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);
        aADO_Con.Open;
        //aADO_Comm := aADO_Con.OracleConnection;
        aADO_Comm := aADO_Comm.OracleCommand(filtString1 + filtString2 + filtString3, aADO_Con);
        aADO_Reader := aADO_Comm.ExecuteReader;

        while aADO_Reader.Read() do begin

            if blnVentana then begin

                windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));
                windows.Update(2, aADO_Reader.Item('FEC_IMPUTACION'));
                windows.Update(3, aADO_Reader.Item('ID_EMPRESA'));
                windows.Update(4, aADO_Reader.Item('ID_CTO_COST_NAV'));

            end;
            strField1 := Format(aADO_Reader.Item('ID_EMPLEADO'));
            strField2 := Format(aADO_Reader.Item('FECHA_SICORE_ST'));
            strField3 := Format(aADO_Reader.Item('ID_EMPRESA'));
            strField4 := Format(aADO_Reader.Item('ID_CTO_COST_NAV'));

            strField7 := Format(aADO_Reader.Item('fec_imputacion'));

            //IF EVALUATE(intInteger,aADO_Reader.Item('TP_IMPUT')) THEN
            //intInteger := aADO_Reader.Item('TP_IMPUT');
            strField8 := Format(aADO_Reader.Item('TP_IMPUT'));
            strField9 := Format(aADO_Reader.Item('id_categoria'));
            strField10 := Format(aADO_Reader.Item('id_puesto'));
            strField11 := Format(aADO_Reader.Item('n_categoria'));
            strField12 := Format(aADO_Reader.Item('n_puesto'));
            strField13 := Format(aADO_Reader.Item('id_sociedad'));
            strField14 := Format(aADO_Reader.Item('FEC_IMPUTACION'));
            strField15 := Format(aADO_Reader.Item('id_nacion'));
            strField17 := Format(aADO_Reader.Item('tp_imput_aux'));

            if datFecha <> 0D then begin

                if Format(datFecha) <> strField2 then begin

                    Clear(rstConfCont);
                    rstConfCont.Get();
                    if (Abs(decTotalxFecha) <> 0) and (Abs(decTotalxFecha) <= 1) then begin

                        //fntGenerarLineaDiario(rstConfCont.CuentaRedondeo,-decTotalxFecha,'',FORMAT(datFecha));
                        decTotalxFecha := 0;

                    end;

                end;

            end;

            //  datFecha := datFechaVariable;

            decImporte := 0;
            strField5 := '6110006';
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            strField6 := aADO_Reader.Item('cta_' + strField5);
            if blnVentana then
                windows.Update(5, strField5);
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            begin

                if blnVentana then
                    windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                decImporte := aADO_Reader.Item('cta_' + strField5);
                if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                decTotalxFecha += Round(-decImporte, 0.01);

            end;

            decImporte := 0;
            strField5 := '6110007';
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            strField6 := aADO_Reader.Item('cta_' + strField5);
            if blnVentana then
                windows.Update(5, strField5);
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            begin

                if blnVentana then
                    windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                decImporte := aADO_Reader.Item('cta_' + strField5);
                if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                decTotalxFecha += Round(-decImporte, 0.01);

            end;

            decImporte := 0;
            strField5 := '6110010';
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            strField6 := aADO_Reader.Item('cta_' + strField5);
            if blnVentana then
                windows.Update(5, strField5);
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            begin

                if blnVentana then
                    windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                decImporte := aADO_Reader.Item('cta_' + strField5);
                if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                decTotalxFecha += Round(-decImporte, 0.01);

            end;

            decImporte := 0;
            strField5 := '6110027';
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            strField6 := aADO_Reader.Item('cta_' + strField5);
            if blnVentana then
                windows.Update(5, strField5);
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            begin

                if blnVentana then
                    windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                decImporte := aADO_Reader.Item('cta_' + strField5);
                if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                decTotalxFecha += Round(-decImporte, 0.01);

            end;

            decImporte := 0;
            strField5 := '6110047';
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            strField6 := aADO_Reader.Item('cta_' + strField5);
            if blnVentana then
                windows.Update(5, strField5);
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            begin

                if blnVentana then
                    windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                decImporte := aADO_Reader.Item('cta_' + strField5);
                if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                decTotalxFecha += Round(-decImporte, 0.01);

            end;

            decImporte := 0;
            strField5 := '6110011';
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            strField6 := aADO_Reader.Item('cta_' + strField5);
            if blnVentana then
                windows.Update(5, strField5);
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            begin

                if blnVentana then
                    windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                decImporte := aADO_Reader.Item('cta_' + strField5);
                if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                decTotalxFecha += Round(-decImporte, 0.01);

            end;

            decImporte := 0;
            strField5 := '6110025';
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            strField6 := aADO_Reader.Item('cta_' + strField5);
            if blnVentana then
                windows.Update(5, strField5);
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            begin

                if blnVentana then
                    windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                decImporte := aADO_Reader.Item('cta_' + strField5);
                if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                decTotalxFecha += Round(-decImporte, 0.01);

            end;

            decImporte := 0;
            strField5 := '6110001';
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            strField6 := aADO_Reader.Item('cta_' + strField5);
            if blnVentana then
                windows.Update(5, strField5);
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            begin

                if blnVentana then
                    windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                decImporte := aADO_Reader.Item('cta_' + strField5);
                if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                decTotalxFecha += Round(decImporte, 0.01);

            end;

            decImporte := 0;
            strField5 := '6110026';
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            strField6 := aADO_Reader.Item('cta_' + strField5);
            if blnVentana then
                windows.Update(5, strField5);
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            begin

                if blnVentana then
                    windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                decImporte := aADO_Reader.Item('cta_' + strField5);
                if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                decTotalxFecha += Round(decImporte, 0.01);

            end;

            decImporte := 0;
            strField5 := '6110002';
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            strField6 := aADO_Reader.Item('cta_' + strField5);
            if blnVentana then
                windows.Update(5, strField5);
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            begin

                if blnVentana then
                    windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                decImporte := aADO_Reader.Item('cta_' + strField5);
                if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                decTotalxFecha += Round(decImporte, 0.01);

            end;

            decImporte := 0;
            strField5 := '6110003';
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            strField6 := aADO_Reader.Item('cta_' + strField5);
            if blnVentana then
                windows.Update(5, strField5);
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            begin

                if blnVentana then
                    windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                decImporte := aADO_Reader.Item('cta_' + strField5);
                if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                decTotalxFecha += Round(decImporte, 0.01);

            end;

            decImporte := 0;
            strField5 := '6110005';
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            strField6 := aADO_Reader.Item('cta_' + strField5);
            if blnVentana then
                windows.Update(5, strField5);
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            begin

                if blnVentana then
                    windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                decImporte := aADO_Reader.Item('cta_' + strField5);
                if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                decTotalxFecha += Round(decImporte, 0.01);

            end;

            decImporte := 0;
            strField5 := '6311001';
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            strField6 := aADO_Reader.Item('cta_' + strField5);
            if blnVentana then
                windows.Update(5, strField5);
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            begin

                if blnVentana then
                    windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                decImporte := aADO_Reader.Item('cta_' + strField5);
                if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                decTotalxFecha += Round(decImporte, 0.01);

            end;

            decImporte := 0;
            strField5 := '6311002';
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            strField6 := aADO_Reader.Item('cta_' + strField5);
            if blnVentana then
                windows.Update(5, strField5);
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            begin

                if blnVentana then
                    windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                decImporte := aADO_Reader.Item('cta_' + strField5);
                if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                decTotalxFecha += Round(decImporte, 0.01);

            end;

            decImporte := 0;
            strField5 := '6312001';
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            strField6 := aADO_Reader.Item('cta_' + strField5);
            if blnVentana then
                windows.Update(5, strField5);
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            begin

                if blnVentana then
                    windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                decImporte := aADO_Reader.Item('cta_' + strField5);
                if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                decTotalxFecha += Round(decImporte, 0.01);

            end;

            decImporte := 0;
            strField5 := '6312002';
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            strField6 := aADO_Reader.Item('cta_' + strField5);
            if blnVentana then
                windows.Update(5, strField5);
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            begin

                if blnVentana then
                    windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                decImporte := aADO_Reader.Item('cta_' + strField5);
                if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                decTotalxFecha += Round(decImporte, 0.01);

            end;

            decImporte := 0;
            strField5 := '6313001';
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            strField6 := aADO_Reader.Item('cta_' + strField5);
            if blnVentana then
                windows.Update(5, strField5);
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            begin

                if blnVentana then
                    windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                decImporte := aADO_Reader.Item('cta_' + strField5);
                if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                decTotalxFecha += Round(decImporte, 0.01);

            end;

            decImporte := 0;
            strField5 := '6313002';
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            strField6 := aADO_Reader.Item('cta_' + strField5);
            if blnVentana then
                windows.Update(5, strField5);
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            begin

                if blnVentana then
                    windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                decImporte := aADO_Reader.Item('cta_' + strField5);
                if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                decTotalxFecha += Round(decImporte, 0.01);

            end;

            decImporte := 0;
            strField5 := '6106001';
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            strField6 := aADO_Reader.Item('cta_' + strField5);
            if blnVentana then
                windows.Update(5, strField5);
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            begin

                if blnVentana then
                    windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                decImporte := aADO_Reader.Item('cta_' + strField5);
                if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                decTotalxFecha += Round(decImporte, 0.01);

            end;

            decImporte := 0;
            strField5 := '6106002';
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            strField6 := aADO_Reader.Item('cta_' + strField5);
            if blnVentana then
                windows.Update(5, strField5);
            //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
            begin

                if blnVentana then
                    windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                decImporte := aADO_Reader.Item('cta_' + strField5);
                if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                decTotalxFecha += Round(decImporte, 0.01);

            end;

        end;

        windows.Close;
    end;

    [Scope('OnPrem')]
    procedure fntSincronizarRemuneracionesPasivoEsp(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strInicioSic: Text[30];
        strFinalSic: Text[30];
        datFechaVariable: Date;
        strVariable: Text[1024];
        intInteger: Integer;
        decDecimal: Decimal;
        ConnectionString: Text;
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');

        windows.Update(0, 'Remuneraciones pasivo españoles');

        strInicio := Format(datInicio, 0, '<Year4><Month,2><Day,2>');
        strFinal := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        if Evaluate(intInicio, strInicio) then;
        if Evaluate(intFinal, strFinal) then;
        strInicioSic := Format(datInicio, 0, '<Year4><Month,2><Day,2>');//'2015/06/01';
        strFinalSic := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        //++ESP

        filtString1 := '';
        filtString2 := '';
        filtString3 := '';

        filtString1 := 'select a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa, a.fec_imputacion,a.tp_imput,d.tp_imput_aux,d.id_categoria,d.id_puesto,' +
                       'g.id_nacion,f.n_categoria,e.n_puesto,a.FECHA_SICORE_ST,' +
                       'sum(ANT_DESC_EMB) cta_1115204,' +
                       'sum(ANT_DESC_ADM) cta_1115205,' +
                       'sum(REM_PAG_TA) cta_2112001,' +
                       'sum(REM_PAG_TE) cta_2112002,' +
                       'sum(REM_PAG_ADM) cta_2112003,' +
                       'sum(REM_PAG_PTA) cta_2112011,' +
                       'sum(CS_SC_A_PAG) cta_2113001,' +
                       'sum(OTR_CONTR_A_PAG) cta_2113005,' +
                       'sum(CTA_ALIM) cta_2113002,' +
                       'sum(EMB_JUDIC) cta_2113004,' +
                       'sum(SG_SC_ESP_A_PAG) cta_2113006,' +
                       'sum(IMP_GCIAS) cta_2115006, ' +
                       'sum(CNT_PROV_SAC) cta_2113029, ' +
                       'sum(CRED_IVA_TA + CRED_IVA_BA + CRED_IVA_PD + CRED_IVA_CR + CRED_IVA_PTA + CRED_IVA_PTA_PD) cta_1115314,' +
                       //'sum({-SAC_TA-SAC_AB-SAC_AP-SAC_AC-SAC_PTA_PD-SAC_PTA+}PROV_SAC) cta_2112010 ';
                       'sum(PROV_SAC) cta_2112010 ';


        if blnSicore then begin

            filtString2 := 'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                         'm4t_acumulado_rl3 d,m4_puestos_trabajo e,m4_categorias f ,m4_empleados g ' +
                         'where a.id_sociedad = b.id_sociedad ' +
                         //               'and a.id_empleado = ''00548'' '+
                         'and a.id_empleado = b.id_empleado ' +
                         'and a.fec_imputacion = b.fec_imputacion ' +
                         'and a.fec_alta_empleado = b.fec_alta_empleado ' +
                         'and a.fec_pago = b.fec_pago ' +
                         //               'and a.fec_imputacion = c.fec_imputacion '+
                         'and a.id_sociedad = c.id_sociedad ' +
                         'and a.id_empleado = c.id_empleado ' +
                         'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                         'and a.fec_pago = c.fec_pago ' +
                         'and a.id_sociedad = d.id_sociedad ' +
                         'and a.id_empleado = d.id_empleado ' +
                         //               'and a.fec_imputacion = d.fec_imputacion '+
                         'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                         'and a.fec_pago = d.fec_pago ' +
                         'and a.ID_CONVENIO = ''FE'' ' +
                         'and a.tp_imput <> 4 ' +
                         'and a.id_cto_cost_nav <> ''NULL''' +
                         //               'and a.fec_imputacion >= to_date('''+strInicioSic+''',''yyyy/mm/dd'') '+
                         //             'and a.fec_imputacion <= to_date('''+strFinalSic+''',''yyyy/mm/dd'') '+
                         'and d.id_categoria = f.id_categoria ' +
                         'and d.id_puesto = e.id_puesto ' +
                         'and a.id_empleado = g.id_empleado ';

        end
        else begin

            filtString2 := 'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                         'm4t_acumulado_rl3 d,m4_puestos_trabajo e,m4_categorias f ,m4_empleados g ' +
                         'where a.id_sociedad = b.id_sociedad ' +
                         //               'and a.id_empleado = ''00548'' '+
                         'and a.id_empleado = b.id_empleado ' +
                         //               'and a.fec_imputacion = b.fec_imputacion '+
                         'and a.fec_alta_empleado = b.fec_alta_empleado ' +
                         'and a.fec_pago = b.fec_pago ' +
                         //               'and a.fec_imputacion = c.fec_imputacion '+
                         'and a.id_sociedad = c.id_sociedad ' +
                         'and a.id_empleado = c.id_empleado ' +
                         'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                         'and a.fec_pago = c.fec_pago ' +
                         'and a.id_sociedad = d.id_sociedad ' +
                         'and a.id_empleado = d.id_empleado ' +
                         //             'and a.fec_imputacion = d.fec_imputacion '+
                         'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                         'and a.fec_pago = d.fec_pago ' +
                         'and a.tp_imput <> 4 ' +
                         'and a.id_cto_cost_nav <> ''NULL''' +
                         //               'and a.fec_imputacion >= to_date('''+strInicioSic+''',''yyyy/mm/dd'') '+
                         //               'and a.fec_imputacion <= to_date('''+strFinalSic+''',''yyyy/mm/dd'') '+
                         'and d.id_categoria = f.id_categoria ' +
                         'and d.id_puesto = e.id_puesto ' +
                         'and a.id_empleado = g.id_empleado ';

        end;

        filtString3 := 'AND FECHA_SICORE_ST >= to_date(''' + strInicioSic + ''',''yyyy/mm/dd'') ' +
                       'and FECHA_SICORE_ST <= to_date(''' + strFinalSic + ''',''yyyy/mm/dd'') ' +
                       'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,' +
                       'd.id_categoria,d.id_puesto,g.id_nacion,f.n_categoria,e.n_puesto,a.FECHA_SICORE_ST' +
                       ' order by a.fec_imputacion,a.id_empleado' +
                       ',a.FECHA_SICORE_ST';


        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);
        aADO_Con.Open;

        //aADO_Comm := aADO_Con.OracleConnection;

        aADO_Comm := aADO_Comm.OracleCommand(filtString1 + filtString2 + filtString3, aADO_Con);

        aADO_Reader := aADO_Comm.ExecuteReader;

        while aADO_Reader.Read() do begin

            begin

                if blnVentana then begin

                    windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));
                    windows.Update(2, aADO_Reader.Item('FEC_IMPUTACION'));
                    windows.Update(3, aADO_Reader.Item('ID_EMPRESA'));
                    windows.Update(4, aADO_Reader.Item('ID_CTO_COST_NAV'));

                end;
                strField1 := Format(aADO_Reader.Item('ID_EMPLEADO'));
                strField2 := Format(aADO_Reader.Item('FECHA_SICORE_ST'));
                strField3 := Format(aADO_Reader.Item('ID_EMPRESA'));
                strField4 := Format(aADO_Reader.Item('ID_CTO_COST_NAV'));

                strField7 := Format(aADO_Reader.Item('fec_imputacion'));

                //IF EVALUATE(intInteger,aADO_Reader.Item('TP_IMPUT')) THEN
                strField8 := Format(aADO_Reader.Item('TP_IMPUT'));

                strField9 := Format(aADO_Reader.Item('id_categoria'));
                strField10 := Format(aADO_Reader.Item('id_puesto'));
                strField11 := Format(aADO_Reader.Item('n_categoria'));
                strField12 := Format(aADO_Reader.Item('n_puesto'));
                strField13 := Format(aADO_Reader.Item('id_sociedad'));
                strField14 := Format(aADO_Reader.Item('FEC_IMPUTACION'));
                strField15 := Format(aADO_Reader.Item('id_nacion'));
                strField17 := Format(aADO_Reader.Item('tp_imput_aux'));
                if datFecha <> 0D then begin

                    if Format(datFecha) <> strField2 then begin

                        Clear(rstConfCont);
                        rstConfCont.Get();
                        if (Abs(decTotalxFecha) <> 0) and (Abs(decTotalxFecha) <= 1) then begin

                            //fntGenerarLineaDiario(rstConfCont.CuentaRedondeo,-decTotalxFecha,'',FORMAT(datFecha));
                            decTotalxFecha := 0;

                        end;

                    end;

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;

                decImporte := 0;
                strField5 := '1115204';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);

                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '1115205';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '2112001';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '2112002';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '2112003';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '2112010';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '2113029';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '2112011';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '2113001';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '2113005';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '2113002';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '2113004';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;


                decImporte := 0;
                strField5 := '2113006';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '2115006';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '1115314';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                    decTotalxFecha += Round(decImporte, 0.01);

                end;

            end;

        end;

        windows.Close;
    end;

    [Scope('OnPrem')]
    procedure fntSincronizarRemuneracionesResultadoEsp(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strInicioSic: Text[30];
        strFinalSic: Text[30];
        datFechaVariable: Date;
        strVariable: Text[1024];
        intInteger: Integer;
        decDecimal: Decimal;
        ConnectionString: Text;
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');

        windows.Update(0, 'Remuneraciones resultado españoles');

        strInicio := Format(datInicio, 0, '<Year4><Month,2><Day,2>');
        strFinal := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        if Evaluate(intInicio, strInicio) then;
        if Evaluate(intFinal, strFinal) then;
        strInicioSic := Format(datInicio, 0, '<Year4><Month,2><Day,2>');//'2015/06/01';
        strFinalSic := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        //++ESP

        filtString1 := 'select a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa, a.fec_imputacion,a.tp_imput,d.tp_imput_aux,d.id_categoria,d.id_puesto,' +
                       'g.id_nacion,f.n_categoria,e.n_puesto,a.FECHA_SICORE_ST, ' +
                       'sum(FARM_ASIST_MED) cta_6110006,' +
                       'sum(VIVERES) cta_6110007,' +
                       'sum(VIAJES) cta_6110010,' +
                       'sum(COMUNICAC) cta_6110011,' +
                       'sum(DIVERSOS) cta_6110025,' +
                       'sum(SDOS_JORN) cta_6110001,' +
                       'sum(CONTR_TA) cta_6110002,' +
                       'sum(REM_EXTR) cta_6110003,' +
                       'sum(GRAT_ESP) cta_6110005,' +
                       'sum(CNT_PROV_SAC) cta_6110027,' +
                       '-sum(DTO_SIND_EXENMT + DTO_SINDEXENSAC) cta_6110047, ' +
                       'sum(REMUN_AB) cta_6311001,' +
                       'sum(CONTR_AB) cta_6311002,' +
                       'sum(REMUN_AP) cta_6312001,' +
                       'sum(CONTR_AP) cta_6312002,' +
                       'sum(REMUN_AC) cta_6313001,' +
                       'sum(CONTR_AC) cta_6313002,' +
                       'sum(REMUN_PTA + REMUN_PTA_PD) cta_6106001,' +
                       'sum(CONTR_PTA + CONTR_PTA_PD) cta_6106002,' +
                       //'sum(PROV_SAC) cta_6110026 ';
                       'sum(+SAC_TA+SAC_AB+SAC_AP+SAC_AC+SAC_PTA_PD+SAC_PTA+PROV_SAC) cta_6110026 ';

        if blnSicore then begin

            filtString2 := 'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                         'm4t_acumulado_rl3 d, m4_puestos_trabajo e,m4_categorias f, m4_empleados g ' +
                         'where a.id_sociedad = b.id_sociedad ' +
                         'and a.id_empleado = b.id_empleado ' +
                         'and a.fec_imputacion = b.fec_imputacion ' +
                         'and a.id_sociedad = c.id_sociedad ' +
                         'and a.id_empleado = c.id_empleado ' +
                         'and a.fec_imputacion = c.fec_imputacion ' +
                         'and a.id_sociedad = d.id_sociedad ' +
                         'and a.id_empleado = d.id_empleado ' +
                         'and a.ID_CONVENIO = ''FE'' ' +
                         'and a.fec_imputacion = d.fec_imputacion ' +
                         'and a.tp_imput <> 4 ' +
                         'and a.id_cto_cost_nav <> ''NULL''' +
          /*               'and a.fec_imputacion >= to_date('''+strInicioSic+''',''yyyy/mm/dd'') '+
                         'and a.fec_imputacion <= to_date('''+strFinalSic+''',''yyyy/mm/dd'') '+
          */               'and a.fec_imputacion = b.fec_imputacion ' +
                         'and a.fec_imputacion = c.fec_imputacion ' +
                         'and a.fec_imputacion = c.fec_imputacion ' +
                         'and d.id_categoria = f.id_categoria ' +
                         'and d.id_puesto = e.id_puesto ' +
                         'and a.id_empleado = g.id_empleado ';

        end
        else begin

            filtString2 := 'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                         'm4t_acumulado_rl3 d, m4_puestos_trabajo e,m4_categorias f, m4_empleados g ' +
                         'where a.id_sociedad = b.id_sociedad ' +
                         'and a.id_empleado = b.id_empleado ' +
                         'and a.fec_imputacion = b.fec_imputacion ' +
                         'and a.id_sociedad = c.id_sociedad ' +
                         'and a.id_empleado = c.id_empleado ' +
                         'and a.fec_imputacion = c.fec_imputacion ' +
                         'and a.id_sociedad = d.id_sociedad ' +
                         'and a.id_empleado = d.id_empleado ' +
                         'and a.fec_imputacion = d.fec_imputacion ' +
                         'and a.ID_CONVENIO <> ''FE'' ' +
                         'and a.tp_imput <> 4 ' +
                         'and a.id_cto_cost_nav <> ''NULL''' +
          /*               'and a.fec_imputacion >= to_date('''+strInicioSic+''',''yyyy/mm/dd'') '+
                         'and a.fec_imputacion <= to_date('''+strFinalSic+''',''yyyy/mm/dd'') '+
          */               'and a.fec_imputacion = b.fec_imputacion ' +
                         'and a.fec_imputacion = c.fec_imputacion ' +
                         'and a.fec_imputacion = c.fec_imputacion ' +
                         'and d.id_categoria = f.id_categoria ' +
                         'and d.id_puesto = e.id_puesto ' +
                         'and a.id_empleado = g.id_empleado ';

        end;

        filtString3 :=
                       'AND FECHA_SICORE_ST >= to_date(''' + strInicioSic + ''',''yyyy/mm/dd'') ' +
                       'and FECHA_SICORE_ST <= to_date(''' + strFinalSic + ''',''yyyy/mm/dd'') ' +
                       'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                       'd.id_categoria,d.id_puesto,g.id_nacion,f.n_categoria,e.n_puesto order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                       'a.id_empleado';

        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);
        aADO_Con.Open;

        //aADO_Comm := aADO_Con.OracleConnection;
        aADO_Comm := aADO_Comm.OracleCommand(filtString1 + filtString2 + filtString3, aADO_Con);
        aADO_Reader := aADO_Comm.ExecuteReader;

        while aADO_Reader.Read() do begin

            begin

                if blnVentana then begin

                    windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));
                    windows.Update(2, aADO_Reader.Item('FEC_IMPUTACION'));
                    windows.Update(3, aADO_Reader.Item('ID_EMPRESA'));
                    windows.Update(4, aADO_Reader.Item('ID_CTO_COST_NAV'));

                end;
                strField1 := Format(aADO_Reader.Item('ID_EMPLEADO'));
                strField2 := Format(aADO_Reader.Item('FECHA_SICORE_ST'));
                strField3 := Format(aADO_Reader.Item('ID_EMPRESA'));
                strField4 := Format(aADO_Reader.Item('ID_CTO_COST_NAV'));

                strField7 := Format(aADO_Reader.Item('fec_imputacion'));

                //IF EVALUATE(intInteger,aADO_Reader.Item('TP_IMPUT')) THEN
                strField8 := Format(aADO_Reader.Item('TP_IMPUT'));
                strField9 := Format(aADO_Reader.Item('id_categoria'));
                strField10 := Format(aADO_Reader.Item('id_puesto'));
                strField11 := Format(aADO_Reader.Item('n_categoria'));
                strField12 := Format(aADO_Reader.Item('n_puesto'));
                strField13 := Format(aADO_Reader.Item('id_sociedad'));
                strField14 := Format(aADO_Reader.Item('FEC_IMPUTACION'));
                strField15 := Format(aADO_Reader.Item('id_nacion'));
                strField17 := Format(aADO_Reader.Item('tp_imput_aux'));

                if datFecha <> 0D then begin

                    if Format(datFecha) <> strField2 then begin

                        Clear(rstConfCont);
                        rstConfCont.Get();
                        if (Abs(decTotalxFecha) <> 0) and (Abs(decTotalxFecha) <= 1) then begin

                            //fntGenerarLineaDiario(rstConfCont.CuentaRedondeo,-decTotalxFecha,'',FORMAT(datFecha));
                            decTotalxFecha := 0;

                        end;

                    end;

                end;

                decImporte := 0;
                strField5 := '6110006';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '6110007';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '6110010';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '6110011';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '6110025';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '6110027';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '6110047';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '6110001';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                    decTotalxFecha += Round(decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '6110026';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                    decTotalxFecha += Round(decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '6110002';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                    decTotalxFecha += Round(decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '6110003';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                    decTotalxFecha += Round(decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '6110005';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                    decTotalxFecha += Round(decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '6311001';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                    decTotalxFecha += Round(decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '6311002';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                    decTotalxFecha += Round(decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '6312001';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                    decTotalxFecha += Round(decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '6312002';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                    decTotalxFecha += Round(decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '6313001';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                    decTotalxFecha += Round(decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '6313002';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                    decTotalxFecha += Round(decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '6106001';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                    decTotalxFecha += Round(decImporte, 0.01);

                end;

                decImporte := 0;
                strField5 := '6106002';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, decImporte, strField4, strField7);
                    decTotalxFecha += Round(decImporte, 0.01);

                end;

            end;

        end;

        windows.Close;

    end;

    [Scope('OnPrem')]
    procedure fntSincronizarSindicatoAPagarMaq(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strInicioSic: Text[30];
        strFinalSic: Text[30];
        datFechaVariable: Date;
        strVariable: Text[1024];
        intInteger: Integer;
        decDecimal: Decimal;
        ConnectionString: Text;
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');

        windows.Update(0, 'Sindicato maquinistas');

        strInicio := Format(datInicio, 0, '<Year4><Month,2><Day,2>');
        strFinal := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        if Evaluate(intInicio, strInicio) then;
        if Evaluate(intFinal, strFinal) then;
        strInicioSic := Format(datInicio, 0, '<Year4><Month,2><Day,2>');//'2015/06/01';
        strFinalSic := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        //--ESP

        filtString1 := '';
        filtString2 := '';
        filtString3 := '';

        filtString1 := 'select a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa, a.fec_imputacion,a.tp_imput,d.tp_imput_aux,d.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,' +
                       'g.id_nacion,a.FECHA_SICORE_ST,' +
                       'sum(CTA_SIN_A_PAG) cta_2113003 ' +
                       'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                       'm4t_acumulado_rl3 d, m4_categorias e,m4_puestos_trabajo f,m4_empleados g ';

        filtString2 := 'where a.id_sociedad = b.id_sociedad ' +
                       'and a.id_empleado = b.id_empleado ' +
                       'and a.fec_alta_empleado = b.fec_alta_empleado ' +
                       'and a.fec_pago = b.fec_pago ' +
                       'and a.fec_imputacion = b.fec_imputacion ' +
                       'and a.tp_imput <> 4 ' +
                       'and a.id_sociedad = c.id_sociedad ' +
                       'and a.id_empleado = c.id_empleado ' +
                       'and a.fec_imputacion = c.fec_imputacion ' +
                       'and a.ID_CONVENIO <> ''FE'' ' +
                       'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_sociedad = d.id_sociedad ' +
                       'and a.id_empleado = d.id_empleado ' +
                       'and a.fec_imputacion = d.fec_imputacion ' +
                       'and a.fec_alta_empleado = d.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_cto_cost_nav <> ''NULL'' ';

        if blnSicore then begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''MAQ'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';

        end
        else begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''MAQ'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';

        end;

        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);
        aADO_Con.Open;
        //aADO_Comm := aADO_Con.OracleConnection;
        aADO_Comm := aADO_Comm.OracleCommand(filtString1 + filtString2 + filtString3, aADO_Con);
        aADO_Reader := aADO_Comm.ExecuteReader;

        while aADO_Reader.Read() do begin

            begin

                if blnVentana then begin

                    windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));
                    windows.Update(2, aADO_Reader.Item('FEC_IMPUTACION'));
                    windows.Update(3, aADO_Reader.Item('ID_EMPRESA'));
                    windows.Update(4, aADO_Reader.Item('ID_CTO_COST_NAV'));

                end;
                strField1 := Format(aADO_Reader.Item('ID_EMPLEADO'));
                strField2 := Format(aADO_Reader.Item('FECHA_SICORE_ST'));
                strField3 := Format(aADO_Reader.Item('ID_EMPRESA'));
                strField4 := Format(aADO_Reader.Item('ID_CTO_COST_NAV'));

                strField7 := Format(aADO_Reader.Item('fec_imputacion'));

                //IF EVALUATE(intInteger,aADO_Reader.Item('TP_IMPUT')) THEN
                strField8 := Format(aADO_Reader.Item('TP_IMPUT'));

                strField9 := Format(aADO_Reader.Item('id_categoria'));
                strField10 := Format(aADO_Reader.Item('id_puesto'));
                strField11 := Format(aADO_Reader.Item('n_categoria'));
                strField12 := Format(aADO_Reader.Item('n_puesto'));
                strField13 := Format(aADO_Reader.Item('id_sociedad'));
                strField14 := Format(aADO_Reader.Item('FEC_IMPUTACION'));
                strField15 := Format(aADO_Reader.Item('id_nacion'));
                strField17 := Format(aADO_Reader.Item('tp_imput_aux'));

                if datFecha <> 0D then begin

                    if Format(datFecha) <> strField2 then begin

                        Clear(rstConfCont);
                        rstConfCont.Get();
                        if (Abs(decTotalxFecha) <> 0) and (Abs(decTotalxFecha) <= 1) then begin

                            //fntGenerarLineaDiario(rstConfCont.CuentaRedondeo,-decTotalxFecha,'',FORMAT(datFecha));
                            decTotalxFecha := 0;

                        end;

                    end;

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;

                decImporte := 0;
                strField5 := '2113003';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;



            end;

        end;

        windows.Close;
    end;

    [Scope('OnPrem')]
    procedure fntSincronizarSindicatoAPagarCap(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strInicioSic: Text[30];
        strFinalSic: Text[30];
        datFechaVariable: Date;
        strVariable: Text[1024];
        intInteger: Integer;
        decDecimal: Decimal;
        ConnectionString: Text;
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');

        windows.Update(0, 'Sindicato a pagar capitanes');

        strInicio := Format(datInicio, 0, '<Year4><Month,2><Day,2>');
        strFinal := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        if Evaluate(intInicio, strInicio) then;
        if Evaluate(intFinal, strFinal) then;
        strInicioSic := Format(datInicio, 0, '<Year4><Month,2><Day,2>');//'2015/06/01';
        strFinalSic := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        //--ESP

        filtString1 := '';
        filtString2 := '';
        filtString3 := '';

        filtString1 := 'select a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa, a.fec_imputacion,a.tp_imput,d.tp_imput_aux,d.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,' +
                       'g.id_nacion,a.FECHA_SICORE_ST,' +
                       'sum(CTA_SIN_A_PAG) cta_2113008 ' +
                       'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                       'm4t_acumulado_rl3 d, m4_categorias e,m4_puestos_trabajo f,m4_empleados g ';

        filtString2 := 'where a.id_sociedad = b.id_sociedad ' +
                       'and a.id_empleado = b.id_empleado ' +
                       'and a.fec_alta_empleado = b.fec_alta_empleado ' +
                       'and a.fec_pago = b.fec_pago ' +
                       'and a.fec_imputacion = b.fec_imputacion ' +
                       'and a.ID_CONVENIO <> ''FE'' ' +
                       'and a.tp_imput <> 4 ' +
                       'and a.id_sociedad = c.id_sociedad ' +
                       'and a.id_empleado = c.id_empleado ' +
                       'and a.fec_imputacion = c.fec_imputacion ' +
                       'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_sociedad = d.id_sociedad ' +
                       'and a.id_empleado = d.id_empleado ' +
                       'and a.fec_imputacion = d.fec_imputacion ' +
                       'and a.fec_alta_empleado = d.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_cto_cost_nav <> ''NULL'' ';

        if blnSicore then begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''CAP'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';

        end
        else begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''CAP'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';


        end;

        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);

        aADO_Con.Open;
        //aADO_Comm := aADO_Con.OracleConnection;

        aADO_Comm := aADO_Comm.OracleCommand(filtString1 + filtString2 + filtString3, aADO_Con);

        aADO_Reader := aADO_Comm.ExecuteReader;

        while aADO_Reader.Read() do begin


            begin

                if blnVentana then begin

                    windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));
                    windows.Update(2, aADO_Reader.Item('FEC_IMPUTACION'));
                    windows.Update(3, aADO_Reader.Item('ID_EMPRESA'));
                    windows.Update(4, aADO_Reader.Item('ID_CTO_COST_NAV'));

                end;
                strField1 := Format(aADO_Reader.Item('ID_EMPLEADO'));
                strField2 := Format(aADO_Reader.Item('FECHA_SICORE_ST'));
                strField3 := Format(aADO_Reader.Item('ID_EMPRESA'));
                strField4 := Format(aADO_Reader.Item('ID_CTO_COST_NAV'));

                strField7 := Format(aADO_Reader.Item('fec_imputacion'));

                //IF EVALUATE(intInteger,aADO_Reader.Item('TP_IMPUT')) THEN
                strField8 := Format(aADO_Reader.Item('TP_IMPUT'));

                strField9 := Format(aADO_Reader.Item('id_categoria'));
                strField10 := Format(aADO_Reader.Item('id_puesto'));
                strField11 := Format(aADO_Reader.Item('n_categoria'));
                strField12 := Format(aADO_Reader.Item('n_puesto'));
                strField13 := Format(aADO_Reader.Item('id_sociedad'));
                strField14 := Format(aADO_Reader.Item('FEC_IMPUTACION'));
                strField15 := Format(aADO_Reader.Item('id_nacion'));
                strField17 := Format(aADO_Reader.Item('tp_imput_aux'));

                if datFecha <> 0D then begin

                    if Format(datFecha) <> strField2 then begin

                        Clear(rstConfCont);
                        rstConfCont.Get();
                        if (Abs(decTotalxFecha) <> 0) and (Abs(decTotalxFecha) <= 1) then begin

                            //fntGenerarLineaDiario(rstConfCont.CuentaRedondeo,-decTotalxFecha,'',FORMAT(datFecha));
                            decTotalxFecha := 0;

                        end;

                    end;

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;

                decImporte := 0;
                strField5 := '2113008';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;



            end;

        end;


        windows.Close;
    end;

    [Scope('OnPrem')]
    procedure fntSincronizarSindicatoAPagarFEC(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strInicioSic: Text[30];
        strFinalSic: Text[30];
        datFechaVariable: Date;
        strVariable: Text[1024];
        intInteger: Integer;
        decDecimal: Decimal;
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');

        windows.Update(0, 'Sindicatos FEC');

        strInicio := Format(datInicio, 0, '<Year4><Month,2><Day,2>');
        strFinal := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        if Evaluate(intInicio, strInicio) then;
        if Evaluate(intFinal, strFinal) then;
        strInicioSic := Format(datInicio, 0, '<Year4><Month,2><Day,2>');//'2015/06/01';
        strFinalSic := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        //Agrego nuevo sindicato FEC (Federación Argentina Empleados Comercio)


        //--ESP

        filtString1 := '';
        filtString2 := '';
        filtString3 := '';

        filtString1 := 'select a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa, a.fec_imputacion,a.tp_imput,d.tp_imput_aux,d.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,' +
                       'g.id_nacion,a.FECHA_SICORE_ST,' +
                       'sum(CTA_SIN_A_PAG) cta_2113024 ' +
                       'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                       'm4t_acumulado_rl3 d, m4_categorias e,m4_puestos_trabajo f,m4_empleados g ';

        filtString2 := 'where a.id_sociedad = b.id_sociedad ' +
                       'and a.id_empleado = b.id_empleado ' +
                       'and a.fec_alta_empleado = b.fec_alta_empleado ' +
                       'and a.fec_pago = b.fec_pago ' +
                       'and a.fec_imputacion = b.fec_imputacion ' +
                       'and a.tp_imput <> 4 ' +
                       'and a.id_sociedad = c.id_sociedad ' +
                       'and a.id_empleado = c.id_empleado ' +
                       'and a.fec_imputacion = c.fec_imputacion ' +
                       'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_sociedad = d.id_sociedad ' +
                       'and a.ID_CONVENIO <> ''FE'' ' +
                       'and a.id_empleado = d.id_empleado ' +
                       'and a.fec_imputacion = d.fec_imputacion ' +
                       'and a.fec_alta_empleado = d.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_cto_cost_nav <> ''NULL'' ';

        if blnSicore then begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''FEC'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';

        end
        else begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''FEC'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';


        end;

        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);

        aADO_Con.Open;
        //aADO_Comm := aADO_Con.OracleConnection;

        aADO_Comm := aADO_Comm.OracleCommand(filtString1 + filtString2 + filtString3, aADO_Con);

        aADO_Reader := aADO_Comm.ExecuteReader;

        while aADO_Reader.Read() do begin


            begin

                if blnVentana then begin

                    windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));
                    windows.Update(2, aADO_Reader.Item('FEC_IMPUTACION'));
                    windows.Update(3, aADO_Reader.Item('ID_EMPRESA'));
                    windows.Update(4, aADO_Reader.Item('ID_CTO_COST_NAV'));

                end;
                strField1 := Format(aADO_Reader.Item('ID_EMPLEADO'));
                strField2 := Format(aADO_Reader.Item('FECHA_SICORE_ST'));
                strField3 := Format(aADO_Reader.Item('ID_EMPRESA'));
                strField4 := Format(aADO_Reader.Item('ID_CTO_COST_NAV'));

                strField7 := Format(aADO_Reader.Item('fec_imputacion'));

                //IF EVALUATE(intInteger,aADO_Reader.Item('TP_IMPUT')) THEN
                strField8 := Format(aADO_Reader.Item('TP_IMPUT'));

                strField9 := Format(aADO_Reader.Item('id_categoria'));
                strField10 := Format(aADO_Reader.Item('id_puesto'));
                strField11 := Format(aADO_Reader.Item('n_categoria'));
                strField12 := Format(aADO_Reader.Item('n_puesto'));
                strField13 := Format(aADO_Reader.Item('id_sociedad'));
                strField14 := Format(aADO_Reader.Item('FEC_IMPUTACION'));
                strField15 := Format(aADO_Reader.Item('id_nacion'));
                strField17 := Format(aADO_Reader.Item('tp_imput_aux'));

                if datFecha <> 0D then begin

                    if Format(datFecha) <> strField2 then begin

                        Clear(rstConfCont);
                        rstConfCont.Get();
                        if (Abs(decTotalxFecha) <> 0) and (Abs(decTotalxFecha) <= 1) then begin

                            //fntGenerarLineaDiario(rstConfCont.CuentaRedondeo,-decTotalxFecha,'',FORMAT(datFecha));
                            decTotalxFecha := 0;

                        end;

                    end;

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;

                decImporte := 0;
                strField5 := '2113024';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;



            end;

        end;

        //--ESP
        windows.Close;
    end;

    [Scope('OnPrem')]
    procedure fntSincronizarSindicatoAPagarASO(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strInicioSic: Text[30];
        strFinalSic: Text[30];
        datFechaVariable: Date;
        strVariable: Text[1024];
        intInteger: Integer;
        decDecimal: Decimal;
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');

        windows.Update(0, 'Sindicatos ASO');

        strInicio := Format(datInicio, 0, '<Year4><Month,2><Day,2>');
        strFinal := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        if Evaluate(intInicio, strInicio) then;
        if Evaluate(intFinal, strFinal) then;
        strInicioSic := Format(datInicio, 0, '<Year4><Month,2><Day,2>');//'2015/06/01';
        strFinalSic := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        filtString1 := '';
        filtString2 := '';
        filtString3 := '';

        filtString1 := 'select a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa, a.fec_imputacion,a.tp_imput,d.tp_imput_aux,d.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,' +
                       'g.id_nacion,a.FECHA_SICORE_ST,' +
                       'sum(CTA_SIN_A_PAG) cta_2113010 ' +
                       'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                       'm4t_acumulado_rl3 d, m4_categorias e,m4_puestos_trabajo f,m4_empleados g ';

        filtString2 := 'where a.id_sociedad = b.id_sociedad ' +
                       'and a.id_empleado = b.id_empleado ' +
                       'and a.fec_alta_empleado = b.fec_alta_empleado ' +
                       'and a.fec_pago = b.fec_pago ' +
                       'and a.fec_imputacion = b.fec_imputacion ' +
                       'and a.tp_imput <> 4 ' +
                       'and a.id_sociedad = c.id_sociedad ' +
                       'and a.id_empleado = c.id_empleado ' +
                       'and a.fec_imputacion = c.fec_imputacion ' +
                       'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                       'and a.ID_CONVENIO <> ''FE'' ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_sociedad = d.id_sociedad ' +
                       'and a.id_empleado = d.id_empleado ' +
                       'and a.fec_imputacion = d.fec_imputacion ' +
                       'and a.fec_alta_empleado = d.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_cto_cost_nav <> ''NULL'' ';

        if blnSicore then begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''ASO'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';

        end
        else begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''ASO'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';

        end;

        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);

        aADO_Con.Open;
        //aADO_Comm := aADO_Con.OracleConnection;

        aADO_Comm := aADO_Comm.OracleCommand(filtString1 + filtString2 + filtString3, aADO_Con);

        aADO_Reader := aADO_Comm.ExecuteReader;

        while aADO_Reader.Read() do begin



            begin

                if blnVentana then begin

                    windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));
                    windows.Update(2, aADO_Reader.Item('FEC_IMPUTACION'));
                    windows.Update(3, aADO_Reader.Item('ID_EMPRESA'));
                    windows.Update(4, aADO_Reader.Item('ID_CTO_COST_NAV'));

                end;

                strField1 := Format(aADO_Reader.Item('ID_EMPLEADO'));
                strField2 := Format(aADO_Reader.Item('FECHA_SICORE_ST'));
                strField3 := Format(aADO_Reader.Item('ID_EMPRESA'));
                strField4 := Format(aADO_Reader.Item('ID_CTO_COST_NAV'));

                strField7 := Format(aADO_Reader.Item('fec_imputacion'));

                //IF EVALUATE(intInteger,aADO_Reader.Item('TP_IMPUT')) THEN
                strField8 := Format(aADO_Reader.Item('TP_IMPUT'));
                strField9 := Format(aADO_Reader.Item('id_categoria'));
                strField10 := Format(aADO_Reader.Item('id_puesto'));
                strField11 := Format(aADO_Reader.Item('n_categoria'));
                strField12 := Format(aADO_Reader.Item('n_puesto'));
                strField13 := Format(aADO_Reader.Item('id_sociedad'));
                strField14 := Format(aADO_Reader.Item('FEC_IMPUTACION'));
                strField15 := Format(aADO_Reader.Item('id_nacion'));
                strField17 := Format(aADO_Reader.Item('tp_imput_aux'));

                if datFecha <> 0D then begin

                    if Format(datFecha) <> strField2 then begin

                        Clear(rstConfCont);
                        rstConfCont.Get();
                        if (Abs(decTotalxFecha) <> 0) and (Abs(decTotalxFecha) <= 1) then begin

                            //fntGenerarLineaDiario(rstConfCont.CuentaRedondeo,-decTotalxFecha,'',FORMAT(datFecha));
                            decTotalxFecha := 0;

                        end;

                    end;

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;

                decImporte := 0;
                strField5 := '2113010';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;



            end;

        end;


        windows.Close;
    end;

    [Scope('OnPrem')]
    procedure fntSincronizarSindicatoAPagarCON(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strInicioSic: Text[30];
        strFinalSic: Text[30];
        datFechaVariable: Date;
        strVariable: Text[1024];
        intInteger: Integer;
        decDecimal: Decimal;
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');

        windows.Update(0, 'Sindicatos CON');

        strInicio := Format(datInicio, 0, '<Year4><Month,2><Day,2>');
        strFinal := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        if Evaluate(intInicio, strInicio) then;
        if Evaluate(intFinal, strFinal) then;
        strInicioSic := Format(datInicio, 0, '<Year4><Month,2><Day,2>');//'2015/06/01';
        strFinalSic := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        filtString1 := '';
        filtString2 := '';
        filtString3 := '';

        filtString1 := 'select a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa, a.fec_imputacion,a.tp_imput,d.tp_imput_aux,d.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,' +
                       'g.id_nacion,a.FECHA_SICORE_ST,' +
                       'sum(CTA_SIN_A_PAG) cta_2113011 ' +
                       'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                       'm4t_acumulado_rl3 d, m4_categorias e,m4_puestos_trabajo f,m4_empleados g ';

        filtString2 := 'where a.id_sociedad = b.id_sociedad ' +
                       'and a.id_empleado = b.id_empleado ' +
                       'and a.fec_alta_empleado = b.fec_alta_empleado ' +
                       'and a.fec_pago = b.fec_pago ' +
                       'and a.fec_imputacion = b.fec_imputacion ' +
                       'and a.tp_imput <> 4 ' +
                       'and a.id_sociedad = c.id_sociedad ' +
                       'and a.id_empleado = c.id_empleado ' +
                       'and a.ID_CONVENIO <> ''FE'' ' +
                       'and a.fec_imputacion = c.fec_imputacion ' +
                       'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_sociedad = d.id_sociedad ' +
                       'and a.id_empleado = d.id_empleado ' +
                       'and a.fec_imputacion = d.fec_imputacion ' +
                       'and a.fec_alta_empleado = d.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_cto_cost_nav <> ''NULL'' ';

        if blnSicore then begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''CON'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';



        end
        else begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''CON'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';

        end;

        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);

        aADO_Con.Open;
        //aADO_Comm := aADO_Con.OracleConnection;

        aADO_Comm := aADO_Comm.OracleCommand(filtString1 + filtString2 + filtString3, aADO_Con);

        aADO_Reader := aADO_Comm.ExecuteReader;


        while aADO_Reader.Read() do begin



            begin

                if blnVentana then begin

                    windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));
                    windows.Update(2, aADO_Reader.Item('FEC_IMPUTACION'));
                    windows.Update(3, aADO_Reader.Item('ID_EMPRESA'));
                    windows.Update(4, aADO_Reader.Item('ID_CTO_COST_NAV'));

                end;

                strField1 := Format(aADO_Reader.Item('ID_EMPLEADO'));
                strField2 := Format(aADO_Reader.Item('FECHA_SICORE_ST'));
                strField3 := Format(aADO_Reader.Item('ID_EMPRESA'));
                strField4 := Format(aADO_Reader.Item('ID_CTO_COST_NAV'));

                strField7 := Format(aADO_Reader.Item('fec_imputacion'));

                //IF EVALUATE(intInteger,aADO_Reader.Item('TP_IMPUT')) THEN
                strField8 := Format(aADO_Reader.Item('TP_IMPUT'));
                strField9 := Format(aADO_Reader.Item('id_categoria'));
                strField10 := Format(aADO_Reader.Item('id_puesto'));
                strField11 := Format(aADO_Reader.Item('n_categoria'));
                strField12 := Format(aADO_Reader.Item('n_puesto'));
                strField13 := Format(aADO_Reader.Item('id_sociedad'));
                strField14 := Format(aADO_Reader.Item('FEC_IMPUTACION'));
                strField15 := Format(aADO_Reader.Item('id_nacion'));
                strField17 := Format(aADO_Reader.Item('tp_imput_aux'));

                if datFecha <> 0D then begin

                    if Format(datFecha) <> strField2 then begin

                        Clear(rstConfCont);
                        rstConfCont.Get();
                        if (Abs(decTotalxFecha) <> 0) and (Abs(decTotalxFecha) <= 1) then begin

                            //fntGenerarLineaDiario(rstConfCont.CuentaRedondeo,-decTotalxFecha,'',FORMAT(datFecha));
                            decTotalxFecha := 0;

                        end;

                    end;

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;

                decImporte := 0;
                strField5 := '2113011';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;



            end;

        end;

        windows.Close;
    end;

    [Scope('OnPrem')]
    procedure fntSincronizarSindicatoAPagarPAT(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strInicioSic: Text[30];
        strFinalSic: Text[30];
        datFechaVariable: Date;
        strVariable: Text[1024];
        intInteger: Integer;
        decDecimal: Decimal;
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');

        windows.Update(0, 'Sindicatos PAT');

        strInicio := Format(datInicio, 0, '<Year4><Month,2><Day,2>');
        strFinal := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        if Evaluate(intInicio, strInicio) then;
        if Evaluate(intFinal, strFinal) then;
        strInicioSic := Format(datInicio, 0, '<Year4><Month,2><Day,2>');//'2015/06/01';
        strFinalSic := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        filtString1 := '';
        filtString2 := '';
        filtString3 := '';

        filtString1 := 'select a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa, a.fec_imputacion,a.tp_imput,d.tp_imput_aux,d.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,' +
                       'g.id_nacion,a.FECHA_SICORE_ST,' +
                       'sum(CTA_SIN_A_PAG) cta_2113009 ' +
                       'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                       'm4t_acumulado_rl3 d, m4_categorias e,m4_puestos_trabajo f,m4_empleados g ';

        filtString2 := 'where a.id_sociedad = b.id_sociedad ' +
                       'and a.id_empleado = b.id_empleado ' +
                       'and a.fec_alta_empleado = b.fec_alta_empleado ' +
                       'and a.fec_pago = b.fec_pago ' +
                       'and a.fec_imputacion = b.fec_imputacion ' +
                       'and a.tp_imput <> 4 ' +
                       'and a.id_sociedad = c.id_sociedad ' +
                       'and a.id_empleado = c.id_empleado ' +
                       'and a.fec_imputacion = c.fec_imputacion ' +
                       'and a.ID_CONVENIO <> ''FE'' ' +
                       'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_sociedad = d.id_sociedad ' +
                       'and a.id_empleado = d.id_empleado ' +
                       'and a.fec_imputacion = d.fec_imputacion ' +
                       'and a.fec_alta_empleado = d.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_cto_cost_nav <> ''NULL'' ';

        if blnSicore then begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''PAT'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';

        end
        else begin

            filtString3 :=
                           'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                           'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                           'and d.id_categoria = e.id_categoria ' +
                           'and d.id_puesto = f.id_puesto ' +
                           'and g.id_empleado = a.id_empleado ' +
                           'and c.ID_SINDICATO = ''PAT'' ' +
                           'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                           'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                           'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                           'a.id_empleado';


        end;

        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);

        aADO_Con.Open;
        //aADO_Comm := aADO_Con.OracleConnection;

        aADO_Comm := aADO_Comm.OracleCommand(filtString1 + filtString2 + filtString3, aADO_Con);

        aADO_Reader := aADO_Comm.ExecuteReader;

        while aADO_Reader.Read() do begin



            begin

                if blnVentana then begin

                    windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));
                    windows.Update(2, aADO_Reader.Item('FEC_IMPUTACION'));
                    windows.Update(3, aADO_Reader.Item('ID_EMPRESA'));
                    windows.Update(4, aADO_Reader.Item('ID_CTO_COST_NAV'));

                end;
                strField1 := Format(aADO_Reader.Item('ID_EMPLEADO'));
                strField2 := Format(aADO_Reader.Item('FECHA_SICORE_ST'));
                strField3 := Format(aADO_Reader.Item('ID_EMPRESA'));
                strField4 := Format(aADO_Reader.Item('ID_CTO_COST_NAV'));

                strField7 := Format(aADO_Reader.Item('fec_imputacion'));

                //IF EVALUATE(intInteger,aADO_Reader.Item('TP_IMPUT')) THEN
                strField8 := Format(aADO_Reader.Item('TP_IMPUT'));
                strField9 := Format(aADO_Reader.Item('id_categoria'));
                strField10 := Format(aADO_Reader.Item('id_puesto'));
                strField11 := Format(aADO_Reader.Item('n_categoria'));
                strField12 := Format(aADO_Reader.Item('n_puesto'));
                strField13 := Format(aADO_Reader.Item('id_sociedad'));
                strField14 := Format(aADO_Reader.Item('FEC_IMPUTACION'));
                strField15 := Format(aADO_Reader.Item('id_nacion'));
                strField17 := Format(aADO_Reader.Item('tp_imput_aux'));

                if datFecha <> 0D then begin

                    if Format(datFecha) <> strField2 then begin

                        Clear(rstConfCont);
                        rstConfCont.Get();
                        if (Abs(decTotalxFecha) <> 0) and (Abs(decTotalxFecha) <= 1) then begin

                            //fntGenerarLineaDiario(rstConfCont.CuentaRedondeo,-decTotalxFecha,'',FORMAT(datFecha));
                            decTotalxFecha := 0;

                        end;

                    end;

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;

                decImporte := 0;
                strField5 := '2113009';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;



            end;

        end;


        windows.Close;
    end;

    [Scope('OnPrem')]
    procedure fntSincronizarSindicatoAPagarSBASTI(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strInicioSic: Text[30];
        strFinalSic: Text[30];
        datFechaVariable: Date;
        strVariable: Text[1024];
        intInteger: Integer;
        decDecimal: Decimal;
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');

        windows.Update(0, 'Sindicatos SBA/STI');

        strInicio := Format(datInicio, 0, '<Year4><Month,2><Day,2>');
        strFinal := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        if Evaluate(intInicio, strInicio) then;
        if Evaluate(intFinal, strFinal) then;
        strInicioSic := Format(datInicio, 0, '<Year4><Month,2><Day,2>');//'2015/06/01';
        strFinalSic := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        filtString1 := '';
        filtString2 := '';
        filtString3 := '';

        filtString1 := 'select a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa, a.fec_imputacion,a.tp_imput,d.tp_imput_aux,d.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,' +
                       'g.id_nacion,a.FECHA_SICORE_ST,' +
                       'sum(CTA_SIN_A_PAG) cta_2113013 ' +
                       'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                       'm4t_acumulado_rl3 d, m4_categorias e,m4_puestos_trabajo f,m4_empleados g ';

        filtString2 := 'where a.id_sociedad = b.id_sociedad ' +
                       'and a.id_empleado = b.id_empleado ' +
                       'and a.fec_alta_empleado = b.fec_alta_empleado ' +
                       'and a.fec_pago = b.fec_pago ' +
                       'and a.fec_imputacion = b.fec_imputacion ' +
                       'and a.tp_imput <> 4 ' +
                       'and a.id_sociedad = c.id_sociedad ' +
                       'and a.id_empleado = c.id_empleado ' +
                       'and a.fec_imputacion = c.fec_imputacion ' +
                       'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.ID_CONVENIO <> ''FE'' ' +
                       'and a.id_sociedad = d.id_sociedad ' +
                       'and a.id_empleado = d.id_empleado ' +
                       'and a.fec_imputacion = d.fec_imputacion ' +
                       'and a.fec_alta_empleado = d.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_cto_cost_nav <> ''NULL'' ';

        if blnSicore then begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and (c.ID_SINDICATO = ''SBA'' ' +
                         'or c.id_sindicato = ''STI'') ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';

        end
        else begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and (c.ID_SINDICATO = ''SBA'' ' +
                         'or c.id_sindicato = ''STI'') ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';


        end;

        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);

        aADO_Con.Open;
        //aADO_Comm := aADO_Con.OracleConnection;

        aADO_Comm := aADO_Comm.OracleCommand(filtString1 + filtString2 + filtString3, aADO_Con);

        aADO_Reader := aADO_Comm.ExecuteReader;

        while aADO_Reader.Read() do begin



            begin

                if blnVentana then begin

                    windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));
                    windows.Update(2, aADO_Reader.Item('FEC_IMPUTACION'));
                    windows.Update(3, aADO_Reader.Item('ID_EMPRESA'));
                    windows.Update(4, aADO_Reader.Item('ID_CTO_COST_NAV'));

                end;
                strField1 := Format(aADO_Reader.Item('ID_EMPLEADO'));
                strField2 := Format(aADO_Reader.Item('FECHA_SICORE_ST'));
                strField3 := Format(aADO_Reader.Item('ID_EMPRESA'));
                strField4 := Format(aADO_Reader.Item('ID_CTO_COST_NAV'));

                strField7 := Format(aADO_Reader.Item('fec_imputacion'));

                //IF EVALUATE(intInteger,aADO_Reader.Item('TP_IMPUT')) THEN
                strField8 := Format(aADO_Reader.Item('TP_IMPUT'));
                strField9 := Format(aADO_Reader.Item('id_categoria'));
                strField10 := Format(aADO_Reader.Item('id_puesto'));
                strField11 := Format(aADO_Reader.Item('n_categoria'));
                strField12 := Format(aADO_Reader.Item('n_puesto'));
                strField13 := Format(aADO_Reader.Item('id_sociedad'));
                strField14 := Format(aADO_Reader.Item('FEC_IMPUTACION'));
                strField15 := Format(aADO_Reader.Item('id_nacion'));
                strField17 := Format(aADO_Reader.Item('tp_imput_aux'));

                if datFecha <> 0D then begin

                    if Format(datFecha) <> strField2 then begin

                        Clear(rstConfCont);
                        rstConfCont.Get();
                        if (Abs(decTotalxFecha) <> 0) and (Abs(decTotalxFecha) <= 1) then begin

                            //fntGenerarLineaDiario(rstConfCont.CuentaRedondeo,-decTotalxFecha,'',FORMAT(datFecha));
                            decTotalxFecha := 0;

                        end;

                    end;

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;

                decImporte := 0;
                strField5 := '2113013';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;



            end;

        end;

        windows.Close;
    end;

    [Scope('OnPrem')]
    procedure fntSincronizarSindicatoAPagarSEC(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strInicioSic: Text[30];
        strFinalSic: Text[30];
        datFechaVariable: Date;
        strVariable: Text[1024];
        intInteger: Integer;
        decDecimal: Decimal;
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');

        windows.Update(0, 'Sindicatos SEC');

        strInicio := Format(datInicio, 0, '<Year4><Month,2><Day,2>');
        strFinal := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        if Evaluate(intInicio, strInicio) then;
        if Evaluate(intFinal, strFinal) then;
        strInicioSic := Format(datInicio, 0, '<Year4><Month,2><Day,2>');//'2015/06/01';
        strFinalSic := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        filtString1 := '';
        filtString2 := '';
        filtString3 := '';

        filtString1 := 'select a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa, a.fec_imputacion,a.tp_imput,d.tp_imput_aux,d.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,' +
                       'g.id_nacion,a.FECHA_SICORE_ST,' +
                       'sum(CTA_SIN_A_PAG) cta_2113020 ' +
                       'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                       'm4t_acumulado_rl3 d, m4_categorias e,m4_puestos_trabajo f,m4_empleados g ';

        filtString2 := 'where a.id_sociedad = b.id_sociedad ' +
                       'and a.id_empleado = b.id_empleado ' +
                       'and a.fec_alta_empleado = b.fec_alta_empleado ' +
                       'and a.fec_pago = b.fec_pago ' +
                       'and a.fec_imputacion = b.fec_imputacion ' +
                       'and a.tp_imput <> 4 ' +
                       'and a.id_sociedad = c.id_sociedad ' +
                       'and a.id_empleado = c.id_empleado ' +
                       'and a.fec_imputacion = c.fec_imputacion ' +
                       'and a.ID_CONVENIO <> ''FE'' ' +
                       'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_sociedad = d.id_sociedad ' +
                       'and a.id_empleado = d.id_empleado ' +
                       'and a.fec_imputacion = d.fec_imputacion ' +
                       'and a.fec_alta_empleado = d.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_cto_cost_nav <> ''NULL'' ';

        if blnSicore then begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''SEC'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';

        end
        else begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''SEC'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';


        end;

        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);

        aADO_Con.Open;
        //aADO_Comm := aADO_Con.OracleConnection;

        aADO_Comm := aADO_Comm.OracleCommand(filtString1 + filtString2 + filtString3, aADO_Con);

        aADO_Reader := aADO_Comm.ExecuteReader;

        while aADO_Reader.Read() do begin



            begin

                if blnVentana then begin

                    windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));
                    windows.Update(2, aADO_Reader.Item('FEC_IMPUTACION'));
                    windows.Update(3, aADO_Reader.Item('ID_EMPRESA'));
                    windows.Update(4, aADO_Reader.Item('ID_CTO_COST_NAV'));

                end;
                strField1 := Format(aADO_Reader.Item('ID_EMPLEADO'));
                strField2 := Format(aADO_Reader.Item('FECHA_SICORE_ST'));
                strField3 := Format(aADO_Reader.Item('ID_EMPRESA'));
                strField4 := Format(aADO_Reader.Item('ID_CTO_COST_NAV'));

                strField7 := Format(aADO_Reader.Item('fec_imputacion'));

                //IF EVALUATE(intInteger,aADO_Reader.Item('TP_IMPUT')) THEN
                strField8 := Format(aADO_Reader.Item('TP_IMPUT'));
                strField9 := Format(aADO_Reader.Item('id_categoria'));
                strField10 := Format(aADO_Reader.Item('id_puesto'));
                strField11 := Format(aADO_Reader.Item('n_categoria'));
                strField12 := Format(aADO_Reader.Item('n_puesto'));
                strField13 := Format(aADO_Reader.Item('id_sociedad'));
                strField14 := Format(aADO_Reader.Item('FEC_IMPUTACION'));
                strField15 := Format(aADO_Reader.Item('id_nacion'));
                strField17 := Format(aADO_Reader.Item('tp_imput_aux'));

                if datFecha <> 0D then begin

                    if Format(datFecha) <> strField2 then begin

                        Clear(rstConfCont);
                        rstConfCont.Get();
                        if (Abs(decTotalxFecha) <> 0) and (Abs(decTotalxFecha) <= 1) then begin

                            //fntGenerarLineaDiario(rstConfCont.CuentaRedondeo,-decTotalxFecha,'',FORMAT(datFecha));
                            decTotalxFecha := 0;

                        end;

                    end;

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;

                decImporte := 0;
                strField5 := '2113020';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);

                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;



            end;

        end;

        windows.Close;
    end;

    [Scope('OnPrem')]
    procedure fntSincronizarSindicatoAPagarSOM(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strInicioSic: Text[30];
        strFinalSic: Text[30];
        datFechaVariable: Date;
        strVariable: Text[1024];
        intInteger: Integer;
        decDecimal: Decimal;
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');

        windows.Update(0, 'Sindicatos SOM');

        strInicio := Format(datInicio, 0, '<Year4><Month,2><Day,2>');
        strFinal := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        if Evaluate(intInicio, strInicio) then;
        if Evaluate(intFinal, strFinal) then;
        strInicioSic := Format(datInicio, 0, '<Year4><Month,2><Day,2>');//'2015/06/01';
        strFinalSic := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        filtString1 := '';
        filtString2 := '';
        filtString3 := '';

        filtString1 := 'select a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa, a.fec_imputacion,a.tp_imput,d.tp_imput_aux,d.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,' +
                       'g.id_nacion,a.FECHA_SICORE_ST,' +
                       'sum(CTA_SIN_A_PAG) cta_2113012 ' +
                       'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                       'm4t_acumulado_rl3 d, m4_categorias e,m4_puestos_trabajo f,m4_empleados g ';

        filtString2 := 'where a.id_sociedad = b.id_sociedad ' +
                       'and a.id_empleado = b.id_empleado ' +
                       'and a.fec_alta_empleado = b.fec_alta_empleado ' +
                       'and a.fec_pago = b.fec_pago ' +
                       'and a.fec_imputacion = b.fec_imputacion ' +
                       'and a.tp_imput <> 4 ' +
                       'and a.id_sociedad = c.id_sociedad ' +
                       'and a.id_empleado = c.id_empleado ' +
                       'and a.fec_imputacion = c.fec_imputacion ' +
                       'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.ID_CONVENIO <> ''FE'' ' +
                       'and a.id_sociedad = d.id_sociedad ' +
                       'and a.id_empleado = d.id_empleado ' +
                       'and a.fec_imputacion = d.fec_imputacion ' +
                       'and a.fec_alta_empleado = d.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_cto_cost_nav <> ''NULL'' ';

        if blnSicore then begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''SOM'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';

        end
        else begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''SOM'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';


        end;

        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);

        aADO_Con.Open;
        //aADO_Comm := aADO_Con.OracleConnection;

        aADO_Comm := aADO_Comm.OracleCommand(filtString1 + filtString2 + filtString3, aADO_Con);

        aADO_Reader := aADO_Comm.ExecuteReader;

        while aADO_Reader.Read() do begin



            begin

                if blnVentana then begin

                    windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));
                    windows.Update(2, aADO_Reader.Item('FEC_IMPUTACION'));
                    windows.Update(3, aADO_Reader.Item('ID_EMPRESA'));
                    windows.Update(4, aADO_Reader.Item('ID_CTO_COST_NAV'));

                end;
                strField1 := Format(aADO_Reader.Item('ID_EMPLEADO'));
                strField2 := Format(aADO_Reader.Item('FECHA_SICORE_ST'));
                strField3 := Format(aADO_Reader.Item('ID_EMPRESA'));
                strField4 := Format(aADO_Reader.Item('ID_CTO_COST_NAV'));

                strField7 := Format(aADO_Reader.Item('fec_imputacion'));

                //IF EVALUATE(intInteger,aADO_Reader.Item('TP_IMPUT')) THEN
                strField8 := Format(aADO_Reader.Item('TP_IMPUT'));
                strField9 := Format(aADO_Reader.Item('id_categoria'));
                strField10 := Format(aADO_Reader.Item('id_puesto'));
                strField11 := Format(aADO_Reader.Item('n_categoria'));
                strField12 := Format(aADO_Reader.Item('n_puesto'));
                strField13 := Format(aADO_Reader.Item('id_sociedad'));
                strField14 := Format(aADO_Reader.Item('FEC_IMPUTACION'));
                strField15 := Format(aADO_Reader.Item('id_nacion'));
                strField17 := Format(aADO_Reader.Item('tp_imput_aux'));

                if datFecha <> 0D then begin

                    if Format(datFecha) <> strField2 then begin

                        Clear(rstConfCont);
                        rstConfCont.Get();
                        if (Abs(decTotalxFecha) <> 0) and (Abs(decTotalxFecha) <= 1) then begin

                            //fntGenerarLineaDiario(rstConfCont.CuentaRedondeo,-decTotalxFecha,'',FORMAT(datFecha));
                            decTotalxFecha := 0;

                        end;

                    end;

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;

                decImporte := 0;
                strField5 := '2113012';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;



            end;

        end;

        windows.Close;
    end;

    [Scope('OnPrem')]
    procedure fntSincronizarSindicatoAPagarSSI(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strInicioSic: Text[30];
        strFinalSic: Text[30];
        datFechaVariable: Date;
        strVariable: Text[1024];
        intInteger: Integer;
        decDecimal: Decimal;
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');

        windows.Update(0, 'Sindicatos SSI');

        strInicio := Format(datInicio, 0, '<Year4><Month,2><Day,2>');
        strFinal := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        if Evaluate(intInicio, strInicio) then;
        if Evaluate(intFinal, strFinal) then;
        strInicioSic := Format(datInicio, 0, '<Year4><Month,2><Day,2>');//'2015/06/01';
        strFinalSic := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        filtString1 := '';
        filtString2 := '';
        filtString3 := '';

        filtString1 := 'select a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa, a.fec_imputacion,a.tp_imput,d.tp_imput_aux,d.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,' +
                       'g.id_nacion,a.FECHA_SICORE_ST,' +
                       'sum(CTA_SIN_A_PAG) cta_2113003 ' +
                       'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                       'm4t_acumulado_rl3 d, m4_categorias e,m4_puestos_trabajo f,m4_empleados g ';

        filtString2 := 'where a.id_sociedad = b.id_sociedad ' +
                       'and a.id_empleado = b.id_empleado ' +
                       'and a.fec_alta_empleado = b.fec_alta_empleado ' +
                       'and a.fec_pago = b.fec_pago ' +
                       'and a.fec_imputacion = b.fec_imputacion ' +
                       'and a.tp_imput <> 4 ' +
                       'and a.id_sociedad = c.id_sociedad ' +
                       'and a.id_empleado = c.id_empleado ' +
                       'and a.ID_CONVENIO <> ''FE'' ' +
                       'and a.fec_imputacion = c.fec_imputacion ' +
                       'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_sociedad = d.id_sociedad ' +
                       'and a.id_empleado = d.id_empleado ' +
                       'and a.fec_imputacion = d.fec_imputacion ' +
                       'and a.fec_alta_empleado = d.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_cto_cost_nav <> ''NULL'' ';

        if blnSicore then begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''SSI'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';

        end
        else begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''SSI'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';


        end;

        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);

        aADO_Con.Open;
        //aADO_Comm := aADO_Con.OracleConnection;

        aADO_Comm := aADO_Comm.OracleCommand(filtString1 + filtString2 + filtString3, aADO_Con);

        aADO_Reader := aADO_Comm.ExecuteReader;

        while aADO_Reader.Read() do begin



            begin

                if blnVentana then begin

                    windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));
                    windows.Update(2, aADO_Reader.Item('FEC_IMPUTACION'));
                    windows.Update(3, aADO_Reader.Item('ID_EMPRESA'));
                    windows.Update(4, aADO_Reader.Item('ID_CTO_COST_NAV'));

                end;
                strField1 := Format(aADO_Reader.Item('ID_EMPLEADO'));
                strField2 := Format(aADO_Reader.Item('FECHA_SICORE_ST'));
                strField3 := Format(aADO_Reader.Item('ID_EMPRESA'));
                strField4 := Format(aADO_Reader.Item('ID_CTO_COST_NAV'));

                strField7 := Format(aADO_Reader.Item('fec_imputacion'));

                //IF EVALUATE(intInteger,aADO_Reader.Item('TP_IMPUT')) THEN
                strField8 := Format(aADO_Reader.Item('TP_IMPUT'));
                strField9 := Format(aADO_Reader.Item('id_categoria'));
                strField10 := Format(aADO_Reader.Item('id_puesto'));
                strField11 := Format(aADO_Reader.Item('n_categoria'));
                strField12 := Format(aADO_Reader.Item('n_puesto'));
                strField13 := Format(aADO_Reader.Item('id_sociedad'));
                strField14 := Format(aADO_Reader.Item('FEC_IMPUTACION'));
                strField15 := Format(aADO_Reader.Item('id_nacion'));
                strField17 := Format(aADO_Reader.Item('tp_imput_aux'));

                if datFecha <> 0D then begin

                    if Format(datFecha) <> strField2 then begin

                        Clear(rstConfCont);
                        rstConfCont.Get();
                        if (Abs(decTotalxFecha) <> 0) and (Abs(decTotalxFecha) <= 1) then begin

                            //fntGenerarLineaDiario(rstConfCont.CuentaRedondeo,-decTotalxFecha,'',FORMAT(datFecha));
                            decTotalxFecha := 0;

                        end;

                    end;

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;

                decImporte := 0;
                strField5 := '2113003';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;



            end;

        end;

        windows.Close;
    end;

    [Scope('OnPrem')]
    procedure fntSincronizarSindicatoAPagarUOM(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strInicioSic: Text[30];
        strFinalSic: Text[30];
        datFechaVariable: Date;
        strVariable: Text[1024];
        intInteger: Integer;
        decDecimal: Decimal;
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');

        windows.Update(0, 'Sindicatos UOM');

        strInicio := Format(datInicio, 0, '<Year4><Month,2><Day,2>');
        strFinal := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        if Evaluate(intInicio, strInicio) then;
        if Evaluate(intFinal, strFinal) then;
        strInicioSic := Format(datInicio, 0, '<Year4><Month,2><Day,2>');//'2015/06/01';
        strFinalSic := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        filtString1 := '';
        filtString2 := '';
        filtString3 := '';

        filtString1 := 'select a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa, a.fec_imputacion,a.tp_imput,d.tp_imput_aux,d.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,' +
                       'g.id_nacion,a.FECHA_SICORE_ST,' +
                       'sum(CTA_SIN_A_PAG) cta_2113003 ' +
                       'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                       'm4t_acumulado_rl3 d, m4_categorias e,m4_puestos_trabajo f,m4_empleados g ';

        filtString2 := 'where a.id_sociedad = b.id_sociedad ' +
                       'and a.id_empleado = b.id_empleado ' +
                       'and a.fec_alta_empleado = b.fec_alta_empleado ' +
                       'and a.fec_pago = b.fec_pago ' +
                       'and a.fec_imputacion = b.fec_imputacion ' +
                       'and a.tp_imput <> 4 ' +
                       'and a.id_sociedad = c.id_sociedad ' +
                       'and a.id_empleado = c.id_empleado ' +
                       'and a.fec_imputacion = c.fec_imputacion ' +
                       'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_sociedad = d.id_sociedad ' +
                       'and a.id_empleado = d.id_empleado ' +
                       'and a.ID_CONVENIO <> ''FE'' ' +
                       'and a.fec_imputacion = d.fec_imputacion ' +
                       'and a.fec_alta_empleado = d.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_cto_cost_nav <> ''NULL'' ';

        if blnSicore then begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''UOM'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';

        end
        else begin


            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''UOM'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';

        end;

        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);

        aADO_Con.Open;
        //aADO_Comm := aADO_Con.OracleConnection;

        aADO_Comm := aADO_Comm.OracleCommand(filtString1 + filtString2 + filtString3, aADO_Con);

        aADO_Reader := aADO_Comm.ExecuteReader;

        while aADO_Reader.Read() do begin



            begin

                if blnVentana then begin

                    windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));
                    windows.Update(2, aADO_Reader.Item('FEC_IMPUTACION'));
                    windows.Update(3, aADO_Reader.Item('ID_EMPRESA'));
                    windows.Update(4, aADO_Reader.Item('ID_CTO_COST_NAV'));

                end;
                strField1 := Format(aADO_Reader.Item('ID_EMPLEADO'));
                strField2 := Format(aADO_Reader.Item('FECHA_SICORE_ST'));
                strField3 := Format(aADO_Reader.Item('ID_EMPRESA'));
                strField4 := Format(aADO_Reader.Item('ID_CTO_COST_NAV'));

                strField7 := Format(aADO_Reader.Item('fec_imputacion'));

                //IF EVALUATE(intInteger,aADO_Reader.Item('TP_IMPUT')) THEN
                strField8 := Format(aADO_Reader.Item('TP_IMPUT'));
                strField9 := Format(aADO_Reader.Item('id_categoria'));
                strField10 := Format(aADO_Reader.Item('id_puesto'));
                strField11 := Format(aADO_Reader.Item('n_categoria'));
                strField12 := Format(aADO_Reader.Item('n_puesto'));
                strField13 := Format(aADO_Reader.Item('id_sociedad'));
                strField14 := Format(aADO_Reader.Item('FEC_IMPUTACION'));
                strField15 := Format(aADO_Reader.Item('id_nacion'));
                strField17 := Format(aADO_Reader.Item('tp_imput_aux'));

                if datFecha <> 0D then begin

                    if Format(datFecha) <> strField2 then begin

                        Clear(rstConfCont);
                        rstConfCont.Get();
                        if (Abs(decTotalxFecha) <> 0) and (Abs(decTotalxFecha) <= 1) then begin

                            //fntGenerarLineaDiario(rstConfCont.CuentaRedondeo,-decTotalxFecha,'',FORMAT(datFecha));
                            decTotalxFecha := 0;

                        end;

                    end;

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;

                decImporte := 0;
                strField5 := '2113003';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;


            end;

        end;

        windows.Close;
    end;

    [Scope('OnPrem')]
    procedure fntSincronizarSindicatoAPagarMaqEsp(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strInicioSic: Text[30];
        strFinalSic: Text[30];
        datFechaVariable: Date;
        strVariable: Text[1024];
        intInteger: Integer;
        decDecimal: Decimal;
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');

        windows.Update(0, 'Sindicatos Maquinistas españoles');

        strInicio := Format(datInicio, 0, '<Year4><Month,2><Day,2>');
        strFinal := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        if Evaluate(intInicio, strInicio) then;
        if Evaluate(intFinal, strFinal) then;
        strInicioSic := Format(datInicio, 0, '<Year4><Month,2><Day,2>');//'2015/06/01';
        strFinalSic := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        //--ESP

        filtString1 := '';
        filtString2 := '';
        filtString3 := '';

        filtString1 := 'select a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa, a.fec_imputacion,a.tp_imput,d.tp_imput_aux,d.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,' +
                       'g.id_nacion,a.FECHA_SICORE_ST,' +
                       'sum(CTA_SIN_A_PAG) cta_2113003 ' +
                       'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                       'm4t_acumulado_rl3 d, m4_categorias e,m4_puestos_trabajo f,m4_empleados g ';

        filtString2 := 'where a.id_sociedad = b.id_sociedad ' +
                       'and a.id_empleado = b.id_empleado ' +
                       'and a.fec_alta_empleado = b.fec_alta_empleado ' +
                       'and a.fec_pago = b.fec_pago ' +
                       'and a.fec_imputacion = b.fec_imputacion ' +
                       'and a.tp_imput <> 4 ' +
                       'and a.id_sociedad = c.id_sociedad ' +
                       'and a.id_empleado = c.id_empleado ' +
                       'and a.fec_imputacion = c.fec_imputacion ' +
                       'and a.ID_CONVENIO = ''FE'' ' +
                       'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_sociedad = d.id_sociedad ' +
                       'and a.id_empleado = d.id_empleado ' +
                       'and a.fec_imputacion = d.fec_imputacion ' +
                       'and a.fec_alta_empleado = d.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_cto_cost_nav <> ''NULL'' ';

        if blnSicore then begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''MAQ'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';

        end
        else begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''MAQ'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';

        end;

        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);

        aADO_Con.Open;
        //aADO_Comm := aADO_Con.OracleConnection;
        aADO_Comm := aADO_Comm.OracleCommand(filtString1 + filtString2 + filtString3, aADO_Con);
        aADO_Reader := aADO_Comm.ExecuteReader;

        while aADO_Reader.Read() do begin

            begin

                if blnVentana then begin

                    windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));
                    windows.Update(2, aADO_Reader.Item('FEC_IMPUTACION'));
                    windows.Update(3, aADO_Reader.Item('ID_EMPRESA'));
                    windows.Update(4, aADO_Reader.Item('ID_CTO_COST_NAV'));

                end;
                strField1 := Format(aADO_Reader.Item('ID_EMPLEADO'));
                strField2 := Format(aADO_Reader.Item('FECHA_SICORE_ST'));
                strField3 := Format(aADO_Reader.Item('ID_EMPRESA'));
                strField4 := Format(aADO_Reader.Item('ID_CTO_COST_NAV'));

                strField7 := Format(aADO_Reader.Item('fec_imputacion'));

                //IF EVALUATE(intInteger,aADO_Reader.Item('TP_IMPUT')) THEN
                strField8 := Format(aADO_Reader.Item('TP_IMPUT'));

                strField9 := Format(aADO_Reader.Item('id_categoria'));
                strField10 := Format(aADO_Reader.Item('id_puesto'));
                strField11 := Format(aADO_Reader.Item('n_categoria'));
                strField12 := Format(aADO_Reader.Item('n_puesto'));
                strField13 := Format(aADO_Reader.Item('id_sociedad'));
                strField14 := Format(aADO_Reader.Item('FEC_IMPUTACION'));
                strField15 := Format(aADO_Reader.Item('id_nacion'));
                strField17 := Format(aADO_Reader.Item('tp_imput_aux'));

                if datFecha <> 0D then begin

                    if Format(datFecha) <> strField2 then begin

                        Clear(rstConfCont);
                        rstConfCont.Get();
                        if (Abs(decTotalxFecha) <> 0) and (Abs(decTotalxFecha) <= 1) then begin

                            //fntGenerarLineaDiario(rstConfCont.CuentaRedondeo,-decTotalxFecha,'',FORMAT(datFecha));
                            decTotalxFecha := 0;

                        end;

                    end;

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;

                decImporte := 0;
                strField5 := '2113003';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;



            end;

        end;

        windows.Close;
    end;

    [Scope('OnPrem')]
    procedure fntSincronizarSindicatoAPagarCapEsp(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strInicioSic: Text[30];
        strFinalSic: Text[30];
        datFechaVariable: Date;
        strVariable: Text[1024];
        intInteger: Integer;
        decDecimal: Decimal;
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');

        windows.Update(0, 'Sindicatos capitanes españoles');

        strInicio := Format(datInicio, 0, '<Year4><Month,2><Day,2>');
        strFinal := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        if Evaluate(intInicio, strInicio) then;
        if Evaluate(intFinal, strFinal) then;
        strInicioSic := Format(datInicio, 0, '<Year4><Month,2><Day,2>');//'2015/06/01';
        strFinalSic := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        //--ESP

        filtString1 := '';
        filtString2 := '';
        filtString3 := '';

        filtString1 := 'select a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa, a.fec_imputacion,a.tp_imput,d.tp_imput_aux,d.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,' +
                       'g.id_nacion,a.FECHA_SICORE_ST,' +
                       'sum(CTA_SIN_A_PAG) cta_2113008 ' +
                       'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                       'm4t_acumulado_rl3 d, m4_categorias e,m4_puestos_trabajo f,m4_empleados g ';

        filtString2 := 'where a.id_sociedad = b.id_sociedad ' +
                       'and a.id_empleado = b.id_empleado ' +
                       'and a.fec_alta_empleado = b.fec_alta_empleado ' +
                       'and a.fec_pago = b.fec_pago ' +
                       'and a.fec_imputacion = b.fec_imputacion ' +
                       'and a.ID_CONVENIO = ''FE'' ' +
                       'and a.tp_imput <> 4 ' +
                       'and a.id_sociedad = c.id_sociedad ' +
                       'and a.id_empleado = c.id_empleado ' +
                       'and a.fec_imputacion = c.fec_imputacion ' +
                       'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_sociedad = d.id_sociedad ' +
                       'and a.id_empleado = d.id_empleado ' +
                       'and a.fec_imputacion = d.fec_imputacion ' +
                       'and a.fec_alta_empleado = d.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_cto_cost_nav <> ''NULL'' ';

        if blnSicore then begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''CAP'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';

        end
        else begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''CAP'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';


        end;

        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);

        aADO_Con.Open;
        //aADO_Comm := aADO_Con.OracleConnection;
        aADO_Comm := aADO_Comm.OracleCommand(filtString1 + filtString2 + filtString3, aADO_Con);

        aADO_Reader := aADO_Comm.ExecuteReader;

        while aADO_Reader.Read() do begin


            begin

                if blnVentana then begin

                    windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));
                    windows.Update(2, aADO_Reader.Item('FEC_IMPUTACION'));
                    windows.Update(3, aADO_Reader.Item('ID_EMPRESA'));
                    windows.Update(4, aADO_Reader.Item('ID_CTO_COST_NAV'));

                end;
                strField1 := Format(aADO_Reader.Item('ID_EMPLEADO'));
                strField2 := Format(aADO_Reader.Item('FECHA_SICORE_ST'));
                strField3 := Format(aADO_Reader.Item('ID_EMPRESA'));
                strField4 := Format(aADO_Reader.Item('ID_CTO_COST_NAV'));

                strField7 := Format(aADO_Reader.Item('fec_imputacion'));

                //IF EVALUATE(intInteger,aADO_Reader.Item('TP_IMPUT')) THEN
                strField8 := Format(aADO_Reader.Item('TP_IMPUT'));

                strField9 := Format(aADO_Reader.Item('id_categoria'));
                strField10 := Format(aADO_Reader.Item('id_puesto'));
                strField11 := Format(aADO_Reader.Item('n_categoria'));
                strField12 := Format(aADO_Reader.Item('n_puesto'));
                strField13 := Format(aADO_Reader.Item('id_sociedad'));
                strField14 := Format(aADO_Reader.Item('FEC_IMPUTACION'));
                strField15 := Format(aADO_Reader.Item('id_nacion'));
                strField17 := Format(aADO_Reader.Item('tp_imput_aux'));

                if datFecha <> 0D then begin

                    if Format(datFecha) <> strField2 then begin

                        Clear(rstConfCont);
                        rstConfCont.Get();
                        if (Abs(decTotalxFecha) <> 0) and (Abs(decTotalxFecha) <= 1) then begin

                            //fntGenerarLineaDiario(rstConfCont.CuentaRedondeo,-decTotalxFecha,'',FORMAT(datFecha));
                            decTotalxFecha := 0;

                        end;

                    end;

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;

                decImporte := 0;
                strField5 := '2113008';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;



            end;

        end;


        windows.Close;
    end;

    [Scope('OnPrem')]
    procedure fntSincronizarSindicatoAPagarFECEsp(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strInicioSic: Text[30];
        strFinalSic: Text[30];
        datFechaVariable: Date;
        strVariable: Text[1024];
        intInteger: Integer;
        decDecimal: Decimal;
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');

        windows.Update(0, 'Sindicatos FEC Españoles');

        strInicio := Format(datInicio, 0, '<Year4><Month,2><Day,2>');
        strFinal := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        if Evaluate(intInicio, strInicio) then;
        if Evaluate(intFinal, strFinal) then;
        strInicioSic := Format(datInicio, 0, '<Year4><Month,2><Day,2>');//'2015/06/01';
        strFinalSic := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        //Agrego nuevo sindicato FEC (Federación Argentina Empleados Comercio)


        //--ESP

        filtString1 := '';
        filtString2 := '';
        filtString3 := '';

        filtString1 := 'select a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa, a.fec_imputacion,a.tp_imput,d.tp_imput_aux,d.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,' +
                       'g.id_nacion,a.FECHA_SICORE_ST,' +
                       'sum(CTA_SIN_A_PAG) cta_2113024 ' +
                       'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                       'm4t_acumulado_rl3 d, m4_categorias e,m4_puestos_trabajo f,m4_empleados g ';

        filtString2 := 'where a.id_sociedad = b.id_sociedad ' +
                       'and a.id_empleado = b.id_empleado ' +
                       'and a.fec_alta_empleado = b.fec_alta_empleado ' +
                       'and a.fec_pago = b.fec_pago ' +
                       'and a.fec_imputacion = b.fec_imputacion ' +
                       'and a.tp_imput <> 4 ' +
                       'and a.id_sociedad = c.id_sociedad ' +
                       'and a.id_empleado = c.id_empleado ' +
                       'and a.fec_imputacion = c.fec_imputacion ' +
                       'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_sociedad = d.id_sociedad ' +
                       'and a.ID_CONVENIO = ''FE'' ' +
                       'and a.id_empleado = d.id_empleado ' +
                       'and a.fec_imputacion = d.fec_imputacion ' +
                       'and a.fec_alta_empleado = d.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_cto_cost_nav <> ''NULL'' ';

        if blnSicore then begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''FEC'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';

        end
        else begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''FEC'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';


        end;

        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);

        aADO_Con.Open;
        //aADO_Comm := aADO_Con.OracleConnection;

        aADO_Comm := aADO_Comm.OracleCommand(filtString1 + filtString2 + filtString3, aADO_Con);

        aADO_Reader := aADO_Comm.ExecuteReader;

        while aADO_Reader.Read() do begin


            begin

                if blnVentana then begin

                    windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));
                    windows.Update(2, aADO_Reader.Item('FEC_IMPUTACION'));
                    windows.Update(3, aADO_Reader.Item('ID_EMPRESA'));
                    windows.Update(4, aADO_Reader.Item('ID_CTO_COST_NAV'));

                end;
                strField1 := Format(aADO_Reader.Item('ID_EMPLEADO'));
                strField2 := Format(aADO_Reader.Item('FECHA_SICORE_ST'));
                strField3 := Format(aADO_Reader.Item('ID_EMPRESA'));
                strField4 := Format(aADO_Reader.Item('ID_CTO_COST_NAV'));

                strField7 := Format(aADO_Reader.Item('fec_imputacion'));

                //IF EVALUATE(intInteger,aADO_Reader.Item('TP_IMPUT')) THEN
                strField8 := Format(aADO_Reader.Item('TP_IMPUT'));

                strField9 := Format(aADO_Reader.Item('id_categoria'));
                strField10 := Format(aADO_Reader.Item('id_puesto'));
                strField11 := Format(aADO_Reader.Item('n_categoria'));
                strField12 := Format(aADO_Reader.Item('n_puesto'));
                strField13 := Format(aADO_Reader.Item('id_sociedad'));
                strField14 := Format(aADO_Reader.Item('FEC_IMPUTACION'));
                strField15 := Format(aADO_Reader.Item('id_nacion'));
                strField17 := Format(aADO_Reader.Item('tp_imput_aux'));

                if datFecha <> 0D then begin

                    if Format(datFecha) <> strField2 then begin

                        Clear(rstConfCont);
                        rstConfCont.Get();
                        if (Abs(decTotalxFecha) <> 0) and (Abs(decTotalxFecha) <= 1) then begin

                            //fntGenerarLineaDiario(rstConfCont.CuentaRedondeo,-decTotalxFecha,'',FORMAT(datFecha));
                            decTotalxFecha := 0;

                        end;

                    end;

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;

                decImporte := 0;
                strField5 := '2113024';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;



            end;

        end;

        //--ESP
        windows.Close;
    end;

    [Scope('OnPrem')]
    procedure fntSincronizarSindicatoAPagarASOEsp(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strInicioSic: Text[30];
        strFinalSic: Text[30];
        datFechaVariable: Date;
        strVariable: Text[1024];
        intInteger: Integer;
        decDecimal: Decimal;
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');

        windows.Update(0, 'Sindicatos ASO españoles');

        strInicio := Format(datInicio, 0, '<Year4><Month,2><Day,2>');
        strFinal := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        if Evaluate(intInicio, strInicio) then;
        if Evaluate(intFinal, strFinal) then;
        strInicioSic := Format(datInicio, 0, '<Year4><Month,2><Day,2>');//'2015/06/01';
        strFinalSic := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        filtString1 := '';
        filtString2 := '';
        filtString3 := '';

        filtString1 := 'select a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa, a.fec_imputacion,a.tp_imput,d.tp_imput_aux,d.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,' +
                       'g.id_nacion,a.FECHA_SICORE_ST,' +
                       'sum(CTA_SIN_A_PAG) cta_2113010 ' +
                       'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                       'm4t_acumulado_rl3 d, m4_categorias e,m4_puestos_trabajo f,m4_empleados g ';

        filtString2 := 'where a.id_sociedad = b.id_sociedad ' +
                       'and a.id_empleado = b.id_empleado ' +
                       'and a.fec_alta_empleado = b.fec_alta_empleado ' +
                       'and a.fec_pago = b.fec_pago ' +
                       'and a.fec_imputacion = b.fec_imputacion ' +
                       'and a.tp_imput <> 4 ' +
                       'and a.id_sociedad = c.id_sociedad ' +
                       'and a.id_empleado = c.id_empleado ' +
                       'and a.fec_imputacion = c.fec_imputacion ' +
                       'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                       'and a.ID_CONVENIO = ''FE'' ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_sociedad = d.id_sociedad ' +
                       'and a.id_empleado = d.id_empleado ' +
                       'and a.fec_imputacion = d.fec_imputacion ' +
                       'and a.fec_alta_empleado = d.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_cto_cost_nav <> ''NULL'' ';

        if blnSicore then begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''ASO'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';

        end
        else begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''ASO'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';

        end;

        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);

        aADO_Con.Open;
        //aADO_Comm := aADO_Con.OracleConnection;

        aADO_Comm := aADO_Comm.OracleCommand(filtString1 + filtString2 + filtString3, aADO_Con);

        aADO_Reader := aADO_Comm.ExecuteReader;

        while aADO_Reader.Read() do begin



            begin

                if blnVentana then begin

                    windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));
                    windows.Update(2, aADO_Reader.Item('FEC_IMPUTACION'));
                    windows.Update(3, aADO_Reader.Item('ID_EMPRESA'));
                    windows.Update(4, aADO_Reader.Item('ID_CTO_COST_NAV'));

                end;

                strField1 := Format(aADO_Reader.Item('ID_EMPLEADO'));
                strField2 := Format(aADO_Reader.Item('FECHA_SICORE_ST'));
                strField3 := Format(aADO_Reader.Item('ID_EMPRESA'));
                strField4 := Format(aADO_Reader.Item('ID_CTO_COST_NAV'));

                strField7 := Format(aADO_Reader.Item('fec_imputacion'));

                //IF EVALUATE(intInteger,aADO_Reader.Item('TP_IMPUT')) THEN
                strField8 := Format(aADO_Reader.Item('TP_IMPUT'));
                strField9 := Format(aADO_Reader.Item('id_categoria'));
                strField10 := Format(aADO_Reader.Item('id_puesto'));
                strField11 := Format(aADO_Reader.Item('n_categoria'));
                strField12 := Format(aADO_Reader.Item('n_puesto'));
                strField13 := Format(aADO_Reader.Item('id_sociedad'));
                strField14 := Format(aADO_Reader.Item('FEC_IMPUTACION'));
                strField15 := Format(aADO_Reader.Item('id_nacion'));
                strField17 := Format(aADO_Reader.Item('tp_imput_aux'));

                if datFecha <> 0D then begin

                    if Format(datFecha) <> strField2 then begin

                        Clear(rstConfCont);
                        rstConfCont.Get();
                        if (Abs(decTotalxFecha) <> 0) and (Abs(decTotalxFecha) <= 1) then begin

                            //fntGenerarLineaDiario(rstConfCont.CuentaRedondeo,-decTotalxFecha,'',FORMAT(datFecha));
                            decTotalxFecha := 0;

                        end;

                    end;

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;

                decImporte := 0;
                strField5 := '2113010';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;



            end;

        end;


        windows.Close;
    end;

    [Scope('OnPrem')]
    procedure fntSincronizarSindicatoAPagarCONEsp(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strInicioSic: Text[30];
        strFinalSic: Text[30];
        datFechaVariable: Date;
        strVariable: Text[1024];
        intInteger: Integer;
        decDecimal: Decimal;
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');

        windows.Update(0, 'Sindicatos CON españoles');

        strInicio := Format(datInicio, 0, '<Year4><Month,2><Day,2>');
        strFinal := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        if Evaluate(intInicio, strInicio) then;
        if Evaluate(intFinal, strFinal) then;
        strInicioSic := Format(datInicio, 0, '<Year4><Month,2><Day,2>');//'2015/06/01';
        strFinalSic := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        filtString1 := '';
        filtString2 := '';
        filtString3 := '';

        filtString1 := 'select a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa, a.fec_imputacion,a.tp_imput,d.tp_imput_aux,d.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,' +
                       'g.id_nacion,a.FECHA_SICORE_ST,' +
                       'sum(CTA_SIN_A_PAG) cta_2113011 ' +
                       'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                       'm4t_acumulado_rl3 d, m4_categorias e,m4_puestos_trabajo f,m4_empleados g ';

        filtString2 := 'where a.id_sociedad = b.id_sociedad ' +
                       'and a.id_empleado = b.id_empleado ' +
                       'and a.fec_alta_empleado = b.fec_alta_empleado ' +
                       'and a.fec_pago = b.fec_pago ' +
                       'and a.fec_imputacion = b.fec_imputacion ' +
                       'and a.tp_imput <> 4 ' +
                       'and a.id_sociedad = c.id_sociedad ' +
                       'and a.id_empleado = c.id_empleado ' +
                       'and a.ID_CONVENIO = ''FE'' ' +
                       'and a.fec_imputacion = c.fec_imputacion ' +
                       'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_sociedad = d.id_sociedad ' +
                       'and a.id_empleado = d.id_empleado ' +
                       'and a.fec_imputacion = d.fec_imputacion ' +
                       'and a.fec_alta_empleado = d.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_cto_cost_nav <> ''NULL'' ';

        if blnSicore then begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''CON'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';



        end
        else begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''CON'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';

        end;

        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);

        aADO_Con.Open;
        //aADO_Comm := aADO_Con.OracleConnection;

        aADO_Comm := aADO_Comm.OracleCommand(filtString1 + filtString2 + filtString3, aADO_Con);

        aADO_Reader := aADO_Comm.ExecuteReader;


        while aADO_Reader.Read() do begin



            begin

                if blnVentana then begin

                    windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));
                    windows.Update(2, aADO_Reader.Item('FEC_IMPUTACION'));
                    windows.Update(3, aADO_Reader.Item('ID_EMPRESA'));
                    windows.Update(4, aADO_Reader.Item('ID_CTO_COST_NAV'));

                end;

                strField1 := Format(aADO_Reader.Item('ID_EMPLEADO'));
                strField2 := Format(aADO_Reader.Item('FECHA_SICORE_ST'));
                strField3 := Format(aADO_Reader.Item('ID_EMPRESA'));
                strField4 := Format(aADO_Reader.Item('ID_CTO_COST_NAV'));

                strField7 := Format(aADO_Reader.Item('fec_imputacion'));

                //IF EVALUATE(intInteger,aADO_Reader.Item('TP_IMPUT')) THEN
                strField8 := Format(aADO_Reader.Item('TP_IMPUT'));
                strField9 := Format(aADO_Reader.Item('id_categoria'));
                strField10 := Format(aADO_Reader.Item('id_puesto'));
                strField11 := Format(aADO_Reader.Item('n_categoria'));
                strField12 := Format(aADO_Reader.Item('n_puesto'));
                strField13 := Format(aADO_Reader.Item('id_sociedad'));
                strField14 := Format(aADO_Reader.Item('FEC_IMPUTACION'));
                strField15 := Format(aADO_Reader.Item('id_nacion'));
                strField17 := Format(aADO_Reader.Item('tp_imput_aux'));

                if datFecha <> 0D then begin

                    if Format(datFecha) <> strField2 then begin

                        Clear(rstConfCont);
                        rstConfCont.Get();
                        if (Abs(decTotalxFecha) <> 0) and (Abs(decTotalxFecha) <= 1) then begin

                            //fntGenerarLineaDiario(rstConfCont.CuentaRedondeo,-decTotalxFecha,'',FORMAT(datFecha));
                            decTotalxFecha := 0;

                        end;

                    end;

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;

                decImporte := 0;
                strField5 := '2113011';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;



            end;

        end;

        windows.Close;
    end;

    [Scope('OnPrem')]
    procedure fntSincronizarSindicatoAPagarPATEsp(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strInicioSic: Text[30];
        strFinalSic: Text[30];
        datFechaVariable: Date;
        strVariable: Text[1024];
        intInteger: Integer;
        decDecimal: Decimal;
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');

        windows.Update(0, 'Sindicatos PAT españoles');

        strInicio := Format(datInicio, 0, '<Year4><Month,2><Day,2>');
        strFinal := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        if Evaluate(intInicio, strInicio) then;
        if Evaluate(intFinal, strFinal) then;
        strInicioSic := Format(datInicio, 0, '<Year4><Month,2><Day,2>');//'2015/06/01';
        strFinalSic := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        filtString1 := '';
        filtString2 := '';
        filtString3 := '';

        filtString1 := 'select a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa, a.fec_imputacion,a.tp_imput,d.tp_imput_aux,d.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,' +
                       'g.id_nacion,a.FECHA_SICORE_ST,' +
                       'sum(CTA_SIN_A_PAG) cta_2113009 ' +
                       'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                       'm4t_acumulado_rl3 d, m4_categorias e,m4_puestos_trabajo f,m4_empleados g ';

        filtString2 := 'where a.id_sociedad = b.id_sociedad ' +
                       'and a.id_empleado = b.id_empleado ' +
                       'and a.fec_alta_empleado = b.fec_alta_empleado ' +
                       'and a.fec_pago = b.fec_pago ' +
                       'and a.fec_imputacion = b.fec_imputacion ' +
                       'and a.tp_imput <> 4 ' +
                       'and a.id_sociedad = c.id_sociedad ' +
                       'and a.id_empleado = c.id_empleado ' +
                       'and a.fec_imputacion = c.fec_imputacion ' +
                       'and a.ID_CONVENIO = ''FE'' ' +
                       'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_sociedad = d.id_sociedad ' +
                       'and a.id_empleado = d.id_empleado ' +
                       'and a.fec_imputacion = d.fec_imputacion ' +
                       'and a.fec_alta_empleado = d.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_cto_cost_nav <> ''NULL'' ';

        if blnSicore then begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''PAT'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';

        end
        else begin

            filtString3 :=
                           'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                           'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                           'and d.id_categoria = e.id_categoria ' +
                           'and d.id_puesto = f.id_puesto ' +
                           'and g.id_empleado = a.id_empleado ' +
                           'and c.ID_SINDICATO = ''PAT'' ' +
                           'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                           'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                           'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                           'a.id_empleado';


        end;

        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);

        aADO_Con.Open;
        //aADO_Comm := aADO_Con.OracleConnection;

        aADO_Comm := aADO_Comm.OracleCommand(filtString1 + filtString2 + filtString3, aADO_Con);

        aADO_Reader := aADO_Comm.ExecuteReader;

        while aADO_Reader.Read() do begin



            begin

                if blnVentana then begin

                    windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));
                    windows.Update(2, aADO_Reader.Item('FEC_IMPUTACION'));
                    windows.Update(3, aADO_Reader.Item('ID_EMPRESA'));
                    windows.Update(4, aADO_Reader.Item('ID_CTO_COST_NAV'));

                end;
                strField1 := Format(aADO_Reader.Item('ID_EMPLEADO'));
                strField2 := Format(aADO_Reader.Item('FECHA_SICORE_ST'));
                strField3 := Format(aADO_Reader.Item('ID_EMPRESA'));
                strField4 := Format(aADO_Reader.Item('ID_CTO_COST_NAV'));

                strField7 := Format(aADO_Reader.Item('fec_imputacion'));

                //IF EVALUATE(intInteger,aADO_Reader.Item('TP_IMPUT')) THEN
                strField8 := Format(aADO_Reader.Item('TP_IMPUT'));
                strField9 := Format(aADO_Reader.Item('id_categoria'));
                strField10 := Format(aADO_Reader.Item('id_puesto'));
                strField11 := Format(aADO_Reader.Item('n_categoria'));
                strField12 := Format(aADO_Reader.Item('n_puesto'));
                strField13 := Format(aADO_Reader.Item('id_sociedad'));
                strField14 := Format(aADO_Reader.Item('FEC_IMPUTACION'));
                strField15 := Format(aADO_Reader.Item('id_nacion'));
                strField17 := Format(aADO_Reader.Item('tp_imput_aux'));

                if datFecha <> 0D then begin

                    if Format(datFecha) <> strField2 then begin

                        Clear(rstConfCont);
                        rstConfCont.Get();
                        if (Abs(decTotalxFecha) <> 0) and (Abs(decTotalxFecha) <= 1) then begin

                            //fntGenerarLineaDiario(rstConfCont.CuentaRedondeo,-decTotalxFecha,'',FORMAT(datFecha));
                            decTotalxFecha := 0;

                        end;

                    end;

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;

                decImporte := 0;
                strField5 := '2113009';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;



            end;

        end;


        windows.Close;
    end;

    [Scope('OnPrem')]
    procedure fntSincronizarSindicatoAPagarSBASTIEsp(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strInicioSic: Text[30];
        strFinalSic: Text[30];
        datFechaVariable: Date;
        strVariable: Text[1024];
        intInteger: Integer;
        decDecimal: Decimal;
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');

        windows.Update(0, 'Sindicatos SBA/STIobvio');

        strInicio := Format(datInicio, 0, '<Year4><Month,2><Day,2>');
        strFinal := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        if Evaluate(intInicio, strInicio) then;
        if Evaluate(intFinal, strFinal) then;
        strInicioSic := Format(datInicio, 0, '<Year4><Month,2><Day,2>');//'2015/06/01';
        strFinalSic := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        filtString1 := '';
        filtString2 := '';
        filtString3 := '';

        filtString1 := 'select a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa, a.fec_imputacion,a.tp_imput,d.tp_imput_aux,d.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,' +
                       'g.id_nacion,a.FECHA_SICORE_ST,' +
                       'sum(CTA_SIN_A_PAG) cta_2113013 ' +
                       'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                       'm4t_acumulado_rl3 d, m4_categorias e,m4_puestos_trabajo f,m4_empleados g ';

        filtString2 := 'where a.id_sociedad = b.id_sociedad ' +
                       'and a.id_empleado = b.id_empleado ' +
                       'and a.fec_alta_empleado = b.fec_alta_empleado ' +
                       'and a.fec_pago = b.fec_pago ' +
                       'and a.fec_imputacion = b.fec_imputacion ' +
                       'and a.tp_imput <> 4 ' +
                       'and a.id_sociedad = c.id_sociedad ' +
                       'and a.id_empleado = c.id_empleado ' +
                       'and a.fec_imputacion = c.fec_imputacion ' +
                       'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.ID_CONVENIO = ''FE'' ' +
                       'and a.id_sociedad = d.id_sociedad ' +
                       'and a.id_empleado = d.id_empleado ' +
                       'and a.fec_imputacion = d.fec_imputacion ' +
                       'and a.fec_alta_empleado = d.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_cto_cost_nav <> ''NULL'' ';

        if blnSicore then begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and (c.ID_SINDICATO = ''SBA'' ' +
                         'or c.id_sindicato = ''STI'') ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';

        end
        else begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and (c.ID_SINDICATO = ''SBA'' ' +
                         'or c.id_sindicato = ''STI'') ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';


        end;

        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);

        aADO_Con.Open;
        //aADO_Comm := aADO_Con.OracleConnection;

        aADO_Comm := aADO_Comm.OracleCommand(filtString1 + filtString2 + filtString3, aADO_Con);

        aADO_Reader := aADO_Comm.ExecuteReader;

        while aADO_Reader.Read() do begin



            begin

                if blnVentana then begin

                    windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));
                    windows.Update(2, aADO_Reader.Item('FEC_IMPUTACION'));
                    windows.Update(3, aADO_Reader.Item('ID_EMPRESA'));
                    windows.Update(4, aADO_Reader.Item('ID_CTO_COST_NAV'));

                end;
                strField1 := Format(aADO_Reader.Item('ID_EMPLEADO'));
                strField2 := Format(aADO_Reader.Item('FECHA_SICORE_ST'));
                strField3 := Format(aADO_Reader.Item('ID_EMPRESA'));
                strField4 := Format(aADO_Reader.Item('ID_CTO_COST_NAV'));

                strField7 := Format(aADO_Reader.Item('fec_imputacion'));

                //IF EVALUATE(intInteger,aADO_Reader.Item('TP_IMPUT')) THEN
                strField8 := Format(aADO_Reader.Item('TP_IMPUT'));
                strField9 := Format(aADO_Reader.Item('id_categoria'));
                strField10 := Format(aADO_Reader.Item('id_puesto'));
                strField11 := Format(aADO_Reader.Item('n_categoria'));
                strField12 := Format(aADO_Reader.Item('n_puesto'));
                strField13 := Format(aADO_Reader.Item('id_sociedad'));
                strField14 := Format(aADO_Reader.Item('FEC_IMPUTACION'));
                strField15 := Format(aADO_Reader.Item('id_nacion'));
                strField17 := Format(aADO_Reader.Item('tp_imput_aux'));

                if datFecha <> 0D then begin

                    if Format(datFecha) <> strField2 then begin

                        Clear(rstConfCont);
                        rstConfCont.Get();
                        if (Abs(decTotalxFecha) <> 0) and (Abs(decTotalxFecha) <= 1) then begin

                            //fntGenerarLineaDiario(rstConfCont.CuentaRedondeo,-decTotalxFecha,'',FORMAT(datFecha));
                            decTotalxFecha := 0;

                        end;

                    end;

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;

                decImporte := 0;
                strField5 := '2113013';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;



            end;

        end;

        windows.Close;
    end;

    [Scope('OnPrem')]
    procedure fntSincronizarSindicatoAPagarSECEsp(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strInicioSic: Text[30];
        strFinalSic: Text[30];
        datFechaVariable: Date;
        strVariable: Text[1024];
        intInteger: Integer;
        decDecimal: Decimal;
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');

        windows.Update(0, 'Sindicatos SEC españoles');

        strInicio := Format(datInicio, 0, '<Year4><Month,2><Day,2>');
        strFinal := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        if Evaluate(intInicio, strInicio) then;
        if Evaluate(intFinal, strFinal) then;
        strInicioSic := Format(datInicio, 0, '<Year4><Month,2><Day,2>');//'2015/06/01';
        strFinalSic := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        filtString1 := '';
        filtString2 := '';
        filtString3 := '';

        filtString1 := 'select a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa, a.fec_imputacion,a.tp_imput,d.tp_imput_aux,d.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,' +
                       'g.id_nacion,a.FECHA_SICORE_ST,' +
                       'sum(CTA_SIN_A_PAG) cta_2113020 ' +
                       'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                       'm4t_acumulado_rl3 d, m4_categorias e,m4_puestos_trabajo f,m4_empleados g ';

        filtString2 := 'where a.id_sociedad = b.id_sociedad ' +
                       'and a.id_empleado = b.id_empleado ' +
                       'and a.fec_alta_empleado = b.fec_alta_empleado ' +
                       'and a.fec_pago = b.fec_pago ' +
                       'and a.fec_imputacion = b.fec_imputacion ' +
                       'and a.tp_imput <> 4 ' +
                       'and a.id_sociedad = c.id_sociedad ' +
                       'and a.id_empleado = c.id_empleado ' +
                       'and a.fec_imputacion = c.fec_imputacion ' +
                       'and a.ID_CONVENIO = ''FE'' ' +
                       'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_sociedad = d.id_sociedad ' +
                       'and a.id_empleado = d.id_empleado ' +
                       'and a.fec_imputacion = d.fec_imputacion ' +
                       'and a.fec_alta_empleado = d.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_cto_cost_nav <> ''NULL'' ';

        if blnSicore then begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''SEC'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';

        end
        else begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''SEC'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';


        end;

        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);

        aADO_Con.Open;
        //aADO_Comm := aADO_Con.OracleConnection;

        aADO_Comm := aADO_Comm.OracleCommand(filtString1 + filtString2 + filtString3, aADO_Con);

        aADO_Reader := aADO_Comm.ExecuteReader;

        while aADO_Reader.Read() do begin



            begin

                if blnVentana then begin

                    windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));
                    windows.Update(2, aADO_Reader.Item('FEC_IMPUTACION'));
                    windows.Update(3, aADO_Reader.Item('ID_EMPRESA'));
                    windows.Update(4, aADO_Reader.Item('ID_CTO_COST_NAV'));

                end;
                strField1 := Format(aADO_Reader.Item('ID_EMPLEADO'));
                strField2 := Format(aADO_Reader.Item('FECHA_SICORE_ST'));
                strField3 := Format(aADO_Reader.Item('ID_EMPRESA'));
                strField4 := Format(aADO_Reader.Item('ID_CTO_COST_NAV'));

                strField7 := Format(aADO_Reader.Item('fec_imputacion'));

                //IF EVALUATE(intInteger,aADO_Reader.Item('TP_IMPUT')) THEN
                strField8 := Format(aADO_Reader.Item('TP_IMPUT'));
                strField9 := Format(aADO_Reader.Item('id_categoria'));
                strField10 := Format(aADO_Reader.Item('id_puesto'));
                strField11 := Format(aADO_Reader.Item('n_categoria'));
                strField12 := Format(aADO_Reader.Item('n_puesto'));
                strField13 := Format(aADO_Reader.Item('id_sociedad'));
                strField14 := Format(aADO_Reader.Item('FEC_IMPUTACION'));
                strField15 := Format(aADO_Reader.Item('id_nacion'));
                strField17 := Format(aADO_Reader.Item('tp_imput_aux'));

                if datFecha <> 0D then begin

                    if Format(datFecha) <> strField2 then begin

                        Clear(rstConfCont);
                        rstConfCont.Get();
                        if (Abs(decTotalxFecha) <> 0) and (Abs(decTotalxFecha) <= 1) then begin

                            //fntGenerarLineaDiario(rstConfCont.CuentaRedondeo,-decTotalxFecha,'',FORMAT(datFecha));
                            decTotalxFecha := 0;

                        end;

                    end;

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;

                decImporte := 0;
                strField5 := '2113020';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);

                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;



            end;

        end;

        windows.Close;
    end;

    [Scope('OnPrem')]
    procedure fntSincronizarSindicatoAPagarSOMEsp(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strInicioSic: Text[30];
        strFinalSic: Text[30];
        datFechaVariable: Date;
        strVariable: Text[1024];
        intInteger: Integer;
        decDecimal: Decimal;
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');

        windows.Update(0, 'Sindicatos SOM españoles');

        strInicio := Format(datInicio, 0, '<Year4><Month,2><Day,2>');
        strFinal := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        if Evaluate(intInicio, strInicio) then;
        if Evaluate(intFinal, strFinal) then;
        strInicioSic := Format(datInicio, 0, '<Year4><Month,2><Day,2>');//'2015/06/01';
        strFinalSic := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        filtString1 := '';
        filtString2 := '';
        filtString3 := '';

        filtString1 := 'select a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa, a.fec_imputacion,a.tp_imput,d.tp_imput_aux,d.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,' +
                       'g.id_nacion,a.FECHA_SICORE_ST,' +
                       'sum(CTA_SIN_A_PAG) cta_2113012 ' +
                       'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                       'm4t_acumulado_rl3 d, m4_categorias e,m4_puestos_trabajo f,m4_empleados g ';

        filtString2 := 'where a.id_sociedad = b.id_sociedad ' +
                       'and a.id_empleado = b.id_empleado ' +
                       'and a.fec_alta_empleado = b.fec_alta_empleado ' +
                       'and a.fec_pago = b.fec_pago ' +
                       'and a.fec_imputacion = b.fec_imputacion ' +
                       'and a.tp_imput <> 4 ' +
                       'and a.id_sociedad = c.id_sociedad ' +
                       'and a.id_empleado = c.id_empleado ' +
                       'and a.fec_imputacion = c.fec_imputacion ' +
                       'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.ID_CONVENIO = ''FE'' ' +
                       'and a.id_sociedad = d.id_sociedad ' +
                       'and a.id_empleado = d.id_empleado ' +
                       'and a.fec_imputacion = d.fec_imputacion ' +
                       'and a.fec_alta_empleado = d.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_cto_cost_nav <> ''NULL'' ';

        if blnSicore then begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''SOM'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';

        end
        else begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''SOM'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';


        end;

        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);

        aADO_Con.Open;
        //aADO_Comm := aADO_Con.OracleConnection;

        aADO_Comm := aADO_Comm.OracleCommand(filtString1 + filtString2 + filtString3, aADO_Con);

        aADO_Reader := aADO_Comm.ExecuteReader;

        while aADO_Reader.Read() do begin



            begin

                if blnVentana then begin

                    windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));
                    windows.Update(2, aADO_Reader.Item('FEC_IMPUTACION'));
                    windows.Update(3, aADO_Reader.Item('ID_EMPRESA'));
                    windows.Update(4, aADO_Reader.Item('ID_CTO_COST_NAV'));

                end;
                strField1 := Format(aADO_Reader.Item('ID_EMPLEADO'));
                strField2 := Format(aADO_Reader.Item('FECHA_SICORE_ST'));
                strField3 := Format(aADO_Reader.Item('ID_EMPRESA'));
                strField4 := Format(aADO_Reader.Item('ID_CTO_COST_NAV'));

                strField7 := Format(aADO_Reader.Item('fec_imputacion'));

                //IF EVALUATE(intInteger,aADO_Reader.Item('TP_IMPUT')) THEN
                strField8 := Format(aADO_Reader.Item('TP_IMPUT'));
                strField9 := Format(aADO_Reader.Item('id_categoria'));
                strField10 := Format(aADO_Reader.Item('id_puesto'));
                strField11 := Format(aADO_Reader.Item('n_categoria'));
                strField12 := Format(aADO_Reader.Item('n_puesto'));
                strField13 := Format(aADO_Reader.Item('id_sociedad'));
                strField14 := Format(aADO_Reader.Item('FEC_IMPUTACION'));
                strField15 := Format(aADO_Reader.Item('id_nacion'));
                strField17 := Format(aADO_Reader.Item('tp_imput_aux'));

                if datFecha <> 0D then begin

                    if Format(datFecha) <> strField2 then begin

                        Clear(rstConfCont);
                        rstConfCont.Get();
                        if (Abs(decTotalxFecha) <> 0) and (Abs(decTotalxFecha) <= 1) then begin

                            //fntGenerarLineaDiario(rstConfCont.CuentaRedondeo,-decTotalxFecha,'',FORMAT(datFecha));
                            decTotalxFecha := 0;

                        end;

                    end;

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;

                decImporte := 0;
                strField5 := '2113012';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;

            end;

        end;

        windows.Close;
    end;

    [Scope('OnPrem')]
    procedure fntSincronizarSindicatoAPagarSSIEsp(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strInicioSic: Text[30];
        strFinalSic: Text[30];
        datFechaVariable: Date;
        strVariable: Text[1024];
        intInteger: Integer;
        decDecimal: Decimal;
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');

        windows.Update(0, 'Sindicatos SSI españoles');

        strInicio := Format(datInicio, 0, '<Year4><Month,2><Day,2>');
        strFinal := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        if Evaluate(intInicio, strInicio) then;
        if Evaluate(intFinal, strFinal) then;
        strInicioSic := Format(datInicio, 0, '<Year4><Month,2><Day,2>');//'2015/06/01';
        strFinalSic := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        filtString1 := '';
        filtString2 := '';
        filtString3 := '';

        filtString1 := 'select a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa, a.fec_imputacion,a.tp_imput,d.tp_imput_aux,d.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,' +
                       'g.id_nacion,a.FECHA_SICORE_ST,' +
                       'sum(CTA_SIN_A_PAG) cta_2113003 ' +
                       'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                       'm4t_acumulado_rl3 d, m4_categorias e,m4_puestos_trabajo f,m4_empleados g ';

        filtString2 := 'where a.id_sociedad = b.id_sociedad ' +
                       'and a.id_empleado = b.id_empleado ' +
                       'and a.fec_alta_empleado = b.fec_alta_empleado ' +
                       'and a.fec_pago = b.fec_pago ' +
                       'and a.fec_imputacion = b.fec_imputacion ' +
                       'and a.tp_imput <> 4 ' +
                       'and a.id_sociedad = c.id_sociedad ' +
                       'and a.id_empleado = c.id_empleado ' +
                       'and a.ID_CONVENIO = ''FE'' ' +
                       'and a.fec_imputacion = c.fec_imputacion ' +
                       'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_sociedad = d.id_sociedad ' +
                       'and a.id_empleado = d.id_empleado ' +
                       'and a.fec_imputacion = d.fec_imputacion ' +
                       'and a.fec_alta_empleado = d.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_cto_cost_nav <> ''NULL'' ';

        if blnSicore then begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''SSI'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';

        end
        else begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''SSI'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';


        end;

        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);

        aADO_Con.Open;
        //aADO_Comm := aADO_Con.OracleConnection;

        aADO_Comm := aADO_Comm.OracleCommand(filtString1 + filtString2 + filtString3, aADO_Con);

        aADO_Reader := aADO_Comm.ExecuteReader;

        while aADO_Reader.Read() do begin



            begin

                if blnVentana then begin

                    windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));
                    windows.Update(2, aADO_Reader.Item('FEC_IMPUTACION'));
                    windows.Update(3, aADO_Reader.Item('ID_EMPRESA'));
                    windows.Update(4, aADO_Reader.Item('ID_CTO_COST_NAV'));

                end;
                strField1 := Format(aADO_Reader.Item('ID_EMPLEADO'));
                strField2 := Format(aADO_Reader.Item('FECHA_SICORE_ST'));
                strField3 := Format(aADO_Reader.Item('ID_EMPRESA'));
                strField4 := Format(aADO_Reader.Item('ID_CTO_COST_NAV'));

                strField7 := Format(aADO_Reader.Item('fec_imputacion'));

                //IF EVALUATE(intInteger,aADO_Reader.Item('TP_IMPUT')) THEN
                strField8 := Format(aADO_Reader.Item('TP_IMPUT'));
                strField9 := Format(aADO_Reader.Item('id_categoria'));
                strField10 := Format(aADO_Reader.Item('id_puesto'));
                strField11 := Format(aADO_Reader.Item('n_categoria'));
                strField12 := Format(aADO_Reader.Item('n_puesto'));
                strField13 := Format(aADO_Reader.Item('id_sociedad'));
                strField14 := Format(aADO_Reader.Item('FEC_IMPUTACION'));
                strField15 := Format(aADO_Reader.Item('id_nacion'));
                strField17 := Format(aADO_Reader.Item('tp_imput_aux'));

                if datFecha <> 0D then begin

                    if Format(datFecha) <> strField2 then begin

                        Clear(rstConfCont);
                        rstConfCont.Get();
                        if (Abs(decTotalxFecha) <> 0) and (Abs(decTotalxFecha) <= 1) then begin

                            //fntGenerarLineaDiario(rstConfCont.CuentaRedondeo,-decTotalxFecha,'',FORMAT(datFecha));
                            decTotalxFecha := 0;

                        end;

                    end;

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;

                decImporte := 0;
                strField5 := '2113003';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;

            end;

        end;

        windows.Close;
    end;

    [Scope('OnPrem')]
    procedure fntSincronizarSindicatoAPagarUOMEsp(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strInicioSic: Text[30];
        strFinalSic: Text[30];
        datFechaVariable: Date;
        strVariable: Text[1024];
        intInteger: Integer;
        decDecimal: Decimal;
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');

        windows.Update(0, 'Sindicatos UOM españoles');

        strInicio := Format(datInicio, 0, '<Year4><Month,2><Day,2>');
        strFinal := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        if Evaluate(intInicio, strInicio) then;
        if Evaluate(intFinal, strFinal) then;
        strInicioSic := Format(datInicio, 0, '<Year4><Month,2><Day,2>');//'2015/06/01';
        strFinalSic := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        filtString1 := '';
        filtString2 := '';
        filtString3 := '';

        filtString1 := 'select a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa, a.fec_imputacion,a.tp_imput,d.tp_imput_aux,d.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,' +
                       'g.id_nacion,a.FECHA_SICORE_ST,' +
                       'sum(CTA_SIN_A_PAG) cta_2113003 ' +
                       'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                       'm4t_acumulado_rl3 d, m4_categorias e,m4_puestos_trabajo f,m4_empleados g ';

        filtString2 := 'where a.id_sociedad = b.id_sociedad ' +
                       'and a.id_empleado = b.id_empleado ' +
                       'and a.fec_alta_empleado = b.fec_alta_empleado ' +
                       'and a.fec_pago = b.fec_pago ' +
                       'and a.fec_imputacion = b.fec_imputacion ' +
                       'and a.tp_imput <> 4 ' +
                       'and a.id_sociedad = c.id_sociedad ' +
                       'and a.id_empleado = c.id_empleado ' +
                       'and a.fec_imputacion = c.fec_imputacion ' +
                       'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_sociedad = d.id_sociedad ' +
                       'and a.id_empleado = d.id_empleado ' +
                       'and a.ID_CONVENIO = ''FE'' ' +
                       'and a.fec_imputacion = d.fec_imputacion ' +
                       'and a.fec_alta_empleado = d.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_cto_cost_nav <> ''NULL'' ';

        if blnSicore then begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''UOM'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';

        end
        else begin


            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         'and c.ID_SINDICATO = ''UOM'' ' +
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion order by a.fec_imputacion,a.FECHA_SICORE_ST,' +
                         'a.id_empleado';

        end;

        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);

        aADO_Con.Open;
        //aADO_Comm := aADO_Con.OracleConnection;

        aADO_Comm := aADO_Comm.OracleCommand(filtString1 + filtString2 + filtString3, aADO_Con);

        aADO_Reader := aADO_Comm.ExecuteReader;

        while aADO_Reader.Read() do begin



            begin

                if blnVentana then begin

                    windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));
                    windows.Update(2, aADO_Reader.Item('FEC_IMPUTACION'));
                    windows.Update(3, aADO_Reader.Item('ID_EMPRESA'));
                    windows.Update(4, aADO_Reader.Item('ID_CTO_COST_NAV'));

                end;
                strField1 := Format(aADO_Reader.Item('ID_EMPLEADO'));
                strField2 := Format(aADO_Reader.Item('FECHA_SICORE_ST'));
                strField3 := Format(aADO_Reader.Item('ID_EMPRESA'));
                strField4 := Format(aADO_Reader.Item('ID_CTO_COST_NAV'));

                strField7 := Format(aADO_Reader.Item('fec_imputacion'));

                //IF EVALUATE(intInteger,aADO_Reader.Item('TP_IMPUT')) THEN
                strField8 := Format(aADO_Reader.Item('TP_IMPUT'));
                strField9 := Format(aADO_Reader.Item('id_categoria'));
                strField10 := Format(aADO_Reader.Item('id_puesto'));
                strField11 := Format(aADO_Reader.Item('n_categoria'));
                strField12 := Format(aADO_Reader.Item('n_puesto'));
                strField13 := Format(aADO_Reader.Item('id_sociedad'));
                strField14 := Format(aADO_Reader.Item('FEC_IMPUTACION'));
                strField15 := Format(aADO_Reader.Item('id_nacion'));
                strField17 := Format(aADO_Reader.Item('tp_imput_aux'));

                if datFecha <> 0D then begin

                    if Format(datFecha) <> strField2 then begin

                        Clear(rstConfCont);
                        rstConfCont.Get();
                        if (Abs(decTotalxFecha) <> 0) and (Abs(decTotalxFecha) <= 1) then begin

                            //fntGenerarLineaDiario(rstConfCont.CuentaRedondeo,-decTotalxFecha,'',FORMAT(datFecha));
                            decTotalxFecha := 0;

                        end;

                    end;

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;

                decImporte := 0;
                strField5 := '2113003';
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_' + strField5);
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_' + strField5));
                    decImporte := aADO_Reader.Item('cta_' + strField5);
                    if decImporte <> 0 then fntGenerarLineaDiario(strField5, -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;


            end;

        end;

        windows.Close;
    end;

    [Scope('OnPrem')]
    procedure fntSincronizarSindicatoAPagar(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strInicioSic: Text[30];
        strFinalSic: Text[30];
        datFechaVariable: Date;
        strVariable: Text[1024];
        intInteger: Integer;
        decDecimal: Decimal;
        l_rstDV: Record "Dimension Value";
        l_rst352: Record "Default Dimension";
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');

        windows.Update(0, 'Sindicatos');

        strInicio := Format(datInicio, 0, '<Year4><Month,2><Day,2>');
        strFinal := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        if Evaluate(intInicio, strInicio) then;
        if Evaluate(intFinal, strFinal) then;
        strInicioSic := Format(datInicio, 0, '<Year4><Month,2><Day,2>');//'2015/06/01';
        strFinalSic := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        filtString1 := '';
        filtString2 := '';
        filtString3 := '';

        filtString1 := 'select a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                       'a.id_empresa, a.fec_imputacion,a.tp_imput,d.tp_imput_aux,d.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,' +
                       'g.id_nacion,a.FECHA_SICORE_ST,' +
                       'sum(CTA_SIN_A_PAG) cta_2113003,c.id_sindicato ' +
                       'from m4t_acumulado_rl a, m4t_acumulado_rl4 b, m4t_acumulado_rl2 c, ' +
                       'm4t_acumulado_rl3 d, m4_categorias e,m4_puestos_trabajo f,m4_empleados g ';

        filtString2 := 'where a.id_sociedad = b.id_sociedad ' +
                       'and a.id_empleado = b.id_empleado ' +
                       'and a.fec_alta_empleado = b.fec_alta_empleado ' +
                       'and a.fec_pago = b.fec_pago ' +
                       'and a.fec_imputacion = b.fec_imputacion ' +
                       'and a.tp_imput <> 4 ' +
                       'and a.id_sociedad = c.id_sociedad ' +
                       'and a.id_empleado = c.id_empleado ' +
                       'and a.fec_imputacion = c.fec_imputacion ' +
                       'and a.fec_alta_empleado = c.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_sociedad = d.id_sociedad ' +
                       'and a.id_empleado = d.id_empleado ' +
                       //'and a.ID_CONVENIO = ''FE'' '+
                       'AND c.ID_SINDICATO <> ''NULL'' ' +
                       'and a.fec_imputacion = d.fec_imputacion ' +
                       'and a.fec_alta_empleado = d.fec_alta_empleado ' +
                       'and a.fec_pago = d.fec_pago ' +
                       'and a.id_cto_cost_nav <> ''NULL'' ';

        if blnSicore then begin

            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         //'and c.ID_SINDICATO = ''UOM'' '+
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion,c.id_sindicato ' +
                         'order by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion,c.id_sindicato';

        end
        else begin


            filtString3 :=
                         'and a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') ' +
                         'and a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') ' +
                         'and d.id_categoria = e.id_categoria ' +
                         'and d.id_puesto = f.id_puesto ' +
                         'and g.id_empleado = a.id_empleado ' +
                         //'and c.ID_SINDICATO = ''UOM'' '+
                         'group by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion,c.id_sindicato ' +
                         'order by a.id_sociedad,a.id_empleado,a.id_cto_cost_nav, ' +
                         'a.id_empresa,a.fec_imputacion,a.tp_imput,d.tp_imput_aux,a.FECHA_SICORE_ST,' +
                         'd.id_categoria,d.id_puesto,e.n_categoria,f.n_puesto,g.id_nacion,c.id_sindicato';
        end;

        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);

        aADO_Con.Open;
        //aADO_Comm := aADO_Con.OracleConnection;

        aADO_Comm := aADO_Comm.OracleCommand(filtString1 + filtString2 + filtString3, aADO_Con);

        aADO_Reader := aADO_Comm.ExecuteReader;

        while aADO_Reader.Read() do begin

            begin

                if blnVentana then begin

                    windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));
                    windows.Update(2, aADO_Reader.Item('FEC_IMPUTACION'));
                    windows.Update(3, aADO_Reader.Item('ID_EMPRESA'));
                    windows.Update(4, aADO_Reader.Item('ID_CTO_COST_NAV'));

                end;
                strField1 := Format(aADO_Reader.Item('ID_EMPLEADO'));
                strField2 := Format(aADO_Reader.Item('FECHA_SICORE_ST'));
                strField3 := Format(aADO_Reader.Item('ID_EMPRESA'));
                strField4 := Format(aADO_Reader.Item('ID_CTO_COST_NAV'));

                strField7 := Format(aADO_Reader.Item('fec_imputacion'));

                //IF EVALUATE(intInteger,aADO_Reader.Item('TP_IMPUT')) THEN
                strField8 := Format(aADO_Reader.Item('TP_IMPUT'));
                strField9 := Format(aADO_Reader.Item('id_categoria'));
                strField10 := Format(aADO_Reader.Item('id_puesto'));
                strField11 := Format(aADO_Reader.Item('n_categoria'));
                strField12 := Format(aADO_Reader.Item('n_puesto'));
                strField13 := Format(aADO_Reader.Item('id_sociedad'));
                strField14 := Format(aADO_Reader.Item('FEC_IMPUTACION'));
                strField15 := Format(aADO_Reader.Item('id_nacion'));
                strField17 := Format(aADO_Reader.Item('tp_imput_aux'));
                strField18 := Format(aADO_Reader.Item('id_sindicato'));

                if datFecha <> 0D then begin

                    if Format(datFecha) <> strField2 then begin

                        Clear(rstConfCont);
                        rstConfCont.Get();
                        if (Abs(decTotalxFecha) <> 0) and (Abs(decTotalxFecha) <= 1) then begin

                            //fntGenerarLineaDiario(rstConfCont.CuentaRedondeo,-decTotalxFecha,'',FORMAT(datFecha));
                            decTotalxFecha := 0;

                        end;

                    end;

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;

                decImporte := 0;
                Clear(l_rstDV);
                l_rstDV.Get(rstHRS."Union dimension", strField18);
                Clear(l_rst352);
                l_rst352.SetRange("Dimension Code", rstHRS."Union dimension");
                l_rst352.SetRange("Dimension Value Code", strField18);
                if l_rst352.Count > 1 then
                    Error('Existe más de una combinación para el sindicato %1, por favor controle la relación.', strField18);
                if l_rst352.Count < 1 then
                    Error('No existe una combinación para el sindicato %1, por favor controle la relación.', strField18);
                l_rst352.FindFirst;
                //strField5 := '2113003';
                strField5 := l_rst352."No.";
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                strField6 := aADO_Reader.Item('cta_2113003');
                if blnVentana then
                    windows.Update(5, strField5);
                //IF EVALUATE(decDecimal,aADO_Reader.Item('cta_'+strField5)) THEN
                begin

                    if blnVentana then
                        windows.Update(6, aADO_Reader.Item('cta_2113003'));
                    decImporte := aADO_Reader.Item('cta_2113003');
                    if decImporte <> 0 then fntGenerarLineaDiario(l_rst352."No.", -decImporte, strField4, strField7);
                    decTotalxFecha += Round(-decImporte, 0.01);

                end;

                if Evaluate(datFechaVariable, aADO_Reader.Item('FEC_IMPUTACION')) then
                    datFecha := datFechaVariable;


            end;

        end;

        windows.Close;
    end;

    [Scope('OnPrem')]
    procedure fntSincronizarRolPorDias(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean)
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text;
        filtString2: Text;
        filtString3: Text;
        filtString4: Text;
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strInicioSic: Text[30];
        strFinalSic: Text[30];
        datFechaVariable: DateTime;
        strVariable: Text[1024];
        intInteger: Integer;
        decDecimal: Decimal;
        rstRpD: Record "Production amount per employee";
        strBuque: Code[10];
        strMarea: Code[10];
        rstJob: Record Job;
        datSalida: Date;
        datEntrada: Date;
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');

        windows.Update(0, 'Rol por día');

        strInicio := Format(datInicio, 0, '<Year4><Month,2><Day,2>');
        strFinal := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        if Evaluate(intInicio, strInicio) then;
        if Evaluate(intFinal, strFinal) then;
        strInicioSic := Format(datInicio, 0, '<Year4><Month,2><Day,2>');//'2015/06/01';
        strFinalSic := Format(datFinal, 0, '<Year4><Month,2><Day,2>');

        filtString1 := '';
        filtString2 := '';
        filtString3 := '';

        filtString1 := 'select a.id_empleado,a.fec_imputacion,id_buque,id_marea,fec_ini_estado,fec_fin_estado,id_puesto,dolar_compra ' +
                       'from m4t_acumulado_RL A, m4t_acumulado_RL2 b, m4t_acumulado_RL3 C, M4_EMPLEADOS D ' +
                       'where a.id_empleado = b.id_empleado and ' +
                       'a.id_empleado = c.id_empleado and ' +
                       'a.id_empleado = d.id_empleado and ' +
                       'a.fec_imputacion = b.fec_imputacion and ' +
                       'a.fec_imputacion = c.fec_imputacion and ' +
                       'a.fec_imputacion >= to_date(''' + strInicio + ''',''yyyy/mm/dd'') and ' +
                       'a.fec_imputacion <= to_date(''' + strFinal + ''',''yyyy/mm/dd'') and ' +
                       'id_convenio in(''MR'',''OF'') AND TP_IMPUT_AUX = 10 ' +
                       'order by a.id_empleado,a.fec_imputacion';

        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);

        aADO_Con.Open;
        //aADO_Comm := aADO_Con.OracleConnection;

        aADO_Comm := aADO_Comm.OracleCommand(filtString1 + filtString2 + filtString3, aADO_Con);

        aADO_Reader := aADO_Comm.ExecuteReader;

        Clear(rstRpD);
        if rstRpD.FindLast then
            i := rstRpD."Entry no.";
        while aADO_Reader.Read() do begin

            i += 1;
            if blnVentana then begin

                windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));
                windows.Update(2, aADO_Reader.Item('FEC_IMPUTACION'));

            end;

            strBuque := Format(aADO_Reader.Item('ID_BUQUE'));
            strBuque := '1' + CopyStr(strBuque, 2, 2);
            strMarea := Format(aADO_Reader.Item('ID_MAREA'));
            if StrLen(strMarea) < 6 then
                repeat

                    strMarea := '0' + strMarea;

                until StrLen(strMarea) = 6;

            if Evaluate(datFechaVariable, aADO_Reader.Item('fec_ini_estado')) then
                datSalida := DT2Date(datFechaVariable);
            if Evaluate(datFechaVariable, aADO_Reader.Item('fec_fin_estado')) then
                datEntrada := DT2Date(datFechaVariable);
            Clear(rstJob);
            rstJob.SetRange("Global Dimension 1 Code", strBuque);
            rstJob.SetRange("Global Dimension 3 Code", strMarea);
            if rstJob.FindFirst then;

            Clear(rstRpD);
            rstRpD.SetRange("File no.", Format(aADO_Reader.Item('ID_EMPLEADO')));
            rstRpD.SetRange("Job no.", rstJob."No.");
            rstRpD.SetRange("Starting date", datSalida);
            rstRpD.SetRange("Ending date", datEntrada);
            rstRpD.SetRange("Role code", Format(aADO_Reader.Item('id_puesto')));
            if rstRpD.FindFirst then
                i -= 1
            else begin

                rstRpD."Entry no." := i;
                rstRpD."File no." := Format(aADO_Reader.Item('ID_EMPLEADO'));
                rstRpD."Job no." := rstJob."No.";
                rstRpD."Starting date" := datSalida;
                rstRpD."Ending date" := datEntrada;
                rstRpD."Role code" := Format(aADO_Reader.Item('id_puesto'));
                rstRpD."Exchange rate" := aADO_Reader.Item('dolar_compra');
                rstRpD.Insert;

            end;

        end;

        windows.Close;
    end;

    local procedure fntConfSincrMeta4(): Text
    var
        l_rstHRS: Record "Human Resources Setup";
        l_strSID: Text;
        l_strUID: Text;
        l_strPWD: Text;
    begin
        Clear(l_rstHRS);
        l_rstHRS.Get();
        l_strSID := l_rstHRS."TNS SID";
        l_strUID := l_rstHRS."Meta4 userid";
        l_strPWD := l_rstHRS."Meta4 password";

        exit('Data Source=' + l_strSID + ';' +
             //'Integrated Security=false'+';'+
             'Password=' + l_strPWD + ';' +
             'User ID=' + l_strUID + ';');
    end;

    [Scope('OnPrem')]
    procedure fntOrdenPago(datInicio: Date; datFinal: Date; blnSicore: Boolean; blnVentana: Boolean; strSelect: Text[1024])
    var
        [NonDebuggable]
        aADO_Con: DotNet dnOracleConnection;
        [NonDebuggable]
        aADO_Comm: DotNet dnOracleCommand;
        [NonDebuggable]
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Dialog;
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
        decDebe: Decimal;
        decHaber: Decimal;
        j: Integer;
        PunProyecto: Record Job;
        x: Integer;
        decImporte: Decimal;
        strInicio: Text[30];
        strFinal: Text[30];
        intInicio: Integer;
        intFinal: Integer;
        decTotalxFecha: Decimal;
        rstConfCont: Record "General Ledger Setup";
        intCantidadReg: Integer;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        strNBanco: Text[30];
        ServerName: Text;
        OracleDB: Text;
        ConnectionString: Text;
        UserName: Text;
        Pass: Text;
        datFechaVariable: Date;
        strVariable: Text[1024];
        strIDBanco: Text[1024];
        strTipoCuenta: Text[1024];
        strNroCuenta: Text[1024];
    begin
        if blnVentana then
            windows.Open('Proceso  #0###################################\' +
                          'Empleado #1#############\' +
                          'Fecha    #2#############\' +
                          'Empresa  #3#############\' +
                          'Proyecto #4#############\' +
                          'Cuenta   #5#############\' +
                          'Sueldos  #6#############\' +
                          'Debe     #7#############\' +
                          'Haber    #8#############\');


        ServerName := 'meta4.arbumasa.net.ar';
        OracleDB := 'meta4';
        UserName := 'meta4';
        Pass := 'meta4';
        g_ConnectionString := 'Data Source=' + ServerName + ';' +
                            'Integrated Security=false' + ';' +
                            'Password=' + Pass + ';' +
                            'User ID=' + UserName + ';';

        windows.Update(0, 'Exportar pagos');

        g_ConnectionString := fntConfSincrMeta4;

        aADO_Con := aADO_Con.OracleConnection(g_ConnectionString);

        aADO_Con.Open;

        //aADO_Comm := aADO_Con.OracleConnection;

        aADO_Comm := aADO_Comm.OracleCommand(filtString1, aADO_Con);

        aADO_Reader := aADO_Comm.ExecuteReader;

        while aADO_Reader.Read() do begin

            if blnVentana then
                windows.Update(1, aADO_Reader.Item('ID_EMPLEADO'));

            Clear(rstRecurso);
            decLegajo := 0;

            Evaluate(decLegajo, Format(aADO_Reader.Item('ID_EMPLEADO')));

            codLegajo := '';
            codLegajo := DelChr(Format(decLegajo), '=', ',.');

            if StrLen(codLegajo) < 5 then
                repeat

                    codLegajo := '0' + codLegajo;

                until StrLen(codLegajo) = 5;

            if not rstRecurso.Get(codLegajo) then
                Error('Faltan los datos del legajo %1', codLegajo)

            else begin

                Evaluate(datFechaVariable, Format(aADO_Reader.Item('FEC_IMPUTACION')));
                Evaluate(strIDBanco, Format(aADO_Reader.Item('ID_BANCO')));
                Evaluate(strTipoCuenta, Format(aADO_Reader.Item('ID_TIPO_CUENTA')));
                Evaluate(strNroCuenta, Format(aADO_Reader.Item('NUM_CUENTA')));

            end;

        end;

        windows.Close;
        Commit;
    end;
}

