page 50041 "Seguridad por usuario"
{
    Editable = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = List;
    RefreshOnActivate = true;
    SourceTable = "Seguridad por usuario";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Usuario; Usuario)
                {
                }
                field(Grupo; Grupo)
                {
                }
                field("Mostrar documentación"; "Mostrar documentación")
                {
                    Editable = true;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Nuevo)
            {
                InFooterBar = true;
                Promoted = true;
                PromotedIsBig = true;
                RunPageMode = Create;

                trigger OnAction()
                begin
                    Usuario := UserId;
                    Insert;
                end;
            }
        }
    }
}

