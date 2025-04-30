table 50009 "Weighing Records"
{

    fields
    {
        field(1; "Shipment No."; Code[20])
        {
            Caption = 'No. remito';
            DataClassification = ToBeClassified;
        }
        field(2; "Weighing line no."; Integer)
        {
            Caption = 'No. línea pesada';
            DataClassification = ToBeClassified;
        }
        field(3; "Qty. per Bulk"; Integer)
        {
            Caption = 'Cantidad por Bulto';
            DataClassification = ToBeClassified;
        }
        field(4; "Scale code"; Code[10])
        {
            Caption = 'Cód. balanza';
            DataClassification = ToBeClassified;
        }
        field(5; "Location code"; Code[10])
        {
            Caption = 'Cód. depósito';
            DataClassification = ToBeClassified;
        }
        field(6; "Item no."; Code[20])
        {
            Caption = 'No. producto';
            DataClassification = ToBeClassified;
            TableRelation = Item."No.";

            trigger OnValidate()
            var
                l_rst27: Record Item;
                l_pgeIL: Page "Item List";
                l_rstIS: Record "Inventory Setup";
            begin
                Clear(l_rst27);
                if l_rst27.Get("Item no.") then
                    "Item description" := l_rst27.Description;
                /*
                CLEAR(l_rst27);
                CLEAR(l_rstIS);
                l_rstIS.GET();
                l_rst27.SETRANGE("Item Category Code",l_rstIS."Categoria productos pesca");
                CLEAR(l_pgeIL);
                l_pgeIL.LOOKUPMODE(TRUE);
                l_pgeIL.SETTABLEVIEW(l_rst27);
                IF l_pgeIL.RUNMODAL = ACTION::LookupOK THEN
                BEGIN
                  l_pgeIL.GETRECORD(l_rst27);
                  VALIDATE("Item no.",l_rst27."No.");
                END;
                */

            end;
        }
        field(7; "Item description"; Text[199])
        {
            Caption = 'Descripción producto';
            DataClassification = ToBeClassified;
        }
        field(8; "Lot no."; Code[30])
        {
            Caption = 'No. lote';
            DataClassification = ToBeClassified;
            TableRelation = "Item Ledger Entry"."Lot No." WHERE ("Item No." = FIELD ("Item no."),
                                                                 "Location Code" = FIELD ("Location code"),
                                                                 Open = CONST (true));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            var
                l_pgeILE: Page "Item Ledger Entries";
                l_rst32: Record "Item Ledger Entry";
                l_rst27: Record Item;
            begin
                Clear(l_rst32);
                if "Item no." <> '' then
                    l_rst32.SetRange("Item No.", "Item no.");
                if "Location code" <> '' then
                    l_rst32.SetRange("Location Code", "Location code");
                l_rst32.SetRange(Positive, true);
                l_rst32.SetRange(Open, true);
                Clear(l_pgeILE);
                l_pgeILE.LookupMode(true);
                l_pgeILE.SetTableView(l_rst32);
                if l_pgeILE.RunModal = ACTION::LookupOK then begin
                    l_pgeILE.GetRecord(l_rst32);
                    Validate("Item no.", l_rst32."Item No.");
                    Clear(l_rst27);
                    l_rst27.Get(l_rst32."Item No.");
                    "Item description" := l_rst27.Description;
                    Validate("Qty. per Bulk", l_rst32."Remaining Quantity");
                    Validate("Location code", l_rst32."Location Code");
                    Validate("Lot no.", l_rst32."Lot No.");
                    Validate("Pallet no.", l_rst32."Pallet no.");
                    Validate("Lote origen", l_rst32."Lote origen");
                    "Item ledger entry no." := l_rst32."Entry No.";
                end;
            end;
        }
        field(9; "Pallet no."; Code[20])
        {
            Caption = 'No. pallet';
            DataClassification = ToBeClassified;
            TableRelation = "Item Ledger Entry"."Pallet no." WHERE ("Item No." = FIELD ("Item no."),
                                                                    "Location Code" = FIELD ("Location code"),
                                                                    Open = CONST (true));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            var
                l_pgeILE: Page "Item Ledger Entries";
                l_rst32: Record "Item Ledger Entry";
                l_rst27: Record Item;
            begin
                Clear(l_rst32);
                if "Item no." <> '' then
                    l_rst32.SetRange("Item No.", "Item no.");
                if "Location code" <> '' then
                    l_rst32.SetRange("Location Code", "Location code");
                l_rst32.SetRange(Positive, true);
                l_rst32.SetRange(Open, true);
                Clear(l_pgeILE);
                l_pgeILE.LookupMode(true);
                l_pgeILE.SetTableView(l_rst32);
                if l_pgeILE.RunModal = ACTION::LookupOK then begin
                    l_pgeILE.GetRecord(l_rst32);
                    Validate("Item no.", l_rst32."Item No.");
                    Clear(l_rst27);
                    l_rst27.Get(l_rst32."Item No.");
                    "Item description" := l_rst27.Description;
                    Validate("Qty. per Bulk", l_rst32."Remaining Quantity");
                    Validate("Location code", l_rst32."Location Code");
                    Validate("Lot no.", l_rst32."Lot No.");
                    Validate("Pallet no.", l_rst32."Pallet no.");
                    Validate("Lote origen", l_rst32."Lote origen");
                    "Item ledger entry no." := l_rst32."Entry No.";
                end;
                if not Insert then
                    Modify;
            end;
        }
        field(10; "Weighing Date and Time"; DateTime)
        {
            Caption = 'Fecha y hora pesada';
            DataClassification = ToBeClassified;
        }
        field(11; Tare; Integer)
        {
            Caption = 'Tara';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                fntCalcQty;
            end;
        }
        field(12; "Gross + Tare"; Decimal)
        {
            Caption = 'Bruto + Tara';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Gross := "Gross + Tare" - Tare;
            end;
        }
        field(13; Gross; Decimal)
        {
            Caption = 'Bruto';
            DataClassification = ToBeClassified;
        }
        field(14; Detail; Text[30])
        {
            Caption = 'Detalles';
            DataClassification = ToBeClassified;
        }
        field(15; Confirmed; Option)
        {
            Caption = 'Confirmado';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Pesar activamente",Confirmada,Reabrir;
        }
        field(16; Status; Text[50])
        {
            Caption = 'Estado';
            DataClassification = ToBeClassified;
        }
        field(17; "Lote origen"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Item ledger entry no."; Integer)
        {
            Caption = 'No. mov. producto';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Shipment No.", "Weighing line no.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    local procedure fntCalcQty()
    begin
        if Tare < 0 then
            Tare := Tare * -1;

        if (Tare <> 0) and ("Gross + Tare" <> 0) then
            Gross := "Gross + Tare" - Tare;

        if (Tare = 0) and (Gross <> 0) then
            "Gross + Tare" := Gross;

        if not Insert then
            Modify;
    end;

    local procedure fntConfirmed(): Boolean
    begin
        if (Confirmed = Confirmed::Confirmada)
          and ("Qty. per Bulk" <> 0)
          and ("Scale code" <> '')
          and ("Location code" <> '')
          and ("Item no." <> '')
          and (Tare <> 0)
        then
            exit(false)
        else
            exit(true);
    end;
}

