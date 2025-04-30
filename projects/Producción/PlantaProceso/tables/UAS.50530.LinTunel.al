table 50530 "Lin. tunel"
{

    fields
    {
        field(1; "Nombre libro diario"; Code[10])
        {
            TableRelation = "Item Journal Template";
        }
        field(2; "Nombre seccion diario"; Code[10])
        {
            TableRelation = "Item Journal Batch".Name WHERE("Journal Template Name" = FIELD("Nombre libro diario"));
        }
        field(3; "No. documento"; Code[30])
        {
        }
        field(4; "No. linea"; Integer)
        {
            Caption = 'No. línea';
            NotBlank = true;
        }
        field(5; "No. Tunel"; Integer)
        {
            Caption = 'No. túnel';
        }
        field(6; Clasificacion; Code[20])
        {
            TableRelation = Item WHERE(Blocked = CONST(false),
                                        "Item Category Code" = CONST('PESCA'));

            trigger OnValidate()
            begin
                Clear(rstProducto);
                if rstProducto.Get(Clasificacion) then begin

                    Descripcion := rstProducto.Description;
                    "Unidad medida" := rstProducto."Base Unit of Measure";
                    Actividad := rstProducto."Global Dimension 2 Code";
                    Familia := rstProducto.Familia;
                    Subfamilia := rstProducto.Subfamilia;

                end;
            end;
        }
        field(7; Descripcion; Text[100])
        {
        }
        field(8; "Unidad medida"; Code[10])
        {
            TableRelation = "Item Unit of Measure".Code WHERE("Item No." = FIELD(Clasificacion));
        }
        field(9; Cantidad; Decimal)
        {

            trigger OnValidate()
            begin
                Clear(rstUMxProd);
                rstUMxProd.Get(Clasificacion, "Unidad medida");

                rstProducto.Get(Clasificacion);
                if (rstProducto."Utiliza Tarifario") then begin

                    Validate("Kilos brutos", Round(rstLinDiaProd.FunCalcPesoBruto(Cantidad, Clasificacion, rstUMxProd."Qty. per Unit of Measure"), 1));
                    Validate("Kilos netos", Round(rstLinDiaProd.FunCalcPesoNeto(Cantidad, Clasificacion, rstUMxProd."Qty. per Unit of Measure"), 1));

                end;
            end;
        }
        field(10; "Kilos netos"; Decimal)
        {
        }
        field(11; "Kilos brutos"; Decimal)
        {
        }
        field(18; Actividad; Code[10])
        {
        }
        field(19; Familia; Code[10])
        {
            TableRelation = Family;
        }
        field(20; Subfamilia; Code[10])
        {
            TableRelation = "Subfamilia producto".Code WHERE("Family code" = FIELD(Familia));
        }
        field(25; Registrado; Boolean)
        {
        }
        field(26; Revertido; Boolean)
        {
        }
        field(30; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDimensions;
            end;
        }
    }

    keys
    {
        key(Key1; "Nombre libro diario", "Nombre seccion diario", "No. documento", "No. linea")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        rstProducto: Record Item;
        rstCabecera: Record "Produccion Planta";
        frmListaProd: Page "Item List";
        rstUMxProd: Record "Item Unit of Measure";
        rstLinDiaProd: Record "Item Journal Line";
        rstCabProd: Record "Produccion Planta";
        rstProyecto: Record Job;
        rstDigitalizar: Record "Ruta digitalizacion depto/espe";
        rstConfusu: Record "User Setup";
        rstMovProducto: Record "Item Ledger Entry";
        PunProd: Record Item;
        PunExi: Record "Inventory Setup";
        Producto: Record Item;
        "----ARBUMASA---": Integer;

    [Scope('OnPrem')]
    procedure ShowDimensions()
    var
        DimMgt: Codeunit DimensionManagement;
    begin
        /*"Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID",STRSUBSTNO('%1 %2 %3','Producción',"No. documento","No. línea"));
        VerifyItemLineDim;
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID",Buque,Actividad,
                                           //++Migración Arbumasa 2009
                                           Marea,'','','',''
                                           //--Migración Arbumasa 2009
                                           );
                                           */

    end;

    local procedure VerifyItemLineDim()
    begin
        /*IF ("Dimension Set ID" <> xRec."Dimension Set ID") AND (Type = Type::Item) THEN
          IF ("Qty. Rcd. Not Invoiced" <> 0) OR ("Return Qty. Shipped Not Invd." <> 0) THEN
            IF NOT CONFIRM(Text049,TRUE,TABLECAPTION) THEN
              ERROR(Text050);
              */

    end;
}

