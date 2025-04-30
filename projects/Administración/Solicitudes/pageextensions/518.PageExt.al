pageextension 518 "Purchase Lines Extension" extends "Purchase Lines"
{
    layout
    {
        // Add changes to page layout here
    }
    
    actions
    {
        // Add changes to page actions here
    }
    
    trigger OnAfterGetRecord()
    begin
        ShowShortcutDimCode(ShortcutDimCode);
        Clear(rstVendor);
        if rstVendor.Get("Buy-from Vendor No.") then;
        Clear(PurchHeader);
        PurchHeader.Get("Document Type", "Document No.");
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Clear(ShortcutDimCode);
    end;

    trigger OnOpenPage()
    begin
        if blnEditable then
            CurrPage.Editable(true)
        else
            CurrPage.Editable(false);

        SetCurrentKey("Unit Cost (LCY)", "Outstanding Quantity");
        SetAscending("Unit Cost (LCY)", true);
        SetAscending("Outstanding Quantity", false);
    end;

    var
        PurchHeader: Record "Purchase Header";
        ShortcutDimCode: array[8] of Code[20];
        strVendorName: Text;
        rstVendor: Record Vendor;
        blnEditable: Boolean;
        codPT: Code[10];

    [Scope('OnPrem')]
    procedure HacerEditable(l_blnEditable: Boolean)
    begin
        blnEditable := true;
    end;

}