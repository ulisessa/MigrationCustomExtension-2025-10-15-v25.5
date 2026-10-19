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
            Caption = 'Programa';
            ToolTip = 'Specifies the value of the Programa field.';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(50001; "Marea/Mes/Ciudad"; Code[10])
        {
            Caption = 'Marea/Mes/Ciudad';
            ToolTip = 'Specifies the value of the Marea/Mes/Ciudad field.';
        }
        field(50002; "Subdepartamento tierra"; Code[10])
        {
            Caption = 'Subdepartamento tierra';
            ToolTip = 'Specifies the value of the Subdepartamento tierra field.';
        }
        field(50003; "Concepto imputación"; Code[10])
        {
            Caption = 'Concepto imputación';
            ToolTip = 'Specifies the value of the Concepto imputación field.';
        }
        field(50004; "Item Presupuestario"; Code[10])
        {
            Caption = 'Item Presupuestario';
            ToolTip = 'Specifies the value of the Item Presupuestario field.';
        }
        field(50005; "Mes costo"; Code[10])
        {
            Caption = 'Mes costo';
            ToolTip = 'Specifies the value of the Mes costo field.';
        }
        field(50006; "Address code"; Code[2])
        {
            Caption = 'Cód. dirección';
            ToolTip = 'Specifies the value of the Cód. dirección field.';
            NotBlank = true;
        }
        field(50007; "Area code"; Code[2])
        {
            Caption = 'Cód. área';
            ToolTip = 'Specifies the value of the Cód. área field.';
            NotBlank = true;
            TableRelation = "Resource family".Nombre WHERE("No" = FIELD("Address code"),
                                                            Nombre = FIELD("Area code"));
        }
        field(50008; "Location code"; Code[30])
        {
            Caption = 'Cód. depósito';
            ToolTip = 'Specifies the value of the Cód. depósito field.';
            TableRelation = Location;
        }
        field(50009; "Use code"; Option)
        {
            Caption = 'Cód. utilización';
            ToolTip = 'Specifies the value of the Cód. utilización field.';
            OptionMembers = " ",Planta,Cliente,Buque,Estructura,Tercero;
        }
        field(50010; "Establecimiento No. Oficial"; Code[10])
        {
            Caption = 'Establecimiento No. Oficial';
            ToolTip = 'Specifies the value of the Establecimiento No. Oficial field.';
        }
        field(50011; "% Committed to process"; Option)
        {
            Caption = '% Comprometido de producción';
            ToolTip = 'Specifies the value of the % Comprometido de producción field.';
            OptionMembers = " ","10%","20%","30%","40%","50%","60%","70%","80%","90%","100%";
        }
        field(50012; "Short code"; Code[2])
        {
            Caption = 'Cód. corto';
            ToolTip = 'Specifies the value of the Cód. corto field.';
            DataClassification = ToBeClassified;
        }
        field(50013; "Formato codificacion pallet"; Option)
        {
            Caption = 'Formato codificacion pallet';
            ToolTip = 'Specifies the value of the Formato codificacion pallet field.';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Correlativo por año,Juliano ordenado';
            OptionMembers = " ","Correlativo por año","Juliano ordenado";
        }
        field(50014; "Formato codificacion lote"; Option)
        {
            Caption = 'Lot code format';
            ToolTip = 'Specifies the value of the Lot code format field.';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Departamento+Marea+Pallet+Día+Máster,Departamento+Día+Pallet+Depto. origen+Marea origen+Máster,Departamento+Día+LoteOrigen,Planta+Fecha+Depto. origen+Marea origen+Pallet';
            OptionMembers = " ","Departamento+Marea+Pallet+Día+Máster","Departamento+Día+Pallet+Depto. origen+Marea origen+Máster","Departamento+Día+LoteOrigen","Planta+Fecha+Depto. origen+Marea origen+Pallet";
        }
        field(50015; "Seguimiento para trazabilidad"; Option)
        {
            Caption = 'Seguimiento para trazabilidad';
            ToolTip = 'Specifies the value of the Seguimiento para trazabilidad field.';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Post-Expo - Controlar contra DCL","No controlar contra DCL","Pre-Expo - Controlar contra DCL";
        }
        field(50016; "DCL application date formula"; Text[30])
        {
            Caption = 'Fórmula de aplicación de fechas de DCL';
            ToolTip = 'Specifies the value of the Fórmula de aplicación de fechas de DCL field.';
            DataClassification = ToBeClassified;
        }
        field(50017; "Retener aunque sea Agente"; Boolean)
        {
            Caption = 'Retener aunque sea Agente';
            ToolTip = 'Specifies the value of the Retener aunque sea Agente field.';
            DataClassification = ToBeClassified;
        }
        field(50020; "Country code"; Code[3])
        {
            Caption = 'Cód. país';
            ToolTip = 'Specifies the value of the Cód. país field.';

            trigger OnValidate()
            begin
                fntVerificador;
                fntEAN13;
            end;
        }
        field(50021; "Company code"; Code[6])
        {
            Caption = 'Business Unit Code';
            ToolTip = 'Specifies the value of the Business Unit Code field.';

            trigger OnValidate()
            begin
                fntVerificador;
                fntEAN13;
            end;
        }
        field(50022; "Item code"; Code[3])
        {
            Caption = 'Cód. producto';
            ToolTip = 'Specifies the value of the Cód. producto field.';

            trigger OnValidate()
            begin
                fntVerificador;
                fntEAN13;
            end;
        }
        field(50023; "Validation code"; Code[1])
        {
            Caption = 'Cód. verificación';
            ToolTip = 'Specifies the value of the Cód. verificación field.';
            Editable = false;
        }
        field(50024; "GLN Code"; Code[13])
        {
            Caption = 'Cód. GLN';
            ToolTip = 'Specifies the value of the Cód. GLN field.';
        }
        field(50025; Estado; Text[50])
        {
            Caption = 'Estado';
            ToolTip = 'Specifies the value of the Estado field.';
            TableRelation = Estados.Estados;
        }
        field(50026; Romanos; Text[30])
        {
            Caption = 'Romanos';
            ToolTip = 'Specifies the value of the Romanos field.';
        }
        field(50027; "Patent code"; Code[10])
        {
            Caption = 'Cód. matrícula';
            ToolTip = 'Specifies the value of the Cód. matrícula field.';
            DataClassification = ToBeClassified;
        }
        field(50028; "Due date formula"; Text[30])
        {
            Caption = 'Due Date Formula';
            ToolTip = 'Specifies the value of the Due Date Formula field.';
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
            ToolTip = 'Specifies the value of the Último No. de Pallet field.';
            FieldClass = FlowField;
        }
        field(50030; "DCL tracking"; Option)
        {
            Caption = 'Rastreo de DCL';
            ToolTip = 'Specifies the value of the Rastreo de DCL field.';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Lote origen a DCL específico","Lote origen a DCL abierto";
        }
        field(50031; "Sello Argentino"; Boolean)
        {
            Caption = 'Sello Argentino';
            ToolTip = 'Specifies the value of the Sello Argentino field.';
            DataClassification = ToBeClassified;
        }
        field(50100; "Cantidad descargada"; Decimal)
        {
            Caption = 'Cantidad descargada';
            ToolTip = 'Specifies the value of the Cantidad descargada field.';
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
            Caption = 'Kilos netos descargados';
            ToolTip = 'Specifies the value of the Kilos netos descargados field.';
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
            Caption = 'Kilos brutos descargados';
            ToolTip = 'Specifies the value of the Kilos brutos descargados field.';
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
            Caption = 'Existencias';
            ToolTip = 'Specifies the value of the Existencias field.';
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Posting Date" = FIELD("Filtro fecha"),
                                                                  "Item No." = FIELD("Filtro producto"),
                                                                  "Job No." = FIELD("Filtro proyecto"),
                                                                  "Global Dimension 1 Code" = FIELD("Filtro buque"),
                                                                  "Global Dimension 3 Code" = FIELD(Code),
                                                                  "Global dimension 2 Code" = FIELD("Filtro marea"),
                                                                  "Entry/Exit Point" = FIELD("Filtro puerto"),
                                                                  "Item type" = CONST(Pesca),
                                                                  Subfamily = FIELD("Filtro subfamilia")));
            FieldClass = FlowField;
        }
        field(50104; "Existencias KN"; Decimal)
        {
            Caption = 'Existencias KN';
            ToolTip = 'Specifies the value of the Existencias KN field.';
            CalcFormula = Sum("Item Ledger Entry"."Net kilos" WHERE("Posting Date" = FIELD("Filtro fecha"),
                                                                     "Item No." = FIELD("Filtro producto"),
                                                                     "Job No." = FIELD("Filtro proyecto"),
                                                                     "Global Dimension 1 Code" = FIELD("Filtro buque"),
                                                                     "Global Dimension 3 Code" = FIELD(Code),
                                                                     "Global dimension 2 Code" = FIELD("Filtro marea"),
                                                                     "Entry/Exit Point" = FIELD("Filtro puerto"),
                                                                     "Item type" = CONST(Pesca),
                                                                     Subfamily = FIELD("Filtro subfamilia")));
            FieldClass = FlowField;
        }
        field(50105; "Existencias KB"; Decimal)
        {
            Caption = 'Existencias KB';
            ToolTip = 'Specifies the value of the Existencias KB field.';
            CalcFormula = Sum("Item Ledger Entry"."Gross kilos" WHERE("Posting Date" = FIELD("Filtro fecha"),
                                                                       "Item No." = FIELD("Filtro producto"),
                                                                       "Job No." = FIELD("Filtro proyecto"),
                                                                       "Global Dimension 1 Code" = FIELD("Filtro buque"),
                                                                       "Global Dimension 3 Code" = FIELD(Code),
                                                                       "Global dimension 2 Code" = FIELD("Filtro marea"),
                                                                       "Entry/Exit Point" = FIELD("Filtro puerto"),
                                                                       "Item type" = CONST(Pesca),
                                                                       Subfamily = FIELD("Filtro subfamilia")));
            FieldClass = FlowField;
        }
        field(50106; "KN vendidos"; Decimal)
        {
            Caption = 'KN vendidos';
            ToolTip = 'Specifies the value of the KN vendidos field.';
            CalcFormula = Sum("Sales Invoice Line"."Net kilos" WHERE(Type = CONST(Item),
                                                                      "Posting Date" = FIELD("Filtro fecha"),
                                                                      "Job No." = FIELD("Filtro proyecto"),
                                                                      "Shortcut Dimension 1 Code" = FIELD("Filtro buque"),
                                                                      "Shortcut Dimension 3 Code" = FIELD(Code),
                                                                      "Shortcut Dimension 2 Code" = FIELD("Filtro marea"),
                                                                      Subfamilia = FIELD("Filtro subfamilia")));
            FieldClass = FlowField;
        }
        field(50107; "KB vendidos"; Decimal)
        {
            Caption = 'KB vendidos';
            ToolTip = 'Specifies the value of the KB vendidos field.';
            CalcFormula = Sum("Sales Invoice Line"."Gross kilos" WHERE(Type = CONST(Item),
                                                                        "Posting Date" = FIELD("Filtro fecha"),
                                                                        "Job No." = FIELD("Filtro proyecto"),
                                                                        "Shortcut Dimension 1 Code" = FIELD("Filtro buque"),
                                                                        "Shortcut Dimension 3 Code" = FIELD(Code),
                                                                        "Shortcut Dimension 2 Code" = FIELD("Filtro marea"),
                                                                        Subfamilia = FIELD("Filtro subfamilia")));
            FieldClass = FlowField;
        }
        field(50108; "USD vendidos"; Decimal)
        {
            Caption = 'USD vendidos';
            ToolTip = 'Specifies the value of the USD vendidos field.';
            CalcFormula = Sum("Sales Invoice Line"."Importe USD" WHERE(Type = CONST(Item),
                                                                        "Posting Date" = FIELD("Filtro fecha"),
                                                                        "Job No." = FIELD("Filtro proyecto"),
                                                                        "Shortcut Dimension 1 Code" = FIELD("Filtro buque"),
                                                                        "Shortcut Dimension 3 Code" = FIELD(Code),
                                                                        "Shortcut Dimension 2 Code" = FIELD("Filtro marea"),
                                                                        Subfamilia = FIELD("Filtro subfamilia")));
            FieldClass = FlowField;
        }
        field(50109; "Filtro fecha"; Date)
        {
            Caption = 'Date Filter';
            ToolTip = 'Specifies the value of the Date Filter field.';
            FieldClass = FlowFilter;
        }
        field(50110; "Filtro proyecto"; Code[20])
        {
            Caption = 'Filtro proyecto';
            ToolTip = 'Specifies the value of the Filtro proyecto field.';
            FieldClass = FlowFilter;
            TableRelation = Job;
        }
        field(50111; "Filtro buque"; Code[10])
        {
            Caption = 'Filtro buque';
            ToolTip = 'Specifies the value of the Filtro buque field.';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(50112; "Filtro marea"; Code[10])
        {
            Caption = 'Filtro marea';
            ToolTip = 'Specifies the value of the Filtro marea field.';
            FieldClass = FlowFilter;
        }
        field(50113; "Filtro puerto"; Code[10])
        {
            Caption = 'Filtro puerto';
            ToolTip = 'Specifies the value of the Filtro puerto field.';
            FieldClass = FlowFilter;
        }
        field(50114; "Filtro producto"; Code[20])
        {
            Caption = 'Filtro producto';
            ToolTip = 'Specifies the value of the Filtro producto field.';
            FieldClass = FlowFilter;
            TableRelation = Item;
        }
        field(50115; "Filtro subfamilia"; Code[10])
        {
            Caption = 'Filtro subfamilia';
            ToolTip = 'Specifies the value of the Filtro subfamilia field.';
            FieldClass = FlowFilter;
        }
        field(50116; "Kilos netos Siniestro"; Decimal)
        {
            Caption = 'Kilos netos Siniestro';
            ToolTip = 'Specifies the value of the Kilos netos Siniestro field.';
            CalcFormula = Sum("Item Ledger Entry"."Net kilos" WHERE("Nombre libro diario" = CONST('AJU-INVENT'),
                                                                     "Posting Date" = FIELD("Filtro fecha"),
                                                                     "Global Dimension 1 Code" = FIELD("Filtro buque"),
                                                                     Subfamily = FIELD("Filtro subfamilia")));
            FieldClass = FlowField;
        }
        field(50117; "Filtro lote origen"; Code[10])
        {
            Caption = 'Filtro lote origen';
            ToolTip = 'Specifies the value of the Filtro lote origen field.';
            FieldClass = FlowFilter;
        }
        field(50118; "Filtro factura venta"; Code[20])
        {
            Caption = 'Filtro factura venta';
            ToolTip = 'Specifies the value of the Filtro factura venta field.';
            FieldClass = FlowFilter;
        }
        field(50119; "Importe base impuestos Expo"; Decimal)
        {
            Caption = 'Importe base impuestos Expo';
            ToolTip = 'Specifies the value of the Importe base impuestos Expo field.';
            CalcFormula = Sum("Sales Line"."Importe USD" WHERE("Document Type" = CONST(Invoice),
                                                                "Document No." = FIELD("Filtro factura venta"),
                                                                "Lote origen" = FIELD("Filtro lote origen"),
                                                                "Shortcut Dimension 2 Code" = FIELD(Code)));
            FieldClass = FlowField;
        }
        field(50120; "Tipo cálculo acumulado"; Option)
        {
            Caption = 'Tipo cálculo acumulado';
            ToolTip = 'Specifies the value of the Tipo cálculo acumulado field.';
            OptionMembers = " ",Mensual,"11 meses";
        }
        field(50121; "Last pallet"; Code[20])
        {
            Caption = 'Último pallet';
            ToolTip = 'Specifies the value of the Último pallet field.';
        }
        field(50122; "Cantidad en pallet"; Decimal)
        {
            Caption = 'Cantidad en pallet';
            ToolTip = 'Specifies the value of the Cantidad en pallet field.';
        }
        field(50123; FEC_ULT_ACTUALIZACION; DateTime)
        {
            Caption = 'FEC_ULT_ACTUALIZACION';
            ToolTip = 'Specifies the value of the FEC_ULT_ACTUALIZACION field.';
        }
        field(50124; "Pallet filter"; Code[10])
        {
            Caption = 'Filtro pallet';
            ToolTip = 'Specifies the value of the Filtro pallet field.';
            FieldClass = FlowFilter;
        }
        field(50125; GLN; Code[20])
        {
            Caption = 'GLN';
            ToolTip = 'Specifies the value of the GLN field.';
            DataClassification = ToBeClassified;
        }
        field(70000; Tipo; Option)
        {
            Caption = 'Tipo';
            ToolTip = 'Specifies the value of the Tipo field.';
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

