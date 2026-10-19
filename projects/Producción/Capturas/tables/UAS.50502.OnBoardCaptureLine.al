table 50502 "On board capture lines"
{
    // IBdos Argentina - USS - 111102 - Adición Arbumasa
    // 
    // IBdos Argentina - USS - 111202 - Eliminación campos Fecha Desde y Fecha Hasta


    fields
    {
        field(1; "Fecha registro"; Date)
        {
            Caption = 'Fecha registro';
            ToolTip = 'Specifies the value of the Fecha registro field.';
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
            Caption = 'Buque';
            ToolTip = 'Specifies the value of the Buque field.';
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(5; Marea; Code[10])
        {
            Caption = 'Marea';
            ToolTip = 'Specifies the value of the Marea field.';
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

        }
        field(6; "Fecha salida"; Date)
        {
            Caption = 'Fecha salida';
            ToolTip = 'Specifies the value of the Fecha salida field.';
        }
        field(7; "No."; Code[20])
        {
            Caption = 'No.';
            ToolTip = 'Specifies the value of the No field.';
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
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';
        }
        field(9; "Ud. Medida"; Code[10])
        {
            Caption = 'Ud. Medida';
            ToolTip = 'Specifies the value of the Ud. Medida field.';
            Editable = false;

            trigger OnValidate()
            begin
                Validate(Cantidad);
            end;
        }
        field(10; Cantidad; Decimal)
        {
            Caption = 'Quantity';
            ToolTip = 'Specifies the value of the Quantity field.';

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
            Caption = 'Line No.';
            ToolTip = 'Specifies the value of the Line No field.';
        }
        field(14; "No. Semana"; Integer)
        {
            Caption = 'No. Semana';
            ToolTip = 'Specifies the value of the No. Semana field.';
        }
        field(15; "Histórico"; Date)
        {
            Caption = 'Histórico';
            ToolTip = 'Specifies the value of the Histórico field.';
            CalcFormula = Lookup(Job."Ending Date" WHERE("No." = FIELD("Cód. proyecto")));
            FieldClass = FlowField;
        }
        field(16; "Cód. proyecto"; Code[20])
        {
            Caption = 'Cód. proyecto';
            ToolTip = 'Specifies the value of the Cód. proyecto field.';
            TableRelation = Job;
        }
        field(17; Concepto; Code[10])
        {
            Caption = 'Concepto';
            ToolTip = 'Specifies the value of the Concepto field.';
            TableRelation = "Concepto Días Pesca";
        }
        field(18; Kilos; Decimal)
        {
            Caption = 'Kilos';
            ToolTip = 'Specifies the value of the Kilos field.';
        }
        field(19; "Zona de pesca"; Option)
        {
            Caption = 'Zona de pesca';
            ToolTip = 'Specifies the value of the Zona de pesca field.';
            BlankZero = true;
            InitValue = Nacion;
            OptionCaption = 'No informa,Santa Cruz,Chubut,Nacion';
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
        field(26; "Fecha llegada"; Date)
        {
            Caption = 'Fecha llegada';
            ToolTip = 'Specifies the value of the Fecha llegada field.';
        }
        field(50000; "Cantidad calculada"; Decimal)
        {
            Caption = 'Cantidad calculada';
            ToolTip = 'Specifies the value of the Cantidad calculada field.';
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
            Caption = 'Filtro buque';
            ToolTip = 'Specifies the value of the Filtro buque field.';
            FieldClass = FlowFilter;
        }
        field(50002; "Filtro marea"; Code[10])
        {
            Caption = 'Filtro marea';
            ToolTip = 'Specifies the value of the Filtro marea field.';
            FieldClass = FlowFilter;
        }
        field(50003; "Filtro producto"; Code[20])
        {
            Caption = 'Filtro producto';
            ToolTip = 'Specifies the value of the Filtro producto field.';
            FieldClass = FlowFilter;
        }
        field(50004; "Fitro fecha registro"; Date)
        {
            Caption = 'Fitro fecha registro';
            ToolTip = 'Specifies the value of the Fitro fecha registro field.';
            FieldClass = FlowFilter;
        }
        field(50005; "Filtro proyecto"; Code[20])
        {
            Caption = 'Filtro proyecto';
            ToolTip = 'Specifies the value of the Filtro proyecto field.';
            FieldClass = FlowFilter;
        }
        field(50006; "Filtro semana"; Integer)
        {
            Caption = 'Filtro semana';
            ToolTip = 'Specifies the value of the Filtro semana field.';
            FieldClass = FlowFilter;
        }
        field(50007; Actividad; Code[20])
        {
            Caption = 'Actividad';
            ToolTip = 'Specifies the value of the Actividad field.';
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(50010; "Kilos calculados"; Decimal)
        {
            Caption = 'Kilos calculados';
            ToolTip = 'Specifies the value of the Kilos calculados field.';
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
            Caption = 'Filtro zona pesca';
            ToolTip = 'Specifies the value of the Filtro zona pesca field.';
            FieldClass = FlowFilter;
            OptionMembers = "No informa","Santa Cruz",Chubut,Nacion;
        }
        field(50012; "Descripción Unidad Medida"; Text[50])
        {
            Caption = 'Descripción Unidad Medida';
            ToolTip = 'Specifies the value of the Descripción Unidad Medida field.';
            CalcFormula = Lookup("Unit of Measure".Description WHERE(Code = FIELD("Ud. Medida")));
            FieldClass = FlowField;
        }
        field(50999; Enviado; Boolean)
        {
            Caption = 'Enviado';
            ToolTip = 'Specifies the value of the Enviado field.';
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
        Marea := rstProyecto."Global Dimension 2 Code";
        Actividad := rstProyecto."Global Dimension 3 Code";
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
        Marea := rstProyecto."Global Dimension 2 Code";
        Actividad := rstProyecto."Global Dimension 3 Code";
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

