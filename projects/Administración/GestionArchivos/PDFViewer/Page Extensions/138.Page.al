pageextension 50138 "PDF in purchase invoices" extends "Posted Purchase Invoice" //OriginalId
{
    layout
    {
        /*
        addfirst(factboxes)
        {
            part(PDFViewerMatrix; "PDFV PDF Viewer Matrix")
            {
                ApplicationArea = All;
            }
        }
        */
        addbefore("Invoice Details")
        {
            group(Documento)
            {
                part(PDFViewerCardPart; "PDFV PDF Viewer Part")
                {
                    ApplicationArea = All;
                    SubPageLink = "No." = field("No.");
                }

            }
        }
    }
    /*
    actions
    {
        addfirst(processing)
        {
            action(PDFVPDFStorage)
            {
                ApplicationArea = All;
                Image = Database;
                Caption = 'PDF Storage';
                ToolTip = 'PDF Storage';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    PDFStorage: Record "PDFV PDF Storage";
                    PDFStorageList: Page "PDFV PDF Storage";
                begin
                    Clear(PDFStorageList);
                    PDFStorage.SetRange("Source Record ID", Rec.RecordId());
                    PDFStorageList.SetTableView(PDFStorage);
                    PDFStorageList.Run();
                end;
            }
        }
    }
    */
    trigger OnAfterGetCurrRecord()
    begin
        //CurrPage.PDFViewerMatrix.Page.SetRecord(Rec.RecordId());
        Rec.CalcFields("Archivo vinculado");
        CurrPage.PDFViewerCardPart.Page.SetRecord(Rec);
    end;

}