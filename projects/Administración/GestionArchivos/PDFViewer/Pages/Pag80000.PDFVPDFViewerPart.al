page 50576 "PDFV PDF Viewer Part"
{

    Caption = 'PDF Viewer';
    PageType = CardPart;
    UsageCategory = None;
    SourceTable = "Purch. Inv. Header";
    layout
    {
        area(content)
        {
            group(General)
            {
                ShowCaption = false;
                usercontrol(PDFViewer; "PDFV PDF Viewer")
                {
                    ApplicationArea = All;

                    trigger ControlAddinReady()
                    begin
                        SetPDFDocument();
                    end;

                    trigger onView()
                    begin
                        RunFullView();
                    end;
                }
            }
        }
    }
    local procedure SetPDFDocument()
    var
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        InStreamVar: InStream;
        rstPDFStorage: Record "PDFV PDF Storage";
        OutStreamVar: OutStream;
        PDFAsTxt: Text;
        URLLinkToPDF: Text;
        cduEscaneado: Codeunit "Escaneado";
    begin


        Rec.CalcFields("Archivo vinculado");

        CurrPage.PDFViewer.SetVisible(StrLen(Rec."Archivo vinculado") <> 0);
        if StrLen(Rec."Archivo vinculado") = 0 then
            exit;

        cduEscaneado.TraerHTMLInternet(URLLinkToPDF, rec."Archivo vinculado");
        /*
        DownloadPDFToStream(URLLinkToPDF, InStreamVar);
        adf
        TempBlob.FromRecord(Rec, Rec.FieldNo("Archivo vinculado"));
        TempBlob.CreateInStream(InStreamVar);
        */
        //PDFAsTxt := Base64Convert.ToBase64(InStreamVar);
        PDFAsTxt := DownloadPDF(URLLinkToPDF);

        CurrPage.PDFViewer.LoadPDF(PDFAsTxt, false);
        //Message(Rec."Archivo vinculado");
    end;

    local procedure RunFullView()
    var
        PDFViewerCard: Page "PDFV PDF Viewer";
    begin
        if Rec.IsEmpty() then
            exit;
        PDFViewerCard.SetRecord(Rec);
        PDFViewerCard.SetTableView(Rec);
        PDFViewerCard.Run();
    end;

    procedure DownloadPDF(FileUrl: Text): Text
    var
        HttpClient: HttpClient;
        HttpResponseMessage: HttpResponseMessage;
        InStream: InStream;
    begin
        // Realiza la solicitud HTTP GET
        HttpClient.Get(FileUrl, HttpResponseMessage);

        if not HttpResponseMessage.IsSuccessStatusCode() then
            Error('No se pudo descargar el archivo. Código de estado HTTP: %1', HttpResponseMessage.HttpStatusCode);

        // Lee el contenido como un InStream
        HttpResponseMessage.Content.ReadAs(InStream);

        // Devuelve el InStream
        exit(ConvertStreamToBase64(InStream));
    end;

    procedure ConvertStreamToBase64(PDFStream: InStream): Text
    var
        Base64Converter: Codeunit "Base64 Convert";
        Base64String: Text;
    begin
        Base64String := Base64Converter.ToBase64(PDFStream);
        exit(Base64String);
    end;

}
