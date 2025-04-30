page 50070 "Mov. marcajes"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Markup entry";
    SourceTableView = SORTING("File no.", "Markup date and time");
    ApplicationArea = All;
    UsageCategory = Administration;
    
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
                field("Company no."; "Company no.")
                {
                }
                field("File no."; "File no.")
                {
                }
                field("Hiring date"; "Hiring date")
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
                field("User ID"; "User ID")
                {
                }
                field(Applied; Applied)
                {
                }
                field(Name; Name)
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
                field(Userid; Userid)
                {
                }
                field(CheckType; CheckType)
                {
                }
                field(Sensorid; Sensorid)
                {
                }
                field(Checked; Checked)
                {
                }
                field(WorkType; WorkType)
                {
                }
                field(AttFlag; AttFlag)
                {
                }
                field("Fecha filtro"; "Fecha filtro")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Acci&ones")
            {
                Caption = 'Acci&ones';
                action("Eliminar aplicación")
                {
                    Caption = 'Eliminar aplicación';
                    Image = Delete;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        CurrPage.SetSelectionFilter(Rec);
                        if Rec.FindSet(true) then
                            repeat

                                Clear(rstMovEmpl);
                                rstMovEmpl.SetRange("Company no.", "Company no.");
                                rstMovEmpl.SetRange("File no.", "File no.");
                                rstMovEmpl.SetRange("Start record", "Entry no.");
                                if rstMovEmpl.FindFirst then
                                    rstMovEmpl.Delete;

                                Clear(rstMovEmpl);
                                rstMovEmpl.SetRange("Company no.", "Company no.");
                                rstMovEmpl.SetRange("File no.", "File no.");
                                rstMovEmpl.SetRange("Finish record", "Entry no.");
                                if rstMovEmpl.FindFirst then
                                    rstMovEmpl.Delete;

                                Applied := false;
                                Modify;

                            until Next = 0;
                    end;
                }
                action("E&ditar marcajes")
                {
                    Caption = 'E&ditar marcajes';
                    Image = Edit;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        CurrPage.Editable(true);
                    end;
                }
                action("Neutralizar marcaje")
                {
                    Caption = 'Neutralizar marcaje';
                    Image = VoidRegister;
                    Promoted = true;
                    PromotedIsBig = true;
                    ShortCutKey = 'F4';

                    trigger OnAction()
                    begin
                        Quantity := 0;
                        Modify;
                    end;
                }
                action("Inicializar marcaje")
                {
                    Caption = 'Inicializar marcaje';
                    Image = CreateDocument;
                    Promoted = true;
                    PromotedIsBig = true;
                    ShortCutKey = 'F3';

                    trigger OnAction()
                    begin
                        Clear(frmMarcaje);
                        frmMarcaje.fntMarcaje(Rec);
                        frmMarcaje.RunModal;
                    end;
                }
            }
        }
    }

    trigger OnInit()
    begin
        //CurrPage.EDITABLE(FALSE);
    end;

    trigger OnOpenPage()
    begin
        //SETRANGE(Applied,FALSE);
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

