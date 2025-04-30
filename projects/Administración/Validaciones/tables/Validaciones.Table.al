table 50534 Validaciones
{

    fields
    {
        field(1; "Cód. fórmula"; Code[50])
        {
        }
        field(2; "Cód. validación"; Code[50])
        {
            TableRelation = "Maestro validaciones";
        }
        field(3; "No. línea"; Integer)
        {
            AutoIncrement = true;
        }
        field(4; Tabla; Integer)
        {
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = true;

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
        }
        field(5; Campo; Integer)
        {

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
        }
        field(6; Valor; Text[150])
        {

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
                                        rstFieldRef := rstRecordRef.Field(1);
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
                                        rstFieldRef := rstRecordRef.Field(1);
                                        Valor := rstFieldRef.Value;

                                    end;

                                end;

                            DATABASE::Formulas:
                                begin

                                    Clear(rstFormulas);
                                    if PAGE.RunModal(0, rstFormulas) = ACTION::LookupOK then begin

                                        Clear(rstRecordRef);
                                        rstRecordRef.Open(rstFieldRef.Relation);
                                        rstRecordRef.GetTable(rstFormulas);
                                        Clear(rstFieldRef);
                                        rstFieldRef := rstRecordRef.Field(1);
                                        Valor := rstFieldRef.Value;

                                    end;

                                end;

                            DATABASE::"Inflation Adjustment Register":
                                begin

                                    Clear(rstRecursos);
                                    if PAGE.RunModal(0, rstRecursos) = ACTION::LookupOK then begin

                                        Clear(rstRecordRef);
                                        rstRecordRef.Open(rstFieldRef.Relation);
                                        rstRecordRef.GetTable(rstRecursos);
                                        Clear(rstFieldRef);
                                        rstFieldRef := rstRecordRef.Field(1);
                                        Valor := rstFieldRef.Value;

                                    end;

                                end;

                            DATABASE::Item:
                                begin

                                    Clear(rstProductos);
                                    if PAGE.RunModal(0, rstProductos) = ACTION::LookupOK then begin

                                        Clear(rstRecordRef);
                                        rstRecordRef.Open(rstFieldRef.Relation);
                                        rstRecordRef.GetTable(rstProductos);
                                        Clear(rstFieldRef);
                                        rstFieldRef := rstRecordRef.Field(1);
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
                                        rstFieldRef := rstRecordRef.Field(1);
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
                                        rstFieldRef := rstRecordRef.Field(1);
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
                                        rstFieldRef := rstRecordRef.Field(1);
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
                                        rstFieldRef := rstRecordRef.Field(1);
                                        Valor := rstFieldRef.Value;

                                    end;

                                end;

                            else
                                Error('No form defined'); // Should be a text constant
                        end;

                    end
                    else begin

                        if (Tabla <> 0) and (Campo <> 0) then begin

                            case "No. línea" of
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

                                DATABASE::"Inflation Adjustment Register":
                                    begin

                                        Clear(rstRecursos);
                                        if PAGE.RunModal(0, rstRecursos) = ACTION::LookupOK then begin

                                            Clear(rstRecordRef);
                                            rstRecordRef.Open(rstFieldRef.Relation);
                                            rstRecordRef.GetTable(rstRecursos);
                                            Clear(rstFieldRef);
                                            rstFieldRef := rstRecordRef.Field(1);
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

                                DATABASE::Formulas:
                                    begin

                                        Clear(rstFormulas);
                                        if PAGE.RunModal(0, rstFormulas) = ACTION::LookupOK then begin

                                            Clear(rstRecordRef);
                                            rstRecordRef.Open(rstFieldRef.Relation);
                                            rstRecordRef.GetTable(rstFormulas);
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

            trigger OnValidate()
            var
                l_strOption: Text;
                j: Integer;
                cont: Integer;
                varType: Variant;
            begin
                /*
                CLEAR(rstRecordRef);
                rstRecordRef.OPEN(Tabla);
                l_strOption := '';
                j := 0;
                cont := 0;
                IF rstRecordRef.FINDFIRST THEN
                BEGIN
                  CLEAR(rstFieldRef);
                  rstFieldRef := rstRecordRef.FIELD(Campo);
                  IF (Valor <> '') AND (rstFieldRef.OPTIONCAPTION<>'') THEN
                  BEGIN
                    l_strOption := rstFieldRef.OPTIONCAPTION;
                    EVALUATE(cont,Valor);
                    FOR j := 1 TO cont DO
                    BEGIN
                      l_strOption := COPYSTR(l_strOption,STRPOS(l_strOption,',')+1,250);
                    END;
                    "Option value" := COPYstr(l_strOption,1,STRPOS(l_strOption,',')-1);
                  END;
                  IF (Valor = '') AND (rstFieldRef.OPTIONCAPTION<>'') THEN
                    "Option value" := '';
                END;
                */

            end;
        }
        field(7; Tipo; Option)
        {
            Description = ' {sin tipo},Condicionante {es la primera parte de la restricción, la que se evalúa contra el entorno para analizar si es aplicable o no en cada caso particular},Condición {es la segunda parte de la restricción, la que se evalúa contra el valor en sí para verificar que cumpla con la condición propuesta entre el Tipo condición y el valor},Condicionar {limita la cantidad y calidad de registros sobre los cuales se debe aplicar la evaluación},Sumatoria {realiza la sumatoria del campo especificado},Para cada una {ejecuta para cada registro}';
            OptionMembers = " ",Condicionante,"Condición",Condicionar,Sumatoria,"Para cada una";
        }
        field(8; "Tipo evaluación"; Option)
        {
            Description = ' {sin valor de condición},= {el dato debe ser igual al Valor},<> {el dato debe ser diferente al Valor},> {el dato debe ser mayor al Valor},< {el dato debe ser menor al Valor},| {el dato debe ser uno u otro Valor},& {el dato debe ser uno y otro Valor},[] {el dato debe estar entre varios Valores},( {},) {},+ {el dato debe sumar al Valor},- {el dato debe restar al Valor},* {el dato debe multiplicar al Valor},/ {el dato debe dividir al Valor},% {obtener el porcentual del Valor},@ {el dato debe ser mayor al Valor},..';
            OptionMembers = " ","=","<>",">","<","|","&","[]","(",")","+","-","*","/","%","@","..";
        }
        field(9; "Tipo de valor"; Option)
        {
            Description = 'Entrada fija {Se ingresa un valor fijo; este valor fijo no puede ser un parámetro},Entrada variable {Se ingresa un valor variable; este valor puede ser un parámetro},Salida valor {La salida de este registro es un valor dependiente del resto de la fórmula},Salida fórmula {La salida de este registro depende de una fórmula},Salida fija {La salida de este registro es un valor fijo independiente}';
            OptionMembers = "Entrada fija","Entrada variable","Salida valor","Salida fórmula","Salida fija";

            trigger OnValidate()
            begin
                if "Tipo de valor" = "Tipo de valor"::"Entrada variable" then
                    TestField(Tipo, Tipo::Condicionar);
            end;
        }
        field(10; "Posición"; Integer)
        {
        }
        field(11; "Nombre referencia"; Text[5])
        {
        }
        field(100; "Nombre tabla"; Text[30])
        {
            CalcFormula = Lookup(Object.Name WHERE(Type = CONST(Table),
                                                    ID = FIELD(Tabla)));
            FieldClass = FlowField;
        }
        field(101; "Nombre campo"; Text[30])
        {
            CalcFormula = Lookup(Field.FieldName WHERE(TableNo = FIELD(Tabla),
                                                        "No." = FIELD(Campo)));
            FieldClass = FlowField;
        }
        field(102; "Option value"; Text[30])
        {
            Caption = 'Valor opción';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Cód. fórmula", "Cód. validación", "No. línea")
        {
            Clustered = true;
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
        rstRecursos: Record Resource;
        rstProductos: Record Item;
        rstFormulas: Record Formulas;
        frmObjeto: Page "Lista objetos";
        frmField: Page "Lista campos";
}
