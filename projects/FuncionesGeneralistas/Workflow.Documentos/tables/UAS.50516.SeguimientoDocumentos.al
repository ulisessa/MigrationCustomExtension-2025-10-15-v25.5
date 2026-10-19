table 50516 "Seguimiento Documentos"
{

    fields
    {
        field(1; "No. documento"; Code[30])
        {
            Caption = 'Document No.';
            ToolTip = 'Specifies the value of the Document No field.';

            trigger OnLookup()
            begin
                Navegar;
            end;
        }
        field(2; "Tipo Documento"; Text[40])
        {
            Caption = 'Document Type';
            ToolTip = 'Specifies the value of the Document Type field.';
            TableRelation = "Tipos documento";
        }
        field(3; "Line No."; Integer)
        {
            NotBlank = true;
            Caption = 'Line No.';
            ToolTip = 'Specifies the value of the Line No field.';

        }
        field(4; Fecha; Date)
        {
            Caption = 'Fecha';
            ToolTip = 'Specifies the value of the Fecha field.';
        }
        field(5; Hora; Time)
        {
            Caption = 'Time';
            ToolTip = 'Specifies the value of the Time field.';
        }
        field(6; Estado; Text[50])
        {
            Caption = 'Estado';
            ToolTip = 'Specifies the value of the Estado field.';
        }
        field(7; Usuario; Code[50])
        {
            Caption = 'User ID';
            ToolTip = 'Specifies the value of the User ID field.';
            TableRelation = User."User Name";
        }
        field(8; Mensaje; Text[250])
        {
            Caption = 'Mensaje';
            ToolTip = 'Specifies the value of the Mensaje field.';
        }
        field(9; "Global Dimension 1"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(10; "Global Dimension 2"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(11; "Global Dimension 3"; Code[10])
        {
            Caption = 'Global Dimension 3';
            ToolTip = 'Specifies the value of the Global Dimension 3 field.';
            CaptionClass = '1,2,3';


            trigger OnValidate()
            begin
                //ActlzLinsVentas(FIELDNAME("Cód. 3oNivel"));
            end;
        }
        field(12; "Global Dimension 4"; Code[10])
        {
            Caption = 'Global Dimension 4';
            ToolTip = 'Specifies the value of the Global Dimension 4 field.';
            CaptionClass = '1,2,4';

        }
        field(13; "Global Dimension 5"; Code[10])
        {
            Caption = 'Global Dimension 5';
            ToolTip = 'Specifies the value of the Global Dimension 5 field.';
            CaptionClass = '1,2,5';

        }
        field(14; "Global Dimension 6"; Code[10])
        {
            Caption = 'Global Dimension 6';
            ToolTip = 'Specifies the value of the Global Dimension 6 field.';
            CaptionClass = '1,2,6';

        }
        field(15; "Global Dimension 7"; Code[10])
        {
            Caption = 'Global Dimension 7';
            ToolTip = 'Specifies the value of the Global Dimension 7 field.';
            CaptionClass = '1,2,7';

        }
        field(16; "Estado actual"; Text[100])
        {
            Caption = 'Estado actual';
            ToolTip = 'Specifies the value of the Estado actual field.';
            CalcFormula = Lookup(Mensajeria.Estado WHERE("No. documento" = FIELD("No. documento")));
            FieldClass = FlowField;
        }
        field(17; "En ese estado desde"; Date)
        {
            Caption = 'En ese estado desde';
            ToolTip = 'Specifies the value of the En ese estado desde field.';
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

