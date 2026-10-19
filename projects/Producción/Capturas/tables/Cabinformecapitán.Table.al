table 50559 "Cab. informe capitán"
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
            begin
                Clear(rstProyecto);
                if rstProyecto.Get("No. proyecto") then begin

                    Capitán := rstProyecto.Patron;
                    Actividad := rstProyecto."Global Dimension 3 Code";
                    Buque := rstProyecto."Global Dimension 1 Code";
                    Marea := rstProyecto."Global Dimension 2 Code";

                end;
            end;
        }
        field(2; "Capitán"; Text[50])
        {
            Caption = 'Capitán';
            ToolTip = 'Specifies the value of the Capitán field.';
        }
        field(3; Actividad; Code[10])
        {
            Caption = 'Actividad';
            ToolTip = 'Specifies the value of the Actividad field.';
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(4; "Fecha de inicio de descarga"; Date)
        {
            Caption = 'Fecha de inicio de descarga';
            ToolTip = 'Specifies the value of the Fecha de inicio de descarga field.';
        }
        field(5; Buque; Code[10])
        {
            Caption = 'Buque';
            ToolTip = 'Specifies the value of the Buque field.';
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(6; Marea; Code[10])
        {
            Caption = 'Marea';
            ToolTip = 'Specifies the value of the Marea field.';
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(10; Cantidad; Decimal)
        {
            Caption = 'Quantity';
            ToolTip = 'Specifies the value of the Quantity field.';
            CalcFormula = Sum("Lín. informe capitán".Cantidad WHERE("No. proyecto" = FIELD("No. proyecto")));
            FieldClass = FlowField;
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
        rstLinInfo: Record "Lín. informe capitán";

    [Scope('OnPrem')]
    procedure Navegar()
    var
        FormNavegar: Page Navigate;
    begin
        FormNavegar.SetDoc(0D, "No. proyecto");
        FormNavegar.Run;
    end;
}

