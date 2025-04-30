page 50590 PDFViewer
{
    AutoSplitKey = false;
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = false;
    PageType = CardPart;
    SaveValues = false;
    ShowFilter = false;

    layout
    {
        area(content)
        {
            field(URL; URL)
            {
            }
        }
    }

    actions
    {
    }

    var
        URL: Text[1024];

    [Scope('OnPrem')]
    procedure SetURL(var newURL: Text[1024])
    begin
        URL := newURL;
        //CurrPage.UPDATE(FALSE);
    end;
}

