table 50516 "Seguimiento Documentos"
{

    fields
    {
        field(1; "No. documento"; Code[30])
        {

            trigger OnLookup()
            begin
                Navegar;
            end;
        }
        field(2; "Tipo Documento"; Text[40])
        {
            TableRelation = "Tipos documento";
        }
        field(3; "Line No."; Integer)
        {
            NotBlank = true;
            Caption = 'Line No.';

        }
        field(4; Fecha; Date)
        {
        }
        field(5; Hora; Time)
        {
        }
        field(6; Estado; Text[50])
        {
        }
        field(7; Usuario; Code[50])
        {
            TableRelation = User."User Name";
        }
        field(8; Mensaje; Text[250])
        {
        }
        field(9; "Global Dimension 1"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(10; "Global Dimension 2"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(11; "Global Dimension 3"; Code[10])
        {
            CaptionClass = '1,2,3';


            trigger OnValidate()
            begin
                //ActlzLinsVentas(FIELDNAME("Cód. 3oNivel"));
            end;
        }
        field(12; "Global Dimension 4"; Code[10])
        {
            CaptionClass = '1,2,4';

        }
        field(13; "Global Dimension 5"; Code[10])
        {
            CaptionClass = '1,2,5';

        }
        field(14; "Global Dimension 6"; Code[10])
        {
            CaptionClass = '1,2,6';

        }
        field(15; "Global Dimension 7"; Code[10])
        {
            CaptionClass = '1,2,7';

        }
        field(16; "Estado actual"; Text[100])
        {
            CalcFormula = Lookup(Mensajeria.Estado WHERE("No. documento" = FIELD("No. documento")));
            FieldClass = FlowField;
        }
        field(17; "En ese estado desde"; Date)
        {
            CalcFormula = Max("Seguimiento Documentos".Fecha WHERE("No. documento" = FIELD("No. documento"),
                                                                    "Tipo Documento" = FIELD("Tipo Documento")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "No. documento", "Tipo Documento", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Line No.")
        {
        }
        key(Key3; Usuario, Fecha, "No. documento")
        {
        }
    }

    fieldgroups
    {
    }

    [Scope('OnPrem')]
    procedure Navegar()
    var
        FormNavegar: Page Navigate;
    begin

        FormNavegar.SetDoc(Fecha, "No. documento");
        FormNavegar.Run;
    end;
}

