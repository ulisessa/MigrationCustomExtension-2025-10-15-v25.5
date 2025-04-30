page 50052 "Inflation Adjustment Register"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Inflation Adjustment Register";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                }
                field("From date"; "From date")
                {
                }
                field("To date"; "To date")
                {
                }
                field("Creation Date"; "Creation Date")
                {
                }
                field("Source Code"; "Source Code")
                {
                }
                field("User ID"; "User ID")
                {
                }
                field("Journal Batch Name"; "Journal Batch Name")
                {
                }
                field(Reversed; Reversed)
                {
                }
                field("Posting Date"; "Posting Date")
                {
                }
                field("No. documento"; "No. documento")
                {
                }
                field("Nombre libro diario"; "Nombre libro diario")
                {
                }
                field("Usuario Anulación"; "Usuario Anulación")
                {
                }
                field(Anulado; Anulado)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Procesos)
            {
                Caption = 'Procesos';
                action(DeleteRegister)
                {
                    Caption = 'Eliminar ajuste';
                    Image = Delete;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        l_rstIAE: Record "Inflation Adjustment Entry";
                        l_rstAP: Record "Accounting Period";
                    begin
                        if Confirm('Desea eliminar todos los registros de ajuste de inflación generados entre el ' + Format("From date") + ' y el ' + Format("To date")) then begin
                            Clear(l_rstIAE);
                            l_rstIAE.SetRange("Posting Date", "From date", "To date");
                            l_rstIAE.DeleteAll;
                            Clear(l_rstAP);
                            l_rstAP.SetRange("Starting Date", "From date", "To date");
                            l_rstAP.ModifyAll("Inflation adjustment", false);
                            Delete;

                        end;
                    end;
                }
            }
            group(Acciones)
            {
                Caption = 'Acciones';
                action(NavigateRecords)
                {
                    Caption = 'Navegar registros';
                    Image = Navigate;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;
                    PromotedOnly = true;

                    trigger OnAction()
                    var
                        l_rstIAE: Record "Inflation Adjustment Entry";
                        l_pgeIAE: Page "Inflation Adjustment Entries";
                    begin
                        Clear(l_rstIAE);
                        l_rstIAE.SetRange("Posting Date", "From date", "To date");
                        Clear(l_pgeIAE);
                        l_pgeIAE.SetTableView(l_rstIAE);
                        l_pgeIAE.Run;
                    end;
                }
            }
        }
    }
}

