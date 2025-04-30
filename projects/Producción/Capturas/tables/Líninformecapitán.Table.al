table 50560 "Lín. informe capitán"
{

    fields
    {
        field(1; "No. proyecto"; Code[20])
        {
            TableRelation = Job WHERE(Tipo = CONST(Productivo),
                                       Blocked = CONST(" "));
        }
        field(2; "No. línea"; Integer)
        {
        }
        field(3; "Clasificación"; Code[20])
        {
            TableRelation = Item."No." WHERE(Captura = CONST(true),
                                              Blocked = CONST(false));

            trigger OnValidate()
            begin
                Clear(rstProducto);
                if rstProducto.Get(Clasificación) then begin

                    Descripción := rstProducto.Description;
                    "Unidad medida" := rstProducto."Base Unit of Measure";
                    Actividad := rstProducto.Actividad;
                    Familia := rstProducto.Familia;
                    Subfamilia := rstProducto.Subfamilia;

                end;
            end;
        }
        field(4; "Descripción"; Text[150])
        {
        }
        field(5; "Unidad medida"; Code[10])
        {
            TableRelation = "Item Unit of Measure".Code WHERE("Item No." = FIELD("Clasificación"));
        }
        field(6; Cantidad; Decimal)
        {
        }
        field(50000; Actividad; Code[10])
        {
        }
        field(50001; Familia; Code[10])
        {
            TableRelation = Family;
        }
        field(50002; Subfamilia; Code[10])
        {
            TableRelation = "Subfamilia producto".Code WHERE("Family code" = FIELD(Familia));
        }
    }

    keys
    {
        key(Key1; "No. proyecto", "No. línea")
        {
            Clustered = true;
            SumIndexFields = Cantidad;
        }
        key(Key2; "No. proyecto", "Clasificación")
        {
            SumIndexFields = Cantidad;
        }
        key(Key3; "No. proyecto", Subfamilia)
        {
            SumIndexFields = Cantidad;
        }
    }

    fieldgroups
    {
    }

    var
        rstProducto: Record Item;
        rstCabecera: Record "Cab. informe capitán";
        frmListaProd: Page "Item List";
}

