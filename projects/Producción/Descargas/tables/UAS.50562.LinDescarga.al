table 50562 "Lín. descarga"
{

    fields
    {
        field(1; "No. proyecto"; Code[20])
        {
            Caption = 'Job No.';
            ToolTip = 'Specifies the value of the Job No field.';
            TableRelation = Job WHERE(Tipo = CONST(Productivo),
                                       Blocked = CONST(" "));

            trigger OnValidate()
            begin
                // Buque y Marea llegan heredados del conjunto de dimensiones de la cabecera,
                // que a su vez los toma de las dimensiones por defecto del proyecto.
                CreateDim();
            end;
        }
        field(2; "No. remito"; Code[20])
        {
            Caption = 'No. remito';
            ToolTip = 'Specifies the value of the No. remito field.';
            NotBlank = true;


        }
        field(3; "Line no."; Integer)
        {
            Caption = 'Line no.';
            ToolTip = 'Specifies the value of the Line no field.';
            AutoIncrement = true;
            NotBlank = true;
        }
        field(4; "Item no."; Code[20])
        {
            Caption = 'Rating';
            ToolTip = 'Specifies the value of the Rating field.';
            TableRelation = Item."No." WHERE(Captura = CONST(true),
                                              Blocked = CONST(false));

            trigger OnValidate()
            begin
                Clear(rstProducto);
                if rstProducto.Get("Item no.") then begin

                    Description := rstProducto.Description;
                    "Unidad medida" := rstProducto."Base Unit of Measure";
                    Familia := rstProducto.Familia;
                    Subfamilia := rstProducto.Subfamilia;
                    // Actividad sale de las dimensiones por defecto del producto vía CreateDim.
                    CreateDim();

                end;
            end;
        }
        field(5; Description; Text[100])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';
        }
        field(6; "Unidad medida"; Code[10])
        {
            Caption = 'Unidad medida';
            ToolTip = 'Specifies the value of the Unidad medida field.';
            TableRelation = "Item Unit of Measure".Code WHERE("Item No." = FIELD("Item no."));
        }
        field(7; Cantidad; Decimal)
        {
            Caption = 'Quantity';
            ToolTip = 'Specifies the value of the Quantity field.';

            trigger OnValidate()
            begin
                Clear(rstUMxProd);
                rstUMxProd.Get("Item no.", "Unidad medida");

                rstProducto.Get("Item no.");
                if (rstProducto."Utiliza Tarifario") then begin

                    Validate("Gross weight", rstLinDiaProd.FunCalcPesoBruto(Cantidad, "Item no.", rstUMxProd."Qty. per Unit of Measure"));
                    Validate("Net weight", rstLinDiaProd.FunCalcPesoNeto(Cantidad, "Item no.", rstUMxProd."Qty. per Unit of Measure"));

                end;

                fntPromedio;
            end;
        }
        field(8; "Net weight"; Decimal)
        {
            Caption = 'Kilos netos';
            ToolTip = 'Specifies the value of the Kilos netos field.';

            trigger OnValidate()
            begin
                fntPromedio;
            end;
        }
        field(9; "Gross weight"; Decimal)
        {
            Caption = 'Kilos brutos';
            ToolTip = 'Specifies the value of the Kilos brutos field.';
        }
        field(10; "Fecha remito"; Date)
        {
            Caption = 'Fecha remito';
            ToolTip = 'Specifies the value of the Fecha remito field.';
        }
        field(11; "Transport's license"; Code[10])
        {
            Caption = 'Transport registration';
            ToolTip = 'Specifies the value of the Transport registration field.';
        }
        field(12; Temperatura; Decimal)
        {
            Caption = 'Temperature';
            ToolTip = 'Specifies the value of the Temperature field.';
        }
        field(13; "Hora de ingreso"; Time)
        {
            Caption = 'Time of arrival';
            ToolTip = 'Specifies the value of the Time of arrival field.';
        }
        field(14; "Tipo de amparo sanitario"; Option)
        {
            Caption = 'Sanitary protection type';
            ToolTip = 'Specifies the value of the Sanitary protection type field.';
            BlankZero = true;
            OptionMembers = ,"P.T.","P.T.R.","C.S.E.P.","Guía de tránsito";
        }
        field(15; "No. amparo sanitario"; Code[30])
        {
            Caption = 'Sanitary protection no.';
            ToolTip = 'Specifies the value of the Sanitary protection no field.';
        }
        field(16; Destino; Code[30])
        {
            Caption = 'Destination';
            ToolTip = 'Specifies the value of the Destination field.';
        }
        field(17; "No. Pallet"; Code[20])
        {
            Caption = 'Pallet no.';
            ToolTip = 'Specifies the value of the Pallet no field.';
        }
        field(18; Location; Code[10])
        {
            Caption = 'Cámara';
            ToolTip = 'Specifies the value of the Cámara field.';
            TableRelation = Location;

            trigger OnValidate()
            begin
                if Location <> xRec.Location then
                    CreateDim();
            end;
        }
        field(19; Buque; Code[20])
        {
            Caption = 'Buque';
            ToolTip = 'Specifies the value of the Buque field.';
            CaptionClass = '1,2,1';
            DataClassification = CustomerContent;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, Buque);
            end;
        }
        field(20; Marea; Code[20])
        {
            Caption = 'Marea';
            ToolTip = 'Specifies the value of the Marea field.';
            CaptionClass = '1,2,2';
            DataClassification = CustomerContent;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, Marea);
            end;
        }
        field(21; Puerto; Code[10])
        {
            Caption = 'Puerto';
            ToolTip = 'Specifies the value of the Puerto field.';
        }
        field(22; Promedio; Decimal)
        {
            Caption = 'Promedio';
            ToolTip = 'Specifies the value of the Promedio field.';
            DataClassification = ToBeClassified;
        }
        field(23; "Bin code"; Code[20])
        {
            Caption = 'Ubicación';
            ToolTip = 'Specifies the value of the Ubicación field.';
            DataClassification = ToBeClassified;
            TableRelation = Bin.Code WHERE("Location Code" = FIELD(Location));
        }
        field(24; Tare; Decimal)
        {
            Caption = 'Tare';
            ToolTip = 'Specifies the value of the Tare field.';
            DataClassification = ToBeClassified;
        }
        field(25; "Gross + Tare"; Decimal)
        {
            Caption = 'Bruto + tara';
            ToolTip = 'Specifies the value of the Bruto + tara field.';
            DataClassification = ToBeClassified;
        }
        field(26; "Weighing Date and Time"; DateTime)
        {
            Caption = 'Fecha y hora pesada';
            ToolTip = 'Specifies the value of the Fecha y hora pesada field.';
            DataClassification = ToBeClassified;
        }
        field(27; Confirmed; Option)
        {
            Caption = 'Confirmado';
            ToolTip = 'Specifies the value of the Confirmado field.';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Pesar activamente",Confirmada,Reabrir;
        }
        field(28; Status; Text[50])
        {
            Caption = 'Estado';
            ToolTip = 'Specifies the value of the Estado field.';
            DataClassification = ToBeClassified;
        }
        field(30; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            ToolTip = 'Specifies the value of the Dimension Set ID field.';
            DataClassification = SystemMetadata;
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDimensions();
            end;
        }
        field(50000; Actividad; Code[20])
        {
            Caption = 'Actividad';
            ToolTip = 'Specifies the value of the Actividad field.';
            CaptionClass = '1,2,3';
            DataClassification = CustomerContent;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, Actividad);
            end;

            trigger OnLookup()
            begin
                DimMgt.LookupDimValueCode(3, Actividad);
                ValidateShortcutDimCode(3, Actividad);
            end;
        }
        field(50001; Familia; Code[10])
        {
            Caption = 'Family';
            ToolTip = 'Specifies the value of the Family field.';
            TableRelation = Family;
        }
        field(50002; Subfamilia; Code[10])
        {
            Caption = 'Subfamily';
            ToolTip = 'Specifies the value of the Subfamily field.';
            TableRelation = "Subfamilia producto".Code WHERE("Family code" = FIELD(Familia));
        }
        field(60000; "Manual unit of measure"; Code[10])
        {
            Caption = 'Unidad medida manual';
            ToolTip = 'Specifies the value of the Unidad medida manual field.';
            DataClassification = ToBeClassified;
            TableRelation = "Item Unit of Measure".Code WHERE("Item No." = FIELD("Item no."));
        }
        field(60001; "Manual weight"; Decimal)
        {
            Caption = 'Peso manual';
            ToolTip = 'Specifies the value of the Peso manual field.';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No. proyecto", "Line no.")
        {
            Clustered = true;
            SumIndexFields = Cantidad, "Net weight", "Gross weight";
        }
        key(Key2; "No. proyecto", "Item no.")
        {
            SQLIndex = "No. proyecto", "Item no.";
            SumIndexFields = Cantidad, "Net weight", "Gross weight";
        }
        key(Key3; "No. proyecto", Subfamilia)
        {
            SumIndexFields = Cantidad, "Net weight", "Gross weight";
        }
        key(Key4; "No. proyecto", "Unidad medida")
        {
            SumIndexFields = Cantidad, "Net weight", "Gross weight";
        }
        key(Key5; "No. proyecto", "No. remito")
        {
            SumIndexFields = Cantidad, "Net weight", "Gross weight";
        }
        key(Key6; "No. proyecto", "No. Pallet")
        {
            SumIndexFields = Cantidad, "Net weight", "Gross weight";
        }
        key(Key7; Actividad)
        {
            SumIndexFields = Cantidad, "Net weight", "Gross weight";
        }
        key(Key8; Buque, Actividad)
        {
            SumIndexFields = Cantidad, "Net weight", "Gross weight";
        }
        key(Key9; Buque, "Item no.", "Fecha remito")
        {
            SumIndexFields = Cantidad, "Net weight", "Gross weight";
        }
        key(Key10; Buque, Actividad, "Fecha remito")
        {
            SumIndexFields = Cantidad, "Net weight", "Gross weight";
        }
        key(Key11; Puerto, Buque, "Item no.", "Fecha remito")
        {
            SumIndexFields = Cantidad, "Net weight", "Gross weight";
        }
        key(Key12; Puerto, Buque, Actividad, "Fecha remito")
        {
            SumIndexFields = Cantidad, "Net weight", "Gross weight";
        }
        key(Key13; Actividad, Subfamilia, Buque, "Fecha remito")
        {
            SumIndexFields = Cantidad, "Net weight", "Gross weight";
        }
        key(Key14; Subfamilia, Puerto, Buque, Actividad, "Fecha remito")
        {
            SumIndexFields = Cantidad, "Net weight", "Gross weight";
        }
        key(Key15; Subfamilia, Puerto, Buque, Actividad, "Fecha remito", Marea)
        {
            SumIndexFields = Cantidad, "Net weight", "Gross weight";
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var
        rst32: Record "Item Ledger Entry";
    begin
        Clear(rst32);
        rst32.SetRange(rst32."Item No.", "Item no.");
        rst32.SetRange("Job No.", "No. proyecto");
        rst32.SetRange(Revertido, false);
        if (not rst32.IsEmpty) then
            Error('Existen registros para esta descarga, no puede eliminarla.');
    end;

    trigger OnInsert()
    begin
        Clear(rstCabDesc);
        rstCabDesc.Get("No. proyecto");
        Validate("No. proyecto", rstCabDesc."No. proyecto");
        if Location = '' then
            Location := rstCabDesc.Location;
        Puerto := rstCabDesc.Puerto;
        // Se recalcula al final para que la cámara ya informada entre como origen de dimensiones.
        CreateDim();
    end;

    var
        rstProducto: Record Item;
        rstCabecera: Record "Cab. descarga";
        rstUMxProd: Record "Item Unit of Measure";
        rstLinDiaProd: Record "Item Journal Line";
        rstCabDesc: Record "Cab. descarga";
        rstProyecto: Record Job;
        frmListaProd: Page "Item List";
        DimMgt: Codeunit DimensionManagement;

    procedure CreateDim()
    var
        DefaultDimSource: List of [Dictionary of [Integer, Code[20]]];
        CabDimSetID: Integer;
    begin
        DimMgt.AddDimSource(DefaultDimSource, Database::Item, "Item no.");
        DimMgt.AddDimSource(DefaultDimSource, Database::Location, Location);

        Clear(rstCabecera);
        if rstCabecera.Get("No. proyecto") then
            CabDimSetID := rstCabecera."Dimension Set ID";

        "Dimension Set ID" :=
          DimMgt.GetDefaultDimID(DefaultDimSource, '', Buque, Marea, CabDimSetID, Database::Job);
        UpdateShortcutDimsFromDimSet();
    end;

    procedure ShowDimensions()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet(
            Rec, "Dimension Set ID", StrSubstNo('%1 %2 %3', TableCaption(), "No. proyecto", "Line no."), Buque, Marea);

        if OldDimSetID <> "Dimension Set ID" then begin
            UpdateShortcutDimsFromDimSet();
            ModifyIfInserted();
        end;
    end;

    local procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        UpdateShortcutDimsFromDimSet();
        ModifyIfInserted();
    end;

    local procedure UpdateShortcutDimsFromDimSet()
    var
        ShortcutDimCode: array[8] of Code[20];
    begin
        DimMgt.GetShortcutDimensions("Dimension Set ID", ShortcutDimCode);
        Buque := ShortcutDimCode[1];
        Marea := ShortcutDimCode[2];
        Actividad := ShortcutDimCode[3];
    end;

    local procedure ModifyIfInserted()
    var
        rstLinDescarga: Record "Lín. descarga";
    begin
        if IsTemporary() then
            exit;

        if rstLinDescarga.Get("No. proyecto", "Line no.") then
            Modify();
    end;

    [Scope('OnPrem')]
    procedure Navigate()
    var
        NavigateForm: Page Navigate;
    begin
        NavigateForm.SetDoc("Fecha remito", "No. remito");
        NavigateForm.Run;
    end;

    local procedure fntPromedio()
    begin
        if (Cantidad <> 0)
          and
           ("Net weight" <> 0)
           then
            Promedio := Round("Net weight" / Cantidad, 0.01)
        else
            Promedio := 0;
    end;
}

