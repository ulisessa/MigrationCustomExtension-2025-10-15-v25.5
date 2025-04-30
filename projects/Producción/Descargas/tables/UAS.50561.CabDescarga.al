table 50561 "Cab. descarga"
{

    fields
    {
        field(1; "No. proyecto"; Code[20])
        {
            NotBlank = true;
            TableRelation = Job WHERE(Blocked = CONST(" "),
                                       Tipo = CONST(Productivo));

            trigger OnValidate()
            begin
                Clear(rstProyecto);
                if rstProyecto.Get("No. proyecto") then begin

                    rstProyecto.TestField("Global Dimension 1 Code");
                    rstProyecto.TestField("Global Dimension 3 Code");
                    Capitán := rstProyecto.Patron;
                    Actividad := rstProyecto."Global Dimension 2 Code";
                    Buque := rstProyecto."Global Dimension 1 Code";
                    Marea := rstProyecto."Global Dimension 3 Code";

                end;
            end;
        }
        field(2; "Capitán"; Text[50])
        {
        }
        field(3; Actividad; Code[10])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(4; "Fecha de inicio de descarga"; Date)
        {
        }
        field(5; Buque; Code[10])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(6; Marea; Code[10])
        {
            CaptionClass = '1,1,3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(7; Location; Code[20])
        {
            Caption = 'Cámara';
            TableRelation = Location;
        }
        field(8; "Libro Diario"; Code[10])
        {
        }
        field(9; Puerto; Code[10])
        {
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
            CalcFormula = Sum("Lín. informe capitán".Cantidad WHERE("No. proyecto" = FIELD("No. proyecto"),
                                                                     Actividad = FIELD("Filtro actividad")));
            FieldClass = FlowField;
        }
        field(11; "Pallets desde"; Integer)
        {
        }
        field(12; "Pallets hasta"; Integer)
        {
        }
        field(13; "Cantidad x descarga"; Decimal)
        {
            CalcFormula = Sum("Lín. descarga".Cantidad WHERE("No. proyecto" = FIELD("No. proyecto"),
                                                              "Fecha remito" = FIELD("Filtro fecha")));
            FieldClass = FlowField;
        }
        field(14; "Hora inicio descarga"; Time)
        {
        }
        field(15; "Hora fin descarga"; Time)
        {
        }
        field(16; "Scale code"; Code[10])
        {
            Caption = 'Cód. balanza';
            DataClassification = ToBeClassified;
            TableRelation = "Weighing Scale Parameters"."Scale code";
        }
        field(50000; Registrado; Boolean)
        {
        }
        field(50001; "Filtro fecha"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(50002; "Origen del cartón"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Nacional,Importado;
        }
        field(50003; "KN linea descarga"; Decimal)
        {
            CalcFormula = Sum("Lín. descarga"."Net weight" WHERE("No. proyecto" = FIELD("No. proyecto"),
                                                                  Actividad = FIELD("Filtro actividad"),
                                                                  "Fecha remito" = FIELD("Filtro fecha")));
            FieldClass = FlowField;
        }
        field(50004; "Totales DCL"; Decimal)
        {
            CalcFormula = Sum("Lín. DCL"."Kilos netos" WHERE("No. proyecto" = FIELD("No. proyecto"),
                                                              Actividad = FIELD("Filtro actividad"),
                                                              "Fecha DCL" = FIELD("Filtro fecha"),
                                                              Cantidad = FILTER(> 0),
                                                              Registrado = CONST(true)));
            FieldClass = FlowField;
        }
        field(50005; "Filtro actividad"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = FILTER(2));
        }
        field(50006; "Totales aplicados a DCL"; Decimal)
        {
            CalcFormula = Sum("DCL Application Lines"."Net kilos" WHERE("DCL Job no." = FIELD("No. proyecto"),
                                                                         "Document date" = FIELD("Filtro fecha"),
                                                                         Activity = FIELD("Filtro actividad")));
            FieldClass = FlowField;
        }
        field(50007; "Totales descontados DCL"; Decimal)
        {
            CalcFormula = Sum("Lín. DCL"."Kilos netos" WHERE("No. proyecto" = FIELD("No. proyecto"),
                                                              Actividad = FIELD("Filtro actividad"),
                                                              "Fecha DCL" = FIELD("Filtro fecha"),
                                                              "Kilos netos" = FILTER(< 0)));
            FieldClass = FlowField;
        }
        field(50008; "KN diario descarga"; Decimal)
        {
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
                rstLDescargaNew.Marea := rstProyecto."Global Dimension 3 Code";
                rstLDescargaNew.Modify;

            until rstLDescarga.Next = 0;
    end;

    var
        rstProyecto: Record Job;
        rstLinDescarga: Record "Lín. descarga";
        rstSeccDiaProd: Record "Item Journal Batch";
        rstConfEx: Record "Inventory Setup";
        frmSecDiaProd: Page "Item Journal Batches";

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

