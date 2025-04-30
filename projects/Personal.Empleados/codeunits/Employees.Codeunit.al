codeunit 50510 Employees
{

    trigger OnRun()
    begin
    end;

    var
        FiltroProd: Text[1024];
        infoEmpresa: Record "Company Information";
        strNombre: Text[1024];
        blnPrecalcular: Boolean;
        t_rstMarcajes: Record "Markup entry" temporary;
        intLineas: Integer;
        intCont: Integer;
        rstMovIni: Record "Markup entry";
        t_rstMovFin: Record "Markup entry" temporary;
        rstJor: Record "Workday detail";
        intContados: Integer;
        tempMarcajes: Record "Markup entry" temporary;
        intCantARepartir: Decimal;
        intCantEstaRepartida: Decimal;
        rstJor2: Record "Workday detail";
        decRedondeoSegundos: Decimal;
        frmMarcajes: Page "Mov. marcajes";
        rstMarcajes: Record "Markup entry";
        datFechaHoraLiq: Text[50];
        codLegajo: Code[10];
        rstConceptos: Record "Meta4 concept";
        strNovedad: Text[50];
        rstEmployee: Record Employee;
        Error0001: Label 'No se puede registrar el diario mientras existan líneas con cantidad en 0. Ver registro correspondiente a empleado %1, fecha de inicio %2';
        intCantOrigARepartir: Decimal;
        dlgVentana: Dialog;
        Msg0001: Label '¿Desea registrar las horas seleccionadas?';
        Err0001: Label 'La fecha de inicio no puede ser superior a la fecha de fin.';
        decGanBru: Decimal;
        decImponible: Decimal;
        decDeducGrales: Decimal;
        i: Integer;
        decGananciasNetas: Decimal;
        intNivel: Integer;
        decTotAgrup: Decimal;
        decTempAgrup: Decimal;
        datFecha: Date;
        intCantRep: Integer;
        intCantOrig: Decimal;
        datFechaLiq: Text;
        rstMovEmpReal: Record "Employee entry";
        rstMovEmp: Record "Employee entry" temporary;
        decQ: Decimal;

    [Scope('OnPrem')]
    procedure fntProcesarsinFiltro()
    begin
    end;

    [Scope('OnPrem')]
    procedure fntProcesar(var t_rstTemp: Record "Employee entry" temporary; blnAgruparxConcepto: Boolean; blnAgruparxEmpleado: Boolean; blnTomarAplicados: Boolean; blnAgruparxFecha: Boolean)
    var
        strFechaHoraLiq: Text;
    begin
        //Primero elimino todos los movimientos de las tablas temporales
        SelectLatestVersion;
        Clear(t_rstTemp);
        t_rstTemp.DeleteAll;
        if t_rstTemp.FindSet then
            repeat

                t_rstTemp.Delete;

            until t_rstTemp.Next = 0;

        Clear(t_rstMarcajes);
        t_rstMarcajes.DeleteAll;
        Clear(t_rstMovFin);
        t_rstMovFin.DeleteAll;
        Clear(rstMovEmp);
        rstMovEmp.DeleteAll;

        //Inicializo las líneas de movimiento de empleados
        intContados := 0;

        Clear(rstMarcajes);
        rstMarcajes.Reset;
        if rstMarcajes.FindLast then
            intContados := rstMarcajes."Entry no.";

        //Paso todos los marcajes sin aplicar a dos tablas temporales nuevas
        Clear(t_rstMarcajes);
        Clear(rstMovIni);
        rstMovIni.SetCurrentKey("File no.", "Markup date and time", Applied, "Fecha filtro");
        //Si estoy queriendo recalcular, entonces tomo también los aplicados
        if not blnTomarAplicados then
            rstMovIni.SetRange(Applied, false);
        //Aplico filtro fecha
        strFechaHoraLiq := datFechaHoraLiq;
        rstMovIni.SetFilter("Fecha filtro", strFechaHoraLiq);
        if codLegajo <> '' then
            rstMovIni.SetFilter(rstMovIni."File no.", codLegajo);
        if rstMovIni.FindSet then
            repeat

                t_rstMarcajes := rstMovIni;
                t_rstMarcajes.Insert(false);

                t_rstMovFin := t_rstMarcajes;
                t_rstMovFin.Insert(false);

            until rstMovIni.Next = 0;

        dlgVentana.Open('Legajo:   #1##############\' +
                        'Empleado: #2#################################\' +
                        'Marcaje : #3##############');
        //Por cada empleado con una configuracion de jornada, comienzo a barrer
        Clear(rstEmployee);
        //rstEmployee.SETRANGE(Type,rstEmployee.Type::Person);
        rstEmployee.SetFilter("Workday code", '<>%1', '');
        rstEmployee.SetFilter("Flexible o restricto", '<>%1', rstEmployee."Flexible o restricto"::" ");
        rstEmployee.SetFilter("No.", codLegajo);
        if rstEmployee.FindSet then
            repeat

                dlgVentana.Update(1, rstEmployee."No.");
                dlgVentana.Update(2, rstEmployee.Name);
                Clear(t_rstMovFin);
                Clear(t_rstMarcajes);

                case rstEmployee."Flexible o restricto" of
                    rstEmployee."Flexible o restricto"::Restricto:
                        begin

                            //Busco los marcajes de cada empleado que sean aplicables (que no estén neutralizados)
                            t_rstMarcajes.SetCurrentKey("File no.", "Markup date and time");
                            t_rstMarcajes.SetRange("File no.", rstEmployee."No.");
                            t_rstMarcajes.SetRange(Quantity, 1);
                            if t_rstMarcajes.FindSet(true) then
                                repeat

                                    dlgVentana.Update(3, t_rstMarcajes."Markup date and time");
                                    //Si el marcaje del puntero actual es posterior al último número de marcaje aplicado para este empleado, sigo adelante
                                    if (t_rstMovFin."Markup date and time" < t_rstMarcajes."Markup date and time") then begin

                                        //Busco el siguiente marcaje al actual (en fecha de computación). Si lo encuentro, inserto el movimiento del empleado completo
                                        //puesto que tiene dos movimientos consecutivos (asumo entrada y luego salida)
                                        Clear(t_rstMovFin);
                                        t_rstMovFin.SetCurrentKey("File no.", "Markup date and time");
                                        t_rstMovFin.SetRange("File no.", t_rstMarcajes."File no.");
                                        t_rstMovFin.SetFilter("Markup date and time", '>%1', t_rstMarcajes."Markup date and time");
                                        t_rstMovFin.SetRange(Quantity, 1);
                                        t_rstMovFin.SetRange("Event code", t_rstMarcajes."Event code");
                                        if t_rstMovFin.FindFirst then begin

                                            fntInsertarMovEmpleadoRestricto(t_rstTemp);

                                            //Marco ambos registros como aplicados
                                            t_rstMovFin.Applied := true;
                                            t_rstMovFin.Modify;
                                            t_rstMarcajes.Applied := true;
                                            t_rstMarcajes.Modify;

                                        end
                                        else begin

                                            //Inserto el marcaje correspondiente en otra función
                                            //Marco el registro actual como no aplicado
                                            fntInsertarMovEmpleadoRestricto(t_rstTemp);

                                            t_rstMarcajes.Applied := false;
                                            t_rstMarcajes.Modify;

                                        end;

                                    end;

                                until t_rstMarcajes.Next = 0;

                        end;

                    rstEmployee."Flexible o restricto"::Flexible:
                        begin

                            //PARA HORARIOS FLEXIBLES
                            //Busco los marcajes de cada empleado que sean aplicables (que no estén neutralizados)
                            Clear(t_rstMarcajes);
                            t_rstMarcajes.SetCurrentKey("File no.", "Markup date and time");
                            t_rstMarcajes.SetRange("File no.", rstEmployee."No.");
                            t_rstMarcajes.SetRange(Quantity, 1);
                            if t_rstMarcajes.FindSet(true) then
                                repeat

                                    dlgVentana.Update(3, t_rstMarcajes."Markup date and time");
                                    //Si el marcaje del puntero actual es posterior al último número de marcaje aplicado para este empleado, sigo adelante
                                    if (t_rstMovFin."Markup date and time" < t_rstMarcajes."Markup date and time") then begin

                                        //Busco el siguiente marcaje al actual (en fecha de computación). Si lo encuentro, inserto el movimiento
                                        //del empleado completo puesto que tiene dos movimientos consecutivos (asumo entrada y luego salida)
                                        Clear(t_rstMovFin);
                                        t_rstMovFin.SetCurrentKey("File no.", "Markup date and time");
                                        t_rstMovFin.SetRange("File no.", t_rstMarcajes."File no.");
                                        t_rstMovFin.SetFilter("Markup date and time", '>%1&<=%2', t_rstMarcajes."Markup date and time",
                                                                                   CreateDateTime(DT2Date(t_rstMarcajes."Markup date and time"), 235959T));
                                        t_rstMovFin.SetRange(Quantity, 1);
                                        //t_rstMovFin.SETRANGE(Applied,FALSE);
                                        t_rstMovFin.SetRange("Event code", t_rstMarcajes."Event code");
                                        if t_rstMovFin.FindFirst then begin

                                            fntInsertarMovEmpleadoFlexible(t_rstTemp);

                                            //Marco ambos registros como aplicados
                                            t_rstMovFin.Applied := true;
                                            t_rstMovFin.Modify;
                                            t_rstMarcajes.Applied := true;
                                            t_rstMarcajes.Modify;

                                        end
                                        else begin

                                            //Inserto el marcaje correspondiente en otra función
                                            //Marco el registro actual como no aplicado
                                            fntInsertarMovEmpleadoFlexible(t_rstTemp);

                                            t_rstMarcajes.Applied := false;
                                            t_rstMarcajes.Modify;

                                        end;

                                    end;

                                until t_rstMarcajes.Next = 0;

                        end;

                    rstEmployee."Flexible o restricto"::Mixto:
                        begin

                            //PARA HORARIOS FLEXIBLES
                            //Busco los marcajes de cada empleado que sean aplicables (que no estén neutralizados)
                            Clear(t_rstMarcajes);
                            t_rstMarcajes.SetCurrentKey("File no.", "Markup date and time");
                            t_rstMarcajes.SetRange("File no.", rstEmployee."No.");
                            t_rstMarcajes.SetRange(Quantity, 1);
                            if t_rstMarcajes.FindSet(true) then
                                repeat

                                    dlgVentana.Update(3, t_rstMarcajes."Markup date and time");
                                    //Si el marcaje del puntero actual es posterior al último número de marcaje aplicado para este empleado, sigo adelante
                                    if (t_rstMovFin."Markup date and time" < t_rstMarcajes."Markup date and time") then begin

                                        //Busco el siguiente marcaje al actual (en fecha de computación). Si lo encuentro, inserto el movimiento
                                        //del empleado completo puesto que tiene dos movimientos consecutivos (asumo entrada y luego salida)
                                        Clear(t_rstMovFin);
                                        t_rstMovFin.SetCurrentKey("File no.", "Markup date and time");
                                        t_rstMovFin.SetRange("File no.", t_rstMarcajes."File no.");
                                        t_rstMovFin.SetFilter("Markup date and time", '>%1&<=%2', t_rstMarcajes."Markup date and time",
                                                                                   CreateDateTime(DT2Date(t_rstMarcajes."Markup date and time"), 235959T));
                                        t_rstMovFin.SetRange(Quantity, 1);
                                        //t_rstMovFin.SETRANGE(Applied,FALSE);
                                        t_rstMovFin.SetRange("Event code", t_rstMarcajes."Event code");
                                        if t_rstMovFin.FindFirst then begin

                                            //fntSugerirMovEmpleado(t_rstTemp);
                                            fntInsertarMovEmpleadoMixto(t_rstTemp);

                                            //Marco ambos registros como aplicados
                                            t_rstMovFin.Applied := true;
                                            t_rstMovFin.Modify;
                                            t_rstMarcajes.Applied := true;
                                            t_rstMarcajes.Modify;

                                        end
                                        else begin

                                            //Inserto el marcaje correspondiente en otra función
                                            //Marco el registro actual como no aplicado
                                            //fntSugerirMovEmpleado(t_rstTemp);
                                            fntInsertarMovEmpleadoMixto(t_rstTemp);

                                            t_rstMarcajes.Applied := false;
                                            t_rstMarcajes.Modify;

                                        end;

                                    end;

                                until t_rstMarcajes.Next = 0;

                        end;

                end;

            until rstEmployee.Next = 0;

        //Inserto un totalizador
        //IF (t_rstTemp."Entry no." <> 0) AND (t_rstTemp."File no." = rstEmployee."No.") THEN
        fntInsertarMovDiario(t_rstTemp, blnAgruparxConcepto, blnAgruparxEmpleado, blnAgruparxFecha);

        dlgVentana.Close;
    end;

    [Scope('OnPrem')]
    procedure fntProcesarSugerencia(var t_rstTemp: Record "Employee entry" temporary; blnAgruparxConcepto: Boolean; blnAgruparxEmpleado: Boolean; blnTomarAplicados: Boolean; blnAgruparxFecha: Boolean)
    var
        strFechaHoraLiq: Text;
        rstMovEmp: Record "Employee entry" temporary;
    begin
        //Primero elimino todos los movimientos de las tablas temporales
        Clear(t_rstTemp);
        t_rstTemp.DeleteAll;
        if t_rstTemp.FindSet then
            repeat

                t_rstTemp.Delete;

            until t_rstTemp.Next = 0;

        Clear(t_rstMarcajes);
        t_rstMarcajes.DeleteAll;
        Clear(t_rstMovFin);
        t_rstMovFin.DeleteAll;
        Clear(rstMovEmp);
        rstMovEmp.DeleteAll;

        //Inicializo las líneas de movimiento de empleados
        intContados := 0;

        Clear(rstMarcajes);
        if rstMarcajes.FindLast then
            intContados := rstMarcajes."Entry no.";


        //Paso todos los marcajes sin aplicar a dos tablas temporales nuevas
        Clear(t_rstMarcajes);
        Clear(rstMovIni);
        rstMovIni.SetCurrentKey("File no.", "Markup date and time", Applied, "Fecha filtro");
        //Si estoy queriendo recalcular, entonces tomo también los aplicados
        if not blnTomarAplicados then
            rstMovIni.SetRange(Applied, false);
        //Aplico filtro fecha
        strFechaHoraLiq := datFechaHoraLiq;
        rstMovIni.SetFilter("Fecha filtro", strFechaHoraLiq);
        if codLegajo <> '' then
            rstMovIni.SetFilter(rstMovIni."File no.", codLegajo);
        if rstMovIni.FindSet then
            repeat

                t_rstMarcajes := rstMovIni;
                t_rstMarcajes.Insert(false);

                t_rstMovFin := t_rstMarcajes;
                t_rstMovFin.Insert(false);

            until rstMovIni.Next = 0;

        dlgVentana.Open('Legajo:   #1##############\' +
                        'Empleado: #2#################################\' +
                        'Marcaje : #3##############');
        //Por cada empleado con una configuracion de jornada, comienzo a barrer
        Clear(rstEmployee);
        //rstEmployee.SETRANGE(Type,rstEmployee.Type::Person);
        rstEmployee.SetFilter("Workday code", '<>%1', '');
        rstEmployee.SetFilter("Flexible o restricto", '<>%1', rstEmployee."Flexible o restricto"::" ");
        rstEmployee.SetFilter("No.", codLegajo);
        if rstEmployee.FindSet then
            repeat

                dlgVentana.Update(1, rstEmployee."No.");
                dlgVentana.Update(2, rstEmployee.Name);
                Clear(t_rstMovFin);
                Clear(t_rstMarcajes);

                case rstEmployee."Flexible o restricto" of
                    rstEmployee."Flexible o restricto"::Restricto:
                        begin

                            //Busco los marcajes de cada empleado que sean aplicables (que no estén neutralizados)
                            t_rstMarcajes.SetCurrentKey("File no.", "Markup date and time");
                            t_rstMarcajes.SetRange("File no.", rstEmployee."No.");
                            t_rstMarcajes.SetRange(Quantity, 1);
                            if t_rstMarcajes.FindSet(true) then
                                repeat

                                    dlgVentana.Update(3, t_rstMarcajes."Markup date and time");
                                    //Si el marcaje del puntero actual es posterior al último número de marcaje aplicado para este empleado, sigo adelante
                                    if (t_rstMovFin."Markup date and time" < t_rstMarcajes."Markup date and time") then begin

                                        //Busco el siguiente marcaje al actual (en fecha de computación). Si lo encuentro, inserto el movimiento del empleado completo
                                        //puesto que tiene dos movimientos consecutivos (asumo entrada y luego salida)
                                        Clear(t_rstMovFin);
                                        t_rstMovFin.SetCurrentKey("File no.", "Markup date and time");
                                        t_rstMovFin.SetRange("File no.", t_rstMarcajes."File no.");
                                        t_rstMovFin.SetFilter("Markup date and time", '>%1', t_rstMarcajes."Markup date and time");
                                        t_rstMovFin.SetRange(Quantity, 1);
                                        t_rstMovFin.SetRange("Event code", t_rstMarcajes."Event code");
                                        if t_rstMovFin.FindFirst then begin

                                            fntInsertarMovEmpleadoRestricto(t_rstTemp);

                                            //Marco ambos registros como aplicados
                                            t_rstMovFin.Applied := true;
                                            t_rstMovFin.Modify;
                                            t_rstMarcajes.Applied := true;
                                            t_rstMarcajes.Modify;

                                        end
                                        else begin

                                            //Inserto el marcaje correspondiente en otra función
                                            //Marco el registro actual como no aplicado
                                            fntInsertarMovEmpleadoRestricto(t_rstTemp);

                                            t_rstMarcajes.Applied := false;
                                            t_rstMarcajes.Modify;

                                        end;

                                    end;

                                until t_rstMarcajes.Next = 0;

                        end;

                    rstEmployee."Flexible o restricto"::Flexible:
                        begin

                            //PARA HORARIOS FLEXIBLES
                            //Busco los marcajes de cada empleado que sean aplicables (que no estén neutralizados)
                            Clear(t_rstMarcajes);
                            t_rstMarcajes.SetCurrentKey("File no.", "Markup date and time");
                            t_rstMarcajes.SetRange("File no.", rstEmployee."No.");
                            t_rstMarcajes.SetRange(Quantity, 1);
                            if t_rstMarcajes.FindSet(true) then
                                repeat

                                    dlgVentana.Update(3, t_rstMarcajes."Markup date and time");
                                    //Si el marcaje del puntero actual es posterior al último número de marcaje aplicado para este empleado, sigo adelante
                                    if (t_rstMovFin."Markup date and time" < t_rstMarcajes."Markup date and time") then begin

                                        //Busco el siguiente marcaje al actual (en fecha de computación). Si lo encuentro, inserto el movimiento
                                        //del empleado completo puesto que tiene dos movimientos consecutivos (asumo entrada y luego salida)
                                        Clear(t_rstMovFin);
                                        t_rstMovFin.SetCurrentKey("File no.", "Markup date and time");
                                        t_rstMovFin.SetRange("File no.", t_rstMarcajes."File no.");
                                        t_rstMovFin.SetFilter("Markup date and time", '>%1&<=%2', t_rstMarcajes."Markup date and time",
                                                                                   CreateDateTime(DT2Date(t_rstMarcajes."Markup date and time"), 235959T));
                                        t_rstMovFin.SetRange(Quantity, 1);
                                        //t_rstMovFin.SETRANGE(Applied,FALSE);
                                        t_rstMovFin.SetRange("Event code", t_rstMarcajes."Event code");
                                        if t_rstMovFin.FindFirst then begin

                                            fntInsertarMovEmpleadoFlexible(t_rstTemp);

                                            //Marco ambos registros como aplicados
                                            t_rstMovFin.Applied := true;
                                            t_rstMovFin.Modify;
                                            t_rstMarcajes.Applied := true;
                                            t_rstMarcajes.Modify;

                                        end
                                        else begin

                                            //Inserto el marcaje correspondiente en otra función
                                            //Marco el registro actual como no aplicado
                                            fntInsertarMovEmpleadoFlexible(t_rstTemp);

                                            t_rstMarcajes.Applied := false;
                                            t_rstMarcajes.Modify;

                                        end;

                                    end;

                                until t_rstMarcajes.Next = 0;

                        end;

                    rstEmployee."Flexible o restricto"::Mixto:
                        begin

                            //PARA HORARIOS FLEXIBLES
                            //Busco los marcajes de cada empleado que sean aplicables (que no estén neutralizados)
                            Clear(t_rstMarcajes);
                            t_rstMarcajes.SetCurrentKey("File no.", "Markup date and time");
                            t_rstMarcajes.SetRange("File no.", rstEmployee."No.");
                            t_rstMarcajes.SetRange(Quantity, 1);
                            if t_rstMarcajes.FindSet(true) then
                                repeat

                                    dlgVentana.Update(3, t_rstMarcajes."Markup date and time");
                                    //Si el marcaje del puntero actual es posterior al último número de marcaje aplicado para este empleado, sigo adelante
                                    if (t_rstMovFin."Markup date and time" < t_rstMarcajes."Markup date and time") then begin

                                        //Busco el siguiente marcaje al actual (en fecha de computación). Si lo encuentro, inserto el movimiento
                                        //del empleado completo puesto que tiene dos movimientos consecutivos (asumo entrada y luego salida)
                                        Clear(t_rstMovFin);
                                        t_rstMovFin.SetCurrentKey("File no.", "Markup date and time");
                                        t_rstMovFin.SetRange("File no.", t_rstMarcajes."File no.");
                                        t_rstMovFin.SetFilter("Markup date and time", '>%1&<=%2', t_rstMarcajes."Markup date and time",
                                                                                   CreateDateTime(DT2Date(t_rstMarcajes."Markup date and time"), 235959T));
                                        t_rstMovFin.SetRange(Quantity, 1);
                                        //t_rstMovFin.SETRANGE(Applied,FALSE);
                                        t_rstMovFin.SetRange("Event code", t_rstMarcajes."Event code");
                                        if t_rstMovFin.FindFirst then begin

                                            fntSugerirMovEmpleado(t_rstTemp);

                                            //Marco ambos registros como aplicados
                                            t_rstMovFin.Applied := true;
                                            t_rstMovFin.Modify;
                                            t_rstMarcajes.Applied := true;
                                            t_rstMarcajes.Modify;

                                        end
                                        else begin

                                            //Inserto el marcaje correspondiente en otra función
                                            //Marco el registro actual como no aplicado
                                            fntSugerirMovEmpleado(t_rstTemp);

                                            t_rstMarcajes.Applied := false;
                                            t_rstMarcajes.Modify;

                                        end;

                                    end;

                                until t_rstMarcajes.Next = 0;

                        end;

                end;

            until rstEmployee.Next = 0;

        //Inserto un totalizador
        //IF (t_rstTemp."Entry no." <> 0) AND (t_rstTemp."File no." = rstEmployee."No.") THEN
        fntInsertarMovDiario(t_rstTemp, blnAgruparxConcepto, blnAgruparxEmpleado, blnAgruparxFecha);

        dlgVentana.Close;
    end;

    [Scope('OnPrem')]
    procedure fntPresentarMeta4(var t_rstTemp: Record "Employee entry" temporary; blnAgruparxConcepto: Boolean; blnAgruparxEmpleado: Boolean)
    var
        j: Integer;
        k: Integer;
    begin
        //Paso todos los marcajes sin aplicar a dos tablas temporales nuevas
        Clear(t_rstMarcajes);
        /*
        WHILE STRPOS(datFechaHoraLiq,'a.m.') <> 0 DO
        BEGIN
        
          datFechaHoraLiq := DELSTR(datFechaHoraLiq,STRPOS(datFechaHoraLiq,'a.m.'),4);
        
        END;
        */

        dlgVentana.Open('Legajo:   #1##############\' +
                        'Empleado: #2#################################\' +
                        'Marcaje : #3##############');

        j := 0;

        //Por cada empleado con una configuracion de jornada, comienzo a barrer
        Clear(rstEmployee);
        //rstEmployee.SETCURRENTKEY(Type,"Workday code","No.");
        //rstEmployee.SETRANGE(Type,rstEmployee.Type::Person);
        rstEmployee.SetFilter("Workday code", '<>%1', '');
        rstEmployee.SetFilter("Flexible o restricto", '<>%1', rstEmployee."Flexible o restricto"::" ");
        rstEmployee.SetFilter("No.", codLegajo);
        if rstEmployee.FindSet then
            repeat

                k := 0;
                dlgVentana.Update(1, rstEmployee."No.");
                dlgVentana.Update(2, rstEmployee.Name);

                Clear(rstConceptos);
                if rstConceptos.FindSet then
                    repeat

                        i := 0;
                        Clear(rstMovEmpReal);
                        //rstMovEmpReal.SETCURRENTKEY(Exported,"File no.","Start date and time","Event code",Quantity);
                        rstMovEmpReal.SetCurrentKey(Exported, "File no.", "Application date", "Event code", Quantity);
                        rstMovEmpReal.SetRange(Exported, false);
                        rstMovEmpReal.SetRange(rstMovEmpReal."File no.", rstEmployee."No.");
                        rstMovEmpReal.SetFilter("Application date", datFechaHoraLiq);
                        //rstMovEmpReal.SETFILTER("Start date and time",datFechaHoraLiq);
                        rstMovEmpReal.SetRange("Event code", rstConceptos."Concept code");
                        rstMovEmpReal.SetFilter(Quantity, '>0');
                        if rstMovEmpReal.FindSet then
                            repeat

                                i += 1;
                                k += 1;

                                if k = 1 then begin

                                    j += 1;
                                    Clear(t_rstTemp);
                                    t_rstTemp."Company no." := rstMovEmpReal."Company no.";
                                    t_rstTemp."File no." := rstMovEmpReal."File no.";
                                    t_rstTemp.Name := rstEmployee.Name;
                                    t_rstTemp."Entry no." := j;
                                    t_rstTemp.Insert;

                                end;

                                if i = 1 then begin

                                    j += 1;
                                    Clear(t_rstTemp);
                                    t_rstTemp."Company no." := rstMovEmpReal."Company no.";
                                    t_rstTemp."File no." := rstMovEmpReal."File no.";
                                    t_rstTemp.Name := rstEmployee.Name;
                                    t_rstTemp."Event code" := rstMovEmpReal."Event code";
                                    t_rstTemp."News code" := rstMovEmpReal."News code";
                                    t_rstTemp."Entry no." := j;
                                    t_rstTemp.Insert;

                                end;

                                j += 1;
                                Clear(t_rstTemp);
                                t_rstTemp := rstMovEmpReal;
                                t_rstTemp."Entry no." := j;
                                t_rstTemp.Insert;

                            until rstMovEmpReal.Next = 0;

                    until rstConceptos.Next = 0;

            until rstEmployee.Next = 0;

        dlgVentana.Close;

    end;

    [Scope('OnPrem')]
    procedure fntInsertarMovDiario(var t_rstTemp: Record "Employee entry" temporary; blnAgruparxConcepto: Boolean; blnAgruparxEmpleado: Boolean; blnAgruparxFecha: Boolean)
    var
        t_rstTempMarca: Record "Employee entry" temporary;
        l_codEvento: Integer;
        l_codLegajo: Code[10];
    begin
        //Inicializo los punteros temporales
        Clear(t_rstTempMarca);
        t_rstTempMarca.DeleteAll;
        //Creo un puntero que ordena por legajo y asigno todos los movimientos a dos nuevos punteros temporales
        t_rstTemp.Reset;
        t_rstTemp.SetCurrentKey("Company no.", "File no.", t_rstTemp."Start date and time", "Event code");
        if t_rstTemp.FindSet(false) then
            repeat

                t_rstTempMarca := t_rstTemp;
                t_rstTempMarca.Insert(false);

            until t_rstTemp.Next = 0;

        //Uno de esos punteros lo uso de índice y no se modifica
        //t_rstTempMarcaIndice.SETRANGE("File no.",rstEmployee."No.");
        if t_rstTempMarca.FindSet(false) then
            repeat

                //Calculo la cantidad de tiempo total para ese legajo en esa fecha y para ese código de evento
                if l_codLegajo <> t_rstTempMarca."File no." then begin

                    l_codLegajo := t_rstTempMarca."File no.";

                    //Inserto el registro agrupador por fecha
                    t_rstTemp.Init;
                    intContados += 1;
                    t_rstTemp."Entry no." := intContados;
                    t_rstTemp."Company no." := 1;
                    t_rstTemp."File no." := t_rstTempMarca."File no.";
                    t_rstTemp.Name := t_rstTempMarca.Name;
                    t_rstTemp."Hiring date" := t_rstTempMarca."Hiring date";
                    t_rstTemp.Quantity += t_rstTempMarca.Quantity;
                    decTotAgrup := 0;
                    t_rstTemp.Records := '';
                    t_rstTemp.Insert(false);

                end
                else begin

                    t_rstTemp.Quantity += t_rstTempMarca.Quantity;
                    t_rstTemp.Modify;

                end;

            until t_rstTempMarca.Next = 0;

        if t_rstTempMarca.FindSet(false) then
            repeat

                if datFecha <> t_rstTempMarca."Application date" then begin

                    datFecha := t_rstTempMarca."Application date";

                    //Inserto el registro agrupador por fecha
                    t_rstTemp.Init;
                    intContados += 1;
                    t_rstTemp."Entry no." := intContados;
                    t_rstTemp."Company no." := 1;
                    t_rstTemp."File no." := t_rstTempMarca."File no.";
                    t_rstTemp.Name := t_rstTempMarca.Name;
                    t_rstTemp."Hiring date" := t_rstTempMarca."Hiring date";
                    t_rstTemp."Application date" := t_rstTempMarca."Application date";
                    t_rstTemp.Quantity += t_rstTempMarca.Quantity;
                    decTotAgrup := 0;
                    t_rstTemp.Records := '';
                    t_rstTemp.Insert(false);

                end
                else begin

                    t_rstTemp.Quantity += t_rstTempMarca.Quantity;
                    t_rstTemp.Modify;

                end;

            until t_rstTempMarca.Next = 0;
    end;

    [Scope('OnPrem')]
    procedure fntFiltrarFecha(l_datFechaHoraLiq: Text[100])
    begin
        datFechaHoraLiq := l_datFechaHoraLiq;
    end;

    [Scope('OnPrem')]
    procedure fntFiltrarLegajo(l_codLegajo: Code[10])
    begin
        codLegajo := l_codLegajo;
    end;

    [Scope('OnPrem')]
    procedure fntRegistrar(var t_rstTemp: Record "Employee entry" temporary)
    var
        rstMovEmpDef: Record "Employee entry";
        Text0001: Label 'If you confirm the application of this records, they will be no longer available from this form. ¿Do you want to continue?';
        rstMarcajesApl: Record "Markup entry";
        intMov: Integer;
        intContar: Integer;
        Text0002: Label '%1 records have been processed';
        rstConcept: Record "Meta4 concept";
    begin
        if Confirm(Text0001) then begin

            Clear(rstMovEmpDef);
            intMov := 0;
            intContar := 0;
            if rstMovEmpDef.FindLast then
                intMov := rstMovEmpDef."Entry no."
            else
                intMov := 1;

            if t_rstTemp.FindSet(false) then
                repeat

                    if t_rstTemp.Records <> '' then begin

                        if t_rstTemp.Quantity = 0 then
                            Error(Error0001, t_rstTemp."File no." + ' - ' + t_rstTemp.Name, t_rstTemp."Start date and time");

                        Clear(rstMarcajesApl);
                        rstMarcajesApl.SetFilter(rstMarcajesApl."Entry no.", t_rstTemp.Records);
                        rstMarcajesApl.ModifyAll(Applied, true);
                        intMov += 1;
                        intContar += 1;
                        Clear(rstMovEmpDef);
                        rstMovEmpDef.Init;
                        rstMovEmpDef := t_rstTemp;
                        rstMovEmpDef."Entry no." := intMov;
                        Clear(rstConcept);
                        if rstConcept.Get(rstMovEmpDef."Event code") then
                            rstMovEmpDef."News code" := rstConcept."Meta4 concept";
                        Evaluate(rstMovEmpDef."Start record", CopyStr(t_rstTemp.Records, 1, StrPos(t_rstTemp.Records, '|') - 1));
                        Evaluate(rstMovEmpDef."Finish record", CopyStr(t_rstTemp.Records, StrPos(t_rstTemp.Records, '|') + 1, 20));
                        rstMovEmpDef.Insert;

                    end;

                until t_rstTemp.Next = 0;

            if intContar <> 0 then begin

                Message(Text0002, Format(intContar));
                t_rstTemp.DeleteAll;

            end;

        end;
    end;

    [Scope('OnPrem')]
    procedure fntRegistrarLiq(var t_rstTemp: Record "Employee entry" temporary)
    var
        rstMovEmpDef: Record "Employee journal application";
        Text0001: Label 'If you confirm the application of this records, they will be no longer available from this form. ¿Do you want to continue?';
        rstMarcajesApl: Record "Markup entry";
        intMov: Integer;
        intContar: Integer;
        Text0002: Label '%1 records have been processed';
        rstConcept: Record "Meta4 concept";
    begin
        if Confirm(Text0001) then begin

            Clear(rstMovEmpDef);
            intMov := 0;
            intContar := 0;
            if rstMovEmpDef.FindLast then
                intMov := rstMovEmpDef."Entry no."
            else
                intMov := 1;

            if t_rstTemp.FindSet(false) then
                repeat

                    if t_rstTemp.Records <> '' then begin

                        if t_rstTemp.Quantity = 0 then
                            Error(Error0001, t_rstTemp."File no." + ' - ' + t_rstTemp.Name, t_rstTemp."Start date and time");

                        Clear(rstMarcajesApl);
                        rstMarcajesApl.SetFilter(rstMarcajesApl."Entry no.", t_rstTemp.Records);
                        rstMarcajesApl.ModifyAll(Applied, true);
                        intMov += 1;
                        intContar += 1;
                        Clear(rstMovEmpDef);
                        rstMovEmpDef.Init;
                        rstMovEmpDef.TransferFields(t_rstTemp);
                        rstMovEmpDef."Entry no." := intMov;
                        Clear(rstConcept);
                        if rstConcept.Get(rstMovEmpDef."Event code") then
                            rstMovEmpDef."News code" := rstConcept."Meta4 concept";
                        Evaluate(rstMovEmpDef."Start record", CopyStr(t_rstTemp.Records, 1, StrPos(t_rstTemp.Records, '|') - 1));
                        Evaluate(rstMovEmpDef."Finish record", CopyStr(t_rstTemp.Records, StrPos(t_rstTemp.Records, '|') + 1, 20));
                        rstMovEmpDef.Insert;

                    end;

                until t_rstTemp.Next = 0;

            if intContar <> 0 then begin

                Message(Text0002, Format(intContar));
                t_rstTemp.DeleteAll;

            end;

        end;
    end;

    [Scope('OnPrem')]
    procedure fntInsertarAusentismo(var t_rstTemp: Record "Employee entry" temporary)
    begin
        Clear(rstMovEmp);
        t_rstTemp.Init;
        intContados += 1;
        t_rstTemp."Entry no." := intContados;
        t_rstTemp."Company no." := 1;
        t_rstTemp."File no." := rstEmployee."No.";
        t_rstTemp.Name := rstEmployee.Name;
        t_rstTemp."Hiring date" := rstEmployee."pat_Fecha ingreso laboral";
        t_rstTemp."Event code" := t_rstMarcajes."Event code";
        t_rstTemp."Start date and time" := t_rstMarcajes."Markup date and time";
        t_rstTemp."Finish date and time" := t_rstMarcajes."Markup date and time" +
                                                          (rstConceptos."Hours per unit" * 60 * 60 * 1000);
        t_rstTemp."Application date" := DT2Date(t_rstTemp."Start date and time");
        t_rstTemp."Import date" := CurrentDateTime;
        t_rstTemp.Quantity := (t_rstTemp."Finish date and time" -
                              t_rstTemp."Start date and time") / 1000 / 60 / 60;
        t_rstTemp."Quantity to distribute" := rstConceptos."Hours per unit";
        t_rstTemp.Records := Format(t_rstMarcajes."Entry no.") + '|' + Format(t_rstMarcajes."Entry no.");
        t_rstTemp."Start record" := t_rstMarcajes."Entry no.";
        t_rstTemp."Finish record" := t_rstMarcajes."Entry no.";
        t_rstTemp."Workday code" := t_rstMarcajes."Workday code";
        t_rstTemp."News code" := t_rstMarcajes."Event code";
        t_rstTemp."% time" := '0';
        t_rstTemp."User ID" := UserId;
        if t_rstTemp.Quantity <> 0 then
            t_rstTemp.Insert(false);

        t_rstMovFin.Get(t_rstMarcajes."Entry no.");
    end;

    [Scope('OnPrem')]
    procedure fntInsertarMovEmpleadoRestricto(var t_rstTemp: Record "Employee entry" temporary)
    var
        timInicio: Time;
        timFinal: Time;
        dtInicial: DateTime;
        rstSCal: Record "Shop Calendar";
        rstHCal: Record "Shop Calendar Holiday";
    begin
        decRedondeoSegundos := 0.001;
        //Calculo la cantidad de tiempo a distribuir por las distintas configuraciones de la jornada
        Clear(rstConceptos);
        if rstConceptos.Get(t_rstMarcajes."Event code") then begin

            if rstConceptos."Hours per unit" <> 1 then begin

                fntInsertarAusentismo(t_rstTemp);
                exit;

            end
            else begin

                if t_rstMarcajes."Event code" = t_rstMovFin."Event code" then begin

                    Clear(rstMovEmp);
                    t_rstTemp.Init;
                    intContados += 1;
                    t_rstTemp."Entry no." := intContados;
                    t_rstTemp."Company no." := 1;
                    t_rstTemp."File no." := rstEmployee."No.";
                    t_rstTemp.Name := rstEmployee.Name;
                    t_rstTemp."Hiring date" := rstEmployee."pat_Fecha ingreso laboral";
                    t_rstTemp."Event code" := t_rstMarcajes."Event code";
                    t_rstTemp."Start date and time" := t_rstMarcajes."Markup date and time";
                    t_rstTemp."Finish date and time" := t_rstMovFin."Markup date and time";
                    t_rstTemp."Application date" := DT2Date(t_rstTemp."Start date and time");
                    t_rstTemp."Import date" := CurrentDateTime;
                    t_rstTemp.Quantity := (t_rstTemp."Finish date and time" -
                                          t_rstTemp."Start date and time") / 1000 / 60 / 60;
                    //t_rstTemp."Quantity to distribute" := t_rstTemp.Quantity;
                    t_rstTemp."Quantity to distribute" := Round(t_rstTemp.Quantity, decRedondeoSegundos);
                    intCantARepartir -= Round(t_rstTemp.Quantity, decRedondeoSegundos);
                    intCantEstaRepartida := Round(t_rstTemp.Quantity, decRedondeoSegundos);
                    t_rstTemp.Records := Format(t_rstMarcajes."Entry no.") + '|' + Format(t_rstMovFin."Entry no.");
                    t_rstTemp."Start record" := t_rstMarcajes."Entry no.";
                    t_rstTemp."Finish record" := t_rstMovFin."Entry no.";
                    t_rstTemp."Workday code" := t_rstMovFin."Workday code";
                    t_rstTemp."News code" := t_rstMovFin."Event code";
                    t_rstTemp."User ID" := UserId;
                    t_rstTemp."% time" := t_rstMarcajes."% time";
                    if t_rstTemp.Quantity <> 0 then
                        t_rstTemp.Insert(false);

                    exit;

                end
                else begin

                    if t_rstMovFin."Markup date and time" <> 0DT then
                        intCantARepartir := Round((t_rstMovFin."Markup date and time" -
                                                  t_rstMarcajes."Markup date and time") / 1000 / 60 / 60, decRedondeoSegundos)
                    else
                        intCantARepartir := 0;

                end;

            end;

        end
        else begin

            if t_rstMovFin."Markup date and time" <> 0DT then
                intCantARepartir := Round((t_rstMovFin."Markup date and time" -
                                          t_rstMarcajes."Markup date and time") / 1000 / 60 / 60, decRedondeoSegundos)
            else
                intCantARepartir := 0;

        end;

        intCantRep := 0;
        intNivel := 0;

        //Inicializo la cantidad de tiempo ya repartida y almaceno nuevo valor a repartir
        intCantEstaRepartida := 0;
        intCantOrigARepartir := intCantARepartir;

        //CLEAR(t_rstTemp);
        t_rstTemp.SetRange("File no.", t_rstMarcajes."File no.");
        t_rstTemp.SetFilter(t_rstTemp."Start date and time", '>=%1', CreateDateTime(DT2Date(t_rstMarcajes."Markup date and time"), 0T));
        t_rstTemp.SetFilter(t_rstTemp."Finish date and time", '<=%1', CreateDateTime(DT2Date(t_rstMarcajes."Markup date and time"), 235959T));
        t_rstTemp.SetFilter(Records, '<>%1', '');
        //t_rstTemp.SETRANGE("Event code",t_rstTemp."Event code");
        if t_rstTemp.FindFirst then
            t_rstTemp.CalcSums(Quantity);
        intCantEstaRepartida := t_rstTemp.Quantity;

        intCantRep := t_rstTemp.Count;

        //intCantOrigARepartir += t_rstTemp.Quantity;

        intNivel += t_rstTemp.Count;

        //Guardo la fecha y hora de inicio de tareas
        dtInicial := t_rstMarcajes."Markup date and time";
        timInicio := DT2Time(t_rstMarcajes."Markup date and time");

        //Verificar contra el calendario
        Clear(rstSCal);
        Clear(rstHCal);

        rstSCal.Get(rstEmployee."Related shop calendar");

        rstHCal.SetRange("Shop Calendar Code", rstSCal.Code);
        rstHCal.SetRange(Date, DT2Date(t_rstMarcajes."Markup date and time"));
        if rstHCal.FindFirst then begin

            //Si encuentra una fecha cargada, es un feriado.

            Clear(rstJor);
            //Busco una configuración de jornada con un día de inicio anterior o igual al actual y un día de fin posterior o igual al actual
            //Lo mismo con el horario de inicio y de fin

            rstJor.SetRange("Workday code", rstEmployee."Workday code");
            rstJor.SetFilter("Starting day", '<=%1', Date2DWY(DT2Date(dtInicial), 1));
            rstJor.SetFilter("Ending day", '>=%1', Date2DWY(DT2Date(dtInicial), 1));
            rstJor.SetRange("Flexible o restricto", rstJor."Flexible o restricto"::Restricto);
            rstJor.SetRange("Additional percentage value", 100);
            rstJor.FindFirst;

            Clear(rstMovEmp);
            t_rstTemp.Init;
            intContados += 1;
            t_rstTemp."Entry no." := intContados;
            t_rstTemp."Company no." := 1;
            t_rstTemp."File no." := rstEmployee."No.";
            t_rstTemp.Name := rstEmployee.Name;
            t_rstTemp."Hiring date" := rstEmployee."pat_Fecha ingreso laboral";
            t_rstTemp."Event code" := rstJor."Meta4 code";
            t_rstTemp."Start date and time" := dtInicial;
            t_rstTemp."Finish date and time" := t_rstTemp."Start date and time" + Round(((intCantOrigARepartir) * 1000 * 60 * 60), decRedondeoSegundos);
            t_rstTemp."Application date" := DT2Date(t_rstTemp."Start date and time");
            t_rstTemp."Import date" := CurrentDateTime;
            t_rstTemp.Quantity := Round((t_rstTemp."Finish date and time" -
                                  t_rstTemp."Start date and time") / 1000 / 60 / 60, decRedondeoSegundos);
            t_rstTemp."Quantity to distribute" := intCantOrig;
            intCantARepartir := 0;
            intCantEstaRepartida := Round(t_rstTemp.Quantity, decRedondeoSegundos);
            t_rstTemp.Records := Format(t_rstMarcajes."Entry no.") + '|' + Format(t_rstMovFin."Entry no.");
            t_rstTemp."Workday code" := rstJor."Workday code";
            if rstHCal."Meta4 code" <> 0 then
                t_rstTemp."News code" := rstHCal."Meta4 code"
            else
                t_rstTemp."News code" := rstJor."Meta4 code";
            t_rstTemp."% time" := Format(rstJor."Additional percentage value");
            t_rstTemp."User ID" := UserId;
            t_rstTemp."Workday level" := rstJor.Nivel;
            t_rstTemp.Insert(false);

        end;

        //Si hay tiempo para repartir (siempre debería haber, sino es una incidencia), inicio el reparto
        if intCantARepartir <> 0 then
            repeat

                intNivel += 1;
                //Si la cantidad da más de 20 horas, asumo que faltó un marcaje, y voy directamente a insertar un movimiento de incidencia
                //Sino, sigo adelante
                Clear(rstJor2);
                rstJor2 := rstJor;
                Clear(rstJor);
                //Busco una configuración de jornada con un día de inicio anterior o igual al actual y un día de fin posterior o igual al actual
                //Lo mismo con el horario de inicio y de fin

                case rstEmployee."Flexible o restricto" of
                    rstEmployee."Flexible o restricto"::Restricto:
                        begin

                            rstJor.SetRange("Workday code", rstEmployee."Workday code");
                            rstJor.SetFilter("Starting day", '<=%1', Date2DWY(DT2Date(dtInicial), 1));
                            rstJor.SetFilter("Ending day", '>=%1', Date2DWY(DT2Date(dtInicial), 1));
                            rstJor.SetFilter("Starting time", '<=%1', DT2Time(dtInicial));
                            rstJor.SetFilter("Ending time", '>=%1', DT2Time(dtInicial));
                            rstJor.SetRange("Flexible o restricto", rstJor."Flexible o restricto"::Restricto);
                            rstJor.FindFirst;

                        end;

                end;

                //Si la cantidad de tiempo contemplada por la configuración de jornada es inferior a la cantidad a repartir, asumo
                //que el empleado trabajó en exceso de dicho tiempo y pasó a otra jornada; por consiguiente, voy rebajando la cantidad
                //a repartir a medido que inserto los correspondientes movimientos del empleado

                case rstJor."Flexible o restricto" of

                    rstJor."Flexible o restricto"::Restricto:
                        begin

                            if Round((rstJor."Ending time" - timInicio) / 1000 / 60 / 60, decRedondeoSegundos) < intCantARepartir then begin

                                Clear(rstMovEmp);
                                t_rstTemp.Init;
                                intContados += 1;
                                t_rstTemp."Entry no." := intContados;
                                t_rstTemp."Company no." := 1;
                                t_rstTemp."File no." := rstEmployee."No.";
                                t_rstTemp.Name := rstEmployee.Name;
                                t_rstTemp."Hiring date" := rstEmployee."pat_Fecha ingreso laboral";
                                t_rstTemp."Event code" := rstJor."Meta4 code";
                                t_rstTemp."Start date and time" := dtInicial;
                                t_rstTemp."Finish date and time" := CreateDateTime(DT2Date(dtInicial), rstJor."Ending time");
                                t_rstTemp."Application date" := DT2Date(t_rstTemp."Start date and time");
                                t_rstTemp."Import date" := CurrentDateTime;
                                t_rstTemp.Quantity := (t_rstTemp."Finish date and time" -
                                                      t_rstTemp."Start date and time") / 1000 / 60 / 60;
                                t_rstTemp."Quantity to distribute" := Round(intCantOrigARepartir, 0.5);
                                intCantARepartir -= Round(t_rstTemp.Quantity, decRedondeoSegundos);
                                intCantEstaRepartida := Round(t_rstTemp.Quantity, decRedondeoSegundos);
                                t_rstTemp.Records := Format(t_rstMarcajes."Entry no.") + '|' + Format(t_rstMovFin."Entry no.");
                                t_rstTemp."Start record" := t_rstMarcajes."Entry no.";
                                t_rstTemp."Finish record" := t_rstMovFin."Entry no.";

                                t_rstTemp."Workday code" := rstJor."Workday code";
                                t_rstTemp."News code" := rstJor."Meta4 code";
                                t_rstTemp."% time" := Format(rstJor."Additional percentage value");
                                t_rstTemp."User ID" := UserId;
                                if t_rstTemp.Quantity <> 0 then
                                    t_rstTemp.Insert(false);

                                //Aplico sobre la fecha y hora iniciales lo aplicado ya en esta vuelta, y repito el proceso hasta terminar la cantidad
                                //pendiente por repartir
                                //dtInicial := dtInicial+ROUND(((intCantEstaRepartida+decRedondeoSegundos)*1000*60*60),decRedondeoSegundos);
                                dtInicial := dtInicial + (intCantEstaRepartida + 0.01) * 1000 * 60 * 60;
                                timInicio := DT2Time(dtInicial);

                            end;

                            if Round((rstJor."Ending time" - timInicio) / 1000 / 60 / 60, decRedondeoSegundos) >= intCantARepartir then begin

                                Clear(rstMovEmp);
                                t_rstTemp.Init;
                                intContados += 1;
                                t_rstTemp."Entry no." := intContados;
                                t_rstTemp."Company no." := 1;
                                t_rstTemp."File no." := rstEmployee."No.";
                                t_rstTemp.Name := rstEmployee.Name;
                                t_rstTemp."Hiring date" := rstEmployee."pat_Fecha ingreso laboral";
                                t_rstTemp."Event code" := rstJor."Meta4 code";
                                t_rstTemp."Start date and time" := dtInicial;
                                t_rstTemp."Finish date and time" := t_rstTemp."Start date and time" + Round(intCantARepartir * 1000 * 60 * 60, decRedondeoSegundos);
                                t_rstTemp."Application date" := DT2Date(t_rstTemp."Start date and time");
                                t_rstTemp."Import date" := CurrentDateTime;
                                t_rstTemp.Quantity := (t_rstTemp."Finish date and time" -
                                                      t_rstTemp."Start date and time") / 1000 / 60 / 60;
                                t_rstTemp."Quantity to distribute" := intCantOrigARepartir;
                                intCantARepartir := 0;
                                intCantEstaRepartida := Round(t_rstTemp.Quantity, decRedondeoSegundos);
                                t_rstTemp.Records := Format(t_rstMarcajes."Entry no.") + '|' + Format(t_rstMovFin."Entry no.");
                                t_rstTemp."Start record" := t_rstMarcajes."Entry no.";
                                t_rstTemp."Finish record" := t_rstMovFin."Entry no.";
                                t_rstTemp."Workday code" := rstJor."Workday code";
                                t_rstTemp."% time" := Format(rstJor."Additional percentage value");
                                t_rstTemp."News code" := rstJor."Meta4 code";

                                t_rstTemp."User ID" := UserId;
                                if t_rstTemp.Quantity <> 0 then
                                    t_rstTemp.Insert(false);

                                //dtInicial := dtInicial+ROUND(((intCantEstaRepartida+decRedondeoSegundos)*1000*60*60),decRedondeoSegundos);
                                dtInicial := dtInicial + (intCantEstaRepartida + 0.01) * 1000 * 60 * 60;
                                timInicio := DT2Time(dtInicial);

                            end;

                        end;

                end;

            until intCantARepartir = 0
        else begin

            exit;
            //Si no hay cantidad para repartir, asumo una incidencia
            Clear(rstMovEmp);
            t_rstTemp.Init;
            intContados += 1;
            t_rstTemp."Entry no." := intContados;
            t_rstTemp."Company no." := 1;
            t_rstTemp."File no." := rstEmployee."No.";
            t_rstTemp.Name := rstEmployee.Name;
            t_rstTemp."Hiring date" := rstEmployee."pat_Fecha ingreso laboral";
            t_rstTemp."Event code" := rstJor."Meta4 code";
            t_rstTemp."Start date and time" := dtInicial;
            t_rstTemp."Finish date and time" := 0DT;
            t_rstTemp."Application date" := DT2Date(t_rstTemp."Start date and time");
            t_rstTemp."Import date" := t_rstMarcajes."Import date";
            t_rstTemp.Quantity := 0;
            t_rstTemp."Quantity to distribute" := intCantOrigARepartir;
            t_rstTemp.Records := Format(t_rstMarcajes."Entry no.") + '|' + Format(t_rstMovFin."Entry no.");
            t_rstTemp."Start record" := t_rstMarcajes."Entry no.";
            t_rstTemp."Finish record" := t_rstMovFin."Entry no.";
            t_rstTemp."Workday code" := rstJor."Workday code";
            t_rstTemp."News code" := rstJor."Meta4 code";
            t_rstTemp."% time" := Format(rstJor."Additional percentage value");
            t_rstTemp."User ID" := UserId;
            t_rstTemp.Insert(false);

        end;
    end;

    [Scope('OnPrem')]
    procedure fntInsertarMovEmpleadoFlexible(var t_rstTemp: Record "Employee entry" temporary)
    var
        timInicio: Time;
        timFinal: Time;
        dtInicial: DateTime;
        rstSCal: Record "Shop Calendar";
        rstHCal: Record "Shop Calendar Holiday";
    begin
        decRedondeoSegundos := 0.5;
        //Calculo la cantidad de tiempo a distribuir por las distintas configuraciones de la jornada
        Clear(rstConceptos);
        if rstConceptos.Get(t_rstMarcajes."Event code") then begin

            if rstConceptos."Hours per unit" <> 1 then begin

                fntInsertarAusentismo(t_rstTemp);
                exit;

            end
            else begin

                if t_rstMarcajes."Event code" = t_rstMovFin."Event code" then begin

                    Clear(rstMovEmp);
                    t_rstTemp.Init;
                    intContados += 1;
                    t_rstTemp."Entry no." := intContados;
                    t_rstTemp."Company no." := 1;
                    t_rstTemp."File no." := rstEmployee."No.";
                    t_rstTemp.Name := rstEmployee.Name;
                    t_rstTemp."Hiring date" := rstEmployee."pat_Fecha ingreso laboral";
                    t_rstTemp."Event code" := t_rstMarcajes."Event code";
                    t_rstTemp."Start date and time" := t_rstMarcajes."Markup date and time";
                    t_rstTemp."Finish date and time" := t_rstMovFin."Markup date and time";
                    t_rstTemp."Application date" := DT2Date(t_rstTemp."Start date and time");
                    t_rstTemp."Import date" := CurrentDateTime;
                    t_rstTemp.Quantity := (t_rstTemp."Finish date and time" -
                                          t_rstTemp."Start date and time") / 1000 / 60 / 60;
                    //t_rstTemp."Quantity to distribute" := t_rstTemp.Quantity;
                    t_rstTemp."Quantity to distribute" := Round(t_rstTemp.Quantity, 0.5);
                    intCantARepartir -= Round(t_rstTemp.Quantity, decRedondeoSegundos);
                    intCantEstaRepartida := Round(t_rstTemp.Quantity, decRedondeoSegundos);
                    t_rstTemp.Records := Format(t_rstMarcajes."Entry no.") + '|' + Format(t_rstMovFin."Entry no.");
                    t_rstTemp."Workday code" := t_rstMovFin."Workday code";
                    t_rstTemp."News code" := t_rstMovFin."Event code";
                    t_rstTemp."User ID" := UserId;
                    t_rstTemp."% time" := t_rstMarcajes."% time";
                    if t_rstTemp.Quantity <> 0 then
                        t_rstTemp.Insert(false);

                    exit;

                end
                else begin

                    if t_rstMovFin."Markup date and time" <> 0DT then
                        intCantARepartir := Round((t_rstMovFin."Markup date and time" -
                                                  t_rstMarcajes."Markup date and time") / 1000 / 60 / 60, 0.51)
                    else
                        intCantARepartir := 0;

                end;

            end;

        end
        else begin

            if t_rstMovFin."Markup date and time" <> 0DT then
                intCantARepartir := Round((t_rstMovFin."Markup date and time" -
                                          t_rstMarcajes."Markup date and time") / 1000 / 60 / 60, 0.5)
            else
                intCantARepartir := 0;

        end;

        intCantRep := 0;
        intNivel := 0;

        //Inicializo la cantidad de tiempo ya repartida y almaceno nuevo valor a repartir
        intCantEstaRepartida := 0;
        intCantOrigARepartir := intCantARepartir;

        //CLEAR(t_rstTemp);
        t_rstTemp.Reset;
        t_rstTemp.SetRange("File no.", t_rstMarcajes."File no.");
        t_rstTemp.SetFilter(Records, '<>%1', '');
        //t_rstTemp.SETRANGE("Event code",t_rstTemp."Event code");
        if t_rstTemp.Find('-') then
            repeat

                if (t_rstTemp."Start date and time" >= CreateDateTime(DT2Date(t_rstMarcajes."Markup date and time"), 0T)) and
                   (t_rstTemp."Start date and time" <= CreateDateTime(DT2Date(t_rstMarcajes."Markup date and time"), 235959T)) and
                   (t_rstTemp."Finish date and time" >= CreateDateTime(DT2Date(t_rstMarcajes."Markup date and time"), 0T)) and
                   (t_rstTemp."Finish date and time" <= CreateDateTime(DT2Date(t_rstMarcajes."Markup date and time"), 235959T)) then begin

                    intCantEstaRepartida += t_rstTemp.Quantity;
                    intCantRep += 1;

                end;

            until t_rstTemp.Next = 0;

        //Guardo la fecha y hora de inicio de tareas
        dtInicial := t_rstMarcajes."Markup date and time";
        timInicio := DT2Time(t_rstMarcajes."Markup date and time");

        intCantOrig := 0;
        intCantOrig := intCantOrigARepartir;

        //Guardo la fecha y hora de inicio de tareas
        dtInicial := t_rstMarcajes."Markup date and time";
        timInicio := DT2Time(t_rstMarcajes."Markup date and time");

        //Verificar contra el calendario
        Clear(rstSCal);
        Clear(rstHCal);

        rstSCal.Get(rstEmployee."Related shop calendar");

        rstHCal.SetRange("Shop Calendar Code", rstSCal.Code);
        rstHCal.SetRange(Date, DT2Date(t_rstMarcajes."Markup date and time"));
        if rstHCal.FindFirst then begin

            //Si encuentra una fecha cargada, es un feriado.

            Clear(rstJor);
            //Busco una configuración de jornada con un día de inicio anterior o igual al actual y un día de fin posterior o igual al actual
            //Lo mismo con el horario de inicio y de fin

            rstJor.SetRange("Workday code", rstEmployee."Workday code");
            rstJor.SetFilter("Starting day", '<=%1', Date2DWY(DT2Date(dtInicial), 1));
            rstJor.SetFilter("Ending day", '>=%1', Date2DWY(DT2Date(dtInicial), 1));
            rstJor.SetRange("Flexible o restricto", rstJor."Flexible o restricto"::Flexible);
            rstJor.SetRange("Additional percentage value", 100);
            rstJor.FindFirst;

            Clear(rstMovEmp);
            t_rstTemp.Init;
            intContados += 1;
            t_rstTemp."Entry no." := intContados;
            t_rstTemp."Company no." := 1;
            t_rstTemp."File no." := rstEmployee."No.";
            t_rstTemp.Name := rstEmployee.Name;
            t_rstTemp."Hiring date" := rstEmployee."pat_Fecha ingreso laboral";
            t_rstTemp."Event code" := rstJor."Meta4 code";
            t_rstTemp."Start date and time" := dtInicial;
            t_rstTemp."Finish date and time" := t_rstTemp."Start date and time" + Round(((intCantOrigARepartir) * 1000 * 60 * 60), decRedondeoSegundos);
            t_rstTemp."Application date" := DT2Date(t_rstTemp."Start date and time");
            t_rstTemp."Import date" := CurrentDateTime;
            t_rstTemp.Quantity := Round((t_rstTemp."Finish date and time" -
                                  t_rstTemp."Start date and time") / 1000 / 60 / 60, decRedondeoSegundos);
            t_rstTemp."Quantity to distribute" := intCantOrig;
            intCantARepartir := 0;
            intCantEstaRepartida := Round(t_rstTemp.Quantity, decRedondeoSegundos);
            t_rstTemp.Records := Format(t_rstMarcajes."Entry no.") + '|' + Format(t_rstMovFin."Entry no.");
            t_rstTemp."Workday code" := rstJor."Workday code";
            if rstHCal."Meta4 code" <> 0 then
                t_rstTemp."News code" := rstHCal."Meta4 code"
            else
                t_rstTemp."News code" := rstJor."Meta4 code";
            t_rstTemp."% time" := Format(rstJor."Additional percentage value");
            t_rstTemp."User ID" := UserId;
            t_rstTemp."Workday level" := rstJor.Nivel;
            t_rstTemp.Insert(false);

        end;

        //Si hay tiempo para repartir (siempre debería haber, sino es una incidencia), inicio el reparto
        if intCantARepartir <> 0 then
            repeat

                intCantEstaRepartida := 0;

                t_rstTemp.Reset;
                t_rstTemp.SetRange("File no.", t_rstMarcajes."File no.");
                t_rstTemp.SetFilter(Records, '<>%1', '');
                //t_rstTemp.SETRANGE("Event code",t_rstTemp."Event code");
                if t_rstTemp.Find('-') then
                    repeat

                        if (t_rstTemp."Start date and time" >= CreateDateTime(DT2Date(t_rstMarcajes."Markup date and time"), 0T)) and
                           (t_rstTemp."Start date and time" <= CreateDateTime(DT2Date(t_rstMarcajes."Markup date and time"), 235959T)) and
                           (t_rstTemp."Finish date and time" >= CreateDateTime(DT2Date(t_rstMarcajes."Markup date and time"), 0T)) and
                           (t_rstTemp."Finish date and time" <= CreateDateTime(DT2Date(t_rstMarcajes."Markup date and time"), 235959T)) then begin

                            intCantEstaRepartida += t_rstTemp.Quantity;

                        end;

                    until t_rstTemp.Next = 0;

                if intCantRep <> 0 then begin

                    Clear(rstJor);
                    rstJor.SetRange("Workday code", rstEmployee."Workday code");
                    rstJor.SetFilter("Starting day", '<=%1', Date2DWY(DT2Date(dtInicial), 1));
                    rstJor.SetFilter("Ending day", '>=%1', Date2DWY(DT2Date(dtInicial), 1));
                    rstJor.SetRange("Flexible o restricto", rstJor."Flexible o restricto"::Flexible);
                    /*    IF intNivel > rstJor.COUNT THEN
                          intNivel := rstJor.COUNT;
                      */

                    intNivel := fntCalcularNivel(intCantEstaRepartida, dtInicial, t_rstTemp);

                    if intNivel = 0 then
                        intNivel += 1;

                    //rstJor.SETRANGE(Nivel,intNivel);
                    if rstJor.FindSet then
                        repeat

                            if rstJor."Cantidad horas" - intCantEstaRepartida > 0 then begin

                                if intCantARepartir > rstJor."Cantidad horas" - intCantEstaRepartida then begin

                                    intCantOrigARepartir := intCantARepartir;
                                    intCantARepartir := rstJor."Cantidad horas" - intCantEstaRepartida;
                                    intCantEstaRepartida := 0;

                                end
                                else begin

                                    intCantEstaRepartida := 0;
                                    //          intNivel += 1;

                                end;

                            end
                            else begin

                                if rstJor."Cantidad horas" - intCantEstaRepartida < 0 then begin

                                    intCantARepartir := intCantEstaRepartida - rstJor."Cantidad horas";
                                    intCantEstaRepartida := 0;
                                    //          intNivel += 1;

                                end
                                else begin

                                    //rstJor.NEXT;
                                    //intCantARepartir := intCantEstaRepartida- rstJor."Cantidad horas";
                                    intCantEstaRepartida := intCantOrigARepartir;

                                end;

                            end;

                        until (rstJor.Next = 0) or (intCantEstaRepartida = 0);

                end;

                if intCantRep = 0 then
                    intNivel += 1;
                //Si la cantidad da más de 20 horas, asumo que faltó un marcaje, y voy directamente a insertar un movimiento de incidencia
                //Sino, sigo adelante
                Clear(rstJor2);
                rstJor2 := rstJor;
                Clear(rstJor);
                //Busco una configuración de jornada con un día de inicio anterior o igual al actual y un día de fin posterior o igual al actual
                //Lo mismo con el horario de inicio y de fin

                rstJor.SetRange("Workday code", rstEmployee."Workday code");
                rstJor.SetFilter("Starting day", '<=%1', Date2DWY(DT2Date(dtInicial), 1));
                rstJor.SetFilter("Ending day", '>=%1', Date2DWY(DT2Date(dtInicial), 1));
                rstJor.SetRange("Flexible o restricto", rstJor."Flexible o restricto"::Flexible);
                if intNivel > rstJor.Count then
                    intNivel := rstJor.Count;

                rstJor.SetRange(Nivel, intNivel);
                rstJor.FindFirst;

                //Si la cantidad de tiempo contemplada por la configuración de jornada es inferior a la cantidad a repartir, asumo
                //que el empleado trabajó en exceso de dicho tiempo y pasó a otra jornada; por consiguiente, voy rebajando la cantidad
                //a repartir a medido que inserto los correspondientes movimientos del empleado

                if Round(rstJor."Cantidad horas", decRedondeoSegundos) < intCantARepartir then begin

                    Clear(rstMovEmp);
                    t_rstTemp.Init;
                    intContados += 1;
                    t_rstTemp."Entry no." := intContados;
                    t_rstTemp."Company no." := 1;
                    t_rstTemp."File no." := rstEmployee."No.";
                    t_rstTemp.Name := rstEmployee.Name;
                    t_rstTemp."Hiring date" := rstEmployee."pat_Fecha ingreso laboral";
                    t_rstTemp."Event code" := rstJor."Meta4 code";
                    t_rstTemp."Start date and time" := dtInicial;
                    t_rstTemp."Finish date and time" := t_rstTemp."Start date and time" + Round(rstJor."Cantidad horas" * 1000 * 60 * 60, decRedondeoSegundos);
                    t_rstTemp."Application date" := DT2Date(t_rstTemp."Start date and time");
                    t_rstTemp."Import date" := CurrentDateTime;
                    t_rstTemp.Quantity := (t_rstTemp."Finish date and time" -
                                          t_rstTemp."Start date and time") / 1000 / 60 / 60;
                    t_rstTemp."Quantity to distribute" := intCantOrig;
                    intCantARepartir -= Round(t_rstTemp.Quantity, decRedondeoSegundos);
                    intCantEstaRepartida := Round(t_rstTemp.Quantity, decRedondeoSegundos);
                    t_rstTemp.Records := Format(t_rstMarcajes."Entry no.") + '|' + Format(t_rstMovFin."Entry no.");
                    t_rstTemp."Workday code" := rstJor."Workday code";
                    t_rstTemp."News code" := rstJor."Meta4 code";
                    t_rstTemp."% time" := Format(rstJor."Additional percentage value");
                    t_rstTemp."User ID" := UserId;
                    t_rstTemp.Insert(false);
                    if t_rstTemp.Quantity <> 0 then
                        rstJor.Next;

                    if (intCantOrigARepartir <> 0) and (intCantOrigARepartir <> intCantEstaRepartida) then
                        intCantARepartir := intCantOrigARepartir - intCantEstaRepartida;
                    intCantOrigARepartir -= intCantOrigARepartir;


                    //Aplico sobre la fecha y hora iniciales lo aplicado ya en esta vuelta, y repito el proceso hasta terminar la cantidad
                    //pendiente por repartir
                    //dtInicial := dtInicial+ROUND(((intCantEstaRepartida+decRedondeoSegundos)*1000*60*60),decRedondeoSegundos);
                    dtInicial := dtInicial + (intCantEstaRepartida + 0.01) * 1000 * 60 * 60;
                    timInicio := DT2Time(dtInicial);

                end
                else begin

                    //Si la cantidad de tiempo contemplada es superior o igual a la cantidad a repartir, aplico directamente, asumiendo que trabaj
                    //dentro del horario demarcado por su configuración de jornada
                    if Round(rstJor."Cantidad horas", decRedondeoSegundos) >= intCantARepartir then begin

                        Clear(rstMovEmp);
                        t_rstTemp.Init;
                        intContados += 1;
                        t_rstTemp."Entry no." := intContados;
                        t_rstTemp."Company no." := 1;
                        t_rstTemp."File no." := rstEmployee."No.";
                        t_rstTemp.Name := rstEmployee.Name;
                        t_rstTemp."Hiring date" := rstEmployee."pat_Fecha ingreso laboral";
                        t_rstTemp."Event code" := rstJor."Meta4 code";
                        t_rstTemp."Start date and time" := dtInicial;
                        t_rstTemp."Finish date and time" := t_rstTemp."Start date and time" + Round(intCantARepartir * 1000 * 60 * 60, decRedondeoSegundos);
                        t_rstTemp."Application date" := DT2Date(t_rstTemp."Start date and time");
                        t_rstTemp."Import date" := CurrentDateTime;
                        t_rstTemp.Quantity := (t_rstTemp."Finish date and time" -
                                              t_rstTemp."Start date and time") / 1000 / 60 / 60;
                        t_rstTemp."Quantity to distribute" := intCantOrig;
                        intCantARepartir := 0;
                        intCantEstaRepartida := Round(t_rstTemp.Quantity, decRedondeoSegundos);
                        t_rstTemp.Records := Format(t_rstMarcajes."Entry no.") + '|' + Format(t_rstMovFin."Entry no.");
                        t_rstTemp."Workday code" := rstJor."Workday code";
                        t_rstTemp."% time" := Format(rstJor."Additional percentage value");
                        t_rstTemp."News code" := rstJor."Meta4 code";
                        t_rstTemp."User ID" := UserId;
                        if t_rstTemp.Quantity <> 0 then
                            t_rstTemp.Insert(false);
                        rstJor.Next;

                        if (intCantOrigARepartir <> 0) and (intCantOrigARepartir <> intCantEstaRepartida) then
                            intCantARepartir := intCantOrigARepartir - intCantEstaRepartida;
                        intCantOrigARepartir -= intCantOrigARepartir;

                        //dtInicial := dtInicial+ROUND(((intCantEstaRepartida+decRedondeoSegundos)*1000*60*60),decRedondeoSegundos);
                        dtInicial := dtInicial + (intCantEstaRepartida + 0.01) * 1000 * 60 * 60;
                        timInicio := DT2Time(dtInicial);

                    end;

                end;

            until (intCantARepartir = 0)
        else begin

            //Si no hay cantidad para repartir, asumo una incidencia
            Clear(rstMovEmp);
            t_rstTemp.Init;
            intContados += 1;
            t_rstTemp."Entry no." := intContados;
            t_rstTemp."Company no." := 1;
            t_rstTemp."File no." := rstEmployee."No.";
            t_rstTemp.Name := rstEmployee.Name;
            t_rstTemp."Hiring date" := rstEmployee."pat_Fecha ingreso laboral";
            t_rstTemp."Event code" := rstJor."Meta4 code";
            t_rstTemp."Start date and time" := dtInicial;
            t_rstTemp."Finish date and time" := 0DT;
            t_rstTemp."Application date" := DT2Date(t_rstTemp."Start date and time");
            t_rstTemp."Import date" := t_rstMarcajes."Import date";
            t_rstTemp.Quantity := 0;
            t_rstTemp."Quantity to distribute" := intCantOrig;
            t_rstTemp.Records := Format(t_rstMarcajes."Entry no.") + '|' + Format(t_rstMovFin."Entry no.");
            t_rstTemp."Workday code" := rstJor."Workday code";
            t_rstTemp."News code" := rstJor."Meta4 code";
            t_rstTemp."% time" := Format(rstJor."Additional percentage value");
            t_rstTemp."User ID" := UserId;
            t_rstTemp.Insert(false);

        end;

    end;

    [Scope('OnPrem')]
    procedure fntInsertarMovEmpleadoMixto(var t_rstTemp: Record "Employee entry" temporary)
    var
        timInicio: Time;
        timFinal: Time;
        dtInicial: DateTime;
        rstSCal: Record "Shop Calendar";
        rstHCal: Record "Shop Calendar Holiday";
    begin
        decRedondeoSegundos := 0.5;
        //Calculo la cantidad de tiempo a distribuir por las distintas configuraciones de la jornada
        Clear(rstConceptos);
        if rstConceptos.Get(t_rstMarcajes."Event code") then begin

            if rstConceptos."Hours per unit" <> 1 then begin

                fntInsertarAusentismo(t_rstTemp);
                exit;

            end
            else begin

                if t_rstMarcajes."Event code" = t_rstMovFin."Event code" then begin

                    Clear(rstMovEmp);
                    t_rstTemp.Init;
                    intContados += 1;
                    t_rstTemp."Entry no." := intContados;
                    t_rstTemp."Company no." := 1;
                    t_rstTemp."File no." := rstEmployee."No.";
                    t_rstTemp.Name := rstEmployee.Name;
                    t_rstTemp."Hiring date" := rstEmployee."pat_Fecha ingreso laboral";
                    t_rstTemp."Event code" := t_rstMarcajes."Event code";
                    t_rstTemp."Start date and time" := t_rstMarcajes."Markup date and time";
                    t_rstTemp."Finish date and time" := t_rstMovFin."Markup date and time";
                    t_rstTemp."Application date" := DT2Date(t_rstTemp."Start date and time");
                    t_rstTemp."Import date" := CurrentDateTime;
                    t_rstTemp.Quantity := Round((t_rstTemp."Finish date and time" -
                                          t_rstTemp."Start date and time") / 1000 / 60 / 60, decRedondeoSegundos);
                    //t_rstTemp."Quantity to distribute" := t_rstTemp.Quantity;
                    t_rstTemp."Quantity to distribute" := Round(t_rstTemp.Quantity, 0.5);
                    intCantARepartir -= Round(t_rstTemp.Quantity, decRedondeoSegundos);
                    intCantEstaRepartida := Round(t_rstTemp.Quantity, decRedondeoSegundos);
                    t_rstTemp.Records := Format(t_rstMarcajes."Entry no.") + '|' + Format(t_rstMovFin."Entry no.");
                    t_rstTemp."Workday code" := t_rstMovFin."Workday code";
                    t_rstTemp."News code" := t_rstMovFin."Event code";
                    t_rstTemp."User ID" := UserId;
                    t_rstTemp."% time" := t_rstMarcajes."% time";
                    t_rstTemp."Workday level" := t_rstMarcajes."Workday level";
                    t_rstTemp.Insert(false);

                    exit;

                end
                else begin

                    if t_rstMovFin."Markup date and time" <> 0DT then
                        intCantARepartir := Round((t_rstMovFin."Markup date and time" -
                                                  t_rstMarcajes."Markup date and time") / 1000 / 60 / 60, 0.51)
                    else
                        intCantARepartir := 0;

                end;

            end;

        end
        else begin

            if t_rstMovFin."Markup date and time" <> 0DT then
                intCantARepartir := Round((t_rstMovFin."Markup date and time" -
                                          t_rstMarcajes."Markup date and time") / 1000 / 60 / 60, 0.5)
            else
                intCantARepartir := 0;

        end;

        intCantRep := 0;
        intNivel := 0;

        //Inicializo la cantidad de tiempo ya repartida y almaceno nuevo valor a repartir
        intCantEstaRepartida := 0;
        intCantOrigARepartir := intCantARepartir;

        //CLEAR(t_rstTemp);
        t_rstTemp.Reset;
        t_rstTemp.SetRange("File no.", t_rstMarcajes."File no.");
        t_rstTemp.SetFilter(Records, '<>%1', '');
        //t_rstTemp.SETRANGE("Event code",t_rstTemp."Event code");
        if t_rstTemp.Find('-') then
            repeat

                if (t_rstTemp."Start date and time" >= CreateDateTime(DT2Date(t_rstMarcajes."Markup date and time"), 0T)) and
                   (t_rstTemp."Start date and time" <= CreateDateTime(DT2Date(t_rstMarcajes."Markup date and time"), 235959T)) and
                   (t_rstTemp."Finish date and time" >= CreateDateTime(DT2Date(t_rstMarcajes."Markup date and time"), 0T)) and
                   (t_rstTemp."Finish date and time" <= CreateDateTime(DT2Date(t_rstMarcajes."Markup date and time"), 235959T)) then begin

                    intCantEstaRepartida += t_rstTemp.Quantity;
                    intCantRep += 1;

                end;

            until t_rstTemp.Next = 0;

        //Guardo la fecha y hora de inicio de tareas
        dtInicial := t_rstMarcajes."Markup date and time";
        timInicio := DT2Time(t_rstMarcajes."Markup date and time");
        intCantOrig := 0;
        intCantOrig := intCantOrigARepartir;

        //Guardo la fecha y hora de inicio de tareas
        dtInicial := t_rstMarcajes."Markup date and time";
        timInicio := DT2Time(t_rstMarcajes."Markup date and time");

        //Verificar contra el calendario
        Clear(rstSCal);
        Clear(rstHCal);

        rstSCal.Get(rstEmployee."Related shop calendar");

        rstHCal.SetRange("Shop Calendar Code", rstSCal.Code);
        rstHCal.SetRange(Date, DT2Date(t_rstMarcajes."Markup date and time"));
        if rstHCal.FindFirst then begin

            //Si encuentra una fecha cargada, es un feriado.

            Clear(rstJor);
            //Busco una configuración de jornada con un día de inicio anterior o igual al actual y un día de fin posterior o igual al actual
            //Lo mismo con el horario de inicio y de fin

            rstJor.SetRange("Workday code", rstEmployee."Workday code");
            rstJor.SetFilter("Starting day", '<=%1', Date2DWY(DT2Date(dtInicial), 1));
            rstJor.SetFilter("Ending day", '>=%1', Date2DWY(DT2Date(dtInicial), 1));
            rstJor.SetRange("Flexible o restricto", rstJor."Flexible o restricto"::Mixto);
            rstJor.SetRange("Additional percentage value", 100);
            rstJor.FindFirst;

            Clear(rstMovEmp);
            t_rstTemp.Init;
            intContados += 1;
            t_rstTemp."Entry no." := intContados;
            t_rstTemp."Company no." := 1;
            t_rstTemp."File no." := rstEmployee."No.";
            t_rstTemp.Name := rstEmployee.Name;
            t_rstTemp."Hiring date" := rstEmployee."pat_Fecha ingreso laboral";
            t_rstTemp."Event code" := rstJor."Meta4 code";
            t_rstTemp."Start date and time" := dtInicial;
            t_rstTemp."Finish date and time" := t_rstTemp."Start date and time" + Round(((intCantOrigARepartir) * 1000 * 60 * 60), decRedondeoSegundos);
            t_rstTemp."Application date" := DT2Date(t_rstTemp."Start date and time");
            t_rstTemp."Import date" := CurrentDateTime;
            t_rstTemp.Quantity := Round((t_rstTemp."Finish date and time" -
                                  t_rstTemp."Start date and time") / 1000 / 60 / 60, decRedondeoSegundos);
            t_rstTemp."Quantity to distribute" := intCantOrig;
            intCantARepartir := 0;
            intCantEstaRepartida := Round(t_rstTemp.Quantity, decRedondeoSegundos);
            t_rstTemp.Records := Format(t_rstMarcajes."Entry no.") + '|' + Format(t_rstMovFin."Entry no.");
            t_rstTemp."Workday code" := rstJor."Workday code";
            if rstHCal."Meta4 code" <> 0 then
                t_rstTemp."News code" := rstHCal."Meta4 code"
            else
                t_rstTemp."News code" := rstJor."Meta4 code";
            t_rstTemp."% time" := Format(rstJor."Additional percentage value");
            t_rstTemp."User ID" := UserId;
            t_rstTemp."Workday level" := rstJor.Nivel;
            t_rstTemp.Insert(false);

        end;

        //Si hay tiempo para repartir (siempre debería haber, sino es una incidencia), inicio el reparto
        if intCantARepartir <> 0 then
            repeat

                intCantEstaRepartida := 0;

                t_rstTemp.Reset;
                t_rstTemp.SetRange("File no.", t_rstMarcajes."File no.");
                t_rstTemp.SetFilter(Records, '<>%1', '');
                //t_rstTemp.SETRANGE("Event code",t_rstTemp."Event code");
                if t_rstTemp.Find('-') then
                    repeat

                        if (t_rstTemp."Start date and time" >= CreateDateTime(DT2Date(t_rstMarcajes."Markup date and time"), 0T)) and
                           (t_rstTemp."Start date and time" <= CreateDateTime(DT2Date(t_rstMarcajes."Markup date and time"), 235959T)) and
                           (t_rstTemp."Finish date and time" >= CreateDateTime(DT2Date(t_rstMarcajes."Markup date and time"), 0T)) and
                           (t_rstTemp."Finish date and time" <= CreateDateTime(DT2Date(t_rstMarcajes."Markup date and time"), 235959T)) then begin

                            intCantEstaRepartida += t_rstTemp.Quantity;

                        end;

                    until t_rstTemp.Next = 0;

                //Si la cantidad da más de 20 horas, asumo que faltó un marcaje, y voy directamente a insertar un movimiento de incidencia
                //Sino, sigo adelante
                intNivel += 1;
                Clear(rstJor2);
                rstJor2 := rstJor;
                Clear(rstJor);
                //Busco una configuración de jornada con un día de inicio anterior o igual al actual y un día de fin posterior o igual al actual
                //Lo mismo con el horario de inicio y de fin

                rstJor.SetRange("Workday code", rstEmployee."Workday code");
                rstJor.SetFilter("Starting day", '<=%1', Date2DWY(DT2Date(dtInicial), 1));
                rstJor.SetFilter("Ending day", '>=%1', Date2DWY(DT2Date(dtInicial), 1));
                rstJor.SetRange("Flexible o restricto", rstJor."Flexible o restricto"::Mixto);
                if intNivel > rstJor.Count then
                    intNivel := rstJor.Count;

                rstJor.SetRange(Nivel, intNivel);
                rstJor.FindFirst;

                //Si la cantidad de tiempo contemplada por la configuración de jornada es inferior a la cantidad a repartir, asumo
                //que el empleado trabajó en exceso de dicho tiempo y pasó a otra jornada; por consiguiente, voy rebajando la cantidad
                //a repartir a medido que inserto los correspondientes movimientos del empleado

                //Si la jornada empieza o termina en cierta hora fija
                if rstJor."Cantidad horas" = 0 then begin

                    //Si la configuración de jornada tiene hora de finalización
                    if (rstJor."Ending time" <> 0T) then begin

                        if rstJor."Ending time" >= DT2Time(dtInicial + Round(((intCantARepartir) * 1000 * 60 * 60), decRedondeoSegundos)) then begin

                            if DT2Time(t_rstMovFin."Markup date and time") >= DT2Time(dtInicial + Round(((intCantARepartir) * 1000 * 60 * 60), decRedondeoSegundos)) then begin

                                Clear(rstMovEmp);
                                t_rstTemp.Init;
                                intContados += 1;
                                t_rstTemp."Entry no." := intContados;
                                t_rstTemp."Company no." := 1;
                                t_rstTemp."File no." := rstEmployee."No.";
                                t_rstTemp.Name := rstEmployee.Name;
                                t_rstTemp."Hiring date" := rstEmployee."pat_Fecha ingreso laboral";
                                t_rstTemp."Event code" := rstJor."Meta4 code";
                                t_rstTemp."Start date and time" := dtInicial;
                                t_rstTemp."Finish date and time" := t_rstTemp."Start date and time" + Round(((intCantARepartir) * 1000 * 60 * 60), decRedondeoSegundos);
                                t_rstTemp."Application date" := DT2Date(t_rstTemp."Start date and time");
                                t_rstTemp."Import date" := CurrentDateTime;
                                t_rstTemp.Quantity := Round((t_rstTemp."Finish date and time" -
                                                      t_rstTemp."Start date and time") / 1000 / 60 / 60, decRedondeoSegundos);
                                t_rstTemp."Quantity to distribute" := intCantOrig;
                                intCantARepartir -= Round(t_rstTemp.Quantity, decRedondeoSegundos);
                                intCantEstaRepartida := Round(t_rstTemp.Quantity, decRedondeoSegundos);
                                t_rstTemp.Records := Format(t_rstMarcajes."Entry no.") + '|' + Format(t_rstMovFin."Entry no.");
                                t_rstTemp."Workday code" := rstJor."Workday code";
                                t_rstTemp."News code" := rstJor."Meta4 code";
                                t_rstTemp."% time" := Format(rstJor."Additional percentage value");
                                t_rstTemp."User ID" := UserId;
                                t_rstTemp."Workday level" := rstJor.Nivel;
                                t_rstTemp.Insert(false);
                                rstJor.Next;

                                intCantARepartir := 0;
                                intCantOrigARepartir -= intCantARepartir;

                                //Aplico sobre la fecha y hora iniciales lo aplicado ya en esta vuelta, y repito el proceso hasta terminar la cantidad
                                //pendiente por repartir
                                //dtInicial := dtInicial+ROUND(((intCantEstaRepartida+decRedondeoSegundos)*1000*60*60),decRedondeoSegundos);
                                dtInicial := dtInicial + (intCantEstaRepartida + 0.01) * 1000 * 60 * 60;
                                timInicio := DT2Time(dtInicial);

                            end
                            else begin

                                Clear(rstMovEmp);
                                t_rstTemp.Init;
                                intContados += 1;
                                t_rstTemp."Entry no." := intContados;
                                t_rstTemp."Company no." := 1;
                                t_rstTemp."File no." := rstEmployee."No.";
                                t_rstTemp.Name := rstEmployee.Name;
                                t_rstTemp."Hiring date" := rstEmployee."pat_Fecha ingreso laboral";
                                t_rstTemp."Event code" := rstJor."Meta4 code";
                                t_rstTemp."Start date and time" := dtInicial;
                                t_rstTemp."Finish date and time" := t_rstMovFin."Markup date and time";
                                t_rstTemp."Application date" := DT2Date(t_rstTemp."Start date and time");
                                t_rstTemp."Import date" := CurrentDateTime;
                                t_rstTemp.Quantity := Round((t_rstTemp."Finish date and time" -
                                                      t_rstTemp."Start date and time") / 1000 / 60 / 60, decRedondeoSegundos);
                                t_rstTemp."Quantity to distribute" := intCantOrig;
                                intCantARepartir -= Round(t_rstTemp.Quantity, decRedondeoSegundos);
                                intCantEstaRepartida := Round(t_rstTemp.Quantity, decRedondeoSegundos);
                                t_rstTemp.Records := Format(t_rstMarcajes."Entry no.") + '|' + Format(t_rstMovFin."Entry no.");
                                t_rstTemp."Workday code" := rstJor."Workday code";
                                t_rstTemp."News code" := rstJor."Meta4 code";
                                t_rstTemp."% time" := Format(rstJor."Additional percentage value");
                                t_rstTemp."User ID" := UserId;
                                t_rstTemp."Workday level" := rstJor.Nivel;
                                t_rstTemp.Insert(false);
                                rstJor.Next;

                                intCantARepartir := 0;
                                intCantOrigARepartir -= intCantARepartir;

                                //Aplico sobre la fecha y hora iniciales lo aplicado ya en esta vuelta, y repito el proceso hasta terminar la cantidad
                                //pendiente por repartir
                                //dtInicial := dtInicial+ROUND(((intCantEstaRepartida+decRedondeoSegundos)*1000*60*60),decRedondeoSegundos);
                                dtInicial := dtInicial + (intCantEstaRepartida + 0.01) * 1000 * 60 * 60;
                                timInicio := DT2Time(dtInicial);

                            end;

                        end
                        else begin

                            //Si el marcaje inicial es posterior a la primera hora, pasar al siguiente nivel de jornada.
                            if DT2Time(dtInicial) <= rstJor."Ending time" then begin

                                Clear(rstMovEmp);
                                t_rstTemp.Init;
                                intContados += 1;
                                t_rstTemp."Entry no." := intContados;
                                t_rstTemp."Company no." := 1;
                                t_rstTemp."File no." := rstEmployee."No.";
                                t_rstTemp.Name := rstEmployee.Name;
                                t_rstTemp."Hiring date" := rstEmployee."pat_Fecha ingreso laboral";
                                t_rstTemp."Event code" := rstJor."Meta4 code";
                                t_rstTemp."Start date and time" := dtInicial;
                                t_rstTemp."Finish date and time" := CreateDateTime(DT2Date(dtInicial), rstJor."Ending time");
                                t_rstTemp."Application date" := DT2Date(t_rstTemp."Start date and time");
                                t_rstTemp."Import date" := CurrentDateTime;
                                t_rstTemp.Quantity := Round((t_rstTemp."Finish date and time" -
                                                      t_rstTemp."Start date and time") / 1000 / 60 / 60, decRedondeoSegundos);
                                t_rstTemp."Quantity to distribute" := intCantOrig;
                                intCantARepartir -= Round(t_rstTemp.Quantity, decRedondeoSegundos);
                                intCantEstaRepartida := Round(t_rstTemp.Quantity, decRedondeoSegundos);
                                t_rstTemp.Records := Format(t_rstMarcajes."Entry no.") + '|' + Format(t_rstMovFin."Entry no.");
                                t_rstTemp."Workday code" := rstJor."Workday code";
                                t_rstTemp."News code" := rstJor."Meta4 code";
                                t_rstTemp."% time" := Format(rstJor."Additional percentage value");
                                t_rstTemp."User ID" := UserId;
                                t_rstTemp."Workday level" := rstJor.Nivel;
                                if t_rstTemp.Quantity <> 0 then
                                    t_rstTemp.Insert(false);

                                rstJor.Next;

                                if (intCantOrigARepartir <> 0) and (intCantOrigARepartir <> intCantEstaRepartida) then
                                    intCantARepartir := intCantOrigARepartir - intCantEstaRepartida;
                                intCantOrigARepartir -= intCantOrigARepartir;

                                //Aplico sobre la fecha y hora iniciales lo aplicado ya en esta vuelta, y repito el proceso hasta terminar la cantidad
                                //pendiente por repartir
                                //dtInicial := dtInicial+ROUND(((intCantEstaRepartida+decRedondeoSegundos)*1000*60*60),decRedondeoSegundos);
                                dtInicial := dtInicial + (intCantEstaRepartida + 0.01) * 1000 * 60 * 60;
                                timInicio := DT2Time(dtInicial);

                            end
                            else
                                rstJor.Next;
                        end;

                    end
                    else begin

                        Clear(rstMovEmp);
                        t_rstTemp.Init;
                        intContados += 1;
                        t_rstTemp."Entry no." := intContados;
                        t_rstTemp."Company no." := 1;
                        t_rstTemp."File no." := rstEmployee."No.";
                        t_rstTemp.Name := rstEmployee.Name;
                        t_rstTemp."Hiring date" := rstEmployee."pat_Fecha ingreso laboral";
                        t_rstTemp."Event code" := rstJor."Meta4 code";
                        t_rstTemp."Start date and time" := CreateDateTime(DT2Date(dtInicial), rstJor."Starting time");
                        t_rstTemp."Finish date and time" := t_rstTemp."Start date and time" + Round(((intCantARepartir) * 1000 * 60 * 60), decRedondeoSegundos);
                        t_rstTemp."Application date" := DT2Date(t_rstTemp."Start date and time");
                        t_rstTemp."Import date" := CurrentDateTime;
                        t_rstTemp.Quantity := Round((t_rstTemp."Finish date and time" -
                                              t_rstTemp."Start date and time") / 1000 / 60 / 60, decRedondeoSegundos);
                        t_rstTemp."Quantity to distribute" := intCantOrig;
                        intCantARepartir -= Round(t_rstTemp.Quantity, decRedondeoSegundos);
                        intCantEstaRepartida := Round(t_rstTemp.Quantity, decRedondeoSegundos);
                        t_rstTemp.Records := Format(t_rstMarcajes."Entry no.") + '|' + Format(t_rstMovFin."Entry no.");
                        t_rstTemp."Workday code" := rstJor."Workday code";
                        t_rstTemp."News code" := rstJor."Meta4 code";
                        t_rstTemp."% time" := Format(rstJor."Additional percentage value");
                        t_rstTemp."User ID" := UserId;
                        t_rstTemp."Workday level" := rstJor.Nivel;
                        if t_rstTemp.Quantity <> 0 then
                            t_rstTemp.Insert(false);
                        rstJor.Next;

                        intCantARepartir := 0;
                        intCantOrigARepartir -= intCantARepartir;

                        //Aplico sobre la fecha y hora iniciales lo aplicado ya en esta vuelta, y repito el proceso hasta terminar la cantidad
                        //pendiente por repartir
                        //dtInicial := dtInicial+ROUND(((intCantEstaRepartida+decRedondeoSegundos)*1000*60*60),decRedondeoSegundos);
                        dtInicial := dtInicial + (intCantEstaRepartida + 0.01) * 1000 * 60 * 60;
                        timInicio := DT2Time(dtInicial);

                    end;

                end
                else begin

                    if Round(rstJor."Cantidad horas", decRedondeoSegundos) < intCantARepartir then begin

                        Clear(rstMovEmp);
                        t_rstTemp.Init;
                        intContados += 1;
                        t_rstTemp."Entry no." := intContados;
                        t_rstTemp."Company no." := 1;
                        t_rstTemp."File no." := rstEmployee."No.";
                        t_rstTemp.Name := rstEmployee.Name;
                        t_rstTemp."Hiring date" := rstEmployee."pat_Fecha ingreso laboral";
                        t_rstTemp."Event code" := rstJor."Meta4 code";
                        t_rstTemp."Start date and time" := dtInicial;
                        t_rstTemp."Finish date and time" := t_rstTemp."Start date and time" + Round(rstJor."Cantidad horas" * 1000 * 60 * 60, decRedondeoSegundos);
                        t_rstTemp."Application date" := DT2Date(t_rstTemp."Start date and time");
                        t_rstTemp."Import date" := CurrentDateTime;
                        t_rstTemp.Quantity := Round((t_rstTemp."Finish date and time" -
                                              t_rstTemp."Start date and time") / 1000 / 60 / 60, decRedondeoSegundos);
                        t_rstTemp."Quantity to distribute" := intCantOrig;
                        intCantARepartir -= Round(t_rstTemp.Quantity, decRedondeoSegundos);
                        intCantEstaRepartida := Round(t_rstTemp.Quantity, decRedondeoSegundos);
                        t_rstTemp.Records := Format(t_rstMarcajes."Entry no.") + '|' + Format(t_rstMovFin."Entry no.");
                        t_rstTemp."Workday code" := rstJor."Workday code";
                        t_rstTemp."News code" := rstJor."Meta4 code";
                        t_rstTemp."% time" := Format(rstJor."Additional percentage value");
                        t_rstTemp."User ID" := UserId;
                        t_rstTemp."Workday level" := rstJor.Nivel;
                        if t_rstTemp.Quantity <> 0 then
                            t_rstTemp.Insert(false);
                        rstJor.Next;

                        if (intCantOrigARepartir <> 0) and (intCantOrigARepartir <> intCantEstaRepartida) then
                            intCantARepartir := intCantOrigARepartir - intCantEstaRepartida;
                        intCantOrigARepartir -= intCantOrigARepartir;

                        //Aplico sobre la fecha y hora iniciales lo aplicado ya en esta vuelta, y repito el proceso hasta terminar la cantidad
                        //pendiente por repartir
                        //dtInicial := dtInicial+ROUND(((intCantEstaRepartida+decRedondeoSegundos)*1000*60*60),decRedondeoSegundos);
                        dtInicial := dtInicial + (intCantEstaRepartida + 0.01) * 1000 * 60 * 60;
                        timInicio := DT2Time(dtInicial);

                    end
                    else begin

                        //Si la cantidad de tiempo contemplada es superior o igual a la cantidad a repartir, aplico directamente, asumiendo que trabaj
                        //dentro del horario demarcado por su configuración de jornada
                        if Round(rstJor."Cantidad horas", decRedondeoSegundos) >= intCantARepartir then begin

                            Clear(rstMovEmp);
                            t_rstTemp.Init;
                            intContados += 1;
                            t_rstTemp."Entry no." := intContados;
                            t_rstTemp."Company no." := 1;
                            t_rstTemp."File no." := rstEmployee."No.";
                            t_rstTemp.Name := rstEmployee.Name;
                            t_rstTemp."Hiring date" := rstEmployee."pat_Fecha ingreso laboral";
                            t_rstTemp."Event code" := rstJor."Meta4 code";
                            t_rstTemp."Start date and time" := dtInicial;
                            t_rstTemp."Finish date and time" := t_rstTemp."Start date and time" + Round(intCantARepartir * 1000 * 60 * 60, decRedondeoSegundos);
                            t_rstTemp."Application date" := DT2Date(t_rstTemp."Start date and time");
                            t_rstTemp."Import date" := CurrentDateTime;
                            t_rstTemp.Quantity := Round((t_rstTemp."Finish date and time" -
                                                  t_rstTemp."Start date and time") / 1000 / 60 / 60, decRedondeoSegundos);
                            t_rstTemp."Quantity to distribute" := intCantOrig;
                            intCantARepartir := 0;
                            intCantEstaRepartida := Round(t_rstTemp.Quantity, decRedondeoSegundos);
                            t_rstTemp.Records := Format(t_rstMarcajes."Entry no.") + '|' + Format(t_rstMovFin."Entry no.");
                            t_rstTemp."Workday code" := rstJor."Workday code";
                            t_rstTemp."% time" := Format(rstJor."Additional percentage value");
                            t_rstTemp."News code" := rstJor."Meta4 code";
                            t_rstTemp."User ID" := UserId;
                            t_rstTemp."Workday level" := rstJor.Nivel;
                            if t_rstTemp.Quantity <> 0 then
                                t_rstTemp.Insert(false);

                            if (intCantOrigARepartir <> 0) and (intCantOrigARepartir <> intCantEstaRepartida) then
                                intCantARepartir := intCantOrigARepartir - intCantEstaRepartida;
                            intCantOrigARepartir -= intCantOrigARepartir;

                            //dtInicial := dtInicial+ROUND(((intCantEstaRepartida+decRedondeoSegundos)*1000*60*60),decRedondeoSegundos);
                            dtInicial := dtInicial + (intCantEstaRepartida + 0.01) * 1000 * 60 * 60;
                            timInicio := DT2Time(dtInicial);

                        end
                        else
                            repeat

                                Clear(rstMovEmp);
                                t_rstTemp.Init;
                                intContados += 1;
                                t_rstTemp."Entry no." := intContados;
                                t_rstTemp."Company no." := 1;
                                t_rstTemp."File no." := rstEmployee."No.";
                                t_rstTemp.Name := rstEmployee.Name;
                                t_rstTemp."Hiring date" := rstEmployee."pat_Fecha ingreso laboral";
                                t_rstTemp."Event code" := rstJor."Meta4 code";
                                t_rstTemp."Start date and time" := dtInicial;
                                t_rstTemp."Finish date and time" := t_rstTemp."Start date and time" + Round(intCantARepartir * 1000 * 60 * 60, decRedondeoSegundos);
                                t_rstTemp."Application date" := DT2Date(t_rstTemp."Start date and time");
                                t_rstTemp."Import date" := CurrentDateTime;
                                t_rstTemp.Quantity := Round((t_rstTemp."Finish date and time" -
                                                      t_rstTemp."Start date and time") / 1000 / 60 / 60, decRedondeoSegundos);
                                t_rstTemp."Quantity to distribute" := intCantOrig;
                                intCantARepartir := 0;
                                intCantEstaRepartida := Round(t_rstTemp.Quantity, decRedondeoSegundos);
                                t_rstTemp.Records := Format(t_rstMarcajes."Entry no.") + '|' + Format(t_rstMovFin."Entry no.");
                                t_rstTemp."Workday code" := rstJor."Workday code";
                                t_rstTemp."% time" := Format(rstJor."Additional percentage value");
                                t_rstTemp."News code" := rstJor."Meta4 code";
                                t_rstTemp."User ID" := UserId;
                                t_rstTemp."Workday level" := rstJor.Nivel;
                                if t_rstTemp.Quantity <> 0 then
                                    t_rstTemp.Insert(false);

                                if (intCantOrigARepartir <> 0) and (intCantOrigARepartir <> intCantEstaRepartida) then
                                    intCantARepartir := intCantOrigARepartir - intCantEstaRepartida;
                                intCantOrigARepartir -= intCantOrigARepartir;

                                //dtInicial := dtInicial+ROUND(((intCantEstaRepartida+decRedondeoSegundos)*1000*60*60),decRedondeoSegundos);
                                dtInicial := dtInicial + (intCantEstaRepartida + 0.01) * 1000 * 60 * 60;
                                timInicio := DT2Time(dtInicial);

                            until DT2Time(t_rstTemp."Finish date and time") < rstJor."Ending time";

                    end;

                end;

            until (intCantARepartir = 0)
        else begin

            exit;
            //Si no hay cantidad para repartir, asumo una incidencia
            Clear(rstMovEmp);
            t_rstTemp.Init;
            intContados += 1;
            t_rstTemp."Entry no." := intContados;
            t_rstTemp."Company no." := 1;
            t_rstTemp."File no." := rstEmployee."No.";
            t_rstTemp.Name := rstEmployee.Name;
            t_rstTemp."Hiring date" := rstEmployee."pat_Fecha ingreso laboral";
            t_rstTemp."Event code" := rstJor."Meta4 code";
            t_rstTemp."Start date and time" := dtInicial;
            t_rstTemp."Finish date and time" := 0DT;
            t_rstTemp."Application date" := DT2Date(t_rstTemp."Start date and time");
            t_rstTemp."Import date" := t_rstMarcajes."Import date";
            t_rstTemp.Quantity := 0;
            t_rstTemp."Quantity to distribute" := intCantOrig;
            t_rstTemp.Records := Format(t_rstMarcajes."Entry no.") + '|' + Format(t_rstMovFin."Entry no.");
            t_rstTemp."Workday code" := rstJor."Workday code";
            t_rstTemp."News code" := rstJor."Meta4 code";
            t_rstTemp."% time" := Format(rstJor."Additional percentage value");
            t_rstTemp."User ID" := UserId;
            t_rstTemp."Workday level" := rstJor.Nivel;
            t_rstTemp.Insert(false);

        end;
    end;

    [Scope('OnPrem')]
    procedure fntSugerirMovEmpleado(var t_rstTemp: Record "Employee entry" temporary)
    var
        timInicio: Time;
        timFinal: Time;
        dtiInicial: DateTime;
    begin
        decRedondeoSegundos := 0.5;
        //Calculo la cantidad de tiempo a distribuir por las distintas configuraciones de la jornada
        Clear(rstConceptos);
        if rstConceptos.Get(t_rstMarcajes."Event code") then begin

            if rstConceptos."Hours per unit" <> 1 then begin

                fntInsertarAusentismo(t_rstTemp);
                exit;

            end
            else begin

                if t_rstMarcajes."Event code" = t_rstMovFin."Event code" then begin

                    Clear(rstMovEmp);
                    t_rstTemp.Init;
                    intContados += 1;
                    t_rstTemp."Entry no." := intContados;
                    t_rstTemp."Company no." := 1;
                    t_rstTemp."File no." := rstEmployee."No.";
                    t_rstTemp.Name := rstEmployee.Name;
                    t_rstTemp."Hiring date" := rstEmployee."pat_Fecha ingreso laboral";
                    t_rstTemp."Event code" := t_rstMarcajes."Event code";
                    t_rstTemp."Start date and time" := t_rstMarcajes."Markup date and time";
                    t_rstTemp."Finish date and time" := t_rstMovFin."Markup date and time";
                    t_rstTemp."Application date" := DT2Date(t_rstTemp."Start date and time");
                    t_rstTemp."Import date" := CurrentDateTime;
                    t_rstTemp.Quantity := Round((t_rstTemp."Finish date and time" -
                                          t_rstTemp."Start date and time") / 1000 / 60 / 60, decRedondeoSegundos);
                    //t_rstTemp."Quantity to distribute" := t_rstTemp.Quantity;
                    t_rstTemp."Quantity to distribute" := Round(t_rstTemp.Quantity, 0.5);
                    intCantARepartir -= Round(t_rstTemp.Quantity, decRedondeoSegundos);
                    intCantEstaRepartida := Round(t_rstTemp.Quantity, decRedondeoSegundos);
                    t_rstTemp.Records := Format(t_rstMarcajes."Entry no.") + '|' + Format(t_rstMovFin."Entry no.");
                    t_rstTemp."Workday code" := t_rstMovFin."Workday code";
                    t_rstTemp."News code" := t_rstMovFin."Event code";
                    t_rstTemp."User ID" := UserId;
                    t_rstTemp."% time" := t_rstMarcajes."% time";
                    t_rstTemp."Workday level" := t_rstMarcajes."Workday level";
                    if t_rstTemp.Quantity <> 0 then
                        t_rstTemp.Insert(false);

                    exit;

                end
                else begin

                    if t_rstMovFin."Markup date and time" <> 0DT then
                        intCantARepartir := Round((t_rstTemp."Finish date and time" -
                                                  t_rstTemp."Start date and time") / 1000 / 60 / 60, 0.51)
                    else
                        intCantARepartir := 0;

                end;

            end;

        end
        else begin

            if t_rstMovFin."Markup date and time" <> 0DT then
                intCantARepartir := Round((t_rstTemp."Finish date and time" -
                                          t_rstTemp."Start date and time") / 1000 / 60 / 60, 0.5)
            else
                intCantARepartir := 0;

        end;

        intCantRep := 0;
        intNivel := 0;

        //Inicializo la cantidad de tiempo ya repartida y almaceno nuevo valor a repartir
        intCantEstaRepartida := 0;
        intCantOrigARepartir := intCantARepartir;

        //CLEAR(t_rstTemp);
        t_rstTemp.Reset;
        t_rstTemp.SetRange("File no.", t_rstTemp."File no.");
        t_rstTemp.SetFilter(Records, '<>%1', '');
        //t_rstTemp.SETRANGE("Event code",t_rstTemp."Event code");
        if t_rstTemp.Find('-') then
            repeat

                intCantEstaRepartida += t_rstTemp.Quantity;
                intCantRep += 1;

            until t_rstTemp.Next = 0;

        Clear(rstMovEmp);
        t_rstTemp.Init;
        intContados += 1;
        t_rstTemp."Entry no." := intContados;
        t_rstTemp."Company no." := 1;
        t_rstTemp."File no." := rstEmployee."No.";
        t_rstTemp.Name := rstEmployee.Name;
        t_rstTemp."Hiring date" := rstEmployee."pat_Fecha ingreso laboral";
        t_rstTemp."Event code" := rstJor."Meta4 code";
        t_rstTemp."Start date and time" := t_rstMarcajes."Markup date and time";
        t_rstTemp."Finish date and time" := t_rstMovFin."Markup date and time";
        t_rstTemp."Application date" := DT2Date(t_rstTemp."Start date and time");
        t_rstTemp."Import date" := CurrentDateTime;
        if t_rstTemp."Start date and time" <> 0DT then begin

            if t_rstTemp."Finish date and time" <> 0DT then begin

                t_rstTemp.Quantity := Round((t_rstTemp."Finish date and time" -
                                      t_rstTemp."Start date and time") / 1000 / 60 / 60, decRedondeoSegundos);

            end
            else begin

                t_rstTemp.Quantity := 0;

            end;

        end;

        t_rstTemp."Quantity to distribute" := t_rstTemp.Quantity;
        intCantARepartir -= Round(t_rstTemp.Quantity, decRedondeoSegundos);
        intCantEstaRepartida := Round(t_rstTemp.Quantity, decRedondeoSegundos);
        t_rstTemp.Records := Format(t_rstTemp."Entry no.") + '|' + Format(t_rstMovFin."Entry no.");
        t_rstTemp."Workday code" := rstJor."Workday code";
        t_rstTemp."News code" := rstJor."Meta4 code";
        t_rstTemp."% time" := Format(rstJor."Additional percentage value");
        t_rstTemp."User ID" := UserId;
        t_rstTemp."Workday level" := rstJor.Nivel;
        t_rstTemp.Insert(false);
    end;

    [Scope('OnPrem')]
    procedure fntSugerirMovLiq(var t_rstTemp: Record "Employee entry" temporary)
    var
        timInicio: Time;
        timFinal: Time;
        dtInicial: DateTime;
        dtFinal: DateTime;
        blnSalir: Boolean;
        intControl: Decimal;
        rstLiq: Record "Employee journal application";
    begin
        dlgVentana.Open('Legajo:   #1##############\' +
                        'Empleado: #2#################################');

        t_rstTemp.SetCurrentKey("File no.", t_rstTemp."Start date and time");
        if t_rstTemp.FindSet then
            repeat

                Clear(rstEmployee);
                rstEmployee.Get(t_rstTemp."File no.");

                dlgVentana.Update(1, rstEmployee."No.");
                dlgVentana.Update(2, rstEmployee.Name);

                dtInicial := t_rstTemp."Start date and time";
                dtFinal := t_rstTemp."Finish date and time";

                decRedondeoSegundos := 0.5;
                //Calculo la cantidad de tiempo a distribuir por las distintas configuraciones de la jornada
                Clear(rstConceptos);
                if rstConceptos.Get(t_rstTemp."Event code") then begin

                    if rstConceptos."Hours per unit" <> 1 then begin

                        rstMovEmp.Init;
                        intContados += 1;
                        rstMovEmp."Entry no." := intContados;
                        rstMovEmp.Insert(false);
                        rstMovEmp."Company no." := 1;
                        rstMovEmp."File no." := rstEmployee."No.";
                        rstMovEmp.Name := rstEmployee.Name;
                        rstMovEmp."Hiring date" := rstEmployee."pat_Fecha ingreso laboral";
                        rstMovEmp."Event code" := t_rstTemp."Event code";
                        rstMovEmp."Start date and time" := t_rstTemp."Start date and time";
                        rstMovEmp."Finish date and time" := t_rstTemp."Finish date and time" +
                                                                          (rstConceptos."Hours per unit" * 60 * 60 * 1000);
                        rstMovEmp."Application date" := DT2Date(t_rstTemp."Start date and time");
                        rstMovEmp."Import date" := CurrentDateTime;
                        rstMovEmp.Quantity := (t_rstTemp."Finish date and time" -
                                              t_rstTemp."Start date and time") / 1000 / 60 / 60;
                        rstMovEmp."Quantity to distribute" := rstConceptos."Hours per unit";
                        rstMovEmp.Records := Format(t_rstMarcajes."Entry no.") + '|' + Format(t_rstMarcajes."Entry no.");
                        rstMovEmp."Start record" := t_rstMarcajes."Entry no.";
                        rstMovEmp."Finish record" := t_rstMarcajes."Entry no.";
                        rstMovEmp."Workday code" := t_rstMarcajes."Workday code";
                        rstMovEmp."News code" := t_rstMarcajes."Event code";
                        rstMovEmp."% time" := '0';
                        rstMovEmp."User ID" := UserId;
                        rstMovEmp.Modify(false);

                    end
                    else begin

                        Clear(rstMovEmpReal);
                        rstMovEmpReal.CopyFilters(t_rstTemp);
                        rstMovEmpReal.SetRange("File no.", t_rstTemp."File no.");
                        rstMovEmpReal.SetRange("Application date", t_rstTemp."Application date");
                        if rstMovEmpReal.FindSet then;
                        rstMovEmpReal.CalcSums(Quantity);
                        intCantARepartir := rstMovEmpReal.Quantity

                    end;

                end
                else begin

                    Clear(rstMovEmpReal);
                    rstMovEmpReal.CopyFilters(t_rstTemp);
                    rstMovEmpReal.SetRange("File no.", t_rstTemp."File no.");
                    rstMovEmpReal.SetRange("Application date", t_rstTemp."Application date");
                    if rstMovEmpReal.FindSet then;
                    rstMovEmpReal.CalcSums(Quantity);
                    intCantARepartir := rstMovEmpReal.Quantity

                end;

                intCantRep := 0;
                intNivel := 0;

                //Inicializo la cantidad de tiempo ya repartida y almaceno nuevo valor a repartir
                intCantEstaRepartida := 0;
                intCantOrigARepartir := intCantARepartir;
                intCantOrig := intCantOrigARepartir;
                /*
                IF (t_rstTemp."Application date" <> DT2DATE(dtInicial)) OR (rstEmployee."No." <> t_rstTemp."File no.") THEN
                BEGIN

                  //Si hay tiempo para repartir (siempre debería haber, sino es una incidencia), inicio el reparto
                  IF intCantARepartir <> 0 THEN
                  REPEAT

                    intCantEstaRepartida := 0;

                    //Si la cantidad da más de 20 horas, asumo que faltó un marcaje, y voy directamente a insertar un movimiento de incidencia
                    //Sino, sigo adelante
                    blnSalir := FALSE;
                    intNivel += 1;
                    CLEAR(rstJor2);
                    rstJor2 := rstJor;
                    CLEAR(rstJor);
                    //Busco una configuración de jornada con un día de inicio anterior o igual al actual y un día de fin posterior o igual al actual
                    //Lo mismo con el horario de inicio y de fin

                    rstJor.SETRANGE("Workday code",rstEmployee."Workday code");
                    rstJor.SETFILTER("Starting day",'<=%1',DATE2DWY(DT2DATE(t_rstTemp."Start date and time"),1));
                    rstJor.SETFILTER("Ending day",'>=%1',DATE2DWY(DT2DATE(t_rstTemp."Start date and time"),1));
                    rstJor.SETRANGE("Flexible o restricto",rstJor."Flexible o restricto"::Mixto);
                    rstJor.FINDFIRST;

                    REPEAT

                      IF rstJor."Cantidad horas" <> 0 THEN
                      BEGIN

                        IF (rstJor."Cantidad horas"-(intCantOrig-intCantARepartir)) > 0 THEN
                          blnSalir := TRUE
                        ELSE
                          rstJor.NEXT;

                      END
                      ELSE
                      BEGIN

                        IF rstJor."Ending time" <> 0T THEN
                        BEGIN

                          IF DT2TIME(dtInicial) <= rstJor."Ending time" THEN
                            blnSalir := TRUE
                          ELSE
                            rstJor.NEXT;

                        END;
                        IF rstJor."Starting time" <> 0T THEN
                        BEGIN

                          IF DT2TIME(dtInicial) >= rstJor."Starting time" THEN
                            blnSalir := TRUE
                          ELSE
                            rstJor.NEXT;

                        END;

                      END;

                    UNTIL (blnSalir);

                    blnSalir := FALSE;

                    //Si la cantidad de tiempo contemplada por la configuración de jornada es inferior a la cantidad a repartir, asumo
                    //que el empleado trabajó en exceso de dicho tiempo y pasó a otra jornada; por consiguiente, voy rebajando la cantidad
                    //a repartir a medido que inserto los correspondientes movimientos del empleado

                    //Si la jornada empieza o termina en cierta hora fija
                    IF rstJor."Cantidad horas" = 0 THEN
                    BEGIN

                      //Si la configuración de jornada tiene hora de finalización
                      IF (rstJor."Ending time" <> 0T) THEN
                      BEGIN

                        //Si la hora de finalización de la jornada es superior al horario de salida de este marcaje
                        IF CREATEDATETIME(DT2DATE(dtInicial),rstJor."Ending time") >= dtInicial+ROUND(((intCantARepartir)*1000*60*60),decRedondeoSegundos) THEN
                        BEGIN

                          //Si la hora de salida es superior o igual a lo que resta repartir (en qué casos podría pasar esto???)
                          IF t_rstTemp."Finish date and time" > dtInicial+ROUND(((intCantARepartir)*1000*60*60),decRedondeoSegundos) THEN
                          BEGIN

                            decQ := ROUND((t_rstTemp."Finish date and time"-t_rstTemp."Start date and time")/1000/60/60,decRedondeoSegundos);
                            fntInsertarMovEmpleado(t_rstTemp,dtInicial,dtFinal,decQ,intCantOrig,intCantARepartir,intCantEstaRepartida,rstJor);
                            intCantARepartir := 0;

                          END
                          ELSE
                          BEGIN

                            //Si la hora de salida es igual a lo que resta repartir (en qué casos podría pasar esto???)
                            IF t_rstTemp."Finish date and time" = dtInicial+ROUND(((intCantARepartir)*1000*60*60),decRedondeoSegundos) THEN
                            BEGIN

                              decQ := intCantARepartir;
                              fntInsertarMovEmpleado(t_rstTemp,dtInicial,dtFinal,decQ,intCantOrig,intCantARepartir,intCantEstaRepartida,rstJor);
                              intCantARepartir := 0;

                            end
                            else
                            begin

                              //Si la hora de salida es inferior a lo que resta por repartir
                              decQ := ROUND((dtFinal-dtInicial)/1000/60/60,decRedondeoSegundos);
                              fntInsertarMovEmpleado(t_rstTemp,dtInicial,dtFinal,decQ,intCantOrig,intCantARepartir,intCantEstaRepartida,rstJor);

                            END;

                          END;

                        END
                        ELSE
                        BEGIN

                          //Si la hora de finalización de la jornada es anterior a la hora en que marcó salida
                          dtFinal := CREATEDATETIME(DT2DATE(dtInicial),rstJor."Ending time");
                          decQ := ROUND((dtFinal-dtInicial)/1000/60/60,decRedondeoSegundos);
                          fntInsertarMovEmpleado(t_rstTemp,dtInicial,dtFinal,decQ,intCantOrig,intCantARepartir,intCantEstaRepartida,rstJor);

                        END;

                      END
                      ELSE
                      BEGIN

                        dtInicial := CREATEDATETIME(DT2DATE(dtInicial),rstJor."Starting time");
                        dtFinal := dtInicial+ROUND(((intCantARepartir)*1000*60*60),decRedondeoSegundos);
                        decQ := intCantARepartir;
                        fntInsertarMovEmpleado(t_rstTemp,dtInicial,dtFinal,decQ,intCantOrig,intCantARepartir,intCantEstaRepartida,rstJor);

                      END;

                    END
                    ELSE
                    BEGIN

                      //Si tengo más horas a repartir de las que puedo distribuir en el marcaje actual, claramente hay otro marcaje.
                      IF (t_rstTemp.Quantity < intCantARepartir) THEN
                      BEGIN

                        //Si la jornada tiene más o las mismas horas que las que me quedan repartir en este marcaje
                        IF t_rstTemp.Quantity <= rstJor."Cantidad horas" THEN
                        BEGIN

                          dtFinal := t_rstTemp."Finish date and time";
                          decQ := t_rstTemp.Quantity;
                          fntInsertarMovEmpleado(t_rstTemp,dtInicial,dtFinal,decQ,intCantOrig,intCantARepartir,intCantEstaRepartida,rstJor);

                        END
                        else
                        begin

                          dtFinal := t_rstTemp."Start date and time"+ROUND(rstJor."Cantidad horas"*1000*60*60,decRedondeoSegundos);
                          decQ := rstJor."Cantidad horas";
                          fntInsertarMovEmpleado(t_rstTemp,dtInicial,dtFinal,decQ,intCantOrig,intCantARepartir,intCantEstaRepartida,rstJor);
                          intControl -= decQ;

                          //t_rstTemp.NEXT;

                        END;

                      END
                      ELSE
                      BEGIN

                        //Si tengo menos (no puede pasar!!!) o las mismas horas a repartir de las que puedo distribuir en el marcaje actual, claramente hay otro marcaje.
                        //Si la jornada tiene menos horas que las que quedan por repartir
                        IF ROUND(rstJor."Cantidad horas",decRedondeoSegundos) < intCantARepartir THEN
                        BEGIN

                          dtFinal := t_rstTemp."Start date and time"+ROUND(rstJor."Cantidad horas"*1000*60*60,decRedondeoSegundos);
                          decQ := ROUND(rstJor."Cantidad horas",decRedondeoSegundos);
                          fntInsertarMovEmpleado(t_rstTemp,dtInicial,dtFinal,decQ,intCantOrig,intCantARepartir,intCantEstaRepartida,rstJor);

                        END
                        ELSE
                        BEGIN

                          //Si la jornada tiene más o las mismas horas que me quedan por repartir, aplico totalmente las horas a repartir
                          IF ROUND(rstJor."Cantidad horas",decRedondeoSegundos) >= intCantARepartir THEN
                          BEGIN

                            dtFinal := t_rstTemp."Finish date and time";
                            decQ := intCantARepartir;
                            fntInsertarMovEmpleado(t_rstTemp,dtInicial,dtFinal,decQ,intCantOrig,intCantARepartir,intCantEstaRepartida,rstJor);
                            If intCantARepartir <> 0 then
                            BEGIN

                              t_rstTemp.next;

                            END;

                          END
                          ELSE
                          REPEAT

                            dtFinal := t_rstTemp."Start date and time"+ROUND(intCantARepartir*1000*60*60,decRedondeoSegundos);
                            decQ := ROUND((t_rstTemp."Finish date and time"-t_rstTemp."Start date and time")/1000/60/60,decRedondeoSegundos);
                            fntInsertarMovEmpleado(t_rstTemp,dtInicial,dtFinal,decQ,intCantOrig,intCantARepartir,intCantEstaRepartida,rstJor);

                          UNTIL DT2TIME(rstMovEmp."Finish date and time")<rstJor."Ending time";

                        END;

                      END;

                    END;

                  UNTIL (intCantARepartir = 0);

                END
                ELSE
                BEGIN

                */
                //Si hay tiempo para repartir (siempre debería haber, sino es una incidencia), inicio el reparto
                if intCantARepartir <> 0 then
                    repeat

                        intCantEstaRepartida := 0;

                        //Si la cantidad da más de 20 horas, asumo que faltó un marcaje, y voy directamente a insertar un movimiento de incidencia
                        //Sino, sigo adelante
                        blnSalir := false;
                        intNivel += 1;
                        Clear(rstJor2);
                        rstJor2 := rstJor;
                        Clear(rstJor);
                        //Busco una configuración de jornada con un día de inicio anterior o igual al actual y un día de fin posterior o igual al actual
                        //Lo mismo con el horario de inicio y de fin

                        rstJor.SetRange("Workday code", rstEmployee."Workday code");
                        rstJor.SetFilter("Starting day", '<=%1', Date2DWY(DT2Date(t_rstTemp."Start date and time"), 1));
                        rstJor.SetFilter("Ending day", '>=%1', Date2DWY(DT2Date(t_rstTemp."Start date and time"), 1));
                        rstJor.SetRange("Flexible o restricto", rstJor."Flexible o restricto"::Mixto);
                        rstJor.FindFirst;

                        repeat

                            if rstJor."Cantidad horas" <> 0 then begin

                                if (rstJor."Cantidad horas" - (intCantOrig - intCantARepartir)) > 0 then
                                    blnSalir := true
                                else
                                    rstJor.Next;

                            end
                            else begin

                                if rstJor."Ending time" <> 0T then begin

                                    if DT2Time(dtInicial) <= rstJor."Ending time" then
                                        blnSalir := true
                                    else
                                        rstJor.Next;

                                end;
                                if rstJor."Starting time" <> 0T then begin

                                    if DT2Time(dtInicial) >= rstJor."Starting time" then
                                        blnSalir := true
                                    else
                                        rstJor.Next;

                                end;

                            end;

                        until (blnSalir);

                        blnSalir := false;

                        if (rstJor."Cantidad horas" <> 0) then begin

                            //Si la cantidad de horas de la jornada es superior o igual a la cantidad de horas del registro
                            if t_rstTemp.Quantity <= (rstJor."Cantidad horas" - (intCantOrig - intCantARepartir)) then begin

                                dtFinal := t_rstTemp."Finish date and time";
                                decQ := t_rstTemp.Quantity;
                                fntInsertarMovEmpleado(t_rstTemp, dtInicial, dtFinal, decQ, intCantOrig, intCantARepartir, intCantEstaRepartida, rstJor);
                                if intCantARepartir > 0 then begin

                                    t_rstTemp.Next;
                                    dtInicial := t_rstTemp."Start date and time";

                                end;

                            end
                            else begin

                                //Si la cantidad de horas de la jornada es inferior a la cantidad de horas del registro
                                dtFinal := dtInicial + Round(((rstJor."Cantidad horas" - (intCantOrig - intCantARepartir)) * 1000 * 60 * 60), decRedondeoSegundos);
                                decQ := Round((dtFinal - dtInicial) / 1000 / 60 / 60, decRedondeoSegundos);
                                fntInsertarMovEmpleado(t_rstTemp, dtInicial, dtFinal, decQ, intCantOrig, intCantARepartir, intCantEstaRepartida, rstJor);

                            end;

                        end
                        else begin

                            //Si la jornada tiene hora de finalización
                            if (rstJor."Ending time" <> 0T) then begin

                                //Si la hora de fin del registro es inferior o igual a la hora de fin de la jornada
                                if RoundDateTime(CreateDateTime(DT2Date(dtInicial), rstJor."Ending time"), 30 * 60 * 1000) >= t_rstTemp."Finish date and time" then begin

                                    dtFinal := t_rstTemp."Finish date and time";
                                    decQ := Round((t_rstTemp."Finish date and time" - dtInicial) / 1000 / 60 / 60, decRedondeoSegundos);
                                    if decQ = 0 then
                                        decQ := intCantARepartir;
                                    fntInsertarMovEmpleado(t_rstTemp, dtInicial, dtFinal, decQ, intCantOrig, intCantARepartir, intCantEstaRepartida, rstJor);
                                    if intCantARepartir > 0 then begin

                                        t_rstTemp.Next;
                                        dtInicial := t_rstTemp."Start date and time";

                                    end;

                                end
                                else begin

                                    //Si la hora de fin del registro es superior a la hora de fin de la jornada
                                    dtFinal := RoundDateTime(CreateDateTime(DT2Date(dtInicial), rstJor."Ending time"), 30 * 60 * 1000);
                                    decQ := Round((dtFinal - dtInicial) / 1000 / 60 / 60, decRedondeoSegundos);
                                    fntInsertarMovEmpleado(t_rstTemp, dtInicial, dtFinal, decQ, intCantOrig, intCantARepartir, intCantEstaRepartida, rstJor);

                                end;

                            end
                            else begin

                                //Si la jornada tiene hora de inicio
                                if (rstJor."Starting time" <> 0T) then begin

                                    dtFinal := t_rstTemp."Finish date and time";
                                    decQ := Round((dtFinal - dtInicial) / 1000 / 60 / 60, decRedondeoSegundos);
                                    fntInsertarMovEmpleado(t_rstTemp, dtInicial, dtFinal, decQ, intCantOrig, intCantARepartir, intCantEstaRepartida, rstJor);
                                    intCantARepartir := 0;

                                end;

                            end;

                        end;

                    until (intCantARepartir = 0);
            /*
            END;
            */
            until t_rstTemp.Next = 0;

        t_rstTemp.DeleteAll;

        if rstMovEmp.FindSet then
            repeat

                t_rstTemp.TransferFields(rstMovEmp);
                t_rstTemp.Insert;

            until rstMovEmp.Next = 0;

        fntInsertarMovDiario(t_rstTemp, true, true, true);

        dlgVentana.Close;

    end;

    [Scope('OnPrem')]
    procedure fntSugerirMovLiq2(var t_rstTemp: Record "Employee entry" temporary)
    var
        timInicio: Time;
        timFinal: Time;
        dtInicial: DateTime;
        dtFinal: DateTime;
        blnSalir: Boolean;
        intControl: Decimal;
    begin
        dlgVentana.Open('Legajo:   #1##############\' +
                        'Empleado: #2#################################');

        t_rstTemp.SetCurrentKey("File no.", t_rstTemp."Start date and time");
        if t_rstTemp.FindSet then
            repeat

                if (t_rstTemp."Application date" <> DT2Date(dtInicial)) or (rstEmployee."No." <> t_rstTemp."File no.") then begin

                    Clear(rstEmployee);
                    rstEmployee.Get(t_rstTemp."File no.");

                    dlgVentana.Update(1, rstEmployee."No.");
                    dlgVentana.Update(2, rstEmployee.Name);

                    dtInicial := t_rstTemp."Start date and time";
                    dtFinal := t_rstTemp."Finish date and time";

                    decRedondeoSegundos := 0.5;
                    //Calculo la cantidad de tiempo a distribuir por las distintas configuraciones de la jornada
                    Clear(rstConceptos);
                    if rstConceptos.Get(t_rstTemp."Event code") then begin

                        if rstConceptos."Hours per unit" <> 1 then begin

                            rstMovEmp.Init;
                            intContados += 1;
                            rstMovEmp."Entry no." := intContados;
                            rstMovEmp.Insert(false);
                            rstMovEmp."Company no." := 1;
                            rstMovEmp."File no." := rstEmployee."No.";
                            rstMovEmp.Name := rstEmployee.Name;
                            rstMovEmp."Hiring date" := rstEmployee."pat_Fecha ingreso laboral";
                            rstMovEmp."Event code" := t_rstTemp."Event code";
                            rstMovEmp."Start date and time" := t_rstTemp."Start date and time";
                            rstMovEmp."Finish date and time" := t_rstTemp."Finish date and time" +
                                                                              (rstConceptos."Hours per unit" * 60 * 60 * 1000);
                            rstMovEmp."Application date" := DT2Date(t_rstTemp."Start date and time");
                            rstMovEmp."Import date" := CurrentDateTime;
                            rstMovEmp.Quantity := (t_rstTemp."Finish date and time" -
                                                  t_rstTemp."Start date and time") / 1000 / 60 / 60;
                            rstMovEmp."Quantity to distribute" := rstConceptos."Hours per unit";
                            rstMovEmp.Records := Format(t_rstMarcajes."Entry no.") + '|' + Format(t_rstMarcajes."Entry no.");
                            rstMovEmp."Start record" := t_rstMarcajes."Entry no.";
                            rstMovEmp."Finish record" := t_rstMarcajes."Entry no.";
                            rstMovEmp."Workday code" := t_rstMarcajes."Workday code";
                            rstMovEmp."News code" := t_rstMarcajes."Event code";
                            rstMovEmp."% time" := '0';
                            rstMovEmp."User ID" := UserId;
                            rstMovEmp.Modify(false);

                        end
                        else begin

                            Clear(rstMovEmpReal);
                            rstMovEmpReal.CopyFilters(t_rstTemp);
                            rstMovEmpReal.SetRange("File no.", t_rstTemp."File no.");
                            rstMovEmpReal.SetRange("Application date", t_rstTemp."Application date");
                            if rstMovEmpReal.FindSet then;
                            rstMovEmpReal.CalcSums(Quantity);
                            intCantARepartir := rstMovEmpReal.Quantity

                        end;

                    end
                    else begin

                        Clear(rstMovEmpReal);
                        rstMovEmpReal.CopyFilters(t_rstTemp);
                        rstMovEmpReal.SetRange("File no.", t_rstTemp."File no.");
                        rstMovEmpReal.SetRange("Application date", t_rstTemp."Application date");
                        if rstMovEmpReal.FindSet then;
                        rstMovEmpReal.CalcSums(Quantity);
                        intCantARepartir := rstMovEmpReal.Quantity

                    end;

                    intCantRep := 0;
                    intNivel := 0;

                    //Inicializo la cantidad de tiempo ya repartida y almaceno nuevo valor a repartir
                    intCantEstaRepartida := 0;
                    intCantOrigARepartir := intCantARepartir;
                    intCantOrig := intCantOrigARepartir;

                    //Guardo la fecha y hora de inicio de tareas

                    //Si hay tiempo para repartir (siempre debería haber, sino es una incidencia), inicio el reparto
                    if intCantARepartir <> 0 then
                        repeat

                            intCantEstaRepartida := 0;

                            //Si la cantidad da más de 20 horas, asumo que faltó un marcaje, y voy directamente a insertar un movimiento de incidencia
                            //Sino, sigo adelante
                            blnSalir := false;
                            intNivel += 1;
                            Clear(rstJor2);
                            rstJor2 := rstJor;
                            Clear(rstJor);
                            //Busco una configuración de jornada con un día de inicio anterior o igual al actual y un día de fin posterior o igual al actual
                            //Lo mismo con el horario de inicio y de fin

                            rstJor.SetRange("Workday code", rstEmployee."Workday code");
                            rstJor.SetFilter("Starting day", '<=%1', Date2DWY(DT2Date(t_rstTemp."Start date and time"), 1));
                            rstJor.SetFilter("Ending day", '>=%1', Date2DWY(DT2Date(t_rstTemp."Start date and time"), 1));
                            rstJor.SetRange("Flexible o restricto", rstJor."Flexible o restricto"::Mixto);
                            /*
                            IF intNivel > rstJor.COUNT THEN
                              intNivel := rstJor.COUNT;
                            */
                            //rstJor.SETRANGE(Nivel,intNivel);
                            rstJor.FindFirst;

                            repeat

                                if rstJor."Cantidad horas" <> 0 then begin

                                    if (rstJor."Cantidad horas" - (intCantOrig - intCantARepartir)) > 0 then
                                        blnSalir := true
                                    else
                                        rstJor.Next;

                                end
                                else begin

                                    if rstJor."Ending time" <> 0T then begin

                                        if DT2Time(dtInicial) <= rstJor."Ending time" then
                                            blnSalir := true
                                        else
                                            rstJor.Next;

                                    end;
                                    if rstJor."Starting time" <> 0T then begin

                                        if DT2Time(dtInicial) >= rstJor."Starting time" then
                                            blnSalir := true
                                        else
                                            rstJor.Next;

                                    end;

                                end;

                            until (blnSalir);

                            blnSalir := false;

                            //Si la cantidad de tiempo contemplada por la configuración de jornada es inferior a la cantidad a repartir, asumo
                            //que el empleado trabajó en exceso de dicho tiempo y pasó a otra jornada; por consiguiente, voy rebajando la cantidad
                            //a repartir a medido que inserto los correspondientes movimientos del empleado

                            //Si la jornada empieza o termina en cierta hora fija
                            if rstJor."Cantidad horas" = 0 then begin

                                //Si la configuración de jornada tiene hora de finalización
                                if (rstJor."Ending time" <> 0T) then begin

                                    //Si la hora de finalización de la jornada es superior al horario de salida de este marcaje
                                    if CreateDateTime(DT2Date(dtInicial), rstJor."Ending time") >= dtInicial + Round(((intCantARepartir) * 1000 * 60 * 60), decRedondeoSegundos) then begin

                                        //Si la hora de salida es superior o igual a lo que resta repartir (en qué casos podría pasar esto???)
                                        if t_rstTemp."Finish date and time" > dtInicial + Round(((intCantARepartir) * 1000 * 60 * 60), decRedondeoSegundos) then begin

                                            decQ := Round((t_rstTemp."Finish date and time" - t_rstTemp."Start date and time") / 1000 / 60 / 60, decRedondeoSegundos);
                                            fntInsertarMovEmpleado(t_rstTemp, dtInicial, dtFinal, decQ, intCantOrig, intCantARepartir, intCantEstaRepartida, rstJor);
                                            intCantARepartir := 0;

                                        end
                                        else begin

                                            //Si la hora de salida es igual a lo que resta repartir (en qué casos podría pasar esto???)
                                            if t_rstTemp."Finish date and time" = dtInicial + Round(((intCantARepartir) * 1000 * 60 * 60), decRedondeoSegundos) then begin

                                                decQ := intCantARepartir;
                                                fntInsertarMovEmpleado(t_rstTemp, dtInicial, dtFinal, decQ, intCantOrig, intCantARepartir, intCantEstaRepartida, rstJor);
                                                intCantARepartir := 0;

                                            end
                                            else begin

                                                //Si la hora de salida es inferior a lo que resta por repartir
                                                decQ := Round((dtFinal - dtInicial) / 1000 / 60 / 60, decRedondeoSegundos);
                                                fntInsertarMovEmpleado(t_rstTemp, dtInicial, dtFinal, decQ, intCantOrig, intCantARepartir, intCantEstaRepartida, rstJor);

                                            end;

                                        end;

                                    end
                                    else begin

                                        //Si la hora de finalización de la jornada es anterior a la hora en que marcó salida
                                        dtFinal := CreateDateTime(DT2Date(dtInicial), rstJor."Ending time");
                                        decQ := Round((dtFinal - dtInicial) / 1000 / 60 / 60, decRedondeoSegundos);
                                        fntInsertarMovEmpleado(t_rstTemp, dtInicial, dtFinal, decQ, intCantOrig, intCantARepartir, intCantEstaRepartida, rstJor);

                                    end;

                                end
                                else begin

                                    dtInicial := CreateDateTime(DT2Date(dtInicial), rstJor."Starting time");
                                    dtFinal := dtInicial + Round(((intCantARepartir) * 1000 * 60 * 60), decRedondeoSegundos);
                                    decQ := intCantARepartir;
                                    fntInsertarMovEmpleado(t_rstTemp, dtInicial, dtFinal, decQ, intCantOrig, intCantARepartir, intCantEstaRepartida, rstJor);

                                end;

                            end
                            else begin

                                //Si tengo más horas a repartir de las que puedo distribuir en el marcaje actual, claramente hay otro marcaje.
                                if (t_rstTemp.Quantity < intCantARepartir) then begin

                                    //Si la jornada tiene más o las mismas horas que las que me quedan repartir en este marcaje
                                    if t_rstTemp.Quantity <= rstJor."Cantidad horas" then begin

                                        dtFinal := t_rstTemp."Finish date and time";
                                        decQ := t_rstTemp.Quantity;
                                        fntInsertarMovEmpleado(t_rstTemp, dtInicial, dtFinal, decQ, intCantOrig, intCantARepartir, intCantEstaRepartida, rstJor);

                                    end
                                    else begin

                                        dtFinal := t_rstTemp."Start date and time" + Round(rstJor."Cantidad horas" * 1000 * 60 * 60, decRedondeoSegundos);
                                        decQ := rstJor."Cantidad horas";
                                        fntInsertarMovEmpleado(t_rstTemp, dtInicial, dtFinal, decQ, intCantOrig, intCantARepartir, intCantEstaRepartida, rstJor);
                                        intControl -= decQ;

                                        //t_rstTemp.NEXT;

                                    end;

                                end
                                else begin

                                    //Si tengo menos (no puede pasar!!!) o las mismas horas a repartir de las que puedo distribuir en el marcaje actual, claramente hay otro marcaje.
                                    //Si la jornada tiene menos horas que las que quedan por repartir
                                    if Round(rstJor."Cantidad horas", decRedondeoSegundos) < intCantARepartir then begin

                                        dtFinal := t_rstTemp."Start date and time" + Round(rstJor."Cantidad horas" * 1000 * 60 * 60, decRedondeoSegundos);
                                        decQ := rstJor."Cantidad horas";
                                        fntInsertarMovEmpleado(t_rstTemp, dtInicial, dtFinal, decQ, intCantOrig, intCantARepartir, intCantEstaRepartida, rstJor);

                                    end
                                    else begin

                                        //Si la jornada tiene más o las mismas horas que me quedan por repartir, aplico totalmente las horas a repartir
                                        if Round(rstJor."Cantidad horas", decRedondeoSegundos) >= intCantARepartir then begin

                                            dtFinal := t_rstTemp."Finish date and time";
                                            decQ := intCantARepartir;
                                            fntInsertarMovEmpleado(t_rstTemp, dtInicial, dtFinal, decQ, intCantOrig, intCantARepartir, intCantEstaRepartida, rstJor);
                                            if intCantARepartir <> 0 then begin

                                                t_rstTemp.Next;

                                            end;

                                        end
                                        else
                                            repeat

                                                dtFinal := t_rstTemp."Start date and time" + Round(intCantARepartir * 1000 * 60 * 60, decRedondeoSegundos);
                                                decQ := Round((t_rstTemp."Finish date and time" - t_rstTemp."Start date and time") / 1000 / 60 / 60, decRedondeoSegundos);
                                                fntInsertarMovEmpleado(t_rstTemp, dtInicial, dtFinal, decQ, intCantOrig, intCantARepartir, intCantEstaRepartida, rstJor);

                                            until DT2Time(rstMovEmp."Finish date and time") < rstJor."Ending time";

                                    end;

                                end;

                            end;

                        until (intCantARepartir = 0)

                end;

            until t_rstTemp.Next = 0;

        t_rstTemp.DeleteAll;

        if rstMovEmp.FindSet then
            repeat

                t_rstTemp.TransferFields(rstMovEmp);
                t_rstTemp.Insert;

            until rstMovEmp.Next = 0;

        fntInsertarMovDiario(t_rstTemp, true, true, true);

        dlgVentana.Close;

    end;

    local procedure fntCalcularCantidad()
    begin
    end;

    [Scope('OnPrem')]
    procedure fntRegistrarMeta4()
    var
        aADO_Con: DotNet dnOracleConnection;
        aADO_Comm: DotNet dnOracleCommand;
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Page "Select Filtering Dates";
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
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
        decCantidadReg: Decimal;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        rstConcept: Record "Meta4 concept";
        datIni: Date;
        datFin: Date;
        rstEE: Record "Employee entry";
        rstEE2: Record "Employee entry";
        rstDate: Record Date;
        strFRegistro: Text[2];
        ServerName: Text;
        OracleDB: Text;
        ConnectionString: Text;
        UserName: Text;
        Pass: Text;
        rstCompanyInfo: Record "Company Information";
    begin
        if Confirm(Msg0001) then begin

            Clear(windows);
            windows.SetDates(datIni, datFin);
            if windows.RunModal() = Action::OK then
                windows.GetDates(datIni, datFin);

            if datIni > datFin then
                Error(Err0001);

            dlgVentana.Open('Legajo:   #1##############\' +
                            'Empleado: #2#################################\' +
                            'Marcaje : #3##############\' +
                            'Estado: #4#################');

            Clear(rstRecurso);
            rstRecurso.SetFilter("Workday code", '<>%1', '');
            if rstRecurso.FindSet(false) then
                repeat

                    dlgVentana.Update(1, rstRecurso."No.");
                    dlgVentana.Update(2, rstRecurso.Name);

                    Clear(rstConcept);
                    if rstConcept.FindSet(false) then
                        repeat

                            dlgVentana.Update(4, 'Calculando');

                            decCantidadReg := 0;
                            Clear(rstEE);
                            rstEE.SetCurrentKey("Company no.", "File no.", "Event code", "Start date and time", "Finish date and time");
                            rstEE.SetRange("Company no.", 1);
                            rstEE.SetRange("File no.", rstRecurso."No.");
                            rstEE.SetRange("Event code", rstConcept."Concept code");
                            if rstEE.Count > 0 then begin

                                Clear(rstDate);
                                rstDate.SetRange("Period Type", rstDate."Period Type"::Date);
                                rstDate.SetRange("Period Start", datIni, datFin);
                                if rstDate.FindSet then
                                    repeat

                                        dlgVentana.Update(3, rstDate."Period Start");
                                        rstEE.SetFilter("Start date and time", '>=%1', CreateDateTime(rstDate."Period Start", 0T));
                                        rstEE.SetFilter("Finish date and time", '<=%1', CreateDateTime(rstDate."Period Start", 235959T));
                                        rstEE.CalcSums(Quantity);
                                        decCantidadReg += Round(rstEE.Quantity / rstConcept."Hours per unit", 0.5);

                                    until rstDate.Next = 0;

                            end;

                            if Date2DMY(datIni, 1) < 16 then
                                strFRegistro := '11'
                            else
                                strFRegistro := '25';

                            dlgVentana.Update(4, 'Registrando Meta4');

                            if decCantidadReg <> 0 then begin

                                /*
                                ServerName := 'meta4.arbumasa.net.ar';
                                OracleDB := 'meta4';
                                UserName := 'meta4';
                                Pass := 'meta4';
                                ConnectionString := 'Data Source='+ServerName+';'+
                                                    'Integrated Security=false'+';'+
                                                    'Password='+Pass+';'+
                                                    'User ID='+UserName+';';
                                */
                                Clear(rstCompanyInfo);
                                rstCompanyInfo.Get();
                                if rstCompanyInfo."Demo Company" then begin

                                end
                                else begin
                                    filtString1 := '';
                                    filtString1 := 'INSERT INTO M4_VAL_INCIDENCIA (ID_SOCIEDAD, ID_EMPLEADO, FEC_ALTA_EMPLEADO, ' +
                                                   'ID_CONCEPTO, FEC_INICIO, FEC_FIN, VALOR, ID_TIPO_APLICACION,ID_USUARIO) VALUES (''01'',' +
                                                   '' + Format(rstRecurso."No.") + '' + ',(select MAX(FEC_ALTA_EMPLEADO) from M4T_FASES_ALTA ' +
                                                   'where ID_EMPLEADO = ' + rstRecurso."No." + '),' + Format(rstConcept."Concept code") + ',' +
                                                   'to_date(''' + Format(Date2DMY(datIni, 3)) + '/' + Format(Date2DMY(datIni, 2)) + '/' + strFRegistro + '''' +
                                                   ',''yyyy/mm/dd''),' +
                                                   'to_date(''' + Format(Date2DMY(datFin, 3)) + '/' + Format(Date2DMY(datFin, 2)) + '/' + strFRegistro + '''' +
                                                   ',''yyyy/mm/dd''),' + Format(decCantidadReg) + ',0,' + '''' + UserId + ''')';

                                    Message('%1', filtString1);
                                    ConnectionString := fntConfSincrMeta4;
                                    aADO_Con := aADO_Con.OracleConnection(ConnectionString);
                                    aADO_Con.Open;

                                    //aADO_Comm := aADO_Con.OracleConnection;

                                    aADO_Comm := aADO_Comm.OracleCommand(filtString1, aADO_Con);

                                    Message('%1', aADO_Comm.ExecuteNonQuery);

                                    aADO_Con.Close;

                                end;
                            end;

                        until rstConcept.Next = 0;

                until rstRecurso.Next = 0;

            Clear(rstEE);
            rstEE.SetCurrentKey("Company no.", "File no.", "Event code", "Start date and time", "Finish date and time");
            rstEE.SetFilter("Start date and time", '>=%1', CreateDateTime(datIni, 0T));
            rstEE.SetFilter("Finish date and time", '<=%1', CreateDateTime(datFin, 235900T));
            rstEE.ModifyAll(Exported, true);

        end;

        dlgVentana.Close;

    end;

    [Scope('OnPrem')]
    procedure fntRegistrarMeta4Sencillo(codFile: Code[20]; codEvent: Integer; datIni_t: Date; datFin_t: Date; decCantidadR: Decimal): Integer
    var
        aADO_Con: DotNet dnOracleConnection;
        aADO_Comm: DotNet dnOracleCommand;
        aADO_Reader: DotNet dnOracleDataReader;
        windows: Page "Select Filtering Dates";
        filtString1: Text[1024];
        filtString2: Text[1024];
        filtString3: Text[1024];
        filtString4: Text[1024];
        matMeta4: array[100000, 8] of Text[30];
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
        decCantidadReg: Decimal;
        rstRecurso: Record Employee;
        decLegajo: Decimal;
        codLegajo: Code[30];
        rstConcept: Record "Meta4 concept";
        datIni: Date;
        datFin: Date;
        rstEE: Record "Employee entry";
        rstEE2: Record "Employee entry";
        rstDate: Record Date;
        strFRegistro: Text[2];
        ServerName: Text;
        OracleDB: Text;
        ConnectionString: Text;
        UserName: Text;
        Pass: Text;
        intRegistrados: Integer;
        rstCompanyInfo: Record "Company Information";
    begin
        /*
        CLEAR(windows);
        windows.OPEN('Por favor, ingrese: \'+
                     '    Fecha de Inicio: #1###############'+
                     '    Fecha de Fin   : #2###############');
        
        windows.INPUT(1,datIni_t);
        windows.INPUT(2,datFin_t);
        */
        if datIni_t > datFin_t then
            Error(Err0001);


        //windows.CLOSE;
        /*
        dlgVentana.OPEN('Legajo:   #1##############\'+
                        'Empleado: #2#################################\'+
                        'Marcaje : #3##############\'+
                        'Estado: #4#################');
        */

        Clear(rstConcept);
        rstConcept.Get(codEvent);

        if Date2DMY(datIni_t, 1) < 15 then
            strFRegistro := '11'
        else
            strFRegistro := '25';

        if Round(decCantidadR / rstConcept."Hours per unit", 0.5) <> 0 then begin

            ConnectionString := fntConfSincrMeta4;
            /*
            ServerName := 'meta4.arbumasa.net.ar';
            OracleDB := 'meta4';
            UserName := 'meta4';
            Pass := 'meta4';
            ConnectionString := 'Data Source='+ServerName+';'+
                                'Integrated Security=false'+';'+
                                'Password='+Pass+';'+
                                'User ID='+UserName+';';
            */

            Clear(rstCompanyInfo);
            rstCompanyInfo.Get();
            if rstCompanyInfo."Demo Company" then begin

            end
            else begin

                filtString1 := '';
                filtString1 := 'INSERT INTO M4_VAL_INCIDENCIA (ID_SOCIEDAD, ID_EMPLEADO, FEC_ALTA_EMPLEADO, ' +
                               'ID_CONCEPTO, FEC_INICIO, FEC_FIN, VALOR, ID_TIPO_APLICACION,ID_USUARIO) VALUES (''01'',' +
                               '' + Format(codFile) + '' + ',(select MAX(FEC_ALTA_EMPLEADO) from M4T_FASES_ALTA ' +
                               'where ID_EMPLEADO = ' + codFile + '),' + Format(codEvent) + ',' +
                               'to_date(''' + Format(Date2DMY(datIni_t, 3)) + '/' + Format(Date2DMY(datIni_t, 2)) + '/' + strFRegistro + '''' +
                               ',''yyyy/mm/dd''),' +
                               'to_date(''' + Format(Date2DMY(datFin_t, 3)) + '/' + Format(Date2DMY(datIni_t, 2)) + '/' + strFRegistro + '''' +
                               ',''yyyy/mm/dd''),' + ConvertStr(Format(Round(decCantidadR / rstConcept."Hours per unit", 0.5)), ',', '.') +
                               ',0,' + '''' + UserId + ''')';


                //IF codFile = '80008' THEN
                //MESSAGE('%1',filtString1);

                aADO_Con := aADO_Con.OracleConnection('Data Source=meta4.arbumasa.net.ar;User Id=meta4;Password=meta4;');
                aADO_Con.Open;

                //aADO_Comm := aADO_Con.OracleConnection;

                aADO_Comm := aADO_Comm.OracleCommand(filtString1, aADO_Con);

                //aADO_Comm.ExecuteNonQuery;

                intRegistrados := aADO_Comm.ExecuteNonQuery;

                aADO_Con.Close;

            end;
        end;
        /*
        dlgVentana.CLOSE;
        */
        exit(intRegistrados);

    end;

    [Scope('OnPrem')]
    procedure fntCalcularNivel(t_decCantRepartida: Decimal; dtInicial: DateTime; t_rstTemp: Record "Employee entry" temporary) t_intNivel: Integer
    begin
        t_rstTemp.Reset;
        t_rstTemp.SetRange("File no.", t_rstMarcajes."File no.");
        t_rstTemp.SetFilter(Records, '<>%1', '');
        if t_rstTemp.Find('-') then
            repeat

                if (t_rstTemp."Start date and time" >= CreateDateTime(DT2Date(t_rstMarcajes."Markup date and time"), 0T)) and
                   (t_rstTemp."Start date and time" <= CreateDateTime(DT2Date(t_rstMarcajes."Markup date and time"), 235959T)) and
                   (t_rstTemp."Finish date and time" >= CreateDateTime(DT2Date(t_rstMarcajes."Markup date and time"), 0T)) and
                   (t_rstTemp."Finish date and time" <= CreateDateTime(DT2Date(t_rstMarcajes."Markup date and time"), 235959T)) then begin

                    t_decCantRepartida += t_rstTemp.Quantity;

                end;

            until t_rstTemp.Next = 0;

        Clear(rstJor);
        t_intNivel := 0;
        rstJor.SetRange("Workday code", rstEmployee."Workday code");
        rstJor.SetFilter("Starting day", '<=%1', Date2DWY(DT2Date(dtInicial), 1));
        rstJor.SetFilter("Ending day", '>=%1', Date2DWY(DT2Date(dtInicial), 1));
        rstJor.SetRange("Flexible o restricto", rstJor."Flexible o restricto"::Flexible);
        if rstJor.FindSet then
            repeat

                if rstJor."Cantidad horas" > t_decCantRepartida then begin

                    t_intNivel += 1;
                    t_decCantRepartida := rstJor."Cantidad horas" - t_decCantRepartida;
                    t_decCantRepartida := 0;

                end
                else begin

                    if rstJor."Cantidad horas" < t_decCantRepartida then begin

                        t_intNivel += 1;
                        t_decCantRepartida := t_decCantRepartida - rstJor."Cantidad horas";

                    end
                    else begin

                        t_intNivel += 2;
                        t_decCantRepartida := 0;

                    end;

                end;

            until (rstJor.Next = 0) or (t_decCantRepartida = 0);

        exit(t_intNivel);
    end;

    [Scope('OnPrem')]
    procedure fntCalcularNivelMixto(t_decCantRepartida: Decimal; dtInicial: DateTime; t_rstTemp: Record "Employee entry" temporary) t_intNivel: Integer
    begin
        t_rstTemp.Reset;
        t_rstTemp.SetRange("File no.", t_rstMarcajes."File no.");
        t_rstTemp.SetFilter(Records, '<>%1', '');
        if t_rstTemp.Find('-') then
            repeat

                if (t_rstTemp."Start date and time" >= CreateDateTime(DT2Date(t_rstMarcajes."Markup date and time"), 0T)) and
                   (t_rstTemp."Start date and time" <= CreateDateTime(DT2Date(t_rstMarcajes."Markup date and time"), 235959T)) and
                   (t_rstTemp."Finish date and time" >= CreateDateTime(DT2Date(t_rstMarcajes."Markup date and time"), 0T)) and
                   (t_rstTemp."Finish date and time" <= CreateDateTime(DT2Date(t_rstMarcajes."Markup date and time"), 235959T)) then begin

                    t_decCantRepartida += t_rstTemp.Quantity;

                end;

            until t_rstTemp.Next = 0;

        Clear(rstJor);
        t_intNivel := 0;
        rstJor.SetRange("Workday code", rstEmployee."Workday code");
        rstJor.SetFilter("Starting day", '<=%1', Date2DWY(DT2Date(dtInicial), 1));
        rstJor.SetFilter("Ending day", '>=%1', Date2DWY(DT2Date(dtInicial), 1));
        rstJor.SetRange("Flexible o restricto", rstJor."Flexible o restricto"::Mixto);
        if rstJor.FindSet then
            repeat

                if rstJor."Cantidad horas" <> 0 then begin

                    if rstJor."Cantidad horas" < t_decCantRepartida then begin

                        t_intNivel += 1;
                        t_decCantRepartida := t_decCantRepartida - rstJor."Cantidad horas";

                    end;
                    /*
                    ELSE
                    BEGIN

                      t_intNivel += 2;
                      t_decCantRepartida := 0;

                    END;
                     */

                end
                else
                    t_intNivel += 1;

            until (rstJor.Next = 0) or (t_decCantRepartida = 0);

        exit(t_intNivel);

    end;

    [Scope('OnPrem')]
    procedure fntInsertarMovEmpleado(var l_t_rstTemp: Record "Employee entry" temporary; var l_dtInicial: DateTime; var l_dtFinal: DateTime; var l_decQ: Decimal; var l_intCantOrig: Decimal; var l_intCantARepartir: Decimal; var l_intCantEstaRepartida: Decimal; l_rstJor: Record "Workday detail")
    var
        timInicio: Time;
        timFinal: Time;
        dtiInicial: DateTime;
    begin
        rstMovEmp.Init;
        intContados += 1;
        rstMovEmp.TransferFields(l_t_rstTemp);
        rstMovEmp."Entry no." := intContados;
        rstMovEmp.Insert(false);
        rstMovEmp."Start date and time" := l_dtInicial;
        rstMovEmp."Finish date and time" := l_dtFinal;
        rstMovEmp."Application date" := DT2Date(l_dtInicial);
        rstMovEmp."Import date" := CurrentDateTime;
        rstMovEmp.Quantity := l_decQ;
        rstMovEmp."Quantity to distribute" := l_intCantOrig;
        l_intCantARepartir -= Round(rstMovEmp.Quantity, decRedondeoSegundos);
        l_intCantEstaRepartida := Round(rstMovEmp.Quantity, decRedondeoSegundos);
        rstMovEmp."Event code" := l_rstJor."Meta4 code";
        rstMovEmp."Workday code" := l_rstJor."Workday code";
        rstMovEmp."News code" := l_rstJor."Meta4 code";
        rstMovEmp."% time" := Format(l_rstJor."Additional percentage value");
        rstMovEmp."User ID" := UserId;
        rstMovEmp."Workday level" := l_rstJor.Nivel;
        rstMovEmp.Modify(false);

        if rstMovEmp.Quantity = 0 then
            rstMovEmp.Delete;

        l_dtInicial := rstMovEmp."Finish date and time" + 1000;
        timInicio := DT2Time(l_dtInicial);
    end;

    [Scope('OnPrem')]
    procedure "----New----"()
    begin
    end;

    [Scope('OnPrem')]
    procedure fntLine(): Integer
    begin
        i += 10000;
        exit(i);
    end;

    [Scope('OnPrem')]
    procedure fntJub(codEmp: Code[10]): Decimal
    var
        rstEmp: Record Employee;
    begin
        Clear(rstEmp);
        rstEmp.Get(codEmp);

        exit(decGanBru * 0.11);
    end;

    [Scope('OnPrem')]
    procedure fnt19032(codEmp: Code[10]): Decimal
    var
        rstEmp: Record Employee;
    begin
        Clear(rstEmp);
        rstEmp.Get(codEmp);

        exit(decGanBru * 0.03);
    end;

    [Scope('OnPrem')]
    procedure fntOS(codEmp: Code[10]): Decimal
    var
        rstEmp: Record Employee;
    begin
        Clear(rstEmp);
        rstEmp.Get(codEmp);

        exit(decGanBru * 0.03);
    end;

    [Scope('OnPrem')]
    procedure fntDTaD(l_datFechaHoraLiq: Text; var l_datFechaLiq: Text)
    var
        l_rstMovIni: Record "Markup entry";
        l_datFechaIniLiq: Date;
        l_datFechaFinLiq: Date;
        l_datFechaHoraIniLiq: DateTime;
        l_datFechaHoraFinLiq: DateTime;
    begin
        Clear(l_rstMovIni);
        l_rstMovIni.SetFilter("Markup date and time", l_datFechaHoraLiq);
        Evaluate(l_datFechaHoraIniLiq, Format(l_rstMovIni.GetRangeMin("Markup date and time")));
        Evaluate(l_datFechaHoraFinLiq, Format(l_rstMovIni.GetRangeMax("Markup date and time")));
        l_datFechaIniLiq := DT2Date(l_datFechaHoraIniLiq);
        l_datFechaFinLiq := DT2Date(l_datFechaHoraFinLiq);
        l_datFechaLiq := Format(l_datFechaIniLiq) + '..' + Format(l_datFechaFinLiq);
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
}

