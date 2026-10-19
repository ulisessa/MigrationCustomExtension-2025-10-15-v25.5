table 50115 "Distribucion lotes planta"
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
        field(4; "No. línea"; Integer)
        {
            Caption = 'Line No.';
            ToolTip = 'Specifies the value of the Line No field.';
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
        field(5; Tipo; Option)
        {
            Caption = 'Tipo';
            ToolTip = 'Specifies the value of the Tipo field.';
            OptionMembers = " ",Entrada,Salida;
        }
        field(6; Clasificacion; Code[20])
        {
            Caption = 'Clasificacion';
            ToolTip = 'Specifies the value of the Clasificacion field.';
            TableRelation = Item WHERE(Blocked = CONST(false),
                                        "Item Category Code" = CONST('PESCA'));

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

            trigger OnValidate()
            begin
                Validate(Cantidad);
            end;
        }
        field(9; Cantidad; Decimal)
        {
            Caption = 'Quantity';
            ToolTip = 'Specifies the value of the Quantity field.';
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
        field(12; "No. Pallet"; Code[20])
        {
            Caption = 'Pallet no.';
            ToolTip = 'Specifies the value of the Pallet no field.';

            trigger OnLookup()
            begin
                SelectMovProd(FieldNo("No. Pallet"));
            end;

        }
        field(13; "Cod. deposito"; Code[10])
        {
            Caption = 'Cod. deposito';
            ToolTip = 'Specifies the value of the Cod. deposito field.';
            TableRelation = Location;

        }
        field(14; Buque; Code[10])
        {
            Caption = 'Buque';
            ToolTip = 'Specifies the value of the Buque field.';
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(15; Marea; Code[10])
        {
            Caption = 'Marea';
            ToolTip = 'Specifies the value of the Marea field.';
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

        }
        field(16; Puerto; Code[10])
        {
            Caption = 'Puerto';
            ToolTip = 'Specifies the value of the Puerto field.';
        }
        field(17; "No. proyecto"; Code[20])
        {
            Caption = 'Job No.';
            ToolTip = 'Specifies the value of the Job No field.';
            TableRelation = Job;

            trigger OnValidate()
            begin
                Clear(rstProyecto);
                if rstProyecto.Get("No. proyecto") then begin

                    if Tipo = Tipo::Entrada then begin

                        if rstProyecto."Global Dimension 1 Code" <> '' then
                            Buque := rstProyecto."Global Dimension 1 Code";
                        if rstProyecto."Activity code" <> '' then
                            Actividad := rstProyecto."Activity code";
                        if rstProyecto."Global Dimension 2 Code" <> '' then
                            Marea := rstProyecto."Global Dimension 2 Code";
                        "Lote origen" := fntLoteOrigen;

                    end;

                end;
            end;
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
        field(21; "Buque Tercero"; Code[3])
        {
            Caption = 'Buque Tercero';
            ToolTip = 'Specifies the value of the Buque Tercero field.';
        }
        field(22; "Marea Tercero"; Code[7])
        {
            Caption = 'Marea Tercero';
            ToolTip = 'Specifies the value of the Marea Tercero field.';
            Editable = true;
        }
        field(23; Tercero; Boolean)
        {
            Caption = 'Tercero';
            ToolTip = 'Specifies the value of the Tercero field.';
        }
        field(24; "Lote origen"; Code[20])
        {
            Caption = 'Lote origen';
            ToolTip = 'Specifies the value of the Lote origen field.';
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
        field(27; "Ultimo pallet"; Code[20])
        {
            Caption = 'Ultimo pallet';
            ToolTip = 'Specifies the value of the Ultimo pallet field.';
        }
        field(28; "Cantidad en pallet"; Decimal)
        {
            Caption = 'Cantidad en pallet';
            ToolTip = 'Specifies the value of the Cantidad en pallet field.';
        }
        field(29; "No. lote"; Code[30])
        {
            Caption = 'No. lote';
            ToolTip = 'Specifies the value of the No. lote field.';
            DataClassification = ToBeClassified;
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
        field(31; "Lin. tunel"; Integer)
        {
            Caption = 'Lín. túnel';
            ToolTip = 'Specifies the value of the Lín. túnel field.';
            DataClassification = ToBeClassified;
        }
        field(32; "Cod. relacion costo"; Code[20])
        {
            Caption = 'Cod. relacion costo';
            ToolTip = 'Specifies the value of the Cod. relacion costo field.';
            DataClassification = ToBeClassified;

        }
        field(33; "Bin code"; Code[20])
        {
            Caption = 'Ubicación';
            ToolTip = 'Specifies the value of the Ubicación field.';
            DataClassification = ToBeClassified;
            TableRelation = Bin.Code WHERE("Location Code" = FIELD("Cod. deposito"));
        }
        field(34; "Fecha produccion"; Date)
        {
            Caption = 'Fecha produccion';
            ToolTip = 'Specifies the value of the Fecha produccion field.';
            DataClassification = ToBeClassified;
        }
        field(35; Prorrateo; Decimal)
        {
            Caption = 'Prorrateo';
            ToolTip = 'Specifies the value of the Prorrateo field.';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Nombre libro diario", "Nombre seccion diario", "No. documento", Tipo, "Lote origen", Clasificacion, "No. línea")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        Clear(rstCabecera);
        if rstCabecera.Get("Nombre libro diario", "Nombre seccion diario", "No. documento") then begin

            Puerto := rstCabecera."Puerto/Aeropuerto";

            case Tipo of
                /*Tipo::Salida:
                  IF NOT fntMix THEN
                    VALIDATE("No. proyecto",rstCabecera."Proyecto Origen")
                  ELSE
                    VALIDATE("No. proyecto",rstCabecera."Proyecto Destino");*/
                Tipo::Entrada:
                    Validate("No. proyecto", rstCabecera."Proyecto Destino");
            end;

        end;

    end;

    trigger OnModify()
    begin
        Clear(rstCabecera);
        if rstCabecera.Get("Nombre libro diario", "Nombre seccion diario", "No. documento") then begin

            Puerto := rstCabecera."Puerto/Aeropuerto";
            case Tipo of
                /*Tipo::Salida:
                  IF NOT fntMix THEN
                    VALIDATE("No. proyecto",rstCabecera."Proyecto Origen");*/
                Tipo::Entrada:
                    Validate("No. proyecto", rstCabecera."Proyecto Destino");
            end;

        end;

    end;

    var
        rstProducto: Record Item;
        rstCabecera: Record "Produccion Planta";
        frmListaProd: Page "Item List";
        rstUMxProd: Record "Item Unit of Measure";
        rstLinDiaProd: Record "Item Journal Line";
        rstCabProd: Record "Produccion Planta";
        rstDigitalizar: Record "Ruta digitalizacion depto/espe";
        rstConfusu: Record "User Setup";
        rstMovProducto: Record "Item Ledger Entry";
        PunProd: Record Item;
        PunExi: Record "Inventory Setup";
        Producto: Record Item;
        "----ARBUMASA---": Integer;
        rstItemTrack: Record "Item Tracking Code";
        rstJob: Record Job;
        rstProyecto: Record Job;
        rstProyectoOrigen: Record Job;
        rstProyectoDestino: Record Job;

    local procedure SelectMovProd(NoCampoActual: Integer)
    begin
        if Tipo = Tipo::Salida then begin

            rstMovProducto.SetCurrentKey(rstMovProducto."Location Code", rstMovProducto."Lot No.", rstMovProducto."Entry/Exit Point",
                                         rstMovProducto."Item No.", rstMovProducto.Open, rstMovProducto."Nombre seccion diario",
                                         rstMovProducto."Item type", rstMovProducto."Posting Date");
            rstMovProducto.SetRange(rstMovProducto."Item No.", Clasificacion);
            if "No. Pallet" <> '' then
                rstMovProducto.SetRange("Pallet no.", "No. Pallet");
            if "Cod. deposito" <> '' then
                rstMovProducto.SetRange("Location Code", "Cod. deposito");
            rstMovProducto.SetRange(Open, true);
            if Cantidad <> 0 then begin
                if Tipo = Tipo::Salida then
                    rstMovProducto.SetRange(Positive, true);
            end;
            if Tipo = Tipo::Entrada then
                fntGetPallet;

            if PAGE.RunModal(PAGE::"Item Ledger Entries", rstMovProducto) = ACTION::LookupOK
            then begin
                "Cod. deposito" := rstMovProducto."Location Code";
                //  "Lot No." := rstMovProducto."Lot No.";

                //IBdos Argentina - USS - 021202 - Inicio Modificación Arbumasa
                //Traigo el No pallet, los niveles y el peso en kilos brutos del lote origen
                Buque := rstMovProducto."Global Dimension 1 Code";
                Actividad := rstMovProducto."Shortcut Dimension 3 Code";
                Marea := rstMovProducto."Global dimension 2 Code";
                if rstMovProducto."Global Dimension 7 Code" <> '' then
                    "Cod. relacion costo" := rstMovProducto."Global Dimension 7 Code";
                "No. Pallet" := rstMovProducto."Pallet no.";
                Validate("No. proyecto", rstMovProducto."Job No.");
                "Buque Tercero" := rstMovProducto."Buque Tercero";
                "Marea Tercero" := rstMovProducto."Marea Tercero";
                Puerto := rstMovProducto."Entry/Exit Point";
                Validate("Unidad medida", rstMovProducto."Unit of Measure Code");

                //IBdos Argentina - USS - 021202 - Fin Modificación Arbumasa
                //US.ARBU - 2005-02-23 - Inicio modificación para ingresar datos de transferencia
                //US.ARBU - 2005-05-13 - Inicio - Modificación para seguimiento del Lote de origen

                if Tipo = Tipo::Salida then begin

                    Validate("No. lote", rstMovProducto."Lot No.");
                    Validate("Lote origen", rstMovProducto."Lote origen");
                    Validate(Cantidad, rstMovProducto."Remaining Quantity");
                    // Kilos pendientes del movimiento: cantidad pendiente x kilos por unidad.
                    if rstMovProducto.Quantity <> 0 then begin
                        Validate("Kilos netos", rstMovProducto."Remaining Quantity" * rstMovProducto."Net kilos" / rstMovProducto.Quantity);
                        Validate("Kilos brutos", rstMovProducto."Remaining Quantity" * rstMovProducto."Gross kilos" / rstMovProducto.Quantity);
                    end;

                end;

                //US.ARBU - 2005-05-13 - Fin - Modificación para seguimiento del Lote de origen
                //US.ARBU - 2005-02-23 - Fin modificación para ingresar datos de transferencia
                //IBdos Argentina - USS - 280503 - Fin Modificación Arbumasa

            end;


            //IBdos Argentina - USS - 260503 - Inicio Modificación Arbumasa
            //Lote a destino

            /*IF "Entry type" = "Entry type"::Transfer THEN
              VALIDATE("Nuevo no lote","No. lote");
            */
            //IBdos Argentina - USS - 260503 - Fin Modificación Arbumasa

        end;

    end;

    [Scope('OnPrem')]
    procedure fntGetPallet()
    var
        decPallet: Decimal;
        rstProy: Record Job;
        rstProduccion: Record "Produccion Planta";
        MovtoProducto: Record "Item Ledger Entry";
    begin
        if Tipo = Tipo::Entrada then begin

            if "No. Pallet" = '' then begin

                Clear(rstProduccion);
                rstProduccion.SetRange(rstProduccion."Nombre libro diario", "Nombre libro diario");
                rstProduccion.SetRange("Nombre seccion diario", "Nombre seccion diario");
                //  rstProduccion.SETRANGE("No. documento","No. documento");
                rstProduccion.SetRange(Registrado, false);
                if rstProduccion.FindFirst then begin

                    Clear(rstProy);
                    rstProy.Get(rstProduccion."Proyecto Destino");
                    MovtoProducto.Reset;
                    MovtoProducto.SetRange("Entry Type", MovtoProducto."Entry Type"::"Positive Adjmt.");
                    MovtoProducto.SetRange("Item No.", Clasificacion);
                    MovtoProducto.SetRange(MovtoProducto."Global Dimension 1 Code", rstProy."Global Dimension 1 Code");
                    MovtoProducto.SetRange(MovtoProducto."Global Dimension 2 Code", rstProy."Global Dimension 2 Code");
                    MovtoProducto.SetRange(Open, true);
                    decPallet := 0;
                    if MovtoProducto.FindLast then begin

                        MovtoProducto.SetRange("Pallet no.", MovtoProducto."Pallet no.");

                        if MovtoProducto.FindFirst then
                            repeat

                                decPallet += MovtoProducto."Remaining Quantity";

                            until MovtoProducto.Next = 0;

                        "Ultimo pallet" := MovtoProducto."Pallet no.";
                        "Cantidad en pallet" := decPallet + Cantidad;

                    end;

                end;

            end
            else begin

                Clear(rstProduccion);
                rstProduccion.SetRange(rstProduccion."Nombre libro diario", "Nombre libro diario");
                rstProduccion.SetRange("Nombre seccion diario", "Nombre seccion diario");
                //  rstProduccion.SETRANGE("No. documento","No. documento");
                rstProduccion.SetRange(Registrado, false);
                if rstProduccion.FindFirst then begin

                    Clear(rstProy);
                    rstProy.Get(rstProduccion."Proyecto Destino");
                    MovtoProducto.Reset;
                    MovtoProducto.SetRange("Entry Type", MovtoProducto."Entry Type"::"Positive Adjmt.");
                    MovtoProducto.SetRange("Item No.", Clasificacion);
                    MovtoProducto.SetRange("Global Dimension 1 Code", rstProy."Global Dimension 1 Code");
                    MovtoProducto.SetRange("Global dimension 2 Code", rstProy."Global Dimension 2 Code");
                    MovtoProducto.SetRange("Pallet no.", "No. Pallet");
                    MovtoProducto.SetRange(Open, true);
                    decPallet := 0;
                    if MovtoProducto.FindLast then begin

                        MovtoProducto.SetRange("Pallet no.", MovtoProducto."Pallet no.");

                        if MovtoProducto.FindFirst then
                            repeat

                                decPallet += MovtoProducto."Remaining Quantity";

                            until MovtoProducto.Next = 0;

                    end;

                end;

                "Ultimo pallet" := "No. Pallet";
                "Cantidad en pallet" := decPallet + Cantidad;

            end;

        end;
    end;

    local procedure fntLoteOrigen(): Text[10]
    var
        rstLDP: Record "Lin. produccion planta";
        rstJob: Record Job;
        PunExi: Record "Inventory Setup";
    begin
        if not fntMix then begin

            Clear(rstLDP);
            rstLDP.SetRange(rstLDP."Nombre libro diario", "Nombre libro diario");
            rstLDP.SetRange("Nombre seccion diario", "Nombre seccion diario");
            rstLDP.SetRange("No. documento", "No. documento");
            rstLDP.SetRange(Tipo, rstLDP.Tipo::Salida);
            if rstLDP.FindFirst then
                exit(rstLDP."Lote origen");

        end
        else begin

            Clear(rstCabecera);
            if rstCabecera.Get("Nombre libro diario", "Nombre seccion diario", "No. documento") then
                exit(rstCabecera."Lote origen");

        end;
    end;

    local procedure fntMix(): Boolean
    var
        rstJob: Record Job;
    begin
        Clear(rstJob);
        if rstJob.Get(rstCabecera."Proyecto Origen") then;

        Clear(PunExi);
        PunExi.Get();

        if rstJob."Activity code" = PunExi."Produccion Mix" then
            exit(true)
        else
            exit(false);
    end;

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

