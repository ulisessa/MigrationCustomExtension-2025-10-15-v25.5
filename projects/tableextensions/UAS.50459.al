tableextension 50459 tableextension50459 extends "Reservation Entry"
{
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Creation Date")
        {
            Caption = 'Creation Date';
        }
        modify("Transferred from Entry No.")
        {
            Caption = 'Transferred from Entry No.';
        }
        modify("Source Batch Name")
        {
            Caption = 'Source Batch Name';
        }
        modify("Source Prod. Order Line")
        {
            Caption = 'Source Prod. Order Line';
        }
        modify("Source Ref. No.")
        {
            Caption = 'Source Ref. No.';
        }
        modify("Item Ledger Entry No.")
        {
            Caption = 'Item Ledger Entry No.';
        }
        modify("Expected Receipt Date")
        {
            Caption = 'Expected Receipt Date';
        }
        modify("Shipment Date")
        {
            Caption = 'Shipment Date';
        }
        modify("Serial No.")
        {
            Caption = 'Serial No.';
        }
        modify("Action Message Adjustment")
        {
            Caption = 'Action Message Adjustment';
        }
        modify("Suppressed Action Msg.")
        {
            Caption = 'Suppressed Action Msg.';
        }
        modify("Planning Flexibility")
        {
            Caption = 'Planning Flexibility';
        }
        modify("Appl.-to Item Entry")
        {
            Caption = 'Appl.-to Item Entry';
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
        modify("Disallow Cancellation")
        {
            Caption = 'Disallow Cancellation';
        }
        modify("Lot No.")
        {
            Caption = 'Lot No.';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify(Correction)
        {
            Caption = 'Correction';
        }
        field(50010; "Net kilos (Base)"; Decimal)
        {
            Caption = 'Net kilos (Base)';
            ToolTip = 'Specifies the value of the Net kilos (Base) field.';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                "Net kilos" := Round("Net kilos (Base)", 0.00001);
                "Net kilos to Handle (Base)" := "Net kilos (Base)";
                "Net kilos to Invoice (Base)" := "Net kilos (Base)";
            end;
        }
        field(50011; "Gross kilos (Base)"; Decimal)
        {
            Caption = 'Gross kilos (Base)';
            ToolTip = 'Specifies the value of the Gross kilos (Base) field.';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                "Gross kilos" := Round("Gross kilos (Base)", 0.00001);
                "Gross kilos to Handle (Base)" := "Gross kilos (Base)";
                "Gross kilos to Invoice (Base)" := "Gross kilos (Base)";
            end;
        }
        field(50012; "Net kilos"; Decimal)
        {
            Caption = 'Net kilos';
            ToolTip = 'Specifies the value of the Net kilos field.';
            DecimalPlaces = 0 : 5;
        }
        field(50013; "Gross kilos"; Decimal)
        {
            Caption = 'Gross kilos';
            ToolTip = 'Specifies the value of the Gross kilos field.';
            DecimalPlaces = 0 : 5;
        }
        field(50014; "Net kilos to Handle (Base)"; Decimal)
        {
            Caption = 'Net kilos to Handle (Base)';
            ToolTip = 'Specifies the value of the Net kilos to Handle (Base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50015; "Gross kilos to Handle (Base)"; Decimal)
        {
            Caption = 'Gross kilos to Handle (Base)';
            ToolTip = 'Specifies the value of the Gross kilos to Handle (Base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50016; "Net kilos to Invoice (Base)"; Decimal)
        {
            Caption = 'Net kilos to Invoice (Base)';
            ToolTip = 'Specifies the value of the Net kilos to Invoice (Base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50017; "Gross kilos to Invoice (Base)"; Decimal)
        {
            Caption = 'Gross kilos to Invoice (Base)';
            ToolTip = 'Specifies the value of the Gross kilos to Invoice (Base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50018; "Net kilos Invoiced (Base)"; Decimal)
        {
            Caption = 'Net kilos Invoiced (Base)';
            ToolTip = 'Specifies the value of the Net kilos Invoiced (Base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50019; "Gross kilos Invoiced (Base)"; Decimal)
        {
            Caption = 'Gross kilos Invoiced (Base)';
            ToolTip = 'Specifies the value of the Gross kilos Invoiced (Base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50020; "Reserved Pick & Ship Nk"; Decimal)
        {
            Caption = 'Reserved Pick & Ship Nk';
            ToolTip = 'Specifies the value of the Reserved Pick & Ship Nk field.';
            DecimalPlaces = 0 : 5;
        }
        field(50021; "Reserved Pick & Ship Gk"; Decimal)
        {
            Caption = 'Reserved Pick & Ship Gk';
            ToolTip = 'Specifies the value of the Reserved Pick & Ship Gk field.';
            DecimalPlaces = 0 : 5;
        }
    }

    //Unsupported feature: Parameter Insertion (Parameter: TransferQtyKN) (ParameterCollection) on "TransferReservations(PROCEDURE 22)".


    //Unsupported feature: Parameter Insertion (Parameter: TransferQtyKB) (ParameterCollection) on "TransferReservations(PROCEDURE 22)".



    //Unsupported feature: Code Modification on "TransferReservations(PROCEDURE 22)".

    //procedure TransferReservations();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if TransferAll then begin
      OldReservEntry.FindSet;
      OldReservEntry.TestField("Qty. per Unit of Measure",QtyPerUOM);
    #4..16
        if OldReservEntry.FindSet then
          repeat
            OldReservEntry.TestItemFields(ItemNo,VariantCode,LocationCode);

            TransferQty :=
              CreateReservEntry.TransferReservEntry(
                SourceType,SourceSubtype,SourceID,SourceBatchName,SourceProdOrderLine,SourceRefNo,
                QtyPerUOM,OldReservEntry,TransferQty);
          until (OldReservEntry.Next = 0) or (TransferQty = 0);
      end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..19
            //++Arbu
            //TransferQty :=
              CreateReservEntry.TransferReservEntry(
                SourceType,SourceSubtype,SourceID,SourceBatchName,SourceProdOrderLine,SourceRefNo,
                QtyPerUOM,OldReservEntry,TransferQty,TransferQtyKN,TransferQtyKB
                //--Arbu
                );
          until (OldReservEntry.Next = 0) or (TransferQty = 0);
      end;
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=Line;ESP=Línea;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=Line;ESP=Línea;
    //Variable type has not been exported.
}

