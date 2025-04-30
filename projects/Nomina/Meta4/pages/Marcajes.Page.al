page 50029 Marcajes
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = CardPart;
    SourceTable = "Markup entry";
    SourceTableView = SORTING("Entry no.")
                      ORDER(Descending);

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Entry no."; "Entry no.")
                {
                }
                field("File no."; "File no.")
                {
                }
                field(Name; Name)
                {
                }
                field("Event code"; "Event code")
                {
                }
                field("Markup date and time"; "Markup date and time")
                {
                }
                field("Import date"; "Import date")
                {
                }
                field(Quantity; Quantity)
                {
                }
                field("Workday code"; "Workday code")
                {
                }
                field("% time"; "% time")
                {
                }
                field("Markup type"; "Markup type")
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
        SetRange(Applied, false);
        //CurrPage.EDITABLE(FALSE);
        FindFirst;
    end;

    var
        rstMarkup: Record "Markup entry";
        rstCopy: Record "Markup entry";
        rstMovEmpl: Record "Employee entry";
        frmMarcaje: Page "Insertar marcaje";
        blnEditable: Boolean;

    [Scope('OnPrem')]
    procedure fntEditar()
    begin
        blnEditable := true;
    end;
}

