page 50506 "Saldos proveedores"
{
    PageType = List;
    SourceTable = "Vendor Ledger Entry";
    SourceTableTemporary = true;
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("qryVLE.Vendor_Posting_Group"; qryVLE.Vendor_Posting_Group)
                {
                }
                field("qryVLE.Currency_Code"; qryVLE.Currency_Code)
                {
                }
                field("qryVLE.Vendor_No"; qryVLE.Vendor_No)
                {
                }
                field("qryVLE.Sum_Amount"; qryVLE.Sum_Amount)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        fntPageData;
    end;

    var
        qryVLE: Query "Saldos proveedores";
        datFiltroFecha: Date;
        i: Integer;

    [Scope('OnPrem')]
    procedure fntPageData()
    begin
        qryVLE.SetFilter(Posting_Date, '%1', datFiltroFecha);
        qryVLE.Open;
        while qryVLE.Read do begin

            i += 1;
            "Entry No." := i;
            "Vendor No." := qryVLE.Vendor_No;
            "Vendor Posting Group" := qryVLE.Vendor_Posting_Group;
            "Currency Code" := qryVLE.Currency_Code;
            Amount := qryVLE.Sum_Amount;
            Insert;

        end;

        if FindFirst then;
    end;
}

