table 50501 "On board capture"
{
    // IBdos Argentina - USS - 111102 - Adición Arbumasa
    // IBdos Argentina - WDL - 251102 - Creacion funcion Buscoproyecto

    DataCaptionFields = Buque, Marea, "Zona de pesca";

    fields
    {
        field(1; Buque; Code[10])
        {
            NotBlank = true;
            TableRelation = "Dimension Value".Code WHERE("Use code" = CONST(Buque),
                                                          "Global Dimension No." = CONST(1));
        }
        field(2; Marea; Code[10])
        {
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
        }
        field(4; "Fecha Salida"; Date)
        {
        }
        field(5; "Fecha Entrada"; Date)
        {
        }
        field(6; "Fecha Registro"; Date)
        {
            NotBlank = true;
            //This property is currently not supported
            //TestTableRelation = true;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = true;
        }
        field(7; Concepto; Code[10])
        {
            TableRelation = "Concepto Días Pesca";
        }
        field(8; "No Semana"; Integer)
        {
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(9; "Cód. Proyecto"; Code[20])
        {
            NotBlank = true;
            TableRelation = Job."No." WHERE(Tipo = CONST(Productivo),
                                             Status = CONST(Open));
        }
        field(10; "Histórico"; Date)
        {
            CalcFormula = Lookup(Job."Ending Date" WHERE("No." = FIELD("Cód. Proyecto")));
            FieldClass = FlowField;
        }
        field(19; "Zona de pesca"; Option)
        {
            BlankZero = true;
            OptionMembers = "No informa","Santa Cruz",Chubut,Nacion;
        }
        field(20; "Latitud - Grados"; Decimal)
        {
        }
        field(21; "Latitud - Minutos"; Decimal)
        {
        }
        field(22; "Latitud - Segundos"; Decimal)
        {
        }
        field(23; "Longitud - Grados"; Decimal)
        {
        }
        field(24; "Longitud - Minutos"; Decimal)
        {
        }
        field(25; "Longitud - Segundos"; Decimal)
        {
        }
        field(50000; "Cantidad total"; Decimal)
        {
            CalcFormula = Sum("On board capture lines".Cantidad WHERE("Cód. proyecto" = FIELD("Cód. Proyecto")));
            FieldClass = FlowField;
        }
        field(50001; "Fecha envío"; Date)
        {
        }
        field(50002; "Fecha creación"; Date)
        {
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

