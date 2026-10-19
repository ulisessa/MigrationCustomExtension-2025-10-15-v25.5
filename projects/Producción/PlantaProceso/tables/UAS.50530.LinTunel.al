table 50530 "Lin. tunel"
{

    fields
    {
        field(1; "Nombre libro diario"; Code[10])
        {
            Caption = 'Nombre libro diario';
            ToolTip = 'Specifies the value of the Nombre libro diario field.';
            TableRelation = "Item Journal Template";
        }
        field(2; "Nombre seccion diario"; Code[10])
        {
            Caption = 'Nombre seccion diario';
            ToolTip = 'Specifies the value of the Nombre seccion diario field.';
            TableRelation = "Item Journal Batch".Name WHERE("Journal Template Name" = FIELD("Nombre libro diario"));
        }
        field(3; "No. documento"; Code[30])
        {
            Caption = 'Document No.';
            ToolTip = 'Specifies the value of the Document No field.';
        }
        field(4; "No. linea"; Integer)
        {
            Caption = 'Line No.';
            ToolTip = 'Specifies the value of the Line No field.';
            NotBlank = true;
        }
        field(5; "No. Tunel"; Integer)
        {
            Caption = 'No. túnel';
            ToolTip = 'Specifies the value of the No. túnel field.';
        }
        field(6; Clasificacion; Code[20])
        {
            Caption = 'Clasificacion';
            ToolTip = 'Specifies the value of the Clasificacion field.';
            TableRelation = Item WHERE(Blocked = CONST(false),
                                        "Item Category Code" = CONST('PESCA'));

            trigger OnValidate()
            begin
                Clear(rstProducto);
                if rstProducto.Get(Clasificacion) then begin

                    Descripcion := rstProducto.Description;
                    "Unidad medida" := rstProducto."Base Unit of Measure";
                    Actividad := rstProducto."Global Dimension 3 Code";
                    Familia := rstProducto.Familia;
                    Subfamilia := rstProducto.Subfamilia;

                end;
            end;
        }
        field(7; Descripcion; Text[100])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';
        }
        field(8; "Unidad medida"; Code[10])
        {
            Caption = 'Unidad medida';
            ToolTip = 'Specifies the value of the Unidad medida field.';
            TableRelation = "Item Unit of Measure".Code WHERE("Item No." = FIELD(Clasificacion));
        }
        field(9; Cantidad; Decimal)
        {
            Caption = 'Quantity';
            ToolTip = 'Specifies the value of the Quantity field.';

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
            Caption = 'Kilos netos';
            ToolTip = 'Specifies the value of the Kilos netos field.';
        }
        field(11; "Kilos brutos"; Decimal)
        {
            Caption = 'Kilos brutos';
            ToolTip = 'Specifies the value of the Kilos brutos field.';
        }
        field(18; Actividad; Code[10])
        {
            Caption = 'Actividad';
            ToolTip = 'Specifies the value of the Actividad field.';
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(19; Familia; Code[10])
        {
            Caption = 'Family';
            ToolTip = 'Specifies the value of the Family field.';
            TableRelation = Family;
        }
        field(20; Subfamilia; Code[10])
        {
            Caption = 'Subfamily';
            ToolTip = 'Specifies the value of the Subfamily field.';
            TableRelation = "Subfamilia producto".Code WHERE("Family code" = FIELD(Familia));
        }
        field(25; Registrado; Boolean)
        {
            Caption = 'Registrado';
            ToolTip = 'Specifies the value of the Registrado field.';
        }
        field(26; Revertido; Boolean)
        {
            Caption = 'Reversed';
            ToolTip = 'Specifies the value of the Reversed field.';
        }
        field(30; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            ToolTip = 'Specifies the value of the Dimension Set ID field.';
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

