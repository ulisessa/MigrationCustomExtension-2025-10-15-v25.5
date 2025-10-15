tableextension 51071 tableextension51071 extends "Warehouse Journal Line"
{
    Caption = 'Warehouse Journal Line';
    fields
    {
        modify("Journal Batch Name")
        {
            Caption = 'Journal Batch Name';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("From Zone Code")
        {
            Caption = 'From Zone Code';
        }
        modify("From Bin Code")
        {
            Caption = 'From Bin Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Zone Code")
        {
            Caption = 'Zone Code';
        }
        modify("Bin Code")
        {
            Caption = 'Bin Code';
        }
        modify("Source No.")
        {
            Caption = 'Source No.';
        }
        modify("Source Line No.")
        {
            Caption = 'Source Line No.';
        }
        modify("Source Subline No.")
        {
            Caption = 'Source Subline No.';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("To Zone Code")
        {
            Caption = 'To Zone Code';
        }
        modify("To Bin Code")
        {
            Caption = 'To Bin Code';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("Registering No. Series")
        {
            Caption = 'Registering No. Series';
        }
        modify("From Bin Type Code")
        {
            Caption = 'From Bin Type Code';
        }
        modify("Whse. Document No.")
        {
            Caption = 'Whse. Document No.';
        }
        modify("Whse. Document Type")
        {
            Caption = 'Whse. Document Type';
        }
        modify("Whse. Document Line No.")
        {
            Caption = 'Whse. Document Line No.';
        }
        modify("Qty. (Phys. Inventory)")
        {
            Caption = 'Qty. (Phys. Inventory)';
        }
        modify("Phys. Inventory")
        {
            Caption = 'Phys. Inventory';
        }
        modify("Reference No.")
        {
            Caption = 'Reference No.';
        }
        modify("Qty. (Phys. Inventory) (Base)")
        {
            Caption = 'Qty. (Phys. Inventory) (Base)';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
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
        modify("Phys Invt Counting Period Code")
        {
            Caption = 'Phys Invt Counting Period Code';
        }
        modify("Phys Invt Counting Period Type")
        {
            Caption = 'Phys Invt Counting Period Type';
        }
        field(50014; "Lote origen"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50142; "Ommit position validation"; Boolean)
        {
            Caption = 'Omitir validación de posición';
            DataClassification = ToBeClassified;
        }
        field(50500; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(50501; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(50502; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 2 Code';
            DataClassification = ToBeClassified;

        }
        field(50510; "Net kilos"; Decimal)
        {
            Caption = 'Net kilos';
            DecimalPlaces = 0 : 5;
        }
        field(50511; "Gross kilos"; Decimal)
        {
            Caption = 'Gross kilos';
            DecimalPlaces = 0 : 5;
        }
        field(50512; "Net kilos (Base)"; Decimal)
        {
            Caption = 'Net kilos (Base)';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                Validate("Net kilos", "Net kilos (Base)");
            end;
        }
        field(50513; "Gross kilos (Base)"; Decimal)
        {
            Caption = 'Gross kilos (Base)';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                Validate("Gross kilos", "Gross kilos (Base)");
            end;
        }
        field(50514; "Net kilos (Absolute)"; Decimal)
        {
            Caption = 'Net kilos (Absolute)';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                if not PhysInvtEntered then
                    TestField("Phys. Inventory", false);

                "Net kilos (Absolute, Base)" := "Net kilos (Absolute)";
            end;
        }
        field(50515; "Gross kilos (Absolute)"; Decimal)
        {
            Caption = 'Gross kilos (Absolute)';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                if not PhysInvtEntered then
                    TestField("Phys. Inventory", false);

                "Gross kilos (Absolute, Base)" := "Gross kilos (Absolute)";
            end;
        }
        field(50516; "Net kilos (Absolute, Base)"; Decimal)
        {
            Caption = 'Net kilos (Absolute, Base)';
            DecimalPlaces = 0 : 5;
        }
        field(50517; "Gross kilos (Absolute, Base)"; Decimal)
        {
            Caption = 'Gross kilos (Absolute, Base)';
            DecimalPlaces = 0 : 5;
        }
        field(50518; "Net kilos (Calculated)"; Decimal)
        {
            Caption = 'Net kilos (Calculated)';
            DecimalPlaces = 0 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                Validate("Net kilos (Phys. Inventory)");
            end;
        }
        field(50519; "Gross kilos (Calculated)"; Decimal)
        {
            Caption = 'Gross kilos (Calculated)';
            DecimalPlaces = 0 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                Validate("Gross kilos (Phys. Inventory)");
            end;
        }
        field(50520; "Net kilos (Phys. Inventory)"; Decimal)
        {
            Caption = 'Net kilos (Phys. Inventory)';
            DecimalPlaces = 0 : 5;

        }
        field(50521; "Gross kilos (Phys. Inventory)"; Decimal)
        {
            Caption = 'Net kilos (Phys. Inventory)';
            DecimalPlaces = 0 : 5;

        }
        field(50522; "Net kilos (Calculated) (Base)"; Decimal)
        {
            Caption = 'Net kilos (Calculated) (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50523; "Gross kilo (Calculated) (Base)"; Decimal)
        {
            Caption = 'Gross kilos (Calculated) (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50524; "Net kilos (Phs. Inv.) (Base)"; Decimal)
        {
            Caption = 'Net kilos (Phs. Inv.) (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                "Net kilos (Base)" := "Net kilos (Phs. Inv.) (Base)" - "Net kilos (Calculated) (Base)";
                "Net kilos (Absolute, Base)" := Abs("Net kilos (Base)");
            end;
        }
        field(50525; "Gross kilos (Phs. Inv.) (Base)"; Decimal)
        {
            Caption = 'Gross kilos (Phs. Inv.) (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                "Gross kilos (Base)" := "Gross kilos (Phs. Inv.) (Base)" - "Gross kilo (Calculated) (Base)";
                "Gross kilos (Absolute, Base)" := Abs("Gross kilos (Base)");
            end;
        }
    }


    //Unsupported feature: Code Modification on "CheckBin(PROCEDURE 4)".

    //procedure CheckBin();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IsHandled := false;
    OnBeforeCheckBin(Rec,LocationCode,BinCode,Inbound,IsHandled);
    if IsHandled then
    #4..26
        then
          BinContent.CheckIncreaseBinContent(
            "Qty. (Absolute, Base)",WhseJnlLine."Qty. (Absolute, Base)",
            WhseJnlLine.Cubage,WhseJnlLine.Weight,Cubage,Weight,false,false)
        else begin
          GetBin(LocationCode,BinCode);
          Bin.CheckIncreaseBin(
    #34..44
      end;
      BinContent.SetProposalMode(false);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..29
            WhseJnlLine.Cubage,WhseJnlLine.Weight,Cubage,Weight,false,false,
            //++Arbu
            "Net kilos (Absolute, Base)",WhseJnlLine."Net kilos (Absolute, Base)",
            "Gross kilos (Absolute, Base)",WhseJnlLine."Gross kilos (Absolute, Base)")
            //--Arbu
    #31..47
    */
    //end;


    //Unsupported feature: Code Modification on "OpenJnl(PROCEDURE 12)".

    //procedure OpenJnl();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    WMSMgt.CheckUserIsWhseEmployee;
    CheckTemplateName(
      WhseJnlLine.GetRangeMax("Journal Template Name"),CurrentLocationCode,CurrentJnlBatchName);
    WhseJnlLine.FilterGroup := 2;
    WhseJnlLine.SetRange("Journal Batch Name",CurrentJnlBatchName);
    if CurrentLocationCode <> '' then
      WhseJnlLine.SetRange("Location Code",CurrentLocationCode);
    WhseJnlLine.FilterGroup := 0;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //WMSMgt.CheckUserIsWhseEmployee;
    #2..8
    */
    //end;


    //Unsupported feature: Code Modification on "FindExistingBatch(PROCEDURE 26)".

    //procedure FindExistingBatch();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    WhseJnlBatch.SetRange("Journal Template Name",CurrentJnlTemplateName);
    WhseJnlBatch.SetRange(Name,CurrentJnlBatchName);

    #4..7
    end;

    WhseJnlBatch.SetRange(Name);
    CurrentLocationCode := WMSMgt.GetDefaultDirectedPutawayAndPickLocation;
    WhseJnlBatch.SetRange("Location Code",CurrentLocationCode);

    if WhseJnlBatch.FindFirst then begin
    #15..28
    end;

    exit(false);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..10
    //CurrentLocationCode := WMSMgt.GetDefaultDirectedPutawayAndPickLocation;
    #12..31
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1012)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text003 : ENU=Default Journal;ESP=Diario genérico;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : ENU=Default Journal;ESP=Diario genérico;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text005(Variable 1011)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text005 : ENU=The location %1 of warehouse journal batch %2 is not enabled for user %3.;ESP=El almacén %1 de la secc. diario almacén %2 no está habilitada para usuario %3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text005 : ENU=The location %1 of warehouse journal batch %2 is not enabled for user %3.;ESP=El almacén %1 de la secc. diario almacén %2 no está habilitada para usuario %3.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text006(Variable 1017)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text006 : ENU=%1 must be 0 or 1 for an Item tracked by Serial Number.;ESP=%1 debe ser 0 o 1 para un producto del que se realiza seguim. por No. serie.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text006 : ENU=%1 must be 0 or 1 for an Item tracked by Serial Number.;ESP=%1 debe ser 0 o 1 para un producto del que se realiza seguim. por No.serie.;
    //Variable type has not been exported.
}

