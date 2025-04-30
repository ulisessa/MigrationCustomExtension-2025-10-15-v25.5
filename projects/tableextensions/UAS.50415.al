tableextension 50415 tableextension50415 extends "Issued Reminder Header"
{
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
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("Document Date")
        {
            Caption = 'Document Date';
        }
        modify("Reminder Terms Code")
        {
            Caption = 'Reminder Terms Code';
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
        modify("Add. Fee per Line")
        {
            Caption = 'Add. Fee per Line';
        }
        field(50000; "Global Dimension 3 Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Global Dimension 6 Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,1,7';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));
        }
        field(50505; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(50506; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
        }
        field(50507; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));
        }
        field(50508; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 2 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));
        }
        field(50509; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));
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
    #4..11
        repeat
          IssuedReminderHeaderToSend.Copy(IssuedReminderHeader);
          IssuedReminderHeaderToSend.SetRecFilter;
          DocumentSendingProfile.TrySendToEMail(
            DummyReportSelections.Usage::Reminder,IssuedReminderHeaderToSend,IssuedReminderHeaderToSend.FieldNo("No."),
            ReportDistributionMgt.GetFullDocumentTypeText(Rec),IssuedReminderHeaderToSend.FieldNo("Customer No."),not HideDialog)
        until IssuedReminderHeader.Next = 0;
    end else
      DocumentSendingProfile.TrySendToPrinter(
        DummyReportSelections.Usage::Reminder,Rec,
        IssuedReminderHeaderToSend.FieldNo("Customer No."),ShowRequestForm);

    OnAfterPrintRecords(Rec,ShowRequestForm,SendAsEmail,HideDialog);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..14
    {      DocumentSendingProfile.TrySendToEMail(
            DummyReportSelections.Usage::Reminder,IssuedReminderHeaderToSend,IssuedReminderHeaderToSend.FIELDNO("No."),
            ReportDistributionMgt.GetFullDocumentTypeText(Rec),IssuedReminderHeaderToSend.FIELDNO("Customer No."),NOT HideDialog)
     }   until IssuedReminderHeader.Next = 0;
    #19..24
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "SuppresSendDialogQst(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //SuppresSendDialogQst : ENU=Do you want to suppress send dialog?;ESP=¿Quiere suprimir el cuadro de diálogo de envío?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SuppresSendDialogQst : ENU=Do you want to suppress send dialog?;ESP=?Quiere suprimir el cuadro de diálogo de envío?;
    //Variable type has not been exported.
}

