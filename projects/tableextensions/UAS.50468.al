tableextension 50468 tableextension50468 extends "Dimension Value"
{
    Caption = 'Dimension Value';
    fields
    {
        modify("Dimension Code")
        {
            Caption = 'Dimension Code';
        }
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("Dimension Value Type")
        {
            Caption = 'Dimension Value Type';
            OptionCaption = 'Standard,Heading,Total,Begin-Total,End-Total';
        }
        modify("Consolidation Code")
        {
            Caption = 'Consolidation Code';
        }
        modify("Global Dimension No.")
        {
            Caption = 'Global Dimension No.';
        }
        modify("Map-to IC Dimension Code")
        {
            Caption = 'Map-to IC Dimension Code';
        }
        modify("Map-to IC Dimension Value Code")
        {
            Caption = 'Map-to IC Dimension Value Code';
        }
        modify("Dimension Value ID")
        {
            Caption = 'Dimension Value ID';
        }
        modify("Last Modified Date Time")
        {
            Caption = 'Last Modified Date Time';
        }
        field(50000; Programa; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(50001; "Marea/Mes/Ciudad"; Code[10])
        {
        }
        field(50002; "Subdepartamento tierra"; Code[10])
        {
        }
        field(50003; "Concepto imputación"; Code[10])
        {
        }
        field(50004; "Item Presupuestario"; Code[10])
        {
        }
        field(50005; "Mes costo"; Code[10])
        {
        }
        field(50006; "Address code"; Code[2])
        {
            Caption = 'Cód. dirección';
            NotBlank = true;
        }
        field(50007; "Area code"; Code[2])
        {
            Caption = 'Cód. área';
            NotBlank = true;
            TableRelation = "Resource family".Nombre WHERE("No" = FIELD("Address code"),
                                                            Nombre = FIELD("Area code"));
        }
        field(50008; "Location code"; Code[30])
        {
            Caption = 'Cód. depósito';
            TableRelation = Location;
        }
        field(50009; "Use code"; Option)
        {
            Caption = 'Cód. utilización';
            OptionMembers = " ",Planta,Cliente,Buque,Estructura,Tercero;
        }
        field(50010; "Establecimiento No. Oficial"; Code[10])
        {
            Caption = 'Establecimiento No. Oficial';
        }
        field(50011; "% Committed to process"; Option)
        {
            Caption = '% Comprometido de producción';
            OptionMembers = " ","10%","20%","30%","40%","50%","60%","70%","80%","90%","100%";
        }
        field(50012; "Short code"; Code[2])
        {
            Caption = 'Cód. corto';
            DataClassification = ToBeClassified;
        }
        field(50013; "Formato codificacion pallet"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Correlativo por año,Juliano ordenado';
            OptionMembers = " ","Correlativo por año","Juliano ordenado";
        }
        field(50014; "Formato codificacion lote"; Option)
        {
            CaptionML = ENU = 'Lot code format', ESP = 'Formato de codificación de lote';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Departamento+Marea+Pallet+Día+Máster,Departamento+Día+Pallet+Depto. origen+Marea origen+Máster,Departamento+Día+LoteOrigen,Planta+Fecha+Depto. origen+Marea origen+Pallet';
            OptionMembers = " ","Departamento+Marea+Pallet+Día+Máster","Departamento+Día+Pallet+Depto. origen+Marea origen+Máster","Departamento+Día+LoteOrigen","Planta+Fecha+Depto. origen+Marea origen+Pallet";
        }
        field(50015; "Seguimiento para trazabilidad"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Post-Expo - Controlar contra DCL","No controlar contra DCL","Pre-Expo - Controlar contra DCL";
        }
        field(50016; "DCL application date formula"; Text[30])
        {
            Caption = 'Fórmula de aplicación de fechas de DCL';
            DataClassification = ToBeClassified;
        }
        field(50017; "Retener aunque sea Agente"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50020; "Country code"; Code[3])
        {
            Caption = 'Cód. país';

            trigger OnValidate()
            begin
                fntVerificador;
                fntEAN13;
            end;
        }
        field(50021; "Company code"; Code[6])
        {
            Caption = 'Cód. empresa';

            trigger OnValidate()
            begin
                fntVerificador;
                fntEAN13;
            end;
        }
        field(50022; "Item code"; Code[3])
        {
            Caption = 'Cód. producto';

            trigger OnValidate()
            begin
                fntVerificador;
                fntEAN13;
            end;
        }
        field(50023; "Validation code"; Code[1])
        {
            Caption = 'Cód. verificación';
            Editable = false;
        }
        field(50024; "GLN Code"; Code[13])
        {
            Caption = 'Cód. GLN';
        }
        field(50025; Estado; Text[50])
        {
            TableRelation = Estados.Estados;
        }
        field(50026; Romanos; Text[30])
        {
        }
        field(50027; "Patent code"; Code[10])
        {
            Caption = 'Cód. matrícula';
            DataClassification = ToBeClassified;
        }
        field(50028; "Due date formula"; Text[30])
        {
            Caption = 'Fórmula fecha vencimiento';
            DataClassification = ToBeClassified;
        }
        field(50029; "Last Pallet No."; Code[10])
        {
            CalcFormula = Max("Item Ledger Entry"."Pallet no." WHERE("Global Dimension 1 Code" = FIELD(Code),
                                                                      "Posting Date" = FIELD("Filtro fecha"),
                                                                      "Pallet no." = FIELD("Pallet filter"),
                                                                      "Entry Type" = FILTER(Purchase | "Positive Adjmt."),
                                                                      Revertido = FILTER(false)));
            Caption = 'Último No. de Pallet';
            FieldClass = FlowField;
        }
        field(50030; "DCL tracking"; Option)
        {
            Caption = 'Rastreo de DCL';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Lote origen a DCL específico","Lote origen a DCL abierto";
        }
        field(50100; "Cantidad descargada"; Decimal)
        {
            CalcFormula = Sum("Lín. descarga".Cantidad WHERE(Actividad = FIELD(Code),
                                                              "No. proyecto" = FIELD("Filtro proyecto"),
                                                              "Fecha remito" = FIELD("Filtro fecha"),
                                                              Buque = FIELD("Filtro buque"),
                                                              Marea = FIELD("Filtro marea"),
                                                              Puerto = FIELD("Filtro puerto"),
                                                              Subfamilia = FIELD("Filtro subfamilia")));
            FieldClass = FlowField;
        }
        field(50101; "Kilos netos descargados"; Decimal)
        {
            CalcFormula = Sum("Lín. descarga"."Net weight" WHERE(Actividad = FIELD(Code),
                                                                  "No. proyecto" = FIELD("Filtro proyecto"),
                                                                  "Fecha remito" = FIELD("Filtro fecha"),
                                                                  Buque = FIELD("Filtro buque"),
                                                                  Marea = FIELD("Filtro marea"),
                                                                  Puerto = FIELD("Filtro puerto"),
                                                                  Subfamilia = FIELD("Filtro subfamilia")));
            FieldClass = FlowField;
        }
        field(50102; "Kilos brutos descargados"; Decimal)
        {
            CalcFormula = Sum("Lín. descarga"."Gross weight" WHERE(Actividad = FIELD(Code),
                                                                    "No. proyecto" = FIELD("Filtro proyecto"),
                                                                    "Fecha remito" = FIELD("Filtro fecha"),
                                                                    Buque = FIELD("Filtro buque"),
                                                                    Marea = FIELD("Filtro marea"),
                                                                    Puerto = FIELD("Filtro puerto"),
                                                                    Subfamilia = FIELD("Filtro subfamilia")));
            FieldClass = FlowField;
        }
        field(50103; Existencias; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Posting Date" = FIELD("Filtro fecha"),
                                                                  "Item No." = FIELD("Filtro producto"),
                                                                  "Job No." = FIELD("Filtro proyecto"),
                                                                  "Global Dimension 1 Code" = FIELD("Filtro buque"),
                                                                  "Global Dimension 2 Code" = FIELD(Code),
                                                                  "Global dimension 3 Code" = FIELD("Filtro marea"),
                                                                  "Entry/Exit Point" = FIELD("Filtro puerto"),
                                                                  "Item type" = CONST(Pesca),
                                                                  Subfamily = FIELD("Filtro subfamilia")));
            FieldClass = FlowField;
        }
        field(50104; "Existencias KN"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry"."Net kilos" WHERE("Posting Date" = FIELD("Filtro fecha"),
                                                                     "Item No." = FIELD("Filtro producto"),
                                                                     "Job No." = FIELD("Filtro proyecto"),
                                                                     "Global Dimension 1 Code" = FIELD("Filtro buque"),
                                                                     "Global Dimension 2 Code" = FIELD(Code),
                                                                     "Global dimension 3 Code" = FIELD("Filtro marea"),
                                                                     "Entry/Exit Point" = FIELD("Filtro puerto"),
                                                                     "Item type" = CONST(Pesca),
                                                                     Subfamily = FIELD("Filtro subfamilia")));
            FieldClass = FlowField;
        }
        field(50105; "Existencias KB"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry"."Gross kilos" WHERE("Posting Date" = FIELD("Filtro fecha"),
                                                                       "Item No." = FIELD("Filtro producto"),
                                                                       "Job No." = FIELD("Filtro proyecto"),
                                                                       "Global Dimension 1 Code" = FIELD("Filtro buque"),
                                                                       "Global Dimension 2 Code" = FIELD(Code),
                                                                       "Global dimension 3 Code" = FIELD("Filtro marea"),
                                                                       "Entry/Exit Point" = FIELD("Filtro puerto"),
                                                                       "Item type" = CONST(Pesca),
                                                                       Subfamily = FIELD("Filtro subfamilia")));
            FieldClass = FlowField;
        }
        field(50106; "KN vendidos"; Decimal)
        {
            CalcFormula = Sum("Sales Invoice Line"."Net kilos" WHERE(Type = CONST(Item),
                                                                      "Posting Date" = FIELD("Filtro fecha"),
                                                                      "Job No." = FIELD("Filtro proyecto"),
                                                                      "Shortcut Dimension 1 Code" = FIELD("Filtro buque"),
                                                                      "Shortcut Dimension 2 Code" = FIELD(Code),
                                                                      "Shortcut Dimension 3 Code" = FIELD("Filtro marea"),
                                                                      Subfamilia = FIELD("Filtro subfamilia")));
            FieldClass = FlowField;
        }
        field(50107; "KB vendidos"; Decimal)
        {
            CalcFormula = Sum("Sales Invoice Line"."Gross kilos" WHERE(Type = CONST(Item),
                                                                        "Posting Date" = FIELD("Filtro fecha"),
                                                                        "Job No." = FIELD("Filtro proyecto"),
                                                                        "Shortcut Dimension 1 Code" = FIELD("Filtro buque"),
                                                                        "Shortcut Dimension 2 Code" = FIELD(Code),
                                                                        "Shortcut Dimension 3 Code" = FIELD("Filtro marea"),
                                                                        Subfamilia = FIELD("Filtro subfamilia")));
            FieldClass = FlowField;
        }
        field(50108; "USD vendidos"; Decimal)
        {
            CalcFormula = Sum("Sales Invoice Line"."Importe USD" WHERE(Type = CONST(Item),
                                                                        "Posting Date" = FIELD("Filtro fecha"),
                                                                        "Job No." = FIELD("Filtro proyecto"),
                                                                        "Shortcut Dimension 1 Code" = FIELD("Filtro buque"),
                                                                        "Shortcut Dimension 2 Code" = FIELD(Code),
                                                                        "Shortcut Dimension 3 Code" = FIELD("Filtro marea"),
                                                                        Subfamilia = FIELD("Filtro subfamilia")));
            FieldClass = FlowField;
        }
        field(50109; "Filtro fecha"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(50110; "Filtro proyecto"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Job;
        }
        field(50111; "Filtro buque"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(50112; "Filtro marea"; Code[10])
        {
            FieldClass = FlowFilter;
        }
        field(50113; "Filtro puerto"; Code[10])
        {
            FieldClass = FlowFilter;
        }
        field(50114; "Filtro producto"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Item;
        }
        field(50115; "Filtro subfamilia"; Code[10])
        {
            FieldClass = FlowFilter;
        }
        field(50116; "Kilos netos Siniestro"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry"."Net kilos" WHERE("Nombre libro diario" = CONST('AJU-INVENT'),
                                                                     "Posting Date" = FIELD("Filtro fecha"),
                                                                     "Global Dimension 1 Code" = FIELD("Filtro buque"),
                                                                     Subfamily = FIELD("Filtro subfamilia")));
            FieldClass = FlowField;
        }
        field(50117; "Filtro lote origen"; Code[10])
        {
            FieldClass = FlowFilter;
        }
        field(50118; "Filtro factura venta"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(50119; "Importe base impuestos Expo"; Decimal)
        {
            CalcFormula = Sum("Sales Line"."Importe USD" WHERE("Document Type" = CONST(Invoice),
                                                                "Document No." = FIELD("Filtro factura venta"),
                                                                "Lote origen" = FIELD("Filtro lote origen"),
                                                                "Shortcut Dimension 2 Code" = FIELD(Code)));
            FieldClass = FlowField;
        }
        field(50120; "Tipo cálculo acumulado"; Option)
        {
            OptionMembers = " ",Mensual,"11 meses";
        }
        field(50121; "Last pallet"; Code[20])
        {
            Caption = 'Último pallet';
        }
        field(50122; "Cantidad en pallet"; Decimal)
        {
            Caption = 'Cantidad en pallet';
        }
        field(50123; FEC_ULT_ACTUALIZACION; DateTime)
        {
        }
        field(50124; "Pallet filter"; Code[10])
        {
            Caption = 'Filtro pallet';
            FieldClass = FlowFilter;
        }
        field(50125; GLN; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70000; Tipo; Option)
        {
            OptionMembers = " ",Propio,Tercero,Mixto;

            trigger OnValidate()
            begin
                /*
                
                IF Tipo = Tipo::Propio THEN BEGIN
                  Proyecto.SETCURRENTKEY(Proyecto."Global Dimension 1 Code");
                  Proyecto.SETRANGE(Proyecto."Global Dimension 1 Code",Code);
                  IF Proyecto.FIND('-') THEN REPEAT
                     Proyecto.TESTFIELD(Tipo,Proyecto.Tipo::Improductivo);
                     //Proyecto.TESTFIELD("Forma de reparto",Proyecto."Forma de reparto"::Estructura);
                  UNTIL Proyecto.NEXT = 0;
                END;
                */

            end;
        }
    }

    procedure "---ARBUMASA"()
    begin
    end;

    procedure fntVerificador()
    begin
        if StrLen("Country code" + "Company code" + "Item code") = 12 then
            "Validation code" := Format(StrCheckSum("Country code" + "Company code" + "Item code", '131313131313'))
        else
            "Validation code" := '';
    end;

    procedure fntEAN13()
    begin
        if StrLen("Country code" + "Company code" + "Item code") = 12 then
            "GLN Code" := "Country code" + "Company code" + "Item code" + "Validation code"
        else
            "GLN Code" := '';
    end;

    var
        "---ARBUMASA-": Integer;
        Proyecto: Record Job;
        Recurso: Record Resource;
        Window: Dialog;
        i: Integer;
        Cuantos: Integer;
        PersonalEmbarcado: Record "Personal embarcado";
}

