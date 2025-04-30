page 50631 "Lista Maestro de Validaciones"
{
    PageType = List;
    SourceTable = "Maestro validaciones";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Cód. validación"; "Cód. validación")
                {
                }
                field("Descripción"; Descripción)
                {
                }
                field(Tabla; Tabla)
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("A&cciones")
            {
                Caption = 'A&cciones';
                action(Detalles)
                {
                    Caption = 'Detalles';
                    RunObject = Page "Lista validaciones";
                    RunPageLink = "Cód. validación" = FIELD ("Cód. validación");
                    ShortCutKey = 'Shift+F5';
                }
                action(Ejecutar)
                {
                    Caption = 'Ejecutar';

                    trigger OnAction()
                    begin
                        Clear(cduValidar);
                        cduValidar.fntEjecutarMaestro("Cód. validación", strFiltro);
                    end;
                }
            }
        }
    }

    var
        cduValidar: Codeunit Validaciones;
        k: Integer;
        strFiltro: array[250, 3] of Text[30];
}

