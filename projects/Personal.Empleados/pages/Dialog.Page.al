Page 50102 "Select Filtering Dates"
{
    Caption = 'Dialog';
    PageType = StandardDialog;
    SourceTable = "Integer";
    SourceTableView = where(number = filter(1));

    layout
    {
        area(content)
        {
            field(StartDate; StartDate)
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Pick the start date', ESP = 'Seleccione la fecha de inicio';
            }
            field(EndDate; EndDate)
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Pick the end date', ESP = 'Seleccione la fecha de fin';
            }
        }
    }
    actions
    {
        area(processing)
        {
            action(Confirm)
            {
                ApplicationArea = All;
                Caption = 'OK';
                trigger OnAction()
                begin
                    // Aquí puedes manejar los valores seleccionados o cerrar el diálogo.
                    CurrPage.Close();
                end;
            }

            action(Cancel)
            {
                ApplicationArea = All;
                Caption = 'Cancel';
                trigger OnAction()
                begin
                    CurrPage.Close();
                end;
            }
        }
    }

    var
        StartDate: Date;
        EndDate: Date;

    procedure SetDates(var p_StartDate: Date; var p_EndDate: Date)
    begin
        StartDate := p_StartDate;
        EndDate := p_EndDate;
    end;

    procedure GetDates(var p_StartDate: Date; var p_EndDate: Date)
    begin
        p_StartDate := StartDate;
        p_EndDate := EndDate;
    end;

}