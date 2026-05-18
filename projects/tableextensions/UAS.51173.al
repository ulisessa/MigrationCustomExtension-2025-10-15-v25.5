tableextension 51173 tableextension51173 extends "Item Journal Line"
{
    Caption = 'Item Journal Line';
    fields
    {
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Source No.")
        {
            Caption = 'Source No.';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Salespers./Purch. Code")
        {
            Caption = 'Salespers./Purch. Code';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("Applies-to Entry")
        {
            Caption = 'Applies-to Entry';
        }
        modify("Item Shpt. Entry No.")
        {
            Caption = 'Item Shpt. Entry No.';
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        modify("Shortcut Dimension 2 Code")
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        modify("Shpt. Method Code")
        {
            Caption = 'Shpt. Method Code';
        }
        modify("Journal Batch Name")
        {
            Caption = 'Journal Batch Name';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("Recurring Frequency")
        {
            Caption = 'Recurring Frequency';
        }
        modify("Drop Shipment")
        {
            Caption = 'Drop Shipment';
        }
        modify("Transaction Type")
        {
            Caption = 'Transaction Type';
        }
        modify("Country/Region Code")
        {
            Caption = 'Country/Region Code';
        }
        modify("New Location Code")
        {
            Caption = 'New Location Code';
        }
        modify("New Shortcut Dimension 1 Code")
        {
            Caption = 'New Shortcut Dimension 1 Code';
        }
        modify("New Shortcut Dimension 2 Code")
        {
            Caption = 'New Shortcut Dimension 2 Code';
        }
        modify("Qty. (Phys. Inventory)")
        {
            Caption = 'Qty. (Phys. Inventory)';
        }
        modify("Last Item Ledger Entry No.")
        {
            Caption = 'Last Item Ledger Entry No.';
        }
        modify("Phys. Inventory")
        {
            Caption = 'Phys. Inventory';
        }
        modify("Document Date")
        {
            Caption = 'Document Date';
        }
        modify("External Document No.")
        {
            Caption = 'External Document No.';
        }
        modify("Area")
        {
            Caption = 'Area';
        }
        modify("Transaction Specification")
        {
            Caption = 'Transaction Specification';
        }
        modify("Posting No. Series")
        {
            Caption = 'Posting No. Series';
        }
        modify("Source Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Source Currency Code';
        }
        modify("Document Line No.")
        {
            Caption = 'Document Line No.';
        }
        modify("Order No.")
        {
            Caption = 'Order No.';
        }
        modify("Order Line No.")
        {
            Caption = 'Order Line No.';
        }
        modify("Job No.")
        {
            Caption = 'Job No.';
            TableRelation = Job;
        }
        modify("Job Task No.")
        {
            Caption = 'Job Task No.';
        }
        modify("Job Contract Entry No.")
        {
            Caption = 'Job Contract Entry No.';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Bin Code")
        {
            Caption = 'Bin Code';
        }
        modify("New Bin Code")
        {
            Caption = 'New Bin Code';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Flushing Method")
        {
            Caption = 'Flushing Method';
        }
        modify("Originally Ordered No.")
        {
            Caption = 'Originally Ordered No.';
        }
        modify("Originally Ordered Var. Code")
        {
            Caption = 'Originally Ordered Var. Code';
        }
        modify("Item Category Code")
        {
            Caption = 'Item Category Code';
        }
        modify(Nonstock)
        {
            Caption = 'Catalog';
        }
        modify("Purchasing Code")
        {
            Caption = 'Purchasing Code';
        }
        modify("Item Charge No.")
        {
            Caption = 'Item Charge No.';
        }
        modify("Variance Type")
        {
            Caption = 'Variance Type';
        }
        modify("Inventory Value Per")
        {
            OptionCaption = ' ,Item,Location,Variant,Location and Variant';
        }
        modify("Partial Revaluation")
        {
            Caption = 'Partial Revaluation';
        }
        modify("Invoice No.")
        {
            Caption = 'Invoice No.';
        }
        modify("Update Standard Cost")
        {
            Caption = 'Update Standard Cost';
        }
        modify(Correction)
        {
            Caption = 'Correction';
        }
        modify("Invoice-to Source No.")
        {
            Caption = 'Invoice-to Source No.';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Operation No.")
        {
            Caption = 'Operation No.';
        }
        modify("Work Center No.")
        {
            Caption = 'Work Center No.';
        }
        modify("Setup Time")
        {
            Caption = 'Setup Time';
        }
        modify("Run Time")
        {
            Caption = 'Run Time';
        }
        modify("Run Time (Base)")
        {
            Caption = 'Run Time (Base)';
        }
        modify("Cap. Unit of Measure Code")
        {
            Caption = 'Cap. Unit of Measure Code';
        }
        modify("Routing No.")
        {
            Caption = 'Routing No.';
        }
        modify("Routing Reference No.")
        {
            Caption = 'Routing Reference No.';
        }
        modify("Prod. Order Comp. Line No.")
        {
            Caption = 'Prod. Order Comp. Line No.';
        }
        modify("Unit Cost Calculation")
        {
            Caption = 'Unit Cost Calculation';
        }
        modify(Subcontracting)
        {
            Caption = 'Subcontracting';
        }
        modify("Stop Code")
        {
            Caption = 'Stop Code';
        }
        modify("Scrap Code")
        {
            Caption = 'Scrap Code';
        }
        modify("Work Center Group Code")
        {
            Caption = 'Work Center Group Code';
        }
        modify("Work Shift Code")
        {
            Caption = 'Work Shift Code';
        }
        modify("Serial No.")
        {
            Caption = 'Serial No.';
        }
        modify("Lot No.")
        {
            Caption = 'Lot No.';
        }
        modify("Warranty Date")
        {
            Caption = 'Warranty Date';
        }
        modify("New Serial No.")
        {
            Caption = 'New Serial No.';
        }
        modify("New Lot No.")
        {
            Caption = 'New Lot No.';
        }
        modify("Return Reason Code")
        {
            Caption = 'Return Reason Code';
        }
        modify("Warehouse Adjustment")
        {
            Caption = 'Warehouse Adjustment';
        }
        modify("Phys Invt Counting Period Code")
        {
            Caption = 'Phys Invt Counting Period Code';
        }
        modify("Phys Invt Counting Period Type")
        {
            Caption = 'Phys Invt Counting Period Type';
        }

        //Unsupported feature: Code Modification on ""Item No."(Field 3).OnValidate".

        //trigger "(Field 3)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "Item No." <> xRec."Item No." then begin
          "Variant Code" := '';
          "Bin Code" := '';
        #4..33
        "Inventory Posting Group" := Item."Inventory Posting Group";
        "Item Category Code" := Item."Item Category Code";

        if ("Value Entry Type" <> "Value Entry Type"::"Direct Cost") or
           ("Item Charge No." <> '')
        then begin
        #40..137

        OnBeforeVerifyReservedQty(Rec,xRec,FieldNo("Item No."));
        ReserveItemJnlLine.VerifyChange(Rec,xRec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..36
        //Arbu
        Familia := Item.Familia;
        Subfamilia := Item.Subfamilia;
        "Tipo producto" := Item."Tipo producto";
        //--Arbu
        #37..140
        //++Arbu
        "fntGenerarGS1.128";
        //--Arbu
        */
        //end;


        //Unsupported feature: Code Modification on ""Location Code"(Field 9).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "Entry Type" <= "Entry Type"::Transfer then
          TestField("Item No.");

        #4..34

        Validate("Unit of Measure Code");

        ReserveItemJnlLine.VerifyChange(Rec,xRec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..37
        //++Migraci??n Arbumasa 2009

        Clear(Location);
        if Location.Get("Location Code") then
        begin

          Validate("Bin Code",Location."Default bin");

        end;

        //--Migraci??n Arbumasa 2009

        ReserveItemJnlLine.VerifyChange(Rec,xRec);
        */
        //end;


        //Unsupported feature: Code Modification on "Quantity(Field 13).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if ("Entry Type" <= "Entry Type"::Transfer) and (Quantity <> 0) then
          TestField("Item No.");

        #4..39
        CalcFields("Reserved Qty. (Base)");
        if Abs("Quantity (Base)") < Abs("Reserved Qty. (Base)") then
          Error(Text001,FieldCaption("Reserved Qty. (Base)"));

        if Item."Item Tracking Code" <> '' then
          ReserveItemJnlLine.VerifyQuantity(Rec,xRec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..42
        //++Migraci??n Arbumasa 2009
        Producto.Get("Item No.");
        if (Producto."Utiliza Tarifario") and not ("Entry Type" in[
            "Entry Type"::Sale]) then
        begin

          Validate("Net kilos",Round(cduProductionFishing.FunCalcPesoNeto(Quantity,"Item No.","Qty. per Unit of Measure"),1));
          Validate("Gross kilos",Round(cduProductionFishing.FunCalcPesoBruto(Quantity,"Item No.","Qty. per Unit of Measure"),1));

          Clear(cduProductionFishing);
          "Net kilos per UOM" := cduProductionFishing.fntCalcKilosRatio("Item No.",Quantity,"Qty. per Unit of Measure","Net kilos");
          "Gross kilos per UOM" := cduProductionFishing.fntCalcKilosRatio("Item No.",Quantity,"Qty. per Unit of Measure","Gross kilos");

          Validate("Net kilos (Base)",cduProductionFishing.fntCalcKilosFromRatio("Item No.",
                  "Quantity (Base)","Qty. per Unit of Measure","Net kilos per UOM"));
          Validate("Gross kilos (Base)",cduProductionFishing.fntCalcKilosFromRatio("Item No.",
                  "Quantity (Base)","Qty. per Unit of Measure","Gross kilos per UOM"));

          Validate("Net kilos (Base)",cduProductionFishing.fntCalcKilosFromRatio("Item No.",
                  "Quantity (Base)","Qty. per Unit of Measure","Net kilos per UOM"));
          Validate("Gross kilos (Base)",cduProductionFishing.fntCalcKilosFromRatio("Item No.",
                  "Quantity (Base)","Qty. per Unit of Measure","Gross kilos per UOM"));

          Validate("Net Kilos Invoiced",cduProductionFishing.fntCalcKilosFromRatio("Item No.",
                  "Invoiced Quantity","Qty. per Unit of Measure","Net kilos per UOM"));
          Validate("Gross kilos Invoiced",cduProductionFishing.fntCalcKilosFromRatio("Item No.",
                  "Invoiced Quantity","Qty. per Unit of Measure","Gross kilos per UOM"));

          Validate("Net Kilos Invoiced (Base)",cduProductionFishing.fntCalcKilosFromRatio("Item No.",
                  "Invoiced Qty. (Base)","Qty. per Unit of Measure","Net kilos per UOM"));
          Validate("Gross kilos Invoiced (Base)",cduProductionFishing.fntCalcKilosFromRatio("Item No.",
                  "Invoiced Qty. (Base)","Qty. per Unit of Measure","Gross kilos per UOM"));

        end;


        if rstItemTrack.Get(Producto."Item Tracking Code") then
        case "Entry Type" of

          "Entry Type"::"Positive Adjmt.":
            if rstItemTrack."Lot Pos. Adjmt. Inb. Tracking" or
              rstItemTrack."Lot Pos. Adjmt. Outb. Tracking" or
              rstItemTrack."Lot Info. Inbound Must Exist" then
              ReserveItemJnlLine.CallItemTrackingAuto(Rec,false);
          "Entry Type"::"Negative Adjmt.":
            if rstItemTrack."Lot Neg. Adjmt. Inb. Tracking" or
              rstItemTrack."Lot Neg. Adjmt. Outb. Tracking" or
              rstItemTrack."Lot Info. Outbound Must Exist" then
              ReserveItemJnlLine.CallItemTrackingAuto(Rec,false);
          "Entry Type"::Purchase:
            if rstItemTrack."Lot Purchase Inbound Tracking" or
              rstItemTrack."Lot Purchase Outbound Tracking" or
              rstItemTrack."Lot Info. Inbound Must Exist" then
              ReserveItemJnlLine.CallItemTrackingAuto(Rec,false);
          "Entry Type"::Sale:
            if rstItemTrack."Lot Sales Inbound Tracking" or
              rstItemTrack."Lot Sales Outbound Tracking" or
              rstItemTrack."Lot Info. Outbound Must Exist" then
              ReserveItemJnlLine.CallItemTrackingAuto(Rec,false);

        end;

        //--Migraci??n Arbumasa 2009
        #43..45
        */
        //end;


        //Unsupported feature: Code Modification on ""Applies-to Entry"(Field 29).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "Applies-to Entry" <> 0 then begin
          ItemLedgEntry.Get("Applies-to Entry");

        #4..34

          "Location Code" := ItemLedgEntry."Location Code";
          "Variant Code" := ItemLedgEntry."Variant Code";
        end else
          if "Value Entry Type" = "Value Entry Type"::Revaluation then begin
            Validate("Unit Amount",0);
        #41..44
            "Variant Code" := '';
            "Bin Code" := '';
          end;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..37
          //++Arbu
          Validate("Job No.",ItemLedgEntry."Job No.");
          //--Arbu

        #38..47
        */
        //end;


        //Unsupported feature: Code Modification on ""Shortcut Dimension 1 Code"(Field 34).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
        if "Entry Type" = "Entry Type"::Transfer then
          //ValidateNewShortcutDimCode(1,"Shortcut Dimension 1 Code");
          Validate("New Shortcut Dimension 1 Code","Shortcut Dimension 1 Code");

        //++Arbu

        if ("Entry Type" in["Entry Type"::"Positive Adjmt.","Entry Type"::Purchase]) or ("Entry Type" in["Entry Type"::"Negative Adjmt."]) and (Revertido=true) and ("Shortcut Dimension 1 Code" <> xRec."Shortcut Dimension 1 Code") then
        begin

          fntGenerarLote;

        end;

        "fntGenerarGS1.128";

        //--Arbu
        */
        //end;


        //Unsupported feature: Code Modification on ""Shortcut Dimension 2 Code"(Field 35).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
        if "Entry Type" = "Entry Type"::Transfer then
        //  ValidateNewShortcutDimCode(2,"Shortcut Dimension 2 Code");
          Validate("New Shortcut Dimension 2 Code","Shortcut Dimension 2 Code");
        */
        //end;


        //Unsupported feature: Code Modification on ""New Location Code"(Field 50).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestField("Entry Type","Entry Type"::Transfer);
        if "New Location Code" <> xRec."New Location Code" then begin
          "New Bin Code" := '';
        #4..8
        end;

        ReserveItemJnlLine.VerifyChange(Rec,xRec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..11

        //++Arbu 2021
        "New Lot No." := "Lot No.";
        Validate("Nuevo No. Pallet");
        "New Bin Code" := "Bin Code";
        "New Dimension Set ID" := "Dimension Set ID";
        "New Item Expiration Date" := "Item Expiration Date";
        "New Serial No." := "Serial No.";
        "New Shortcut Dimension 1 Code" := "Shortcut Dimension 1 Code";
        "New Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
        "New shortcut Dimension 3 Code" := "Shortcut Dimension 3 Code";
        "New shortcut Dimension 4 Code" := "Shortcut Dimension 4 Code";
        "New shortcut Dimension 5 Code" := "Shortcut Dimension 5 Code";
        "New shortcut Dimension 6 Code" := "Shortcut Dimension 6 Code";
        "New shortcut Dimension 7 Code" := "Shortcut Dimension 7 Code";
        //--Arbu 2021
        */
        //end;


        //Unsupported feature: Code Insertion on ""External Document No."(Field 62)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        fntFormatVendDoc("External Document No.");
        */
        //end;


        //Unsupported feature: Code Modification on ""Dimension Set ID"(Field 480).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
        "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
        "Shortcut Dimension 7 Code");
        */
        //end;


        //Unsupported feature: Code Insertion on ""Job No."(Field 1000)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //var
        //rstJob: Record Job;
        //begin
        /*
        //++Arbu
        Clear(rstJob);
        if rstJob.Get("Job No.") then
        begin

          if rstJob."Global Dimension 1 Code" <> '' then
            Validate("Shortcut Dimension 1 Code",rstJob."Global Dimension 1 Code");
          if rstJob."Global Dimension 2 Code" <> '' then
            Validate("Shortcut Dimension 2 Code",rstJob."Global Dimension 2 Code");
          if rstJob."Global Dimension 3 Code" <> '' then
            Validate("Shortcut Dimension 3 Code",rstJob."Global Dimension 3 Code");
          if rstJob."Global Dimension 4 Code" <> '' then
            Validate("Shortcut Dimension 4 Code",rstJob."Global Dimension 4 Code");
          if rstJob."Global Dimension 5 Code" <> '' then
            Validate("Shortcut Dimension 5 Code",rstJob."Global Dimension 5 Code");
          if rstJob."Global Dimension 6 Code" <> '' then
            Validate("Shortcut Dimension 6 Code",rstJob."Global Dimension 6 Code");
          if rstJob."Global Dimension 7 Code" <> '' then
            Validate("Shortcut Dimension 7 Code",rstJob."Global Dimension 7 Code");
          "No. Proyecto" := "Job No.";
          if "Entry Type" = "Entry Type"::Transfer then
            Validate("No. Proyecto destino","Job No.");
          Validate("No. Pallet");
        end;
        //--Arbu
        */
        //end;


        //Unsupported feature: Code Modification on ""Unit of Measure Code"(Field 5407).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        OnBeforeValidateUnitOfMeasureCode(Rec,IsHandled);
        if IsHandled then
          exit;
        #4..38
        end else
          Validate(Quantity);

        CheckItemAvailable(FieldNo("Unit of Measure Code"));
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..41
        "fntGenerarGS1.128";
        CheckItemAvailable(FieldNo("Unit of Measure Code"));
        */
        //end;
        field(50010; "No. Pallet"; Code[20])
        {

        }
        field(50011; "No. Proyecto"; Code[20])
        {
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                if ("No. Proyecto destino" <> '') and ("Entry Type" = "Entry Type"::"Negative Adjmt.") and
                   ("Tipo producto" = "Tipo producto"::Pesca) then begin

                    Error('No se puede cambiar el Proyecto en un movimiento de Salida de Producción.\' +
                          'Para hacerlo, corrija la cabecera de Producción');

                end;

                //IBdos Argentina - USS - 190203 - Inicio Modificación Arbumasa
                //Debe traer niveles del proyecto

                rstJob.Reset;
                if rstJob.Get("No. Proyecto") then begin

                    if rstJob."Global Dimension 1 Code" <> '' then
                        Validate("Shortcut Dimension 1 Code", rstJob."Global Dimension 1 Code");
                    if rstJob."Global Dimension 2 Code" <> '' then
                        Validate("Shortcut Dimension 2 Code", rstJob."Global Dimension 2 Code");
                    if rstJob."Global Dimension 3 Code" <> '' then
                        Validate("Shortcut Dimension 3 Code", rstJob."Global Dimension 3 Code");
                    if rstJob."Global Dimension 4 Code" <> '' then
                        Validate("Shortcut Dimension 4 Code", rstJob."Global Dimension 4 Code");
                    if rstJob."Global Dimension 5 Code" <> '' then
                        Validate("Shortcut Dimension 5 Code", rstJob."Global Dimension 5 Code");
                    if rstJob."Global Dimension 6 Code" <> '' then
                        Validate("Shortcut Dimension 6 Code", rstJob."Global Dimension 6 Code");
                    if rstJob."Global Dimension 7 Code" <> '' then
                        Validate("Shortcut Dimension 7 Code", rstJob."Global Dimension 7 Code");
                    Validate("Job No.", "No. Proyecto");

                end;

                //IBdos Argentina - USS - 190203 - Fin Modificación Arbumasa
            end;
        }
        field(50012; "No. Proyecto destino"; Code[20])
        {
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                //IBdos Argentina - USS - 160403 - Inicio Modificación Arbumasa
                //Debe traer niveles del proyecto destino

                PunProy.Reset;
                if PunProy.Get("No. Proyecto destino") then begin

                    Validate("New Shortcut Dimension 1 Code", PunProy."Global Dimension 1 Code");
                    Validate("New Shortcut Dimension 2 Code", PunProy."Global Dimension 2 Code");
                    Validate("New shortcut Dimension 3 Code", PunProy."Global Dimension 3 Code");
                    Validate("New shortcut Dimension 4 Code", PunProy."Global Dimension 4 Code");
                    Validate("New shortcut Dimension 5 Code", PunProy."Global Dimension 5 Code");
                    Validate("New shortcut Dimension 6 Code", PunProy."Global Dimension 6 Code");
                    Validate("New shortcut Dimension 7 Code", PunProy."Global Dimension 7 Code");

                end;

                //IBdos Argentina - USS - 190203 - Fin Modificación Arbumasa
            end;
        }
        field(50013; "Gross kilos"; Decimal)
        {

            trigger OnValidate()
            begin
                if "Entry Type" = "Entry Type"::Transfer then begin
                    if "Kilos brutos destino" = 0 then
                        "Kilos brutos destino" := "Gross kilos";
                end;

                //IBdos Argentina - USS - 260503 - Inicio Modificación Arbumasa
                //Kilos brutos a destino

                if "Entry Type" = "Entry Type"::Transfer then
                    Validate("Kilos brutos destino", "Gross kilos");

                //IBdos Argentina - USS - 260503 - Fin Modificación Arbumasa

                "Gross kilos (Base)" := "Gross kilos";
                "Gross kilos Invoiced" := "Gross kilos";
                "Gross kilos Invoiced (Base)" := "Gross kilos";

                //++Arbu
                //COMMIT;
                //--Arbu

                //hGenLote;
            end;
        }
        field(50014; "Net kilos"; Decimal)
        {

            trigger OnValidate()
            begin
                //IBdos Argentina - USS - 270503 - Inicio Modificación Arbumasa
                //Kilos netos a destino

                if "Entry Type" = "Entry Type"::Transfer then begin
                    if "Kilos netos destino" = 0 then
                        "Kilos netos destino" := "Net kilos";
                end;

                if "Entry Type" = "Entry Type"::Transfer then
                    Validate("Kilos netos destino", "Net kilos");


                //IBdos Argentina - USS - 270503 - Fin Modificación Arbumasa

                "Net kilos (Base)" := "Net kilos";
                "Net Kilos Invoiced" := "Net kilos";
                "Net Kilos Invoiced (Base)" := "Net kilos";

                "fntGenerarGS1.128";

                //++Arbu
                //COMMIT;
                //--Arbu
                //hGenLote;
            end;
        }
        field(50015; "% Precio kilo"; Decimal)
        {
        }
        field(50016; "Nuevo No. Pallet"; Code[10])
        {

        }
        field(50017; "Kilos brutos destino"; Decimal)
        {
        }
        field(50018; Familia; Code[3])
        {
            TableRelation = "Familia producto";
        }
        field(50019; Subfamilia; Code[20])
        {
            TableRelation = "Subfamilia producto";
        }
        field(50020; "Kilos netos destino"; Decimal)
        {
        }
        field(50021; "Tipo producto"; Option)
        {
            OptionMembers = Consumo,Pesca;
        }
        field(50022; "No. Cab. Solicitud"; Code[30])
        {
        }
        field(50023; "No. Linea Solicitud"; Integer)
        {
        }
        field(50024; "Net Kilos Invoiced"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50025; "Net kilos (Base)"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50026; "Net Kilos Invoiced (Base)"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50027; "Gross kilos Invoiced"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50028; "Gross kilos (Base)"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50029; "Gross kilos Invoiced (Base)"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50030; "Fecha Produccion"; Date)
        {
        }
        field(50031; "Buque Tercero"; Code[3])
        {
        }
        field(50032; "Marea Tercero"; Code[7])
        {
        }
        field(50033; "Transporte matrícula"; Code[10])
        {
        }
        field(50034; Temperatura; Decimal)
        {
        }
        field(50035; "Hora de ingreso"; Time)
        {
        }
        field(50036; "Tipo de amparo sanitario"; Option)
        {
            BlankZero = true;
            OptionMembers = ,"P.T.","P.T.R.","C.S.E.P.","Guía de tránsito";
        }
        field(50037; "No. amparo sanitario"; Code[30])
        {
            Caption = 'No. amparo sanitario';
        }
        field(50038; Destino; Code[30])
        {
        }
        field(50039; "Concepto proyecto"; Code[10])
        {
            TableRelation = "Concepto proyecto";
        }
        field(50077; "Seguimiento para trazabilidad"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Post-Expo - Controlar contra DCL","No controlar contra DCL","Pre-Expo - Controlar contra DCL";
        }
        field(50079; "DCL application date formula"; Text[30])
        {
            Caption = 'Fórmula de aplicación de fechas de DCL';
            DataClassification = ToBeClassified;
        }
        field(50082; "MSC"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50102; "Kn (Calculated)"; Decimal)
        {
            Caption = 'Kn (Calculated)';
            DecimalPlaces = 0 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                Validate("Kn (Phys. Inventory)");
            end;
        }
        field(50103; "Kb (Calculated)"; Decimal)
        {
            Caption = 'Kb (Calculated)';
            DecimalPlaces = 0 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                Validate("Kb (Phys. Inventory)");
            end;
        }
        field(50104; "Kn (Phys. Inventory)"; Decimal)
        {
            Caption = 'Kn (Phys. Inventory)';
            DecimalPlaces = 0 : 5;

        }
        field(50105; "Kb (Phys. Inventory)"; Decimal)
        {
            Caption = 'Kb (Phys. Inventory)';
            DecimalPlaces = 0 : 5;

        }
        field(50106; "Reserved net kilos"; Decimal)
        {
            CalcFormula = Sum("Reservation Entry"."Net kilos" WHERE("Source ID" = FIELD("Journal Template Name"),
                                                                     "Source Ref. No." = FIELD("Line No."),
                                                                     "Source Type" = CONST(83),
                                                                     "Source Batch Name" = FIELD("Journal Batch Name"),
                                                                     "Source Prod. Order Line" = CONST(0),
                                                                     "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved net kilos';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50107; "Reserved gross kilos"; Decimal)
        {
            CalcFormula = Sum("Reservation Entry"."Gross kilos" WHERE("Source ID" = FIELD("Journal Template Name"),
                                                                       "Source Ref. No." = FIELD("Line No."),
                                                                       "Source Type" = CONST(83),
                                                                       "Source Batch Name" = FIELD("Journal Batch Name"),
                                                                       "Source Prod. Order Line" = CONST(0),
                                                                       "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved gross kilos';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50112; "Reserved kn (Base)"; Decimal)
        {
            CalcFormula = Sum("Reservation Entry"."Net kilos (Base)" WHERE("Source ID" = FIELD("Journal Template Name"),
                                                                            "Source Ref. No." = FIELD("Line No."),
                                                                            "Source Type" = CONST(83),
                                                                            "Source Batch Name" = FIELD("Journal Batch Name"),
                                                                            "Source Prod. Order Line" = CONST(0),
                                                                            "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved net kilos (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50113; "Reserved kb (Base)"; Decimal)
        {
            CalcFormula = Sum("Reservation Entry"."Gross kilos (Base)" WHERE("Source ID" = FIELD("Journal Template Name"),
                                                                              "Source Ref. No." = FIELD("Line No."),
                                                                              "Source Type" = CONST(83),
                                                                              "Source Batch Name" = FIELD("Journal Batch Name"),
                                                                              "Source Prod. Order Line" = CONST(0),
                                                                              "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved gross kilos (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50114; "Output net kilos"; Decimal)
        {
            Caption = 'Output net kilos';
            DecimalPlaces = 0 : 5;

        }
        field(50115; "Output gross kilos"; Decimal)
        {
            Caption = 'Output gross kilos';
            DecimalPlaces = 0 : 5;

        }
        field(50116; "Scrap net kilos"; Decimal)
        {
            Caption = 'Scrap net kilos';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                TestField("Entry Type", "Entry Type"::Output);
                //"Scrap Quantity (Base)" := CalcBaseQty("Scrap Quantity");
            end;
        }
        field(50117; "Scrap gross kilos"; Decimal)
        {
            Caption = 'Scrap gross kilos';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                TestField("Entry Type", "Entry Type"::Output);
                //"Scrap Quantity (Base)" := CalcBaseQty("Scrap Quantity");
            end;
        }
        field(50118; "Output net kilos (Base)"; Decimal)
        {
            Caption = 'Output net kilos (Base)';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                TestField("Qty. per Unit of Measure", 1);
                Validate("Output Quantity", "Output Quantity (Base)");
            end;
        }
        field(50119; "Output gross kilos (Base)"; Decimal)
        {
            Caption = 'Output gross kilos (Base)';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                TestField("Qty. per Unit of Measure", 1);
                Validate("Output Quantity", "Output Quantity (Base)");
            end;
        }
        field(50120; "Scrap net kilos (Base)"; Decimal)
        {
            Caption = 'Scrap net kilos (Base)';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                TestField("Qty. per Unit of Measure", 1);
                Validate("Scrap Quantity", "Scrap Quantity (Base)");
            end;
        }
        field(50121; "Scrap gross kilos (Base)"; Decimal)
        {
            Caption = 'Scrap gross kilos (Base)';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                TestField("Qty. per Unit of Measure", 1);
                Validate("Scrap Quantity", "Scrap Quantity (Base)");
            end;
        }
        field(50140; "No. reparto"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50141; "Linea reparto"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50142; "Ommit position validation"; Boolean)
        {
            Caption = 'Omitir validación de posición';
            DataClassification = ToBeClassified;
        }
        field(50500; "Concepto ajuste"; Code[20])
        {
            TableRelation = "AFIP Interface Register";
        }
        field(50501; "% Ajuste KN"; Decimal)
        {
        }
        field(50502; "% Ajuste KB"; Decimal)
        {
        }
        field(50503; "Lote origen"; Code[10])
        {

        }
        field(50504; "% IVA"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50505; "Cód. área impuesto"; Code[20])
        {
            TableRelation = Area;
        }
        field(50506; "Cód. grupo impuesto"; Code[10])
        {
            TableRelation = Area;
        }
        field(50507; "Cód. retención IVA"; Code[20])
        {
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER(IVA));
        }
        field(50508; "Cód. retención SS"; Code[20])
        {
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER("Ingresos Brutos"));
        }
        field(50509; "Cód. retención ganancias"; Code[20])
        {
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER(Ganancias));
        }
        field(50510; Factura; Boolean)
        {
        }
        field(50511; "Lote origen destino"; Code[10])
        {
        }
        field(50512; "GS1.128"; Text[250])
        {
        }
        field(50513; "Barcode 1"; BLOB)
        {
        }
        field(50514; "Barcode 2"; BLOB)
        {
        }
        field(50515; "Barcode 3"; BLOB)
        {
        }
        field(50516; "Ubicación"; Code[10])
        {
        }
        field(50517; "Ubicación destino"; Code[10])
        {
        }
        field(50518; "Consumir autom??ticamente"; Boolean)
        {
        }
        field(50519; Revertido; Boolean)
        {
        }
        field(50525; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';


        }
        field(50526; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
                if "Entry Type" = "Entry Type"::Transfer then
                    Validate("New shortcut Dimension 4 Code", "Shortcut Dimension 4 Code");
            end;
        }
        field(50527; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 1 Code';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
                if "Entry Type" = "Entry Type"::Transfer then
                    Validate("New shortcut Dimension 5 Code", "Shortcut Dimension 5 Code");
            end;
        }
        field(50528; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 2 Code';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
                if "Entry Type" = "Entry Type"::Transfer then
                    Validate("New shortcut Dimension 6 Code", "Shortcut Dimension 6 Code");
            end;
        }
        field(50529; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 1 Code';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Shortcut Dimension 7 Code");
                if "Entry Type" = "Entry Type"::Transfer then
                    Validate("New shortcut Dimension 7 Code", "Shortcut Dimension 7 Code");
            end;
        }
        field(50530; "New shortcut Dimension 3 Code"; Code[20])
        {
        }
        field(50531; "New shortcut Dimension 4 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';


            trigger OnValidate()
            begin
                ValidateNewShortcutDimCode(4, "New shortcut Dimension 4 Code");
            end;
        }
        field(50532; "New shortcut Dimension 5 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';


            trigger OnValidate()
            begin
                ValidateNewShortcutDimCode(5, "New shortcut Dimension 5 Code");
            end;
        }
        field(50533; "New shortcut Dimension 6 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';


            trigger OnValidate()
            begin
                ValidateNewShortcutDimCode(6, "New shortcut Dimension 6 Code");
            end;
        }
        field(50534; "New shortcut Dimension 7 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';


            trigger OnValidate()
            begin
                ValidateNewShortcutDimCode(7, "New shortcut Dimension 7 Code");
            end;
        }
        field(50535; "Net kilos per UOM"; Decimal)
        {
            Caption = 'Net kilos per UOM';
        }
        field(50536; "Gross kilos per UOM"; Decimal)
        {
            Caption = 'Gross kilos per UOM';
        }
        field(50542; "Additional-Currency Posting"; Option)
        {
            Caption = 'Additional-Currency Posting';
            DataClassification = ToBeClassified;
            OptionCaption = 'None,Amount Only,Additional-Currency Amount Only';
            OptionMembers = "None","Amount Only","Additional-Currency Amount Only";
        }
        field(50598; Usuario; Code[20])
        {
        }
        field(50599; Regenerado; Boolean)
        {
        }
        field(50700; "No. Remito"; Code[30])
        {
            Caption = 'No. Remito';
            Description = 'No. remito';
        }
        field(50701; "No. Despacho"; Code[20])
        {
            Caption = 'No. Despacho';
            Description = 'No. Despacho importación';
        }
    }


    //Unsupported feature: Code Insertion (VariableCollection) on "OnDelete".

    //trigger (Variable: rst336)()
    //Parameters and return type have not been exported.
    //begin
    /*
    */
    //end;


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    LockTable;
    ItemJnlTemplate.Get("Journal Template Name");
    ItemJnlBatch.Get("Journal Template Name","Journal Batch Name");

    ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
    ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
    ValidateNewShortcutDimCode(1,"New Shortcut Dimension 1 Code");
    ValidateNewShortcutDimCode(2,"New Shortcut Dimension 2 Code");

    CheckPlanningAssignment;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6
    //++Arbu
    ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
    ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
    ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
    ValidateShortcutDimCode(6,"Shortcut Dimension 6 Code");
    ValidateShortcutDimCode(7,"Shortcut Dimension 7 Code");
    //--Arbu
    ValidateNewShortcutDimCode(1,"New Shortcut Dimension 1 Code");
    ValidateNewShortcutDimCode(2,"New Shortcut Dimension 2 Code");
    //++Arbu
    ValidateNewShortcutDimCode(3,"New shortcut Dimension 3 Code");
    ValidateNewShortcutDimCode(4,"New shortcut Dimension 4 Code");
    ValidateNewShortcutDimCode(5,"New shortcut Dimension 5 Code");
    ValidateNewShortcutDimCode(6,"New shortcut Dimension 6 Code");
    ValidateNewShortcutDimCode(7,"New shortcut Dimension 7 Code");
    //--Arbu

    CheckPlanningAssignment;

    //++Arbu
    if "Lot No." = '' then
      GenLote;
    //--Arbu
    */
    //end;


    //Unsupported feature: Code Modification on "OnModify".

    //trigger OnModify()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    OnBeforeVerifyReservedQty(Rec,xRec,0);
    ReserveItemJnlLine.VerifyChange(Rec,xRec);
    CheckPlanningAssignment;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //++Arbu
    if (Quantity <> xRec.Quantity) or
       ("Net kilos" <> xRec."Net kilos") or
       ("Gross kilos" <> xRec."Gross kilos") or
       ("Shortcut Dimension 1 Code" <> xRec."Shortcut Dimension 1 Code") or
       ("Shortcut Dimension 3 Code" <> xRec."Shortcut Dimension 3 Code") or
       ("No. Pallet" <> xRec."No. Pallet") then
      GenLote();
    //--Arbu
    #1..3
    */
    //end;


    //Unsupported feature: Code Modification on "CalcBaseTime(PROCEDURE 28)".

    //procedure CalcBaseTime();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if "Run Time" <> 0 then
      TestField("Qty. per Cap. Unit of Measure");
    exit(Round(Qty * "Qty. per Cap. Unit of Measure",UOMMgt.TimeRndPrecision));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if "Run Time" <> 0 then
      TestField("Qty. per Cap. Unit of Measure");
    //EXIT(ROUND(Qty * "Qty. per Cap. Unit of Measure",UOMMgt.TimeRndPrecision));
    */
    //end;


    //Unsupported feature: Code Modification on "CheckItemAvailable(PROCEDURE 1)".

    //procedure CheckItemAvailable();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if (CurrFieldNo = 0) or (CurrFieldNo <> CalledByFieldNo) then // Prevent two checks on quantity
      exit;

    IsHandled := false;
    OnBeforeCheckItemAvailable(Rec,CalledByFieldNo,IsHandled);
    if IsHandled then
      exit;

    if (CurrFieldNo <> 0) and ("Item No." <> '') and (Quantity <> 0) and
       ("Value Entry Type" = "Value Entry Type"::"Direct Cost") and ("Item Charge No." = '')
    then
      if ItemCheckAvail.ItemJnlCheckLine(Rec) then
        ItemCheckAvail.RaiseUpdateInterruptedError;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..7
    //++Arbu
    ItemCheckAvail.fntLote("Lot No.");
    //--Arbu
    #9..13
    */
    //end;


    //Unsupported feature: Code Modification on "PickDimension(PROCEDURE 48)".

    //procedure PickDimension();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SourceCode := "Source Code";
    if SourceCode = '' then
      if ItemJournalTemplate.Get("Journal Template Name") then
        SourceCode := ItemJournalTemplate."Source Code";

    "Shortcut Dimension 1 Code" := '';
    "Shortcut Dimension 2 Code" := '';
    "Dimension Set ID" :=
      DimMgt.GetRecDefaultDimID(
        Rec,CurrFieldNo,TableArray,CodeArray,SourceCode,
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",InheritFromDimSetID,InheritFromTableNo);
    DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");

    if "Entry Type" = "Entry Type"::Transfer then begin
      "New Dimension Set ID" := "Dimension Set ID";
      "New Shortcut Dimension 1 Code" := "Shortcut Dimension 1 Code";
      "New Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..7
    //++Arbu
    "Shortcut Dimension 3 Code" := '';
    "Shortcut Dimension 4 Code" := '';
    "Shortcut Dimension 5 Code" := '';
    "Shortcut Dimension 6 Code" := '';
    "Shortcut Dimension 7 Code" := '';
    //--Arbu
    #8..10
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++Arbu
        "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
        "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
        "Shortcut Dimension 7 Code",
        //--Arbu
        InheritFromDimSetID,InheritFromTableNo);
    DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
    //++Arbu
    "Shortcut Dimension 3 Code",
    "Shortcut Dimension 4 Code",
    "Shortcut Dimension 5 Code",
    "Shortcut Dimension 6 Code",
    "Shortcut Dimension 7 Code");
    //--Arbu
    #13..17
      //++Arbu
      "New shortcut Dimension 3 Code" := "Shortcut Dimension 3 Code";
      "New shortcut Dimension 4 Code" := "Shortcut Dimension 4 Code";
      "New shortcut Dimension 5 Code" := "Shortcut Dimension 5 Code";
      "New shortcut Dimension 6 Code" := "Shortcut Dimension 6 Code";
      "New shortcut Dimension 7 Code" := "Shortcut Dimension 7 Code";
      //--Arbu
    end;
    */
    //end;


    //Unsupported feature: Code Modification on "CopyDim(PROCEDURE 46)".

    //procedure CopyDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ReadGLSetup;
    "Dimension Set ID" := DimesionSetID;
    DimSetEntry.SetRange("Dimension Set ID",DimesionSetID);
    #4..10
      "Shortcut Dimension 2 Code" := DimSetEntry."Dimension Value Code"
    else
      "Shortcut Dimension 2 Code" := '';
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..13
    //++Arbu
    DimSetEntry.SetRange("Dimension Code",GLSetup."Global Dimension 3 Code");
    if DimSetEntry.FindFirst then
      "Shortcut Dimension 3 Code" := DimSetEntry."Dimension Value Code"
    else
      "Shortcut Dimension 3 Code" := '';
    DimSetEntry.SetRange("Dimension Code",GLSetup."Global Dimension 4 Code");
    if DimSetEntry.FindFirst then
      "Shortcut Dimension 4 Code" := DimSetEntry."Dimension Value Code"
    else
      "Shortcut Dimension 4 Code" := '';
    DimSetEntry.SetRange("Dimension Code",GLSetup."Global Dimension 5 Code");
    if DimSetEntry.FindFirst then
      "Shortcut Dimension 5 Code" := DimSetEntry."Dimension Value Code"
    else
      "Shortcut Dimension 5 Code" := '';
    DimSetEntry.SetRange("Dimension Code",GLSetup."Global Dimension 6 Code");
    if DimSetEntry.FindFirst then
      "Shortcut Dimension 6 Code" := DimSetEntry."Dimension Value Code"
    else
      "Shortcut Dimension 6 Code" := '';
    DimSetEntry.SetRange("Dimension Code",GLSetup."Global Dimension 7 Code");
    if DimSetEntry.FindFirst then
      "Shortcut Dimension 7 Code" := DimSetEntry."Dimension Value Code"
    else
      "Shortcut Dimension 7 Code" := '';
    //--Arbu
    */
    //end;


    //Unsupported feature: Code Modification on "CreateProdDim(PROCEDURE 25)".

    //procedure CreateProdDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Shortcut Dimension 1 Code" := '';
    "Shortcut Dimension 2 Code" := '';
    "Dimension Set ID" := 0;
    if ("Order Type" <> "Order Type"::Production) or ("Order No." = '') then
      exit;
    #6..17
    end;

    OnCreateProdDimOnAfterCreateDimSetIDArr(Rec,DimSetIDArr,i);
    "Dimension Set ID" := DimMgt.GetCombinedDimensionSetID(DimSetIDArr,"Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    "Shortcut Dimension 1 Code" := '';
    "Shortcut Dimension 2 Code" := '';
    //++Arbu
    "Shortcut Dimension 3 Code" := '';
    "Shortcut Dimension 4 Code" := '';
    "Shortcut Dimension 5 Code" := '';
    "Shortcut Dimension 6 Code" := '';
    "Shortcut Dimension 7 Code" := '';
    //--Arbu

    #3..20
    "Dimension Set ID" := DimMgt.GetCombinedDimensionSetID(DimSetIDArr,"Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++Arbu
        "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
        "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
        "Shortcut Dimension 7 Code");
        //--Arbu
    */
    //end;


    //Unsupported feature: Code Modification on "CreateAssemblyDim(PROCEDURE 42)".

    //procedure CreateAssemblyDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Shortcut Dimension 1 Code" := '';
    "Shortcut Dimension 2 Code" := '';
    "Dimension Set ID" := 0;
    if ("Order Type" <> "Order Type"::Assembly) or ("Order No." = '') then
      exit;
    #6..12
    end;

    OnCreateAssemblyDimOnAfterCreateDimSetIDArr(Rec,DimSetIDArr,i);
    "Dimension Set ID" := DimMgt.GetCombinedDimensionSetID(DimSetIDArr,"Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    "Shortcut Dimension 1 Code" := '';
    "Shortcut Dimension 2 Code" := '';
    //++Arbu
    "Shortcut Dimension 3 Code" := '';
    "Shortcut Dimension 4 Code" := '';
    "Shortcut Dimension 5 Code" := '';
    "Shortcut Dimension 6 Code" := '';
    "Shortcut Dimension 7 Code" := '';
    //--Arbu
    #3..15
    "Dimension Set ID" := DimMgt.GetCombinedDimensionSetID(DimSetIDArr,"Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
      //++Arbu
      "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
      "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
      "Shortcut Dimension 7 Code");
      //--Arbu
    */
    //end;


    //Unsupported feature: Code Modification on "ShowDimensions(PROCEDURE 41)".

    //procedure ShowDimensions();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Dimension Set ID" :=
      DimMgt.EditDimensionSet2(
        "Dimension Set ID",StrSubstNo('%1 %2 %3',"Journal Template Name","Journal Batch Name","Line No."),
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++Arbu
        "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
        "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
        "Shortcut Dimension 7 Code"
        //--Arbu
        );
    */
    //end;


    //Unsupported feature: Code Modification on "ShowReclasDimensions(PROCEDURE 30)".

    //procedure ShowReclasDimensions();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DimMgt.EditReclasDimensionSet2(
      "Dimension Set ID","New Dimension Set ID",StrSubstNo('%1 %2 %3',"Journal Template Name","Journal Batch Name","Line No."),
      "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code","New Shortcut Dimension 1 Code","New Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    DimMgt.EditReclasDimensionSet2(
      "Dimension Set ID","New Dimension Set ID",StrSubstNo('%1 %2 %3',"Journal Template Name","Journal Batch Name","Line No."),
      "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
      //++Arbu
      "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code","Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
      "Shortcut Dimension 7 Code","New Shortcut Dimension 1 Code","New Shortcut Dimension 2 Code",
      "New shortcut Dimension 3 Code","New shortcut Dimension 4 Code","New shortcut Dimension 5 Code","New shortcut Dimension 6 Code",
      "New shortcut Dimension 7 Code"
      //--Arbu
      );
    */
    //end;

    procedure "-----ARBUMASA---"()
    begin
    end;

    local procedure SelectMovProd(NoCampoActual: Integer)
    begin
        rstMovProducto.SetCurrentKey(rstMovProducto."Location Code", rstMovProducto."Lot No.", rstMovProducto."Entry/Exit Point",
                                     rstMovProducto."Item No.", rstMovProducto.Open, rstMovProducto."Nombre seccion diario",
                                     rstMovProducto."Item type", rstMovProducto."Posting Date");
        rstMovProducto.SetRange(rstMovProducto."Item No.", "Item No.");
        if "Location Code" <> '' then
            rstMovProducto.SetRange("Location Code", "Location Code");
        rstMovProducto.SetRange(Open, true);
        if Quantity <> 0 then begin
            if "Entry Type" in ["Entry Type"::Sale, "Entry Type"::"Negative Adjmt.", "Entry Type"::Transfer] then
                rstMovProducto.SetRange(Positive, Quantity > 0)
            else
                rstMovProducto.SetRange(Positive, Quantity < 0);
        end;
        if PAGE.RunModal(PAGE::"Item Ledger Entries", rstMovProducto) = ACTION::LookupOK
        then begin
            "Location Code" := rstMovProducto."Location Code";
            "Serial No." := rstMovProducto."Serial No.";
            "Lot No." := rstMovProducto."Lot No.";
            "Bin Code" := rstMovProducto."Bin code";

            //IBdos Argentina - USS - 021202 - Inicio Modificación Arbumasa
            //Traigo el Nº pallet, los niveles y el peso en kilos brutos del lote origen

            if rstMovProducto."Global Dimension 1 Code" <> '' then
                Validate("Shortcut Dimension 1 Code", rstMovProducto."Global Dimension 1 Code");
            if rstMovProducto."Global Dimension 2 Code" <> '' then
                Validate("Shortcut Dimension 2 Code", rstMovProducto."Global Dimension 2 Code");
            if rstMovProducto."Shortcut dimension 3 Code" <> '' then
                Validate("Shortcut Dimension 3 Code", rstMovProducto."Shortcut dimension 3 Code");
            if rstMovProducto."Shortcut Dimension 4 Code" <> '' then
                Validate("Shortcut Dimension 4 Code", rstMovProducto."Shortcut Dimension 4 Code");
            if rstMovProducto."Shortcut Dimension 5 Code" <> '' then
                Validate("Shortcut Dimension 5 Code", rstMovProducto."Shortcut Dimension 5 Code");
            if rstMovProducto."Shortcut dimension 6 Code" <> '' then
                Validate("Shortcut Dimension 6 Code", rstMovProducto."Shortcut dimension 6 Code");
            if rstMovProducto."Shortcut Dimension 7 Code" <> '' then
                Validate("Shortcut Dimension 7 Code", rstMovProducto."Shortcut Dimension 7 Code");
            Validate("Job No.", rstMovProducto."Job No.");
            Validate("No. Proyecto", rstMovProducto."No. proyecto");

            "No. Pallet" := rstMovProducto."Pallet no.";
            "Buque Tercero" := rstMovProducto."Buque Tercero";
            "Marea Tercero" := rstMovProducto."Marea Tercero";
            "Entry/Exit Point" := rstMovProducto."Entry/Exit Point";

            //IBdos Argentina - USS - 021202 - Fin Modificación Arbumasa
            //US.ARBU - 2005-02-23 - Inicio modificación para ingresar datos de transferencia
            //US.ARBU - 2005-05-13 - Inicio - Modificación para seguimiento del Lote de origen

            Validate("Lote origen", rstMovProducto."Lote origen");

            if "Entry Type" in ["Entry Type"::Transfer, "Entry Type"::"Negative Adjmt."] then begin

                Validate(Quantity, rstMovProducto."Remaining Quantity");
                Validate("Net kilos", rstMovProducto."Remaining net kilos");
                Validate("Gross kilos", rstMovProducto."Remaining gross kilos");

                if "Entry Type" = "Entry Type"::Transfer then begin

                    Validate("New Lot No.", "Lot No.");
                    if rstMovProducto."Global Dimension 1 Code" <> '' then
                        Validate("New Shortcut Dimension 1 Code", rstMovProducto."Global Dimension 1 Code");
                    if rstMovProducto."Global Dimension 2 Code" <> '' then
                        Validate("New Shortcut Dimension 2 Code", rstMovProducto."Global Dimension 2 Code");
                    if rstMovProducto."Shortcut dimension 3 Code" <> '' then
                        Validate("New shortcut Dimension 3 Code", rstMovProducto."Shortcut dimension 3 Code");
                    if rstMovProducto."Shortcut Dimension 4 Code" <> '' then
                        Validate("New shortcut Dimension 4 Code", rstMovProducto."Shortcut Dimension 4 Code");
                    if rstMovProducto."Shortcut Dimension 5 Code" <> '' then
                        Validate("New shortcut Dimension 5 Code", rstMovProducto."Shortcut Dimension 5 Code");
                    if rstMovProducto."Shortcut dimension 6 Code" <> '' then
                        Validate("New shortcut Dimension 6 Code", rstMovProducto."Shortcut dimension 6 Code");
                    if rstMovProducto."Shortcut Dimension 7 Code" <> '' then
                        Validate("New shortcut Dimension 7 Code", rstMovProducto."Shortcut Dimension 7 Code");
                    Validate("Job No.", rstMovProducto."Job No.");
                    Validate("No. Proyecto", rstMovProducto."No. proyecto");

                    "No. Pallet" := rstMovProducto."Pallet no.";
                    "Buque Tercero" := rstMovProducto."Buque Tercero";
                    "Marea Tercero" := rstMovProducto."Marea Tercero";
                    "Entry/Exit Point" := rstMovProducto."Entry/Exit Point";
                    "Lote origen destino" := rstMovProducto."Lote origen";

                end;

            end;

            //US.ARBU - 2005-05-13 - Fin - Modificación para seguimiento del Lote de origen
            //US.ARBU - 2005-02-23 - Fin modificación para ingresar datos de transferencia
            //IBdos Argentina - USS - 280503 - Fin Modificación Arbumasa
            Commit;
            TestDispoProducto(NoCampoActual);
        end;


        //IBdos Argentina - USS - 260503 - Inicio Modificación Arbumasa
        //Lote a destino

        /*IF "Entry type" = "Entry type"::Transfer THEN
          VALIDATE("Nuevo nº lote","Nº lote");
        */
        //IBdos Argentina - USS - 260503 - Fin Modificación Arbumasa

    end;

    local procedure TestDispoProducto(NoCampoActual: Integer)
    begin
        if (CurrFieldNo <> 0) and ("Item No." <> '') and (Quantity <> 0) then
            CheckItemAvailable(NoCampoActual);
    end;

    procedure FunCalcPesoNeto(VarCantidad: Decimal; VarProducto: Code[20]; VarQ: Decimal): Decimal
    var
        PunProducto: Record Item;
    begin
        PunProducto.Reset;
        PunProducto.Get(VarProducto);
        exit(VarCantidad * PunProducto."Net Weight" * VarQ);
    end;

    procedure FunCalcPesoBruto(VarCantidad: Decimal; VarProducto: Code[20]; VarQ: Decimal): Decimal
    var
        PunProducto: Record Item;
    begin
        PunProducto.Reset;
        PunProducto.Get(VarProducto);
        exit(VarCantidad * PunProducto."Gross Weight" * VarQ);
    end;

    procedure "fntGenerarGS1.128"()
    var
        AI_SSCC: Label '00';
        AI_GTIN: Label '02';
        AI_LOTE: Label '10';
        AI_GLN: Label '414';
        AI_KN: Label '330X';
        AI_KB: Label '330Y';
        AI_QT: Label '37';
    begin
        Clear(rstUMP);
        if rstUMP.Get("Item No.", "Unit of Measure Code") then;
        if rstDepto.Get("Shortcut Dimension 1 Code") then;
        if ("Posting Date" <> 0D) and ("Shortcut Dimension 1 Code" <> '') and ("Lot No." <> '') and ("Item No." <> '') and
           (Quantity <> 0) and ("Net kilos" <> 0) and ("Gross kilos" <> 0) then
            "GS1.128" := AI_GTIN + rstUMP."EAN-13 code" + AI_LOTE + "Lot No." + AI_GLN + rstDepto."GLN code" + AI_QT + Format(Quantity) +
                         AI_KN + Format("Net kilos") + AI_KB + Format("Gross kilos")
        else
            "GS1.128" := '';
    end;


    local procedure CalcCdadBaseKN(CdadKN: Decimal): Decimal
    begin
        //TESTFIELD("Peso neto");
        exit(Round(CdadKN /** "Cdad. por unidad medida"*/, 0.00001));

    end;

    local procedure CalcCdadBaseKB(CdadKB: Decimal): Decimal
    begin
        //TESTFIELD("Peso bruto");
        exit(Round(CdadKB /** "Cdad. por unidad medida"*/, 0.00001));

    end;


    procedure ApplyMovProd(NoCampoActual: Integer; NroMov: Integer)
    begin
        //IF NoCampoActual = Rec.FIELDNO("Job No.") THEN
        if (NoCampoActual in [Rec.FieldNo("Job No."), Rec.FieldNo("No. Pallet")])
          and ("Entry Type" = "Entry Type"::"Negative Adjmt.") then begin

            Clear(rstMovProducto);
            rstMovProducto.SetCurrentKey(rstMovProducto."Location Code", rstMovProducto."Lot No.", rstMovProducto."Entry/Exit Point",
                                         rstMovProducto."Item No.", rstMovProducto.Open, rstMovProducto."Nombre seccion diario",
                                         rstMovProducto."Item type", rstMovProducto."Posting Date");
            rstMovProducto.SetRange(rstMovProducto."Item No.", "Item No.");
            if "Shortcut Dimension 1 Code" <> '' then
                rstMovProducto.SetRange("Global Dimension 1 Code", "Shortcut Dimension 1 Code");
            if "Shortcut Dimension 2 Code" <> '' then
                rstMovProducto.SetRange("Global dimension 2 Code", "Shortcut Dimension 2 Code");
            if "Location Code" <> '' then
                rstMovProducto.SetRange("Location Code", "Location Code");
            if "No. Pallet" <> '' then
                rstMovProducto.SetRange("Pallet no.", "No. Pallet");
            rstMovProducto.SetRange(Open, true);
            if Quantity <> 0 then begin
                if "Entry Type" in ["Entry Type"::Sale, "Entry Type"::"Negative Adjmt.", "Entry Type"::Transfer] then
                    rstMovProducto.SetRange(Positive, Quantity > 0)
                else
                    rstMovProducto.SetRange(Positive, Quantity < 0);
            end;
            if NroMov <> 0 then begin
                Clear(rstMovProducto);
                rstMovProducto.SetRange("Entry No.", NroMov);
            end;
            if rstMovProducto.FindFirst then begin

                "Location Code" := rstMovProducto."Location Code";
                "Serial No." := rstMovProducto."Serial No.";
                "Lot No." := rstMovProducto."Lot No.";
                "Bin Code" := rstMovProducto."Bin code";


                //IBdos Argentina - USS - 021202 - Inicio Modificación Arbumasa
                //Traigo el Nº pallet, los niveles y el peso en kilos brutos del lote origen

                Validate("Job No.", rstMovProducto."Job No.");
                Validate("No. Proyecto", rstMovProducto."No. proyecto");

                if rstMovProducto."Global Dimension 1 Code" <> '' then
                    Validate("Shortcut Dimension 1 Code", rstMovProducto."Global Dimension 1 Code");
                if rstMovProducto."Global Dimension 2 Code" <> '' then
                    Validate("Shortcut Dimension 2 Code", rstMovProducto."Global Dimension 2 Code");
                if rstMovProducto."Shortcut dimension 3 Code" <> '' then
                    Validate("Shortcut Dimension 3 Code", rstMovProducto."Shortcut dimension 3 Code");
                if rstMovProducto."Shortcut Dimension 4 Code" <> '' then
                    Validate("Shortcut Dimension 4 Code", rstMovProducto."Shortcut Dimension 4 Code");
                if rstMovProducto."Shortcut Dimension 5 Code" <> '' then
                    Validate("Shortcut Dimension 5 Code", rstMovProducto."Shortcut Dimension 5 Code");
                if rstMovProducto."Shortcut dimension 6 Code" <> '' then
                    Validate("Shortcut Dimension 6 Code", rstMovProducto."Shortcut dimension 6 Code");
                if rstMovProducto."Shortcut Dimension 7 Code" <> '' then
                    Validate("Shortcut Dimension 7 Code", rstMovProducto."Shortcut Dimension 7 Code");

                "No. Pallet" := rstMovProducto."Pallet no.";
                "Buque Tercero" := rstMovProducto."Buque Tercero";
                "Marea Tercero" := rstMovProducto."Marea Tercero";
                "Entry/Exit Point" := rstMovProducto."Entry/Exit Point";

                //IBdos Argentina - USS - 021202 - Fin Modificación Arbumasa
                //US.ARBU - 2005-02-23 - Inicio modificación para ingresar datos de transferencia
                //US.ARBU - 2005-05-13 - Inicio - Modificación para seguimiento del Lote de origen

                Validate("Lote origen", rstMovProducto."Lote origen");

                if "Entry Type" in ["Entry Type"::Transfer, "Entry Type"::"Negative Adjmt."] then begin

                    Validate(Quantity, rstMovProducto."Remaining Quantity");
                    Validate("Net kilos", rstMovProducto."Remaining net kilos");
                    Validate("Gross kilos", rstMovProducto."Remaining gross kilos");

                    if "Entry Type" = "Entry Type"::Transfer then begin

                        Validate("New Lot No.", "Lot No.");
                        if rstMovProducto."Global Dimension 1 Code" <> '' then
                            Validate("New Shortcut Dimension 1 Code", rstMovProducto."Global Dimension 1 Code");
                        if rstMovProducto."Global Dimension 2 Code" <> '' then
                            Validate("New Shortcut Dimension 2 Code", rstMovProducto."Global Dimension 2 Code");
                        if rstMovProducto."Shortcut dimension 3 Code" <> '' then
                            Validate("New shortcut Dimension 3 Code", rstMovProducto."Shortcut dimension 3 Code");
                        if rstMovProducto."Shortcut Dimension 4 Code" <> '' then
                            Validate("New shortcut Dimension 4 Code", rstMovProducto."Shortcut Dimension 4 Code");
                        if rstMovProducto."Shortcut Dimension 5 Code" <> '' then
                            Validate("New shortcut Dimension 5 Code", rstMovProducto."Shortcut Dimension 5 Code");
                        if rstMovProducto."Shortcut dimension 6 Code" <> '' then
                            Validate("New shortcut Dimension 6 Code", rstMovProducto."Shortcut dimension 6 Code");
                        if rstMovProducto."Shortcut Dimension 7 Code" <> '' then
                            Validate("New shortcut Dimension 7 Code", rstMovProducto."Shortcut Dimension 7 Code");
                        "Lote origen destino" := rstMovProducto."Lote origen";

                    end;

                end;

                //US.ARBU - 2005-05-13 - Fin - Modificación para seguimiento del Lote de origen
                //US.ARBU - 2005-02-23 - Fin modificación para ingresar datos de transferencia
                //IBdos Argentina - USS - 280503 - Fin Modificación Arbumasa
                Commit;
            end
            else
                Error('No se encuentra el pallet %1 para el producto %2', "No. Pallet", "Item No.");

        end;
    end;


    procedure fntFormatVendDoc(var codDoc: Code[20])
    var
        pasa: Boolean;
        primeraparte: Code[50];
        segundaparte: Code[50];
        terceraparte: Code[50];
        posicion: Integer;
        resto: Code[50];
        parte2: Integer;
        parte3: Integer;
        MovProv: Record "Vendor Ledger Entry";
        rstHFactura: Record "Purch. Inv. Header";
        rstCabCompra: Record "Purchase Header";
        rstHNC: Record "Purch. Cr. Memo Hdr.";
        rstConfCompras: Record "Purchases & Payables Setup";
        rstProveedor: Record Vendor;
        rstILE: Record "Item Ledger Entry";
    begin
        //US.ARBU - 20050407 - Inicio - Si el proveedor es nacional, que verifique el formato del NŽ© de factura

        Clear(rstConfCompras);
        Clear(rstProveedor);

        rstConfCompras.Get();

        pasa := false;
        posicion := StrPos(codDoc, '-');
        if posicion = 0 then
            if Confirm('Factura no corresponde al formato LNNNN-NNNNNNNN.\ Desea continuar?') then
                pasa := true
            else
                Error('Operación cancelada');

        if not pasa then begin

            primeraparte := CopyStr(codDoc, 1, 1);
            resto := CopyStr(codDoc, 2, StrLen(codDoc));
            segundaparte := CopyStr(resto, 1, (posicion - 2));
            resto := CopyStr(resto, (posicion), (StrLen(resto)));
            terceraparte := resto;

        end;

        // Comprobamos que el primer caracter es una letra
        if (primeraparte < 'A') or (primeraparte > 'Z') then begin
            if not pasa then
                if Confirm('Factura no corresponde al formato LNNNN-NNNNNNNN.\ Desea continuar?') then
                    pasa := true
                else
                    Error('Operación cancelada');
        end;

        // Comprobamos que los cuatro siguiente caracteres son numÔÇÜricos y rellenamos con 0 hasta el cuarto
        if not (Evaluate(parte2, segundaparte)) then begin
            if not pasa then
                if Confirm('Factura no corresponde al formato LNNNN-NNNNNNNN.\ Desea continuar?') then
                    pasa := true
                else
                    Error('Operación cancelada');
        end
        else begin
            if not pasa then begin
                if StrLen(segundaparte) = 1 then
                    segundaparte := '000' + segundaparte
                else
                    if StrLen(segundaparte) = 2 then
                        segundaparte := '00' + segundaparte
                    else
                        if StrLen(segundaparte) = 3 then
                            segundaparte := '0' + segundaparte;
            end;
        end;

        // Comprobamos que los 8 siguientes caracteres al - son numÔÇÜricos y rellenamos con 0 hasta el octavo
        if not (Evaluate(parte3, terceraparte)) then begin
            if not pasa then
                if Confirm('Factura no corresponde al formato LNNNN-NNNNNNNN.\ Desea continuar?') then
                    pasa := true
                else
                    Error('Operación cancelada');
        end
        else begin
            if StrLen(terceraparte) = 1 then
                terceraparte := '0000000' + terceraparte
            else
                if StrLen(terceraparte) = 2 then
                    terceraparte := '000000' + terceraparte
                else
                    if StrLen(terceraparte) = 3 then
                        terceraparte := '00000' + terceraparte
                    else
                        if StrLen(terceraparte) = 4 then
                            terceraparte := '0000' + terceraparte
                        else
                            if StrLen(terceraparte) = 5 then
                                terceraparte := '000' + terceraparte
                            else
                                if StrLen(terceraparte) = 6 then
                                    terceraparte := '00' + terceraparte
                                else
                                    if StrLen(terceraparte) = 7 then
                                        terceraparte := '0' + terceraparte
        end;
        // formamos el campo con todas las partes

        if not pasa then
            codDoc := primeraparte + segundaparte + '-' + terceraparte;

        if (codDoc <> '') and ("Document Type" = "Document Type"::"Purchase Receipt") then begin

            Clear(rstILE);
            rstILE.SetRange("External Document No.", "External Document No.");
            if rstILE.FindFirst then
                Error('Ya existen registros para el documento %1', "External Document No.");

        end;
    end;

    var
        rst336: Record "Tracking Specification";
        rst337: Record "Reservation Entry";


    //Unsupported feature: Property Modification (TextConstString) on "Text006(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text006 : ENU=You must not enter %1 in a revaluation sum line.;ESP=No debe introducir %1 en una lín. acum. de revaloriz.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text006 : ENU=You must not enter %1 in a revaluation sum line.;ESP=No debe introducir %1 en una lín. acum. de revaloriz.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "UpdateInterruptedErr(Variable 1045)".

    //var
    //>>>> ORIGINAL VALUE:
    //UpdateInterruptedErr : ENU=The update has been interrupted to respect the warning.;ESP=Se ha interrumpido la actualización para respetar la advertencia.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UpdateInterruptedErr : ENU=The update has been interrupted to respect the warning.;ESP=Se ha interrumpido la actualización para respetar la advertencia.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text021(Variable 1051)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text021 : ENU=The entered bin code %1 is different from the bin code %2 in production order component %3.\\Are you sure that you want to post the consumption from bin code %1?;ESP=El código de ubicación %1 indicado es diferente del código de ubicación %2 del componente de orden de producción %3.\\¿Está seguro de que desea registrar el consumo del código de ubicación %1?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text021 : ENU=The entered bin code %1 is different from the bin code %2 in production order component %3.\\Are you sure that you want to post the consumption from bin code %1?;ESP=El código de ubicación %1 indicado es diferente del código de ubicación %2 del componente de orden de producción %3.\\?está seguro de que desea registrar el consumo del código de ubicación %1?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text031(Variable 1043)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text031 : ENU=You can not insert item number %1 because it is not produced on released production order %2.;ESP=No puede insertar el producto número %1, no está incluido en la orden de producción lanzada %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text031 : ENU=You can not insert item number %1 because it is not produced on released production order %2.;ESP=No puede insertar el producto número %1, no está incluido en la orden de producción lanzada %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text032(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text032 : ENU=When posting, the entry %1 will be opened first.;ESP=Al registrar el movimiento, %1 se abrirá primero.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text032 : ENU=When posting, the entry %1 will be opened first.;ESP=Al registrar el movimiento, %1 se abrirá primero.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text033(Variable 1049)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text033 : ENU=If the item carries serial or lot numbers, then you must use the %1 field in the %2 window.;ESP=Si el producto tiene números de serie o lote, debe usar el campo %1 de la ventana %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text033 : ENU=If the item carries serial or lot numbers, then you must use the %1 field in the %2 window.;ESP=Si el producto tiene números de serie o lote, debe usar el campo %1 de la ventana %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "RevaluationPerEntryNotAllowedErr(Variable 1050)".

    //var
    //>>>> ORIGINAL VALUE:
    //RevaluationPerEntryNotAllowedErr : ENU=This item has already been revalued with the Calculate Inventory Value function, so you cannot use the Applies-to Entry field as that may change the valuation.;ESP=Este producto ya se ha revalorizado con la función Calcular valor inventario, por lo que no puede usar el campo Liq. por n.º orden ya que eso puede cambiar la valoración.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RevaluationPerEntryNotAllowedErr : ENU=This item has already been revalued with the Calculate Inventory Value function, so you cannot use the Applies-to Entry field as that may change the valuation.;ESP=Este producto ya se ha revalorizado con la función Calcular valor inventario, por lo que no puede usar el campo Liq. por no. orden ya que eso puede cambiar la valoración.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "SubcontractedErr(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //SubcontractedErr : @@@=%1 - Field Caption, %2 - Line No.;ENU=%1 must be zero in line number %2 because it is linked to the subcontracted work center.;ESP=%1 debe ser cero en el número de línea %2 porque está vinculado al centro de trabajo subcontratado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SubcontractedErr : @@@=%1 - Field Caption, %2 - Line No.;ENU=%1 must be zero in line number %2 because it is linked to the subcontracted work center.;ESP=%1 debe ser cero en el número de línea %2 porque está vinculado al centro de trabajo subcontratado.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "FinishedOutputQst(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //FinishedOutputQst : ENU=The operation has been finished. Do you want to post output for the finished operation?;ESP=La operación ha finalizado. ¿Desea registrar el resultado de la operación finalizada?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //FinishedOutputQst : ENU=The operation has been finished. Do you want to post output for the finished operation?;ESP=La operación ha finalizado. ?Desea registrar el resultado de la operación finalizada?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "SalesBlockedErr(Variable 1011)".

    //var
    //>>>> ORIGINAL VALUE:
    //SalesBlockedErr : ENU=You cannot sell this item because the Sales Blocked check box is selected on the item card.;ESP=No puede vender este producto porque la casilla Ventas bloqueadas está seleccionada en la ficha de producto.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SalesBlockedErr : ENU=You cannot sell this item because the Sales Blocked check box is selected on the item card.;ESP=No puede vender este producto porque la casilla Ventas bloqueadas está seleccionada en la ficha de producto.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "PurchasingBlockedErr(Variable 1013)".

    //var
    //>>>> ORIGINAL VALUE:
    //PurchasingBlockedErr : ENU=You cannot purchase this item because the Purchasing Blocked check box is selected on the item card.;ESP=No puede comprar este producto porque la casilla Compras bloqueadas está seleccionada en la ficha de producto.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PurchasingBlockedErr : ENU=You cannot purchase this item because the Purchasing Blocked check box is selected on the item card.;ESP=No puede comprar este producto porque la casilla Compras bloqueadas está seleccionada en la ficha de producto.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "BlockedErr(Variable 1015)".

    //var
    //>>>> ORIGINAL VALUE:
    //BlockedErr : ENU=You cannot purchase this item because the Blocked check box is selected on the item card.;ESP=No puede comprar este producto porque la casilla Bloqueado está seleccionada en la ficha de producto.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //BlockedErr : ENU=You cannot purchase this item because the Blocked check box is selected on the item card.;ESP=No puede comprar este producto porque la casilla Bloqueado está seleccionada en la ficha de producto.;
    //Variable type has not been exported.

    var
        rstUMP: Record "Item Unit of Measure";
        rstDepto: Record Dimension;
        VarPallet: Code[20];
        PunProy: Record Job;
        rstMovProducto: Record "Item Ledger Entry";
        PunProd: Record Item;
        PunExi: Record "Inventory Setup";
        Producto: Record Item;
        "----ARBUMASA---": Integer;

        rstItemTrack: Record "Item Tracking Code";
        cduCreateReservEntry: Codeunit "Create Reserv. Entry";
        rstJob: Record Job;
}

