codeunit 50520 Validaciones
{
    // El objetivo de esta CU es obtener el resultado del cálculo de una fórmula en particular. Para ello, puede existir recursividad de
    // fórmulas, maestros, validaciones


    trigger OnRun()
    begin
    end;

    var
        Error0001: Label 'Debe completar todos los parámetros del cálculo';
        rstObjeto: Record "Object";
        rstField: Record "Field";
        rstRecordRef: RecordRef;
        rstFieldRef: FieldRef;
        flrFieldRef: FieldRef;
        rstMaestroValidaciones: Record "Maestro validaciones";
        flrFieldRef2: FieldRef;
        i: Integer;
        j: Integer;
        rstCliente: Record Customer;
        rstProveedor: Record Vendor;
        rstProyecto: Record Job;
        exrstValidaciones: Record Validaciones;
        rstMValidaciones: Record "Maestro validaciones";
        rstPersonalEmbarcado: Record "Personal embarcado";
        rstRecursos: Record Resource;
        rstProductos: Record Item;
        Text50001: Label 'El valor del campo %1 debe %2 %3';
        codFormula: Code[20];
        cduCompletarVariables: Codeunit "Completar variables";
        intNiveles: Integer;
        intContForm: Integer;
        intLinea: Integer;
        strTipo: Text;

    [Scope('OnPrem')]
    procedure funFindParameters(rstFormula: Record Formulas): Text[1024]
    var
        strExpresionConvertida: Text[250];
        strExpresionTemporal: Text[250];
        strExpresionTemporal2: Text[250];
        strParametros: array[50] of Text[5];
        strParametrosConvertidos: array[50] of Text[20];
        i: Integer;
        j: Integer;
        rstFormValid: Record "Formulas por Validación";
        rstValidaciones: Record Validaciones;
        cduValidar: Codeunit Validaciones;
        k: Integer;
        strFiltro: array[250, 3] of Text[30];
        blnEncontrado: Boolean;
        strTest: Text[30];
        intUbicacion: Integer;
        rstResultados: Record "Buffer resultados formulación";
        decValor: Decimal;
        cduParser: Codeunit Parser;
        strResultado: Text[1024];
    begin
        i := 0; //posición dentro de la expresión completa
        k := 0; //posicón dentro de la expresión definitiva
        j := 0; //posición dentro del nombre de la referencia

        strExpresionTemporal := rstFormula.Expresión;
        if strExpresionTemporal <> '' then begin

            repeat

                i += 1;
                j := i;

                if funEsReferencia(Format(strExpresionTemporal[i])) then begin

                    repeat

                        j += 1;

                    until (StrLen(rstFormula.Expresión) = j) or
                          funEsReferencia(Format(strExpresionTemporal[j]));

                    if i <> j then begin

                        k += 1;
                        if funEsReferencia(Format(strExpresionTemporal[j])) then
                            strParametros[k] := CopyStr(strExpresionTemporal, i + 1, j - i - 1)
                        else
                            strParametros[k] := CopyStr(strExpresionTemporal, i + 1, j - i - 1);
                        blnEncontrado := true;
                        i := j;

                    end;

                end
                else begin

                    if i <> j then begin

                        k += 1;
                        strParametros[k] := CopyStr(strExpresionTemporal, i + 1, j - i - 1);
                        blnEncontrado := true;
                        i := j;

                    end;

                end;

            until i = StrLen(rstFormula.Expresión);

        end;

        strExpresionConvertida := rstFormula.Expresión;

        Clear(rstFormValid);
        rstFormValid.SetRange("Cód. fórmula", rstFormula."Cód. fórmula");
        if rstFormValid.FindSet then
            repeat

                Clear(cduValidar);
                cduValidar.funIncrCont;
                cduValidar.fntValorFormula(rstFormula."Cód. fórmula");
                cduValidar.fntEjecutarMaestro(rstFormValid.Validación, strFiltro);

                for j := 1 to k do begin

                    Clear(rstValidaciones);
                    rstValidaciones.SetRange(rstValidaciones."Cód. validación", rstFormValid.Validación);
                    rstValidaciones.SetRange("Nombre referencia", strParametros[j]);
                    if rstValidaciones.FindFirst then begin

                        i := 1;
                        blnEncontrado := false;
                        if (strFiltro[i, 1] <> Format(rstValidaciones.Campo)) or (strFiltro[i, 2] <> rstValidaciones.Valor) then
                            repeat

                                Clear(rstResultados);
                                rstResultados.SetRange(rstResultados."Cód. fórmula", rstFormula."Cód. fórmula");
                                rstResultados.SetRange("Cód. maestro", rstValidaciones."Cód. validación");
                                rstResultados.SetRange(Referencia, rstValidaciones."Nombre referencia");
                                if rstResultados.FindFirst then begin


                                    strParametrosConvertidos[j] := rstResultados.Resultado;
                                    if Evaluate(decValor, strParametrosConvertidos[j]) then
                                        strParametrosConvertidos[j] := Format(decValor, 0, 1);
                                    intUbicacion := StrPos(strExpresionConvertida, strParametros[j]);

                                    strExpresionConvertida := CopyStr(strExpresionConvertida, 1, intUbicacion - 1) + strParametrosConvertidos[j] +
                                                                      CopyStr(strExpresionConvertida, intUbicacion +
                                                                      StrLen(strParametros[j]), 250);

                                    blnEncontrado := true;

                                end
                                else begin

                                    i += 1;
                                    if ((strFiltro[i, 1] = Format(rstValidaciones.Campo)) and (strFiltro[i, 2] = rstValidaciones.Valor)) then begin

                                        strParametrosConvertidos[j] := strFiltro[i, 3];
                                        if Evaluate(decValor, strParametrosConvertidos[j]) then
                                            strParametrosConvertidos[j] := Format(decValor, 0, 1);

                                        intUbicacion := StrPos(strExpresionConvertida, strParametros[j]);

                                        strExpresionConvertida := CopyStr(strExpresionConvertida, 1, intUbicacion - 1) + strParametrosConvertidos[j] +
                                                                          CopyStr(strExpresionConvertida, intUbicacion +
                                                                          StrLen(strParametros[j]), 250);

                                    end;

                                end;

                            until ((strFiltro[i, 1] = Format(rstValidaciones.Campo)) and (strFiltro[i, 2] = rstValidaciones.Valor)) or blnEncontrado;

                    end;

                end;

            until rstFormValid.Next = 0;

        Clear(cduParser);
        strExpresionConvertida := DelChr(strExpresionConvertida, '=', '"');
        //strResultado := FORMAT(cduParser.CalcDecimalExpr(strExpresionConvertida));
        strResultado := Format(cduParser.CalcDecimalExpr(strExpresionConvertida));
        exit(strResultado);
    end;

    [Scope('OnPrem')]
    procedure funEsOperador(strOperador: Text[1]): Boolean
    begin
        if Format(strOperador) in ['=', '<', '>', '|', '&', '[', ']', '(', ')', '+', '-', '*', '/', '%', '@', '0' .. '9', ','] then
            exit(true)
        else
            exit(false);
    end;

    [Scope('OnPrem')]
    procedure funEsReferencia(strOperador: Text[1]): Boolean
    begin
        if Format(strOperador) in ['"'] then
            exit(true)
        else
            exit(false);
    end;

    [Scope('OnPrem')]
    procedure funIncrCont()
    begin
        intNiveles += 1;
    end;

    [Scope('OnPrem')]
    procedure fntEjecutarMaestro(codMaestro: Code[50]; var strFiltro: array[250, 3] of Text[30])
    var
        rstValidaciones: Record Validaciones;
        rstMaestro: Record "Maestro validaciones";
        rfrTablaReferencia: RecordRef;
    begin
        Clear(rstMaestro);
        rstMaestro.Get(codMaestro);

        //Verifica la consistencia de la formulación. Si encuentra algún error, impide proseguir

        Clear(rstValidaciones);
        rstValidaciones.SetRange("Cód. validación", codMaestro);
        rstValidaciones.SetRange("Tipo de valor", rstValidaciones."Tipo de valor"::"Entrada fija");
        rstValidaciones.SetRange(Valor, '');
        if rstValidaciones.FindFirst then
            Error(Error0001);

        Clear(rstValidaciones);
        rstValidaciones.SetRange("Cód. validación", codMaestro);
        rstValidaciones.SetRange("Tipo de valor", rstValidaciones."Tipo de valor"::"Entrada variable");
        rstValidaciones.SetRange(Valor, '');
        if rstValidaciones.FindFirst then
            Error(Error0001);

        //Sino, por orden de clave va generando la ejecución

        i := 0;
        Clear(rstValidaciones);
        rstValidaciones.SetRange("Cód. validación", codMaestro);
        if rstValidaciones.FindFirst then
            repeat

                i += 1;

                if rstValidaciones."Tipo de valor" <> rstValidaciones."Tipo de valor"::"Salida fórmula" then begin

                    strFiltro[i, 1] := Format(rstValidaciones.Campo);
                    strFiltro[i, 2] := rstValidaciones.Valor;

                end
                else begin

                    strFiltro[i, 1] := '';
                    strFiltro[i, 2] := '';
                    strFiltro[i, 3] := '';

                end;

            until rstValidaciones.Next = 0;

        rfrTablaReferencia.Open(rstMaestro.Tabla);
        ValidarxCodigo(rfrTablaReferencia, '', strFiltro, rstValidaciones."Cód. fórmula", rstValidaciones."Cód. validación");
    end;

    [Scope('OnPrem')]
    procedure fntEjecutarMaestroSinSolicitar(codMaestro: Code[50]; var strFiltro: array[250, 3] of Text[30])
    var
        rstValidaciones: Record Validaciones;
        i: Integer;
        rstMaestro: Record "Maestro validaciones";
        rfrTablaReferencia: RecordRef;
    begin
        Clear(rstMaestro);
        rstMaestro.Get(codMaestro);

        Clear(rstValidaciones);
        rstValidaciones.SetRange("Cód. validación", codMaestro);
        rstValidaciones.SetRange("Tipo de valor", rstValidaciones."Tipo de valor"::"Entrada variable");
        rstValidaciones.SetRange(Valor, '');
        if rstValidaciones.FindFirst then
            Error(Error0001);

        i := 0;
        Clear(rstValidaciones);
        rstValidaciones.SetRange("Cód. validación", codMaestro);
        if rstValidaciones.FindFirst then
            repeat

                i += 1;

                strFiltro[i, 1] := Format(rstValidaciones.Campo);
                strFiltro[i, 2] := rstValidaciones.Valor;

            until rstValidaciones.Next = 0;

        rfrTablaReferencia.Open(rstMaestro.Tabla);
        ValidarxCodigo(rfrTablaReferencia, '', strFiltro, codFormula, rstValidaciones."Cód. validación");
    end;

    [Scope('OnPrem')]
    procedure ValidarxCodigo(rstRecord: RecordRef; strPosition: Text[250]; var strFiltro: array[250, 3] of Text[250]; codFormula: Code[50]; codValidacion: Code[20])
    begin
        //Si la función valida por código en lugar de por tabla, se utiliza esta función. Esto quiere decir que la función fue llamada desde
        //una fórmula

        Clear(rstRecordRef);
        rstRecordRef.Open(rstRecord.Number);
        rstRecordRef.SetPosition(strPosition);
        if rstRecordRef.Find('=') then begin

            Clear(rstMaestroValidaciones);
            rstMaestroValidaciones.SetRange("Cód. validación", codValidacion);
            rstMaestroValidaciones.SetRange(Tabla, rstRecord.Number);
            if rstMaestroValidaciones.Find('-') then
                repeat

                    VerificarValidaciones(strFiltro, codFormula, rstMaestroValidaciones."Cód. validación");

                until rstMaestroValidaciones.Next = 0;

        end
        else begin

            Clear(rstMaestroValidaciones);
            //rstMaestroValidaciones.SETRANGE(Tabla,rstRecord.NUMBER);
            rstMaestroValidaciones.SetRange("Cód. validación", codValidacion);
            if rstMaestroValidaciones.Find('-') then
                repeat

                    VerificarValidaciones(strFiltro, codFormula, codValidacion);

                until rstMaestroValidaciones.Next = 0;

        end;
    end;

    [Scope('OnPrem')]
    procedure ValidarxTabla(rstRecord: RecordRef; strPosition: Text[250]; var strFiltro: array[250, 3] of Text[250])
    begin
        Clear(rstRecordRef);
        rstRecordRef.Open(rstRecord.Number);
        rstRecordRef.SetPosition(strPosition);
        if rstRecordRef.Find('=') then begin

            Clear(rstMaestroValidaciones);
            rstMaestroValidaciones.SetRange(Tabla, rstRecord.Number);
            if rstMaestroValidaciones.Find('-') then
                repeat

                    VerificarValidaciones(strFiltro, codFormula, rstMaestroValidaciones."Cód. validación");

                until rstMaestroValidaciones.Next = 0;

        end
        else begin

            Clear(rstMaestroValidaciones);
            rstMaestroValidaciones.SetRange(Tabla, rstRecord.Number);
            if rstMaestroValidaciones.Find('-') then
                repeat

                    VerificarValidaciones(strFiltro, codFormula, rstMaestroValidaciones."Cód. validación");

                until rstMaestroValidaciones.Next = 0;

        end;
    end;

    [Scope('OnPrem')]
    procedure ValidarCampo(rstRecord: RecordRef; strPosition: Text[250]; intCampo: Integer)
    begin
        rstRecord.SetPosition(strPosition);
        Message('%1', rstRecord.Name);
        Message('%1', flrFieldRef.Number);
        Message('%1', flrFieldRef.Value);
    end;

    [Scope('OnPrem')]
    procedure VerificarValidaciones(var l_strFiltro: array[250, 3] of Text[250]; codFormula: Code[50]; codValidaciones: Code[20])
    var
        intValor: Decimal;
        decValor: Decimal;
        codValor: Code[150];
        datValor: Date;
        txtValor: Text[250];
        datFecha1: Date;
        datFecha2: Date;
        decTotalSumatoria: Decimal;
        decSumatoria: Decimal;
        rstValidaciones: Record Validaciones;
        rstBufferResultados: Record "Buffer resultados formulación";
        cduValidar: Codeunit "Completar variables";
        l_rstFormula: Record Formulas;
        h: Integer;
    begin
        Clear(flrFieldRef);

        Clear(rstValidaciones);
        rstValidaciones.SetRange("Cód. fórmula", codFormula);
        rstValidaciones.SetRange("Cód. validación", rstMaestroValidaciones."Cód. validación");
        rstValidaciones.SetFilter(rstValidaciones.Tipo, '%1|%2|%3', rstValidaciones.Tipo::Condicionante, rstValidaciones.Tipo::Condicionar,
                                  rstValidaciones.Tipo::Sumatoria);
        //rstValidaciones.SETFILTER(rstValidaciones.Valor,'<>%1',0);
        if rstValidaciones.FindFirst then
            repeat

                if rstValidaciones.Tabla <> 0 then begin

                    if rstRecordRef.Number <> rstValidaciones.Tabla then begin

                        for h := 1 to i do begin

                            l_strFiltro[h, 1] := '';
                            l_strFiltro[h, 2] := '';
                            l_strFiltro[h, 3] := '';

                        end;

                        Clear(rstRecordRef);
                        rstRecordRef.Open(rstValidaciones.Tabla);

                    end;

                    flrFieldRef := rstRecordRef.Field(rstValidaciones.Campo);

                    case rstValidaciones.Tipo of

                        rstValidaciones.Tipo::Condicionar:
                            begin

                                i := 0;
                                repeat

                                    i += 1;

                                until (Format(rstValidaciones.Tabla) = l_strFiltro[i, 1]) or (i = rstRecordRef.FieldCount);

                                case Format(flrFieldRef.Type) of

                                    'Text', 'Code':
                                        begin

                                            txtValor := l_strFiltro[i, 2];

                                        end;

                                    'Decimal':
                                        begin

                                            Evaluate(decValor, l_strFiltro[i, 2]);

                                        end;

                                    'Integer':
                                        begin

                                            Evaluate(intValor, l_strFiltro[i, 2]);

                                        end;

                                    'Option':
                                        begin

                                            Evaluate(intValor, l_strFiltro[i, 2]);

                                        end;

                                    'Date':
                                        begin

                                            if not (StrLen(l_strFiltro[i, 2]) > 8) then
                                                Evaluate(datValor, l_strFiltro[i, 2]);

                                        end;

                                end;

                                case Format(flrFieldRef.Type) of

                                    'Text', 'Code':
                                        begin

                                            case rstValidaciones."Tipo evaluación" of

                                                rstValidaciones."Tipo evaluación"::"<>":
                                                    flrFieldRef.SetFilter('<>', txtValor);
                                                rstValidaciones."Tipo evaluación"::"=":
                                                    flrFieldRef.SetRange(txtValor);
                                                rstValidaciones."Tipo evaluación"::">":
                                                    flrFieldRef.SetFilter('>', txtValor);
                                                rstValidaciones."Tipo evaluación"::"<":
                                                    flrFieldRef.SetFilter('<>', txtValor);
                                                rstValidaciones."Tipo evaluación"::"..":
                                                    flrFieldRef.SetFilter('', txtValor);

                                                else
                                                    Error('No es posible utilizar esta condición para %1', rstValidaciones.Tipo::Condicionar)

                                            end;

                                        end;

                                    'Decimal':
                                        begin

                                            case rstValidaciones."Tipo evaluación" of

                                                rstValidaciones."Tipo evaluación"::"<>":
                                                    flrFieldRef.SetFilter('<>', decValor);
                                                rstValidaciones."Tipo evaluación"::"=":
                                                    flrFieldRef.SetRange(decValor);
                                                rstValidaciones."Tipo evaluación"::">":
                                                    flrFieldRef.SetFilter('>', decValor);
                                                rstValidaciones."Tipo evaluación"::"<":
                                                    flrFieldRef.SetFilter('<>', decValor);
                                                rstValidaciones."Tipo evaluación"::"..":
                                                    flrFieldRef.SetFilter('', decValor);

                                                else
                                                    Error('No es posible utilizar esta condición para %1', rstValidaciones.Tipo::Condicionar)

                                            end;

                                        end;

                                    'Integer':
                                        begin

                                            case rstValidaciones."Tipo evaluación" of

                                                rstValidaciones."Tipo evaluación"::"<>":
                                                    flrFieldRef.SetFilter('<>', intValor);
                                                rstValidaciones."Tipo evaluación"::"=":
                                                    flrFieldRef.SetRange(intValor);
                                                rstValidaciones."Tipo evaluación"::">":
                                                    flrFieldRef.SetFilter('>', intValor);
                                                rstValidaciones."Tipo evaluación"::"<":
                                                    flrFieldRef.SetFilter('<>', intValor);
                                                rstValidaciones."Tipo evaluación"::"..":
                                                    flrFieldRef.SetFilter('', intValor);
                                                else
                                                    Error('No es posible utilizar esta condición para %1', rstValidaciones.Tipo::Condicionar)

                                            end;


                                        end;

                                    'Option':
                                        begin

                                            case rstValidaciones."Tipo evaluación" of

                                                rstValidaciones."Tipo evaluación"::"<>":
                                                    flrFieldRef.SetFilter('<>', intValor);
                                                rstValidaciones."Tipo evaluación"::"=":
                                                    flrFieldRef.SetRange(intValor);
                                                rstValidaciones."Tipo evaluación"::">":
                                                    flrFieldRef.SetFilter('>', intValor);
                                                rstValidaciones."Tipo evaluación"::"<":
                                                    flrFieldRef.SetFilter('<>', intValor);
                                                rstValidaciones."Tipo evaluación"::"..":
                                                    flrFieldRef.SetFilter('', intValor);

                                                else
                                                    Error('No es posible utilizar esta condición para %1', rstValidaciones.Tipo::Condicionar)

                                            end;

                                        end;

                                    'Date':
                                        begin

                                            if datValor <> 0D then begin

                                                case rstValidaciones."Tipo evaluación" of

                                                    rstValidaciones."Tipo evaluación"::"<>":
                                                        flrFieldRef.SetFilter('<>', datValor);
                                                    rstValidaciones."Tipo evaluación"::"=":
                                                        flrFieldRef.SetRange(datValor);
                                                    rstValidaciones."Tipo evaluación"::">":
                                                        flrFieldRef.SetFilter('>', datValor);
                                                    rstValidaciones."Tipo evaluación"::"<":
                                                        flrFieldRef.SetFilter('<>', datValor);
                                                    rstValidaciones."Tipo evaluación"::"..":
                                                        flrFieldRef.SetRange(CopyStr(Format(datValor), 1, StrPos(Format(datValor), '..')),
                                                                                 CopyStr(Format(datValor), StrPos(Format(datValor), '..') + 2, 50));

                                                    else
                                                        Error('No es posible utilizar esta condición para %1', rstValidaciones.Tipo::Condicionar)

                                                end;

                                            end
                                            else begin

                                                case rstValidaciones."Tipo evaluación" of

                                                    rstValidaciones."Tipo evaluación"::"<>":
                                                        flrFieldRef.SetFilter('<>', l_strFiltro[i, 2]);
                                                    rstValidaciones."Tipo evaluación"::"=":
                                                        flrFieldRef.SetRange(l_strFiltro[i, 2]);
                                                    rstValidaciones."Tipo evaluación"::">":
                                                        flrFieldRef.SetFilter('>', l_strFiltro[i, 2]);
                                                    rstValidaciones."Tipo evaluación"::"<":
                                                        flrFieldRef.SetFilter('<>', l_strFiltro[i, 2]);
                                                    rstValidaciones."Tipo evaluación"::"..":
                                                        begin

                                                            Evaluate(datFecha1, CopyStr(l_strFiltro[i, 2], 1, StrPos(l_strFiltro[i, 2], '..') - 1));
                                                            Evaluate(datFecha2, DelChr(CopyStr(l_strFiltro[i, 2], StrPos(l_strFiltro[i, 2], '..') + 2, 50), '=', '''D'));
                                                            flrFieldRef.SetRange(datFecha1, datFecha2);

                                                        end;
                                                    else
                                                        Error('No es posible utilizar esta condición para %1', rstValidaciones.Tipo::Condicionar)

                                                end;

                                            end;

                                        end;

                                end;

                            end;


                        rstValidaciones.Tipo::Sumatoria:
                            begin

                                i += 1;

                                decSumatoria := 0;
                                decTotalSumatoria := 0;

                                if rstRecordRef.FindFirst then
                                    repeat

                                        flrFieldRef := rstRecordRef.Field(rstValidaciones.Campo);
                                        decSumatoria := flrFieldRef.Value;
                                        decTotalSumatoria += decSumatoria;
                                        l_strFiltro[i, 3] := Format(decTotalSumatoria);

                                    until rstRecordRef.Next = 0
                                else begin

                                    decSumatoria := flrFieldRef.Value;
                                    decTotalSumatoria += decSumatoria;
                                    l_strFiltro[i, 3] := Format(decTotalSumatoria);

                                end;

                            end;

                        rstValidaciones.Tipo::Condicionante:
                            begin

                                case rstValidaciones."Tipo evaluación" of

                                    rstValidaciones."Tipo evaluación"::"<>":
                                        begin

                                            if not (rstValidaciones.Valor <> Format(flrFieldRef.Value)) then
                                                exit;

                                        end;

                                    rstValidaciones."Tipo evaluación"::"=":
                                        begin
                                            if not (rstValidaciones.Valor = Format(flrFieldRef.Value)) then
                                                exit;
                                        end;

                                    rstValidaciones."Tipo evaluación"::">":
                                        begin

                                            if not (rstValidaciones.Valor > Format(flrFieldRef.Value)) then
                                                exit;

                                        end;

                                    rstValidaciones."Tipo evaluación"::"<":
                                        begin

                                            if not (rstValidaciones.Valor < Format(flrFieldRef.Value)) then
                                                exit;

                                        end;

                                    rstValidaciones."Tipo evaluación"::"[]":
                                        begin

                                            if StrPos(rstValidaciones.Valor, Format(flrFieldRef.Value)) = 0 then
                                                exit;

                                        end;

                                end;

                            end;

                    end;

                end;

                case rstValidaciones."Tipo de valor" of

                    rstValidaciones."Tipo de valor"::"Salida fija":
                        fntInsertarBufferSalidaFija(l_strFiltro, rstValidaciones."Cód. fórmula", codValidaciones);

                    rstValidaciones."Tipo de valor"::"Salida valor":
                        fntInsertarBuffer(l_strFiltro, rstValidaciones);

                    rstValidaciones."Tipo de valor"::"Salida fórmula":
                        begin

                            if rstValidaciones.Tabla = 50603 then begin

                                cduValidar.fntVerificarFormula(rstValidaciones.Valor);
                                Clear(l_rstFormula);
                                l_rstFormula.Get(rstValidaciones.Valor);
                                l_strFiltro[i, 3] := funFindParameters(l_rstFormula);

                            end
                            else
                                fntEjecutarMaestro(rstValidaciones.Valor, l_strFiltro);

                            fntInsertarBuffer(l_strFiltro, rstValidaciones);

                        end;

                end;

            until rstValidaciones.Next = 0;

        VerificarCondicion;
    end;

    [Scope('OnPrem')]
    procedure VerificarCondicion()
    var
        rstValidaciones: Record Validaciones;
        flrFieldRef: FieldRef;
        txtValor: Variant;
        intValor: Decimal;
        decValor: Decimal;
        codValor: Code[150];
        datValor: Date;
        intValorReal: Decimal;
        decValorReal: Decimal;
        codValorReal: Code[150];
        txtValorReal: Text[150];
        i: Integer;
        Seperat: Integer;
        Result: Text[30];
    begin
        Clear(rstValidaciones);
        if rstRecordRef.Find('=') then begin

            rstValidaciones.SetRange("Cód. fórmula", codFormula);
            rstValidaciones.SetRange("Cód. validación", rstMaestroValidaciones."Cód. validación");
            rstValidaciones.SetRange(Tipo, rstValidaciones.Tipo::"Condición");
            rstValidaciones.SetRange(Tabla, rstMaestroValidaciones.Tabla);
            if rstValidaciones.Find('-') then
                repeat

                    txtValor := '';
                    intValor := 0;
                    decValor := 0;
                    codValor := '';

                    rstValidaciones.CalcFields("Nombre campo");
                    Clear(flrFieldRef2);
                    flrFieldRef2 := rstRecordRef.Field(rstValidaciones.Campo);

                    case Format(flrFieldRef2.Type) of

                        'Text':
                            begin

                                txtValor := rstValidaciones.Valor;
                                txtValorReal := Format(flrFieldRef2.Value);
                                ValidarText(txtValorReal, txtValor, rstValidaciones);

                            end;

                        'Decimal':
                            begin

                                Evaluate(decValor, rstValidaciones.Valor);
                                Evaluate(decValorReal, Format(flrFieldRef2.Value));
                                ValidarDecimal(decValorReal, decValor, rstValidaciones);

                            end;

                        'Code':
                            begin

                                Evaluate(codValor, rstValidaciones.Valor);
                                Evaluate(codValorReal, Format(flrFieldRef2.Value));
                                ValidarCode(codValorReal, codValor, rstValidaciones);

                            end;

                        'Integer':
                            begin

                                Evaluate(intValor, rstValidaciones.Valor);
                                Evaluate(intValorReal, Format(flrFieldRef2.Value));
                                ValidarDecimal(intValorReal, intValor, rstValidaciones);

                            end;

                        'Option':
                            begin

                                txtValor := rstValidaciones.Valor;
                                txtValorReal := Format(flrFieldRef2.OptionCaption());
                                Evaluate(intValorReal, Format(flrFieldRef2.Value));

                                for i := 0 to intValorReal do begin

                                    Seperat := StrPos(txtValorReal, ',');
                                    if Seperat <> 0 then begin

                                        Result := CopyStr(txtValorReal, 1, Seperat - 1);
                                        txtValorReal := CopyStr(txtValorReal, Seperat + 1, 200);
                                    end
                                    else
                                        Result := txtValorReal;

                                end;

                                ValidarText(Result, txtValor, rstValidaciones);

                            end;

                    end;

                until rstValidaciones.Next = 0;

        end;
    end;

    [Scope('OnPrem')]
    procedure Condicionar(l_strFiltro: Text[250])
    begin
    end;

    [Scope('OnPrem')]
    procedure fntGenerarFiltro(l_rstValidaciones: Record Validaciones; var strFiltro: array[250, 3] of Text[30])
    var
        rstValidaciones: Record Validaciones;
    begin
        i := 0;
        Clear(rstValidaciones);
        rstValidaciones.SetRange("Cód. fórmula", l_rstValidaciones."Cód. fórmula");
        rstValidaciones.SetRange("Cód. validación", l_rstValidaciones."Cód. validación");
        if rstValidaciones.FindFirst then
            repeat

                i += 1;

                if rstValidaciones."Tipo de valor" <> rstValidaciones."Tipo de valor"::"Salida fórmula" then begin

                    strFiltro[i, 1] := Format(rstValidaciones.Campo);
                    strFiltro[i, 2] := rstValidaciones.Valor;

                end;

            until rstValidaciones.Next = 0;
    end;

    [Scope('OnPrem')]
    procedure ValidarText(txtValorReal: Text[50]; txtValorDebido: Text[50]; l_rstValidaciones: Record Validaciones)
    begin

        strTipo := '';
        case l_rstValidaciones."Tipo evaluación" of
            l_rstValidaciones."Tipo evaluación"::"=":
                strTipo := ' ser igual a ';
            l_rstValidaciones."Tipo evaluación"::"<>":
                strTipo := ' ser diferente a ';
            l_rstValidaciones."Tipo evaluación"::"<":
                strTipo := ' ser menor a';
            l_rstValidaciones."Tipo evaluación"::">":
                strTipo := ' ser mayor a';
            l_rstValidaciones."Tipo evaluación"::"[]":
                strTipo := ' encontrarse entre la siguiente lista de valores:';

        end;

        case l_rstValidaciones."Tipo evaluación" of
            l_rstValidaciones."Tipo evaluación"::"<>":
                begin

                    if not (txtValorDebido <> txtValorReal) then
                        Error(Text50001, l_rstValidaciones."Nombre campo", strTipo, txtValorDebido);

                end;

            l_rstValidaciones."Tipo evaluación"::"=":
                begin

                    if not (txtValorDebido = txtValorReal) then
                        Error(Text50001, l_rstValidaciones."Nombre campo", strTipo, txtValorDebido);

                end;

            l_rstValidaciones."Tipo evaluación"::">":
                begin

                    if not (txtValorReal > txtValorDebido) then
                        Error(Text50001, l_rstValidaciones."Nombre campo", strTipo, txtValorDebido);

                end;

            l_rstValidaciones."Tipo evaluación"::"<":
                begin

                    if not (txtValorReal < txtValorDebido) then
                        Error(Text50001, l_rstValidaciones."Nombre campo", strTipo, txtValorDebido);

                end;

            l_rstValidaciones."Tipo evaluación"::"[]":
                begin

                    if StrPos(txtValorReal, txtValorDebido) = 0 then
                        Error(Text50001, l_rstValidaciones."Nombre campo", strTipo, txtValorDebido);

                end;

        end;
    end;

    [Scope('OnPrem')]
    procedure ValidarInteger(intValorReal: Integer; intValorDebido: Integer; l_rstValidaciones: Record Validaciones)
    begin
        strTipo := '';
        case l_rstValidaciones."Tipo evaluación" of
            l_rstValidaciones."Tipo evaluación"::"=":
                strTipo := ' ser igual a ';
            l_rstValidaciones."Tipo evaluación"::"<>":
                strTipo := ' ser diferente a ';
            l_rstValidaciones."Tipo evaluación"::"<":
                strTipo := ' ser menor a';
            l_rstValidaciones."Tipo evaluación"::">":
                strTipo := ' ser mayor a';
            l_rstValidaciones."Tipo evaluación"::"[]":
                strTipo := ' encontrarse entre la siguiente lista de valores:';

        end;

        case l_rstValidaciones."Tipo evaluación" of
            l_rstValidaciones."Tipo evaluación"::"<>":
                begin

                    if not (intValorDebido <> intValorReal) then
                        Error(Text50001, l_rstValidaciones."Nombre campo", strTipo, intValorDebido);

                end;

            l_rstValidaciones."Tipo evaluación"::"=":
                begin

                    if not (intValorDebido = intValorReal) then
                        Error(Text50001, l_rstValidaciones."Nombre campo", strTipo, intValorDebido);

                end;

            l_rstValidaciones."Tipo evaluación"::">":
                begin

                    if not (intValorReal > intValorDebido) then
                        Error(Text50001, l_rstValidaciones."Nombre campo", strTipo, intValorDebido);

                end;

            l_rstValidaciones."Tipo evaluación"::"<":
                begin

                    if not (intValorReal < intValorDebido) then
                        Error(Text50001, l_rstValidaciones."Nombre campo", strTipo, intValorDebido);

                end;

        end;
    end;

    [Scope('OnPrem')]
    procedure ValidarDecimal(decValorReal: Decimal; decValorDebido: Decimal; l_rstValidaciones: Record Validaciones)
    begin
        strTipo := '';
        case l_rstValidaciones."Tipo evaluación" of
            l_rstValidaciones."Tipo evaluación"::"=":
                strTipo := ' ser igual a ';
            l_rstValidaciones."Tipo evaluación"::"<>":
                strTipo := ' ser diferente a ';
            l_rstValidaciones."Tipo evaluación"::"<":
                strTipo := ' ser menor a';
            l_rstValidaciones."Tipo evaluación"::">":
                strTipo := ' ser mayor a';
            l_rstValidaciones."Tipo evaluación"::"[]":
                strTipo := ' encontrarse entre la siguiente lista de valores:';

        end;

        case l_rstValidaciones."Tipo evaluación" of
            l_rstValidaciones."Tipo evaluación"::"<>":
                begin

                    if not (decValorDebido <> decValorReal) then
                        Error(Text50001, l_rstValidaciones."Nombre campo", strTipo, decValorDebido);

                end;

            l_rstValidaciones."Tipo evaluación"::"=":
                begin

                    if not (decValorDebido = decValorReal) then
                        Error(Text50001, l_rstValidaciones."Nombre campo", strTipo, decValorDebido);

                end;

            l_rstValidaciones."Tipo evaluación"::">":
                begin

                    if not (decValorReal > decValorDebido) then
                        Error(Text50001, l_rstValidaciones."Nombre campo", strTipo, decValorDebido);

                end;

            l_rstValidaciones."Tipo evaluación"::"<":
                begin

                    if not (decValorReal < decValorDebido) then
                        Error(Text50001, l_rstValidaciones."Nombre campo", strTipo, decValorDebido);

                end;

        end;
    end;

    [Scope('OnPrem')]
    procedure ValidarCode(codValorReal: Code[150]; codValorDebido: Code[150]; l_rstValidaciones: Record Validaciones)
    begin

        strTipo := '';
        case l_rstValidaciones."Tipo evaluación" of
            l_rstValidaciones."Tipo evaluación"::"=":
                strTipo := ' ser igual a ';
            l_rstValidaciones."Tipo evaluación"::"<>":
                strTipo := ' ser diferente a ';
            l_rstValidaciones."Tipo evaluación"::"<":
                strTipo := ' ser menor a';
            l_rstValidaciones."Tipo evaluación"::">":
                strTipo := ' ser mayor a';
            l_rstValidaciones."Tipo evaluación"::"[]":
                strTipo := ' encontrarse entre la siguiente lista de valores:';

        end;

        case l_rstValidaciones."Tipo evaluación" of
            l_rstValidaciones."Tipo evaluación"::"<>":
                begin

                    if not (codValorDebido <> codValorReal) then begin
                        if codValorDebido = '' then
                            codValorDebido := 'VACÍO';
                        Error(Text50001, l_rstValidaciones."Nombre campo", strTipo, codValorDebido);

                    end;
                end;

            l_rstValidaciones."Tipo evaluación"::"=":
                begin

                    if not (codValorDebido = codValorReal) then begin
                        if codValorDebido = '' then
                            codValorDebido := 'VACÍO';
                        Error(Text50001, l_rstValidaciones."Nombre campo", strTipo, codValorDebido);
                    end;
                end;

            l_rstValidaciones."Tipo evaluación"::">":
                begin

                    if not (codValorReal > codValorDebido) then begin
                        if codValorDebido = '' then
                            codValorDebido := 'VACÍO';
                        Error(Text50001, l_rstValidaciones."Nombre campo", strTipo, codValorDebido);
                    end;
                end;

            l_rstValidaciones."Tipo evaluación"::"<":
                begin

                    if not (codValorReal < codValorDebido) then begin
                        if codValorDebido = '' then
                            codValorDebido := 'VACÍO';
                        Error(Text50001, l_rstValidaciones."Nombre campo", strTipo, codValorDebido);
                    end;
                end;

            l_rstValidaciones."Tipo evaluación"::"[]":
                begin

                    if StrPos(codValorDebido, codValorReal) = 0 then begin
                        if codValorDebido = '' then
                            codValorDebido := 'VACÍO';
                        Error(Text50001, l_rstValidaciones."Nombre campo", strTipo, codValorDebido);
                    end;
                end;

        end;
    end;

    [Scope('OnPrem')]
    procedure fntValorFormula(l_codFormula: Code[20])
    begin
        codFormula := l_codFormula;
    end;

    [Scope('OnPrem')]
    procedure fntInsertarBuffer(var l_strFiltro: array[250, 3] of Text[250]; l_rstValidaciones: Record Validaciones)
    var
        rstBufferResultados: Record "Buffer resultados formulación";
    begin
        intLinea += 1;
        Clear(rstBufferResultados);
        rstBufferResultados."Cód. fórmula" := codFormula;
        rstBufferResultados."Cód. maestro" := l_rstValidaciones."Cód. validación";
        rstBufferResultados."No. línea" := intLinea;//l_rstValidaciones."No. línea";
        rstBufferResultados.Referencia := l_rstValidaciones."Nombre referencia";
        rstBufferResultados.Resultado := l_strFiltro[i, 3];
        rstBufferResultados.Nivel := intNiveles;

        rstBufferResultados.Insert;
    end;

    [Scope('OnPrem')]
    procedure fntInsertarBufferSalidaFija(var l_strFiltro: array[250, 3] of Text[250]; codFormula: Code[50]; codValidaciones: Code[20])
    var
        rstValidaciones: Record Validaciones;
        rstBufferResultados: Record "Buffer resultados formulación";
    begin
        i := 0;
        Clear(rstValidaciones);
        rstValidaciones.SetRange("Cód. fórmula", codFormula);
        rstValidaciones.SetRange("Cód. validación", codValidaciones);
        rstValidaciones.SetRange(rstValidaciones."Tipo de valor", rstValidaciones."Tipo de valor"::"Salida fija");
        if rstValidaciones.FindFirst then
            repeat

                i += 1;
                intLinea += 1;
                Clear(rstBufferResultados);
                rstBufferResultados."Cód. fórmula" := codFormula;
                rstBufferResultados."Cód. maestro" := rstValidaciones."Cód. validación";
                rstBufferResultados."No. línea" := intLinea;//rstValidaciones."No. línea";
                rstBufferResultados.Referencia := rstValidaciones."Nombre referencia";
                rstBufferResultados.Resultado := rstValidaciones.Valor;
                rstBufferResultados.Nivel := intNiveles;
                rstBufferResultados.Insert;

            until rstValidaciones.Next = 0;
    end;
}

