page 50706 "Lista validaciones formulacion"
{
    DelayedInsert = true;
    PageType = ListPart;
    SourceTable = Validaciones;

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
                field("No. línea"; "No. línea")
                {
                    Editable = false;
                }
                field("Tipo evaluación"; "Tipo evaluación")
                {
                }
                field("Tipo de valor"; "Tipo de valor")
                {
                }
                field(Tipo; Tipo)
                {
                }
                field(Tabla; Tabla)
                {
                }
                field("Nombre tabla"; "Nombre tabla")
                {
                }
                field(Campo; Campo)
                {
                }
                field("Nombre campo"; "Nombre campo")
                {
                }
                field(Valor; Valor)
                {
                }
                field("Nombre referencia"; "Nombre referencia")
                {
                }
                field("strFiltro[k,3]"; strFiltro[k, 3])
                {
                    Caption = 'Resultado';
                }
            }
        }
    }

    actions
    {
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

