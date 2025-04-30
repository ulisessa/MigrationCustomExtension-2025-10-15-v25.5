page 50686 "AFIP WS register"
{
    DelayedInsert = false;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "AFIP Interface Register";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry no."; "Entry no.")
                {
                }
                field(Service; Service)
                {
                }
                field(Source; Source)
                {
                }
                field(Destination; Destination)
                {
                }
                field(UniqueID; UniqueID)
                {
                }
                field(GenerationTime; GenerationTime)
                {
                }
                field(ExpirationTime; ExpirationTime)
                {
                }
                field(Token; Token)
                {

                    trigger OnAssistEdit()
                    var
                        strNombre: Text;
                    begin
                        CalcFields(Token);
                        Clear(outStr);

                        strNombre := FieldCaption(Token) + '-' + UniqueID + '.xml';
                        DownloadFile(Rec, strNombre, FieldNo(Token));
                    end;
                }
                field(Sign; Sign)
                {

                    trigger OnAssistEdit()
                    var
                        strNombre: Text;
                    begin
                        CalcFields(Sign);
                        Clear(outStr);
                        strNombre := FieldCaption(Sign) + '-' + UniqueID + '.xml';
                        DownloadFile(Rec, strNombre, FieldNo(Sign));
                    end;
                }
                field(File; File)
                {

                    trigger OnAssistEdit()
                    var
                        strNombre: Text;
                    begin
                        CalcFields(File);
                        Clear(outStr);

                        strNombre := FieldCaption(File) + '-' + UniqueID + '.xml';
                        DownloadFile(Rec, strNombre, FieldNo(File));
                    end;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Exportar token")
            {
                Image = ExportFile;
                Promoted = true;

                trigger OnAction()
                var
                    rst99008535: Codeunit "Temp Blob";
                    rstDD: Record "AFIP Interface Register";
                    outStr: OutStream;
                    filArchivo: File;
                    cduFM: Codeunit GestionArchivos;
                    strRetCualquiera2: Text;
                    strName: Text;
                begin
                    Clear(rstDD);
                    CurrPage.SetSelectionFilter(rstDD);
                    rstDD.FindFirst;
                    rstDD.CalcFields(Token);

                    Clear(outStr);

                    strName := rstDD.Service + ' Token.xml';
                    DownloadFile(rstDD, strName, rstDD.FieldNo(Token));
                end;
            }
            action("Exportar sign")
            {
                Image = ExportFile;
                Promoted = true;

                trigger OnAction()
                var
                    rst99008535: Codeunit "Temp Blob";
                    rstDD: Record "AFIP Interface Register";
                    outStr: OutStream;
                    filArchivo: File;
                    cduFM: Codeunit "File Management";
                    strRetCualquiera2: Text;
                    strName: Text;
                begin
                    Clear(rstDD);
                    CurrPage.SetSelectionFilter(rstDD);
                    rstDD.FindFirst;
                    //rst99008535.INSERT;
                    rstDD.CalcFields(Sign);

                    Clear(outStr);

                    strName := rstDD.Service + ' Sign.xml';
                    DownloadFile(rstDD, strName, rstDD.FieldNo(Sign));
                end;
            }
            action("Exportar file")
            {
                Image = ExportFile;
                Promoted = true;

                trigger OnAction()
                var
                    rstDD: Record "AFIP Interface Register";
                    outStr: OutStream;
                    filArchivo: File;
                    cduFM: Codeunit "File Management";
                    strRetCualquiera2: Text;
                    strName: Text;
                begin
                    Clear(rstDD);
                    CurrPage.SetSelectionFilter(rstDD);
                    rstDD.FindFirst;
                    //rst99008535.INSERT;
                    rstDD.CalcFields(File);

                    Clear(outStr);

                    strName := rstDD.Service + ' File.xml';
                    DownloadFile(rstDD, strName, rstDD.FieldNo(File));                    
                end;
            }
        }
    }

    procedure DownloadFile(rstDD: Record "AFIP Interface Register"; strNombre: Text; intCampo: Integer)
    var
        IStream: InStream;
        ExportFileName: Text;
    begin
        ExportFileName := strNombre;
        CASE intCampo of
            Rec.FieldNo(File):
                begin
                    Rec.CalcFields(File);
                    If Rec.File.HasValue then begin
                        Rec.File.CreateInStream(IStream);
                        DownloadFromStream(IStream, 'Download', '', '', ExportFileName);
                    end;
                end;
            Rec.FieldNo(Token):
                begin
                    Rec.CalcFields(Token);
                    If Rec.File.HasValue then begin
                        Rec.File.CreateInStream(IStream);
                        DownloadFromStream(IStream, 'Download', '', '', ExportFileName);
                    end;
                end;
            Rec.FieldNo(Sign):
                begin
                    Rec.CalcFields(Sign);
                    If Rec.File.HasValue then begin
                        Rec.File.CreateInStream(IStream);
                        DownloadFromStream(IStream, 'Download', '', '', ExportFileName);
                    end;
                end;
        end;
    end;

    var
        outStr: OutStream;
        rst99008535: Codeunit "Temp Blob";
        cduFM: Codeunit "File Management";
        l_optEncoding: Option UTF8,UTF16,Windows;
}

