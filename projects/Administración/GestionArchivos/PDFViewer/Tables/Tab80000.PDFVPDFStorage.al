table 50605 "PDFV PDF Storage"
{
    Caption = 'PDF Storage';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; BigInteger)
        {
            Caption = 'Entry No.';
            ToolTip = 'Specifies the value of the Entry No field.';
            DataClassification = CustomerContent;
            AutoIncrement = true;
        }
        field(2; "Source Record ID"; RecordId)
        {
            Caption = 'Source Record ID';
            ToolTip = 'Specifies the value of the Source Record ID field.';
            DataClassification = CustomerContent;
        }
        field(3; "PDF Value"; Blob)
        {
            Caption = 'PDF Value';
            ToolTip = 'Specifies the value of the PDF Value field.';
            DataClassification = CustomerContent;
        }
        field(4; Description; Text[200])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

    procedure UploadContent(SourceRecordID: RecordId)
    var
        InStreamVar: InStream;
        OutStreamVar: OutStream;
        FileName: Text;
    begin
        Rec.Init();
        Rec.CalcFields("PDF Value");

        Rec."PDF Value".CreateOutStream(OutStreamVar);
        if not UploadIntoStream(UploadTitleLbl, '', FileFilterLbl, FileName, InStreamVar) then
            exit;
        CopyStream(OutStreamVar, InStreamVar);
        Rec.Description := CopyStr(FileName, 1, MaxStrLen(Rec.Description));
        if SourceRecordID.TableNo() <> 0 then
            Rec."Source Record ID" := SourceRecordID;
        Rec.Insert(true);
    end;

    procedure DownloadContent()
    var
        FileManagement: Codeunit "File Management";
        InStreamVar: InStream;
        FileName: Text;
    begin
        Rec.CalcFields("PDF Value");

        if not Rec."PDF Value".HasValue() then
            exit;
        Rec."PDF Value".CreateInStream(InStreamVar);
        FileName := Rec.Description;
        if FileManagement.GetExtension(FileName) <> DelStr(PDFExtLbl, 1) then
            FileName += PDFExtLbl;
        DownloadFromStream(InStreamVar, DownloadTitleLbl, '', FileFilterLbl, FileName);
    end;

    var
        FileFilterLbl: Label 'PDF file(*.pdf)|*.pdf', Locked = true;
        PDFExtLbl: Label '.pdf', Locked = true;
        UploadTitleLbl: Label 'Upload PDF File';
        DownloadTitleLbl: Label 'Download PDF File';
}
