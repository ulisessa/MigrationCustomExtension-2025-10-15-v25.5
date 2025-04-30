page 50703 "Ficha formulación"
{
    PageType = Card;
    SourceTable = Formulas;
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Cód. fórmula"; "Cód. fórmula")
                {
                }
                field("Expresión"; Expresión)
                {
                    MultiLine = true;

                    trigger OnDrillDown()
                    begin
                        Clear(rstFormula);
                        rstFormula.Get("Cód. fórmula");

                        /*
                        CLEAR(cduPad);
                        cduPad.EditFormulaText(rstFormula);
                        */

                    end;
                }
                field("STRLEN(Expresión)"; StrLen(Expresión))
                {
                    MultiLine = true;
                }
                field(strResultado; strResultado)
                {
                    MultiLine = true;
                }
            }
            part(Control1000000006; "Lista validaciones formulacion")
            {
                SubPageLink = "Cód. fórmula" = FIELD ("Cód. fórmula");
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
                    Clear(rstBufferResultados);
                    rstBufferResultados.DeleteAll;
                    Commit;

                    cduValidar.fntVerificarFormula("Cód. fórmula");
                    strResultado := cduValidaciones.funFindParameters(Rec);
                end;
            }
        }
    }

    var
        strResultado: Text[250];
        cduParser: Codeunit Parser;
        rstFormula: Record Formulas;
        cduValidar: Codeunit "Completar variables";
        rstBufferResultados: Record "Buffer resultados formulación";
        cduValidaciones: Codeunit Validaciones;
}

