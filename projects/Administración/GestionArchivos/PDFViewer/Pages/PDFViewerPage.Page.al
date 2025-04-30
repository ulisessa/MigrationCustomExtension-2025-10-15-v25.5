page 50599 "PDFViewer Page"
{
    AutoSplitKey = false;
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = false;
    PageType = Card;
    SaveValues = false;
    ShowFilter = false;

    layout
    {
        area(content)
        {
            field(URL; URL)
            {
            }
            usercontrol(PDFViewer; WebPageViewer)
            {

                trigger ControlAddInReady(callbackUrl: Text)
                var
                    FileManagement: Codeunit "File Management";
                begin
                    if DocumentPath = '' then
                        Error(NoDocErr);

                    CurrPage.PDFViewer.Navigate(DocumentPath);
                end;

                trigger DocumentReady()
                begin
                end;

                trigger Callback(data: Text)
                begin
                end;

                trigger Refresh(callbackUrl: Text)
                var
                    FileManagement: Codeunit "File Management";
                begin
                    if DocumentPath <> '' then
                        CurrPage.PDFViewer.Navigate(DocumentPath);
                end;
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    var
        rstInfoEmpresa: Record "Company Information";
    begin
        rstInfoEmpresa.Get();
        if StrPos(UpperCase(URL), UpperCase(rstInfoEmpresa."Ruta Intranet")) = 0 then
            DocumentPath := rstInfoEmpresa."Ruta Intranet" + (ConvertStr(CopyStr(URL, StrLen(rstInfoEmpresa."Ruta de digitalizacion"), 250), '\', '/'))
        else
            DocumentPath := URL;

        //MESSAGE('%1',DocumentPath)
    end;

    var
        URL: Text[1024];
        DocumentPath: Text[250];
        NoDocErr: Label 'No document has been specified.';

    [Scope('OnPrem')]
    procedure SetURL(var newURL: Text[1024])
    begin
        URL := newURL;

        //CurrPage.UPDATE(FALSE);
    end;
}

