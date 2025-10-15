tableextension 50424 tableextension50424 extends "Issued Fin. Charge Memo Header"
{
    Caption = 'Issued Fin. Charge Memo Header';
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Customer No.")
        {
            Caption = 'Customer No.';
        }
        modify(Address)
        {
            Caption = 'Address';
        }
        modify("Address 2")
        {
            Caption = 'Address 2';
        }
        modify("Post Code")
        {
            Caption = 'Post Code';
        }
        modify(City)
        {
            Caption = 'City';
        }
        modify("Country/Region Code")
        {
            Caption = 'Country/Region Code';
        }
        modify("Language Code")
        {
            Caption = 'Language Code';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        modify("Shortcut Dimension 2 Code")
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        modify("VAT Registration No.")
        {
            Caption = 'VAT Registration No.';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("Document Date")
        {
            Caption = 'Document Date';
        }
        modify("Fin. Charge Terms Code")
        {
            Caption = 'Fin. Charge Terms Code';
        }
        modify("Interest Posted")
        {
            Caption = 'Interest Posted';
        }
        modify("Interest Amount")
        {
            Caption = 'Interest Amount';
        }
        modify("No. Printed")
        {
            Caption = 'No. Printed';
        }
        modify("Pre-Assigned No. Series")
        {
            Caption = 'Pre-Assigned No. Series';
        }
        modify("Pre-Assigned No.")
        {
            Caption = 'Pre-Assigned No.';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("Tax Area Code")
        {
            Caption = 'Tax Area Code';
        }
        field(50000; "Global Dimension 3 Code"; Code[10])
        {
            CaptionClass = '1,2,3';

        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            CaptionClass = '1,2,4';

        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            CaptionClass = '1,2,5';

        }
        field(50003; "Global Dimension 6 Code"; Code[10])
        {
            CaptionClass = '1,2,6';

        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';

        }
        field(50505; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';

        }
        field(50506; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';

        }
        field(50507; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 1 Code';

        }
        field(50508; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 2 Code';

        }
        field(50509; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 1 Code';

        }
    }


    //Unsupported feature: Code Modification on "PrintRecords(PROCEDURE 1)".

    //procedure PrintRecords();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IsHandled := false;
    OnBeforePrintRecords(Rec,ShowRequestForm,SendAsEmail,HideDialog,IsHandled);
    if IsHandled then
      exit;

    if SendAsEmail then
      DocumentSendingProfile.TrySendToEMail(
        DummyReportSelections.Usage::"Fin.Charge",Rec,FieldNo("No."),ReportDistributionMgt.GetFullDocumentTypeText(Rec),
        FieldNo("Customer No."),not HideDialog)
    else
      DocumentSendingProfile.TrySendToPrinter(
        DummyReportSelections.Usage::"Fin.Charge",Rec,FieldNo("Customer No."),ShowRequestForm)
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5
    {IF SendAsEmail THEN
      DocumentSendingProfile.TrySendToEMail(
        DummyReportSelections.Usage::"Fin.Charge",Rec,FIELDNO("No."),ReportDistributionMgt.GetFullDocumentTypeText(Rec),
        FIELDNO("Customer No."),NOT HideDialog)
    ELSE
      DocumentSendingProfile.TrySendToPrinter(
        DummyReportSelections.Usage::"Fin.Charge",Rec,FIELDNO("Customer No."),ShowRequestForm)
        }
    */
    //end;
}

