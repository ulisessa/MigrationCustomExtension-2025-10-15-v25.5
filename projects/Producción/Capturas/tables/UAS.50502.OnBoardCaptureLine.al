table 50502 "On board capture lines"
{
    // IBdos Argentina - USS - 111102 - Adición Arbumasa
    // 
    // IBdos Argentina - USS - 111202 - Eliminación campos Fecha Desde y Fecha Hasta


    fields
    {
        field(1; "Fecha registro"; Date)
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                "No. Semana" := Date2DWY("Fecha registro", 2);
                /*
                IF NOT INSERT THEN
                  MODIFY(TRUE);
                 */

            end;
        }
        field(4; Buque; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(5; Marea; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(6; "Fecha salida"; Date)
        {
        }
        field(7; "No."; Code[20])
        {
            TableRelation = Item."No." WHERE(Blocked = FILTER(false),
                                              "Unidad medida Diario Abordo" = FILTER(<> ''),
                                              "Tipo producto" = CONST(Pesca),
                                              Captura = CONST(true));

            trigger OnValidate()
            begin
                Clear(PunProd);
                if PunProd.Get("No.") then;
                Descripción := PunProd."Texto Exportaciones";
                Validate("Ud. Medida", PunProd."Unidad medida Diario Abordo");
            end;
        }
        field(8; "Descripción"; Text[199])
        {
        }
        field(9; "Ud. Medida"; Code[10])
        {
            Editable = false;

            trigger OnValidate()
            begin
                Validate(Cantidad);
            end;
        }
        field(10; Cantidad; Decimal)
        {

            trigger OnValidate()
            begin
                Clear(rstUMP);
                Clear(PunProd);
                PunProd.Get("No.");
                rstUMP.Get("No.", PunProd."Unidad medida Diario Abordo");
                Kilos := Cantidad * rstUMP."Qty. per Unit of Measure";
            end;
        }
        field(13; "No. Línea"; Integer)
        {
        }
        field(14; "No. Semana"; Integer)
        {
        }
        field(15; "Histórico"; Date)
        {
            CalcFormula = Lookup(Job."Ending Date" WHERE("No." = FIELD("Cód. proyecto")));
            FieldClass = FlowField;
        }
        field(16; "Cód. proyecto"; Code[20])
        {
            TableRelation = Job;
        }
        field(17; Concepto; Code[10])
        {
            TableRelation = "Concepto Días Pesca";
        }
        field(18; Kilos; Decimal)
        {
        }
        field(19; "Zona de pesca"; Option)
        {
            BlankZero = true;
            InitValue = Nacion;
            OptionCaption = 'No informa,Santa Cruz,Chubut,Nacion';
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
        field(26; "Fecha llegada"; Date)
        {
        }
        field(50000; "Cantidad calculada"; Decimal)
        {
            CalcFormula = Sum("On board capture lines".Cantidad WHERE(Buque = FIELD("Filtro buque"),
                                                                       Marea = FIELD("Filtro marea"),
                                                                       "No." = FIELD("Filtro producto"),
                                                                       "Fecha registro" = FIELD("Fitro fecha registro"),
                                                                       "Cód. proyecto" = FIELD("Filtro proyecto"),
                                                                       "No. Semana" = FIELD("Filtro semana"),
                                                                       "Zona de pesca" = FIELD("Filtro zona pesca")));
            FieldClass = FlowField;
        }
        field(50001; "Filtro buque"; Code[10])
        {
            FieldClass = FlowFilter;
        }
        field(50002; "Filtro marea"; Code[10])
        {
            FieldClass = FlowFilter;
        }
        field(50003; "Filtro producto"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(50004; "Fitro fecha registro"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(50005; "Filtro proyecto"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(50006; "Filtro semana"; Integer)
        {
            FieldClass = FlowFilter;
        }
        field(50007; Actividad; Code[20])
        {
        }
        field(50010; "Kilos calculados"; Decimal)
        {
            CalcFormula = Sum("On board capture lines".Kilos WHERE(Buque = FIELD("Filtro buque"),
                                                                    Marea = FIELD("Filtro marea"),
                                                                    "No." = FIELD("Filtro producto"),
                                                                    "Fecha registro" = FIELD("Fitro fecha registro"),
                                                                    "Cód. proyecto" = FIELD("Filtro proyecto"),
                                                                    "No. Semana" = FIELD("Filtro semana"),
                                                                    "Zona de pesca" = FIELD("Filtro zona pesca")));
            FieldClass = FlowField;
        }
        field(50011; "Filtro zona pesca"; Option)
        {
            FieldClass = FlowFilter;
            OptionMembers = "No informa","Santa Cruz",Chubut,Nacion;
        }
        field(50012; "Descripción Unidad Medida"; Text[50])
        {
            CalcFormula = Lookup("Unit of Measure".Description WHERE(Code = FIELD("Ud. Medida")));
            FieldClass = FlowField;
        }
        field(50999; Enviado; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Cód. proyecto", "No. línea")
        {
            Clustered = true;
        }
        key(Key2; Buque, Marea, "Fecha registro", "Cód. proyecto", "No. Semana", "No. línea")
        {
        }
        key(Key3; "No. Semana", "No.", "Fecha registro")
        {
            SumIndexFields = Cantidad, Kilos;
        }
        key(Key4; "No.", Buque, Marea)
        {
            SumIndexFields = Cantidad, Kilos;
        }
        key(Key5; Buque, Marea, "No.")
        {
        }
        key(Key6; Buque, Marea, "Fecha registro", "No. línea")
        {
        }
        key(Key7; "No. Semana", Buque, Marea)
        {
        }
        key(Key8; Buque, Marea, "Fecha registro", "No.", "Cód. proyecto", "No. Semana", "No. línea", "Zona de pesca")
        {
            SumIndexFields = Cantidad, Kilos;
        }
        key(Key9; "No. Semana", "Fecha registro")
        {
            SumIndexFields = Cantidad, Kilos;
        }
        key(Key10; "Fecha registro")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        Clear(PunCab);
        PunCab.SetRange("Cód. Proyecto", "Cód. proyecto");
        if PunCab.FindFirst then begin

            "Latitud - Grados" := PunCab."Latitud - Grados";
            "Latitud - Minutos" := PunCab."Latitud - Minutos";
            "Latitud - Segundos" := PunCab."Latitud - Segundos";
            "Longitud - Grados" := PunCab."Longitud - Grados";
            "Longitud - Minutos" := PunCab."Longitud - Minutos";
            "Longitud - Segundos" := PunCab."Longitud - Segundos";

        end;

        Clear(rstProyecto);
        rstProyecto.Get("Cód. proyecto");
        Buque := rstProyecto."Global Dimension 1 Code";
        Marea := rstProyecto."Global Dimension 3 Code";
        Actividad := rstProyecto."Global Dimension 2 Code";
        if "Fecha registro" = 0D then
            "Fecha registro" := WorkDate;
    end;

    trigger OnModify()
    begin
        if Enviado then begin

            if xRec."Fecha registro" < "Fecha registro" then begin

                Clear(rstLineas);
                rstLineas.SetRange("Cód. proyecto", "Cód. proyecto");
                rstLineas.SetFilter("Fecha registro", '>=%1', xRec."Fecha registro");
                rstLineas.ModifyAll(Enviado, false);

            end
            else begin

                Clear(rstLineas);
                rstLineas.SetRange("Cód. proyecto", "Cód. proyecto");
                rstLineas.SetFilter("Fecha registro", '>=%1', "Fecha registro");
                rstLineas.ModifyAll(Enviado, false);

            end;

        end;

        /*Enviado := FALSE;
        MODIFY;
         */

    end;

    trigger OnRename()
    begin
        Clear(rstProyecto);
        rstProyecto.Get("Cód. proyecto");
        Buque := rstProyecto."Global Dimension 1 Code";
        Marea := rstProyecto."Global Dimension 3 Code";
        Actividad := rstProyecto."Global Dimension 2 Code";
    end;

    var
        PunProd: Record Item;
        PunCab: Record "On board capture";
        rstUMP: Record "Item Unit of Measure";
        rstLineas: Record "On board capture lines";
        rstProyecto: Record Job;
        rstProdCap: Record Item;
        frmProducto: Page "Item List";
}

