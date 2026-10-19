table 50501 "On board capture"
{
    // IBdos Argentina - USS - 111102 - Adición Arbumasa
    // IBdos Argentina - WDL - 251102 - Creacion funcion Buscoproyecto

    DataCaptionFields = Buque, Marea, "Zona de pesca";

    fields
    {
        field(1; Buque; Code[10])
        {
            Caption = 'Buque';
            ToolTip = 'Specifies the value of the Buque field.';
            CaptionClass = '1,2,1';
            NotBlank = true;
            TableRelation = "Dimension Value".Code WHERE("Use code" = CONST(Buque),
                                                          "Global Dimension No." = CONST(1));
        }
        field(2; Marea; Code[10])
        {
            Caption = 'Marea';
            ToolTip = 'Specifies the value of the Marea field.';
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
            NotBlank = true;

            trigger OnValidate()
            begin
                if (Marea <> '') and (StrLen(Marea) <> 6) then
                    repeat

                        Marea := '0' + Marea;

                    until StrLen(Marea) = 6;
            end;
        }
        field(3; "Patrón"; Text[30])
        {
            Caption = 'Patrón';
            ToolTip = 'Specifies the value of the Patrón field.';
        }
        field(4; "Fecha Salida"; Date)
        {
            Caption = 'Fecha Salida';
            ToolTip = 'Specifies the value of the Fecha Salida field.';
        }
        field(5; "Fecha Entrada"; Date)
        {
            Caption = 'Fecha Entrada';
            ToolTip = 'Specifies the value of the Fecha Entrada field.';
        }
        field(6; "Fecha Registro"; Date)
        {
            Caption = 'Fecha Registro';
            ToolTip = 'Specifies the value of the Fecha Registro field.';
            NotBlank = true;
            //This property is currently not supported
            //TestTableRelation = true;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = true;
        }
        field(7; Concepto; Code[10])
        {
            Caption = 'Concepto';
            ToolTip = 'Specifies the value of the Concepto field.';
            TableRelation = "Concepto Días Pesca";
        }
        field(8; "No Semana"; Integer)
        {
            Caption = 'No Semana';
            ToolTip = 'Specifies the value of the No Semana field.';
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(9; "Cód. Proyecto"; Code[20])
        {
            Caption = 'Cód. Proyecto';
            ToolTip = 'Specifies the value of the Cód. Proyecto field.';
            NotBlank = true;
            TableRelation = Job."No." WHERE(Tipo = CONST(Productivo),
                                             Status = CONST(Open));
        }
        field(10; "Histórico"; Date)
        {
            Caption = 'Histórico';
            ToolTip = 'Specifies the value of the Histórico field.';
            CalcFormula = Lookup(Job."Ending Date" WHERE("No." = FIELD("Cód. Proyecto")));
            FieldClass = FlowField;
        }
        field(19; "Zona de pesca"; Option)
        {
            Caption = 'Zona de pesca';
            ToolTip = 'Specifies the value of the Zona de pesca field.';
            BlankZero = true;
            OptionMembers = "No informa","Santa Cruz",Chubut,Nacion;
        }
        field(20; "Latitud - Grados"; Decimal)
        {
            Caption = 'Latitud - Grados';
            ToolTip = 'Specifies the value of the Latitud - Grados field.';
        }
        field(21; "Latitud - Minutos"; Decimal)
        {
            Caption = 'Latitud - Minutos';
            ToolTip = 'Specifies the value of the Latitud - Minutos field.';
        }
        field(22; "Latitud - Segundos"; Decimal)
        {
            Caption = 'Latitud - Segundos';
            ToolTip = 'Specifies the value of the Latitud - Segundos field.';
        }
        field(23; "Longitud - Grados"; Decimal)
        {
            Caption = 'Longitud - Grados';
            ToolTip = 'Specifies the value of the Longitud - Grados field.';
        }
        field(24; "Longitud - Minutos"; Decimal)
        {
            Caption = 'Longitud - Minutos';
            ToolTip = 'Specifies the value of the Longitud - Minutos field.';
        }
        field(25; "Longitud - Segundos"; Decimal)
        {
            Caption = 'Longitud - Segundos';
            ToolTip = 'Specifies the value of the Longitud - Segundos field.';
        }
        field(50000; "Cantidad total"; Decimal)
        {
            Caption = 'Cantidad total';
            ToolTip = 'Specifies the value of the Cantidad total field.';
            CalcFormula = Sum("On board capture lines".Cantidad WHERE("Cód. proyecto" = FIELD("Cód. Proyecto")));
            FieldClass = FlowField;
        }
        field(50001; "Fecha envío"; Date)
        {
            Caption = 'Fecha envío';
            ToolTip = 'Specifies the value of the Fecha envío field.';
        }
        field(50002; "Fecha creación"; Date)
        {
            Caption = 'Creation Date';
            ToolTip = 'Specifies the value of the Creation Date field.';
        }
    }

    keys
    {
        key(Key1; "Cód. Proyecto")
        {
            Clustered = true;
        }
        key(Key2; Buque, "No Semana")
        {
        }
        key(Key3; "Fecha Registro")
        {
        }
        key(Key4; "Fecha Salida")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        Clear(rstLinDiarioAbordo);
        rstLinDiarioAbordo.SetRange(rstLinDiarioAbordo."Cód. proyecto", "Cód. Proyecto");
        rstLinDiarioAbordo.DeleteAll;
    end;

    trigger OnInsert()
    begin
        Clear(rstProyecto);
        rstProyecto.Get("Cód. Proyecto");
        Patrón := rstProyecto.Patron;
        "Fecha creación" := WorkDate;
        "Fecha Salida" := rstProyecto."Starting Date";
        "Fecha Entrada" := rstProyecto."Ending Date";
    end;

    trigger OnRename()
    begin
        //ERROR('No se puede renombrar registros en esta tabla');
    end;

    var
        varcodproy1: Code[20];
        varcodproy2: Code[20];
        proyecto: Record Job;
        rstFecha: Record Date;
        rstLinDiarioAbordo: Record "On board capture lines";
        rstProyecto: Record Job;
}

