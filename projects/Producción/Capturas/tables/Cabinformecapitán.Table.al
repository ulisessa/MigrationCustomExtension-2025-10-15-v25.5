table 50559 "Cab. informe capitán"
{

    fields
    {
        field(1; "No. proyecto"; Code[20])
        {
            NotBlank = true;
            TableRelation = Job;

            trigger OnValidate()
            begin
                Clear(rstProyecto);
                if rstProyecto.Get("No. proyecto") then begin

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
        }
        field(4; "Fecha de inicio de descarga"; Date)
        {
        }
        field(5; Buque; Code[10])
        {
        }
        field(6; Marea; Code[10])
        {
        }
        field(10; Cantidad; Decimal)
        {
            CalcFormula = Sum("Lín. informe capitán".Cantidad WHERE("No. proyecto" = FIELD("No. proyecto")));
            FieldClass = FlowField;
        }
        field(50000; Registrado; Boolean)
        {
        }
        field(50001; Impresora; Text[250])
        {
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

