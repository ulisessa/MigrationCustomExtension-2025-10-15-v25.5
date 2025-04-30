tableextension 50485 tableextension50485 extends "Sales Line"
{
    Caption = 'Sales Line';
    fields
    {
        modify("Sell-to Customer No.")
        {
            Caption = 'Sell-to Customer No.';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Shipment Date")
        {
            Caption = 'Shipment Date';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Description 2")
        {
            Caption = 'Description 2';
        }
        modify("Line Discount %")
        {
            Caption = 'Line Discount %';
        }
        modify("Line Discount Amount")
        {
            Caption = 'Line Discount Amount';
        }
        modify("Appl.-to Item Entry")
        {
            Caption = 'Appl.-to Item Entry';
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        modify("Shortcut Dimension 2 Code")
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        modify("Job No.")
        {
            Caption = 'Job No.';
        }
        modify("Work Type Code")
        {
            Caption = 'Work Type Code';
        }
        modify("Shipment No.")
        {
            Caption = 'Shipment No.';
        }
        modify("Shipment Line No.")
        {
            Caption = 'Shipment Line No.';
        }
        modify("Profit %")
        {
            Caption = 'Profit %';
        }
        modify("Bill-to Customer No.")
        {
            Caption = 'Bill-to Customer No.';
        }
        modify("Purchase Order No.")
        {
            Caption = 'Purchase Order No.';
        }
        modify("Purch. Order Line No.")
        {
            Caption = 'Purch. Order Line No.';
        }
        modify("Drop Shipment")
        {
            Caption = 'Drop Shipment';
        }
        modify("VAT Calculation Type")
        {
            Caption = 'VAT Calculation Type';
        }
        modify("Transaction Type")
        {
            Caption = 'Transaction Type';
        }
        modify("Attached to Line No.")
        {
            Caption = 'Attached to Line No.';
        }
        modify("Area")
        {
            Caption = 'Area';
        }
        modify("Transaction Specification")
        {
            Caption = 'Transaction Specification';
        }
        modify("Tax Category")
        {
            Caption = 'Tax Category';
        }
        modify("Tax Area Code")
        {
            Caption = 'Tax Area Code';
        }
        modify("Tax Group Code")
        {
            Caption = 'Tax Group Code';
        }
        modify("VAT Clause Code")
        {
            Caption = 'VAT Clause Code';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("Blanket Order No.")
        {
            Caption = 'Blanket Order No.';
        }
        modify("Blanket Order Line No.")
        {
            Caption = 'Blanket Order Line No.';
        }
        modify("System-Created Entry")
        {
            Caption = 'System-Created Entry';
        }
        modify("Line Amount")
        {
            Caption = 'Line Amount';
        }
        modify("Prepmt. Line Amount")
        {
            Caption = 'Prepmt. Line Amount';
        }
        modify("Prepayment Tax Area Code")
        {
            Caption = 'Prepayment Tax Area Code';
        }
        modify("Prepayment Tax Group Code")
        {
            Caption = 'Prepayment Tax Group Code';
        }
        modify("Prepayment Line")
        {
            Caption = 'Prepayment Line';
        }
        modify("IC Partner Code")
        {
            Caption = 'IC Partner Code';
        }
        modify("Line Discount Calculation")
        {
            Caption = 'Line Discount Calculation';
        }
        modify("ATO Whse. Outstanding Qty.")
        {
            Caption = 'ATO Whse. Outstanding Qty.';
        }
        modify("Job Task No.")
        {
            Caption = 'Job Task No.';
        }
        modify("Job Contract Entry No.")
        {
            Caption = 'Job Contract Entry No.';
        }
        modify("Deferral Code")
        {
            Caption = 'Deferral Code';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Bin Code")
        {
            Caption = 'Bin Code';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Depreciation Book Code")
        {
            Caption = 'Depreciation Book Code';
        }
        modify("Substitution Available")
        {
            Caption = 'Substitution Available';
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
        modify("Special Order Purchase No.")
        {
            Caption = 'Special Order Purchase No.';
        }
        modify("Special Order Purch. Line No.")
        {
            Caption = 'Special Order Purch. Line No.';
        }
        modify("Whse. Outstanding Qty.")
        {
            Caption = 'Whse. Outstanding Qty.';
        }
        modify("Whse. Outstanding Qty. (Base)")
        {
            Caption = 'Whse. Outstanding Qty. (Base)';
        }
        modify("Shipping Time")
        {
            Caption = 'Shipping Time';
        }
        modify("Planned Shipment Date")
        {
            Caption = 'Planned Shipment Date';
        }
        modify("Shipping Agent Code")
        {
            Caption = 'Shipping Agent Code';
        }
        modify("Shipping Agent Service Code")
        {
            Caption = 'Shipping Agent Service Code';
        }
        modify("BOM Item No.")
        {
            Caption = 'BOM Item No.';
        }
        modify("Return Receipt No.")
        {
            Caption = 'Return Receipt No.';
        }
        modify("Return Receipt Line No.")
        {
            Caption = 'Return Receipt Line No.';
        }
        modify("Return Reason Code")
        {
            Caption = 'Return Reason Code';
        }
        modify("Allow Line Disc.")
        {
            Caption = 'Allow Line Disc.';
        }
        modify("Price description")
        {
            Caption = 'Price description';
        }

        //Unsupported feature: Code Modification on ""No."(Field 6).OnValidate".

        //trigger "(Field 6)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GetSalesSetup;

        "No." := FindOrCreateRecordByNo("No.");
        #4..47
        GetSalesHeader;
        InitHeaderDefaults(SalesHeader);
        OnValidateNoOnAfterInitHeaderDefaults(SalesHeader,TempSalesLine);

        CalcFields("Substitution Available");

        "Promised Delivery Date" := SalesHeader."Promised Delivery Date";
        #55..127
        end;

        UpdateItemCrossRef;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..50
        Clear(rstCliente);
        if rstCliente.Get(SalesHeader."Bill-to Customer No.") then;

        if rstCliente."Cód. percepción IIBB"<> '' then
          "Cód. ingresos brutos" := rstCliente."Cód. percepción IIBB";
        #52..130
        */
        //end;


        //Unsupported feature: Code Modification on ""Location Code"(Field 7).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestJobPlanningLine;
        TestStatusOpen;
        CheckAssocPurchOrder(FieldCaption("Location Code"));
        #4..56

        UpdateDates;

        if (Type = Type::Item) and ("No." <> '') then
          GetUnitCost;

        CheckWMS;

        if "Document Type" = "Document Type"::"Return Order" then
          ValidateReturnReasonCode(FieldNo("Location Code"));
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..59
        //++Migración Arbumasa 2009

        Clear(Location);
        if Location.Get("Location Code") then
        begin

          Validate("Bin Code",Location."Default bin");

        end;

        //--Migración Arbumasa 2009

        #60..66
        */
        //end;


        //Unsupported feature: Code Modification on "Description(Field 11).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if Type = Type::" " then
          exit;

        #4..53
            IsHandled := false;
            OnBeforeFindNoByDescription(Rec,xRec,CurrFieldNo,IsHandled);
            if not IsHandled then begin
              ReturnValue := FindRecordMgt.FindNoByDescription(Type,Description,true);
              if ReturnValue <> '' then begin
                CurrFieldNo := FieldNo("No.");
                Validate("No.",CopyStr(ReturnValue,1,MaxStrLen("No.")));
        #61..70
               ["Document Type"::Order,"Document Type"::Invoice,"Document Type"::Quote,"Document Type"::"Credit Memo"]
            then
              Error(CannotFindDescErr,Type,Description);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..56
              //ReturnValue := FindRecordMgt.FindNoByDescription(Type,Description,TRUE);
        #58..73
        */
        //end;


        //Unsupported feature: Code Modification on "Quantity(Field 15).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestJobPlanningLine;
        TestStatusOpen;

        #4..55
        if (Quantity * xRec.Quantity < 0) or (Quantity = 0) then
          InitItemAppl(false);

        if Type = Type::Item then begin
          UpdateUnitPrice(FieldNo(Quantity));
          if (xRec.Quantity <> Quantity) or (xRec."Quantity (Base)" <> "Quantity (Base)") then begin
        #62..92
        UpdatePlanned;
        if "Document Type" = "Document Type"::"Return Order" then
          ValidateReturnReasonCode(FieldNo(Quantity));
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..58
        //++Migración Arbumasa 2009

        if ((Type = Type::Item) and ("Item Category Code" = 'PESCA')) and ((xRec.Quantity <> 0) and (xRec.Quantity <> Rec.Quantity)) then
        begin

          Clear(cduProductionFishing);
          "Net kilos per UOM" := cduProductionFishing.fntCalcKilosRatio("No.",xRec.Quantity,xRec."Qty. per Unit of Measure",xRec."Net kilos");
          "Gross kilos per UOM" := cduProductionFishing.fntCalcKilosRatio("No.",xRec.Quantity,xRec."Qty. per Unit of Measure",xRec."Gross kilos");

          "Net kilos" := Round(cduProductionFishing.fntCalcKilosFromRatio("No.",
                  Quantity,"Qty. per Unit of Measure",Rec."Net kilos per UOM"),1);

          "Gross kilos" := Round(cduProductionFishing.fntCalcKilosFromRatio("No.",
                  Quantity,"Qty. per Unit of Measure",Rec."Gross kilos per UOM"),1);

          "Net kilos to Invoice" := Round(cduProductionFishing.fntCalcKilosFromRatio("No.",
                  "Qty. to Invoice","Qty. per Unit of Measure",Rec."Net kilos per UOM"),1);

          "Net kilos to Invoice (Base)" := Round(cduProductionFishing.fntCalcKilosFromRatio("No.",
                  "Qty. to Invoice","Qty. per Unit of Measure",Rec."Net kilos per UOM"),1);

          "Gross kilos to Invoice" := Round(cduProductionFishing.fntCalcKilosFromRatio("No.",
                  "Qty. to Invoice","Qty. per Unit of Measure",Rec."Gross kilos per UOM"),1);

          "Net kilos to Ship" := Round(cduProductionFishing.fntCalcKilosFromRatio("No.",
                  "Qty. to Ship","Qty. per Unit of Measure",Rec."Net kilos per UOM"),1);

          "Net kilos to Ship (Base)" := Round(cduProductionFishing.fntCalcKilosFromRatio("No.",
                  "Qty. to Ship","Qty. per Unit of Measure",Rec."Net kilos per UOM"),1);

          "Gross kilos to Ship" := Round(cduProductionFishing.fntCalcKilosFromRatio("No.",
                  "Qty. to Ship","Qty. per Unit of Measure",Rec."Gross kilos per UOM"),1);

          "Net kilos (Base)" := Round(cduProductionFishing.fntCalcKilosFromRatio("No.",
                  "Quantity (Base)","Qty. per Unit of Measure",Rec."Net kilos per UOM"),1);

          "Gross kilos (Base)" := Round(cduProductionFishing.fntCalcKilosFromRatio("No.",
                  "Quantity (Base)","Qty. per Unit of Measure",Rec."Gross kilos per UOM"),1) ;

          Clear(rstReservEntry);
          rstReservEntry.SetRange("Source ID","Document No.");
          rstReservEntry.SetRange("Source Type",37);
          rstReservEntry.SetRange("Source Subtype",2);
          rstReservEntry.SetRange("Source Batch Name",'');
          rstReservEntry.SetRange("Source Prod. Order Line",0);
          rstReservEntry.SetRange("Source Ref. No.","Line No.");
          rstReservEntry.SetRange("Item No.","No.");
          rstReservEntry.SetRange("Location Code","Location Code");
          rstReservEntry.SetRange("Variant Code",'');
          if rstReservEntry.FindFirst then
          begin

            rstReservEntry."Quantity (Base)" := -"Quantity (Base)";
            rstReservEntry."Qty. to Invoice (Base)" := -"Quantity (Base)";
            rstReservEntry."Qty. to Handle (Base)" := -"Quantity (Base)";
            rstReservEntry."Gross kilos (Base)" := -"Gross kilos";
            rstReservEntry."Gross kilos to Handle (Base)" := -"Gross kilos";
            rstReservEntry."Gross kilos to Invoice (Base)" := -"Gross kilos";
            rstReservEntry."Net kilos (Base)" := -"Net kilos";
            rstReservEntry."Net kilos to Handle (Base)" := -"Net kilos";
            rstReservEntry."Net kilos to Invoice (Base)" := -"Net kilos";
            rstReservEntry.Modify;

          end;

        end;

        GenLote;
        {
        clear(rstReservEntry);
        rstReservEntry.setrange("Source ID","Document No.");
        rstReservEntry.setrange("Source Ref. No.","Line No.");
        If rstReservEntry.find('-') then
        BEGIN

          If rstReservEntry."Quantity (Base)" <> Quantity then
          BEGIN

            rstReservEntry.validate("Quantity (Base)",Quantity);
            rstReservEntry.modify;

          END;

          If rstReservEntry."Net kilos (Base)" <> "Net kilos (base)" then
          BEGIN

            rstReservEntry.validatE("Net kilos (Base)","Net kilos (base)");
            rstReservEntry.modify;

          END;

          If rstReservEntry."Gross kilos (Base)" <> "Gross kilos (base)" then
          BEGIN

            rstReservEntry.validatE("Gross kilos (Base)","Gross kilos (base)");
            rstReservEntry.modify;

          END;

        END;

        clear(rstTrackSpec);
        }

        //ReserveSalesLine.DeleteLine(rec);

        //--Migración Arbumasa 2009

        #59..95
        */
        //end;


        //Unsupported feature: Code Modification on ""Unit Price"(Field 22).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        Validate("Line Discount %");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        Validate("Line Discount %");

        //++Migración Arbumasa 2009

        ImporteenUSD;

        //--Migración Arbumasa 2009
        */
        //end;


        //Unsupported feature: Code Insertion (VariableCollection) on "Amount(Field 29).OnValidate".

        //trigger (Variable: rstCabV)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: Code Modification on "Amount(Field 29).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        Amount := Round(Amount,Currency."Amount Rounding Precision");
        case "VAT Calculation Type" of
          "VAT Calculation Type"::"Normal VAT",
          "VAT Calculation Type"::"Reverse Charge VAT",
        #5..22
                Amount +
                SalesTaxCalculate.CalculateTax(
                  "Tax Area Code","Tax Group Code","Tax Liable",SalesHeader."Posting Date",
                  "VAT Base Amount","Quantity (Base)",SalesHeader."Currency Factor");
              OnAfterSalesTaxCalculate(Rec,SalesHeader,Currency);
              UpdateVATPercent("VAT Base Amount","Amount Including VAT" - "VAT Base Amount");
              "Amount Including VAT" := Round("Amount Including VAT",Currency."Amount Rounding Precision");
            end;
        end;

        "Pmt. Discount Amount" := 0;
        InitOutstandingAmount;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        Amount := Round(Amount,Currency."Amount Rounding Precision");
        //++Migración Arbumasa 2009
        Clear(rstCabV);
        rstCabV.Get("Document Type","Document No.");
        rstCabV.CalcFields(Amount);
        //--Migración Arbumasa 2009

        #2..25
                  "VAT Base Amount","Quantity (Base)",SalesHeader."Currency Factor",
                  //++Migración Arbumasa 2009
                  SalesHeader."Sell-to Customer No.","VAT Calculation Type",'',rstCabV.Amount);
                  //--Migración Arbumasa 2009
        #27..34
        */
        //end;


        //Unsupported feature: Code Modification on ""Shortcut Dimension 1 Code"(Field 40).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
        ATOLink.UpdateAsmDimFromSalesLine(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
        ATOLink.UpdateAsmDimFromSalesLine(Rec);

        //++Migración Arbumasa 2009
        "Job No." := GetJob;
        //--Migración Arbumasa 2009
        */
        //end;


        //Unsupported feature: Code Insertion on ""Job No."(Field 45)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        //++Migración Arbumasa 2009
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
          if rstJob."Lote origen" <> '' then
            Validate("Lote origen",rstJob."Lote origen");

        end;
        //--Migración Arbumasa 2009
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
        //DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */
        //end;
        field(50000; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
                //++MigraciŽ„n Arbumasa 2009
                "Job No." := GetJob;
                //--MigraciŽ„n Arbumasa 2009
            end;
        }
        field(50001; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
                //++MigraciŽ„n Arbumasa 2009
                "Job No." := GetJob;
                //--MigraciŽ„n Arbumasa 2009
            end;
        }
        field(50002; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
                //++MigraciŽ„n Arbumasa 2009
                "Job No." := GetJob;
                //--MigraciŽ„n Arbumasa 2009
            end;
        }
        field(50003; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 6 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
                //++MigraciŽ„n Arbumasa 2009
                "Job No." := GetJob;
                //--MigraciŽ„n Arbumasa 2009
            end;
        }
        field(50004; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 7 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Shortcut Dimension 7 Code");
                //++MigraciŽ„n Arbumasa 2009
                "Job No." := GetJob;
                //--MigraciŽ„n Arbumasa 2009
            end;
        }
        field(50006; "Precio x Kilo"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 2 : 4;

            trigger OnValidate()
            begin
                //IBdos Argentina - USS - 281102 - Inicio ModificaciŽ„n Arbumasa
                //VerificaciŽ„n de permisos para realizar diferentes tareas en esta tabla

                if "Document Type" = "Document Type"::Order then Seguridad(TipoVal::Modificar, FieldName("Precio x Kilo"));

                //IBdos Argentina - USS - 281102 - Fin ModificaciŽ„n Arbumasa
            end;
        }
        field(50007; "No. Pallet"; Code[10])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //IBdos Argentina - USS - 281102 - Inicio ModificaciŽ„n Arbumasa
                //VerificaciŽ„n de permisos para realizar diferentes tareas en esta tabla

                if "Document Type" = "Document Type"::Order then Seguridad(TipoVal::Confirmar, FieldName("No. Pallet"));

                //IBdos Argentina - USS - 281102 -  Fin ModificaciŽ„n Arbumasa
            end;
        }
        field(50008; Confirmada; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //IBdos Argentina - USS - 281102 - Inicio ModificaciŽ„n Arbumasa
                //VerificaciŽ„n de permisos para realizar diferentes tareas en esta tabla

                if "Document Type" = "Document Type"::Order then Seguridad(TipoVal::Confirmar, FieldName(Confirmada));

                //IBdos Argentina - USS - 281102 - Fin ModificaciŽ„n Arbumasa
            end;
        }
        field(50009; "Descripción Interna"; Text[250])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //IBdos Argentina - USS - 281102 - Inicio ModificaciŽ„n Arbumasa
                //VerificaciŽ„n de permisos para realizar diferentes tareas en esta tabla

                if "Document Type" = "Document Type"::Order then Seguridad(TipoVal::Modificar, FieldName("Descripción Interna"));

                //IBdos Argentina - USS - 281102 - Fin ModificaciŽ„n Arbumasa
            end;
        }
        field(50010; "Gross kilos"; Decimal)
        {
            Caption = 'Gross kilos';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //++MigraciŽ„n Arbumasa 2009
                if (xRec."Gross kilos" <> "Gross kilos") or (xRec."Gross kilos (Base)" <> "Gross kilos (Base)") then begin
                    "Gross kilos (Base)" := "Gross kilos";
                    InitOutstandingKB;
                    if "Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"] then
                        InitQtyToReceiveKB
                    else
                        InitQtyToShipKB;
                end;

                //--MigraciŽ„n Arbumasa 2009
            end;
        }
        field(50011; Usuario; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = User;
        }
        field(50012; Rechazada; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50013; "Net kilos"; Decimal)
        {
            Caption = 'Net kilos';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //++MigraciŽ„n Arbumasa 2009

                if (xRec."Net kilos" <> "Net kilos") or (xRec."Net kilos (Base)" <> "Net kilos (Base)") then begin
                    "Net kilos (Base)" := "Net kilos";
                    InitOutstandingKN;
                    if "Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"] then
                        InitQtyToReceiveKN
                    else
                        InitQtyToShipKN;
                end;


                //--MigraciŽ„n Arbumasa 2009
            end;
        }
        field(50014; "% Precio Kilo"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50015; "Outstanding Net Kilos"; Decimal)
        {
            Caption = 'Outstanding Net Kilos';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50016; "Net kilos to Invoice"; Decimal)
        {
            Caption = 'Net kilos to Invoice';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                //++MigraciŽ„n Arbumasa 2009
                if "Net kilos to Invoice" = MaxCdadAFactKN then
                    InitQtyToInvoiceKN;
                //--MigraciŽ„n Arbumasa 2009
            end;
        }
        field(50017; "Net kilos to Ship"; Decimal)
        {
            Caption = 'Net kilos to Ship';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                //++MigraciŽ„n Arbumasa 2009
                if "Net kilos to Ship" = "Outstanding Net Kilos" then
                    InitQtyToShipKN
                else begin
                    "Net kilos to Ship (Base)" := CalcCdadBaseKN("Net kilos to Ship");
                    InitQtyToInvoiceKN;
                end;
            end;
        }
        field(50018; "Outstanding Gross Kilos"; Decimal)
        {
            Caption = 'Outstanding Gross Kilos';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50019; "Gross kilos to Invoice"; Decimal)
        {
            Caption = 'Gross kilos to Invoice';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = true;

            trigger OnValidate()
            begin
                //++MigraciŽ„n Arbumasa 2009
                if "Gross kilos to Invoice" = MaxCdadAFactKB then
                    InitQtyToInvoiceKB;
                //--MigraciŽ„n Arbumasa 2009
            end;
        }
        field(50020; "Gross kilos to Ship"; Decimal)
        {
            Caption = 'Gross kilos to Ship';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                //++MigraciŽ„n Arbumasa 2009
                if "Gross kilos to Ship" = "Outstanding Gross Kilos" then
                    InitQtyToShipKB
                else begin
                    "Gross Kilos to Ship (Base)" := CalcCdadBaseKB("Gross kilos to Ship");
                    InitQtyToInvoiceKB;
                end;
                //--MigraciŽ„n Arbumasa 2009
            end;
        }
        field(50021; "Net kilos (Base)"; Decimal)
        {
            Caption = 'Net kilos (Base)';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50022; "Outstanding Net Kilos (Base)"; Decimal)
        {
            Caption = 'Outstanding Net Kilos (Base)';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50023; "Net kilos to Invoice (Base)"; Decimal)
        {
            Caption = 'Net kilos to Invoice (Base)';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50025; "Net kilos to Ship (Base)"; Decimal)
        {
            Caption = 'Net kilos to Ship (Base)';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50026; "NK Shipped Not Invd. (Base)"; Decimal)
        {
            Caption = 'NK Shipped Not Invd. (Base)';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50027; "Net Kilos Shipped (Base)"; Decimal)
        {
            Caption = 'Net Kilos Shipped (Base)';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50028; "Net Kilos Invoiced (Base)"; Decimal)
        {
            Caption = 'Net Kilos Invoiced (Base)';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50029; "Reserved net kilos (Base)"; Decimal)
        {
            BlankZero = true;
            CalcFormula = - Sum("Reservation Entry"."Net kilos" WHERE("Source ID" = FIELD("Document No."),
                                                                      "Source Ref. No." = FIELD("Line No."),
                                                                      "Source Type" = CONST(37),
                                                                      "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved net kilos (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50030; "Gross kilos (Base)"; Decimal)
        {
            Caption = 'Gross kilos (Base)';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50031; "Outstanding Gross Kilos (Base)"; Decimal)
        {
            Caption = 'Outstanding Gross Kilos (Base)';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50032; "Gross Kilos to Invoice (Base)"; Decimal)
        {
            Caption = 'Gross Kilos to Invoice (Base)';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50033; "Gross Kilos to Ship (Base)"; Decimal)
        {
            Caption = 'Gross Kilos to Ship (Base)';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50034; "GK Shipped Not Invd. (Base)"; Decimal)
        {
            Caption = 'GK Shipped Not Invd. (Base)';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50035; "Gross Kilos Shipped (Base)"; Decimal)
        {
            Caption = 'Gross Kilos Shipped (Base)';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50036; "Gross kilos Invoiced (Base)"; Decimal)
        {
            Caption = 'Gross kilos Invoiced (Base)';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50037; "Reserved Gross kilos (Base)"; Decimal)
        {
            CalcFormula = - Sum("Reservation Entry"."Gross kilos" WHERE("Source ID" = FIELD("Document No."),
                                                                        "Source Ref. No." = FIELD("Line No."),
                                                                        "Source Type" = CONST(37),
                                                                        "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved Gross kilos (Base)';
            FieldClass = FlowField;
        }
        field(50038; "NK Shipped Not Invoiced"; Decimal)
        {
            Caption = 'NK Shipped Not Invoiced';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50040; "Net Kilos Shipped"; Decimal)
        {
            Caption = 'Net Kilos Shipped';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50041; "Net Kilos Invoiced"; Decimal)
        {
            Caption = 'Net Kilos Invoiced';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50042; "GK Shipped Not Invoiced"; Decimal)
        {
            Caption = 'GK Shipped Not Invoiced';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50044; "Gross Kilos Shipped"; Decimal)
        {
            Caption = 'Gross Kilos Shipped';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50045; "Gross Kilos Invoiced"; Decimal)
        {
            Caption = 'Gross Kilos Invoiced';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = true;
        }
        field(50046; "Permiso de embarque"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50047; "Cód. transportista"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Shipping Agent";
        }
        field(50048; "Cód. contenedor"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50049; Familia; Code[3])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Familia producto";
        }
        field(50050; Subfamilia; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Subfamilia producto" WHERE("Family code" = FIELD(Familia));
        }
        field(50051; "KN sin ajuste"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(50052; "KB sin ajuste"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50053; "Ajuste KN"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(50054; "Ajuste KB"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50055; "Cód. concepto ajuste"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "AFIP Interface Register";
        }
        field(50056; "Cód. arancelario"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tariff Number";
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                //Si el cŽ„digo arancelario de la lŽ¡nea es diferente al de la ficha del producto,
                //se actualiza el de la ficha

                PunProd.Reset;
                if PunProd.Get("No.") then begin

                    if PunProd."Tariff No." <> "Cód. arancelario" then
                        PunProd.Validate(PunProd."Tariff No.", "Cód. arancelario");

                    PunProd.Modify;

                end;
            end;
        }
        field(50057; "Remito origen"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50058; "Línea remito origen"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50059; "Número de Item"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50060; "Número de Subitem"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50061; "Lote origen"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50062; "Línea ajustada"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50063; "KN Originales"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(50064; "KB Originales"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50065; "No. remito oficial"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50066; "No. lín. remito oficial"; Integer)
        {
            BlankZero = true;
            DataClassification = ToBeClassified;
        }
        field(50067; "x% Bo Bruto"; Decimal)
        {
            BlankZero = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50068; "Fecha registro"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50069; "Importe USD"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50070; "Puerto destino"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Entry/Exit Point";
        }
        field(50071; "Cód. categorización"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Categorizacion productos";
        }
        field(50072; "Especie de productos"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","L{Langostino}","C{Calamar}","M{Merluza}","Z{Centolla}";
        }
        field(50073; "Nivel de producción"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Materia Prima",Semielaborado,"Producto Terminado",Residuos;
        }
        field(50074; Procedencia; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Buques,Planta;
        }
        field(50075; "Propiedad producto"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Propio,Tercero,Comprado;
        }
        field(50076; "Cód. ingresos brutos"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER("Ingresos Brutos"));
        }
        field(50077; "Seguimiento para trazabilidad"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Post-Expo - Controlar contra DCL","No controlar contra DCL","Pre-Expo - Controlar contra DCL";
        }
        field(50079; "DCL application date formula"; Text[30])
        {
            Caption = 'FŽ„rmula de aplicaciŽ„n de fechas de DCL';
            DataClassification = ToBeClassified;
        }
        field(50080; "Importe DL"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50110; "Net kilos to Assign"; Decimal)
        {
            CalcFormula = Sum("Item Charge Assignment (Sales)"."Qty. to Assign" WHERE("Document Type" = FIELD("Document Type"),
                                                                                       "Document No." = FIELD("Document No."),
                                                                                       "Document Line No." = FIELD("Line No.")));
            Caption = 'Qty. to Assign';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50111; "Net kilos Assigned"; Decimal)
        {
            CalcFormula = Sum("Item Charge Assignment (Sales)"."Qty. Assigned" WHERE("Document Type" = FIELD("Document Type"),
                                                                                      "Document No." = FIELD("Document No."),
                                                                                      "Document Line No." = FIELD("Line No.")));
            Caption = 'Qty. Assigned';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50112; "Return Net kilos to Receive"; Decimal)
        {
            Caption = 'Return Qty. to Receive';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;

        }
        field(50113; "Return NK to Receive (Base)"; Decimal)
        {
            Caption = 'Return Qty. to Receive (Base)';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                Validate("Return Net kilos to Receive", "Return NK to Receive (Base)");
            end;
        }
        field(50114; "Return NK Rcd. Not Invd."; Decimal)
        {
            Caption = 'Return Qty. Rcd. Not Invd.';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50115; "Ret. NK Rcd. Not Invd.(Base)"; Decimal)
        {
            Caption = 'Ret. Qty. Rcd. Not Invd.(Base)';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50116; "Return Rcd. Not Invd. NK"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Return Rcd. Not Invd.';
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(50117; "Return Rcd. Not Invd. (LCY) NK"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Return Rcd. Not Invd. (LCY)';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50118; "Return Net kilos Received"; Decimal)
        {
            Caption = 'Return Net kilos Received';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50119; "Return NK Received (Base)"; Decimal)
        {
            Caption = 'Return NK Received (Base)';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50120; "Gross kilos to Assign"; Decimal)
        {
            CalcFormula = Sum("Item Charge Assignment (Sales)"."Qty. to Assign" WHERE("Document Type" = FIELD("Document Type"),
                                                                                       "Document No." = FIELD("Document No."),
                                                                                       "Document Line No." = FIELD("Line No.")));
            Caption = 'Qty. to Assign';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50121; "Gross kilos Assigned"; Decimal)
        {
            CalcFormula = Sum("Item Charge Assignment (Sales)"."Qty. Assigned" WHERE("Document Type" = FIELD("Document Type"),
                                                                                      "Document No." = FIELD("Document No."),
                                                                                      "Document Line No." = FIELD("Line No.")));
            Caption = 'Qty. Assigned';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50122; "Return Gross kilos to Receive"; Decimal)
        {
            Caption = 'Return Qty. to Receive';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;

        }
        field(50123; "Return GK to Receive (Base)"; Decimal)
        {
            Caption = 'Return Qty. to Receive (Base)';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                Validate("Return Gross kilos to Receive", "Return GK to Receive (Base)");
            end;
        }
        field(50124; "Return GK Rcd. Not Invd."; Decimal)
        {
            Caption = 'Return Qty. Rcd. Not Invd.';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50125; "Ret. GK Rcd. Not Invd.(Base)"; Decimal)
        {
            Caption = 'Ret. Qty. Rcd. Not Invd.(Base)';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50126; "Return Rcd. Not Invd. GK"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Return Rcd. Not Invd.';
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(50127; "Return Rcd. Not Invd. (LCY) GK"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Return Rcd. Not Invd. (LCY)';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50128; "Return Gross kilos Received"; Decimal)
        {
            Caption = 'Return Qty. Received';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50129; "Return GK Received (Base)"; Decimal)
        {
            Caption = 'Return Qty. Received (Base)';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = false;
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
            Caption = 'Omitir validaciŽ„n de posiciŽ„n';
            DataClassification = ToBeClassified;
        }
        field(50511; "Net kilos per UOM"; Decimal)
        {
            Caption = 'Net kilos per UOM';
            DataClassification = ToBeClassified;
        }
        field(50512; "Gross kilos per UOM"; Decimal)
        {
            Caption = 'Gross kilos per UOM';
            DataClassification = ToBeClassified;
        }
        field(50598; "Usuario Anulación"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50599; Anulado; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50700; "Old job no."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;
        }
        field(50701; Provincia; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50702; "No. despacho"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50705; "Tipo Factura"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Factura,"Nota Debito";
        }
    }


    //Unsupported feature: Code Modification on "OnModify".

    //trigger OnModify()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if ("Document Type" = "Document Type"::"Blanket Order") and
       ((Type <> xRec.Type) or ("No." <> xRec."No."))
    then begin
    #4..11
        until SalesLine2.Next = 0;
    end;

    if ((Quantity <> 0) or (xRec.Quantity <> 0)) and ItemExists(xRec."No.") and not FullReservedQtyIsForAsmToOrder then
      ReserveSalesLine.VerifyChange(Rec,xRec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..14
    //++Migración Arbumasa 2009
    //IF ((Quantity <> 0) OR (xRec.Quantity <> 0)) AND ItemExists(xRec."No.") AND NOT FullReservedQtyIsForAsmToOrder THEN
    if (((Quantity <> 0) or (xRec.Quantity <> 0)) or
       (("Net kilos" <> 0) or (xRec."Net kilos" <> 0)) or
       (("Gross kilos" <> 0) or (xRec."Gross kilos" <> 0)))
    //--Migración Arbumasa 2009
      and ItemExists(xRec."No.") and not FullReservedQtyIsForAsmToOrder then
      ReserveSalesLine.VerifyChange(Rec,xRec);
    */
    //end;


    //Unsupported feature: Code Modification on "CopyFromItem(PROCEDURE 144)".

    //procedure CopyFromItem();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GetItem(Item);
    IsHandled := false;
    OnBeforeCopyFromItem(Rec,Item,IsHandled);
    #4..15

    Description := Item.Description;
    "Description 2" := Item."Description 2";
    GetUnitCost;
    "Allow Invoice Disc." := Item."Allow Invoice Disc.";
    "Units per Parcel" := Item."Units per Parcel";
    #22..47
    InitDeferralCode;
    SetDefaultItemQuantity;
    OnAfterAssignItemValues(Rec,Item);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..18
                                                                    //++Migración Arbumasa 2009

                                                                    if Item."Global Dimension 1 Code" <> '' then
                                                                      Validate("Shortcut Dimension 1 Code",Item."Global Dimension 1 Code");
                                                                    if Item."Global Dimension 2 Code" <> '' then
                                                                      Validate("Shortcut Dimension 2 Code",Item."Global Dimension 2 Code");
                                                                    if Item."Global Dimension 3 Code" <> '' then
                                                                      Validate("Shortcut Dimension 3 Code",Item."Global Dimension 3 Code");
                                                                    if Item."Global Dimension 4 Code" <> '' then
                                                                      Validate("Shortcut Dimension 4 Code",Item."Global Dimension 4 Code");
                                                                    if Item."Global Dimension 5 Code" <> '' then
                                                                      Validate("Shortcut Dimension 5 Code",Item."Global Dimension 5 Code");
                                                                    if Item."Global Dimension 6 Code" <> '' then
                                                                      Validate("Shortcut Dimension 6 Code",Item."Global Dimension 6 Code");
                                                                    if Item."Global Dimension 7 Code" <> '' then
                                                                      Validate("Shortcut Dimension 7 Code",Item."Global Dimension 7 Code");

                                                                    "Cód. arancelario" := Item."Tariff No.";
                                                                    "Cód. categorización" := Item."Cód. categorización";
                                                                    "Especie de productos" := Item."Especie de productos";
                                                                    "Nivel de producción" := Item."Nivel de producción";
                                                                    Procedencia := Item.Procedencia;
                                                                    "Propiedad producto" := Item."Propiedad producto";
                                                                    Familia := Item.Familia;
                                                                    Subfamilia := Item.Subfamilia;
                                                                    "Seguimiento para trazabilidad" := SalesHeader."Seguimiento para trazabilidad";
                                                                    if "Currency Code" <> '' then
                                                                      Validate("Unit Price",Item."Precio venta USD")
                                                                    else
                                                                      Validate("Unit Price",Item."Precio venta $");
                                                                    //--Migración Arbumasa 2009

    #19..50
    */
    //end;


    //Unsupported feature: Code Modification on "CopyFromResource(PROCEDURE 146)".

    //procedure CopyFromResource();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    Res.Get("No.");
    Res.CheckResourcePrivacyBlocked(false);
    Res.TestField(Blocked,false);
    Res.TestField("Gen. Prod. Posting Group");
    Description := Res.Name;
    "Description 2" := Res."Name 2";
    "Unit of Measure Code" := Res."Base Unit of Measure";
    "Unit Cost (LCY)" := Res."Unit Cost";
    "Gen. Prod. Posting Group" := Res."Gen. Prod. Posting Group";
    #10..12
    FindResUnitCost;
    InitDeferralCode;
    OnAfterAssignResourceValues(Rec,Res);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6
        //++Arbu 2020
        if Res."Global Dimension 1 Code" <> '' then
              Validate("Shortcut Dimension 1 Code",Res."Global Dimension 1 Code");
        if Res."Global Dimension 2 Code" <> '' then
              Validate("Shortcut Dimension 2 Code",Res."Global Dimension 2 Code");
        if Res."Global Dimension 3 Code" <> '' then
              Validate("Shortcut Dimension 3 Code",Res."Global Dimension 3 Code");
        if Res."Global Dimension 4 Code" <> '' then
              Validate("Shortcut Dimension 4 Code",Res."Global Dimension 4 Code");
        if Res."Global Dimension 5 Code" <> '' then
              Validate("Shortcut Dimension 5 Code",Res."Global Dimension 5 Code");
        if Res."Global Dimension 6 Code" <> '' then
              Validate("Shortcut Dimension 6 Code",Res."Global Dimension 6 Code");
        if Res."Global Dimension 7 Code" <> '' then
              Validate("Shortcut Dimension 7 Code",Res."Global Dimension 7 Code");

    #7..15
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateAmounts(PROCEDURE 3)".

    //procedure UpdateAmounts();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if Type = Type::" " then
      exit;
    GetSalesHeader;
    #4..25

    if Type = Type::"Charge (Item)" then
      UpdateItemChargeAssgnt;

    CalcPrepaymentToDeduct;
    if VATBaseAmount <> "VAT Base Amount" then
    #32..36
    end;

    OnAfterUpdateAmountsDone(Rec,xRec,CurrFieldNo);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..28
    //++Migración Arbumasa 2009
    ImporteenUSD;

    //--Migración Arbumasa 2009
    #29..39
    */
    //end;

    //Unsupported feature: Variable Insertion (Variable: rstCabV) (VariableCollection) on "UpdateVATAmounts(PROCEDURE 38)".



    //Unsupported feature: Code Modification on "UpdateVATAmounts(PROCEDURE 38)".

    //procedure UpdateVATAmounts();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    OnBeforeUpdateVATAmounts(Rec);

    GetSalesHeader;
    #4..44
        end;
      end;

      if SalesHeader."Prices Including VAT" then
        case "VAT Calculation Type" of
          "VAT Calculation Type"::"Normal VAT",
    #51..118
                Round(
                  SalesTaxCalculate.CalculateTax(
                    "Tax Area Code","Tax Group Code","Tax Liable",SalesHeader."Posting Date",
                    TotalAmount + Amount,TotalQuantityBase + "Quantity (Base)",
                    SalesHeader."Currency Factor"),Currency."Amount Rounding Precision") -
                TotalAmountInclVAT;
              OnAfterSalesTaxCalculate(Rec,SalesHeader,Currency);
              UpdateVATPercent("VAT Base Amount","Amount Including VAT" - "VAT Base Amount");
            end;
        end;
    end;

    OnAfterUpdateVATAmounts(Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..47
      //++Migración Arbumasa 2009
      Clear(rstCabV);
      if rstCabV.Get("Document Type","Document No.") then;
      rstCabV.CalcFields(Amount);
      //--Migración Arbumasa 2009

    #48..121
                    (TotalAmount + Amount),(TotalQuantityBase + "Quantity (Base)"),
                    SalesHeader."Currency Factor",
                    //++Migración Arbumasa 2009
                    SalesHeader."Sell-to Customer No.","VAT Calculation Type",'',rstCabV.Amount
                    //--Migración Arbumasa 2009
                    ),Currency."Amount Rounding Precision") -
    #124..131
    */
    //end;


    //Unsupported feature: Code Modification on "ShowDimensions(PROCEDURE 25)".

    //procedure ShowDimensions();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    OldDimSetID := "Dimension Set ID";
    "Dimension Set ID" :=
      DimMgt.EditDimensionSet("Dimension Set ID",StrSubstNo('%1 %2 %3',"Document Type","Document No.","Line No."));
    VerifyItemLineDim;
    DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    ATOLink.UpdateAsmDimFromSalesLine(Rec);
    IsChanged := OldDimSetID <> "Dimension Set ID";
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
    DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
                                       //++Migración Arbumasa 2009
                                       "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
                                       "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
                                       "Shortcut Dimension 7 Code"
                                       //--Migración Arbumasa 2009
                                       );
    ATOLink.UpdateAsmDimFromSalesLine(Rec);
    IsChanged := OldDimSetID <> "Dimension Set ID";
    */
    //end;


    //Unsupported feature: Code Modification on "CreateDim(PROCEDURE 26)".

    //procedure CreateDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SourceCodeSetup.Get;
    TableID[1] := Type1;
    No[1] := No1;
    #4..8

    "Shortcut Dimension 1 Code" := '';
    "Shortcut Dimension 2 Code" := '';
    GetSalesHeader;
    "Dimension Set ID" :=
      DimMgt.GetRecDefaultDimID(
        Rec,CurrFieldNo,TableID,No,SourceCodeSetup.Sales,
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",SalesHeader."Dimension Set ID",DATABASE::Customer);
    DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    ATOLink.UpdateAsmDimFromSalesLine(Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..11
    //++Migración Arbumasa 2009
    "Shortcut Dimension 3 Code" := '';
    "Shortcut Dimension 4 Code" := '';
    "Shortcut Dimension 5 Code" := '';
    "Shortcut Dimension 6 Code" := '';
    "Shortcut Dimension 7 Code" := '';
    //--Migración Arbumasa 2009
    #12..15
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++Migración Arbumasa 2009
        "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
        "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
        "Shortcut Dimension 7 Code",
        //--Migración Arbumasa 2009
        SalesHeader."Dimension Set ID",DATABASE::Customer);
    DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++Migración Arbumasa 2009
        "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
        "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
        "Shortcut Dimension 7 Code");
        //--Migración Arbumasa 2009
    ATOLink.UpdateAsmDimFromSalesLine(Rec);
    */
    //end;


    //Unsupported feature: Code Modification on "SelectMultipleItems(PROCEDURE 180)".

    //procedure SelectMultipleItems();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if IsCreditDocType then
      SelectionFilter := ItemListPage.SelectActiveItems
    else
      SelectionFilter := ItemListPage.SelectActiveItemsForSale;
    if SelectionFilter <> '' then
      AddItems(SelectionFilter);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    {IF IsCreditDocType THEN
      SelectionFilter := ItemListPage.SelectActiveItems
    ELSE
      SelectionFilter := ItemListPage.SelectActiveItemsForSale;
    }if SelectionFilter <> '' then
      AddItems(SelectionFilter);
    */
    //end;


    //Unsupported feature: Code Modification on "AddItems(PROCEDURE 181)".

    //procedure AddItems();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    OnBeforeAddItems(Rec);

    InitNewLine(SalesLine);
    #4..8
        SalesLine.Validate(Type,Type::Item);
        SalesLine.Validate("No.",Item."No.");
        SalesLine.Insert(true);
        if TransferExtendedText.SalesCheckIfAnyExtText(SalesLine,false) then begin
          TransferExtendedText.InsertSalesExtTextRetLast(SalesLine,LastSalesLine);
          SalesLine."Line No." := LastSalesLine."Line No."
        end;
        OnAfterAddItem(SalesLine,LastSalesLine);
      until Item.Next = 0;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..11
    {    IF TransferExtendedText.SalesCheckIfAnyExtText(SalesLine,FALSE) THEN BEGIN
          TransferExtendedText.InsertSalesExtTextRetLast(SalesLine,LastSalesLine);
          SalesLine."Line No." := LastSalesLine."Line No."
        END;
     }   OnAfterAddItem(SalesLine,LastSalesLine);
      until Item.Next = 0;
    */
    //end;


    //Unsupported feature: Code Modification on "ShowNonstock(PROCEDURE 32)".

    //procedure ShowNonstock();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TestField(Type,Type::Item);
    if "No." <> '' then
      Error(SelectNonstockItemErr);
    if PAGE.RunModal(PAGE::"Catalog Item List",NonstockItem) = ACTION::LookupOK then begin
      NonstockItem.TestField("Item Template Code");
      ConfigTemplateHeader.SetRange(Code,NonstockItem."Item Template Code");
      ConfigTemplateHeader.FindFirst;
      TempItemTemplate.InitializeTempRecordFromConfigTemplate(TempItemTemplate,ConfigTemplateHeader);
      TempItemTemplate.TestField("Gen. Prod. Posting Group");
      TempItemTemplate.TestField("Inventory Posting Group");

      "No." := NonstockItem."Entry No.";
      CatalogItemMgt.NonStockSales(Rec);
      Validate("No.","No.");
      Validate("Unit Price",NonstockItem."Unit Price");

      OnAfterShowNonStock(Rec,NonstockItem);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
    {IF PAGE.RUNMODAL(PAGE::"Catalog Item List",NonstockItem) = ACTION::LookupOK THEN BEGIN
      NonstockItem.TESTFIELD("Item Template Code");
      ConfigTemplateHeader.SETRANGE(Code,NonstockItem."Item Template Code");
      ConfigTemplateHeader.FINDFIRST;
      TempItemTemplate.InitializeTempRecordFromConfigTemplate(TempItemTemplate,ConfigTemplateHeader);
      TempItemTemplate.TESTFIELD("Gen. Prod. Posting Group");
      TempItemTemplate.TESTFIELD("Inventory Posting Group");
    #11..13
      VALIDATE("No.","No.");
      VALIDATE("Unit Price",NonstockItem."Unit Price");

      OnAfterShowNonStock(Rec,NonstockItem);
    END;
    }
    */
    //end;

    //Unsupported feature: Variable Insertion (Variable: rstCabV) (VariableCollection) on "CalcVATAmountLines(PROCEDURE 35)".



    //Unsupported feature: Code Modification on "ValidateCrossReferenceNo(PROCEDURE 211)".

    //procedure ValidateCrossReferenceNo();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ReturnedItemCrossReference.Init;
    if "Cross-Reference No." <> '' then begin
      if SearchItem then
        DistIntegration.ICRLookupSalesItem(Rec,ReturnedItemCrossReference,CurrFieldNo <> 0)
      else
        ReturnedItemCrossReference := ItemCrossReference;

      OnBeforeCrossReferenceNoAssign(Rec,ReturnedItemCrossReference);

      if "No." <> ReturnedItemCrossReference."Item No." then
        Validate("No.",ReturnedItemCrossReference."Item No.");
      if ReturnedItemCrossReference."Variant Code" <> '' then
        Validate("Variant Code",ReturnedItemCrossReference."Variant Code");

      if (ReturnedItemCrossReference."Unit of Measure" <> '') and
         ("Unit of Measure Code" <> ReturnedItemCrossReference."Unit of Measure")
      then
        Validate("Unit of Measure Code",ReturnedItemCrossReference."Unit of Measure");
    end;

    "Unit of Measure (Cross Ref.)" := ReturnedItemCrossReference."Unit of Measure";
    "Cross-Reference Type" := ReturnedItemCrossReference."Cross-Reference Type";
    "Cross-Reference Type No." := ReturnedItemCrossReference."Cross-Reference Type No.";
    "Cross-Reference No." := ReturnedItemCrossReference."Cross-Reference No.";

    if (ReturnedItemCrossReference.Description <> '') or (ReturnedItemCrossReference."Description 2" <> '') then begin
      Description := ReturnedItemCrossReference.Description;
      "Description 2" := ReturnedItemCrossReference."Description 2";
    end;

    UpdateUnitPrice(FieldNo("Cross-Reference No."));
    UpdateICPartner;

    OnAfterValidateCrossReferenceNo(Rec,ItemCrossReference);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    ReturnedItemCrossReference.Init;
    {IF "Cross-Reference No." <> '' THEN BEGIN
      IF SearchItem THEN
        DistIntegration.ICRLookupSalesItem(Rec,ReturnedItemCrossReference,CurrFieldNo <> 0)
      ELSE
    #6..9
      IF "No." <> ReturnedItemCrossReference."Item No." THEN
        VALIDATE("No.",ReturnedItemCrossReference."Item No.");
      IF ReturnedItemCrossReference."Variant Code" <> '' THEN
        VALIDATE("Variant Code",ReturnedItemCrossReference."Variant Code");

      IF (ReturnedItemCrossReference."Unit of Measure" <> '') AND
         ("Unit of Measure Code" <> ReturnedItemCrossReference."Unit of Measure")
      THEN
        VALIDATE("Unit of Measure Code",ReturnedItemCrossReference."Unit of Measure");
    END;
    }
    #21..34
    */
    //end;


    //Unsupported feature: Code Modification on "InitQtyToShip2(PROCEDURE 7)".

    //procedure InitQtyToShip2();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Qty. to Ship" := "Outstanding Quantity";
    "Qty. to Ship (Base)" := "Outstanding Qty. (Base)";

    #4..11
    "VAT Difference" := 0;

    OnInitQtyToShip2OnBeforeCalcInvDiscToInvoice(Rec,xRec);

    CalcInvDiscToInvoice;

    CalcPrepaymentToDeduct;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..14
    //++Migración Arbumasa 2009
    {
    "Net kilos to Ship" := "Outstanding Net Kilos";
    "Net kilos to Ship (Base)" := "Outstanding Net Kilos (Base)";
    "Gross kilos to Ship" := "Outstanding Gross Kilos";
    "Gross Kilos to Ship (Base)" := "Outstanding Gross Kilos (Base)";
    }

    "Net kilos to Ship" := cduProductionFishing.fntCalcKilosFromRatio("No.","Outstanding Quantity",
                                  "Qty. per Unit of Measure","Net kilos per UOM");
    "Net kilos to Ship (Base)" := cduProductionFishing.fntCalcKilosFromRatio("No.","Outstanding Qty. (Base)",
                                  1,"Net kilos per UOM");

    "Gross kilos to Ship" := cduProductionFishing.fntCalcKilosFromRatio("No.","Outstanding Quantity",
                                  "Qty. per Unit of Measure","Gross kilos per UOM");
    "Gross Kilos to Ship (Base)" := cduProductionFishing.fntCalcKilosFromRatio("No.","Outstanding Qty. (Base)",
                                  1,"Gross kilos per UOM");

    "Net kilos to Invoice" := cduProductionFishing.fntCalcKilosFromRatio("No.","Qty. to Invoice",
                                  "Qty. per Unit of Measure","Net kilos per UOM");
    "Net kilos to Invoice (Base)" := cduProductionFishing.fntCalcKilosFromRatio("No.","Qty. to Invoice (Base)",
                                  1,"Net kilos per UOM");

    "Gross kilos to Invoice" := cduProductionFishing.fntCalcKilosFromRatio("No.","Qty. to Invoice",
                                  "Qty. per Unit of Measure","Gross kilos per UOM");
    "Gross Kilos to Invoice (Base)" := cduProductionFishing.fntCalcKilosFromRatio("No.","Qty. to Invoice (Base)",
                                  1,"Gross kilos per UOM");

    //++Migración Arbumasa 2009
    #15..18
    */
    //end;


    //Unsupported feature: Code Modification on "SetDefaultQuantity(PROCEDURE 62)".

    //procedure SetDefaultQuantity();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GetSalesSetup;
    if SalesSetup."Default Quantity to Ship" = SalesSetup."Default Quantity to Ship"::Blank then begin
      if ("Document Type" = "Document Type"::Order) or ("Document Type" = "Document Type"::Quote) then begin
        "Qty. to Ship" := 0;
        "Qty. to Ship (Base)" := 0;
        "Qty. to Invoice" := 0;
        "Qty. to Invoice (Base)" := 0;
      end;
      if "Document Type" = "Document Type"::"Return Order" then begin
        "Return Qty. to Receive" := 0;
        "Return Qty. to Receive (Base)" := 0;
        "Qty. to Invoice" := 0;
        "Qty. to Invoice (Base)" := 0;
      end;
    end;

    OnAfterSetDefaultQuantity(Rec,xRec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..7

        //++Migración Arbumasa 2009

        "Net kilos to Ship" := 0;
        "Net kilos to Ship (Base)" := 0;
        "Gross Kilos to Ship (Base)" := 0;
        "Gross Kilos to Ship (Base)" := 0;
        "Net kilos to Invoice" := 0;
        "Net kilos to Invoice (Base)" := 0;
        "Gross kilos to Invoice" := 0;
        "Gross Kilos to Invoice (Base)" := 0;

        //++Migración Arbumasa 2009

    #8..13

        //++Migración Arbumasa 2009

        "Return Net kilos to Receive" := 0;
        "Return NK to Receive (Base)" := 0;
        "Return Gross kilos to Receive" := 0;
        "Return GK to Receive (Base)" := 0;
        "Net kilos to Invoice" := 0;
        "Net kilos to Invoice (Base)" := 0;
        "Gross kilos to Invoice" := 0;
        "Gross Kilos to Invoice (Base)" := 0;

        //++Migración Arbumasa 2009


    #14..17
    */
    //end;

    procedure "----ARBUMASA----"()
    begin
    end;

    procedure Seguridad(TipoVal: Option Modificar,Aprobar,"Registrar/Enviar Pedidos","Facturación Automática","Registrar Factura",Confirmar,Eliminar; FieldNME: Text[30])
    var
        rstCabVenta: Record "Sales Header";
        rstSeguridadUsuario: Record "Seguridad por usuario";
        rstSeguridad: Record Seguridad;
        codUsuario: Code[20];
    begin
        Clear(rstSeguridadUsuario);
        Clear(rstSeguridad);
        Clear(rstCabVenta);
        codUsuario := '';
        rstCabVenta.Get("Document Type", "Document No.");

        if Usuario <> '' then
            codUsuario := Usuario
        else
            codUsuario := rstCabVenta.Usuario;

        if rstSeguridadUsuario.fntSeguridadComparada(codUsuario, UserId) then begin

            if TipoVal = TipoVal::Modificar then begin

                if rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Modificar Líneas Ajenas")) then
                    //No se puede modificar una línea confirmada

                    TestField(Confirmada, false);

                //IBdos Argentina - USS - 291102 - Fin Modificación Arbumasa

            end;

            if TipoVal = TipoVal::Confirmar then begin

                if not rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Confirmar Líneas")) then
                    Error('No tiene permisos para confirmar líneas');

            end;

            if TipoVal = TipoVal::Aprobar then begin

                if not rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Aprobar Pedidos")) then
                    Error('No tiene permisos para aprobar pedidos');

            end;

            if TipoVal = TipoVal::Eliminar then begin

                //IBdos Argentina - USS - 291102 - Inicio Modificación Arbumasa
                //No se puede eliminar una línea confirmada

                TestField(Confirmada, false);

                //IBdos Argentina - USS - 291102 - Fin Modificación Arbumasa

            end;

        end
        else begin

            //IBdos Argentina - USS - 291102 - Inicio Modificación Arbumasa

            if (Usuario <> UserId) and (Usuario <> '') then begin

                case TipoVal of

                    TipoVal::Modificar:
                        begin

                            if rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Modificar Líneas Ajenas")) then
                                //No se puede modificar una línea confirmada

                                TestField(Confirmada, false);

                            //IBdos Argentina - USS - 291102 - Fin Modificación Arbumasa


                        end;

                    TipoVal::Confirmar:
                        begin

                            if not rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Confirmar Líneas")) then
                                Error('No tiene permisos para confirmar líneas');

                        end;

                    TipoVal::Eliminar:
                        begin

                            if not rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Modificar Líneas Ajenas")) then
                                //No se puede modificar una línea confirmada

                                TestField(Confirmada, false);

                            //IBdos Argentina - USS - 291102 - Fin Modificación Arbumasa

                        end;


                    TipoVal::Aprobar:
                        begin

                            if not rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Confirmar Líneas")) then
                                Error('No tiene permisos para confirmar líneas');

                        end;

                end;

            end
            else begin

                if (Usuario = UserId) then begin

                    case TipoVal of

                        TipoVal::Modificar:
                            begin

                                //No se puede modificar una línea confirmada

                                TestField(Confirmada, false);

                                //IBdos Argentina - USS - 291102 - Fin Modificación Arbumasa


                            end;

                        TipoVal::Eliminar:
                            begin

                                //No se puede modificar una línea confirmada

                                TestField(Confirmada, false);

                                //IBdos Argentina - USS - 291102 - Fin Modificación Arbumasa

                            end;


                    end;

                end;

            end;

        end;

        if TipoVal = TipoVal::Aprobar then begin

            if not rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Modificar Líneas Ajenas")) then
                Error('No tiene permisos para modificar líneas ajenas');

        end;

        if TipoVal = TipoVal::"Registrar/Enviar Pedidos" then begin

            if not rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Registrar - Enviar Pedidos")) then
                Error('No tiene permisos para enviar pedidos');

        end;

        if TipoVal = TipoVal::"Facturación Automática" then begin

            if not rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Facturación Automática")) then
                Error('No tiene permisos para facturar automáticamente');

        end;
    end;

    procedure InicCdadAEnvKN()
    begin
        "Net kilos to Ship" := "Outstanding Net Kilos";
        "Net kilos to Ship (Base)" := "Outstanding Net Kilos (Base)";
        InicCdadAFactKN;
    end;

    procedure InicCdadAFactKN()
    begin
        "Net kilos to Invoice" := MaxCdadAFactKN;
        "Net kilos to Invoice (Base)" := MaxCdadBaseAFactKN;
    end;

    procedure InicCdadAEnvKB()
    begin
        "Gross Kilos to Ship (Base)" := "Outstanding Gross Kilos";
        "Gross Kilos to Ship (Base)" := "Outstanding Gross Kilos (Base)";
        InicCdadAFactKB;
    end;

    procedure InicCdadAFactKB()
    begin
        "Gross kilos to Invoice" := MaxCdadAFactKB;
        "Gross Kilos to Invoice (Base)" := MaxCdadBaseAFactKB;
    end;

    procedure InicPendienteKN()
    begin
        "Outstanding Net Kilos" := "Net kilos" - "Net Kilos Shipped";
        "Outstanding Net Kilos (Base)" := "Net kilos (Base)" - "Net Kilos Shipped (Base)";

        /*IF ("Net Kilos Shipped" - "Net Kilos Invoiced") >= 0 THEN*/
        "NK Shipped Not Invoiced" := "Net Kilos Shipped" - "Net Kilos Invoiced";
        /*ELSE
          "NK Shipped Not Invoiced" := 0;
         */

        /*IF ("Net Kilos Shipped (Base)" - "Net Kilos Invoiced (Base)") >= 0 THEN*/
        "NK Shipped Not Invd. (Base)" := "Net Kilos Shipped (Base)" - "Net Kilos Invoiced (Base)"
        /*ELSE
          "NK Shipped Not Invd. (Base)" := 0;
         */

    end;

    procedure InicPendienteKB()
    begin
        "Outstanding Gross Kilos" := "Gross kilos" - "Gross Kilos Shipped";
        "Outstanding Gross Kilos (Base)" := "Gross kilos (Base)" - "Gross Kilos Shipped (Base)";

        /*IF ("Gross Kilos Shipped" - "Gross Kilos Invoiced") >= 0 THEN*/
        "GK Shipped Not Invoiced" := "Gross Kilos Shipped" - "Gross Kilos Invoiced";
        /*ELSE
          "GK Shipped Not Invoiced" := 0;
        
        IF ("Gross Kilos Shipped (Base)" - "Gross Kilos Invoiced (Base)") >= 0 THEN*/
        "GK Shipped Not Invd. (Base)" := "Gross Kilos Shipped (Base)" - "Gross kilos Invoiced (Base)";
        /*ELSE
          "GK Shipped Not Invd. (Base)" := 0;
         */

    end;

    procedure MaxCdadAFactKN(): Decimal
    begin
        /*IF ("Net Kilos Shipped" + "Net kilos to Ship" - "Net Kilos Invoiced") >= 0 THEN*/
        exit("Net Kilos Shipped" + "Net kilos to Ship" - "Net Kilos Invoiced")
        /*ELSE
          EXIT(0);
         */

    end;

    procedure MaxCdadBaseAFactKN(): Decimal
    begin
        /*IF ("Net Kilos Shipped (Base)" + "Net kilos to Ship (Base)" - "Net Kilos Invoiced (Base)") >0 THEN*/
        exit("Net Kilos Shipped (Base)" + "Net kilos to Ship (Base)" - "Net Kilos Invoiced (Base)")
        /*ELSE
          EXIT(0);
         */

    end;

    procedure MaxCdadAFactKB(): Decimal
    begin
        /*IF ("Gross Kilos Shipped" + "Gross Kilos to Ship (Base)" - "Gross Kilos Invoiced") >= 0 THEN*/
        exit("Gross Kilos Shipped" + "Gross Kilos to Ship (Base)" - "Gross Kilos Invoiced")
        /*ELSE
          EXIT(0);
        */

    end;

    procedure MaxCdadBaseAFactKB(): Decimal
    begin
        /*IF ("Gross Kilos Shipped (Base)" + "Gross kilos to Ship (Base)" - "Gross Kilos Invoiced (Base)") >= 0 THEN*/
        exit("Gross Kilos Shipped (Base)" + "Gross Kilos to Ship (Base)" - "Gross kilos Invoiced (Base)")
        /*ELSE
          EXIT(0);
         */

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

    procedure ImporteenUSD()
    var
        varConfigCont: Record "General Ledger Setup";
        rstTipoCambio: Record "Currency Exchange Rate";
        SalesHeader: Record "Sales Header";
    begin
        //US.ARBU - 2007-11-29 - Inicio modificación
        //Calculo el importe de la línea en dólares

        Clear(varConfigCont);
        varConfigCont.Get();

        GetSalesHeader;
        if "Unit Price" * Quantity <> 0 then begin

            if SalesHeader."Currency Code" = varConfigCont."Additional Reporting Currency" then begin
                "Importe USD" := "Unit Price" * Quantity;
                Clear(rstTipoCambio);
                "Importe DL" := rstTipoCambio.ExchangeAmtFCYToLCY(SalesHeader."Posting Date",
                                                            varConfigCont."Additional Reporting Currency",
                                                            Quantity * "Unit Price",
                                                            SalesHeader."Currency Factor");
            end
            else begin

                if SalesHeader."Currency Code" = '' then begin

                    Clear(rstTipoCambio);
                    "Importe USD" := rstTipoCambio.ExchangeAmtLCYToFCY(SalesHeader."Posting Date",
                                                              varConfigCont."Additional Reporting Currency",
                                                              Quantity * "Unit Price",
                                                              rstTipoCambio.ExchangeRate(SalesHeader."Posting Date",
                                                              varConfigCont."Additional Reporting Currency"));
                    "Importe DL" := Quantity * "Unit Price";
                end
                else begin

                    Clear(rstTipoCambio);
                    "Importe USD" := rstTipoCambio.ExchangeAmtFCYToFCY(SalesHeader."Posting Date",
                                                              varConfigCont."Additional Reporting Currency",
                                                              '',
                                                              rstTipoCambio.ExchangeAmtFCYToLCY(SalesHeader."Posting Date",
                                                              SalesHeader."Currency Code",
                                                              Quantity * "Unit Price",
                                                              rstTipoCambio.ExchangeRate(
                                                              SalesHeader."Posting Date", SalesHeader."Currency Code")));
                    Clear(rstTipoCambio);
                    "Importe DL" := rstTipoCambio.ExchangeAmtFCYToLCY(SalesHeader."Posting Date",
                                                                varConfigCont."Additional Reporting Currency",
                                                                Quantity * "Unit Price",
                                                                SalesHeader."Currency Factor");
                end;

            end;

            "Importe USD" := Round("Importe USD", 0.01);
            "Importe DL" := Round("Importe DL", 0.01);
            /*
              IF NOT INSERT THEN
                MODIFY;
            */

        end;


        //US.ARBU - 2007-11-29 - Fin modificación

    end;

    procedure MaxQtyToInvoiceKN(): Decimal
    begin
        if "Prepayment Line" then
            exit(1);
        if "Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"] then
            exit("Return Net kilos Received" + "Return Net kilos to Receive" - "Net Kilos Invoiced")
        else
            exit("Net Kilos Shipped" + "Net kilos to Ship" - "Net Kilos Invoiced");
    end;

    procedure MaxQtyToInvoiceKB(): Decimal
    begin
        if "Prepayment Line" then
            exit(1);
        if "Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"] then
            exit("Return Gross kilos Received" + "Return Gross kilos to Receive" - "Gross Kilos Invoiced")
        else
            exit("Gross Kilos Shipped" + "Gross kilos to Ship" - "Gross Kilos Invoiced");
    end;

    procedure GenLote(): Boolean
    var
        lTBTrackSpec: Record "Tracking Specification";
    begin
        /*VALIDATE("No. Pallet");
        IF ("Shortcut Dimension 1 Code"<>'') AND
          ("Shortcut Dimension 3 Code"<>'') AND
          ("No. Pallet" <>'') AND
          (Quantity<>0) AND
          ("Net kilos"<>0) THEN
        BEGIN
          COMMIT;
          IF NOT ReserveItemJnlLine.DeleteLineConfirm(Rec) THEN
            EXIT(FALSE);
          ReserveItemJnlLine.DeleteLine(Rec);
        
          cduCreateReservEntry.SetDates(0D,0D);
          cduCreateReservEntry.SetApplyFromEntryNo(0);
          cduCreateReservEntry.CreateReservEntryFor(37,1,'','',
                                                    0,"Line No.",1,Quantity,'',
                                                    "Shortcut Dimension 1 Code"+ '-' +
                                                    "Shortcut Dimension 3 Code" + "No. Pallet",
                                                    "Net kilos","Gross Kilos");
        
          cduCreateReservEntry.CreateEntry("No.",'',"Location Code",Description,SalesHeader."Posting Date",0D,0,3);
        END;
                                */

    end;

    procedure InitOutstandingKN()
    begin
        if "Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"] then begin

            //++Migración Arbumasa 2009
            "Outstanding Net Kilos" := "Net kilos" - "Return Net kilos Received";
            "Outstanding Net Kilos (Base)" := "Net kilos (Base)" - "Return NK Received (Base)";
            "Return NK Rcd. Not Invd." := "Return Net kilos Received" - "Net Kilos Invoiced";
            "Ret. NK Rcd. Not Invd.(Base)" := "Return NK Received (Base)" - "Net Kilos Invoiced (Base)";
            //--Migración Arbumasa 2009

        end else begin
            //++Migración Arbumasa 2009
            "Outstanding Net Kilos" := "Net kilos" - "Net Kilos Shipped";
            "Outstanding Net Kilos (Base)" := "Net kilos (Base)" - "Net Kilos Shipped (Base)";
            "NK Shipped Not Invoiced" := "Net Kilos Shipped" - "Net Kilos Invoiced";
            "NK Shipped Not Invd. (Base)" := "Net Kilos Shipped (Base)" - "Net Kilos Invoiced (Base)";
            //--Migración Arbumasa 2009

        end;
    end;

    procedure InitOutstandingKB()
    begin
        if "Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"] then begin
            //++Migración Arbumasa 2009
            "Outstanding Gross Kilos" := "Gross kilos" - "Return Gross kilos Received";
            "Outstanding Gross Kilos (Base)" := "Gross kilos (Base)" - "Return GK Received (Base)";
            "Return GK Rcd. Not Invd." := "Return Gross kilos Received" - "Gross Kilos Invoiced";
            "Ret. GK Rcd. Not Invd.(Base)" := "Return GK Received (Base)" - "Gross kilos Invoiced (Base)";
            //--Migración Arbumasa 2009
        end else begin
            //++Migración Arbumasa 2009
            "Outstanding Gross Kilos" := "Gross kilos" - "Gross Kilos Shipped";
            "Outstanding Gross Kilos (Base)" := "Gross kilos (Base)" - "Gross Kilos Shipped (Base)";
            "GK Shipped Not Invoiced" := "Gross Kilos Shipped" - "Gross Kilos Invoiced";
            "GK Shipped Not Invd. (Base)" := "Gross Kilos Shipped (Base)" - "Gross kilos Invoiced (Base)";
            //--Migración Arbumasa 2009
        end;
    end;

    procedure InitQtyToShipKN()
    begin
        //++Migración Arbumasa 2009
        "Net kilos to Ship" := "Outstanding Net Kilos";
        "Net kilos to Ship (Base)" := "Outstanding Net Kilos (Base)";
        //--Migración Arbumasa 2009

        InitQtyToInvoiceKN;
    end;

    procedure InitQtyToShipKB()
    begin
        //++Migración Arbumasa 2009
        "Gross kilos to Ship" := "Outstanding Gross Kilos";
        "Gross Kilos to Ship (Base)" := "Outstanding Gross Kilos (Base)";
        //--Migración Arbumasa 2009
        InitQtyToInvoiceKB;
    end;

    procedure InitQtyToReceiveKN()
    begin
        //++Migración Arbumasa 2009
        "Return Net kilos to Receive" := "Outstanding Net Kilos";
        "Return NK to Receive (Base)" := "Outstanding Net Kilos (Base)";
        //--Migración Arbumasa 2009

        InitQtyToInvoiceKN;
    end;

    procedure InitQtyToReceiveKB()
    begin
        //++Migración Arbumasa 2009
        "Return Gross kilos to Receive" := "Outstanding Gross Kilos";
        "Return GK to Receive (Base)" := "Outstanding Gross Kilos (Base)";
        //--Migración Arbumasa 2009
        InitQtyToInvoiceKB;
    end;

    procedure InitQtyToInvoiceKN()
    begin
        //++Migración Arbumasa 2009
        if Type = Type::Item then begin

            "Net kilos to Invoice" := MaxQtyToInvoiceKN;
            "Net kilos to Invoice (Base)" := MaxQtyToInvoiceKN;

        end;
        //--Migración Arbumasa 2009
    end;

    procedure InitQtyToInvoiceKB()
    begin
        //++Migración Arbumasa 2009
        if Type = Type::Item then begin

            "Gross kilos to Invoice" := MaxQtyToInvoiceKB;
            "Gross Kilos to Invoice (Base)" := MaxQtyToInvoiceKB;

        end;
        //--Migración Arbumasa 2009
    end;

    procedure InitQtyToShip2KN()
    begin
        //++Migración Arbumasa 2009
        "Net kilos to Ship" := "Outstanding Net Kilos";
        "Net kilos to Ship (Base)" := "Outstanding Net Kilos (Base)";
        "Net kilos to Invoice" := MaxQtyToInvoiceKN;
        "Net kilos to Invoice (Base)" := MaxQtyToInvoiceKN;
        //++Migración Arbumasa 2009
    end;

    procedure InitQtyToShip2KB()
    begin
        //++Migración Arbumasa 2009
        "Gross kilos to Ship" := "Outstanding Gross Kilos";
        "Gross Kilos to Ship (Base)" := "Outstanding Gross Kilos (Base)";
        "Gross kilos to Invoice" := MaxQtyToInvoiceKB;
        "Gross Kilos to Invoice (Base)" := MaxQtyToInvoiceKB;
        //++Migración Arbumasa 2009
    end;

    procedure GetJob(): Code[20]
    var
        rstProy: Record Job;
    begin
        //++Migración Arbumasa 2009
        if "Job No." <> '' then
            exit("Job No.")
        else begin

            if ("Shortcut Dimension 1 Code" <> '') and (("Shortcut Dimension 3 Code" <> '') or ("Shortcut Dimension 3 Code" <> '')) then begin

                Clear(rstJob);
                rstJob.SetRange("Global Dimension 1 Code", "Shortcut Dimension 1 Code");
                if "Shortcut Dimension 3 Code" <> '' then
                    rstJob.SetRange("Global Dimension 3 Code", "Shortcut Dimension 3 Code")
                else
                    rstJob.SetRange("Global Dimension 3 Code", "Shortcut Dimension 3 Code");
                rstJob.FindFirst;
                exit(rstJob."No.");

            end;

        end;
        //--Migración Arbumasa 2009
    end;

    local procedure fntSeptimoNivel()
    var
        FA: Record "Fixed Asset";
        Item: Record Item;
    begin
        if "No." <> '' then begin

            case Type of
                Type::Item:
                    begin

                        Clear(Item);
                        Item.Get("No.");
                        if Item."Global Dimension 7 Code" <> '' then
                            Validate("Shortcut Dimension 7 Code", Item."Global Dimension 7 Code");

                    end;
                Type::Resource:
                    begin

                        Clear(rstRecursos);
                        rstRecursos.Get("No.");
                        if rstRecursos."Global Dimension 7 Code" <> '' then
                            Validate("Shortcut Dimension 7 Code", rstRecursos."Global Dimension 7 Code");

                    end;
                Type::"Fixed Asset":
                    begin

                        Clear(FA);
                        FA.Get("No.");
                        if FA."Global Dimension 7 Code" <> '' then
                            Validate("Shortcut Dimension 7 Code", FA."Global Dimension 7 Code");

                    end;
            end;
        end;
    end;

    //Unsupported feature: Property Insertion (Dimensions) on "AutoReserve(PROCEDURE 11).QtyToReserve(Variable 1000)".


    var
        rstCliente: Record Customer;

    var
        rstReservEntry: Record "Reservation Entry";
        rstTrackSpec: Record "Tracking Specification";

    var
        rstCabV: Record "Sales Header";


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=You cannot delete the order line because it is associated with purchase order %1 line %2.;ESP=No se puede eliminar la línea del pedido porque está asociada a la línea %2 del pedido de compra %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=You cannot delete the order line because it is associated with purchase order %1 line %2.;ESP=No se puede eliminar la línea del pedido porque está asociada a la línea %2 del pedido de compra %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=You cannot change %1 because the order line is associated with purchase order %2 line %3.;ESP=No se puede cambiar %1 porque la línea de pedido está asociada a la línea %3 del pedido de compra %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=You cannot change %1 because the order line is associated with purchase order %2 line %3.;ESP=No se puede cambiar %1 porque la línea de pedido está asociada a la línea %3 del pedido de compra %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text005(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text005 : ENU=You cannot invoice more than %1 units.;ESP=No se pueden facturar más de %1 unidades.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text005 : ENU=You cannot invoice more than %1 units.;ESP=No se pueden facturar más de %1 unidades.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text006(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text006 : ENU=You cannot invoice more than %1 base units.;ESP=No se pueden facturar más de %1 unidades base.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text006 : ENU=You cannot invoice more than %1 base units.;ESP=No se pueden facturar más de %1 unidades base.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text007(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text007 : ENU=You cannot ship more than %1 units.;ESP=No se pueden enviar más de %1 unidades.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text007 : ENU=You cannot ship more than %1 units.;ESP=No se pueden enviar más de %1 unidades.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text008(Variable 1007)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text008 : ENU=You cannot ship more than %1 base units.;ESP=No se pueden enviar más de %1 unidades base.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text008 : ENU=You cannot ship more than %1 base units.;ESP=No se pueden enviar más de %1 unidades base.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ManualReserveQst(Variable 1010)".

    //var
    //>>>> ORIGINAL VALUE:
    //ManualReserveQst : ENU=Automatic reservation is not possible.\Do you want to reserve items manually?;ESP=No se puede reservar automáticamente.\¿Desea reservar los productos manualmente?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ManualReserveQst : ENU=Automatic reservation is not possible.\Do you want to reserve items manually?;ESP=No se puede reservar automáticamente.\?Desea reservar los productos manualmente?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "WhseRequirementMsg(Variable 1044)".

    //var
    //>>>> ORIGINAL VALUE:
    //WhseRequirementMsg : @@@="%1=Document";ENU=%1 is required for this line. The entered information may be disregarded by warehouse activities.;ESP=%1 se requiere para esta línea. La información introducida puede ser ignorada por las actividades de almacén.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //WhseRequirementMsg : @@@="%1=Document";ENU=%1 is required for this line. The entered information may be disregarded by warehouse activities.;ESP=%1 se requiere para esta línea. La información introducida puede ser ignorada por las actividades de almacén.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text020(Variable 1019)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text020 : ENU=You cannot return more than %1 units.;ESP=No puede devolver más de %1 unidades.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text020 : ENU=You cannot return more than %1 units.;ESP=No puede devolver más de %1 unidades.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text021(Variable 1020)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text021 : ENU=You cannot return more than %1 base units.;ESP=No puede dev. más del %1 unidades base.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text021 : ENU=You cannot return more than %1 base units.;ESP=No puede dev. más del %1 unidades base.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Subtype) on "CatalogItemMgt(Variable 1087)".

    //var
    //>>>> ORIGINAL VALUE:
    //CatalogItemMgt : "Catalog Item Management";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CatalogItemMgt : "Nonstock Item Management";
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text028(Variable 1098)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text028 : ENU=You cannot change the %1 when the %2 has been filled in.;ESP=No puede cambiar %1 después de introducir datos en %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text028 : ENU=You cannot change the %1 when the %2 has been filled in.;ESP=No puede cambiar %1 después de introducir datos en %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text034(Variable 1084)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text034 : ENU=The value of %1 field must be a whole number for the item included in the service item group if the %2 field in the Service Item Groups window contains a check mark.;ESP=El valor del campo %1 debe ser un número entero correspondiente al producto incluido en el grupo de productos de servicio si está activada la casilla de verificación del campo %2 en la ventana Grupos producto servicio.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text034 : ENU=The value of %1 field must be a whole number for the item included in the service item group if the %2 field in the Service Item Groups window contains a check mark.;ESP=El valor del campo %1 debe ser un número entero correspondiente al producto incluido en el grupo de productos de servicio si está activada la casilla de verificación del campo %2 en la ventana Grupos producto servicio.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text035(Variable 1083)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text035 : ENU="Warehouse ";ESP="Almacén ";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text035 : ENU="Warehouse ";ESP="Almacén ";
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text042(Variable 1055)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text042 : ENU=When posting the Applied to Ledger Entry %1 will be opened first;ESP=Al registrar, se abrirá primero Liq. por mov. producto %1;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text042 : ENU=When posting the Applied to Ledger Entry %1 will be opened first;ESP=Al registrar, se abrirá primero Liq. por mov. producto %1;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ShippingMoreUnitsThanReceivedErr(Variable 1047)".

    //var
    //>>>> ORIGINAL VALUE:
    //ShippingMoreUnitsThanReceivedErr : ENU=You cannot ship more than the %1 units that you have received for document no. %2.;ESP=No se puede enviar más de %1 unidades que se hayan recibido para el documento No. %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ShippingMoreUnitsThanReceivedErr : ENU=You cannot ship more than the %1 units that you have received for document no. %2.;ESP=No se puede enviar más de %1 unidades que se hayan recibido para el documento No.%2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text046(Variable 1105)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text046 : ENU=You cannot return more than the %1 units that you have shipped for %2 %3.;ESP=No puede devolver más de las %1 unidades enviadas para el %2 %3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text046 : ENU=You cannot return more than the %1 units that you have shipped for %2 %3.;ESP=No puede devolver más de las %1 unidades enviadas para el %2 %3.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text052(Variable 1022)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text052 : ENU=You cannot add an item line because an open warehouse shipment exists for the sales header and Shipping Advice is %1.\\You must add items as new lines to the existing warehouse shipment or change Shipping Advice to Partial.;ESP=No puede agregar una línea de producto porque existe un envío de almacén abierto para la Cabecera venta y el Aviso envío es %1.\\Debe agregar productos como líneas nuevas en el envío de almacén existente o cambiar el Aviso envío a Parcial.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text052 : ENU=You cannot add an item line because an open warehouse shipment exists for the sales header and Shipping Advice is %1.\\You must add items as new lines to the existing warehouse shipment or change Shipping Advice to Partial.;ESP=No puede agregar una línea de producto porque existe un envío de almacén abierto para la Cabecera venta y el Aviso envío es %1.\\Debe agregar productos como líneas nuevas en el envío de almacén existente o cambiar el Aviso envío a Parcial.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text053(Variable 1017)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text053 : ENU=You have changed one or more dimensions on the %1, which is already shipped. When you post the line with the changed dimension to General Ledger, amounts on the Inventory Interim account will be out of balance when reported per dimension.\\Do you want to keep the changed dimension?;ESP=Ha modificado una o varias dimensiones de %1, que ya se ha enviado. Al registrar la línea con la dimensión modificada en la contabilidad, los importes de la cuenta provisional de inventario no cuadrarán cuando se notifiquen por dimensión.\\¿Desea conservar la dimensión modificada?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text053 : ENU=You have changed one or more dimensions on the %1, which is already shipped. When you post the line with the changed dimension to General Ledger, amounts on the Inventory Interim account will be out of balance when reported per dimension.\\Do you want to keep the changed dimension?;ESP=Ha modificado una o varias dimensiones de %1, que ya se ha enviado. Al registrar la línea con la dimensión modificada en la contabilidad, los importes de la cuenta provisional de inventario no cuadrarán cuando se notifiquen por dimensión.\\?Desea conservar la dimensión modificada?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text056(Variable 1011)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text056 : ENU=You cannot add an item line because an open inventory pick exists for the Sales Header and because Shipping Advice is %1.\\You must first post or delete the inventory pick or change Shipping Advice to Partial.;ESP=No puede agregar una línea de producto porque existe un picking inventario para la Cabecera venta y porque el Aviso envío es %1.\\Primero debe registrar o eliminar el picking inventario o cambiar el Aviso envío a Parcial.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text056 : ENU=You cannot add an item line because an open inventory pick exists for the Sales Header and because Shipping Advice is %1.\\You must first post or delete the inventory pick or change Shipping Advice to Partial.;ESP=No puede agregar una línea de producto porque existe un picking inventario para la Cabecera venta y porque el Aviso envío es %1.\\Primero debe registrar o eliminar el picking inventario o cambiar el Aviso envío a Parcial.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text057(Variable 1027)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text057 : ENU=must have the same sign as the shipment;ESP=debe tener el mismo signo que el envío.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text057 : ENU=must have the same sign as the shipment;ESP=debe tener el mismo signo que el envío.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text058(Variable 1028)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text058 : ENU=The quantity that you are trying to invoice is greater than the quantity in shipment %1.;ESP=La cantidad que está intentando facturar es mayor que la cantidad en el envío %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text058 : ENU=The quantity that you are trying to invoice is greater than the quantity in shipment %1.;ESP=La cantidad que está intentando facturar es mayor que la cantidad en el envío %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text060(Variable 1041)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text060 : ENU=The quantity that you are trying to invoice is greater than the quantity in return receipt %1.;ESP=La cantidad que está intentando facturar es mayor que la cantidad en la recepción de devolución %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text060 : ENU=The quantity that you are trying to invoice is greater than the quantity in return receipt %1.;ESP=La cantidad que está intentando facturar es mayor que la cantidad en la recepción de devolución %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ItemChargeAssignmentErr(Variable 1097)".

    //var
    //>>>> ORIGINAL VALUE:
    //ItemChargeAssignmentErr : ENU=You can only assign Item Charges for Line Types of Charge (Item).;ESP=Solo puede asignar cargos de producto a los tipos de cargo de línea (producto).;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ItemChargeAssignmentErr : ENU=You can only assign Item Charges for Line Types of Charge (Item).;ESP=Solo puede asignar cargos de producto a los tipos de cargo de línea (producto).;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "SalesLineCompletelyShippedErr(Variable 1053)".

    //var
    //>>>> ORIGINAL VALUE:
    //SalesLineCompletelyShippedErr : ENU=You cannot change the purchasing code for a sales line that has been completely shipped.;ESP=No es posible modificar el código de compra para una línea de venta que se ha enviado por completo.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SalesLineCompletelyShippedErr : ENU=You cannot change the purchasing code for a sales line that has been completely shipped.;ESP=No es posible modificar el código de compra para una línea de venta que se ha enviado por completo.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CannotFindDescErr(Variable 1200)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotFindDescErr : @@@="%1 = Type caption %2 = Description";ENU=Cannot find %1 with Description %2.\\Make sure to use the correct type.;ESP=No se encuentra %1 con la descripción %2.\\Asegúrese de usar el tipo correcto.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotFindDescErr : @@@="%1 = Type caption %2 = Description";ENU=Cannot find %1 with Description %2.\\Make sure to use the correct type.;ESP=No se encuentra %1 con la descripción %2.\\Asegúrese de usar el tipo correcto.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "SelectNonstockItemErr(Variable 1062)".

    //var
    //>>>> ORIGINAL VALUE:
    //SelectNonstockItemErr : ENU=You can only select a catalog item for an empty line.;ESP=Solo puede seleccionar un producto del catálogo para una línea vacía.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SelectNonstockItemErr : ENU=You can only select a catalog item for an empty line.;ESP=Solo puede seleccionar un producto del catálogo para una línea vacía.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "LineDiscountPctErr(Variable 1073)".

    //var
    //>>>> ORIGINAL VALUE:
    //LineDiscountPctErr : ENU=The value in the Line Discount % field must be between 0 and 100.;ESP=El valor en el campo % Descuento línea debe ser entre 0 y 100.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LineDiscountPctErr : ENU=The value in the Line Discount % field must be between 0 and 100.;ESP=El valor en el campo % Descuento línea debe ser entre 0 y 100.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "SalesBlockedErr(Variable 1077)".

    //var
    //>>>> ORIGINAL VALUE:
    //SalesBlockedErr : ENU=You cannot sell this item because the Sales Blocked check box is selected on the item card.;ESP=No puede vender este producto porque la casilla Ventas bloqueadas está seleccionada en la ficha de producto.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SalesBlockedErr : ENU=You cannot sell this item because the Sales Blocked check box is selected on the item card.;ESP=No puede vender este producto porque la casilla Ventas bloqueadas está seleccionada en la ficha de producto.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CannotChangePrepaidServiceChargeErr(Variable 1078)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotChangePrepaidServiceChargeErr : ENU=You cannot change the line because it will affect service charges that are already invoiced as part of a prepayment.;ESP=No puede cambiar la línea porque afectará a los cargos por servicios que ya se han facturado como parte de un prepago.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotChangePrepaidServiceChargeErr : ENU=You cannot change the line because it will affect service charges that are already invoiced as part of a prepayment.;ESP=No puede cambiar la línea porque afectar? a los cargos por servicios que ya se han facturado como parte de un prepago.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "LineAmountInvalidErr(Variable 1089)".

    //var
    //>>>> ORIGINAL VALUE:
    //LineAmountInvalidErr : ENU=You have set the line amount to a value that results in a discount that is not valid. Consider increasing the unit price instead.;ESP=Ha establecido la cantidad de líneas para un valor que da como resultado un descuento que no es válido. En su lugar, considere un aumento del precio unitario.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LineAmountInvalidErr : ENU=You have set the line amount to a value that results in a discount that is not valid. Consider increasing the unit price instead.;ESP=Ha establecido la cantidad de líneas para un valor que da como resultado un descuento que no es válido. En su lugar, considere un aumento del precio unitario.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "UnitPriceChangedMsg(Variable 1091)".

    //var
    //>>>> ORIGINAL VALUE:
    //UnitPriceChangedMsg : @@@="%1 = Type caption %2 = No.";ENU=The unit price for %1 %2 that was copied from the posted document has been changed.;ESP=Se ha modificado el precio unitario de %1 %2 que se copió del documento registrado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UnitPriceChangedMsg : @@@="%1 = Type caption %2 = No.";ENU=The unit price for %1 %2 that was copied from the posted document has been changed.;ESP=Se ha modificado el precio unitario de %1 %2 que se copi? del documento registrado.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CannotAllowInvDiscountErr(Variable 1049)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotAllowInvDiscountErr : @@@=%1 is the name of not valid field;ENU=The value of the %1 field is not valid when the VAT Calculation Type field is set to "Full VAT".;ESP=El valor del campo %1 no es válido si el campo Tipo cálculo IVA está establecido en "Total".;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotAllowInvDiscountErr : @@@=%1 is the name of not valid field;ENU=The value of the %1 field is not valid when the VAT Calculation Type field is set to "Full VAT".;ESP=El valor del campo %1 no es válido si el campo Tipo cálculo IVA está establecido en "Total".;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CannotChangePrepmtAmtDiffVAtPctErr(Variable 1095)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotChangePrepmtAmtDiffVAtPctErr : ENU=You cannot change the prepayment amount because the prepayment invoice has been posted with a different VAT percentage. Please check the settings on the prepayment G/L account.;ESP=No puede cambiar el importe de prepago porque la factura de prepago se ha registrado con un porcentaje de IVA diferente. Compruebe la configuración de la cuenta de prepago.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotChangePrepmtAmtDiffVAtPctErr : ENU=You cannot change the prepayment amount because the prepayment invoice has been posted with a different VAT percentage. Please check the settings on the prepayment G/L account.;ESP=No puede cambiar el importe de prepago porque la factura de prepago se ha registrado con un porcentaje de IVA diferente. Compruebe la configuración de la cuenta de prepago.;
    //Variable type has not been exported.

    var
        "---ARBUMASA---": Integer;
        LinDiaProd: Record "Item Journal Line";
        rstItemTrack: Record "Item Tracking Code";
        cduCreateReservEntry: Codeunit "Create Reserv. Entry";
        ReserveItemJnlLine: Codeunit "Item Jnl. Line-Reserve";
        Producto: Record Item;
        pgeItem: Page "Item Card";
        rstJob: Record Job;
        rstRecursos: Record Resource;
        frmRecursos: Page "Resource List";
        rstProveedor: Record Vendor;
        VBOL: Boolean;
        LinCompras: Record "Purchase Line";
        LCompra: Record "Purchase Line";
        FindHoja: Record "Hist. Lín. solicitud";
        PunProveedor: Record Vendor;
        PostingType: Option " ",Compra,Venta,Settlement;
        rstAct: Record "Actividad AFIP";
        rstRet: Record "Withholding codes";
        rstRecursosporProveedor: Record "Familia recursos por proveedor";
        xrstRecursosporProveedor: Record "Familia recursos por proveedor";
        filFiltroFliaRecurso: Code[250];
        filFiltroSubfliaRecurso: Code[250];
        rstProductos: Record Item;
        frmProductos: Page "Item List";
        rstCuentas: Record "G/L Account";
        frmCuentas: Page "G/L Account List";
        rstActivo: Record "Fixed Asset";
        frmActivo: Page "Fixed Asset List";
        rstGrupoContable: Record "General Posting Setup";
        TipoVal: Option Modificar,Aprobar,"Registrar/Enviar Pedidos","Facturación Automática","Registrar Factura",Confirmar,Eliminar;
        PunProd: Record Item;
}

