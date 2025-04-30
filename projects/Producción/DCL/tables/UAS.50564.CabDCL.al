table 50564 "Cab. DCL"
{

    fields
    {
        field(1; "No. proyecto"; Code[20])
        {
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
                    Buque := rstProyecto."Global Dimension 1 Code";
                    Actividad := rstProyecto."Global Dimension 2 Code";
                    "Fecha de inicio de descarga" := rstDescarga."Fecha de inicio de descarga";
                    Marea := rstProyecto."Global Dimension 3 Code";
                    "Fecha y hora desembarque" := CreateDateTime(rstProyecto."Ending Date", rstProyecto."Hora ingreso a puerto");
                    "Fecha y hora zarpada" := CreateDateTime(rstProyecto."Starting Date", rstProyecto."Hora de zarpada");

                end;
            end;
        }
        field(2; Buque; Code[10])
        {
        }
        field(3; Actividad; Code[10])
        {
        }
        field(4; Marea; Code[10])
        {
        }
        field(5; "Fecha de inicio de descarga"; Date)
        {

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
            DataClassification = ToBeClassified;
        }
        field(7; "Fecha y hora desembarque"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "No. DCL"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Cantidad; Decimal)
        {
            CalcFormula = Sum("Lín. DCL".Cantidad WHERE("No. proyecto" = FIELD("No. proyecto"),
                                                         Actividad = FIELD("Filtro actividad"),
                                                         "Fecha DCL" = FIELD("Filtro fecha")));
            FieldClass = FlowField;
        }
        field(11; "KN aplicados"; Decimal)
        {
            CalcFormula = Sum("DCL Application Lines"."Origin kilos" WHERE("DCL Job no." = FIELD("No. proyecto"),
                                                                            Activity = FIELD("Filtro actividad"),
                                                                            "Document date" = FIELD("Filtro fecha")));
            FieldClass = FlowField;
        }
        field(12; "Kilos netos declarados"; Decimal)
        {
            CalcFormula = Sum("Lín. DCL"."Kilos netos" WHERE("No. proyecto" = FIELD("No. proyecto"),
                                                              Actividad = FIELD("Filtro actividad"),
                                                              "Fecha DCL" = FIELD("Filtro fecha")));
            FieldClass = FlowField;
        }
        field(50000; Registrado; Boolean)
        {
        }
        field(50001; Impresora; Text[250])
        {
            TableRelation = Printer;
        }
        field(50002; "Promedio general"; Decimal)
        {
            CalcFormula = Average("Lín. DCL".Promedio WHERE("No. proyecto" = FIELD("No. proyecto")));
            FieldClass = FlowField;
        }
        field(50003; "Filtro fecha"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(50004; "Totales DCL"; Decimal)
        {
            CalcFormula = Sum("Lín. DCL"."Kilos netos" WHERE("No. proyecto" = FIELD("No. proyecto"),
                                                              Actividad = FIELD("Filtro actividad"),
                                                              "Fecha DCL" = FIELD("Filtro fecha"),
                                                              Registrado = CONST(true)));
            FieldClass = FlowField;
        }
        field(50005; "Filtro actividad"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = FILTER(2));
        }
        field(50006; "Filtro cliente"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = FILTER(1));
        }
        field(50007; "PT obtenido"; Decimal)
        {
            CalcFormula = Sum("Produccion Planta"."FRE Envasado Salida KG" WHERE("Global Dimension 1" = FIELD(Buque),
                                                                                  "Global Dimension 3" = FIELD(Marea),
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
        key(Key2;"Fecha de inicio de descarga")
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

    [Scope('OnPrem')]
    procedure Navegar()
    var
        FormNavegar: Page Navigate;
    begin
        FormNavegar.SetDoc(0D, "No. proyecto");
        FormNavegar.Run;
    end;
}

