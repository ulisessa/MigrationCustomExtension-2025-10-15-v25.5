table 50598 "Ejecutor validaciones"
{

    fields
    {
        field(1; "Cód. validación"; Code[50])
        {
            Caption = 'Cód. validación';
            ToolTip = 'Specifies the value of the Cód. validación field.';
            TableRelation = "Maestro validaciones";
        }
        field(2; "No. línea"; Integer)
        {
            Caption = 'Line No.';
            ToolTip = 'Specifies the value of the Line No field.';
            AutoIncrement = true;
        }
        field(3; Tabla; Integer)
        {
            Caption = 'Tabla';
            ToolTip = 'Specifies the value of the Tabla field.';
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = true;
            /*
            trigger OnLookup()
            begin
                Clear(frmObjeto);
                Clear(rstObjeto);
                frmObjeto.LookupMode := true;
                rstObjeto.SetRange(Type, rstObjeto.Type::Table);
                frmObjeto.SetTableView(rstObjeto);
                if frmObjeto.RunModal = ACTION::LookupOK then begin

                    frmObjeto.GetRecord(rstObjeto);
                    Tabla := rstObjeto.ID;

                end;
            end;
            */
        }
        field(4; Campo; Integer)
        {
            Caption = 'Campo';
            ToolTip = 'Specifies the value of the Campo field.';

            /*
            trigger OnLookup()
            begin
                Clear(frmField);
                Clear(rstField);
                frmField.LookupMode := true;
                rstField.SetRange(rstField.TableNo, Tabla);
                frmField.SetTableView(rstField);
                if frmField.RunModal = ACTION::LookupOK then begin

                    frmField.GetRecord(rstField);
                    Campo := rstField."No.";

                end;
            end;
            */
        }
        field(5; Valor; Text[150])
        {
            Caption = 'Valor';
            ToolTip = 'Specifies the value of the Valor field.';

            trigger OnLookup()
            begin
                Clear(rstRecordRef);
                rstRecordRef.Open(Tabla);
                if rstRecordRef.FindFirst then begin

                    Clear(rstFieldRef);
                    rstFieldRef := rstRecordRef.Field(Campo);
                    if rstFieldRef.Relation <> 0 then begin

                        case rstFieldRef.Relation of
                            DATABASE::Customer:
                                begin

                                    Clear(rstCliente);
                                    if PAGE.RunModal(0, rstCliente) = ACTION::LookupOK then begin

                                        Clear(rstRecordRef);
                                        rstRecordRef.Open(rstFieldRef.Relation);
                                        rstRecordRef.GetTable(rstCliente);
                                        Clear(rstFieldRef);
                                        rstFieldRef := rstRecordRef.Field(Campo);
                                        Valor := rstFieldRef.Value;

                                    end;

                                end;

                            DATABASE::"Maestro validaciones":
                                begin

                                    Clear(rstMValidaciones);
                                    if PAGE.RunModal(0, rstMValidaciones) = ACTION::LookupOK then begin

                                        Clear(rstRecordRef);
                                        rstRecordRef.Open(rstFieldRef.Relation);
                                        rstRecordRef.GetTable(rstMValidaciones);
                                        Clear(rstFieldRef);
                                        rstFieldRef := rstRecordRef.Field(Campo);
                                        Valor := rstFieldRef.Value;

                                    end;

                                end;

                            DATABASE::Job:
                                begin

                                    Clear(rstProyecto);
                                    if PAGE.RunModal(0, rstProyecto) = ACTION::LookupOK then begin

                                        Clear(rstRecordRef);
                                        rstRecordRef.Open(rstFieldRef.Relation);
                                        rstRecordRef.GetTable(rstProyecto);
                                        Clear(rstFieldRef);
                                        rstFieldRef := rstRecordRef.Field(Campo);
                                        Valor := rstFieldRef.Value;

                                    end;

                                end;

                            DATABASE::Vendor:
                                begin

                                    Clear(rstProveedor);
                                    if PAGE.RunModal(0, rstProveedor) = ACTION::LookupOK then begin

                                        Clear(rstRecordRef);
                                        rstRecordRef.Open(rstFieldRef.Relation);
                                        rstRecordRef.GetTable(rstProveedor);
                                        Clear(rstFieldRef);
                                        rstFieldRef := rstRecordRef.Field(Campo);
                                        Valor := rstFieldRef.Value;

                                    end;

                                end;

                            DATABASE::"Personal embarcado":
                                begin

                                    Clear(rstPersonalEmbarcado);
                                    if PAGE.RunModal(0, rstPersonalEmbarcado) = ACTION::LookupOK then begin

                                        Clear(rstRecordRef);
                                        rstRecordRef.Open(rstFieldRef.Relation);
                                        rstRecordRef.GetTable(rstPersonalEmbarcado);
                                        Clear(rstFieldRef);
                                        rstFieldRef := rstRecordRef.Field(Campo);
                                        Valor := rstFieldRef.Value;

                                    end;

                                end;

                            DATABASE::Validaciones:
                                begin

                                    Clear(rstValidaciones);
                                    if PAGE.RunModal(0, rstValidaciones) = ACTION::LookupOK then begin

                                        Clear(rstRecordRef);
                                        rstRecordRef.Open(rstFieldRef.Relation);
                                        rstRecordRef.GetTable(rstValidaciones);
                                        Clear(rstFieldRef);
                                        rstFieldRef := rstRecordRef.Field(Campo);
                                        Valor := rstFieldRef.Value;

                                    end;

                                end;

                            else
                                Error('No form defined'); // Should be a text constant
                        end;

                    end
                    else begin

                        if (Tabla <> 0) and (Campo <> 0) then begin

                            case Tabla of
                                DATABASE::Customer:
                                    begin
                                        Clear(rstCliente);
                                        if PAGE.RunModal(0, rstCliente) = ACTION::LookupOK then begin

                                            Clear(rstRecordRef);
                                            rstRecordRef.Open(Tabla);
                                            rstRecordRef.GetTable(rstCliente);
                                            Clear(rstFieldRef);
                                            rstFieldRef := rstRecordRef.Field(Campo);
                                            Valor := rstFieldRef.Value;

                                        end;

                                    end;

                                DATABASE::Job:
                                    begin
                                        Clear(rstProyecto);
                                        if PAGE.RunModal(0, rstProyecto) = ACTION::LookupOK then begin

                                            Clear(rstRecordRef);
                                            rstRecordRef.Open(Tabla);
                                            rstRecordRef.GetTable(rstProyecto);
                                            Clear(rstFieldRef);
                                            rstFieldRef := rstRecordRef.Field(Campo);
                                            Valor := rstFieldRef.Value;

                                        end;

                                    end;

                                DATABASE::Vendor:
                                    begin
                                        Clear(rstProveedor);
                                        if PAGE.RunModal(0, rstProveedor) = ACTION::LookupOK then begin

                                            Clear(rstRecordRef);
                                            rstRecordRef.Open(Tabla);
                                            rstRecordRef.GetTable(rstProveedor);
                                            Clear(rstFieldRef);
                                            rstFieldRef := rstRecordRef.Field(Campo);
                                            Valor := rstFieldRef.Value;

                                        end;

                                    end;

                                DATABASE::"Personal embarcado":
                                    begin

                                        Clear(rstPersonalEmbarcado);
                                        if PAGE.RunModal(0, rstPersonalEmbarcado) = ACTION::LookupOK then begin

                                            Clear(rstRecordRef);
                                            rstRecordRef.Open(rstFieldRef.Relation);
                                            rstRecordRef.GetTable(rstPersonalEmbarcado);
                                            Clear(rstFieldRef);
                                            rstFieldRef := rstRecordRef.Field(Campo);
                                            Valor := rstFieldRef.Value;

                                        end;

                                    end;

                                DATABASE::"Maestro validaciones":
                                    begin
                                        Clear(rstMValidaciones);
                                        if PAGE.RunModal(0, rstMValidaciones) = ACTION::LookupOK then begin

                                            Clear(rstRecordRef);
                                            rstRecordRef.Open(Tabla);
                                            rstRecordRef.GetTable(rstMValidaciones);
                                            Clear(rstFieldRef);
                                            rstFieldRef := rstRecordRef.Field(Campo);
                                            Valor := rstFieldRef.Value;

                                        end;

                                    end;

                                DATABASE::Validaciones:
                                    begin
                                        Clear(rstValidaciones);
                                        if PAGE.RunModal(0, rstValidaciones) = ACTION::LookupOK then begin

                                            Clear(rstRecordRef);
                                            rstRecordRef.Open(Tabla);
                                            rstRecordRef.GetTable(rstValidaciones);
                                            Clear(rstFieldRef);
                                            rstFieldRef := rstRecordRef.Field(Campo);
                                            Valor := rstFieldRef.Value;

                                        end;

                                    end;

                                else
                                    Error('No hay ningún formulario definido'); // Should be a text constant
                            end;

                        end;

                    end;

                end;
            end;
        }
        field(7; Tipo; Option)
        {
            Caption = 'Tipo';
            ToolTip = 'Specifies the value of the Tipo field.';
            OptionMembers = " ",Condicionante,"Condición",Condicionar,Sumatoria;
        }
        field(8; "Tipo condición"; Option)
        {
            Caption = 'Tipo condición';
            ToolTip = 'Specifies the value of the Tipo condición field.';
            OptionMembers = " ","=","<>",">","<","|","&","[]","(",")","+","-","*","/","%","@","Para cada","..";
        }
        field(100; "Nombre tabla"; Text[30])
        {
            Caption = 'Nombre tabla';
            ToolTip = 'Specifies the value of the Nombre tabla field.';
            CalcFormula = Lookup(Object.Name WHERE(Type = CONST(Table),
                                                    ID = FIELD(Tabla)));
            FieldClass = FlowField;
        }
        field(101; "Nombre campo"; Text[30])
        {
            Caption = 'Nombre campo';
            ToolTip = 'Specifies the value of the Nombre campo field.';
            CalcFormula = Lookup(Field.FieldName WHERE(TableNo = FIELD(Tabla),
                                                        "No." = FIELD(Campo)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Cód. validación", "No. línea")
        {
            Clustered = true;
        }
        key(Key2; "No. línea")
        {
        }
    }

    fieldgroups
    {
    }

    var
        rstObjeto: Record "Object";
        rstField: Record "Field";
        rstRecordRef: RecordRef;
        rstFieldRef: FieldRef;
        flrFieldRef: FieldRef;
        rstMaestroValidaciones: Record "Maestro validaciones";
        Text50001: Label 'El valor del campo %1 debe ser %2 a %3';
        flrFieldRef2: FieldRef;
        i: Integer;
        j: Integer;
        rstCliente: Record Customer;
        rstProveedor: Record Vendor;
        rstProyecto: Record Job;
        rstValidaciones: Record Validaciones;
        rstMValidaciones: Record "Maestro validaciones";
        rstPersonalEmbarcado: Record "Personal embarcado";

    [Scope('OnPrem')]
    procedure Validar(rstRecord: RecordRef; strPosition: Text[250]; var strFiltro: array[250, 4] of Text[250])
    begin
        Clear(rstRecordRef);
        rstRecordRef.Open(rstRecord.Number);
        rstRecordRef.SetPosition(strPosition);
        if rstRecordRef.Find('=') then begin

            Clear(rstMaestroValidaciones);
            rstMaestroValidaciones.SetRange(Tabla, rstRecord.Number);
            if rstMaestroValidaciones.Find('-') then
                repeat

                    VerificarValidaciones(strFiltro);

                until rstMaestroValidaciones.Next = 0;

        end
        else begin

            Clear(rstMaestroValidaciones);
            rstMaestroValidaciones.SetRange(Tabla, rstRecord.Number);
            if rstMaestroValidaciones.Find('-') then
                repeat

                    VerificarValidaciones(strFiltro);

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
    procedure VerificarValidaciones(var l_strFiltro: array[250, 4] of Text[250])
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
    begin
        Clear(flrFieldRef);
        Clear(rstValidaciones);
        rstValidaciones.SetRange("Cód. fórmula", rstMaestroValidaciones."Cód. validación");
        rstValidaciones.SetFilter(rstValidaciones.Tipo, '%1|%2|%3', rstValidaciones.Tipo::Condicionante, rstValidaciones.Tipo::Condicionar,
                                  rstValidaciones.Tipo::Sumatoria);
        rstValidaciones.SetRange("No. línea", rstMaestroValidaciones.Tabla);
        if rstValidaciones.FindFirst then
            repeat

                flrFieldRef := rstRecordRef.Field(rstValidaciones.Tabla);

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

                                        if Evaluate(datValor, l_strFiltro[i, 2]) then;

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

                                                        Evaluate(datFecha1, CopyStr(l_strFiltro[i, 2], 1, StrPos(l_strFiltro[i, 2], '..') - 2));
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

                            if rstRecordRef.FindFirst then
                                repeat

                                    flrFieldRef := rstRecordRef.Field(rstValidaciones.Tabla);
                                    decSumatoria := flrFieldRef.Value;
                                    decTotalSumatoria += decSumatoria;
                                    l_strFiltro[i, 3] := Format(decTotalSumatoria);

                                until rstRecordRef.Next = 0;

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

                                        if StrPos(Format(flrFieldRef.Value), rstValidaciones.Valor) = 0 then
                                            exit;

                                    end;

                            end;

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

            rstValidaciones.SetRange("Cód. fórmula", rstMaestroValidaciones."Cód. validación");
            rstValidaciones.SetRange(rstValidaciones.Tipo, rstValidaciones.Tipo::"Condición");
            rstValidaciones.SetRange("No. línea", rstMaestroValidaciones.Tabla);
            if rstValidaciones.Find('-') then
                repeat

                    txtValor := '';
                    intValor := 0;
                    decValor := 0;
                    codValor := '';

                    rstValidaciones.CalcFields("Nombre campo");
                    Clear(flrFieldRef2);
                    flrFieldRef2 := rstRecordRef.Field(rstValidaciones."No. línea");

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
    procedure ValidarText(txtValorReal: Text[50]; txtValorDebido: Text[50]; l_rstValidaciones: Record Validaciones)
    begin


        case l_rstValidaciones."Tipo evaluación" of
            l_rstValidaciones."Tipo evaluación"::"<>":
                begin

                    if not (txtValorDebido <> txtValorReal) then
                        Error(Text50001, l_rstValidaciones."Nombre campo", l_rstValidaciones.Tipo, txtValorDebido);

                end;

            l_rstValidaciones."Tipo evaluación"::"=":
                begin

                    if not (txtValorDebido = txtValorReal) then
                        Error(Text50001, l_rstValidaciones."Nombre campo", l_rstValidaciones.Tipo, txtValorDebido);

                end;

            l_rstValidaciones."Tipo evaluación"::">":
                begin

                    if not (txtValorReal > txtValorDebido) then
                        Error(Text50001, l_rstValidaciones."Nombre campo", l_rstValidaciones.Tipo, txtValorDebido);

                end;

            l_rstValidaciones."Tipo evaluación"::"<":
                begin

                    if not (txtValorReal < txtValorDebido) then
                        Error(Text50001, l_rstValidaciones."Nombre campo", l_rstValidaciones.Tipo, txtValorDebido);

                end;

            l_rstValidaciones."Tipo evaluación"::"[]":
                begin

                    if StrPos(txtValorReal, txtValorDebido) = 0 then
                        Error(Text50001, l_rstValidaciones."Nombre campo", l_rstValidaciones.Tipo, txtValorDebido);

                end;

        end;
    end;

    [Scope('OnPrem')]
    procedure ValidarInteger(intValorReal: Integer; intValorDebido: Integer; l_rstValidaciones: Record Validaciones)
    begin
        case l_rstValidaciones."Tipo evaluación" of
            l_rstValidaciones."Tipo evaluación"::"<>":
                begin

                    if not (intValorDebido <> intValorReal) then
                        Error(Text50001, l_rstValidaciones."Nombre campo", l_rstValidaciones.Tipo, intValorDebido);

                end;

            l_rstValidaciones."Tipo evaluación"::"=":
                begin

                    if not (intValorDebido = intValorReal) then
                        Error(Text50001, l_rstValidaciones."Nombre campo", l_rstValidaciones.Tipo, intValorDebido);

                end;

            l_rstValidaciones."Tipo evaluación"::">":
                begin

                    if not (intValorReal > intValorDebido) then
                        Error(Text50001, l_rstValidaciones."Nombre campo", l_rstValidaciones.Tipo, intValorDebido);

                end;

            l_rstValidaciones."Tipo evaluación"::"<":
                begin

                    if not (intValorReal < intValorDebido) then
                        Error(Text50001, l_rstValidaciones."Nombre campo", l_rstValidaciones.Tipo, intValorDebido);

                end;

        end;
    end;

    [Scope('OnPrem')]
    procedure ValidarDecimal(decValorReal: Decimal; decValorDebido: Decimal; l_rstValidaciones: Record Validaciones)
    begin
        case l_rstValidaciones."Tipo evaluación" of
            l_rstValidaciones."Tipo evaluación"::"<>":
                begin

                    if not (decValorDebido <> decValorReal) then
                        Error(Text50001, l_rstValidaciones."Nombre campo", l_rstValidaciones.Tipo, decValorDebido);

                end;

            l_rstValidaciones."Tipo evaluación"::"=":
                begin

                    if not (decValorDebido = decValorReal) then
                        Error(Text50001, l_rstValidaciones."Nombre campo", l_rstValidaciones.Tipo, decValorDebido);

                end;

            l_rstValidaciones."Tipo evaluación"::">":
                begin

                    if not (decValorReal > decValorDebido) then
                        Error(Text50001, l_rstValidaciones."Nombre campo", l_rstValidaciones.Tipo, decValorDebido);

                end;

            l_rstValidaciones."Tipo evaluación"::"<":
                begin

                    if not (decValorReal < decValorDebido) then
                        Error(Text50001, l_rstValidaciones."Nombre campo", l_rstValidaciones.Tipo, decValorDebido);

                end;

        end;
    end;

    [Scope('OnPrem')]
    procedure ValidarCode(codValorReal: Code[150]; codValorDebido: Code[150]; l_rstValidaciones: Record Validaciones)
    begin
        case l_rstValidaciones."Tipo evaluación" of
            l_rstValidaciones."Tipo evaluación"::"<>":
                begin

                    if not (codValorDebido <> codValorReal) then
                        Error(Text50001, l_rstValidaciones."Nombre campo", l_rstValidaciones.Tipo, codValorDebido);

                end;

            l_rstValidaciones."Tipo evaluación"::"=":
                begin

                    if not (codValorDebido = codValorReal) then
                        Error(Text50001, l_rstValidaciones."Nombre campo", l_rstValidaciones.Tipo, codValorDebido);

                end;

            l_rstValidaciones."Tipo evaluación"::">":
                begin

                    if not (codValorReal > codValorDebido) then
                        Error(Text50001, l_rstValidaciones."Nombre campo", l_rstValidaciones.Tipo, codValorDebido);

                end;

            l_rstValidaciones."Tipo evaluación"::"<":
                begin

                    if not (codValorReal < codValorDebido) then
                        Error(Text50001, l_rstValidaciones."Nombre campo", l_rstValidaciones.Tipo, codValorDebido);

                end;

            l_rstValidaciones."Tipo evaluación"::"[]":
                begin

                    if StrPos(codValorDebido, codValorReal) = 0 then
                        Error(Text50001, l_rstValidaciones."Nombre campo", l_rstValidaciones.Tipo, codValorDebido);

                end;

        end;
    end;
}

