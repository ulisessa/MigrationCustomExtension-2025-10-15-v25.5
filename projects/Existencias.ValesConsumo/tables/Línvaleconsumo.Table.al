table 50103 "Lín. vale consumo"
{
    // 
    // Doversys - FMac - 12/11/2003 - Se agregó campo "Nº OP" (Número de orden de producción).
    //                                Se agregó código para validar la carga del campo "Nº OP".
    // 
    // US.ARBU - 20040806
    //  a) Adición soporte recursos
    //  b) Adición campo
    // 
    //     50501    "Facturable"    Boolean


    fields
    {
        field(1; "No. documento"; Code[30])
        {
            Caption = 'Document No.';
            ToolTip = 'Specifies the value of the Document No field.';
        }
        field(2; "No. línea"; Integer)
        {
            Caption = 'Line No.';
            ToolTip = 'Specifies the value of the Line No field.';
            AutoIncrement = true;
        }
        field(3; "No."; Code[30])
        {
            Caption = 'No.';
            ToolTip = 'Specifies the value of the No field.';
            TableRelation = IF (Tipo = CONST(Producto)) Item WHERE("Tipo producto" = CONST(Consumo))
            ELSE
            IF (Tipo = CONST(Recurso)) Resource WHERE(Type = FILTER(Expense | Sale));

            trigger OnValidate()
            begin
                case Tipo of
                    Tipo::Producto:
                        begin

                            if not Producto.Get("No.") then
                                Clear(Producto);

                            //FMAC 05 02 2004
                            Validate(Cantidad);

                            "Cód. unidad medida" := Producto."Base Unit of Measure";
                            Descripción := Producto.Description;
                            //<< D3 RGR 05/12/02
                            "Descripción 2" := Producto."Description 2";
                            "Shortcut Dimension 1 Code" := Producto."Global Dimension 1 Code";
                            "Shortcut Dimension 2 Code" := Producto."Global Dimension 2 Code";
                            "Shortcut Dimension 3 Code" := Producto."Global Dimension 3 Code";
                            "Shortcut Dimension 4 Code" := Producto."Global Dimension 4 Code";
                            "Shortcut Dimension 5 Code" := Producto."Global Dimension 5 Code";
                            "Shortcut Dimension 6 Code" := Producto."Global Dimension 6 Code";
                            "Shortcut Dimension 7 Code" := Producto."Global Dimension 7 Code";


                        end;
                    Tipo::Recurso:
                        begin

                            if not rstRecurso.Get("No.") then
                                Clear(rstRecurso);

                            Validate(Cantidad);
                            if rstRecurso.Type = rstRecurso.Type::Sale then
                                "Cód. unidad medida" := rstRecurso."Base Unit of Measure";
                            Descripción := rstRecurso.Name;
                            "Shortcut Dimension 1 Code" := rstRecurso."Global Dimension 1 Code";
                            "Shortcut Dimension 2 Code" := rstRecurso."Global Dimension 2 Code";
                            "Shortcut Dimension 3 Code" := rstRecurso."Global Dimension 3 Code";
                            "Shortcut Dimension 4 Code" := rstRecurso."Global Dimension 4 Code";
                            "Shortcut Dimension 5 Code" := rstRecurso."Global Dimension 5 Code";
                            "Shortcut Dimension 6 Code" := rstRecurso."Global Dimension 6 Code";
                            "Shortcut Dimension 7 Code" := rstRecurso."Global Dimension 7 Code";

                        end;

                end;
            end;
        }
        field(4; "Descripción"; Text[199])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';
        }
        field(5; Cantidad; Decimal)
        {
            Caption = 'Quantity';
            ToolTip = 'Specifies the value of the Quantity field.';
            MinValue = 0;
        }
        field(6; "Descripción 2"; Text[50])
        {
            Caption = 'Description 2';
            ToolTip = 'Specifies the value of the Description 2 field.';
        }
        field(7; Tipo; Option)
        {
            Caption = 'Tipo';
            ToolTip = 'Specifies the value of the Tipo field.';
            InitValue = Producto;
            OptionMembers = " ",Producto,Recurso,Cuenta;
        }
        field(8; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(9; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(10; "Shortcut Dimension 3 Code"; Code[10])
        {
            Caption = 'Shortcut Dimension 3 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
            CaptionClass = '1,2,3';


            trigger OnValidate()
            begin
                //ActlzLinsVentas(FIELDNAME("Cód. 3ºNivel"));
            end;
        }
        field(11; "Shortcut Dimension 4 Code"; Code[10])
        {
            Caption = 'Shortcut Dimension 4 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
            CaptionClass = '1,2,4';

        }
        field(12; "Shortcut Dimension 5 Code"; Code[10])
        {
            Caption = 'Shortcut Dimension 5 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 5 Code field.';
            CaptionClass = '1,2,5';

        }
        field(13; "Shortcut Dimension 6 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 6 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 6 Code field.';
            CaptionClass = '1,2,6';

        }
        field(14; "Shortcut Dimension 7 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 7 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 7 Code field.';
            CaptionClass = '1,2,7';

        }
        field(15; "Concepto proyecto"; Code[10])
        {
            Caption = 'Job concept';
            ToolTip = 'Specifies the value of the Job concept field.';
            TableRelation = "Concepto proyecto";
        }
        field(16; "Cód. unidad medida"; Code[10])
        {
            Caption = 'Cód. unidad medida';
            ToolTip = 'Specifies the value of the Cód. unidad medida field.';
            TableRelation = "Item Unit of Measure".Code WHERE("Item No." = FIELD("No."));

            trigger OnValidate()
            begin
                //FMAC 05 02 2004
                Validate(Cantidad);
            end;
        }
        field(17; "Cód. depósito"; Code[10])
        {
            Caption = 'Cód. depósito';
            ToolTip = 'Specifies the value of the Cód. depósito field.';
            TableRelation = Location;

            trigger OnValidate()
            begin
                //FMAC 05 02 2004
                Validate(Cantidad);
            end;
        }
        field(18; Usuario; Code[30])
        {
            Caption = 'User ID';
            ToolTip = 'Specifies the value of the User ID field.';
            TableRelation = "User Setup";
        }
        field(19; "No. proyecto"; Code[20])
        {
            Caption = 'Job No.';
            ToolTip = 'Specifies the value of the Job No field.';
            TableRelation = Job;

            trigger OnValidate()
            var
                rstJob: Record Job;
            begin
                Clear(rstJob);
                if rstJob.Get("No. proyecto") then begin

                    if rstJob."Global Dimension 1 Code" <> '' then
                        Validate("Shortcut Dimension 1 Code", rstJob."Global Dimension 1 Code");
                    if rstJob."Global Dimension 2 Code" <> '' then
                        Validate("Shortcut Dimension 2 Code", rstJob."Global Dimension 2 Code");
                    if rstJob."Global Dimension 3 Code" <> '' then
                        Validate("Shortcut Dimension 3 Code", rstJob."Global Dimension 3 Code");
                    if rstJob."Global Dimension 4 Code" <> '' then
                        Validate("Shortcut Dimension 4 Code", rstJob."Global Dimension 4 Code");
                    if rstJob."Global Dimension 5 Code" <> '' then
                        Validate("Shortcut Dimension 5 Code", rstJob."Global Dimension 5 Code");
                    if rstJob."Global Dimension 6 Code" <> '' then
                        Validate("Shortcut Dimension 6 Code", rstJob."Global Dimension 6 Code");
                    if rstJob."Global Dimension 7 Code" <> '' then
                        Validate("Shortcut Dimension 7 Code", rstJob."Global Dimension 7 Code");

                end;
            end;
        }
        field(20; Revertido; Boolean)
        {
            Caption = 'Reversed';
            ToolTip = 'Specifies the value of the Reversed field.';
        }
        field(21; "Lot No."; Code[30])
        {
            Caption = 'Lot No.';
            ToolTip = 'Specifies the value of the Lot No field.';
            Editable = false;

            trigger OnLookup()
            begin
                SelectMovProd(FieldNo("Lot No."));
            end;
        }
        field(22; "Precio unitario"; Decimal)
        {
            Caption = 'Precio unitario';
            ToolTip = 'Specifies the value of the Precio unitario field.';
            CalcFormula = Lookup(Item."Unit Cost" WHERE("No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(23; "Remaining qty in location"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("No."),
                                                                  "Location Code" = FIELD("Cód. depósito")));
            Caption = 'Inventory';
            ToolTip = 'Specifies the value of the Inventory field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(24; "Bin code"; Code[20])
        {
            Caption = 'Ubicación';
            ToolTip = 'Specifies the value of the Ubicación field.';
            DataClassification = ToBeClassified;
            TableRelation = Bin.Code WHERE("Location Code" = FIELD("Cód. depósito"),
                                            Empty = FILTER(false));
        }
    }

    keys
    {
        key(Key1; "No. documento", "No. línea")
        {
            Clustered = true;
        }
        key(Key2; "No.")
        {

        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if (Tipo <> Tipo::" ") and ("No." = '') then
            Error('Debe ingresar algún valor en el campo N°');
        Usuario := UserId;
    end;

    trigger OnModify()
    begin
        if (Tipo <> Tipo::" ") and ("No." = '') then
            Error('Debe ingresar algún valor en el campo N°');
    end;

    var
        Producto: Record Item;
        CabVale: Record "Cab. Vale consumo";
        recProyecto: Record Job;
        recMovProy: Record "Job Ledger Entry";
        recMovProd: Record "Item Ledger Entry";
        TestDispoProd: Codeunit "Item-Check Avail.";
        rstRecurso: Record Resource;
        rstProduccion: Record "Produccion Planta";
        MovtoProducto: Record "Item Ledger Entry";
        frmProduccion: Page "Job Card";

    [Scope('OnPrem')]
    procedure Disponibilidad(qtipo: Integer)
    var
        LDP: Record "Item Journal Line";
    begin
        LDP."Item No." := "No.";
        //LDP.ItemAvailability(qtipo);
    end;

    local procedure SelectMovProd(NoCampoActual: Integer)
    begin
        //TESTFIELD(Tipo,Tipo::Recurso);

        MovtoProducto.SetCurrentKey("Item No.", Open, "Lot No.", Positive, "Location Code",
                                    "Posting Date", "Entry/Exit Point");
        MovtoProducto.SetRange("Item No.", "No.");
        MovtoProducto.SetRange(Open, true);
        if PAGE.RunModal(PAGE::"Item Ledger Entries", MovtoProducto) = ACTION::LookupOK then begin
            "Cód. depósito" := MovtoProducto."Location Code";
            "Lot No." := MovtoProducto."Lot No.";
            Validate("No. proyecto", MovtoProducto."Job No.");

        end;
    end;
}

