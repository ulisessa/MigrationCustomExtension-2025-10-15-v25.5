table 50110 "Cuadro entradas"
{

    fields
    {
        field(1; Buque; Text[10])
        {
            Caption = 'Buque';
            ToolTip = 'Specifies the value of the Buque field.';

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
            Caption = 'Salidas';
            ToolTip = 'Specifies the value of the Salidas field.';
        }
        field(3; "Días de marea"; Integer)
        {
            Caption = 'Días de marea';
            ToolTip = 'Specifies the value of the Días de marea field.';
        }
        field(4; Entrada; Date)
        {
            Caption = 'Entrada';
            ToolTip = 'Specifies the value of the Entrada field.';

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
            Caption = 'Day';
            ToolTip = 'Specifies the value of the Day field.';
        }
        field(6; "Día semana"; Date)
        {
            Caption = 'Día semana';
            ToolTip = 'Specifies the value of the Día semana field.';
        }
        field(7; "Salida prevista"; Date)
        {
            Caption = 'Salida prevista';
            ToolTip = 'Specifies the value of the Salida prevista field.';

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
            Caption = 'Destination';
            ToolTip = 'Specifies the value of the Destination field.';
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
            Caption = 'En puerto';
            ToolTip = 'Specifies the value of the En puerto field.';
        }
        field(10; Marea; Code[6])
        {
            Caption = 'Marea';
            ToolTip = 'Specifies the value of the Marea field.';
        }
        field(11; Ordenamiento; Integer)
        {
            Caption = 'Ordenamiento';
            ToolTip = 'Specifies the value of the Ordenamiento field.';
        }
        field(12; "Kilos capturados"; Decimal)
        {
            Caption = 'Kilos capturados';
            ToolTip = 'Specifies the value of the Kilos capturados field.';
            CalcFormula = Sum("On board capture lines".Kilos WHERE("Cód. proyecto" = FIELD(Proyecto),
                                                                    "Fecha registro" = FIELD("Filtro fecha")));
            FieldClass = FlowField;
        }
        field(13; Estado; Text[50])
        {
            Caption = 'Estado';
            ToolTip = 'Specifies the value of the Estado field.';
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
            Caption = 'Buque/Departamento';
            ToolTip = 'Specifies the value of the Buque/Departamento field.';
        }
        field(15; "Kilos descargados x buque"; Decimal)
        {
            Caption = 'Kilos descargados x buque';
            ToolTip = 'Specifies the value of the Kilos descargados x buque field.';
            CalcFormula = Sum("Lín. descarga"."Net weight" WHERE(Buque = FIELD("Global Dimension 1 Code"),
                                                                  "Fecha remito" = FIELD("Filtro fecha")));
            FieldClass = FlowField;
        }
        field(16; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(17; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(18; "Kilos descargados x actividad"; Decimal)
        {
            Caption = 'Kilos descargados x actividad';
            ToolTip = 'Specifies the value of the Kilos descargados x actividad field.';
            CalcFormula = Sum("Lín. descarga"."Net weight" WHERE(Actividad = FIELD(Actividad),
                                                                  "Fecha remito" = FIELD("Filtro fecha")));
            FieldClass = FlowField;
        }
        field(19; "Actividad"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Actividad';
            ToolTip = 'Specifies the value of the Actividad field.';
        }
        field(100; Proyecto; Code[20])
        {
            Caption = 'Proyecto';
            ToolTip = 'Specifies the value of the Proyecto field.';
            TableRelation = Job."No.";
        }
        field(101; "Confirmación de entrada"; Option)
        {
            Caption = 'Confirmación de entrada';
            ToolTip = 'Specifies the value of the Confirmación de entrada field.';
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
            Caption = 'Date Filter';
            ToolTip = 'Specifies the value of the Date Filter field.';
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

