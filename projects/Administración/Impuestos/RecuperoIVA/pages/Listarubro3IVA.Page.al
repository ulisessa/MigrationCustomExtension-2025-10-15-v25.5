page 50547 "Lista rubro 3 IVA"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Recupero IVA Rubro 3";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. mov."; "No. mov.")
                {
                }
                field("Regimen informado"; "Regimen informado")
                {
                }
                field("Tipo de documento"; "Tipo de documento")
                {
                }
                field("Numero de documento"; "Numero de documento")
                {
                }
                field("No. documento interno"; "No. documento interno")
                {
                }
                field(Item; Item)
                {
                }
                field(Proyecto; Proyecto)
                {
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                }
                field("Shortcut Dimension 3 Code"; "Shortcut Dimension 3 Code")
                {
                }
                field("Shortcut Dimension 4 Code"; "Shortcut Dimension 4 Code")
                {
                }
                field("Shortcut Dimension 5 Code"; "Shortcut Dimension 5 Code")
                {
                }
                field("Shortcut Dimension 6 Code"; "Shortcut Dimension 6 Code")
                {
                }
                field("Shortcut Dimension 7 Code"; "Shortcut Dimension 7 Code")
                {
                }
                field("Posicion Arancelaria"; "Posicion Arancelaria")
                {
                }
                field("Unidad de medida"; "Unidad de medida")
                {
                }
                field(Cantidad; Cantidad)
                {
                }
                field("Monto FOB en divisa origen"; "Monto FOB en divisa origen")
                {
                }
                field("Insumos importados"; "Insumos importados")
                {
                }
                field("Tipo de cambio"; "Tipo de cambio")
                {
                }
                field("Aduana de Registro"; "Aduana de Registro")
                {
                }
                field("Aduana de Salida"; "Aduana de Salida")
                {
                }
                field("Fecha Cumplido"; "Fecha Cumplido")
                {
                }
                field("Expo o MI"; "Expo o MI")
                {
                }
                field("Monto FOB en $"; "Monto FOB en $")
                {
                }
                field("MI gravadas"; "MI gravadas")
                {
                }
                field("MI no gravadas&flet&segur"; "MI no gravadas&flet&segur")
                {
                }
                field("No. registro recupero IVA"; "No. registro recupero IVA")
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("&Navegar")
            {
                Caption = '&Navigate';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Navigate.SetDoc(0D, "No. documento interno");
                    Navigate.Run;
                end;
            }
        }
    }

    var
        Navigate: Page Navigate;
}

