table 50560 "Lín. informe capitán"
{

    fields
    {
        field(1; "No. proyecto"; Code[20])
        {
            Caption = 'Job No.';
            ToolTip = 'Specifies the value of the Job No field.';
            TableRelation = Job WHERE(Tipo = CONST(Productivo),
                                       Blocked = CONST(" "));
        }
        field(2; "No. línea"; Integer)
        {
            Caption = 'Line No.';
            ToolTip = 'Specifies the value of the Line No field.';
        }
        field(3; "Clasificación"; Code[20])
        {
            Caption = 'Rating';
            ToolTip = 'Specifies the value of the Rating field.';
            TableRelation = Item."No." WHERE(Captura = CONST(true),
                                              Blocked = CONST(false));

            trigger OnValidate()
            begin
                Clear(rstProducto);
                if rstProducto.Get(Clasificación) then begin

                    Descripción := rstProducto.Description;
                    "Unidad medida" := rstProducto."Base Unit of Measure";
                    // Item.Actividad (50511) apunta a la dimensión 2 y es un remanente; la actividad
                    // real es la dimensión 3, igual que en Descargas, DCL y Repartos.
                    Actividad := rstProducto."Global Dimension 3 Code";
                    Familia := rstProducto.Familia;
                    Subfamilia := rstProducto.Subfamilia;

                end;
            end;
        }
        field(4; "Descripción"; Text[150])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';
        }
        field(5; "Unidad medida"; Code[10])
        {
            Caption = 'Unidad medida';
            ToolTip = 'Specifies the value of the Unidad medida field.';
            TableRelation = "Item Unit of Measure".Code WHERE("Item No." = FIELD("Clasificación"));
        }
        field(6; Cantidad; Decimal)
        {
            Caption = 'Quantity';
            ToolTip = 'Specifies the value of the Quantity field.';
        }
        field(50000; Actividad; Code[10])
        {
            Caption = 'Actividad';
            ToolTip = 'Specifies the value of the Actividad field.';
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(50001; Familia; Code[10])
        {
            Caption = 'Family';
            ToolTip = 'Specifies the value of the Family field.';
            TableRelation = Family;
        }
        field(50002; Subfamilia; Code[10])
        {
            Caption = 'Subfamily';
            ToolTip = 'Specifies the value of the Subfamily field.';
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

