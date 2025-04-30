page 50095 "Lista líneas compra"
{
    AutoSplitKey = true;
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Purch. Inv. Line";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Type; Type)
                {
                    Editable = false;
                }
                field("No."; "No.")
                {
                    Editable = false;
                }
                field(Description; Description)
                {
                    Editable = false;
                }
                field("VAT %"; "VAT %")
                {
                    Editable = false;
                }
                field("Cód. retención IVA"; "Cód. retención IVA")
                {
                }
                field("Cód. retención ganancias"; "Cód. retención ganancias")
                {
                }
                field("Cód. retención SS"; "Cód. retención SS")
                {
                }
                field("Cód. retención IIBB"; "Cód. retención IIBB")
                {
                }
                field("Actividad AFIP"; "Actividad AFIP")
                {
                }
                field(Amount; Amount)
                {
                    Editable = false;
                }
                field("Amount Including VAT"; "Amount Including VAT")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

