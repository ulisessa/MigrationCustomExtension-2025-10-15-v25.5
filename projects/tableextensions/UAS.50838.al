tableextension 50838 tableextension50838 extends "Transfer Header"
{
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Transfer-from Code")
        {
            Caption = 'Transfer-from Code';
        }
        modify("Transfer-from Address")
        {
            Caption = 'Transfer-from Address';
        }
        modify("Transfer-from Address 2")
        {
            Caption = 'Transfer-from Address 2';
        }
        modify("Transfer-from City")
        {
            Caption = 'Transfer-from City';
        }
        modify("Trsf.-from Country/Region Code")
        {
            Caption = 'Trsf.-from Country/Region Code';
        }
        modify("Transfer-to Code")
        {
            Caption = 'Transfer-to Code';
        }
        modify("Transfer-to Address")
        {
            Caption = 'Transfer-to Address';
        }
        modify("Transfer-to Address 2")
        {
            Caption = 'Transfer-to Address 2';
        }
        modify("Trsf.-to Country/Region Code")
        {
            Caption = 'Trsf.-to Country/Region Code';
        }
        modify("Shipment Date")
        {
            Caption = 'Shipment Date';
        }
        modify("Receipt Date")
        {
            Caption = 'Receipt Date';
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        modify("Shortcut Dimension 2 Code")
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        modify("In-Transit Code")
        {
            Caption = 'In-Transit Code';
        }
        modify("Last Shipment No.")
        {
            Caption = 'Last Shipment No.';
        }
        modify("Last Receipt No.")
        {
            Caption = 'Last Receipt No.';
        }
        modify("External Document No.")
        {
            Caption = 'External Document No.';
        }
        modify("Shipping Agent Code")
        {
            Caption = 'Shipping Agent Code';
        }
        modify("Shipping Agent Service Code")
        {
            Caption = 'Shipping Agent Service Code';
        }
        modify("Shipping Time")
        {
            Caption = 'Shipping Time';
        }
        modify("Shipment Method Code")
        {
            Caption = 'Shipment Method Code';
        }
        modify("Transaction Type")
        {
            Caption = 'Transaction Type';
        }
        modify("Area")
        {
            Caption = 'Area';
        }
        modify("Transaction Specification")
        {
            Caption = 'Transaction Specification';
        }
        modify("Shipping Advice")
        {
            Caption = 'Shipping Advice';
        }
        modify("Location Filter")
        {
            Caption = 'Location Filter';
        }
        modify("Has Shipped Lines")
        {
            Caption = 'Has Shipped Lines';
        }

        //Unsupported feature: Code Modification on ""External Document No."(Field 33).OnValidate".

        //trigger "(Field 33)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if (xRec."External Document No." <> "External Document No.") and (Status = Status::Released) then
          WhseTransferRelease.UpdateExternalDocNoForReleasedOrder(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF (xRec."External Document No." <> "External Document No.") AND (Status = Status::Released) THEN
          WhseTransferRelease.UpdateExternalDocNoForReleasedOrder(Rec);
          }
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
          //++Arbu
          "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
          "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
          "Shortcut Dimension 7 Code"
          //--Arbu
        );
        */
        //end;
        field(50503; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(50504; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(50505; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 1 Code';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }
        field(50506; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 2 Code';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }
        field(50507; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 1 Code';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Shortcut Dimension 7 Code");
            end;
        }
    }


    //Unsupported feature: Code Modification on "ShowDocDim(PROCEDURE 3)".

    //procedure ShowDocDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    OldDimSetID := "Dimension Set ID";
    "Dimension Set ID" :=
      DimMgt.EditDimensionSet2(
        "Dimension Set ID",StrSubstNo('%1 %2',TableCaption,"No."),
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");

    if OldDimSetID <> "Dimension Set ID" then begin
      Modify;
      if TransferLinesExist then
        UpdateAllLineDim("Dimension Set ID",OldDimSetID);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++Arbu
        "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
        "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
        "Shortcut Dimension 7 Code"
        //--Arbu
        );
    #6..11
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateAllLineDim(PROCEDURE 34)".

    //procedure UpdateAllLineDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    // Update all lines with changed dimensions.

    if NewParentDimSetID = OldParentDimSetID then
    #4..16
          VerifyShippedLineDimChange(ShippedLineDimChangeConfirmed);

          DimMgt.UpdateGlobalDimFromDimSetID(
            TransLine."Dimension Set ID",TransLine."Shortcut Dimension 1 Code",TransLine."Shortcut Dimension 2 Code");
          TransLine.Modify;
        end;
      until TransLine.Next = 0;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..19
            TransLine."Dimension Set ID",TransLine."Shortcut Dimension 1 Code",TransLine."Shortcut Dimension 2 Code",
            //++Arbu
            TransLine."Shortcut Dimension 3 Code",TransLine."Shortcut Dimension 4 Code",
            TransLine."Shortcut Dimension 5 Code",TransLine."Shortcut Dimension 6 Code",
            TransLine."Shortcut Dimension 7 Code"
            //--Arbu
            );
    #21..23
    */
    //end;


    //Unsupported feature: Code Modification on "GetReceiptLines(PROCEDURE 22)".

    //procedure GetReceiptLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    PurchRcptHeader.SetRange("Location Code","Transfer-from Code");
    PostedPurchaseReceipts.SetTableView(PurchRcptHeader);
    PostedPurchaseReceipts.LookupMode := true;
    if PostedPurchaseReceipts.RunModal = ACTION::LookupOK then begin
      PostedPurchaseReceipts.GetSelectedRecords(TempPurchRcptHeader);
      CreateTransferLinesFromSelectedPurchReceipts(TempPurchRcptHeader);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
    //  PostedPurchaseReceipts.GetSelectedRecords(TempPurchRcptHeader);
      CreateTransferLinesFromSelectedPurchReceipts(TempPurchRcptHeader);
    end;
    */
    //end;


    //Unsupported feature: Code Modification on "CreateTransferLinesFromSelectedPurchReceipts(PROCEDURE 21)".

    //procedure CreateTransferLinesFromSelectedPurchReceipts();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    RecRef.GetTable(TempPurchRcptHeader);
    PurchRcptLine.SetFilter(
      "Document No.",
      SelectionFilterManagement.GetSelectionFilter(RecRef,TempPurchRcptHeader.FieldNo("No.")));
    PurchRcptLine.SetRange(Type,PurchRcptLine.Type::Item);
    PurchRcptLine.SetRange("Location Code","Transfer-from Code");
    PostedPurchaseReceiptLines.SetTableView(PurchRcptLine);
    PostedPurchaseReceiptLines.LookupMode := true;
    if PostedPurchaseReceiptLines.RunModal = ACTION::LookupOK then begin
      PostedPurchaseReceiptLines.GetSelectedRecords(TempPurchRcptLine);
      CreateTransferLinesFromSelectedReceiptLines(TempPurchRcptLine);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    RecRef.GetTable(TempPurchRcptHeader);
    {PurchRcptLine.SETFILTER(
      "Document No.",
      SelectionFilterManagement.GetSelectionFilter(RecRef,TempPurchRcptHeader.FIELDNO("No.")));
    }PurchRcptLine.SetRange(Type,PurchRcptLine.Type::Item);
    #6..9
      //PostedPurchaseReceiptLines.GetSelectedRecords(TempPurchRcptLine);
      CreateTransferLinesFromSelectedReceiptLines(TempPurchRcptLine);
    end;
    */
    //end;


    //Unsupported feature: Code Modification on "AddTransferLineFromReceiptLine(PROCEDURE 25)".

    //procedure AddTransferLineFromReceiptLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TransferLine."Document No." := "No.";
    TransferLine."Line No." := LineNo;
    TransferLine.Validate("Item No.",PurchRcptLine."No.");
    #4..10

    PurchRcptLine.FilterPstdDocLnItemLedgEntries(ItemLedgerEntry);
    ItemTrackingDocMgt.CopyItemLedgerEntriesToTemp(TempItemLedgerEntry,ItemLedgerEntry);
    ItemTrackingMgt.CopyItemLedgEntryTrkgToTransferLine(TempItemLedgerEntry,TransferLine);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..13
    //ItemTrackingMgt.CopyItemLedgEntryTrkgToTransferLine(TempItemLedgerEntry,TransferLine);
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=Do you want to change %1?;ESP=¿Confirma que desea cambiar %1?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=Do you want to change %1?;ESP=?Confirma que desea cambiar %1?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "TransferOrderPostedMsg1(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //TransferOrderPostedMsg1 : @@@="%1 = transfer order number e.g. Transfer order 1003 was successfully posted and is now deleted ";ENU=Transfer order %1 was successfully posted and is now deleted.;ESP=El pedido de transferencia %1 se ha registrado correctamente y ahora está eliminado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TransferOrderPostedMsg1 : @@@="%1 = transfer order number e.g. Transfer order 1003 was successfully posted and is now deleted ";ENU=Transfer order %1 was successfully posted and is now deleted.;ESP=El pedido de transferencia %1 se ha registrado correctamente y ahora está eliminado.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text007(Variable 1014)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text007 : ENU=You may have changed a dimension.\\Do you want to update the lines?;ESP=Puede que haya cambiado una dimensión.\\¿Desea actualizar las líneas?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text007 : ENU=You may have changed a dimension.\\Do you want to update the lines?;ESP=Puede que haya cambiado una dimensión.\\?Desea actualizar las líneas?;
    //Variable type has not been exported.
}

