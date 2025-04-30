page 50629 "Lista validaciones"
{
    DelayedInsert = true;
    PageType = List;
    SourceTable = Validaciones;
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Cód. fórmula"; "Cód. fórmula")
                {
                }
                field("Cód. validación"; "Cód. validación")
                {
                }
                field("No. línea"; "No. línea")
                {
                }
                field(Tabla; Tabla)
                {
                }
                field("Tipo de valor"; "Tipo de valor")
                {
                }
                field(Valor; Valor)
                {
                }
                field(Campo; Campo)
                {
                }
                field("strFiltro[k,3]"; strFiltro[k, 3])
                {
                    Caption = 'Resultado';
                }
                field(Tipo; Tipo)
                {
                }
                field("Tipo evaluación"; "Tipo evaluación")
                {
                }
                field("Nombre tabla"; "Nombre tabla")
                {
                }
                field("Nombre campo"; "Nombre campo")
                {
                }
                field("Nombre referencia"; "Nombre referencia")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Ejecuta&r")
            {
                Caption = 'Ejecuta&r';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    k := 0;
                    Clear(cduValidar);
                    cduValidar.fntEjecutarMaestroSinSolicitar("Cód. fórmula", strFiltro);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        k += 1;
    end;

    trigger OnInit()
    begin
        CurrPage.LookupMode := false;
        k := 1;
    end;

    trigger OnOpenPage()
    begin
        k := 1;
        OnActivateForm;
    end;

    var
        k: Integer;
        strFiltro: array[250, 3] of Text[30];
        cduValidar: Codeunit Validaciones;

    local procedure OnActivateForm()
    begin
        k := 1;
    end;
}

