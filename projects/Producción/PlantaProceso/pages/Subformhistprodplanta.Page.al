page 50023 "Subform hist. prod. planta"
{
    PageType = ListPart;
    SourceTable = "Item Ledger Entry";

    layout
    {
        area(content)
        {
            repeater(Control1000000009)
            {
                ShowCaption = false;
                field("Item No."; "Item No.")
                {
                }
                field("Entry Type"; "Entry Type")
                {
                }
                field("Location Code"; "Location Code")
                {
                }
                field(Description; Description)
                {
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                }
                field(Quantity; Quantity)
                {
                }
                field("Net kilos"; "Net kilos")
                {
                }
                field("Gross kilos"; "Gross kilos")
                {
                }
                field("Pallet no."; "Pallet no.")
                {
                }
                field("Lote origen"; "Lote origen")
                {
                }
                field("Job No."; "Job No.")
                {
                }
                field(Family; Family)
                {
                }
                field(Subfamily; Subfamily)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Imprimir etiquetas seleccionadas")
            {
                Image = Print;

                trigger OnAction()
                var
                    cduFish: Codeunit Descargas;
                    rst27: Record Item;
                    rstIS: Record "Inventory Setup";
                    rstSP: Record "Subfamilia producto";
                    rstIJL: Record "Item Ledger Entry";
                    rstPP: Record "Produccion Planta";
                begin
                    Clear(rst27);
                    Clear(cduFish);
                    Clear(rstIS);
                    Clear(rstSP);
                    Clear(rstIJL);

                    CurrPage.SetSelectionFilter(rstIJL);

                    Clear(rstPP);
                    rstPP.SetRange("No. documento", "Document No.");
                    if rstPP.FindFirst then;

                    if rstIJL.FindSet then
                        repeat

                            TestField("Pallet no.");
                            TestField(Positive);

                            rst27.Get(rstIJL."Item No.");
                            rstIS.Get;
                            rstSP.Get(rst27.Familia, rst27.Subfamilia);

                            if (rst27."Lleva No. Pallet") and (rst27."Item Category Code" = rstIS."Categoria productos pesca") then begin

                                cduFish.fntPrintLabel("Pallet no.", "Global dimension 3 Code", "Global Dimension 1 Code", rstPP."Fecha produccion", rst27."No.", "Remaining Quantity", rstSP."Descripción mínima", false);

                            end;

                        until rstIJL.Next = 0;
                end;
            }
        }
    }
}

