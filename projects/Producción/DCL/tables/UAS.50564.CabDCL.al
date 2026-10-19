table 50564 "Cab. DCL"
{

    fields
    {
        field(1; "No. proyecto"; Code[20])
        {
            Caption = 'Job No.';
            ToolTip = 'Specifies the value of the Job No field.';
            NotBlank = true;
            TableRelation = Job;

            trigger OnValidate()
            var
                rstDescarga: Record "Cab. descarga";
            begin
                Clear(rstProyecto);
                if rstProyecto.Get("No. proyecto") then begin

                    Clear(rstDescarga);
                    if rstDescarga.Get("No. proyecto") then;
                    CreateDim();
                    "Fecha de inicio de descarga" := rstDescarga."Fecha de inicio de descarga";
                    "Fecha y hora desembarque" := CreateDateTime(rstProyecto."Ending Date", rstProyecto."Hora ingreso a puerto");
                    "Fecha y hora zarpada" := CreateDateTime(rstProyecto."Starting Date", rstProyecto."Hora de zarpada");

                end;
            end;
        }
        field(2; Buque; Code[20])
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
        field(4; Marea; Code[20])
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
        field(5; "Fecha de inicio de descarga"; Date)
        {
            Caption = 'Fecha de inicio de descarga';
            ToolTip = 'Specifies the value of the Fecha de inicio de descarga field.';

            trigger OnValidate()
            var
                l_rstLDCL: Record "Lín. DCL";
            begin
                Clear(l_rstLDCL);
                l_rstLDCL.SetRange("No. proyecto", "No. proyecto");
                l_rstLDCL.ModifyAll("Fecha DCL", "Fecha de inicio de descarga");
            end;
        }
        field(6; "Fecha y hora zarpada"; DateTime)
        {
            Caption = 'Fecha y hora zarpada';
            ToolTip = 'Specifies the value of the Fecha y hora zarpada field.';
            DataClassification = ToBeClassified;
        }
        field(7; "Fecha y hora desembarque"; DateTime)
        {
            Caption = 'Fecha y hora desembarque';
            ToolTip = 'Specifies the value of the Fecha y hora desembarque field.';
            DataClassification = ToBeClassified;
        }
        field(8; "No. DCL"; Code[10])
        {
            Caption = 'No. DCL';
            ToolTip = 'Specifies the value of the No. DCL field.';
            DataClassification = ToBeClassified;
        }
        field(10; Cantidad; Decimal)
        {
            Caption = 'Quantity';
            ToolTip = 'Specifies the value of the Quantity field.';
            CalcFormula = Sum("Lín. DCL".Cantidad WHERE("No. proyecto" = FIELD("No. proyecto"),
                                                         Actividad = FIELD("Filtro actividad"),
                                                         "Fecha DCL" = FIELD("Filtro fecha")));
            FieldClass = FlowField;
        }
        field(11; "KN aplicados"; Decimal)
        {
            Caption = 'KN aplicados';
            ToolTip = 'Specifies the value of the KN aplicados field.';
            CalcFormula = Sum("DCL Application Lines"."Origin kilos" WHERE("DCL Job no." = FIELD("No. proyecto"),
                                                                            Activity = FIELD("Filtro actividad"),
                                                                            "Document date" = FIELD("Filtro fecha")));
            FieldClass = FlowField;
        }
        field(12; "Kilos netos declarados"; Decimal)
        {
            Caption = 'Kilos netos declarados';
            ToolTip = 'Specifies the value of the Kilos netos declarados field.';
            CalcFormula = Sum("Lín. DCL"."Kilos netos" WHERE("No. proyecto" = FIELD("No. proyecto"),
                                                              Actividad = FIELD("Filtro actividad"),
                                                              "Fecha DCL" = FIELD("Filtro fecha")));
            FieldClass = FlowField;
        }
        field(13; "Dimension Set ID"; Integer)
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
        field(50001; Impresora; Text[250])
        {
            Caption = 'Impresora';
            ToolTip = 'Specifies the value of the Impresora field.';
            TableRelation = Printer;
        }
        field(50002; "Promedio general"; Decimal)
        {
            Caption = 'Promedio general';
            ToolTip = 'Specifies the value of the Promedio general field.';
            CalcFormula = Average("Lín. DCL".Promedio WHERE("No. proyecto" = FIELD("No. proyecto")));
            FieldClass = FlowField;
        }
        field(50003; "Filtro fecha"; Date)
        {
            Caption = 'Date Filter';
            ToolTip = 'Specifies the value of the Date Filter field.';
            FieldClass = FlowFilter;
        }
        field(50004; "Totales DCL"; Decimal)
        {
            Caption = 'Totales DCL';
            ToolTip = 'Specifies the value of the Totales DCL field.';
            CalcFormula = Sum("Lín. DCL"."Kilos netos" WHERE("No. proyecto" = FIELD("No. proyecto"),
                                                              Actividad = FIELD("Filtro actividad"),
                                                              "Fecha DCL" = FIELD("Filtro fecha"),
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
        field(50006; "Filtro cliente"; Code[10])
        {
            Caption = 'Filtro cliente';
            ToolTip = 'Specifies the value of the Filtro cliente field.';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = FILTER(1));
        }
        field(50007; "PT obtenido"; Decimal)
        {
            Caption = 'PT obtenido';
            ToolTip = 'Specifies the value of the PT obtenido field.';
            CalcFormula = Sum("Produccion Planta"."FRE Envasado Salida KG" WHERE("Global Dimension 1" = FIELD(Buque),
                                                                                  "Global Dimension 2" = FIELD(Marea),
                                                                                  "Produccion terminada" = CONST(true)));
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
    begin
        Clear(rstLinInfo);
        rstLinInfo.SetRange(rstLinInfo."No. proyecto", "No. proyecto");
        rstLinInfo.DeleteAll;
    end;

    var
        rstProyecto: Record Job;
        rstLinInfo: Record "Lín. DCL";
        DimMgt: Codeunit DimensionManagement;

    procedure CreateDim()
    var
        DefaultDimSource: List of [Dictionary of [Integer, Code[20]]];
    begin
        DimMgt.AddDimSource(DefaultDimSource, Database::Job, "No. proyecto");
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
        rstCabDCL: Record "Cab. DCL";
    begin
        if IsTemporary() then
            exit;

        if rstCabDCL.Get("No. proyecto") then
            Modify();
    end;

    [Scope('OnPrem')]
    procedure Navegar()
    var
        FormNavegar: Page Navigate;
    begin
        FormNavegar.SetDoc(0D, "No. proyecto");
        FormNavegar.Run;
    end;
}

