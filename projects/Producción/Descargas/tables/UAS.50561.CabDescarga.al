table 50561 "Cab. descarga"
{

    fields
    {
        field(1; "No. proyecto"; Code[20])
        {
            Caption = 'Job No.';
            ToolTip = 'Specifies the value of the Job No field.';
            NotBlank = true;
            TableRelation = Job WHERE(Blocked = CONST(" "),
                                       Tipo = CONST(Productivo));

            trigger OnValidate()
            begin
                Clear(rstProyecto);
                if rstProyecto.Get("No. proyecto") then begin

                    rstProyecto.TestField("Global Dimension 1 Code");
                    rstProyecto.TestField("Global Dimension 2 Code");
                    Capitán := rstProyecto.Patron;
                    CreateDim();

                end;
            end;
        }
        field(2; "Capitán"; Text[50])
        {
            Caption = 'Capitán';
            ToolTip = 'Specifies the value of the Capitán field.';
        }
        field(3; Actividad; Code[20])
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
        field(4; "Fecha de inicio de descarga"; Date)
        {
            Caption = 'Fecha de inicio de descarga';
            ToolTip = 'Specifies the value of the Fecha de inicio de descarga field.';
        }
        field(5; Buque; Code[20])
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
        field(6; Marea; Code[20])
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
        field(7; Location; Code[20])
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
        field(8; "Libro Diario"; Code[10])
        {
            Caption = 'Libro Diario';
            ToolTip = 'Specifies the value of the Libro Diario field.';
        }
        field(9; Puerto; Code[10])
        {
            Caption = 'Puerto';
            ToolTip = 'Specifies the value of the Puerto field.';
            NotBlank = true;

            trigger OnLookup()
            begin
                Clear(rstSeccDiaProd);
                Clear(frmSecDiaProd);
                Clear(rstConfEx);
                rstConfEx.Get();

                rstSeccDiaProd.SetRange("Journal Template Name", rstConfEx."Diario Descarga");

                frmSecDiaProd.SetTableView(rstSeccDiaProd);
                frmSecDiaProd.LookupMode := true;
                if frmSecDiaProd.RunModal = ACTION::LookupOK then begin

                    frmSecDiaProd.GetRecord(rstSeccDiaProd);
                    "Libro Diario" := rstSeccDiaProd."Journal Template Name";
                    Puerto := rstSeccDiaProd.Name;

                end;
            end;

            trigger OnValidate()
            begin
                Clear(rstSeccDiaProd);
                Clear(frmSecDiaProd);
                Clear(rstConfEx);
                rstConfEx.Get();

                rstSeccDiaProd.SetRange("Journal Template Name", rstConfEx."Diario Descarga");

                frmSecDiaProd.SetTableView(rstSeccDiaProd);
                frmSecDiaProd.LookupMode := true;
                if frmSecDiaProd.RunModal = ACTION::LookupOK then begin

                    frmSecDiaProd.GetRecord(rstSeccDiaProd);
                    "Libro Diario" := rstSeccDiaProd."Journal Template Name";
                    Puerto := rstSeccDiaProd.Name;

                end;

                ActlzrLineas(FieldName(Puerto));
            end;
        }
        field(10; "Cantidad x capitán"; Decimal)
        {
            Caption = 'Cantidad x capitán';
            ToolTip = 'Specifies the value of the Cantidad x capitán field.';
            CalcFormula = Sum("Lín. informe capitán".Cantidad WHERE("No. proyecto" = FIELD("No. proyecto"),
                                                                     Actividad = FIELD("Filtro actividad")));
            FieldClass = FlowField;
        }
        field(11; "Pallets desde"; Integer)
        {
            Caption = 'Pallets desde';
            ToolTip = 'Specifies the value of the Pallets desde field.';
        }
        field(12; "Pallets hasta"; Integer)
        {
            Caption = 'Pallets hasta';
            ToolTip = 'Specifies the value of the Pallets hasta field.';
        }
        field(13; "Cantidad x descarga"; Decimal)
        {
            Caption = 'Cantidad x descarga';
            ToolTip = 'Specifies the value of the Cantidad x descarga field.';
            CalcFormula = Sum("Lín. descarga".Cantidad WHERE("No. proyecto" = FIELD("No. proyecto"),
                                                              "Fecha remito" = FIELD("Filtro fecha")));
            FieldClass = FlowField;
        }
        field(14; "Hora inicio descarga"; Time)
        {
            Caption = 'Hora inicio descarga';
            ToolTip = 'Specifies the value of the Hora inicio descarga field.';
        }
        field(15; "Hora fin descarga"; Time)
        {
            Caption = 'Hora fin descarga';
            ToolTip = 'Specifies the value of the Hora fin descarga field.';
        }
        field(16; "Scale code"; Code[10])
        {
            Caption = 'Cód. balanza';
            ToolTip = 'Specifies the value of the Cód. balanza field.';
            DataClassification = ToBeClassified;
            TableRelation = "Weighing Scale Parameters"."Scale code";
        }
        field(17; "Dimension Set ID"; Integer)
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
        field(50000; Registrado; Boolean)
        {
            Caption = 'Registrado';
            ToolTip = 'Specifies the value of the Registrado field.';
        }
        field(50001; "Filtro fecha"; Date)
        {
            Caption = 'Date Filter';
            ToolTip = 'Specifies the value of the Date Filter field.';
            FieldClass = FlowFilter;
        }
        field(50002; "Origen del cartón"; Option)
        {
            Caption = 'Origen del cartón';
            ToolTip = 'Specifies the value of the Origen del cartón field.';
            DataClassification = ToBeClassified;
            OptionMembers = " ",Nacional,Importado;
        }
        field(50003; "KN linea descarga"; Decimal)
        {
            Caption = 'KN linea descarga';
            ToolTip = 'Specifies the value of the KN linea descarga field.';
            CalcFormula = Sum("Lín. descarga"."Net weight" WHERE("No. proyecto" = FIELD("No. proyecto"),
                                                                  Actividad = FIELD("Filtro actividad"),
                                                                  "Fecha remito" = FIELD("Filtro fecha")));
            FieldClass = FlowField;
        }
        field(50004; "Totales DCL"; Decimal)
        {
            Caption = 'Totales DCL';
            ToolTip = 'Specifies the value of the Totales DCL field.';
            CalcFormula = Sum("Lín. DCL"."Kilos netos" WHERE("No. proyecto" = FIELD("No. proyecto"),
                                                              Actividad = FIELD("Filtro actividad"),
                                                              "Fecha DCL" = FIELD("Filtro fecha"),
                                                              Cantidad = FILTER(> 0),
                                                              Registrado = CONST(true)));
            FieldClass = FlowField;
        }
        field(50005; "Filtro actividad"; Code[10])
        {
            Caption = 'Filtro actividad';
            ToolTip = 'Specifies the value of the Filtro actividad field.';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(50006; "Totales aplicados a DCL"; Decimal)
        {
            Caption = 'Totales aplicados a DCL';
            ToolTip = 'Specifies the value of the Totales aplicados a DCL field.';
            CalcFormula = Sum("DCL Application Lines"."Net kilos" WHERE("DCL Job no." = FIELD("No. proyecto"),
                                                                         "Document date" = FIELD("Filtro fecha"),
                                                                         Activity = FIELD("Filtro actividad")));
            FieldClass = FlowField;
        }
        field(50007; "Totales descontados DCL"; Decimal)
        {
            Caption = 'Totales descontados DCL';
            ToolTip = 'Specifies the value of the Totales descontados DCL field.';
            CalcFormula = Sum("Lín. DCL"."Kilos netos" WHERE("No. proyecto" = FIELD("No. proyecto"),
                                                              Actividad = FIELD("Filtro actividad"),
                                                              "Fecha DCL" = FIELD("Filtro fecha"),
                                                              "Kilos netos" = FILTER(< 0)));
            FieldClass = FlowField;
        }
        field(50008; "KN diario descarga"; Decimal)
        {
            Caption = 'KN diario descarga';
            ToolTip = 'Specifies the value of the KN diario descarga field.';
            CalcFormula = Sum("Item Ledger Entry"."Net kilos" WHERE("Job No." = FIELD("No. proyecto"),
                                                                     "Nombre libro diario" = CONST('DESCARGA')));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "No. proyecto")
        {
            Clustered = true;
        }
        key(Key2; "Fecha de inicio de descarga")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var
        rst32: Record "Item Ledger Entry";
    begin
        Clear(rstLinDescarga);
        rstLinDescarga.SetRange(rstLinDescarga."No. proyecto", "No. proyecto");
        rstLinDescarga.DeleteAll(true);
    end;

    trigger OnInsert()
    begin
        TestField(Puerto);
    end;

    trigger OnRename()
    var
        rstLDescarga: Record "Lín. descarga";
        rstLDescargaNew: Record "Lín. descarga";
    begin
        Clear(rstLDescarga);
        rstLDescarga.SetRange(rstLDescarga."No. proyecto", xRec."No. proyecto");

        if rstLDescarga.Find('-') then
            repeat

                Clear(rstLDescargaNew);
                rstLDescargaNew.Get(rstLDescarga."No. proyecto", rstLDescarga."Line no.");
                rstLDescargaNew.Rename("No. proyecto", rstLDescargaNew."Line no.");
                Clear(rstProyecto);
                rstProyecto.Get(rstLDescargaNew."No. proyecto");
                rstLDescargaNew.Buque := rstProyecto."Global Dimension 1 Code";
                rstLDescargaNew.Marea := rstProyecto."Global Dimension 2 Code";
                rstLDescargaNew.Actividad := rstProyecto."Global Dimension 3 Code";
                rstLDescargaNew.Modify;

            until rstLDescarga.Next = 0;
    end;

    var
        rstProyecto: Record Job;
        rstLinDescarga: Record "Lín. descarga";
        rstSeccDiaProd: Record "Item Journal Batch";
        rstConfEx: Record "Inventory Setup";
        frmSecDiaProd: Page "Item Journal Batches";
        DimMgt: Codeunit DimensionManagement;

    procedure CreateDim()
    var
        DefaultDimSource: List of [Dictionary of [Integer, Code[20]]];
    begin
        DimMgt.AddDimSource(DefaultDimSource, Database::Job, "No. proyecto");
        DimMgt.AddDimSource(DefaultDimSource, Database::Location, Location);
        "Dimension Set ID" := DimMgt.GetDefaultDimID(DefaultDimSource, '', Buque, Marea, 0, 0);
        UpdateShortcutDimsFromDimSet();
    end;

    procedure ShowDimensions()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet(Rec, "Dimension Set ID", StrSubstNo('%1 %2', TableCaption(), "No. proyecto"), Buque, Marea);

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

    local procedure ModifyIfInserted()
    var
        rstCabDescarga: Record "Cab. descarga";
    begin
        // Las dimensiones se pueden informar antes de insertar la cabecera; en ese caso
        // el Modify del estándar reventaría, así que sólo se graba si el registro ya existe.
        if IsTemporary() then
            exit;

        if rstCabDescarga.Get("No. proyecto") then
            Modify();
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

    [Scope('OnPrem')]
    procedure Navegar()
    var
        FormNavegar: Page Navigate;
    begin
        FormNavegar.SetDoc(0D, "No. proyecto");
        FormNavegar.Run;
    end;

    [Scope('OnPrem')]
    procedure ActlzrLineas(strNomCampo: Text[30])
    begin
        Clear(rstLinDescarga);
        rstLinDescarga.SetRange("No. proyecto", "No. proyecto");
        if rstLinDescarga.Find('-') then
            repeat

                case strNomCampo of
                    FieldName(Puerto):
                        rstLinDescarga.Validate(Puerto, Puerto);

                end;

                rstLinDescarga.Modify;

            until rstLinDescarga.Next = 0;
    end;
}

