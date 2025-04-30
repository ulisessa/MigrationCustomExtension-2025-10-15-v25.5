page 50800 "Input Nivel"
{
    Caption = 'Ingrese nivel';
    PageType = StandardDialog;
    SourceTable = Integer;
    SourceTableView = where(Number = const(1));

    layout
    {
        area(content)
        {
            field(DescrNivel; DescrNivel)
            {
                ApplicationArea = All;
                Caption = 'Descripción de nivel';
            }

            field(MyInputText; MyInputText)
            {
                ApplicationArea = All;
                Caption = 'Ingrese el nivel';
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
                Caption = 'Aceptar';
                trigger OnAction()
                begin
                    //exit(MyInputText);
                end;
            }
        }
    }

    procedure SetNivel(p_DescrNivel: Text[250])
    begin
        DescrNivel := p_DescrNivel;
    end;

    procedure GetNivel(): Text[250]
    begin
        exit(MyInputText);
    end;

    var
        MyInputText: Text[250];
        DescrNivel: Text[250];
}
