table 50110 "Cuadro entradas"
{

    fields
    {
        field(1; Buque; Text[10])
        {

            trigger OnLookup()
            begin
                Clear(rstProyecto);
                rstProyecto.SetRange(rstProyecto."No.", Proyecto);
                Clear(frmProyecto);
                frmProyecto.SetTableView(rstProyecto);
                frmProyecto.RunModal;
            end;
        }
        field(2; Salidas; Date)
        {
        }
        field(3; "Días de marea"; Integer)
        {
        }
        field(4; Entrada; Date)
        {

            trigger OnValidate()
            begin
                Clear(rstProyecto);
                rstProyecto.Get(Proyecto);
                rstProyecto.Validate("Fecha llegada prevista", Entrada);
                rstProyecto.Modify;
            end;
        }
        field(5; "Día"; Integer)
        {
        }
        field(6; "Día semana"; Date)
        {
        }
        field(7; "Salida prevista"; Date)
        {

            trigger OnValidate()
            begin
                Clear(rstProyecto);
                rstProyecto.Get(Proyecto);
                rstProyecto.Validate("Salida Prevista Marea pos", "Salida prevista");
                rstProyecto.Modify;
            end;
        }
        field(8; Destino; Code[10])
        {
            TableRelation = "Entry/Exit Point";

            trigger OnValidate()
            begin
                Clear(rstProyecto);
                rstProyecto.Get(Proyecto);
                rstProyecto.Validate(rstProyecto."Puerto Descarga", Destino);
                rstProyecto.Modify;
            end;
        }
        field(9; "En puerto"; Boolean)
        {
        }
        field(10; Marea; Code[6])
        {
        }
        field(11; Ordenamiento; Integer)
        {
        }
        field(12; "Kilos capturados"; Decimal)
        {
            CalcFormula = Sum("On board capture lines".Kilos WHERE("Cód. proyecto" = FIELD(Proyecto),
                                                                    "Fecha registro" = FIELD("Filtro fecha")));
            FieldClass = FlowField;
        }
        field(13; Estado; Text[50])
        {
            TableRelation = Estados.Estados;

            trigger OnValidate()
            begin
                Clear(rstBuque);
                rstBuque.Get(CopyStr(Proyecto, 4, 3));
                rstBuque.Validate(Estado, Estado);
                rstBuque.Modify;
            end;
        }
        field(14; "Buque/Departamento"; Code[10])
        {
        }
        field(15; "Kilos descargados x buque"; Decimal)
        {
            CalcFormula = Sum("Lín. descarga"."Net weight" WHERE(Buque = FIELD("Global Dimension 1 Code"),
                                                                  "Fecha remito" = FIELD("Filtro fecha")));
            FieldClass = FlowField;
        }
        field(16; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(17; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(18; "Kilos descargados x actividad"; Decimal)
        {
            CalcFormula = Sum("Lín. descarga"."Net weight" WHERE(Actividad = FIELD("Global Dimension 2 Code"),
                                                                  "Fecha remito" = FIELD("Filtro fecha")));
            FieldClass = FlowField;
        }
        field(100; Proyecto; Code[20])
        {
            TableRelation = Job."No.";
        }
        field(101; "Confirmación de entrada"; Option)
        {
            OptionMembers = Pendiente,"Sí";

            trigger OnValidate()
            begin
                Clear(rstProyecto);
                rstProyecto.Get(Proyecto);
                rstProyecto.Validate("Confirmación entrada", "Confirmación de entrada");
                rstProyecto.Modify;
            end;
        }
        field(103; "Filtro fecha"; Date)
        {
            FieldClass = FlowFilter;
        }
    }

    keys
    {
        key(Key1; Buque)
        {
            Clustered = true;
        }
        key(Key2; Salidas)
        {
        }
        key(Key3; "En puerto", Entrada)
        {
        }
        key(Key4; "Días de marea")
        {
        }
        key(Key5; Proyecto)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnModify()
    begin
        rstInfoEmpresa.Reset;
        rstInfoEmpresa.Get();

        //Agrego todos los destinatarios seleccionados

        Clear(rstConfUsu);
        codMensaje := cduCodeSerie.GetNextNo(rstInfoEmpresa."No. serie mensajería", Today, true);
        if rstConfUsu.Find('-') then
            repeat


            until rstConfUsu.Next = 0;
    end;

    var
        rstProyecto: Record Job;
        rstConfUsu: Record "User Setup";
        rstMensajeria: Record Mensajeria;
        rstRelacionDocumentos: Record "Seguimiento por grupo";
        rstInfoEmpresa: Record "Company Information";
        cduCodeSerie: Codeunit "No. Series";
        codMensaje: Code[20];
        rstBuque: Record Dimension;
        frmProyecto: Page "Job Card";
}

