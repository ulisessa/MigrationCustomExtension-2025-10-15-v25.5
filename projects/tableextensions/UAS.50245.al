tableextension 50245 "Job Ext." extends Job
{
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Search Description")
        {
            Caption = 'Search Description';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Description 2")
        {
            Caption = 'Description 2';
        }
        modify("Bill-to Customer No.")
        {
            Caption = 'Bill-to Customer No.';
        }
        modify("Creation Date")
        {
            Caption = 'Creation Date';
        }
        modify("Person Responsible")
        {
            Caption = 'Person Responsible';
        }
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
        }
        modify("Last Date Modified")
        {
            Caption = 'Last Date Modified';
        }
        modify("Language Code")
        {
            Caption = 'Language Code';
        }
        modify("Bill-to Address")
        {
            Caption = 'Bill-to Address';
        }
        modify("Bill-to Address 2")
        {
            Caption = 'Bill-to Address 2';
        }
        modify("Bill-to City")
        {
            Caption = 'Bill-to City';
        }
        modify("Bill-to Country/Region Code")
        {
            Caption = 'Bill-to Country/Region Code';
        }
        modify("WIP Method")
        {
            Caption = 'WIP Method';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("Bill-to Contact No.")
        {
            Caption = 'Bill-to Contact No.';
        }
        modify("Bill-to Contact")
        {
            Caption = 'Bill-to Contact';
        }
        modify("Invoice Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Invoice Currency Code';
        }
        modify("Exch. Calculation (Cost)")
        {
            Caption = 'Exch. Calculation (Cost)';
        }
        modify("Exch. Calculation (Price)")
        {
            Caption = 'Exch. Calculation (Price)';
        }
        modify("Allow Schedule/Contract Lines")
        {
            Caption = 'Allow Budget/Billable Lines';
        }
        modify("Apply Usage Link")
        {
            Caption = 'Apply Usage Link';
        }
        modify("WIP Posting Method")
        {
            Caption = 'WIP Posting Method';
        }

        //Unsupported feature: Code Insertion (VariableCollection) on ""Ending Date"(Field 14).OnValidate".

        //trigger (Variable: rstCDA)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: Code Modification on ""Ending Date"(Field 14).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CheckDate;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CheckDate;

        //++Arbu
        Clear(rstCDA);
        if rstCDA.Get("No.") then
          begin

            rstCDA."Fecha Entrada" := "Ending Date";
            rstCDA.Modify;

          end;
        //--Arbu
        */
        //end;


        //Unsupported feature: Code Modification on ""Global Dimension 1 Code"(Field 21).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateShortcutDimCode(1,"Global Dimension 1 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ValidateShortcutDimCode(1,"Global Dimension 1 Code");
        //++Arbu
        "Lote origen" := cduFish.CalcLoteOrigen(Rec);
        //--Arbu
        */
        //end;
        field(50000; "Global Dimension 3 Code"; Code[10])
        {
            CaptionClass = '1,2,3';

            //This property is currently not supported
            //TestTableRelation = false;

            trigger OnValidate()
            var
                rstDV: Record "Dimension Value";
                rstGLS: Record "General Ledger Setup";
            begin
                //++Arbu 2020
                Clear(rstDV);
                Clear(rstGLS);
                rstGLS.Get();
                if (not rstDV.Get(rstGLS."Global Dimension 3 Code", "Global Dimension 3 Code")) and ("Global Dimension 3 Code" <> '') then begin

                    if Confirm('No existe el valor ' + "Global Dimension 3 Code" + ' para la dimensión ' + rstGLS."Global Dimension 3 Code" + '. ?Desea crearla?', false) then begin

                        Clear(rstDV);
                        rstDV."Dimension Code" := rstGLS."Global Dimension 3 Code";
                        rstDV.Code := "Global Dimension 3 Code";
                        rstDV.Name := "Global Dimension 3 Code";
                        rstDV.Insert(true);

                    end;

                end;
                //--Arbu 2020
                ValidateShortcutDimCode(3, "Global Dimension 3 Code");
                Modify;
            end;
        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            CaptionClass = '1,2,4';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Global Dimension 4 Code");
                Modify;
            end;
        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            CaptionClass = '1,2,5';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Global Dimension 5 Code");
                Modify;
            end;
        }
        field(50003; "Global Dimension 6 Code"; Code[10])
        {
            CaptionClass = '1,2,6';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Global Dimension 6 Code");
                Modify;
            end;
        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Global Dimension 7 Code");
                Modify;
            end;
        }
        field(50005; "Default location code"; Code[10])
        {
            Caption = 'Cód. predefinido de depósito';
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(50011; "Stock invoicing journal"; Code[10])
        {
            Caption = 'Libro diario facturación stock';
            DataClassification = ToBeClassified;
            TableRelation = "Job Journal Template".Name;
        }
        field(50012; "Stock invoicing section"; Code[10])
        {
            Caption = 'Sección diario facturación stock';
            DataClassification = ToBeClassified;
            TableRelation = "Job Journal Batch".Name WHERE("Journal Template Name" = FIELD("Stock invoicing journal"));
        }
        field(50019; "Lote origen"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50020; Patron; Text[50])
        {
        }
        field(50021; "Importe facturado DA"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - Sum("Job Ledger Entry"."Add.-Currency Total Price");
            Editable = false;
            FieldClass = FlowField;
        }
        field(50022; "Coste total DA"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Job Ledger Entry"."Original Total Cost (ACY)" WHERE("Job No." = FIELD("No."),
                                                                                    "Global Dimension 1 Code" = FIELD("Filtro departamento"),
                                                                                    "Global Dimension 3 Code" = FIELD("Filtro actividad"),
                                                                                    "Global Dimension 2 Code" = FIELD("Filtro marea/ciudad"),
                                                                                    "Posting Date" = FIELD("Posting Date Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50023; "Invoicing Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." WHERE("Job No." = FIELD("No."));
        }
        field(50037; Block; Boolean)
        {
        }
        field(50038; "Sello Argentino"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50039; "MSC"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(50093; "Provision amount (LCY)"; Decimal)
        {
            Caption = 'Importe provisión (DL)';
            Editable = false;
        }
        field(50100; "Address code"; Code[2])
        {
            Caption = 'Cód. dirección';
            Editable = false;
            NotBlank = true;
        }
        field(50101; "Area code"; Code[2])
        {
            Caption = 'Cód. área';
            Editable = false;
            NotBlank = true;
        }
        field(50104; "Filtro tipos mov."; Option)
        {
            FieldClass = FlowFilter;
            OptionMembers = Consumo,Venta,,,,"Producción",Servicios,Anticipo;
        }
        field(50105; "Filtro factura venta"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(50106; "Base impuestos Expo"; Decimal)
        {
            CalcFormula = Sum("Sales Line"."Importe USD" WHERE("Document Type" = FILTER(Invoice | "Credit Memo"),
                                                                "Document No." = FIELD("Filtro factura venta"),
                                                                "Shortcut Dimension 1 Code" = FIELD("Filtro departamento"),
                                                                "Shortcut Dimension 3 Code" = FIELD("Filtro actividad"),
                                                                "Job No." = FIELD("No."),
                                                                "Cód. arancelario" = FIELD("Tariff code filter"),
                                                                "Cód. categorización" = FIELD("Categorization filter"),
                                                                "Especie de productos" = FIELD("Filtro especie de productos"),
                                                                "Nivel de producción" = FIELD("Production level filter"),
                                                                Procedencia = FIELD("Filtro procedencia"),
                                                                "Propiedad producto" = FIELD("Filtro propiedad producto")));
            FieldClass = FlowField;
        }
        field(50107; "Tariff code filter"; Code[20])
        {
            Caption = 'Filtro Cód. arancelario';
            FieldClass = FlowFilter;
        }
        field(50108; "Base impuestos Expo CA"; Decimal)
        {
            CalcFormula = Sum("Sales Line"."Importe USD" WHERE("Document Type" = FILTER(Invoice | "Credit Memo"),
                                                                "Document No." = FIELD("Filtro factura venta"),
                                                                "Shortcut Dimension 3 Code" = FIELD("Filtro actividad"),
                                                                "Cód. arancelario" = FIELD("Tariff code filter")));
            FieldClass = FlowField;
        }
        field(50190; "xCod. Subprograma"; Code[10])
        {
            TableRelation = "Employee entry";
        }
        field(50200; "Fecha llegada prevista"; Date)
        {
        }
        field(50201; "Year tide"; Integer)
        {
            BlankZero = true;
            Caption = 'Año marea';
            Editable = false;
        }
        field(50202; "Last pallet no."; Text[10])
        {
            CalcFormula = Max("Item Ledger Entry"."Pallet no." WHERE("Job No." = FIELD("No.")));
            Caption = 'Último no. de pallet';
            FieldClass = FlowField;
        }
        field(50203; "Totales DCL"; Decimal)
        {
            CalcFormula = Sum("Lín. DCL"."Kilos netos" WHERE("No. proyecto" = FIELD("No."),
                                                              Actividad = FIELD("Filtro actividad"),
                                                              "Fecha DCL" = FIELD("Posting Date Filter"),
                                                              Cantidad = FILTER(> 0),
                                                              Cliente = FIELD("Filtro departamento"),
                                                              Registrado = FILTER(true)));
            FieldClass = FlowField;
        }
        field(50204; "Totales aplicados a DCL"; Decimal)
        {
            CalcFormula = Sum("DCL Application Lines"."Origin kilos" WHERE("DCL Job no." = FIELD("No."),
                                                                            "Document date" = FIELD("Posting Date Filter"),
                                                                            Activity = FIELD("Filtro actividad")));
            FieldClass = FlowField;
        }
        field(50205; "Totales descontados DCL"; Decimal)
        {
            CalcFormula = Sum("Lín. DCL"."Kilos netos" WHERE("No. proyecto" = FIELD("No."),
                                                              Actividad = FIELD("Filtro actividad"),
                                                              "Fecha DCL" = FIELD("Posting Date Filter"),
                                                              "Kilos netos" = FILTER(< 0),
                                                              Cliente = FIELD("Filtro departamento"),
                                                              Registrado = FILTER(true)));
            FieldClass = FlowField;
        }
        field(50500; "Salida Prevista Marea pos"; Date)
        {
        }
        field(50501; "Puerto Descarga"; Code[10])
        {
            Caption = 'Puerto Descarga';
            TableRelation = "Entry/Exit Point";
        }
        field(50502; "Requires OP no."; Boolean)
        {
            Caption = 'Requiere No. orden producción';
        }
        field(50503; "Kilos netos descargados"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry"."Net kilos" WHERE("Job No." = FIELD("No."),
                                                                     "Nombre libro diario" = CONST('DESCARGA')));
            FieldClass = FlowField;
        }
        field(50504; "Kilos brutos descargados"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry"."Gross kilos" WHERE("Job No." = FIELD("No."),
                                                                       "Nombre libro diario" = CONST('DESCARGA')));
            FieldClass = FlowField;
        }
        field(50505; "Kilos netos comprados"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry"."Net kilos" WHERE("Job No." = FIELD("No."),
                                                                     "Entry Type" = CONST(Purchase),
                                                                     "Nombre libro diario" = CONST('COMPRA')));
            FieldClass = FlowField;
        }
        field(50506; "Location filter"; Code[10])
        {
            Caption = 'Filtro depósito';
            FieldClass = FlowFilter;
            TableRelation = Location;
        }
        field(50507; "Filtro puerto"; Code[10])
        {
            Caption = 'Filtro puerto';
            FieldClass = FlowFilter;
            TableRelation = "Entry/Exit Point";
        }
        field(50508; "Filtro departamento"; Code[10])
        {
            Caption = 'Filtro departamento';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(50509; "Filtro actividad"; Code[10])
        {
            Caption = 'Filtro actividad';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(50510; "Filtro marea/ciudad"; Code[10])
        {
            Caption = 'Filtro marea/ciudad';
            FieldClass = FlowFilter;

        }
        field(50511; "Filtro lote"; Code[10])
        {
            Caption = 'Filtro lote';
            FieldClass = FlowFilter;
        }
        field(50512; "Filtro familia"; Code[10])
        {
            Caption = 'Filtro familia';
            FieldClass = FlowFilter;
            TableRelation = "Familia producto";
        }
        field(50513; "Filtro subfamilia"; Code[10])
        {
            Caption = 'Filtro subfamilia';
            FieldClass = FlowFilter;
            TableRelation = "Subfamilia producto";
        }
        field(50514; "Filtro proyecto"; Code[20])
        {
            Caption = 'Filtro proyecto';
            FieldClass = FlowFilter;
            TableRelation = Job;
        }
        field(50515; "Tax group code"; Code[10])
        {
            Caption = 'Cód. grupo impuesto';
            TableRelation = "Tax Group";
        }
        field(50516; "Personal involucrado"; Integer)
        {
            CalcFormula = Count("Personal embarcado" WHERE(Proyecto = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(50517; "Sueldos personal"; Decimal)
        {
            CalcFormula = Sum("Buffer Meta4".Importe WHERE(Proyecto = FIELD("No."),
                                                            Importe = FILTER(> 0)));
            FieldClass = FlowField;
        }
        field(50518; "Kilos netos pendientes"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Item Ledger Entry"."Remaining net kilos" WHERE(Open = CONST(true),
                                                                               "Item No." = FIELD(FILTER("Filtro producto")),
                                                                               "Lote origen" = FIELD(FILTER("Filtro lote")),
                                                                               "Lote origen" = FIELD(FILTER("Lote origen"))));
            FieldClass = FlowField;
        }
        field(50519; "Kilos brutos pendientes"; Decimal)
        {
            FieldClass = Normal;
        }
        field(50520; "Kilos netos ingresados x fason"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry"."Net kilos" WHERE("Job No." = FIELD("No."),
                                                                     "Entry Type" = CONST(Purchase),
                                                                     "Nombre libro diario" = CONST('ING-FASON')));
            FieldClass = FlowField;
        }
        field(50521; "Kilos netos registrados"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry"."Net kilos" WHERE("Job No." = FIELD("No."),
                                                                     "Nombre libro diario" = CONST('DESCARGA')));
            FieldClass = FlowField;
        }
        field(50522; "Cantidad línea reparto venta"; Decimal)
        {
            CalcFormula = Sum("Lín. reparto"."Reservar - UMB" WHERE(Proyecto = FIELD("No."),
                                                                     "No. Documento" = FIELD("Filtro factura venta")));
            Caption = 'Cantidad Ln. reparto venta';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50525; "Importe contabilizado DA"; Decimal)
        {
            CalcFormula = Sum("G/L Entry"."Additional-Currency Amount" WHERE("Job No." = FIELD("No."),
                                                                              "Posting Date" = FIELD("Posting Date Filter"),
                                                                              "G/L Account No." = FIELD("Filtro Cuenta")));
            FieldClass = FlowField;
        }
        field(50526; "Filtro Cuenta"; Text[20])
        {
            FieldClass = FlowFilter;
        }
        field(50527; "Importe contabilizado"; Decimal)
        {
            CalcFormula = Sum("G/L Entry".Amount WHERE("Job No." = FIELD("No."),
                                                        "Posting Date" = FIELD("Posting Date Filter"),
                                                        "G/L Account No." = FIELD("Filtro Cuenta")));
            FieldClass = FlowField;
        }
        field(50528; "Puerto zarpada"; Code[10])
        {
            TableRelation = "Entry/Exit Point";
        }
        field(50530; "Grupo Informe Costos"; Text[50])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('GRUPO COSTOS'));

            trigger OnValidate()
            begin
                TestField(Tipo, Tipo::Improductivo);
            end;
        }
        field(50531; "Confirmación entrada"; Option)
        {
            Caption = 'Confirmación entrada';
            OptionMembers = Pendiente,"Sí?";
        }
        field(50532; Texturas; BLOB)
        {
        }
        field(50533; "Cuenta Informe Costos"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(50534; "Categorization filter"; Code[4])
        {
            Caption = 'Filtro categorización';
            FieldClass = FlowFilter;
        }
        field(50535; "Filtro especie de productos"; Option)
        {
            FieldClass = FlowFilter;
            OptionMembers = " ","L{Langostino}","C{Calamar}","M{Merluza}","Z{Centolla}";
        }
        field(50536; "Production level filter"; Option)
        {
            Caption = 'Filtro nivel de producción';
            FieldClass = FlowFilter;
            OptionMembers = " ","Materia Prima",Semielaborado,"Producto Terminado",Residuos;
        }
        field(50537; "Filtro procedencia"; Option)
        {
            FieldClass = FlowFilter;
            OptionMembers = " ",Buques,Planta;
        }
        field(50538; "Filtro propiedad producto"; Option)
        {
            FieldClass = FlowFilter;
            OptionMembers = " ",Propio,Tercero,Comprado;
        }
        field(50539; "Fecha arribo a rada"; Date)
        {
        }
        field(50540; "Horas navegación a rada"; Duration)
        {
            Caption = 'Horas navegación a rada';
        }
        field(50541; "Horas navegación zona pesca"; Duration)
        {
            Caption = 'Horas navegación zona pesca';
        }
        field(50542; "Planta destino mercader?a"; Text[30])
        {
            Caption = 'Planta destino mercader?a';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          "Use code" = FILTER(Planta));
        }
        field(50543; "Hora ingreso a puerto"; Time)
        {
        }
        field(50544; "Hora de zarpada"; Time)
        {
        }
        field(50800; "Venta interna"; Boolean)
        {
        }
        field(50801; "No. proyecto principal"; Code[20])
        {
            Caption = 'No. proyecto principal';
            TableRelation = Job;

            trigger OnValidate()
            begin
                TestField("Venta interna");
            end;
        }
        field(50802; "Calcula financieros"; Boolean)
        {
        }
        field(50803; "Admite compras"; Boolean)
        {
        }
        field(50804; "Anual/continuo"; Option)
        {
            OptionMembers = " ",Anual,Continuo;
        }
        field(50805; "Iva no realizado"; Option)
        {
            OptionMembers = " ","Sí",Calculado;
        }
        field(50806; Tipo; Option)
        {
            BlankZero = true;
            InitValue = Productivo;
            OptionMembers = ,Productivo,Improductivo;

            trigger OnValidate()
            begin
                TestField("Global Dimension 1 Code");
                if Tipo = Tipo::Productivo then begin
                    "Contapartida de gastos ind." := false;
                    //  "Forma de reparto" := "Forma de reparto"::" ";
                    "Codigo rubrica reparto" := '';
                    //  "Criterio de reparto" := "Criterio de reparto"::" ";
                end else begin
                    "Foreign production" := false;
                    "Starting Date" := 0D;
                    "Ending Date" := 0D;
                    "Fecha llegada prevista" := 0D;
                    "Dias de mar previstos" := 0;
                    "Dias de mar reales" := 0;
                    "Year tide" := 0;
                    "Importe captura previsto" := 0;
                    "Kilos pesca previstos" := 0;
                end;
                Modify;
            end;
        }
        field(50807; "Salesperson code"; Code[10])
        {
            Caption = 'Cód. vendedor';
            TableRelation = "Salesperson/Purchaser";
        }
        field(50808; "Expense distribution code"; Code[10])
        {
            Caption = 'Cód. reparto gastos';
        }
        field(50809; "Fecha de cierre"; Date)
        {
            Editable = false;
        }
        field(50810; "Country code"; Code[10])
        {
            Caption = 'Cód. país';
            TableRelation = "Country/Region";
        }
        field(50811; "Province code"; Code[10])
        {
            Caption = 'Cód. provincia';
            TableRelation = "Country/Region";
        }
        field(50812; "Contapartida de gastos ind."; Boolean)
        {

            trigger OnValidate()
            begin
                if "Contapartida de gastos ind." then
                    TestField(Tipo, Tipo::Improductivo);
            end;
        }
        field(50820; Mercado; Option)
        {
            BlankZero = true;
            OptionMembers = ,"Obra p?blica","Obra privada","Promoción",Otros;
        }
        field(50821; "Specialization code"; Code[10])
        {
            Caption = 'Cód. especialidad';
        }
        field(50822; "Sector code"; Code[10])
        {
            Caption = 'Cód. sector';
        }
        field(50823; "Activity code"; Code[10])
        {
            Caption = 'Cód. actividad';
        }
        field(50824; "Situation code"; Code[10])
        {
            Caption = 'Cód. situación';
        }
        field(50825; "Aggregation code"; Code[10])
        {
            Caption = 'Cód. agrupación';
        }
        field(55555; Contador; Decimal)
        {
            Editable = false;
            InitValue = 1;
        }
        field(60000; "Importe venta presup."; Decimal)
        {
            AutoFormatType = 1;
            Editable = false;
            FieldClass = Normal;
        }
        field(60001; "Horas presup."; Decimal)
        {
            AutoFormatType = 1;
            Editable = false;
            FieldClass = Normal;
        }
        field(60003; "Importe cobrado"; Decimal)
        {
            AutoFormatType = 1;
            Editable = false;
            FieldClass = Normal;
        }
        field(60004; "Importe pagado"; Decimal)
        {
            AutoFormatType = 1;
            Editable = false;
        }
        field(60005; "Importe cobrado IVA inc."; Decimal)
        {
            AutoFormatType = 1;
            Editable = false;
        }
        field(60006; "Importe pagado IVA inc."; Decimal)
        {
            AutoFormatType = 1;
            Editable = false;
        }
        field(60007; "Horas consumidas"; Decimal)
        {
            Editable = false;
        }
        field(60008; "Importe pedido pendiente  (DL)"; Decimal)
        {
            Editable = false;
        }
        field(60009; "Importe pedido registrado (DL)"; Decimal)
        {
            Editable = false;
        }
        field(60020; "Foreign production"; Boolean)
        {
            Caption = 'Producción ajena';
        }
        field(70000; Vacaciones; Boolean)
        {
        }
        field(75000; "Dias de mar previstos"; Decimal)
        {
            BlankZero = true;
            Editable = false;

            trigger OnValidate()
            begin
                if ("Starting Date" = 0D) or ("Fecha llegada prevista" = 0D) then begin
                    "Dias de mar previstos" := 0;
                    exit;
                end;

                "Dias de mar previstos" := 1 + ("Fecha llegada prevista" - "Starting Date");
                if "Dias de mar previstos" < 1 then
                    FieldError("Fecha llegada prevista", 'no puede ser anterior a ' + FieldName("Starting Date"));
            end;
        }
        field(75001; "Dias de mar reales"; Decimal)
        {
            BlankZero = true;
            Editable = false;

            trigger OnValidate()
            begin
                if ("Starting Date" = 0D) or ("Ending Date" = 0D) then begin
                    "Dias de mar reales" := 0;
                    exit;
                end;

                "Dias de mar reales" := ("Ending Date" - "Starting Date");
                if "Dias de mar reales" < 1 then
                    FieldError("Ending Date", 'no puede ser anterior a ' + FieldName("Starting Date"));
            end;
        }
        field(75002; "Forma de reparto"; Option)
        {
            OptionMembers = " ",Estructura,"Por departamento","Por actividad";

            trigger OnValidate()
            begin
                //TESTFIELD(Tipo,Tipo::Improductivo);
                TestField("Global Dimension 1 Code");
                //++Arbu
                Clear(rstGLS);
                rstGLS.Get;
                Clear(Departamento);
                Departamento.Get(rstGLS."Global Dimension 1 Code", "Global Dimension 1 Code");
                //--Arbu
            end;
        }
        field(75003; "Codigo rubrica reparto"; Code[10])
        {
        }
        field(75004; "Criterio de reparto"; Option)
        {
            OptionMembers = " ","Por Dias marea","Por kilos","Por Importe";

            trigger OnValidate()
            begin
                //TESTFIELD(Tipo,Tipo::Improductivo);
            end;
        }
        field(75005; "Filtro producto"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Item;
        }
        field(75006; "Importe bruto captura"; Decimal)
        {
            BlankZero = true;
            Editable = false;
        }
        field(75007; "Kilos capturados"; Decimal)
        {
            BlankZero = true;
            Editable = false;
        }
        field(75008; "Importe neto captura"; Decimal)
        {
            BlankZero = true;
            Editable = false;
        }
        field(75009; "Importe captura previsto"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;

            trigger OnValidate()
            begin
                TestField(Tipo, Tipo::Productivo);
            end;
        }
        field(75010; "Kilos pesca previstos"; Decimal)
        {
            BlankZero = true;

            trigger OnValidate()
            begin
                TestField(Tipo, Tipo::Productivo);
            end;
        }
        field(75011; "Consumo producto (p. coste)"; Decimal)
        {
            AutoFormatType = 1;
            Editable = false;
        }
        field(75012; "Consumo producto (Cant.)"; Decimal)
        {
            AutoFormatType = 1;
            Editable = false;
        }
        field(75013; "Valor captura tripulación"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Valor captura tripulación';
            Editable = false;
        }
        field(75014; "Fecha último reparto"; Date)
        {
            Caption = 'Fecha último reparto';
            Editable = false;
        }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    JobsSetup.Get;

    if "No." = '' then begin
    #4..20

    DimMgt.UpdateDefaultDim(
      DATABASE::Job,"No.",
      "Global Dimension 1 Code","Global Dimension 2 Code");
    InitWIPFields;

    "Creation Date" := Today;
    "Last Date Modified" := "Creation Date";

    if ("Project Manager" <> '') and (Status = Status::Open) then
      AddToMyJobs("Project Manager");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..23
      "Global Dimension 1 Code","Global Dimension 2 Code",
      //++Arbu
      "Global Dimension 3 Code","Global Dimension 4 Code",
      "Global Dimension 5 Code","Global Dimension 6 Code",
      "Global Dimension 7 Code"
      //--Arbu
      );
    #25..31
    //++Arbu
    if not blnCopiar then
      fntCrearLineasTarea;
    //--Arbu
    */
    //end;


    //Unsupported feature: Code Modification on "OnRename".

    //trigger OnRename()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    UpdateJobNoInReservationEntries;
    DimMgt.RenameDefaultDim(DATABASE::Job,xRec."No.","No.");
    "Last Date Modified" := Today;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    UpdateJobNoInReservationEntries;
    //DimMgt.RenameDefaultDim(DATABASE::Job,xRec."No.","No.");
    "Last Date Modified" := Today;
    */
    //end;

    //Unsupported feature: Variable Insertion (Variable: l_rstJS) (VariableCollection) on "UpdateCust(PROCEDURE 4)".



    //Unsupported feature: Code Modification on "UpdateCust(PROCEDURE 4)".

    //procedure UpdateCust();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if "Bill-to Customer No." <> '' then begin
      Cust.Get("Bill-to Customer No.");
      Cust.TestField("Customer Posting Group");
    #4..27
      "Bill-to County" := Cust.County;
      Reserve := Cust.Reserve;
      UpdateBillToCont("Bill-to Customer No.");
      CopyDefaultDimensionsFromCustomer;
    end else begin
      "Bill-to Name" := '';
    #34..42
      "Language Code" := '';
      "Bill-to County" := '';
      Validate("Bill-to Contact No.",'');
    end;

    OnAfterUpdateBillToCust(Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..30
      //++Arbu
      Clear(l_rstJS);
      l_rstJS.Get();
      "Stock invoicing journal" := l_rstJS."Stock invoicing journal";
      "Stock invoicing section" := l_rstJS."Stock invoicing section";
      //--Arbu
    #31..45
      //++Arbu
      "Stock invoicing journal" := '';
      "Stock invoicing section" := '';
      //--Arbu
    #46..48
    */
    //end;

    //Unsupported feature: Property Insertion (Name) on "GetQuantityAvailable(PROCEDURE 9).ReturnValue".



    //Unsupported feature: Code Modification on "GetQuantityAvailable(PROCEDURE 9)".

    //procedure GetQuantityAvailable();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    Clear(JobLedgEntry);
    JobLedgEntry.SetCurrentKey("Job No.","Entry Type",Type,"No.");
    JobLedgEntry.SetRange("Job No.","No.");
    if not (InEntryType = InEntryType::Both) then
      JobLedgEntry.SetRange("Entry Type",InEntryType);
    JobLedgEntry.SetRange(Type,JobLedgEntry.Type::Item);
    JobLedgEntry.SetRange("No.",ItemNo);
    case Direction of
      Direction::Both:
        begin
    #11..17
    end;
    JobLedgEntry.CalcSums("Quantity (Base)");
    exit(JobLedgEntry."Quantity (Base)");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..7
    {
    //++Arbu
    IF JobLedgEntry.FINDSET THEN
      REPEAT
        IF (JobLedgEntry."Location Code" = LocationCode) AND
           (JobLedgEntry."Variant Code" = VariantCode) AND
           ((Direction = Direction::Both) OR
            ((Direction = Direction::Positive) AND (JobLedgEntry."Quantity (Base)" > 0)) OR
            ((Direction = Direction::Negative) AND (JobLedgEntry."Quantity (Base)" < 0)))
        THEN
          QtyBase := QtyBase + JobLedgEntry."Quantity (Base)";

      UNTIL JobLedgEntry.NEXT = 0;
    //--Arbu
    }
    #8..20
    */
    //end;

    //Unsupported feature: Variable Insertion (Variable: rstJob) (VariableCollection) on "CheckDate(PROCEDURE 30)".


    //Unsupported feature: Variable Insertion (Variable: rstDV) (VariableCollection) on "CheckDate(PROCEDURE 30)".


    //Unsupported feature: Variable Insertion (Variable: rstGLS) (VariableCollection) on "CheckDate(PROCEDURE 30)".



    //Unsupported feature: Code Modification on "CheckDate(PROCEDURE 30)".

    //procedure CheckDate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if ("Starting Date" > "Ending Date") and ("Ending Date" <> 0D) then
      Error(CheckDateErr,FieldCaption("Starting Date"),FieldCaption("Ending Date"));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if ("Starting Date" > "Ending Date") and ("Ending Date" <> 0D) then
      Error(CheckDateErr,FieldCaption("Starting Date"),FieldCaption("Ending Date"));

    if ("Ending Date" <> 0D) and ("Starting Date" <> 0D) then
      "Dias de mar reales" := ("Ending Date"-"Starting Date");

    if "Starting Date" <> 0D then
    begin

      Clear(rstGLS);
      rstGLS.Get();

      Clear(rstDV);
      rstDV.Get(rstGLS."Global Dimension 1 Code","Global Dimension 1 Code");

      Clear(rstJob);
      rstJob.SetRange("Global Dimension 1 Code","Global Dimension 1 Code");
      rstJob.SetRange(Tipo,Tipo::Productivo);
      rstJob.SetRange("Starting Date","Starting Date");
      rstJob.SetFilter("No.",'<>%1',"No.");
      if (rstJob.FindFirst) and (rstDV."Use code" = 2) then
        if not Confirm('Ya existe un proyecto para este buque con la misma fecha de inicio. Por favor, verifique el '+rstJob."No."+'\?Desea continuar?',false) then
          Error('Por favor, const?te las fechas');
      Clear(rstJob);
      rstJob.SetRange("Global Dimension 1 Code","Global Dimension 1 Code");
      rstJob.SetRange(Tipo,Tipo::Productivo);
      rstJob.SetRange("Ending Date","Ending Date");
      rstJob.SetFilter("No.",'<>%1',"No.");
      if (rstJob.FindFirst) and (rstDV."Use code" = 2) then
        //ERROR('Ya existe un proyecto para este buque con la misma fecha de fin. Por favor, verifique el '+rstJob."No.");
        if not Confirm('Ya existe un proyecto para este buque con la misma fecha de fin. Por favor, verifique el '+rstJob."No."+'\?Desea continuar?',false) then
          Error('Por favor, const?te las fechas');

    end;
    */
    //end;


    //Unsupported feature: Code Modification on "CopyDefaultDimensionsFromCustomer(PROCEDURE 37)".

    //procedure CopyDefaultDimensionsFromCustomer();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IsHandled := false;
    OnBeforeCopyDefaultDimensionsFromCustomer(Rec,IsHandled);
    if IsHandled then
    #4..22
        DimMgt.DefaultDimOnInsert(JobDefaultDimension);
      until CustDefaultDimension.Next = 0;

    DimMgt.UpdateDefaultDim(DATABASE::Job,"No.","Global Dimension 1 Code","Global Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..25
    //DimMgt.UpdateDefaultDim(DATABASE::Job,"No.","Global Dimension 1 Code","Global Dimension 2 Code");
    */
    //end;


    //Unsupported feature: Code Modification on "PerformAutoReserve(PROCEDURE 49)".

    //procedure PerformAutoReserve();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    JobPlanningLine.SetRange(Status,JobPlanningLine.Status::Order);
    JobPlanningLine.SetRange(Reserve,JobPlanningLine.Reserve::Always);
    JobPlanningLine.SetFilter("Remaining Qty. (Base)",'<>%1',0);
    AutoReservePossible := JobPlanningLine.FindSet;
    if AutoReservePossible then begin
      repeat
        JobPlanningLineReserve.ReservQuantity(JobPlanningLine,QtyToReserve,QtyToReserveBase);
        ReservationManagement.SetJobPlanningLine(JobPlanningLine);
        ReservationManagement.AutoReserve(FullAutoReservation,'',JobPlanningLine."Planning Date",QtyToReserve,QtyToReserveBase);
        AutoReservePossible := AutoReservePossible and FullAutoReservation;
        JobPlanningLine.UpdatePlanned;
      until JobPlanningLine.Next = 0;
      if not AutoReservePossible then
        Message(AutoReserveNotPossibleMsg);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..8
        //ReservationManagement.AutoReserve(FullAutoReservation,'',JobPlanningLine."Planning Date",QtyToReserve,QtyToReserveBase);
    #10..15
    */
    //end;


    //Unsupported feature: Code Modification on "SendRecords(PROCEDURE 34)".

    //procedure SendRecords();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DocumentSendingProfile.SendCustomerRecords(
      DummyReportSelections.Usage::JQ,Rec,ReportDistributionMgt.GetFullDocumentTypeText(Rec),
      "Bill-to Customer No.","No.",FieldNo("Bill-to Customer No."),FieldNo("No."));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    {DocumentSendingProfile.SendCustomerRecords(
      DummyReportSelections.Usage::JQ,Rec,ReportDistributionMgt.GetFullDocumentTypeText(Rec),
      "Bill-to Customer No.","No.",FIELDNO("Bill-to Customer No."),FIELDNO("No."));
      }
    */
    //end;


    //Unsupported feature: Code Modification on "SendProfile(PROCEDURE 33)".

    //procedure SendProfile();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DocumentSendingProfile.Send(
      ReportSelections.Usage::JQ,Rec,"No.","Bill-to Customer No.",
      ReportDistributionMgt.GetFullDocumentTypeText(Rec),FieldNo("Bill-to Customer No."),FieldNo("No."));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    {DocumentSendingProfile.Send(
      ReportSelections.Usage::JQ,Rec,"No.","Bill-to Customer No.",
      ReportDistributionMgt.GetFullDocumentTypeText(Rec),FIELDNO("Bill-to Customer No."),FIELDNO("No."));
      }
    */
    //end;


    //Unsupported feature: Code Modification on "EmailRecords(PROCEDURE 31)".

    //procedure EmailRecords();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DocumentSendingProfile.TrySendToEMail(
      ReportSelections.Usage::JQ,Rec,FieldNo("No."),
      ReportDistributionMgt.GetFullDocumentTypeText(Rec),FieldNo("Bill-to Customer No."),ShowDialog);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    {DocumentSendingProfile.TrySendToEMail(
      ReportSelections.Usage::JQ,Rec,FIELDNO("No."),
      ReportDistributionMgt.GetFullDocumentTypeText(Rec),FIELDNO("Bill-to Customer No."),ShowDialog);
      }
    */
    //end;

    procedure fntCrearLineasTarea()
    var
        rstJS: Record "Jobs Setup";
        rstLTP: Record "Job Task";
    begin
        Clear(rstJS);

        rstJS.Get();

        if rstJS."Job task default line" <> 0 then begin

            if not rstLTP.Get("No.", rstJS."Job task default line") then begin

                Clear(rstLTP);
                rstLTP."Job No." := "No.";
                rstLTP."Job Task No." := Format(rstJS."Job task default line");
                rstLTP."Job Task Type" := rstLTP."Job Task Type"::Posting;
                if rstLTP.Insert then;

            end;

        end;
    end;

    procedure fntCopiar(l_blnCopiar: Boolean)
    begin
        blnCopiar := l_blnCopiar;
    end;

    var
        rstCDA: Record "On board capture";


    //Unsupported feature: Property Modification (TextConstString) on "AssociatedEntriesExistErr(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //AssociatedEntriesExistErr : @@@="%1 = Name of field used in the error; %2 = The name of the Job table";ENU=You cannot change %1 because one or more entries are associated with this %2.;ESP=No puede cambiar el %1 porque hay uno o más movimientos asociados con este %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AssociatedEntriesExistErr : @@@="%1 = Name of field used in the error; %2 = The name of the Job table";ENU=You cannot change %1 because one or more entries are associated with this %2.;ESP=No puede cambiar el %1 porque hay uno o más movimientos asociados con este %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "StatusChangeQst(Variable 1017)".

    //var
    //>>>> ORIGINAL VALUE:
    //StatusChangeQst : ENU=This will delete any unposted WIP entries for this job and allow you to reverse the completion postings for this job.\\Do you wish to continue?;ESP=De esta manera eliminará cualquier movimiento WIP no registrado para este proyecto y podrá revertir los registros completados para este proyecto.\\¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //StatusChangeQst : ENU=This will delete any unposted WIP entries for this job and allow you to reverse the completion postings for this job.\\Do you wish to continue?;ESP=De esta manera eliminará cualquier movimiento WIP no registrado para este proyecto y podrá revertir los registros completados para este proyecto.\\?Desea continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ContactBusRelDiffCompErr(Variable 1019)".

    //var
    //>>>> ORIGINAL VALUE:
    //ContactBusRelDiffCompErr : @@@="%1 = The contact number; %2 = The contact's name; %3 = The Bill-To Customer Number associated with this job";ENU=Contact %1 %2 is related to a different company than customer %3.;ESP=Contacto %1 %2 está relacionado con una empresa diferente al cliente %3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ContactBusRelDiffCompErr : @@@="%1 = The contact number; %2 = The contact's name; %3 = The Bill-To Customer Number associated with this job";ENU=Contact %1 %2 is related to a different company than customer %3.;ESP=Contacto %1 %2 está relacionado con una empresa diferente al cliente %3.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ContactBusRelErr(Variable 1018)".

    //var
    //>>>> ORIGINAL VALUE:
    //ContactBusRelErr : @@@="%1 = The contact number; %2 = The contact's name; %3 = The Bill-To Customer Number associated with this job";ENU=Contact %1 %2 is not related to customer %3.;ESP=Contacto %1 %2 no está relacionado con el cliente %3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ContactBusRelErr : @@@="%1 = The contact number; %2 = The contact's name; %3 = The Bill-To Customer Number associated with this job";ENU=Contact %1 %2 is not related to customer %3.;ESP=Contacto %1 %2 no está relacionado con el cliente %3.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ContactBusRelMissingErr(Variable 1009)".

    //var
    //>>>> ORIGINAL VALUE:
    //ContactBusRelMissingErr : @@@="%1 = The contact number; %2 = The contact's name";ENU=Contact %1 %2 is not related to a customer.;ESP=El contacto %1 %2 no está relacionado con un cliente.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ContactBusRelMissingErr : @@@="%1 = The contact number; %2 = The contact's name";ENU=Contact %1 %2 is not related to a customer.;ESP=El contacto %1 %2 no está relacionado con un cliente.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ReverseCompletionEntriesMsg(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //ReverseCompletionEntriesMsg : @@@="%1 = The name of the Job Post WIP to G/L report";ENU=You must run the %1 function to reverse the completion entries that have already been posted for this job.;ESP=Debe ejecutar la función %1 para revertir los movimientos completados registrados para este proyecto.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReverseCompletionEntriesMsg : @@@="%1 = The name of the Job Post WIP to G/L report";ENU=You must run the %1 function to reverse the completion entries that have already been posted for this job.;ESP=Debe ejecutar la función %1 para revertir los movimientos completados registrados para este proyecto.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "OnlineMapMsg(Variable 1007)".

    //var
    //>>>> ORIGINAL VALUE:
    //OnlineMapMsg : ENU=Before you can use Online Map, you must fill in the Online Map Setup window.\See Setting Up Online Map in Help.;ESP=Para poder usar Online Map, primero debe rellenar la ventana Configuración Online Map.\Consulte Configuración de Online Map en la Ayuda.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //OnlineMapMsg : ENU=Before you can use Online Map, you must fill in the Online Map Setup window.\See Setting Up Online Map in Help.;ESP=Para poder usar Online Map, primero debe rellenar la ventana Configuración Online Map.\Consulte Configuración de Online Map en la Ayuda.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ApplyUsageLinkErr(Variable 1013)".

    //var
    //>>>> ORIGINAL VALUE:
    //ApplyUsageLinkErr : @@@="%1 = The name of the Job table";ENU=A usage link cannot be enabled for the entire %1 because usage without the usage link already has been posted.;ESP=No se puede activar un vínculo de uso para el %1 completo porque ya se ha registrado el uso sin vínculo de uso.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ApplyUsageLinkErr : @@@="%1 = The name of the Job table";ENU=A usage link cannot be enabled for the entire %1 because usage without the usage link already has been posted.;ESP=No se puede activar un vínculo de uso para el %1 completo porque ya se ha registrado el uso sin vínculo de uso.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "WIPMethodQst(Variable 1016)".

    //var
    //>>>> ORIGINAL VALUE:
    //WIPMethodQst : @@@="%1 = The WIP Method field name; %2 = The name of the Job Task table; %3 = The current job task's WIP Total type";ENU=Do you want to set the %1 on every %2 of type %3?;ESP=¿Desea establecer el %1 en cada %2 de tipo %3?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //WIPMethodQst : @@@="%1 = The WIP Method field name; %2 = The name of the Job Task table; %3 = The current job task's WIP Total type";ENU=Do you want to set the %1 on every %2 of type %3?;ESP=?Desea establecer el %1 en cada %2 de tipo %3?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "WIPAlreadyPostedErr(Variable 1020)".

    //var
    //>>>> ORIGINAL VALUE:
    //WIPAlreadyPostedErr : @@@="%1 = The name of the WIP Posting Method field; %2 = The previous WIP Posting Method value of this job";ENU=%1 must be %2 because job WIP general ledger entries already were posted with this setting.;ESP=%1 debe ser %2 porque los Movs. contabilidad WIP proyecto ya se registraron con esta configuración.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //WIPAlreadyPostedErr : @@@="%1 = The name of the WIP Posting Method field; %2 = The previous WIP Posting Method value of this job";ENU=%1 must be %2 because job WIP general ledger entries already were posted with this setting.;ESP=%1 debe ser %2 porque los Movs. contabilidad WIP proyecto ya se registraron con esta configuración.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "UpdateJobTaskDimQst(Variable 1026)".

    //var
    //>>>> ORIGINAL VALUE:
    //UpdateJobTaskDimQst : ENU=You have changed a dimension.\\Do you want to update the lines?;ESP=Ha cambiado una dimensión.\\¿Desea actualizar las líneas?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UpdateJobTaskDimQst : ENU=You have changed a dimension.\\Do you want to update the lines?;ESP=Ha cambiado una dimensión.\\?Desea actualizar las líneas?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "RunWIPFunctionsQst(Variable 1028)".

    //var
    //>>>> ORIGINAL VALUE:
    //RunWIPFunctionsQst : @@@="%1 = The name of the Job Calculate WIP report";ENU=You must run the %1 function to create completion entries for this job. \Do you want to run this function now?;ESP=Debe ejecutar la función %1 para crear los movimientos de finalización de este proyecto. \¿Desea ejecutar esta función ahora?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RunWIPFunctionsQst : @@@="%1 = The name of the Job Calculate WIP report";ENU=You must run the %1 function to create completion entries for this job. \Do you want to run this function now?;ESP=Debe ejecutar la función %1 para crear los movimientos de finalización de este proyecto. \?Desea ejecutar esta función ahora?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ReservationEntriesDeleteQst(Variable 1022)".

    //var
    //>>>> ORIGINAL VALUE:
    //ReservationEntriesDeleteQst : ENU=Any reservation entries that exist for this job will be deleted. \Do you want to continue?;ESP=Se eliminarán todos los movimientos de reserva que existan para este proyecto. \¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReservationEntriesDeleteQst : ENU=Any reservation entries that exist for this job will be deleted. \Do you want to continue?;ESP=Se eliminarán todos los movimientos de reserva que existan para este proyecto. \?Desea continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ReservationEntriesExistErr(Variable 1027)".

    //var
    //>>>> ORIGINAL VALUE:
    //ReservationEntriesExistErr : @@@="%1=The job status name";ENU=You cannot set the status to %1 because the job has reservations on the job planning lines.;ESP=No puede configurar el estado a %1 porque el proyecto tiene reservas en las líneas de planificación de proyecto.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReservationEntriesExistErr : @@@="%1=The job status name";ENU=You cannot set the status to %1 because the job has reservations on the job planning lines.;ESP=No puede configurar el estado a %1 porque el proyecto tiene reservas en las líneas de planificación de proyecto.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "AutoReserveNotPossibleMsg(Variable 1029)".

    //var
    //>>>> ORIGINAL VALUE:
    //AutoReserveNotPossibleMsg : ENU=Automatic reservation is not possible for one or more job planning lines. \Please reserve manually.;ESP=La reserva automática no es posible para una o más líneas de planificación de proyecto. \Reserve manualmente.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AutoReserveNotPossibleMsg : ENU=Automatic reservation is not possible for one or more job planning lines. \Please reserve manually.;ESP=La reserva automática no es posible para una o más líneas de planificación de proyecto. \Reserve manualmente.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "StatusCompletedErr(Variable 1031)".

    //var
    //>>>> ORIGINAL VALUE:
    //StatusCompletedErr : @@@="%1=Job number; %2=Job Status";ENU=You cannot select the Job %1, its status set to %2.;ESP=No puede establecer el trabajo %1, su estado está establecido en %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //StatusCompletedErr : @@@="%1=Job number; %2=Job Status";ENU=You cannot select the Job %1, its status set to %2.;ESP=No puede establecer el trabajo %1, su estado está establecido en %2.;
    //Variable type has not been exported.

    var
        MovProy: Record "Job Ledger Entry";
        Departamento: Record "Dimension Value";
        Proyecto: Record Job;

    var
        rstGLS: Record "General Ledger Setup";
        blnCopiar: Boolean;
}

