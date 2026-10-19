table 50565 "Lín. DCL"
{

    fields
    {
        field(1; "No. proyecto"; Code[20])
        {
            Caption = 'Job No.';
            ToolTip = 'Specifies the value of the Job No field.';
            TableRelation = Job WHERE(Tipo = CONST(Productivo),
                                       Blocked = CONST(" "));
        }
        field(2; "No. línea"; Integer)
        {
            Caption = 'Line No.';
            ToolTip = 'Specifies the value of the Line No field.';
        }
        field(3; "Clasificación"; Code[20])
        {
            Caption = 'Rating';
            ToolTip = 'Specifies the value of the Rating field.';
            TableRelation = Item."No." WHERE(Captura = CONST(true),
                                              Blocked = CONST(false));

            trigger OnValidate()
            begin
                Clear(rstProducto);
                if rstProducto.Get(Clasificación) then begin

                    Descripción := rstProducto.Description;
                    "Unidad medida" := rstProducto."Base Unit of Measure";
                    // Actividad sale de las dimensiones por defecto del producto vía CreateDim.
                    CreateDim();
                    Familia := rstProducto.Familia;
                    Subfamilia := rstProducto.Subfamilia;
                    TestField(Descripción);
                    TestField("Unidad medida");
                    TestField(Actividad);
                    TestField(Familia);
                    TestField(Subfamilia);
                    fntGetCab;
                    if "Fecha DCL" = 0D then
                        Validate("Fecha DCL", rstCabDCL."Fecha de inicio de descarga");
                    TestField("Fecha DCL");
                end;
            end;
        }
        field(4; "Descripción"; Text[150])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';
        }
        field(5; "Unidad medida"; Code[10])
        {
            Caption = 'Unidad medida';
            ToolTip = 'Specifies the value of the Unidad medida field.';
            TableRelation = "Item Unit of Measure".Code WHERE("Item No." = FIELD("Clasificación"));
        }
        field(6; Cantidad; Decimal)
        {
            Caption = 'Quantity';
            ToolTip = 'Specifies the value of the Quantity field.';

            trigger OnValidate()
            begin
                //TESTFIELD("Applied kilos",0);

                Clear(rstUMxProd);
                rstUMxProd.Get(Clasificación, "Unidad medida");

                rstProducto.Get(Clasificación);
                if (rstProducto."Utiliza Tarifario") then begin

                    Validate("Kilos netos", rstLinDiaProd.FunCalcPesoNeto(Cantidad, Clasificación, rstUMxProd."Qty. per Unit of Measure"));

                end;

                fntPromedio;
            end;
        }
        field(7; "Kilos netos"; Decimal)
        {
            Caption = 'Kilos netos';
            ToolTip = 'Specifies the value of the Kilos netos field.';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //TESTFIELD("Applied kilos",0);

                fntPromedio;
            end;
        }
        field(8; Promedio; Decimal)
        {
            Caption = 'Promedio';
            ToolTip = 'Specifies the value of the Promedio field.';
            DataClassification = ToBeClassified;
        }
        field(9; Cliente; Code[20])
        {
            Caption = 'Cliente';
            ToolTip = 'Specifies the value of the Cliente field.';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            var
                rstCliente: Record "Dimension Value";
                rstGS: Record "General Ledger Setup";
            begin
                Clear(rstCliente);
                Clear(rstGS);
                rstGS.Get();
                if rstCliente.Get(rstGS."Global Dimension 1 Code", Cliente) then
                    "Nombre cliente" := rstCliente.Name
                else
                    "Nombre cliente" := '';

                // En el DCL la dimensión 1 de la línea es el cliente, no el buque de la cabecera.
                ValidateShortcutDimCode(1, Cliente);
            end;
        }
        field(10; "Nombre cliente"; Text[200])
        {
            Caption = 'Nombre cliente';
            ToolTip = 'Specifies the value of the Nombre cliente field.';
            DataClassification = ToBeClassified;
        }
        field(11; Referencia; Integer)
        {
            Caption = 'Referencia';
            ToolTip = 'Specifies the value of the Referencia field.';
            DataClassification = ToBeClassified;
        }
        field(12; "Applied kilos"; Decimal)
        {
            CalcFormula = Sum("DCL Application Lines"."Origin kilos" WHERE("DCL Job no." = FIELD("No. proyecto"),
                                                                            Activity = FIELD(Actividad),
                                                                            "Original Item no." = FIELD("Clasificación")));
            Caption = 'Kilos aplicados';
            ToolTip = 'Specifies the value of the Kilos aplicados field.';
            FieldClass = FlowField;
        }
        field(13; "Fecha DCL"; Date)
        {
            Caption = 'Fecha DCL';
            ToolTip = 'Specifies the value of the Fecha DCL field.';
            DataClassification = ToBeClassified;
        }
        field(14; "Reparto relacionado"; Code[20])
        {
            Caption = 'Reparto relacionado';
            ToolTip = 'Specifies the value of the Reparto relacionado field.';
            DataClassification = ToBeClassified;
            TableRelation = "Cab. Reparto"."No. Documento";

            trigger OnValidate()
            begin
                TestField("Kilos netos");
                if ("Kilos netos" > 0) then
                    Error('Sólo debe vincular un descuento a un Reparto cuando está realizando un descuento manual.');
            end;
        }
        field(15; "Dimension Set ID"; Integer)
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
        field(50003; Registrado; Boolean)
        {
            Caption = 'Registrado';
            ToolTip = 'Specifies the value of the Registrado field.';
            DataClassification = ToBeClassified;
        }
        field(50009; "Cajones acordados"; Decimal)
        {
            Caption = 'Cajones acordados';
            ToolTip = 'Specifies the value of the Cajones acordados field.';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                fntImporteAcordado
            end;
        }
        field(50010; "Promedio acordado"; Decimal)
        {
            Caption = 'Promedio acordado';
            ToolTip = 'Specifies the value of the Promedio acordado field.';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                fntImporteAcordado;
            end;
        }
        field(50011; "Valor por kilo acordado"; Decimal)
        {
            Caption = 'Valor por kilo acordado';
            ToolTip = 'Specifies the value of the Valor por kilo acordado field.';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                fntImporteAcordado;
            end;
        }
        field(50012; "Importe acordado esperado"; Decimal)
        {
            Caption = 'Importe acordado esperado';
            ToolTip = 'Specifies the value of the Importe acordado esperado field.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50013; "Kilos acordados"; Decimal)
        {
            Caption = 'Kilos acordados';
            ToolTip = 'Specifies the value of the Kilos acordados field.';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No. proyecto", "No. línea")
        {
            Clustered = true;
            SumIndexFields = Cantidad;
        }
        key(Key2; "No. proyecto", "Clasificación")
        {
            SumIndexFields = Cantidad;
        }
        key(Key3; "No. proyecto", Subfamilia)
        {
            SumIndexFields = Cantidad;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        if Registrado then
            Error('No puede eliminar una línea del DCL original. Para eliminar esta línea, primero tiene que revertir el registro.');
    end;

    trigger OnInsert()
    begin
        Clear(rstCliPred);
        rstCliPred.Get();

        Validate(Cliente, rstCliPred."DCL local customer");
        fntGetCab;
        CreateDim();
        if "Fecha DCL" = 0D then
            Validate("Fecha DCL", rstCabDCL."Fecha de inicio de descarga");
    end;

    trigger OnModify()
    begin
        /*
        IF Registrado THEN
          ERROR('No puede modificar una línea del DCL original. Para modificar esta línea, primero tiene que revertir el registro.');
          */

    end;

    trigger OnRename()
    begin
        if Registrado then
            Error('No puede modificar una línea del DCL original. Para modificar esta línea, primero tiene que revertir el registro.');
    end;

    var
        rstProducto: Record Item;
        rstCabecera: Record "Cab. informe capitán";
        frmListaProd: Page "Item List";
        rstUMxProd: Record "Item Unit of Measure";
        rstLinDiaProd: Record "Item Journal Line";
        rstCliPred: Record "Sales & Receivables Setup";
        rstCabDCL: Record "Cab. DCL";
        DimMgt: Codeunit DimensionManagement;

    procedure CreateDim()
    var
        DefaultDimSource: List of [Dictionary of [Integer, Code[20]]];
        l_rstCabDCL: Record "Cab. DCL";
        CabDimSetID: Integer;
        Dim1: Code[20];
        Dim2: Code[20];
    begin
        DimMgt.AddDimSource(DefaultDimSource, Database::Item, "Clasificación");

        if l_rstCabDCL.Get("No. proyecto") then
            CabDimSetID := l_rstCabDCL."Dimension Set ID";

        // Dim1/Dim2 son auxiliares: la cabecera aporta buque y marea, pero en la línea
        // la dimensión 1 la manda el cliente, así que se reaplica justo después.
        "Dimension Set ID" := DimMgt.GetDefaultDimID(DefaultDimSource, '', Dim1, Dim2, CabDimSetID, Database::Job);

        if Cliente <> '' then
            DimMgt.ValidateShortcutDimValues(1, Cliente, "Dimension Set ID");

        UpdateShortcutDimsFromDimSet();
    end;

    procedure ShowDimensions()
    var
        OldDimSetID: Integer;
        Dim2: Code[20];
    begin
        // La línea no tiene campo para la dimensión 2 (la marea vive en la cabecera):
        // Dim2 es un descarte, el valor real queda en el conjunto de dimensiones.
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet(
            Rec, "Dimension Set ID", StrSubstNo('%1 %2 %3', TableCaption(), "No. proyecto", "No. línea"), Cliente, Dim2);

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
        rstCliente: Record "Dimension Value";
        rstGS: Record "General Ledger Setup";
    begin
        DimMgt.GetShortcutDimensions("Dimension Set ID", ShortcutDimCode);
        Cliente := ShortcutDimCode[1];
        Actividad := ShortcutDimCode[3];

        // El cliente puede cambiar desde el conjunto de dimensiones, no sólo desde el campo.
        rstGS.Get();
        if rstCliente.Get(rstGS."Global Dimension 1 Code", Cliente) then
            "Nombre cliente" := rstCliente.Name
        else
            "Nombre cliente" := '';
    end;

    local procedure ModifyIfInserted()
    var
        l_rstLinDCL: Record "Lín. DCL";
    begin
        if IsTemporary() then
            exit;

        if l_rstLinDCL.Get("No. proyecto", "No. línea") then
            Modify();
    end;

    local procedure fntPromedio()
    begin
        if (Cantidad <> 0)
          and
           ("Kilos netos" <> 0)
           then
            Promedio := Round("Kilos netos" / Cantidad, 0.01)
        else
            Promedio := 0;
    end;

    local procedure fntImporteAcordado()
    begin
        "Kilos acordados" := "Cajones acordados" * "Promedio acordado";
        if ("Kilos acordados" <> 0) and ("Valor por kilo acordado" <> 0) then
            "Importe acordado esperado" := "Kilos acordados" * "Valor por kilo acordado"
        else
            "Importe acordado esperado" := 0;
    end;

    local procedure fntGetCab()
    begin
        Clear(rstCabDCL);
        rstCabDCL.Get("No. proyecto");
    end;
}

